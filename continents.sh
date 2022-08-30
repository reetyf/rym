#!/bin/bash

arr=(Africa Antarctica Asia Europe North-America South-America Oceania)

for continent in ${arr[@]}:
do
    python get_chart.py -p 10 -c "$continent" -y "1950-2022"
    echo "Scraping $continent"
done