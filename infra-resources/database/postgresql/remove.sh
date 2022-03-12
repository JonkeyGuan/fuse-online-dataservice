#!/bin/bash

my_dir="$(cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)"

oc process --param-file=${my_dir}/instance.env -n openshift postgresql-persistent | oc delete -f -
