#!/bin/bash
START_SLOT=5821100
INCREMENT=300
for i in {0..168}
do
    SLOT=$(( $START_SLOT+$INCREMENT*$i ))
    COMMAND="SELECT slot, value, inserted_at, substring(builder_pubkey, 0, 9) FROM mainnet_builder_block_submission WHERE slot=$SLOT ORDER BY inserted_at;"
    RES=$(psql -p 5433 "host=0.0.0.0 sslmode=disable dbname=defaultdb user=readonly" -t -c "$COMMAND")
    echo $RES
done