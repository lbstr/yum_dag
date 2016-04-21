#
# Cookbook Name:: yum_dag
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe "yum_dag::remove_other_upstreams"
include_recipe "yum_dag::add_upstreams"
include_recipe "yum_dag::sync_to_upstreams"
include_recipe "yum_dag::create_repo"
include_recipe "yum_dag::enable_downstreams"