#!/bin/bash
while IFS=' ' read -ra line;
do
    SLOT=${line[0]}
    # echo $SLOT
    COMMAND="SELECT block_number FROM mainnet_builder_block_submission WHERE SLOT=$SLOT LIMIT 1;"
    # COMMAND="SELECT block_number FROM mainnet_payload_delivered WHERE SLOT=$SLOT;"
    # echo $COMMAND
    RES=$(psql -p 5433 "host=0.0.0.0 sslmode=disable dbname=defaultdb user=readonly" -t -c "$COMMAND")
    echo $SLOT,$RES
    # if [[ $RES -ne "0" ]]
    # then
    #     COMMAND2="SELECT COUNT(*) FROM mainnet_builder_block_submission WHERE block_number=$BN AND block_hash=$HASH;"
    #     RES2=$(psql -p 5433 "host=0.0.0.0 sslmode=disable dbname=defaultdb user=readonly" -t -c "$COMMAND2")
    #     echo $RES $RES2
    # fi
# done < hashes1.txt
done < slots.txt