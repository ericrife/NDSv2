SPARK_RAPIDS_PLUGIN_JAR=/usr/lib/spark/jars/cudf-21.12.2-cuda11.jar
CUDF_JAR=/usr/lib/spark/jars/rapids-4-spark_2.12-21.12.0.jar


spark-shell --master yarn \
    --name "tpcds-query1" \
    --conf spark.driver.maxResultSize=2GB \
    --conf spark.rapids.cudfVersionOverride=true \
    --conf spark.rapids.sql.concurrentGpuTasks=4 \
    --conf spark.task.cpus=16 \
    --conf spark.executor.memory=50G \
    --conf spark.executor.instances=2 \
    --conf spark.executor.cores=16 \
    --conf spark.executor.resource.gpu.amount=1 \
    --conf spark.task.resource.gpu.amount=0.0625 \
    --conf spark.sql.files.maxPartitionBytes=512M \
    --conf spark.sql.shuffle.partitions=1000 \
    --conf spark.locality.wait=0 \
    --conf spark.driver.extraClassPath=$SPARK_RAPIDS_PLUGIN_JAR:$CUDF_JAR \
    --conf spark.executor.extraClassPath=$SPARK_RAPIDS_PLUGIN_JAR:$CUDF_JAR \
    --conf spark.rapids.memory.host.spillStorageSize=32G \
    --conf spark.sql.adaptive.enabled=true \
    --conf spark.plugins=com.nvidia.spark.SQLPlugin \
    --conf spark.rapids.memory.pinnedPool.size=8g \
    --conf spark.rapids.shuffle.maxMetadataSize=1MB \
    --conf spark.rapids.sql.incompatibleOps.enabled=true \
    --conf spark.rapids.sql.variableFloatAgg.enabled=true \
    --conf spark.rapids.sql.hasNans=false \
    -I /home/erife/queries/streams/query_1.sql 2>&1 | tee gpu.query1.out
