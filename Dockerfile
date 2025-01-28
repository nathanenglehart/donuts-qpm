FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libgsl-dev \
    libudunits2-dev \
    gdal-bin libgdal-dev \
    && apt-get clean

RUN apt-get install -y libavfilter-dev
RUN apt-get install -y r-base

RUN R -e "install.packages(c('ggplot2'), repos = 'https://cloud.r-project.org/')"
RUN R -e "install.packages(c('av'), repos = 'https://cloud.r-project.org/')"
RUN R -e "install.packages(c('gganimate'), repos = 'https://cloud.r-project.org/')"

WORKDIR /app

COPY animate_mu.r /app
