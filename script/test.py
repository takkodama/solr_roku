import urllib.request
import simplejson

f = urllib.request.urlopen("http://localhost:8983/solr/rokudb/select?indent=on&q=id:1&wt=json")
response = simplejson.load(f)
print(response['response']['numFound'], "documents found.")

# Print the name of each document.

for doc in response['response']['docs']:
   print("  mention =", doc['mention'][1])
