FROM postgis/postgis:14-3.2-alpine
ARG H3_PG_VERSION=3.7.2

ADD 11_pg-h3.sh /docker-entrypoint-initdb.d/

RUN apk add --virtual build-dependencies git build-base cmake clang llvm \
  && apk add py3-pip \
  && pip install pgxnclient

RUN pgxn install h3

RUN apk del build-dependencies
