spark-shell --master spark://10.150.166.218:7077 \
    --name "tpcds-cpu-query4" \
    --conf spark.cores.max=256 \
    --conf spark.executor.cores=32 \
    --conf spark.executor.memory=100G \
    --conf spark.driver.memory=50G \
    --conf spark.sql.adaptive.enabled=true \
    --conf spark.sql.files.maxPartitionBytes=2g \
    --conf spark.sql.shuffle.partitions=400 \
    --conf spark.locality.wait=0   \
    --conf spark.sql.broadcastTimeout=1000 \
    --conf spark.driver.maxResultSize=10g  \
    -I /data/erife/queries/streams/query_4.sql 2>&1 | tee cpu.query4.out
