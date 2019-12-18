FROM postgres

LABEL maintainer="mehran.hamedaninezhad@gmail.com"

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD 123456
ENV POSTGRES_DB npd

COPY init.sql /docker-entrypoint-initdb.d/