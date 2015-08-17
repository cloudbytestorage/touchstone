#!/bin/bash -
#title                  :test_delete_vg_by_Invalid_id.sh
#author                 :yogesh
#date                   :11/08/2015
#version                :0.1
#description            :This script will test the delete volume group
#                        by name providing invalid id
#=====================================================================================
source /etc/cbtest.cfg

Delete_VG_By_Invalid_Id(){
        echo "Deleting the VG"
        #remove the "" from id
        API="https://$elasticenter_ip/client/api?command=deleteVolumeGroup&id=invalidid&response=json&apikey=$apikey"
        echo "$API"
        RESULT="$(http  --verify=no $API)"
        echo "$RESULT"
        RESULT1="$(echo "$RESULT" | jq '.deleteVolumeGroupResponse' | jq '.success')"
        RESULT2="$(echo "$RESULT" | jq '.deleteVolumeGroupResponse' | jq '.errortext')"
        #check this line is it actully working
	echo $RESULT1
	echo "$RESULT2"
        if [ "$RESULT2" != "" ] && [ $RESULT1 == null ]
        then
                echo "Delete VG By Invalid Id Passed"
        else
               echo "Delete VG By Invalid Id Failed"
        fi

}

Delete_VG_By_Invalid_Id

