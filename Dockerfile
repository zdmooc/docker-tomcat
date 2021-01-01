FROM ubuntu:20.04

MAINTAINER zidane.djamal@gmail.com

#CATALINA_BASE:   /usr/local/tomcat
#CATALINA_HOME:   /usr/local/tomcat
#CATALINA_TMPDIR: /usr/local/tomcat/temp
#JRE_HOME:        /usr
#CLASSPATH:       /usr/local/tomcat/bin/bootstrap.jar:/usr/local/tomcat/bin/tomcat-juli.jar

#ENV CATALINA_HOME /usr/local/tomcat
#ENV PATH $CATALINA_HOME/bin:$PATH
#RUN mkdir -p "$CATALINA_HOME"
#WORKDIR $CATALINA_HOME

RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat

USER root

#RUN wget -O /tmp/apache-tomcat-9.0.41.tar.gz http://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.41/bin/apache-tomcat-9.0.41.tar.gz
#RUN sudo tar xzvf /tmp/apache-tomcat-9.0.41.tar.gz -C /opt/tomcat

# Install prerequisites
RUN apt-get update && apt-get install -y curl
RUN curl -O http://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.41/bin/apache-tomcat-9.0.41.tar.gz
RUN  tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.41/* /opt/tomcat/.



#RUN apt-get update && apt-get install -y openjdk-8-jre
RUN apt-get update &&  apt-get install -y openjdk-8-jdk
RUN java -version

WORKDIR /opt/tomcat/webapps
# Expand prweb to target directory
COPY prweb.war /prweb.war
#RUN mkdir prweb
#RUN ${CATALINA_HOME}
#RUN apt-get install zip unzip
#RUN unzip -q -o prweb.war -d /prweb

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
