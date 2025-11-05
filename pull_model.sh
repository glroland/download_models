#!/bin/bash

if [ "$#" -ne 4 ]; then
  echo "Usage: $0 <s3_url> <s3_bucket2> <model_dir> <hf_repo>"
  exit 1
fi

S3_URL=$1
S3_BUCKET=$2
MODEL_DIR=$3
HF_REPO=$4

mkdir -p $MODEL_DIR
hf download $4 --local-dir=$MODEL_DIR/ --exclude="./original/*"
AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY aws s3 cp $MODEL_DIR s3://$S3_BUCKET/$MODEL_DIR/ --endpoint-url $S3_URL --recursive

