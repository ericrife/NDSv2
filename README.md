# TPCDS-Official

This is for the official TPCDS runs. 


https://github.com/cloudera/impala-tpcds-kit

This command creates the dataset. Modify the -p option to accomodate youre cluster CPU count

hadoop jar target/tpcds-gen-1.0-SNAPSHOT.jar -d /data_raw -p 200 -s 3000

Update the prefixes to the correct paths to your HDFS infrastructure

spark-submit --driver-memory 32G --conf spark.rapids.sql.enabled=false --conf spark.executor.cores=30 --conf spark.executor.memory=100G --conf spark.task.cpus=30 ./ds-convert.py --input-prefix="hdfs://tpcds-2gpu-8node-t4-cluster-m/data_raw/" --output-prefix="hdfs://tpcds-2gpu-8node-t4-cluster-m/data_parquet/" --input-suffix=""

From inisde the ./DSGen-software-code-3.2.0rc1/tools directory run the following command to generate the queries. Adjust output dir as needed.

./dsqgen -DIRECTORY ../query_templates -INPUT ../query_templates/templates.lst -SCALE 3000 -DIALECT netezza -OUTPUT_DIR /home/erife/queries/streams -streams 10
