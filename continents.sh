#!/bin/bash

arr=("Africa" "Antarctica" "Asia" "Europe" "North-America" "South-America" "Oceania")

for continent in ${arr[@]}
do
    echo "Scraping $continent"
    python get_chart.py -p 15 -c $continent -y "1950-2022"
done