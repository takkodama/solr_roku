#/bin/bash

# initiate core (only needed to run first times)
declare -a arr=("rokutrigger" "rokureply" "rokuuser")

for i in "${arr[@]}"
do
   # delete core
   sudo su - solr -c "$SOLR_HOME/bin/solr delete -c $i"
done

sudo su - solr -c "$SOLR_HOME/bin/solr restart"

for i in "${arr[@]}"
do
   # create core
   sudo su - solr -c "$SOLR_HOME/bin/solr create -c $i"
   # post datas to the core
   sudo su - solr -c "$SOLR_HOME/bin/post -c $i /home/tk/solr_roku/json/$i.json"
   sudo su - solr -c "$SOLR_HOME/bin/post -c $i /home/tk/solr_roku/xml/$i.xml"
done
