
here::i_am("code/02_prelim_figures.R")

# load in library
library(ggplot2)

# load in dataset
heart <- readRDS(file = here::here("output/data.rds"))

# Distribution of Heart Disease among Gender groups
barplot <- ggplot(data = heart, aes(x = target, group=sex)) + 
  geom_bar(aes(y = ..prop..*100, fill = factor(..x..)), stat="count", show.legend = FALSE) + 
  ggtitle("Figure.1 Distribution of Heart Disease among Gender groups") + 
  facet_grid(~sex) + 
  xlab("Heart Disease Condition") + 
  ylab("Percentage (%)") + 
  theme(axis.title.x = element_text(size = 12), 
        axis.title.y = element_text(size = 12), 
        plot.title = element_text(hjust=0.5, size = 15))

ggsave(here::here("output/barplot.png"), plot = barplot, device = "png")


# Distribution of age among Heart Disease groups
distplot <- ggplot(data = heart, aes(x = age, fill = target, group = target)) + 
  geom_density(adjust=1.5, alpha=.4) + 
  ggtitle("Figure.2 Distribution of Age") + 
  xlab("Age") + 
  ylab("Percentage (%)") + 
  scale_fill_discrete(name = "Heart Disease Condition") +
  theme(axis.title.x = element_text(size = 12), 
        axis.title.y = element_text(size = 12), 
        plot.title = element_text(hjust=0.5, size = 15))

ggsave(here::here("output/distplot.png"), plot = distplot, device = "png")

