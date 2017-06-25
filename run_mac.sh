#/bin/bash

# initiate core (only needed to run first times)
declare -a arr=("rokutrigger" "rokureply" "rokuuser")

for i in "${arr[@]}"
do
   # delete core
   $SOLR_HOME/bin/solr delete -c "$i"
done

$SOLR_HOME/bin/solr restart

for i in "${arr[@]}"
do
   # create core
   $SOLR_HOME/bin/solr create -c "$i"
   # post datas to the core
   $SOLR_HOME/bin/post -c "$i" xml/"$i".xml
   $SOLR_HOME/bin/post -c "$i" json/"$i".json
done
