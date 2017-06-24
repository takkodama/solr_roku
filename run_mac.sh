#/bin/bash

# initiate core (only needed to run first times)
# $SOLR_HOME/bin/solr delete -c rokudb
# $SOLR_HOME/bin/solr restart
# $SOLR_HOME/bin/solr create -c rokudb

# post datas to the core
$SOLR_HOME/bin/post -c rokudb xml/rokudb.xml
$SOLR_HOME/bin/post -c rokudb json/mention.json

# get with http request
# curl "http://localhost:8983/solr/rokudb/select?indent=on&q=id:1&wt=json"

# delete columns
# $SOLR_HOME/bin/post -c rokudb -d "<delete><id>*</id></delete>"
