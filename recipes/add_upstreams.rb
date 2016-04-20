#
# Cookbook Name:: yum_dag
# Recipe:: add_upstreams
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

if !node['yum_dag'] || !node['yum_dag']['upstreams']
  puts "No upstreams declared - exiting add_upstreams recipe."
  return
end

node['yum_dag']['upstreams'].each do |upstream|
  yum_repository upstream.repoid do
    baseurl       upstream.baseurl
    description   upstream.description || upstream.repoid
    enabled       true
    gpgcheck      false
    action        :create
  end
end