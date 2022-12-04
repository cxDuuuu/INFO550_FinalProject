FROM rocker/r-ubuntu

# install pandoc
RUN apt-get update
RUN apt-get install -y pandoc libcurl4-openssl-dev cmake

# set packages
RUN Rscript -e "install.packages('config')"
RUN Rscript -e "install.packages('knitr')"
RUN Rscript -e "install.packages('here')"
RUN Rscript -e "install.packages('labelled')"
RUN Rscript -e "install.packages('gtsummary')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('rmarkdown')"
RUN Rscript -e "install.packages('dplyr')"
RUN Rscript -e "install.packages('car')"
RUN Rscript -e "install.packages('plyr')"
RUN Rscript -e "install.packages('reshape2')"


# create project folder and set set work dir
RUN mkdir /project
WORKDIR /project

# create other folders
RUN mkdir output
RUN mkdir data
RUN mkdir code

# copy the existing stuff to image
COPY data data
COPY code code
COPY FinalProject.Rmd .
COPY Makefile . 

# for renv (cannot work)
# COPY .Rprofile .
# COPY renv.lock .
# RUN mkdir renv
# COPY renv/activate.R renv
# COPY renv/settings.dcf renv
# RUN Rscript -e "renv::restore(prompt=FALSE)"

# create mounting folder
RUN mkdir final_report

# add entry point 
CMD make && mv FinalProject.html final_report
