#!/bin/bash

# create new passwords for all hiera keys ending with 'password'
while read -r entry
do
  filename=$(echo "$entry" | cut -d ':' -f1)
  key=$(echo "$entry" | cut -d ':' -f1 --complement)
  blank_key=$(echo "$key" | grep -oE '^.*password:')
  sed -i -E "s/($blank_key).*/\1 $(pwgen -s 16 1)/" "$filename"
done < <(grep -rH 'password:' hieradata/*)

# Create a passwordless keypair for root ssh
ssh-keygen -q -N '' -f /root/.ssh/id_rsa
echo "base_linux::root_ssh_key: $(cut -d ' ' -f 2 /root/.ssh/id_rsa.pub)" >> hieradata/common.yaml

## new CA (should join with Sensu setup above really) for ELK
## Be your own 'BORG CA', generate a private key:
#openssl genrsa -out borgca.key 2048
## generate a self signed certificate for the BORG CA:
#openssl req -new -x509 -days 7300 -subj '/O=BORG CA' -key borgca.key -out borgca.crt
#cp borgca.crt "$old_working_dir/site/profile/files/certs/cacert.pem"
## ELK KEYPAIR: create a certificate request:
#openssl req -nodes -new -subj '/CN=logs.borg.trek' -out logs.borg.trek.csr
## sign it with our Borg CA:
#openssl x509 -req -in logs.borg.trek.csr -CA borgca.crt -CAkey borgca.key -CAcreateserial -out logs.borg.trek.crt
#cp logs.borg.trek.crt "$old_working_dir/site/profile/files/certs/cert.pem"
## convert private key to pkcs8
#openssl pkcs8 -in privkey.pem -topk8 -nocrypt -out logs.borg.trek.p8
#echo 'profile::elk::key: |' >>  "$old_working_dir/hieradata/nodes/logs.borg.trek.yaml"
#sed -e 's/^/  /' logs.borg.trek.p8 >> "$old_working_dir/hieradata/nodes/logs.borg.trek.yaml"
## FILEBEAT KEYPAIR (should change use of manager hostname): create a certificate request:
#openssl req -nodes -new -subj '/CN=manager.borg.trek' -out manager.borg.trek.csr
## sign it with our Borg CA:
#openssl x509 -req -in manager.borg.trek.csr -CA borgca.crt -CAkey borgca.key -CAcreateserial -out manager.borg.trek.crt
#cp manager.borg.trek.crt "$old_working_dir/site/profile/files/certs/filebeat.cert.pem"
## convert private key to pkcs8
#openssl pkcs8 -in privkey.pem -topk8 -nocrypt -out manager.borg.trek.p8
#echo 'profile::filebeat::key: |' >>  "$old_working_dir/hieradata/common.yaml"
#sed -e 's/^/  /' manager.borg.trek.p8 >> "$old_working_dir/hieradata/common.yaml"
