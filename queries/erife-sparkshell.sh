spark-shell --master spark://10.150.162.148:7077 \
    --name "tpcds-erife" \
    --conf spark.sql.shuffle.partitions=512 \
    --conf spark.executor.cores=20 \
    --conf spark.executor.memory=80G \
    --conf spark.driver.memory=50G \
    --conf spark.sql.adaptive.enabled=true \
    --conf spark.sql.files.maxPartitionBytes=2g \
    --conf spark.locality.wait=0   \
    --conf spark.sql.broadcastTimeout=1000 \
    --conf spark.driver.maxResultSize=10g  