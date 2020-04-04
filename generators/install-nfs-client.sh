helm install  nfs-client stable/nfs-client-provisioner \
  --set nfs.server=pif1ab.192.168.68.134.nip.io \
  --set nfs.path=/mnt/disk01 