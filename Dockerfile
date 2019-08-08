FROM centos:7

LABEL maintainer="Jeremi FERRE <ferrejeremi@gmail.com>"

RUN yum update; yum clean all

# install nginx
RUN yum -y install epel-release; yum clean all
RUN yum -y install nginx; yum clean all
# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# install nodejs
RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
RUN yum -y install nodejs; yum clean all
RUN yum install gcc-c++ openssl-devel make; yum clean all
RUN npm install -g express-generator
RUN npm install -g webpack
RUN npm install -g gulp

CMD [ "node" ]
