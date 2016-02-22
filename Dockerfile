FROM jboss/wildfly:9.0.2.Final

ENV JBOSS_HOME /opt/jboss/wildfly

# Set the TEIID_VERSION env variable
ENV TEIID_VERSION 8.13.1

# Download and unzip Teiid server
RUN cd $HOME \
    && curl -O https://repository.jboss.org/nexus/service/local/repositories/releases/content/org/jboss/teiid/teiid/$TEIID_VERSION/teiid-$TEIID_VERSION-wildfly-dist.zip \
    && bsdtar -xf teiid-$TEIID_VERSION-wildfly-dist.zip \
    && chmod +x $JBOSS_HOME/bin/standalone.sh

# Expose Teiid server  ports 
EXPOSE 8080 9990 31000 35432 

# Run Teiid server and bind to all interface
CMD ["/opt/jboss/wildfly/bin/standalone.sh","-b","0.0.0.0","-c","standalone-teiid.xml"]
