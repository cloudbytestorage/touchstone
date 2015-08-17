#!/bin/bash -
#title			:test_list_all_vg.sh
#author			:yogesh
#date			:06/08/2015
#version		:0.1
#description 		:This script will test the list all volume groups
#=====================================================================================
source /etc/cbtest.cfg

#call the ec api for list volume group
List_All_VG(){
        #use uuid as name for volume group
        echo "Executing create vg by name"
        VG_NAME=$(uuidgen)
        API="https://$elasticenter_ip/client/api?command=addVolumeGroup&name=$VG_NAME&response=json&apikey=$apikey"
        echo "$API"
        RESULT="$(http  --verify=no $API)"
        echo "$RESULT"
        RESULT1="$(echo "$RESULT" | jq '.addVolumeGroupResponse' | jq '.volumegroup' | jq '.name')"
        RESULT2="$(echo "$RESULT" | jq '.addVolumeGroupResponse' | jq '.errortext')"
        echo "$RESULT1"
        echo "$RESULT2"
        #check this line is it actully working
        if [ $RESULT1 != null  ] && [ $RESULT2 == null ]
        then
                echo "Create VG By Name Passed"
        else
                echo "Create VG By Name Failed"
        fi
	echo "Listing the volume group"
	API="https://$elasticenter_ip/client/api?command=listVolumeGroup&response=json&apikey=$apikey"
	echo "$API"
	RESULT="$(http  --verify=no $API)"
        echo "$RESULT"
        RESULT1="$(echo "$RESULT" | jq '.listVolumeGroupResponse' | jq '.count')"
        RESULT2="$(echo "$RESULT" | jq '.addVolumeGroupResponse' | jq '.errortext')"
	echo "$RESULT1"
	echo "$RESULT2"
	
        if [ $RESULT1 != null  ] && [ $RESULT2 == null ]
	then
		echo "List All VG Passed"
	else
		echo "List All VG Failed"
	fi
}

List_All_VG
