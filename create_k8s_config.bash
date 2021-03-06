#!/bin/bash
a=$(for i in {0..8}; do dig controller-$i.borg.trek | grep 192.168.180 | grep -Eo -e '(^[^\.]+)' -e '(192\.168\.180\.[0-9]+)' | tr '\n' ' ';echo ; done | grep -E '.+' | tr ' ' ':'  | sed 's/:$/,/g' | tr -d '\n' | head -c-1)

apt-get -y install docker.io 
docker run --rm -v "$(pwd)":/mnt -e OS=ubuntu -e VERSION=1.16.2 -e CONTAINER_RUNTIME=docker -e CNI_PROVIDER=weave -e ETCD_INITIAL_CLUSTER="$a" -e ETCD_IP="%{::ipaddress_ens3}" -e KUBE_API_ADVERTISE_ADDRESS="%{::ipaddress_ens3}" -e INSTALL_DASHBOARD=true puppet/kubetool:5.0.0

cat Ubuntu.yaml >> hieradata/common.yaml
mkdir hieradata/nodes
for f in controller-*; do cat $f >> hieradata/nodes/$(basename $f .yaml).borg.trek.yaml;done

echo "REMEMBER TO PUT DATA IN site/profile/files/etc/kubernetes/cloud.conf"
echo "(hit ENTER when done)"
read

# uncomment k8s
sed -i '/.*/s/^#//' site/profile/manifests/kubernetes/worker.pp
sed -i '/.*/s/^#//' site/profile/manifests/kubernetes/controller.pp
