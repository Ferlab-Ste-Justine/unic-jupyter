#!/usr/bin/env bash
set -e

SPARK_HOME="/usr/local/spark"

POSTGRESQLV="42.2.23"
HADOOPV="3.3.1"
POSTGRESQL="org.postgresql:postgresql:${POSTGRESQLV}"
AWS_SDK="com.amazonaws:aws-java-sdk-bundle:1.11.901"
AWS_HADOOP="org.apache.hadoop:hadoop-aws:${HADOOPV}"
HADOOP_COMMON="org.apache.hadoop:hadoop-common:${HADOOPV}"
HADOOP_MR_CORE="org.apache.hadoop:hadoop-mapreduce-client-core:${HADOOPV}"
FERLAB_SPARK31="bio.ferlab:datalake-spark31_2.12:0.2.1"
MSSQL_JDBC="com.microsoft.sqlserver:mssql-jdbc:8.4.1.jre8"
ADAL4J="com.microsoft.aad:adal4j:0.0.2"
MSSQL_SPARK_CONNECTOR="com.microsoft.azure:spark-mssql-connector_2.12:1.2.0"
DELTA_CORE="io.delta:delta-core_2.12:1.1.0"

packages="spark.jars.packages "

echo "Add spark.jars.package..."

for package in ${POSTGRESQL} ${AWS_SDK} ${AWS_HADOOP} ${HADOOP_COMMON} ${HADOOP_MR_CORE} ${FERLAB_SPARK31} ${MSSQL_JDBC} ${ADAL4J} ${MSSQL_SPARK_CONNECTOR}; do
    echo "Adding ${package}"
    packages+="${package},"
done

packages+=${DELTA_CORE}

echo ${packages} >> ${SPARK_HOME}/conf/spark-defaults.conf
echo "spark.jars /opt/spark/jars/postgresql-${POSTGRESQLV}.jar" >> ${SPARK_HOME}/conf/spark-defaults.conf

chown jovyan ${SPARK_HOME}/conf/spark-defaults.conf