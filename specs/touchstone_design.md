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
- tt cbdpd status get --vsmip
- tt cbdpd jobs get --vsmip
- tt cbdpd jobs get --sdset --vsmip
- tt cbdpd bkp_ip get --jobid --vsmip
- tt cbdpd bkp_dest get --jobid --vsmip
- tt cbdpd ping_bkp_ip get --jobid --vsmip
- tt cbdpd compare_snaps get --jobid --vsmip
- tt cbdpd job_status get --jobid --vsmip
- tt cbdpd is_job_lagging get --jobid --vsmip
- tt cbdpd is_job_pending get --jobid --vsmip
- tt cbdpd is_job_failed get --jobid --vsmip
- tt cbdpd is_job_uptodate get --jobid --vsmip
- tt vsm jid get --vsmip
- tt bkpd status get --bkpip
- tt cbdpd error_log get --jobid --vsmip
- tt cbdpd error_log get --vsmip
- tt bkpd error_log get
