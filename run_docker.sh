#/bin/bash

# initiate core (only needed to run first times)
declare -a arr=("rokutrigger" "rokureply")

for i in "${arr[@]}"
do
   # delete core
   solr delete -c $i
done

# disable restart so that the app doesn't fail (because of port shutdown?)
# su solr -c "/opt/solr/bin/solr restart"

for i in "${arr[@]}"
do
   # create core
   solr create -c $i
   # post datas to the core
   post -c $i /solr_roku/json/$i.json
   post -c $i /solr_roku/xml/$i.xml
done
