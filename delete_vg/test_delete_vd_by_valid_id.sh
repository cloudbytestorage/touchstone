#!/bin/bash -
#title                  :test_delete_vg_by_valid_id.sh
#author                 :yogesh
#date                   :11/08/2015
#version                :0.1
#description            :This script will test the delete volume group
#                        by name providing valid id
#=====================================================================================
source /etc/cbtest.cfg

Delete_VG_By_Valid_Id(){
        #use uuid as name for volume group
        echo "Executing create vg by name"
        VG_NAME=$(uuidgen)
        API="https://$elasticenter_ip/client/api?command=addVolumeGroup&name=$VG_NAME&response=json&apikey=$apikey"
        echo "$API"
        RESULT="$(http  --verify=no $API)"
        echo "$RESULT"
        RESULT1="$(echo "$RESULT" | jq '.addVolumeGroupResponse' | jq '.volumegroup' | jq '.id')"
        RESULT2="$(echo "$RESULT" | jq '.addVolumeGroupResponse' | jq '.errortext')"
        #check this line is it actully working
        if [ $RESULT1 != null  ] && [ $RESULT2 == null ]
        then
                echo "Create VG By Name Passed"
        else
                echo "Create VG By Name Failed"
        fi

	echo "Deleting the created VG"
	#remove the "" from id
	RESULT1="${RESULT1//\"}"
	API="https://$elasticenter_ip/client/api?command=deleteVolumeGroup&id=$RESULT1&response=json&apikey=$apikey"
	echo "$API"
        RESULT="$(http  --verify=no $API)"
        echo "$RESULT"
	RESULT1="$(echo "$RESULT" | jq '.deleteVolumeGroupResponse' | jq '.success')"
	RESULT2="$(echo "$RESULT" | jq '.deleteVolumeGroupResponse' | jq '.errortext')"
        #check this line is it actully working
        if [ $RESULT1 != null  ] && [ $RESULT2 == null ]
        then
                echo "Delete VG By Valid Id Passed"
        else
                echo "Delete VG By Valid Id Failed"
        fi
	

	
}

Delete_VG_By_Valid_Id
