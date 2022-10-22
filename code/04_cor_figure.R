here::i_am("code/04_cor_figure.R")

# load in library
library(ggplot2)

# load in dataset
heart <- readRDS(file = here::here("output/data.rds"))

# build the correlation matrix
correla <- cor(heart[, c("age", "cholesterol", "bp", "hr")])

# rename the column and row
colnames(correla) <- c("Age", "Cholesterol", "Blood Pressure", "Heart Rate")
rownames(correla) <- c("Age", "Cholesterol", "Blood Pressure", "Heart Rate")

melted_corr_mat <- reshape2::melt(correla)

# create correlation plot
corplot <- ggplot(data = melted_corr_mat, aes(x=Var1, y=Var2, fill=value)) +
  geom_tile() + 
  ggtitle("Figure.3 Heatmap for Correlation Matrix") + 
  xlab("") + 
  ylab("") +
  theme(plot.title = element_text(hjust=0.5, size = 15))

ggsave(here::here("output/corplot.png"), plot = corplot, device = "png")