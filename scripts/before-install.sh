#!/bin/bash

REGISTRY_URL=$(aws ssm get-parameter --name "/prime-api/registry_url" --region ap-south-1 --query "Parameter.Value" | tr -d '"')
CODEBUILD_BUILD_NUMBER=$(aws ssm get-parameter --name "/prime-api/codebuild_build_number" --region ap-south-1 --query "Parameter.Value" | tr -d '"')

aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin $REGISTRY_URL
docker image rm -f $(docker image ls -q fibo-stress)
docker pull $REGISTRY_URL/prime-api:$CODEBUILD_BUILD_NUMBER