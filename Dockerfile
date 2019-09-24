FROM ubuntu:xenial as build
ENV DEBIAN_FRONTEND noninteractive

USER root
WORKDIR /salem
COPY . ./

RUN apt-get update -q && apt-get install -qy \
    texlive-full \
    python-pygments gnuplot \
    make git \
    && rm -rf /var/lib/apt/lists/*

CMD ["sh", "-c", "make clean && make"]
