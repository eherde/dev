#
# Cookbook Name:: dev
# Recipe:: zsh
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

header = "### Generate by Chef. DO NOT EDIT! ###"

template "#{node.dev.home}/.zshrc" do
  mode '0600'
  source 'zshrc.erb'
  variables({
    :header => header
  })
end

template "#{node.dev.home}/.aliases" do
  mode '0600'
  source 'aliases.erb'
  variables({
    :header => header
  })
end

template "#{node.dev.home}/.envrc" do
  mode '0600'
  source 'envrc.erb'
  variables({
    :header => header
  })
end
