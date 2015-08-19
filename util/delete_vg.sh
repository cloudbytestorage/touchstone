#!/bin/bash -
#title                  :test_delete_vg_by_valid_id.sh
#author                 :yogesh
#date                   :11/08/2015
#version                :0.1
#description            :This script will test the delete volume group
#                        by name providing valid id
#=====================================================================================
source /etc/cbtest.cfg

Delete_VG(){
	echo "Deleting the VG"
	API="https://$elasticenter_ip/client/api?command=deleteVolumeGroup&id=$1&response=json&apikey=$apikey"
	echo "$API"
        RESULT="$(http  --verify=no $API)"
        echo "$RESULT"
	SUCCESS="$(echo "$RESULT" | jq '.deleteVolumeGroupResponse' | jq '.success')"
	ERROR="$(echo "$RESULT" | jq '.deleteVolumeGroupResponse' | jq '.errortext')"
        if [ $SUCCESS != null  ] && [ $ERROR == null ]
        then
                echo "VG deleted successfully."
		return 0
        else
                echo "Failed to delete VG"
		return 1
        fi
}
