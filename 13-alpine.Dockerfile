FROM postgis/postgis:13-3.2-alpine
ARG H3_PG_VERSION=3.7.2

ADD 11_pg-h3.sh /docker-entrypoint-initdb.d/

RUN apk add --virtual build-dependencies py-pip git build-base cmake clang llvm \
  && pip install pgxnclient

RUN pgxn install h3

RUN pip uninstall -y pgxnclient && apk del build-dependencies
