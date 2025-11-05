#!/bin/bash

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <s3_url> <s3_bucket2> <model_defs_csv>"
  exit 1
fi

S3_URL=$1
S3_BUCKET=$2
MODEL_DEFS_CSV=$3

if [ ! -f "$MODEL_DEFS_CSV" ]; then
	echo "Model Definitions '$MODEL_DEFS_CSV' does not exist."
	exit 1
fi

while IFS=',' read -r -a row_array; do
    	HF_REPO="${row_array[0]}"
    	MODEL_DIR="${row_array[1]}"

	if [[ -n "$HF_REPO" && -n "$MODEL_DIR" ]]; then
		echo ""
		echo "Downloading model..."
		echo "Model_Dir = $MODEL_DIR"
		echo "Hugging Face Repo = $HF_REPO"
	
		./pull_model.sh $S3_URL $S3_BUCKET $MODEL_DIR $HF_REPO
	fi
done < "$MODEL_DEFS_CSV"



