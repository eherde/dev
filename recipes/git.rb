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

template "#{templatedir}/hooks/ctags" do
  owner node[:user]
  group node[:user]
  mode '0700'
  source 'ctags.erb'
end

template "#{templatedir}/hooks/cscope" do
  owner node[:user]
  group node[:user]
  mode '0700'
  source 'cscope.erb'
end

['post-commit', 'post-merge', 'post-checkout'].each do |name|
  template "#{templatedir}/hooks/#{name}" do
    owner node[:user]
    group node[:user]
    mode '0700'
    source 'hook'
  end
end

template "#{templatedir}/hooks/pre-commit" do
  owner node[:user]
  group node[:user]
  mode '0700'
  source 'pre-commit.erb'
end
