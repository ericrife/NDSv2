spark-shell --master yarn \
    --name "tpcds-cpu-query1" \
    --conf spark.sql.adaptive.enabled=true \
    --conf spark.sql.files.maxPartitionBytes=512m \
    --conf spark.sql.shuffle.partitions=400 \
    --conf spark.locality.wait=0 \
    --conf spark.sql.broadcastTimeout=1000 \
    --conf spark.driver.maxResultSize=10g  \
    -I /home/erife/queries/streams/query_1.sql 2>&1 | tee cpu.query1.out
