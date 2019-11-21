#
# Cookbook Name:: mydocker
# Recipe:: default
#
# Copyright (c) 2019 The Authors, All Rights Reserved.

docker_image 'nginx' do
  tag 'latest'
  action :pull_if_missing
end

remote_directory "/root/files/nginx" do
   source "nginx"
   action 'create'
end


# Run container exposing ports
docker_container 'nginx' do
  repo 'nginx'
  tag 'latest'
  port '80:80'
  volumes [ '/root/files/nginx:/etc/nginx' ]
  action :run_if_missing
end

docker_container 'nodejs' do
  repo 'simplifi_olawale/nodejs'
  port '3000:3000'
  action :run_if_missing
end
