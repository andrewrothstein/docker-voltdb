FROM andrewrothstein/docker-ansible:ubuntu_trusty
MAINTAINER Andrew Rothstein andrew.rothstein@gmail.com

ADD playbook /playbook
WORKDIR /playbook
RUN ansible-galaxy install -r requirements.yml
RUN ansible-playbook playbook.yml
ENV PATH ${PATH}:/voltdb/voltdb-voltdb-${VOLTDB_VERSION}/bin

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

