FROM andrewrothstein/docker-java
MAINTAINER Andrew Rothstein andrew.rothstein@gmail.com

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget git gcc ant

RUN git clone https://github.com/VoltDb/voltdb.git
RUN cd voldb ; git checkout -r release-v4.4
RUN cd voltdb; ant
