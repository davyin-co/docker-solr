FROM solr:7
RUN rm -rf /opt/solr/contrib/prometheus-exporter /opt/solr/licenses && \
    rm /opt/solr/server/lib/ext/log4j-core-2.11.0.jar /opt/solr/server/lib/ext/log4j-api-2.11.0.jar /opt/solr/server/lib/ext/log4j-slf4j-impl-2.11.0.jar /opt/solr/server/lib/ext/log4j-1.2-api-2.11.0.jar && \
    wget https://dlcdn.apache.org/logging/log4j/2.15.0/apache-log4j-2.15.0-bin.tar.gz -O /tmp/log4j.tgz && \
    cd /tmp/ && \
    tar xzvf log4j.tgz && \
    cp /tmp/apache-log4j-2.15.0-bin/log4j-core-2.15.0.jar /tmp/apache-log4j-2.15.0-bin/log4j-api-2.15.0.jar /tmp/apache-log4j-2.15.0-bin/log4j-1.2-api-2.15.0.jar /tmp/apache-log4j-2.15.0-bin/log4j-slf4j-impl-2.15.0.jar /opt/solr/server/lib/ext/ && \
    rm -rf  /tmp/apache-log4j-2.15.0-bin
