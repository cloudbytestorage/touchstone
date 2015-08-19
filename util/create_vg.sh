#!/bin/bash -
#title                  :create_vg.sh
#author                 :yogesh
#date                   :07/08/2015
#version                :0.1
#description            :This script will the create volume group 
#=====================================================================================
source /etc/cbtest.cfg

Create_VG(){
        #use uuid as name for volume group
        echo "Executing create vg by name"
        VG_NAME=$(uuidgen)
        API="https://$elasticenter_ip/client/api?command=addVolumeGroup&name=$VG_NAME&response=json&apikey=$apikey"
        echo "$API"
        RESULT="$(http  --verify=no $API)"
        echo "$RESULT"
        VGID="$(echo "$RESULT" | jq '.addVolumeGroupResponse' | jq '.volumegroup' | jq '.id')"
	VGID="${VGID//\"}"
        ERROR="$(echo "$RESULT" | jq '.addVolumeGroupResponse' | jq '.errortext')"
        echo "$VGID"
	echo "$ERROR"
        if [ $ERROR == null ] && [ $VGID != null  ]
        then
                echo "Created VG Successfully"
		return 0 
        else
                echo "Failed To Create VG"
		return 1
        fi

}

