# verify
- verify 128 nfs threads running in the jail
  - procstat -kka | grep nfsd | wc
- check if du -kh generates huge amount of metadata reads
- check if du- kh generated a bursty traffic
- check if metadata reads come under the allocated IOPS
- check if metadata reads does not impact other volumes i.e. other volumes should not experience throttling
  
