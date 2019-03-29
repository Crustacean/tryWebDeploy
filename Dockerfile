FROM tomcat:8.5.38-jre8-alpine

MAINTAINER elkana <elkyem@gmail.com>

COPY ./target/*.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]