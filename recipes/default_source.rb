#
# Cookbook Name:: yum_dag
# Recipe:: default_source
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe "yum_dag::seed_packages"
include_recipe "yum_dag::create_repo"
include_recipe "yum_dag::enable_downstreams"