#!/usr/bin/env bash

rpm_dir=~/rpmbuild/RPMS/x86_64

pb_username=admin
pb_password=RPM_REPO_PASSWORD
pb_server=http://10.20.5.60:8081/repository/centos-nexus
pb_url=7/nexus/x86_64/Packages


# $1 文件名
publish_file(){
  curl -v --user "$pb_username:$pb_password" --upload-file $rpm_dir/$1 $pb_server/$pb_url/$1
}


for rpm_file in `ls $rpm_dir`; do
  echo "开始发布$rpm_file"
  publish_file $rpm_file
done

