#
# Cookbook Name:: mydocker
# Recipe:: default
#
# Copyright (c) 2019 The Authors, All Rights Reserved.
#docker_service 'default' do
#  action [:create, :start]
#end

docker_image 'nginx' do
  tag 'latest'
#  action :pull
  action :pull_if_missing
end

remote_directory "/root/files/nginx" do
   source "nginx"
   action 'create'
end

#docker_image 'simplifi_olawale/nodejs' do
#  tag 'latest'
#  action :pull
#end

#docker_image 'docker.io/syncano/nodejs' do
#  tag 'alpine'
#  action :pull
#end
# Run container exposing ports
docker_container 'nginx' do
  repo 'nginx'
  tag 'latest'
  port '80:80'
  volumes [ '/root/files/nginx:/etc/nginx' ]
  action :run_if_missing
#  subscribes :redeploy, 'docker_image[nginx]'
end

docker_container 'nodejs' do
  repo 'simplifi_olawale/nodejs'
#  tag 'node:alpine'
  port '3000:3000'
#  binds [ '/nodejs:/etc/nginx/conf.d' ]
#  subscribes :redeploy, 'docker_image[nginx]'
  action :run_if_missing
end

#docker_container 'node' do
#  repo 'node'
#  tag 'alpine'
#  port '8070:8080'
#  binds [ '/root/chef-repo/cookbooks/mydocker/files/nginx:/etc/nginx/conf.d' ]
#  subscribes :redeploy, 'docker_image[nginx]'
#end


#template '/default.conf' do
#  source 'default.erb'
#  owner 'root'
#  group 'root'
#  mode '0755'
#end

#remote_directory "/root/files/nginx" do
#   source "nginx"
#   action 'create'
#end


#template '/nodejs' do
#  source 'nodejs.erb'
#  owner 'root'
#  group 'root'
#  mode '0755'
#end
