#
# Cookbook Name:: dev
# Recipe:: git
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

header = "### Generate by Chef. DO NOT EDIT! ###"

templatedir = "#{node.home}/.git_template"

template "#{node.home}/.gitconfig" do
  owner node.current_user
  group node.current_user
  mode '0600'
  source 'gitconfig.erb'
  variables({
    :header => header,
    :templatedir => templatedir
  })
end

[ templatedir, "#{templatedir}/hooks"].each do |path|
  directory path do
      owner node.current_user
      group node.current_user
      mode '0700'
  end
end

template "#{templatedir}/hooks/ctags" do
  owner node.current_user
  group node.current_user
  mode '0700'
  source 'ctags.erb'
end

template "#{templatedir}/hooks/cscope" do
  owner node.current_user
  group node.current_user
  mode '0700'
  source 'cscope.erb'
end

['post-commit', 'post-merge', 'post-checkout'].each do |name|
  template "#{templatedir}/hooks/#{name}" do
    owner node.current_user
    group node.current_user
    mode '0700'
    source 'hook'
  end
end

template "#{templatedir}/hooks/pre-commit" do
  owner node.current_user
  group node.current_user
  mode '0700'
  source 'pre-commit.erb'
end
