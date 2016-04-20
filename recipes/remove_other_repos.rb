#
# Cookbook Name:: yum_dag
# Recipe:: remove_other_repos
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

def is_remote?(repo_id)
  node['yum_dag'] && 
  node['yum_dag']['upstreams'] && 
  node['yum_dag']['upstreams'].any? { |upstream| upstream.repo_id == repo_id }
end

Dir.glob('/etc/yum.repos.d/*.repo') do |repo_file|
  # grab the repo_id from the file name
  repo_id = repo_file[/\/etc\/yum\.repos\.d\/(.*)\.repo/,1]

  # skip this iteration if the repo is one of our remotes
  next if is_remote?(repo_id)

  # delete the 
  yum_repository repo_id do
    action :delete
  end
end