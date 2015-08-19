#!/bin/bash -
#title                  :test_by_valid_params.sh
#author                 :yogesh
#date                   :13/08/2015
#version                :0.1
#description            :Test the add volume to volume group by providing the 
#                        valid vol vg id
#========================================================
source /etc/cbtest.cfg

By_valid_params(){
	echo "Executing add backup policy"
	BP_NAME=$(uuidgen)
	API="https://$elasticenter_ip/client/api?command=createBackupPolicy&name=$BP_NAME&volumegroupid=$VOL_ID&bkpid=$BKP_MGT_ID&schedulertype=remote&snapshotprefix=snappre&minute=*%2F2&hour=*&day=*&month=*&week=*&retentioncopies=1&password=cloudbyte&transportprotocol=ssh&poolid=$TARGET_POOL_ID&response=json&apikey=$apikey"
	echo "$API"
	RESULT="$(http  --verify=no $API)"
	echo "$RESULT"
	BP_ID="$(echo "$RESULT" | jq '.createBackupPolicyResponse' | jq '.backuppolicy' | jq '.id')"
	BP_ERROR="$(echo "$RESULT" | jq '.createBackupPolicyResponse' | jq '.errortext')"
	if [ $BP_ID != null  ] && [ $BP_ERROR == null ]
        then
                echo "Create BP successfully."
		return 0
        else
                echo "Failed to create BP"
		return 1
        fi

}

