
FinalProject.html: FinalProject.Rmd code/06_render_report.R output/barplot.png output/distplot.png output/univar.rds \
  output/corplot.png output/logit_reg.rds output/data.rds
	Rscript code/06_render_report.R
	
output/barplot.png output/distplot.png: output/data.rds code/02_prelim_figures.R
	Rscript code/02_prelim_figures.R
	
output/univar.rds: output/data.rds code/03_univar.R
	Rscript code/03_univar.R

output/corplot.png: output/data.rds code/04_cor_figure.R
	Rscript code/04_cor_figure.R

output/logit_reg.rds: output/data.rds code/05_logit_reg.R
	Rscript code/05_logit_reg.R

output/data.rds: code/01_data_manipulation.R
	Rscript code/01_data_manipulation.R
	
.PHONY: clean
clean:
	rm -f output/*.* && rm -f FinalProject.html
	
.PHONY: install
install: 
	Rscript -e "renv::restore(prompt = FALSE)"
	
# rule to build image
Projectfile=FinalProject.Rmd code/06_render_report.R output/barplot.png output/distplot.png output/univar.rds \
  output/corplot.png output/logit_reg.rds output/data.rds code/02_prelim_figures.R code/03_univar.R code/04_cor_figure.R \
  code/05_logit_reg.R code/01_data_manipulation.R
	
project_image: $(Projectfile)
	docker build -t project_image .
	touch $@

# run the container
final_report/report.html:project_image
	docker run -v "$$(pwd)/final_report": /project/final_report project_image