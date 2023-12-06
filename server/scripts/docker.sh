#!/bin/bash

folder_path="./crawl_data"

if [ -d "$folder_path" ]; then
  echo "Folder copied to Docker container"
  docker build -t phapdien_web .
else
  echo "Folder does not exist"
  echo "Run crawl.Dockerfile to create folder"
  docker build -t phapdien_web -f crawling.Dockerfile .
fi

docker run -d -p 7777:7777 phapdien_web