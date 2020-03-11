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


# Install dev libraries for Python library, ...
RUN apk add --no-cache \
    python3-dev \
    gcc \
    # pylibmc
    libmemcached-dev \
    #Crypto
    libffi-dev \
    libressl-dev \
    musl-dev \
    openssl-dev \
    #Pillow
    jpeg-dev \
    zlib-dev \
    && rm -rf /var/cache/* /tmp/* \
    && mkdir /var/cache/apk 

# Install Umbra with python pip
# https://github.com/internetarchive/umbra

 RUN cd /opt \
     && git clone https://github.com/internetarchive/umbra.git \
     && cd umbra \
     # Using pip:
     && python3 -m pip install .

#RUN apk add --no-cache --virtual .build-deps build-base linux-headers \
   # && python3 -m pip install --upgrade pip \
#    && python3 -m pip install --upgrade umbra \
#    && apk del .build-deps

# Install ampq091 files for testing
COPY testmq/ /opt/testmq
RUN \
    python3 -m pip install --upgrade pika


#---
#WORKDIR /app
#ADD . /app
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

COPY bin/ /opt/bin/

CMD /opt/bin/start.sh
#CMD /bin/bash