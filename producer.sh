#!/bin/bash

customers=("Judy Hopps" "Nick Wilde" "Chief Bogo" "Officer Clawhauser" "Mayor Lionheart" "Mr. Big" "Fru Fru")
operations=("searched" "bought")
products=("Donut" "Carrot" "Tie" "Glasses" "Phone" "Ice cream" "Dress" "Pineapple pizza")

for i in {1..50}
do
  randomCustomerId=$(($RANDOM%7))
  echo "
  {
      customer: ${customers[$randomCustomerId]}
      product: ${products[$RANDOM % 8]}
      operation: ${operations[$RANDOM % 2]}
  }" | kcat -F kcat.config -P -t customer-activity

   echo "Sent message # $i"
   sleep 1s
done