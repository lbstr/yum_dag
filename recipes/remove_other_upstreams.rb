#
# Cookbook Name:: yum_dag
# Recipe:: remove_other_upstreams
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

Dir.glob('/etc/yum.repos.d/*.repo') do |repo_file|
  # grab the repo_id from the file name
  repo_id = repo_file[/\/etc\/yum\.repos\.d\/(.*)\.repo/,1]

  # skip this iteration it is an upstream repo
  next if node['yum_dag'] && 
    node['yum_dag']['upstreams'] && 
    node['yum_dag']['upstreams'].any? { |upstream| upstream.repoid == repo_id }

  # skip this iteration it is the local repo
  next if ['yum_dag'] &&
    node['yum_dag']['local_repo'] &&
    node['yum_dag']['local_repo']['id'] == repo_id

  # delete the repo
  yum_repository repo_id do
    action :delete
  end
end