#/bin/bash

# initiate core (only needed to run first times)
# sudo su - solr -c "$SOLR_HOME/bin/solr delete -c rokureply"
# sudo su - solr -c "$SOLR_HOME/bin/solr restart"
# sudo su - solr -c "$SOLR_HOME/bin/solr create -c rokureply"

# post datas to the core
sudo su - solr -c "$SOLR_HOME/bin/post -c rokureply /home/tk/solr_roku/xml/reply.xml"
sudo su - solr -c "$SOLR_HOME/bin/post -c rokureply /home/tk/solr_roku/json/reply.json"

# get with http request
curl "http://localhost:8983/solr/rokureply/select?indent=on&q=id:1&wt=json"

# delete columns
# $SOLR_HOME/bin/post -c rokureply -d "<delete><id>*</id></delete>"
