FROM docker.io/java:openjdk-8-jdk
MAINTAINER Andrew Rothstein andrew.rothstein@gmail.com

RUN apt-get update \
 && apt-get install --no-install-recommends -y \
 ntp \
 python python-httplib2 python-setuptools python-dev \
 ant ant-optional \
 build-essential cmake ccache valgrind \
 git-arch git-completion git-core git-svn git-doc git-email \
 curl 

ENV VOLTDB_VERSION 7.0

RUN curl -L https://github.com/VoltDb/voltdb/archive/voltdb-${VOLTDB_VERSION}.tar.gz | tar zx
WORKDIR voltdb-voltdb-${VOLTDB_VERSION}
RUN ant -Djmemcheck=NO_MEMCHECK && ant cleantmp cleanugh
ENV PATH ${PATH}:/voltdb-voltdb-${VOLTDB_VERSION}/bin

# Ports
# 21212 : Client Port
# 21211 : Admin Port
#  8080 : Web Interface Port
#  3021 : Internal Server Port
#  4560 : Log Port
#  9090 : JMX Port
#  5555 : Replication Port
#  7181 : Zookeeper Port
EXPOSE 21212 21211 8080 3021 4560 9090 5555 7181

