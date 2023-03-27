package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
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
	var r io.Reader
	r, err := os.Open("payloads100.txt")
	check(err)
	reader := bufio.Reader(r)
	// const maxCapacity int = 10000000 // your required line length
	// buf := make([]byte, maxCapacity)
	// scanner.Buffer(buf, maxCapacity)
	for reader.ReadLine {
		// var p Payload
		// start := time.Now()
		// fmt.Printf("%v\n", buf)
		// err = json.Unmarshal(buf, &p)
		// err = json.NewDecoder(buf).Decode(&p)
		// check(err)
		// dur := time.Since(start)
		// fmt.Printf("timing = %v microseconds\n", dur.Microseconds())
		// b, err := json.Marshal(p)
		// check(err)
		fmt.Printf("size = %v bytes\n", len(buf))
	}
}
