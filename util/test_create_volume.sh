#!/bin/bash -
#title                  :test_by_valid_params.sh
#author                 :yogesh
#date                   :13/08/2015
#version                :0.1
#description            :Test create volume
#============================================
source /etc/cbtest.cfg

Create_Volume(){
VG_NAME=$(uuidgen)
API="https://$elasticenter_ip/client/api?command=createVolume2&tsmid=$vsm_id&name=$VG_NAME&quotasize="1G"&compression="off"&sync="always"&recordsize="16k"&protocoltype="ISCSI"&latency="15"&response=json&apikey=$apikey"
echo $API
RESULT="$(http  --verify=no $API)"
echo $RESULT
}
Create_Volume
