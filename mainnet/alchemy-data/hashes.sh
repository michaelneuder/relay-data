#!/bin/bash
START_BLOCK=16484026
INCREMENT=1000
for i in {0..213}
do
    LB=$(( $START_BLOCK+$INCREMENT*$i ))
    UB=$(( $START_BLOCK+$INCREMENT*($i+1) ))

    DATA='['
    echo $LB $UB

    # COMMAND="SELECT COUNT(DISTINCT slot) FROM mainnet_builder_block_submission WHERE slot>=$LB AND slot<=$UB;"
    # echo $COMMAND
    # RES=$(psql -p 5433 "host=0.0.0.0 sslmode=disable dbname=defaultdb user=readonly" -t -c $COMMAND)
    # echo $RES
done