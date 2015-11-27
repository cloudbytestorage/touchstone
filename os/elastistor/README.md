### ElastiStor

- is a namespace under os sub project of touchstone
- elastistor is a Freebsd 9.3 OS
  - The versions will vary. 
  - However touchstone project shall ensure an effective means for taking care of versions.
- will be a thin cli wrapper over various elastistor cli commands
- will use effective namespacing to make things easy for support folks to run various commands
- this will act as a single cli for all elastistor system/component needs

### Installing ESCLI

- Copy the elastistor folder to the Machine.
- Go to elastistor -> escli_setup_scripts
- Run "sh install_escli"

### Directories used for Installation of ESCLI

- /lib/escli : For library files.
- /man/man8 : For putting escli binary gunzip files.
- /sbin : For putting the main controller script,i.e; escli.