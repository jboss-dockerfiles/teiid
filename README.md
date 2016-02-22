# Teiid Docker image

This is an example Dockerfile with [Teiid Runtime engine on Wildfly](http://teiid.jboss.org/).

## Usage

    docker run -it jboss/teiid

## To boot in domain mode:

    docker run -it jboss/teiid /opt/jboss/wildfly/bin/domain.sh -b 0.0.0.0 -bmanagement 0.0.0.0

## Extending the image

    FROM jboss/teiid
    # Do your stuff here

## Application deployment

With the Teiid server you can deploy your application in multiple ways:

- You can use CLI
- You can use the web console
- You can use the management API directly
- You can use the deployment scanner

## Example
https://developer.jboss.org/wiki/QuickstartExampleWithDockerizedTeiid
