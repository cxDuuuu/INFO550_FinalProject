here::i_am("code/05_logit_reg.R")

library(dplyr)
library(gtsummary)
library(labelled)

# load in dataset
heart <- readRDS(file = here::here("output/data.rds"))

# standardized the continuous variabels
heart$age1 <- scale(heart$age)
heart$cholesterol1 <- scale(heart$cholesterol)
heart$bp1 <- scale(heart$bp)
heart$hr1 <- scale(heart$hr)
var_label(heart) <- list(age1 = "Standardized Age (year)", 
                         cholesterol1 = "Standardized Serum Cholesterol Level (mg/dl)", 
                         bp1 = "Standardized Resting Blood Pressure (mmHg)", 
                         hr1 = "Standardized Max Heart Rate")

# Build logistic regression 
mod <- glm(as.numeric(target)-1 ~ age1 + sex + cholesterol1 + bs + bp1 + hr1 + cp + angina + ecg, data = heart)

# build the regression table
logit_reg <- tbl_regression(mod) |>
  add_global_p() |>
  bold_p() |>
  modify_caption("**Logistic Regression Result**")

saveRDS(logit_reg, file = here::here("output", "logit_reg.rds"))