ARG BASE_IMG="jupyter/all-spark-notebook:spark-3.1.2"
FROM $BASE_IMG
WORKDIR /

USER root

## add required jars in spark_default.conf
COPY ./set_dependencies.sh /
COPY ./local_policy.jar ${SPARK_HOME}/jars/local_policy.jar
COPY ./US_export_policy.jar ${SPARK_HOME}/jars/US_export_policy.jar

RUN chmod +x /set_dependencies.sh
RUN ./set_dependencies.sh

# Specify the User that the actual main process will run as
ARG SPARK_UID=1000
USER ${SPARK_UID}
