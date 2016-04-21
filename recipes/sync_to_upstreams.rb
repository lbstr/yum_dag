#
# Cookbook Name:: yum_dag
# Recipe:: sync_to_upstreams
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

if !node['yum_dag'] || !node['yum_dag']['upstreams']
  puts "No upstreams declared - exiting sync_to_upstreams recipe."
  return
end

node['yum_dag']['upstreams'].each do |upstream|
  bash "reposync to #{upstream.repoid}" do
    code "reposync -r #{upstream.repoid} -p #{node['yum_dag']['local_repo']['location']} --norepopath"
  end
end