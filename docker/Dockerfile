ARG BASE_IMG="jupyter/all-spark-notebook:spark-3.1.2"
FROM $BASE_IMG
WORKDIR /

USER root

## add required jars in spark_default.conf
COPY ./set_dependencies.sh /
RUN chmod +x /set_dependencies.sh
RUN ./set_dependencies.sh

COPY ./store.pfx /home/jovyan/
RUN chmod 755 /home/jovyan/store.pfx
RUN chown -R jovyan:users /home/jovyan/store.pfx

# Specify the User that the actual main process will run as
ARG SPARK_UID=1000
USER ${SPARK_UID}
