for i in 0 1 2 3 4
do
sed -i '/\-\- start/a spark.time\(spark.sql(\"\"\"' query_$i.sql
sed -i '/\-\- end/i \"\"\").collect\(\)\)' query_$i.sql
done

# Remove query 72
# Add to middle of these querires
# 14, 23, 24,39
""").collect())
spark.time(spark.sql("""


for i in 0 1 2 3 4
do
sed -i 's/Time taken/\nTime taken/' gpu.query$i.out
done

gawk '{if ($0 ~ /start query/) pat1=$0; if ($0 ~ /Time taken/) pat2=$0}{if (pat1 && pat2) print pat1, pat2;pat=pat2=""}' gpu.query0.out | awk '{print $3 "-" $4 " " $10 " " $13}'
