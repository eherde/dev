#
# Cookbook Name:: dev
# Recipe:: tmux
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

header = "### Generate by Chef. DO NOT EDIT! ###"

home = node['etc']['passwd'][node[:user]]['dir']

template "#{home}/.tmux.conf" do
  owner node[:user]
  group node[:user]
  mode '0600'
  source 'tmux.conf.erb'
  variables({
    :header => header
  })
end
