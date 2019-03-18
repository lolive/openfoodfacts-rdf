#!/bin/sh
which java > /dev/null || echo "Install Java first"
which java > /dev/null || exit

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
