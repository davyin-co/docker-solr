FROM solr:7
ENV LOG4J2_VERSION=2.17.1
ADD drupal-solr-config/7.x /opt/solr/server/solr/configsets/drupal/conf
RUN wget https://repo1.maven.org/maven2/com/github/magese/ik-analyzer/7.7.1/ik-analyzer-7.7.1.jar -O /opt/solr/server/solr-webapp/webapp/WEB-INF/lib/ik-analyzer-7.7.1.jar && \
    rm -rf /opt/solr/contrib/prometheus-exporter /opt/solr/licenses && \
    rm /opt/solr/server/lib/ext/log4j-core-2.11.0.jar /opt/solr/server/lib/ext/log4j-api-2.11.0.jar /opt/solr/server/lib/ext/log4j-slf4j-impl-2.11.0.jar /opt/solr/server/lib/ext/log4j-1.2-api-2.11.0.jar && \
    wget https://downloads.apache.org/logging/log4j/${LOG4J2_VERSION}/apache-log4j-${LOG4J2_VERSION}-bin.tar.gz -O /tmp/log4j.tgz && \
    cd /tmp/ && \
    tar xzvf log4j.tgz && \
    cp /tmp/apache-log4j-${LOG4J2_VERSION}-bin/log4j-core-${LOG4J2_VERSION}.jar /tmp/apache-log4j-${LOG4J2_VERSION}-bin/log4j-api-${LOG4J2_VERSION}.jar /tmp/apache-log4j-${LOG4J2_VERSION}-bin/log4j-1.2-api-${LOG4J2_VERSION}.jar /tmp/apache-log4j-${LOG4J2_VERSION}-bin/log4j-slf4j-impl-${LOG4J2_VERSION}.jar /opt/solr/server/lib/ext/ && \
    rm -rf  /tmp/apache-log4j-${LOG4J2_VERSION}-bin && rm /tmp/log4j.tgz && \
    cp -r /opt/solr/server/solr /opt/solr/server/solr-orig
