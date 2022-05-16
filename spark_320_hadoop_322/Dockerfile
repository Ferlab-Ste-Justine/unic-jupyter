ARG BASE_IMG="jupyter/all-spark-notebook:spark-3.1.2"
FROM $BASE_IMG
WORKDIR /

USER root

## add required jars in spark_default.conf
COPY install_Java_dependencies.sh /
COPY install_R_dependencies.sh /
COPY install_Python_dependencies.sh /
COPY ./spark-default-extra.conf /
COPY jars/local_policy.jar ${SPARK_HOME}/jars/local_policy.jar
COPY jars/US_export_policy.jar ${SPARK_HOME}/jars/US_export_policy.jar

ARG AWS_SDK_VERSION="1.11.563"
ARG AWS_HADOOP_VERSION="3.2.2"

RUN curl https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/${AWS_SDK_VERSION}/aws-java-sdk-bundle-${AWS_SDK_VERSION}.jar -o /usr/local/spark/jars/aws-java-sdk-bundle-${AWS_SDK_VERSION}.jar
RUN curl https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/${AWS_HADOOP_VERSION}/hadoop-aws-${AWS_HADOOP_VERSION}.jar -o /usr/local/spark/jars/hadoop-aws-${AWS_HADOOP_VERSION}.jar

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
