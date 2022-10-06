FROM alpine

RUN apk add bash
# Download the static build of Litestream directly into the path & make it executable.
# This is done in the builder and copied as the chmod doubles the size.
ADD https://github.com/benbjohnson/litestream/releases/download/v0.3.8/litestream-v0.3.8-linux-amd64-static.tar.gz /tmp/litestream.tar.gz
RUN tar -C /usr/local/bin -xzf /tmp/litestream.tar.gz

# ENV REPLICA_URL=s3://BUCKETNAME/db
COPY ./litestream.yml /etc/litestream.yml

# ENTRYPOINT ["/usr/local/bin/litestream"]

CMD ['litestream', 'replicate']