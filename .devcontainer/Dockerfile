FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt full-upgrade -y && apt install -y \
    make \
    wget \
    curl \
    git \
    build-essential \
    pkg-config \
    libssl-dev \
    golang-go \
    clang

# Install ops
RUN curl https://ops.city/get.sh -sSfL | sh

# Install rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# create directory for the risc compilers
RUN mkdir /opt/risvc

EXPOSE 8080/tcp
