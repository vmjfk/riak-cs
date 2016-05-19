FROM centos

# install riak
RUN curl -s https://packagecloud.io/install/repositories/basho/riak/script.rpm.sh | bash
RUN yum -y install riak 

RUN curl -s https://packagecloud.io/install/repositories/basho/riak-cs/script.rpm.sh |  bash
RUN yum -y install pygpgme
RUN yum -y install riak-cs

RUN curl -s https://packagecloud.io/install/repositories/basho/stanchion/script.rpm.sh |  bash
RUN yum -y install stanchion 

#RUN sed -i.bak 's/127.0.0.1:8087/0.0.0.0:8087/' /etc/riak/riak.conf
#RUN sed -i.bak 's/127.0.0.1:8098/0.0.0.0:8098/' /etc/riak/riak.conf
#RUN sed -i.bak 's/127.0.0.1:8087/0.0.0.0:8087/' /etc/riak-cs/riak-cs.conf
COPY sleep10.sh /
COPY advanced.config /etc/riak/
# install riak-cs

RUN chmod 777 /var/lib/riak/
VOLUME /var/lib/riak/
CMD ["sh","-c","/sleep10.sh"]

