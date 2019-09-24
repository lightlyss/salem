FROM ubuntu:bionic as build
ENV DEBIAN_FRONTEND noninteractive

USER root
WORKDIR /salem
COPY . ./

RUN apt-get update -q
RUN apt-get install --no-install-recommends -qy make xzdec wget
RUN apt-get install --no-install-recommends -qy texlive lmodern texlive-pictures

RUN make clean
RUN make

CMD ["sh", "-c", "ls -a *.pdf"]
