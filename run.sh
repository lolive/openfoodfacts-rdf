#!/bin/sh
which java > /dev/null || echo "Install Java first"
which java > /dev/null || exit
if [ ! -f sparql-generate-jena.jar ]; then
	#Download a patched version of SparqlGenerate. Sources are available on GitHub at: https://github.com/lolive/sparql-generate/tree/master
        curl --silent http://datao.net/sparql-generate-jena.jar > /app/sparql-generate-jena.jar
fi
DIR="$( cd "$( dirname "$0" )" && pwd )"
RDFDIR=$DIR/rdf
cd $DIR
rm -Rf rdf
mkdir rdf
echo "Running... please wait! (3GB, and a lot of patience, are required :)"
echo
for i in *sg; do java -jar /app/sparql-generate-jena.jar -q $i > rdf/${i}.rdf& done
wait
echo "RDF files are now available at directory " $RDFDIR
cd - > /dev/null
