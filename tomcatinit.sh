#!/bin/bash

/usr/bin/envsubst '$MYDB' < /server.xml > /usr/local/tomcat/conf/server.xml
/usr/bin/envsubst '$MYDB' < /account.jsp > /usr/local/tomcat/webapps/ROOT/account.jsp
/usr/bin/envsubst '$MYDB' < /accounttest.jsp > /usr/local/tomcat/webapps/ROOT/accounttest.jsp
/usr/bin/envsubst '$MYDB' < /surveytest.jsp > /usr/local/tomcat/webapps/ROOT/surveytest.jsp
exec catalina.sh run
