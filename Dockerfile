FROM ubuntu:xenial as build
ENV DEBIAN_FRONTEND noninteractive

USER root
WORKDIR /salem
COPY . ./

RUN apt-get update -q && apt-get install --no-install-recommends -qy texlive make

RUN tlmgr install multicol lmodern fontenc inputenc pgffor babel

CMD ["sh", "-c", "make clean && make"]
