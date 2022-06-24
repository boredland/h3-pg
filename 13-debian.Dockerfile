FROM postgis/postgis:13-3.2
ARG H3_PG_VERSION=3.7.2

ADD 11_pg-h3.sh /docker-entrypoint-initdb.d/

ARG deps="build-essential cmake git postgresql-server-dev-14"

RUN apt-get update && apt-get install -y ${deps} pgxnclient

RUN pgxn install h3

RUN apt-get remove -y ${deps} && rm -rf /var/lib/apt/lists/*
