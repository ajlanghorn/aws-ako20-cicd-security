#!/usr/bin/env bash

if [[ -z "${AWS_DEFAULT_REGION}" ]]; then
  echo "ERROR! AWS_DEFAULT_REGION environment variable not set."
  exit 1
else
  aws cloudformation create-stack --stack-name ako20-`date +%s` --template-body file://template.json
fi
