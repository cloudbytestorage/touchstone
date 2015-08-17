#!/bin/bash -
#title                  :test_list_vg_by_id.sh
#author                 :yogesh
#date                   :06/08/2015
#version                :0.1
#description            :This script will test the list all volume groups
#=====================================================================================
source /etc/cbtest.cfg

List_VG_BYID(){
        RESULT="$(http  --verify=no "https://$elasticenter_ip/client/api?command=listVolumeGroup&volume=true&response=json&apikey=$apikey" | jq '.listVolumeGroupResponse')"

        if [ "$RESULT" != null ];
        then
                echo "List VG By Id Passed"
        else
                echo "List VG By Id Failed"
        fi
}

List_VG_BYID

