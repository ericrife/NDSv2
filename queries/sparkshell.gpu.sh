SPARK_RAPIDS_PLUGIN_JAR=/opt/sparkRapidsPlugin/cudf-21.08.2-cuda11.jar
CUDF_JAR=/opt/sparkRapidsPlugin/rapids-4-spark_2.12-21.08.0.jar


spark-shell --master spark://10.150.166.218:7077 \
    --name "tpcds-erife" \
    --conf spark.driver.maxResultSize=2GB \
    --conf spark.rapids.cudfVersionOverride=true \
    --conf spark.executor.cores=16 \
    --conf spark.rapids.sql.concurrentGpuTasks=4 \
    --conf spark.executor.resource.gpu.amount=1 \
    --conf spark.task.resource.gpu.amount=0.0625 \
    --conf spark.executor.memory=240G \
    --conf spark.driver.memory=50G \
    --conf spark.sql.files.maxPartitionBytes=1g \
    --conf spark.sql.shuffle.partitions=400 \
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
    -I /data/erife/queries/query_0.sql 2>&1 | tee gpu.query.out
