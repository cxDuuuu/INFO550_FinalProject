
here::i_am("code/03_univar.R")

library(dplyr)
library(gtsummary)

# load in dataset
heart <- readRDS(file = here::here("output/data.rds"))

# univariate analysis
univar <- heart |> tbl_summary(by = target) |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Heart Disease Condition**") |> 
  add_p() |>
  bold_p() |>
  modify_caption("**Comparison of Risk factors between Heart Disease Groups**")

saveRDS(univar, file = here::here("output", "univar.rds"))