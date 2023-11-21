#!/bin/bash

echo "Logging in to Amazon ECR..."
docker login --username AWS --password $(aws ecr get-login-password --region us-east-1) 490188592902.dkr.ecr.us-east-1.amazonaws.com
echo "Logged in to Amazon ECR successfully."

echo "Pulling image from Amazon ECR"
docker pull 490188592902.dkr.ecr.us-east-1.amazonaws.com/cropanalysis:latest
echo "Pulled image from Amazon ECR successfully."