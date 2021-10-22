#!/usr/bin/env bash
set -e

SPARK_HOME="/usr/local/spark"

POSTGRESQL="org.postgresql:postgresql:42.2.23"
AWS_SDK="com.amazonaws:aws-java-sdk-bundle:1.11.375"
AWS_HADOOP="org.apache.hadoop:hadoop-aws:3.2.0"
FERLAB_SPARK31="bio.ferlab:datalake-spark31_2.12:0.1.2"
MSSQL_JDBC="com.microsoft.sqlserver:mssql-jdbc:8.4.1.jre8"
ADAL4J="com.microsoft.aad:adal4j:0.0.2"
MSSQL_SPARK_CONNECTOR="com.microsoft.azure:spark-mssql-connector_2.12:1.2.0"
DELTA_CORE="io.delta:delta-core_2.12:1.0.0"

packages="spark.jars.packages "

echo "Add spark.jars.package..."

for package in ${POSTGRESQL} ${AWS_SDK} ${AWS_HADOOP} ${FERLAB_SPARK31} ${MSSQL_JDBC} ${ADAL4J} ${MSSQL_SPARK_CONNECTOR} ${DELTA_CORE}; do
    echo "Adding ${package}"
    packages+="${package},"
done

echo ${packages} >> ${SPARK_HOME}/conf/spark-defaults.conf