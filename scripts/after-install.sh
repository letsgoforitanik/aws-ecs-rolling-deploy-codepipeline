#!/bin/bash

REGISTRY_URL=$(aws ssm get-parameter --name "/prime-api/registry_url" --region ap-south-1 --query "Parameter.Value" | tr -d '"')
CODEBUILD_BUILD_NUMBER=$(aws ssm get-parameter --name "/prime-api/codebuild_build_number" --region ap-south-1 --query "Parameter.Value" | tr -d '"')

docker container stop $(docker container ls -q) && docker container prune -f 
docker run -d -p 3000:3000 $REGISTRY_URL/prime-api:$CODEBUILD_BUILD_NUMBER