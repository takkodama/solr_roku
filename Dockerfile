FROM solr:latest

USER root

RUN apt-get update -y
RUN apt-get install -y procps

RUN rm -rf /usr/solr/solr_roku || true && \
    mkdir -p /usr/solr/solr_roku

ADD ./xml/rokureply.xml /usr/solr/solr_roku/xml/rokureply.xml
ADD ./json/rokureply.json /usr/solr/solr_roku/json/rokureply.json

USER solr
