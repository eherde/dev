#
# Cookbook Name:: dev
# Recipe:: git
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

header = "### Generate by Chef. DO NOT EDIT! ###"

home = node['etc']['passwd'][node[:user]]['dir']
templatedir = "#{home}/.git_template"

template "#{home}/.gitconfig" do
  owner node[:user]
  group node[:user]
  mode '0600'
  source 'gitconfig.erb'
  variables({
    :header => header,
    :templatedir => templatedir
  })
end

[ templatedir, "#{templatedir}/hooks"].each do |path|
  directory path do
      owner node[:user]
      group node[:user]
      mode '0700'
  end
end

template "#{templatedir}/hooks/pre-commit" do
  owner node[:user]
  group node[:user]
  mode '0700'
  source 'pre-commit.erb'
  variables({
    :header => header
  })
end

template "#{templatedir}/hooks/post-checkout" do
  owner node[:user]
  group node[:user]
  mode '0700'
  source 'post-checkout.erb'
  variables({
    :header => header
  })
end
