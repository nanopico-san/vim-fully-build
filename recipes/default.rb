#
# Cookbook Name:: vim-fully-build
# Recipe:: default
#
# Copyright (c) 2016 ᑎɑղօԹíϲօ(nanopico)
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package 'Install required packages' do
  package_name %w(
    git
    gettext
    libncurses5-dev
    libacl1-dev
    libgpm-dev
    libxmu-dev
    libgtk2.0-dev
    libxpm-dev
    libperl-dev
    python-dev
    python3-dev
    ruby-dev
    lua5.2
    liblua5.2-dev
    lua5.3
    liblua5.3-dev
    luajit
    libluajit-5.1-2
    libluajit-5.1-common
    libluajit-5.1-dev
    autoconf
    automake 
    cproto
    )
  action :install
end

directory node['vim-fully-build']['source-directory'] do
  owner  node['vim-fully-build']['user']
  group  node['vim-fully-build']['group']
  mode   '0755'
  action :create
  not_if { File.exist? node['vim-fully-build']['source-directory'] }
end

git "#{node['vim-fully-build']['source-directory']}/vim" do
  repository "https://github.com/vim/vim.git"
  revision   'master'
  action     :sync
end

execute 'Build the vim' do
  cwd     "#{node['vim-fully-build']['source-directory']}/vim"
  command <<-EOC
    ./configure --with-features=huge --enable-gui=gtk2 --enable-multibyte --enable-xim --enable-fontset --enable-perlinterp --enable-pythoninterp --enable-python3interp --enable-rubyinterp --enable-luainterp --with-luajit --prefix=#{node['vim-fully-build']['prefix']} --enable-fail-if-missing
    make
  EOC
  user   node['vim-fully-build']['user']
  group  node['vim-fully-build']['group']
end

execute 'install the vim' do
  cwd     "#{node['vim-fully-build']['source-directory']}/vim"
  command 'make install'
  user    'root'
  group   'root'
end