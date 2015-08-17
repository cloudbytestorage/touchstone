#!/bin/bash -
#title                  :test_create_vg_by_name_and_description.sh
#author                 :yogesh
#date                   :--------
#version                :0.1
#description            :-------
#========================================================
source /etc/cbtest.cfg

Create_VG_By_Name_and_desc(){
        #use uuid as name for volume group
        echo "Executing create vg by name"
        VG_NAME=$(uuidgen)
        API="https://$elasticenter_ip/client/api?command=addVolumeGroup&name=$VG_NAME&description=test_create_vg_by_name_and_description&response=json&apikey=$apikey"
        echo "$API"
        RESULT="$(http  --verify=no $API)"
        echo "$RESULT"
        RESULT1="$(echo "$RESULT" | jq '.addVolumeGroupResponse' | jq '.volumegroup' | jq '.name')"
        RESULT2="$(echo "$RESULT" | jq '.addVolumeGroupResponse' | jq '.errortext')"
        #check this line is it actully working
        if [ $RESULT1 != null  ] && [ $RESULT2 == null ]
        then
                echo "Create VG By Name And Desc Passed"
        else
                echo "Create VG By Name And Desc Failed"
        fi
}

Create_VG_By_Name_and_desc
