net_cidr="192.168.0/22"
mount_dir="/home/nfs"
ip="192.168.0.2"
yum -y install nfs nfs-utils 
mkdir -p ${mount_dir}
chown -R nfsnobody.nfsnobody ${mount_dir}
echo "${mount_dir}  ${net_cidr}(rw,async)" > /etc/exports
systemctl start nfs
mount -t nfs ${ip}:${mount_dir} ${mount_dir}


echo "-----查看设置情况:"
echo "1. 查看nfs服务:"
systemctl status nfsnobody
echo "2. 查看目录挂载:"
mount -l |grep nfsd
echo "3. 查看挂载目录权限:"
cd ${mount_dir}
cd ../
ls -lh .
