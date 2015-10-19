=====================
# BUG REPRODUCE SPECS :
=====================

* Run the following for reproducing:
   - Created TSM on Source Node.
   - Created an ISCSI Volume on the TSM.
   - Accessed the ISCSI Volume.
   - Added some data to the volume.
   - Checking TSM details in "tenants" and "dataset" section in:
     * Source Node - /cf/conf/config.xml before/after deletion.
   - Scheduled Migration from Primary TSM.
   - Stopped cbdpd service in Source Node VSM during migration.
   - Migration failed.
   - Deleted both primary and migrant VSM.
   - Checking TSM details in "tenants" and "dataset" section in:
     * Destination Node - /cf/conf/config.xml after deletion.