#
# Cookbook Name:: dev
# Recipe:: git
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

header = "### Generate by Chef. DO NOT EDIT! ###"

templatedir = "#{node.dev.home}/.git_template"

template "#{node.dev.home}/.gitconfig" do
  mode '0600'
  source 'gitconfig.erb'
  variables({
    :header => header,
    :templatedir => templatedir
  })
end

[ templatedir, "#{templatedir}/hooks"].each do |path|
  directory path do
      mode '0700'
  end
end

template "#{templatedir}/hooks/ctags" do
  mode '0700'
  source 'ctags.erb'
end

template "#{templatedir}/hooks/cscope" do
  mode '0700'
  source 'cscope.erb'
end

['post-commit', 'post-merge', 'post-checkout'].each do |name|
  template "#{templatedir}/hooks/#{name}" do
    mode '0700'
    source 'hook'
  end
end

template "#{templatedir}/hooks/pre-commit" do
  mode '0700'
  source 'pre-commit.erb'
end
