# design

#### what can be inside the touchstone project:
- scripts based on categories:
  - verify, 
  - run, 
  - patch, 
  - env

#### output of verify functions
- success -> fix is working or not_a_bug
- failure -> bug is reproduced or regression_fail

#### functions for verify
- filter_active_cbdpd_by_ip
- filter_cbdpd_instances_by_ip
- filter_cbdpd_instances_by_src_dset
- filter_cbdpd_instances_by_ip_and_src_dset
- filter_bkp_ip_by_instance_id
- filter_bkp_dest_by_instance_id
- is_ping_to_bkp_ip
- compare_snaps_at_cbdpd_bkpd
- get_status_of_cbdpd_instance
- is_cbdpd_instance_lagging
- is_cbdpd_instance_run_pending
- is_cbdpd_instance_failed
- is_cbdpd_instance_uptodate
- filter_jail_by_ip
- filter_active_bkpd_by_bkp_ip
- filter_cbdpd_error_log_by_ip
