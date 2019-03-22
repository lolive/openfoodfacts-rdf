FROM java

RUN mkdir -p /app && \
  curl http://datao.net/sparql-generate-jena.jar > /app/sparql-generate-jena.jar

WORKDIR /data

COPY . .

ENTRYPOINT ["./run.sh"]
