#
# Cookbook Name:: dev
# Recipe:: tmux
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

header = "### Generate by Chef. DO NOT EDIT! ###"

template "#{node.home}/.tmux.conf" do
  owner node.current_user
  group node.current_user
  mode '0600'
  source 'tmux.conf.erb'
  variables({
    :header => header
  })
end
