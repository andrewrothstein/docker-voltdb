FROM andrewrothstein/docker-java
MAINTAINER Andrew Rothstein andrew.rothstein@gmail.com

# Hack for initctl
# See: https://github.com/dotcloud/docker/issues/1024
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ant 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ant-optional
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y default-jdk
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y valgrind
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ntp
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ccache
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git-arch
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git-completion
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git-core
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git-svn
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git-doc
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git-email
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-httplib2
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-setuptools
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-dev

RUN git clone https://github.com/VoltDb/voltdb.git
WORKDIR voltdb
RUN git checkout voltdb-4.6
RUN ant

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