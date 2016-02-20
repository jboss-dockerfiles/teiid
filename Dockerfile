# Use latest jboss/base-jdk:8 image as the base
FROM jboss/base-jdk:8

MAINTAINER Cojan van Ballegooijen <cvanball@redhat.com>

# Set the TEIID_SERVER_HOME env variable
ENV TEIID_SERVER_HOME /opt/jboss

# Set the TEIID_VERSION env variable
ENV TEIID_VERSION 8.13.1

# Download and unzip Teiid server
RUN cd $HOME && curl https://repository.jboss.org/nexus/service/local/repositories/releases/content/org/jboss/teiid/teiid/$TEIID_VERSION/teiid-$TEIID_VERSION-wildfly-server.zip | bsdtar -xf - && mv $TEIID_SERVER_HOME/teiid-$TEIID_VERSION $TEIID_SERVER_HOME/teiid && chmod +x $TEIID_SERVER_HOME/teiid/bin/standalone.sh

# Expose Teiid server  ports 
EXPOSE 8080 9990 31000 35432 

# Run Teiid server and bind to all interface
CMD ["/opt/jboss/teiid/bin/standalone.sh","-b","0.0.0.0","-c","standalone-teiid.xml"]
