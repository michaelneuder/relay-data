package main

import (
	"encoding/json"
	"fmt"
	"io"
	"os"
	"time"
)

type Payload struct {
	ParentHash    string   `json:"parent_hash"`
	FeeRecipient  string   `json:"fee_recipient"`
	StateRoot     string   `json:"state_root"`
	ReceiptsRoot  string   `json:"receipts_root"`
	LogsBloom     string   `json:"logs_bloom"`
	PrevRandao    string   `json:"prev_randao"`
	BlockNumber   string   `json:"block_number"`
	GasLimit      string   `json:"gas_limit"`
	GasUsed       string   `json:"gas_used"`
	Timestamp     string   `json:"timestamp"`
	ExtraData     string   `json:"extra_data"`
	BaseFeePerGas string   `json:"base_fee_per_gas"`
	BlockHash     string   `json:"block_hash"`
	Transactions  []string `json:"transactions"`
}

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func main() {
	trials := int(1e3)
	times := make([]int64, trials)
	for i := 0; i < trials; i++ {
		var r io.Reader
		r, err := os.Open("big.json")
		check(err)
		var p Payload
		start := time.Now()
		err = json.NewDecoder(r).Decode(&p)
		dur := time.Since(start)
		fmt.Printf("trial: %d: timing = %v microseconds\n", i, dur.Microseconds())
		check(err)
		times[i] = dur.Microseconds()
	}
	fmt.Printf("times=%v\n", times)
}
