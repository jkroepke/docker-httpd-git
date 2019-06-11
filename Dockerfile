FROM centos/httpd-24-centos7

EXPOSE 8080

VOLUME /opt/git/

USER 0

RUN yum update -y && yum install -y git && yum clean all && mkdir -p /opt/git/ && chmod 777 /opt/git/

ADD git.conf /etc/httpd/conf.d/git.conf

USER default
