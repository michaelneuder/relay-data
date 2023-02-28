#!/bin/bash
while IFS=' ' read -ra line;
do
    SLOT=$(printf "%d\n" ${line[0]})
    HASH=${line[1]}
    COMMAND="SELECT slot,value,substring(block_hash,0,9) as hash,inserted_at,received_at FROM mainnet_builder_block_submission WHERE slot=$SLOT AND block_hash~'$HASH' ORDER BY inserted_at ASC LIMIT 1;"
    RES=$(psql -p 5433 "host=0.0.0.0 sslmode=disable dbname=defaultdb user=readonly" -t -c "$COMMAND")
    echo $RES
done < winninghashslots.txt