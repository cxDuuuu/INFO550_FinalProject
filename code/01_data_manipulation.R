
here::i_am("code/01_data_manipulation.R")

# load in library
library(labelled)

# Load in dataset
heart <- read.csv(here::here("data/Heart_disease.csv"))

# factor and label
heart$target <- factor(heart$target, levels = c("Diseased", "Normal"))
heart$sex <- factor(heart$sex, levels = c("Female", "Male"))
heart$bs <- factor(heart$bs, levels = c(0, 1), labels = c("No", "Yes"))
heart$cp <- factor(heart$cp, levels = c(1, 2, 3, 4), 
                   labels = c("typical angina", "atypical angina", "non-anginal pain", "asymptomatic"))
heart$angina <- factor(heart$angina, levels = c(0, 1), labels = c("No", "Yes"))
heart$ecg <- factor(heart$ecg, levels = c(0, 1, 2), 
                    labels = c("normal", "ST-T wave abnormality", "left ventricular hypertrophy"))
var_label(heart) <- list(target = "Heart Disease Condition", 
                         age = "Age (year)", 
                         sex = "Gender", 
                         cholesterol = "Serum Cholesterol Level (mg/dl)", 
                         bs = "Fasting Blood Sugar Level > 120 mg/dl", 
                         bp = "Resting Blood Pressure (mmHg)", 
                         hr = "Max Heart Rate", 
                         cp = "Chest Pain Type", 
                         angina = "Exercise Angina", 
                         ecg = "Resting Electrocardiogram")

saveRDS(heart, file = here::here("output", "data.rds"))