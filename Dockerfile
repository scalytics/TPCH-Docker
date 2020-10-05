FROM ubuntu:20.04


RUN apt-get update -y
RUN apt-get -y install make gcc

RUN mkdir -p /opt/tpch
RUN mkdir -p /data

COPY data/tpch /opt/tpch
ARG TPCH_VERSION=2.18.0_rc2


RUN cd /opt/tpch/$TPCH_VERSION/dbgen && make

ENV PATH="${PATH}:/opt/tpch/$TPCH_VERSION/dbgen"

ENV DSS_PATH="/data"

WORKDIR /opt/tpch/$TPCH_VERSION/dbgen

ENTRYPOINT ["dbgen"]


