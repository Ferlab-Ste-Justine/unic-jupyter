#!/usr/bin/env bash
set -e

SPARK_HOME="/usr/local/spark"

FERLAB_SPARK31="bio.ferlab:datalake-spark31_2.12:0.2.34"

POSTGRESQLV="42.2.23"
HADOOPV="3.3.1"
POSTGRESQL="org.postgresql:postgresql:${POSTGRESQLV}"
AWS_SDK="com.amazonaws:aws-java-sdk-bundle:1.11.901"
AWS_SOFTWARE_SDK="software.amazon.awssdk:s3:2.17.71"
AWS_HADOOP="org.apache.hadoop:hadoop-aws:${HADOOPV}"
HADOOP_COMMON="org.apache.hadoop:hadoop-common:${HADOOPV}"
HADOOP_MR_CORE="org.apache.hadoop:hadoop-mapreduce-client-core:${HADOOPV}"
MSSQL_ADAL4J="com.microsoft.aad:adal4j:0.0.2"
MSSQL_JDBC="com.microsoft.sqlserver:mssql-jdbc:9.4.1.jre8"
MSSQL_SPARK_CONNECTOR="com.microsoft.azure:spark-mssql-connector_2.12:1.2.0"
MSSQL_MSAL4J="com.microsoft.azure:msal4j:1.11.0"
AZURE_CORE="com.azure:azure-core:1.24.1"
AZURE_CORE_NETTY="com.azure:azure-core-http-netty:1.11.6"
AZURE_CORE_SECURITY="com.azure:azure-security-keyvault-keys:4.3.5"
DELTA_CORE="io.delta:delta-core_2.12:1.1.0"
SCHEMA_CRAWLER="us.fatehi:schemacrawler:16.16.11"

packages="spark.jars.packages "

echo "Add spark.jars.package..."

for package in ${POSTGRESQL} ${AWS_SDK} ${AWS_SOFTWARE_SDK} ${AWS_HADOOP} ${HADOOP_COMMON} ${HADOOP_MR_CORE} ${FERLAB_SPARK31} ${MSSQL_ADAL4J} ${MSSQL_JDBC} ${MSSQL_SPARK_CONNECTOR} ${MSSQL_MSAL4J} ${AZURE_CORE} ${AZURE_CORE_NETTY} ${AZURE_CORE_SECURITY} ${SCHEMA_CRAWLER}; do
    echo "Adding ${package}"
    packages+="${package},"
done

packages+=${DELTA_CORE}

echo ${packages} >> ${SPARK_HOME}/conf/spark-defaults.conf
echo "spark.jars /opt/spark/jars/postgresql-${POSTGRESQLV}.jar" >> ${SPARK_HOME}/conf/spark-defaults.conf

chown jovyan ${SPARK_HOME}/conf/spark-defaults.conf