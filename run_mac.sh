#/bin/bash

# initiate core (only needed to run first times)
# $SOLR_HOME/bin/solr delete -c rokureply
# $SOLR_HOME/bin/solr restart
# $SOLR_HOME/bin/solr create -c rokureply

# post datas to the core
$SOLR_HOME/bin/post -c rokureply xml/reply.xml
$SOLR_HOME/bin/post -c rokureply json/reply.json

# get with http request
# curl "http://localhost:8983/solr/rokureply/select?indent=on&q=id:1&wt=json"

# delete columns
# $SOLR_HOME/bin/post -c rokureply -d "<delete><id>*</id></delete>"
