#!/bin/bash -
#title                  :test_create_vg_by_name.sh
#author                 :yogesh
#date                   :07/08/2015
#version                :0.1
#description            :This script will test the create volume group 
#                        It will create a volume group by name
#=====================================================================================
source /etc/cbtest.cfg

Create_VG_By_Name(){
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
}

