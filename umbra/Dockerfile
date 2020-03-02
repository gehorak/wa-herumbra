# Python support can be specified down to the minor or micro version
# (e.g. 3.6 or 3.6.3).
# OS Support also exists for jessie & stretch (slim and full).
# See https://hub.docker.com/r/library/python/ for all supported Python
# tags from Docker Hub.

# If you prefer miniconda:
#FROM continuumio/miniconda3

FROM python:alpine

#LABEL Name=wa-heritrix-umbra-sandbox Version=0.0.1


# Base packages:
RUN apk add --no-cache \
    curl \
    wget \   
    git \
    unzip \
    tar \ 
    bash \
    gcc \
    python3-dev \
    && rm -rf /var/cache/* /tmp/* \
    && mkdir /var/cache/apk

# Install latest Chromium package.
# https://pkgs.alpinelinux.org/package/edge/community/x86_64/chromium

RUN \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && apk add --no-cache \   
    chromium \
    && rm -rf /var/cache/* /tmp/* \
    && mkdir /var/cache/apk

#WORKDIR /app
#ADD . /app

# Install Umbra with python pip
# https://github.com/internetarchive/umbra

#RUN  \
    # Using pip:
#    python3 -m pip install git+https://github.com/internetarchive/umbra.git
    
#CMD ["python3", "-m", "wa-heritrix-umbra-sandbox"]

# Using pipenv:
#RUN python3 -m pip install pipenv
#RUN pipenv install --ignore-pipfile
#CMD ["pipenv", "run", "python3", "-m", "wa-heritrix-umbra-sandbox"]

# Using miniconda (make sure to replace 'myenv' w/ your environment name):
#RUN conda env create -f environment.yml
#CMD /bin/bash -c "source activate myenv && python3 -m wa-heritrix-umbra-sandbox"
    


ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/

# Autorun chrome headless with no GPU
#ENTRYPOINT ["chromium-browser", "--headless", "--disable-gpu", "--disable-software-rasterizer", "--disable-dev-shm-usage"]

CMD start.sh
