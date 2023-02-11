#!/bin/bash

bids=$(curl -s https://relay.ultrasound.money/relay/v1/data/bidtraces/builder_blocks_received?slot=5771427)

echo "$bids"