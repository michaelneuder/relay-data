#!/bin/bash
while IFS=' ' read -ra line;
do
    PK=${line[0]}
    curl -X POST "http://localhost:8080/internal/v1/builder/$PK?optimistic=true"
done < topromote.txt