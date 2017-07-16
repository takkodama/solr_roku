#!/bash

# build & run the docker container
docker build -t solr:rokuchanbot .
docker run -d -p 8983:8983 --name solr_roku solr:rokuchanbot
docker exec -it --user=solr solr_roku solr start

# initiate core (only needed to run first times)
declare -a arr=("rokutrigger" "rokureply")

for i in "${arr[@]}"
do
   # delete core
   docker exec -it --user=solr solr_roku solr delete -c $i
done

# restart
# docker exec -it --user=solr solr_roku solr restart

for i in "${arr[@]}"
do
   # create cores
   docker exec -it --user=solr solr_roku solr create -c $i
   # post datas to the core
   docker exec -it --user=solr solr_roku post -c "$i" /usr/solr/solr_roku/xml/"$i".xml
   docker exec -it --user=solr solr_roku post -c "$i" /usr/solr/solr_roku/json/"$i".json
done
