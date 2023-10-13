FROM tomcat:latest

ENV MYDB 10.38.0.186
RUN apt-get -y update && apt-get -y install gettext-base
RUN mkdir -p /usr/local/tomcat/webapps/ROOT
COPY mariadb-java-client-2.7.9.jar /usr/local/tomcat/lib/
RUN rm -rf /usr/local/tomcat/conf/server.xml && rm -rf /usr/local/tomcat/conf/web.xml
COPY server.xml /
COPY account.jsp /
COPY accounttest.jsp /
COPY surveytest.jsp /
COPY web.xml /usr/local/tomcat/conf/
COPY tomcatinit.sh /tomcatinit.sh
RUN chmod +x /tomcatinit.sh
#RUN envsubst '$MYDB' < /server.xml > /result.xml

WORKDIR /

CMD ["./tomcatinit.sh"]
#CMD ["/bin/sh" , "-c" , "envsubst '$MYDB' < /server.xml > /usr/local/tomcat/conf/server.xml && exec catalina.sh run"]
#CMD ["catalina.sh", "run"]
