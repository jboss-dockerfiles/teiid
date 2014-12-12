FROM jboss/wildfly:latest

MAINTAINER Ramesh Reddy <rareddy@redhat.com>
MAINTAINER Kenneth Peeples <kpeeps@redhat.com>

ENV JBOSS_TEIID_STABLE_DOWNLOAD http://downloads.sourceforge.net/project/teiid/teiid/8.9/Final/teiid-8.9.0.Final-jboss-dist.zip

#
# Install Teiid Runtime
RUN cd $JBOSS_HOME && curl $JBOSS_TEIID_STABLE_DOWNLOAD | bsdtar -xvf-
