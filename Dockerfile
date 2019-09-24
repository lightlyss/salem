FROM ubuntu:bionic as build
ENV DEBIAN_FRONTEND noninteractive

USER root
WORKDIR /salem
COPY . ./

RUN apt-get update -q && apt-get install --no-install-recommends -qy texlive make xzdec wget
RUN tlmgr init-usertree
RUN tlmgr update --all
RUN tlmgr install multicol lmodern fontenc inputenc pgffor babel

RUN make clean
RUN make

CMD ["sh", "-c", "ls -a *.pdf"]
