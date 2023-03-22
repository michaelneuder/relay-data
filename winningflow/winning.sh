while IFS=' ' read -ra line;
do
    BN=$(printf "%d\n" ${line[0]})
    HASH=${line[1]}

    COMMAND2="SELECT builder_pubkey,received_at,eligible_at FROM mainnet_builder_block_submission WHERE block_number=$BN AND block_hash='$HASH' ORDER BY received_at ASC LIMIT 1;"
    RES2=$(psql -p 5433 "host=0.0.0.0 sslmode=disable dbname=defaultdb user=readonly" -t -c "$COMMAND2")
    echo $BN "|" $HASH "|" $RES2

done < blockhashes.txt