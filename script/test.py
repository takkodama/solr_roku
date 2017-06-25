import urllib.request
import simplejson

args = "おはよう"
trigger = urllib.parse.quote_plus(args, encoding='utf-8')
query = "http://localhost:8983/solr/rokureply/select?indent=on&q=trigger:"+ trigger +"&wt=json"
f = urllib.request.urlopen(query)
response = simplejson.load(f)
print(response['response']['numFound'], "documents found.")

# Print the name of each document.

for doc in response['response']['docs']:
   print("  reply =", doc['reply'][0])
