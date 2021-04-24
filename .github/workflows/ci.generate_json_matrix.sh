#!/bin/bash

# This file just generates a github-actions matrix type to build the images with the corresponding binary. 

JSON_MATRIX="{ \"include\": [] }"
while IFS="=", read -r ARCH ARCH_BIN
do
    # Replaces the arch / by _ to use as docker labels
    DOCKER_ARCH_LABEL=$(echo "$ARCH" | sed "s/\//_/")
    JSON_MATRIX=$(echo "$JSON_MATRIX" | jq ".include += [
        {\"arch\": \"$ARCH\",\"bin_arch\": \"$ARCH_BIN\", \"docker_arch_label\": \"$DOCKER_ARCH_LABEL\"} ]")
done < MAP_ARCH_TRANSLATOR

JSON_MATRIX=$( echo "$JSON_MATRIX" | jq -c . )

echo "::set-output name=matrix::$JSON_MATRIX"