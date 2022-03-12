#!/bin/bash

my_dir="$(cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)"
resource="."
source ${my_dir}/utils.sh
source ${my_dir}/env.conf
source ${my_dir}/${resource}/env.conf

token_files="${my_dir}/*.conf ${my_dir}/${resource}/*.conf"
token_cmd=$(getTokenCmd ${token_files})

oc delete secret ${pgadmin4_secret}

eval "${token_cmd} ${my_dir}/${resource}/pgadmin4.yaml" | oc delete -f -
