=====================
# BUG REPRODUCE SPECS :
=====================

* Run the following for reproducing:
   - Created TSM on Source Node.
   - Created an ISCSI Volume on the TSM.
   - Accessed the ISCSI Volume.
   - Added some data to the volume.
   - Scheduled DR from Primary TSM.
   - Checked the logs in case migration completed successfully or not:
     * /var/log/cbc/cbc_storageconfiguration.log
     * /var/log/cbdpd.log @Source NODE VSM
     * /var/log/bkpd/log @Destination NODE