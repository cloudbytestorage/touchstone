# REPUSH_MIGRATION SPECS :
# -----------------------

* Run the following for reproducing:
   - Created VSM on Source Node.
   - Created an ISCSI Volume on the VSM.
   - Accessed the ISCSI Volume.
   - Added some data to the volume.
   - Checking VSM details in "tenants" and "dataset" section in:
     * Source Node - /cf/conf/config.xml before migration.
   - Scheduled Migration from Primary VSM.
   - Stopped cbdpd service in Source Node VSM during migration.
   - Migration failed.
   - Went to Migrant VSM and performed "REPUSH" operation.
   - Checked the "cbc_storageconfiguration.log" after performing "REPUSH".
   - Checking VSM details in "tenants" and "dataset" section in:
     * Destination Node - /cf/conf/config.xml after migration.