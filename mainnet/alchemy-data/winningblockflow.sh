#!/bin/bash
while IFS=' ' read -ra line;
do
    # echo ${line[0]}
    BN=$(printf "%d\n" ${line[0]})
    HASH=${line[1]}
    # echo $BN $HASH
    COMMAND="SELECT COUNT(*) FROM mainnet_builder_block_submission WHERE block_number=$BN;"
    # echo $COMMAND
    RES=$(psql -p 5433 "host=0.0.0.0 sslmode=disable dbname=defaultdb user=readonly" -t -c "$COMMAND")
    
    if [[ $RES -ne "0" ]]
    then
        COMMAND2="SELECT COUNT(*) FROM mainnet_builder_block_submission WHERE block_number=$BN AND block_hash=$HASH;"
        RES2=$(psql -p 5433 "host=0.0.0.0 sslmode=disable dbname=defaultdb user=readonly" -t -c "$COMMAND2")
        echo $RES $RES2
    fi
done < hashes1.txt

while IFS=' ' read -ra line;
do
    # echo ${line[0]}
    BN=$(printf "%d\n" ${line[0]})
    HASH=${line[1]}
    # echo $BN $HASH
    # COMMAND="SELECT COUNT(*) FROM mainnet_builder_block_submission WHERE block_number=$BN;"
    # echo $COMMAND
    # RES=$(psql -p 5433 "host=0.0.0.0 sslmode=disable dbname=defaultdb user=readonly" -t -c "$COMMAND")
    
    # if [[ $RES -ne "0" ]]
    # then
        COMMAND2="SELECT COUNT(*) FROM mainnet_builder_block_submission WHERE block_number=$BN AND block_hash='$HASH';"
        RES2=$(psql -p 5433 "host=0.0.0.0 sslmode=disable dbname=defaultdb user=readonly" -t -c "$COMMAND2")
        echo $BN $HASH $RES $RES2
    # fi
done < bn_hash_20.txt