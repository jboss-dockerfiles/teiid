FROM jboss/wildfly:19.1.0.Final

ENV JBOSS_HOME /opt/jboss/wildfly

# Set the TEIID_VERSION env variable
ENV TEIID_VERSION 15.0.0

# Download and unzip Teiid server
RUN cd $JBOSS_HOME \
    && curl -O https://oss.sonatype.org/service/local/repositories/releases/content/org/teiid/wildfly/teiid-wildfly/$TEIID_VERSION/teiid-wildfly-$TEIID_VERSION-dist.zip \
    && bsdtar -xf teiid-wildfly-$TEIID_VERSION-dist.zip \
    && chmod +x $JBOSS_HOME/bin/*.sh \
    && rm teiid-wildfly-$TEIID_VERSION-dist.zip
    
VOLUME ["$JBOSS_HOME/standalone", "$JBOSS_HOME/domain"]

USER jboss

ENV LAUNCH_JBOSS_IN_BACKGROUND true

# Expose Teiid server  ports 
EXPOSE 8080 9990 31000 35432 

# Run Teiid server and bind to all interface
CMD ["/bin/sh", "-c", "$JBOSS_HOME/bin/standalone.sh -c standalone-teiid.xml -b 0.0.0.0 -bmanagement 0.0.0.0"]
