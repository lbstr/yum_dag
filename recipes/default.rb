#
# Cookbook Name:: yum_dag
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe "yum_dag::remove_other_repos"
include_recipe "yum_dag::add_upstreams"