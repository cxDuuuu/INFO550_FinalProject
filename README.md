# Generate the Final Report

`run make FinalProject.html in terminal` to generate the final html report \\
`run make install in terminal` to restore the package environment \\
The report include: 
- Preliminary analysis with figures 
- Univariate analysis
- Correlation analysis to identify colinearity
- Build logistic regression model



# Code Description

`code/01_data_manipulation.R`
- generates modified dataset for follow-up analysis
- saves the dataset as a `.rds` object in `output/` folder

`code/02_prelim_figures.R`
- generates two preliminary analysis figures including a barplot and a distribution plot
- saves the figures as `.png` object in `output/` folder

`code/03_univar.R`
- generates the univariable analysis table
- saves as a `.rds` object in `output/` folder

`code/04_cor_figure.R`
- generate the correlation plot for continuous variables
- saves the figure as `.png` object in `output/` folder

`code/05_logit_reg.R`
- build the logistic regression model and build the table for output
- saves as a `.rds` object in `output/` folder

`code/06_render_report.R`
- renders `FinalProject.Rmd`

`FinalProject.Rmd`
- reads in all the figures and tables generated and stored in `output/` folder