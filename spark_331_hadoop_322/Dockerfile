ARG BASE_IMG="jupyter/all-spark-notebook:spark-3.3.1"
FROM $BASE_IMG
WORKDIR /

USER root

## install ubuntu packages
ARG QUARTO_VERSION="1.0.38"

RUN curl -L https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb -o quarto-linux-amd64.deb

RUN apt-get update
RUN apt-get install -y libfontconfig1-dev
RUN apt-get install -y gdebi-core

RUN gdebi --non-interactive quarto-linux-amd64.deb

## add required jars in spark_default.conf
COPY install_Java_dependencies.sh /
COPY install_R_dependencies.sh /
COPY install_Python_dependencies.sh /
COPY ./spark-default-extra.conf /
COPY jars/local_policy.jar ${SPARK_HOME}/jars/local_policy.jar
COPY jars/US_export_policy.jar ${SPARK_HOME}/jars/US_export_policy.jar

ARG AWS_SDK_VERSION="1.11.563"
ARG AWS_HADOOP_VERSION="3.2.2"
ARG POSTGRESQL_VERSION="42.2.23"

RUN curl https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/${AWS_SDK_VERSION}/aws-java-sdk-bundle-${AWS_SDK_VERSION}.jar -o /usr/local/spark/jars/aws-java-sdk-bundle-${AWS_SDK_VERSION}.jar
RUN curl https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/${AWS_HADOOP_VERSION}/hadoop-aws-${AWS_HADOOP_VERSION}.jar -o /usr/local/spark/jars/hadoop-aws-${AWS_HADOOP_VERSION}.jar
RUN curl https://repo1.maven.org/maven2/org/postgresql/postgresql/${POSTGRESQL_VERSION}/postgresql-${POSTGRESQL_VERSION}.jar -o /usr/local/spark/jars/postgresql-${POSTGRESQL_VERSION}.jar

# Update conda and pandas (resolves to 1.4.4)
RUN conda update -n base conda
RUN conda update pandas

RUN chmod +x /install_Java_dependencies.sh
RUN ./install_Java_dependencies.sh
RUN chmod +x /install_Python_dependencies.sh
RUN ./install_Python_dependencies.sh
RUN chmod +x /install_R_dependencies.sh
RUN ./install_R_dependencies.sh

RUN cat /spark-default-extra.conf >> ${SPARK_HOME}/conf/spark-defaults.conf

# Specify the User that the actual main process will run as
ARG SPARK_UID=1000
USER ${SPARK_UID}
