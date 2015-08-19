#!/bin/bash -
#title                  :test_by_valid_params.sh
#author                 :yogesh
#date                   :13/08/2015
#version                :0.1
#description            :Test the add volume to volume group by providing the 
#                        valid vol vg id
#========================================================
source /etc/cbtest.cfg
#@param1 - volume id
#@param2 - volume group id
ADD_VOL_TO_VG(){

	echo "Executing add volume to VG"

	API="https://$elasticenter_ip/client/api?command=addVolumeToVG&id=$1&volumegroupid=$2&response=json&apikey=$apikey"
	echo "$API"
	RESULT="$(http  --verify=no $API)"
	echo "$RESULT"
	SUCCESS="$(echo "$RESULT" | jq '.addVolumeToVGResponse' | jq '.success')"
        ERROR="$(echo "$RESULT" | jq '.addVolumeToVGResponse' | jq '.errortext')"
        if [ $SUCCESS != null  ] && [ $ERROR == null ]
        then
         	echo "Volume successfully added to VG."
		return 0
        else
             	echo "Failed to add volume to VG."
		#PUT DELETE VG
		return 1
	fi	
}
