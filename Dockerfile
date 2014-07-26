FROM andrewrothstein/docker-java
MAINTAINER Andrew Rothstein andrew.rothstein@gmail.com

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ant build-essential ant-optional default-jdk python valgrind ntp ccache git-arch git-completion git-core git-svn git-doc git-email python-httplib2 python-setuptools python-dev apt-show-versions

RUN git clone https://github.com/VoltDb/voltdb.git
WORKDIR voltdb
RUN ant
