#!/bin/bash
while IFS=' ' read -ra line;
do
    SLOT=$(printf "%d\n" ${line[0]})
    HASH=${line[1]}
    COMMAND="SELECT optimistic_submission,decode_duration,prechecks_duration,simulation_duration,redis_update_duration,total_duration FROM mainnet_builder_block_submission WHERE slot=$SLOT and block_hash='$HASH' LIMIT 1;"
    RES=$(psql -p 5433 "host=0.0.0.0 sslmode=disable dbname=defaultdb user=readonly" -t -c "$COMMAND")
    echo $SLOT "|" $HASH "|" $RES
done < winninghashes.txt


SELECT 
    optimistic_submission,
    decode_duration,
    prechecks_duration,
    simulation_duration,
    redis_update_duration,
    total_duration,
    mainnet_payload_delivered.slot,
    mainnet_payload_delivered.block_hash
FROM mainnet_payload_delivered 
INNER JOIN mainnet_builder_block_submission ON mainnet_payload_delivered.slot=mainnet_builder_block_submission.slot AND mainnet_payload_delivered.block_hash=mainnet_builder_block_submission.block_hash 
WHERE mainnet_payload_delivered.slot>=5992184;
