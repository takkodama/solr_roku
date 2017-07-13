#/bin/bash

# initiate core (only needed to run first times)
declare -a arr=("rokutrigger" "rokureply")

for i in "${arr[@]}"
do
   # delete core
   su solr -c "/opt/solr/bin/solr delete -c $i"
done

su solr -c "/opt/solr/bin/solr restart"

for i in "${arr[@]}"
do
   # create core
   su solr -c "/opt/solr/bin/solr create -c $i"
   # post datas to the core
   su solr -c "/opt/solr/bin/post -c $i /solr_roku/json/$i.json"
   su solr -c "/opt/solr/bin/post -c $i /solr_roku/xml/$i.xml"
done
