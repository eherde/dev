#
# Cookbook Name:: dev
# Recipe:: vim
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

header = "\" Generated by Chef. DO NOT EDIT!"

template "#{node.dev.home}/.vimrc" do
  mode '0600'
  source 'vimrc.erb'
  variables({
    :header => header
  })
end

["#{node.dev.home}/.vim", "#{node.dev.home}/.vim/autoload", "#{node.dev.home}/.vim/bundle", "#{node.dev.home}/.vim/plugin"].each do |path|
  directory path do
    mode '0700'
  end
end

remote_file "#{node.dev.home}/.vim/autoload/pathogen.vim" do
  mode '0600'
  source 'https://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim'
end

git "#{node.dev.home}/.vim/bundle/vim-go" do
  repository "https://github.com/fatih/vim-go.git"
  action :export
end

remote_file "#{node.dev.home}/.vim/plugin/DoxygenToolkit.vim" do
  mode '0600'
  source 'http://www.vim.org/scripts/download_script.php?src_id=14064'
end

remote_file "#{node.dev.home}/.vim/plugin/fugitive.vim" do
  mode '0600'
  source 'https://github.com/tpope/vim-fugitive/raw/master/plugin/fugitive.vim'
end

remote_file "#{node.dev.home}/.vim/plugin/gcov.vim" do
  mode '0600'
  source 'http://www.vim.org/scripts/download_script.php?src_id=8141'
end

remote_file "#{node.dev.home}/.vim/plugin/cscope_maps.vim" do
  mode '0600'
  source 'http://cscope.sourceforge.net/cscope_maps.vim'
end

template "#{node.dev.home}/.vim/plugin/cscope_db.vim" do
  mode '0600'
  source 'cscope_db.vim.erb'
  variables({
    :header => header
  })
end
