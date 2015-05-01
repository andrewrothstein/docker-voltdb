FROM dockerfile/java:oracle-java7
MAINTAINER Andrew Rothstein andrew.rothstein@gmail.com

RUN apt-get update && apt-get install --no-install-recommends -y python ant build-essential curl

ENV VOLTDB_VERSION 5.2.1

RUN curl -L https://github.com/VoltDb/voltdb/archive/voltdb-${VOLTDB_VERSION}.tar.gz | tar zx
WORKDIR voltdb-voltdb-${VOLTDB_VERSION}
RUN ant -Djmemcheck=NO_MEMCHECK && ant cleantmp cleanugh

# Client Port
EXPOSE 21212

# Admin Port
EXPOSE 21211

# Web Interface Port
EXPOSE 8080

# Internal Server Port
EXPOSE 3021

# Log Port
EXPOSE 4560

# JMX Port
EXPOSE 9090

# Replication Port
EXPOSE 5555

# Zookeeper Port
EXPOSE 2181

ENV PATH ${PATH}:/voltdb-voltdb-${VOLTDB_VERSION}/bin
