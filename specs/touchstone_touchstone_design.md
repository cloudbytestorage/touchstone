## design

#### functions of touchstone's touchstone project:
- NOTE: --apiver is an optional param that can be provided to all commands
- tt cbdpd status get --vsmip
- tt cbdpd jobs get --vsmip
- tt cbdpd jobs get --sdset 
- tt cbdpd jobs get --sdset --vsmip
- tt cbdpd bkp ip get --jobid --vsmip
- tt cbdpd bkp dest get --jobid --vsmip
- tt cbdpd ping bkp_ip get --jobid --vsmip
- tt cbdpd compare_snaps get --jobid --vsmip
- tt cbdpd job status get --jobid --vsmip
- tt cbdpd job is_lagging --jobid --vsmip
- tt cbdpd job is_pending --jobid --vsmip
- tt cbdpd job is_failed --jobid --vsmip
- tt cbdpd job is_uptodate --jobid --vsmip
- tt vsm jid get --vsmip
- tt vsm path get --vsmip
- tt bkpd status get --bkpip
- tt cbdpd log is_error --jobid --vsmip
- tt cbdpd log is_error --vsmip
- tt cbdpd log error get --jobid --vsmip
- tt cbdpd log error get --vsmip
- tt cbdpd log is_warning --vsmip
- tt cbdpd log is_warning --vsmip --jobid
- tt cbdpd log warning get --vsmip
- tt cbdpd log warning get --vsmip --jobid
- tt bkpd log error get
