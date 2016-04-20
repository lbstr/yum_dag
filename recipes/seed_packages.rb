#
# Cookbook Name:: yum_dag
# Recipe:: seed_packages
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# use repotrack to download a package and its dependencies
if node['yum_dag'] && node['yum_dag']['seed_packages'] && node['yum_dag']['seed_packages']['repotrack']
  node['yum_dag']['seed_packages']['repotrack'].each do |seed_package|
    bash "repotrack #{seed_package}" do
      # TODO: add guard
      code "repotrack -p #{node['yum_dag']['local_repo']['location']} -a x86_64 #{seed_package}"
    end
  end
end