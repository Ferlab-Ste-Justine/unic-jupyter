ARG BASE_IMG="jupyter/all-spark-notebook:spark-3.1.1"
FROM $BASE_IMG
WORKDIR /

USER root

## add required jars in spark_default.conf
COPY ./set_dependencies.sh /
RUN chmod +x /set_dependencies.sh
RUN ./set_dependencies.sh

# Specify the User that the actual main process will run as
ARG SPARK_UID=1000
USER ${SPARK_UID}
