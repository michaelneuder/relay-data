#!/bin/bash
START_SLOT=5652333
INCREMENT=7200
for i in {0..29}
do
    LB=$(( $START_SLOT+$INCREMENT*$i ))
    UB=$(( $START_SLOT+$INCREMENT*($i+1) ))
    echo $LB $UB

    COMMAND="SELECT COUNT(DISTINCT slot) FROM mainnet_builder_block_submission WHERE slot>=$LB AND slot<=$UB;"
    echo $COMMAND
    RES=$(psql -p 5433 "host=0.0.0.0 sslmode=disable dbname=defaultdb user=readonly" -t -c $COMMAND)
    echo $RES
done