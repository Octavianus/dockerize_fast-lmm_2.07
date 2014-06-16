### Dockermized FaST-LMM 2.07
## use the dockerfile/ubuntu base image provided by https://index.docker.io/u/dockerfile/ubuntu/
# The environment is ubuntu-14.04
FROM dockerfile/python

MAINTAINER David Weng weng@email.arizona.edu
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

## Step 1: Install the basic tools to set up the environment.
# Install the wget, gcc, make tools, handling the lib dependency problem.
RUN apt-get install -y wget

# Make sure the working directory is Vagrant.
WORKDIR /home/vagrant

## Step 2: Download the binary file.
RUN wget http://ftp.research.microsoft.com/downloads/30260656-0f99-4ae0-b7ce-08157b50d4d9/FaSTLMM.207.Linux.zip 
RUN unzip FaSTLMM.207.Linux.zip 

## Step 3: Change the mode of the binary file to be executable. Default: 777
WORKDIR FaSTLMM.207.Linux/Linux_MKL
RUN chmod 777 fastlmmc

## Step 4: Add the executables directory to the Path.
ENV PATH /home/vagrant/FaSTLMM.207.Linux/Linux_MKL:$PATH

