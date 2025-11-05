# Download Models Repo

## Instructions:
* Obtain a python environment or use what is active
* pip install -r requirements.txt

## Download all models:

Run pull_all_models.sh script with S3_URL, S3_BUCKET_NAME and the CSV file that lists the HuggingFace repos and sub directory titles per model.

./pull_all_models.sh https://eclipse.home.glroland.com:9000 llms model_defs.csv

## Download a single model:

Run the pull_model.sh script to download a particular repo

Example:
./pull_model.sh https://eclipse.home.glroland.com:9000 llms llama32 RedHatAI/Llama-3.2-1B-FP8

