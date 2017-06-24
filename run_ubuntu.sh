#/bin/bash

# initiate core (only needed to run first times)
# sudo su - solr -c "$SOLR_HOME/bin/solr delete -c rokudb"
# sudo su - solr -c "$SOLR_HOME/bin/solr restart"
sudo su - solr -c "$SOLR_HOME/bin/solr create -c rokudb"

# post datas to the core
sudo su - solr -c "$SOLR_HOME/bin/post -c rokudb /home/tk/solr_roku/xml/rokudb.xml"
sudo su - solr -c "$SOLR_HOME/bin/post -c rokudb /home/tk/solr_roku/json/mention.json"

# get with http request
curl "http://localhost:8983/solr/rokudb/select?indent=on&q=id:1&wt=json"

# delete columns
# $SOLR_HOME/bin/post -c rokudb -d "<delete><id>*</id></delete>"
