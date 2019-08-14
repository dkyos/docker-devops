# docker build -t dkyos-centos7 .

#FROM centos/centos7
FROM docker.io/centos:7
MAINTAINER DongKyun Yun <dkyun77@gmail.com>
 
USER root
 
RUN yum clean all \
    && yum repolist \
    && yum -y update \
    && sed -i "s/en_US/all/" /etc/yum.conf  \
    && yum -y reinstall glibc-common
  
RUN  yum -y install tar unzip vi vim telnet net-tools curl openssl \
    && yum -y install apr apr-util apr-devel apr-util-devel \
    && yum -y install elinks locate python-setuptools \
    && yum clean all
  
ENV LANG=ko_KR.utf8 TZ=Asia/Seoul
COPY vimrc /root/.vimrc
 
CMD ["/bin/bash"]
