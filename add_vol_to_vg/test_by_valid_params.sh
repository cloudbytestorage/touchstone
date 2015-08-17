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
	VOL_ID=5d717ed6-a7bf-3aaa-acb9-e08b0cd36b89
	BKP_MGT_ID=40f60df0-097c-4987-838e-ea45385650c0
	TARGET_POOL_ID=b5966a04-aa27-31bb-95f4-12c99a379bc3 
        #use uuid as name for volume group
        echo "Executing create vg by name"
        VG_NAME=$(uuidgen)
        API="https://$elasticenter_ip/client/api?command=addVolumeGroup&name=$VG_NAME&description=test_create_vg_by_name_and_description&response=json&apikey=$apikey"
        echo "$API"
        RESULT="$(http  --verify=no $API)"
        echo "$RESULT"
        RESULT1="$(echo "$RESULT" | jq '.addVolumeGroupResponse' | jq '.volumegroup' | jq '.id')"
        RESULT2="$(echo "$RESULT" | jq '.addVolumeGroupResponse' | jq '.errortext')"
	VG_ID="${RESULT1//\"}"
        #check this line is it actully working
        if [ $RESULT1 != null  ] && [ $RESULT2 == null ]
        then
                echo "Create VG By Name And Desc Passed"
        else
                echo "Create VG By Name And Desc Failed"
        fi

	echo "Executing add backup policy"
	BP_NAME=$(uuidgen)
	API="https://$elasticenter_ip/client/api?command=createBackupPolicy&name=$BP_NAME&volumegroupid=$VG_ID&bkpid=$BKP_MGT_ID&schedulertype=remote&snapshotprefix=snappre&minute=*%2F2&hour=*&day=*&month=*&week=*&retentioncopies=1&password=cloudbyte&transportprotocol=ssh&poolid=$TARGET_POOL_ID&response=json&apikey=$apikey"
	echo "$API"
	RESULT="$(http  --verify=no $API)"
	echo "$RESULT"
	BP_ID="$(echo "$RESULT" | jq '.createBackupPolicyResponse' | jq '.backuppolicy' | jq '.id')"
	BP_ERROR="$(echo "$RESULT" | jq '.createBackupPolicyResponse' | jq '.errortext')"
	if [ $BP_ID != null  ] && [ $BP_ERROR == null ]
        then
                echo "Create BP Passed"
        else
                echo "Create BP Failed"
        fi

	echo "Executing add volume to VG"
	API="https://$elasticenter_ip/client/api?command=addVolumeToVG&id=$VOL_ID&volumegroupid=$VG_ID&response=json&apikey=$apikey"
	echo "$API"
	RESULT="$(http  --verify=no $API)"
	echo "$RESULT"
	SUCCESS="$(echo "$RESULT" | jq '.addVolumeToVGResponse' | jq '.success')"
        ERROR="$(echo "$RESULT" | jq '.addVolumeToVGResponse' | jq '.errortext')"
        if [ $SUCCESS != null  ] && [ $ERROR == null ]
        then
                echo "Add Volume To VG Passed"
        else
                echo "Add Volume To VG Failed"
        fi

		
}

By_valid_params
