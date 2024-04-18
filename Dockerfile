FROM ubuntu:18.04

RUN apt update && apt install -y \
    build-essential \
    zlib1g-dev \ 
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \ 
    libssl-dev \
    libreadline-dev \
    libffi-dev \
    curl \
    software-properties-common \
    wget \
    git

WORKDIR /root/

ADD setup.sh .
ADD katconf katconf
ADD katcore katcore
ADD mkat-tango mkat-tango
ADD katmisc katmisc
ADD katlogger katlogger
ADD katversion katversion

RUN ./setup.sh
