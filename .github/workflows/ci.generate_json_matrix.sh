#!/bin/bash

# This file just generates a github-actions matrix type to build the images with the corresponding binary. 

JSON_MATRIX="{ \"include\": [] }"
while IFS="=", read -r ARCH BIN
do
    JSON_MATRIX=$(echo "$JSON_MATRIX" | jq ".include += [
        {\"arch\": \"$ARCH\",\"bin\": \"$BIN\"} ]")
done < MAP_ARCH_TRANSLATOR

JSON_MATRIX=$( echo "$JSON_MATRIX" | jq -c . )

echo "::set-output name=matrix::$JSON_MATRIX"