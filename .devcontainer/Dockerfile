# Setting an R environment from scratch 
# Step 1 - Import base image
FROM rocker/geospatial:4.3.3

# Step 2 - Set arguments and environment variables
# Define arguments
ARG DEBIAN_FRONTEND=noninteractive
ARG CRAN_MIRROR=https://cran.rstudio.com/

# Define environment variables
ENV CONFIGURE_OPTIONS="--with-cairo --with-jpeglib --enable-R-shlib --with-blas --with-lapack"
ENV TZ=UTC
ENV CRAN_MIRROR=$CRAN_MIRROR

# Step 3 - Install R dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
     locales \
     openjdk-8-jdk \
     screen \
     texinfo \
     texlive \
     texlive-fonts-extra \
     xvfb \
     tzdata \
     jq \ 
     make \
     tmux \
     libxml2-dev \
     screen \
     lsof 
 
# Setep 4 - Project set up
#RUN locale-gen en_US.UTF-8
WORKDIR /root
RUN mkdir settings

# Copy helping scripts for dev container
COPY packages.json install_packages.R ./settings/
RUN Rscript ./settings/install_packages.R
COPY .Rprofile /root/
