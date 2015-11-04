#
# Cookbook Name:: gaurun
# Recipe:: source
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "golang::default"

version = node["gaurun"]["version"]
version_info = node["gaurun"]["versions"][version]

user_name = node["gaurun"]["user"]
group_name = node["gaurun"]["group"]
user_home = node["gaurun"]["user_home"]

install_prefix = node["gaurun"]["install_prefix"]
install_directory = "#{install_prefix}/gaurun"

user user_name do
    "comment" 'Push server made by Mercari, Inc.'
    home node['gaurun']['user_home']
    shell '/bin/bash'
end

directory user_home do
    recursive true
    action :create
    owner user_name
    group user_name
    mode 0755
end

group group_name do
    members user_name
    append true
end

directory install_directory do
    recursive true
    action :create
    owner user_name
    group user_name
    mode 0755
end

tar_name = "#{install_directory}/gaurun-#{version}.tar.gz"
dir_name = "#{install_directory}/gaurun-#{version}"
remote_file tar_name do
    source version_info["url"]
    checksum version_info["checksum"]
    owner user_name
    group group_name
    mode 0755
    action :create
end

execute "untar gaurun" do
    command "tar xvf #{tar_name} -C #{install_directory}"
    action :run
    user user_name
    group group_name
    creates dir_name
end

directory node["gaurun"]["conf_dir"] do
    action :create
    recursive true
    owner "root"
    group "root"
    mode 0755
end

template node["gaurun"]["conf_file"] do
    source "gaurun.toml.erb"
    owner "root"
    group "root"
    mode 0644
    variables node["gaurun"]["config"]
end

bash "install gaurun" do
    code <<EOS
        source /etc/profile
        cd #{dir_name}
        make gom
        make bundle
        make
EOS
    user "root"
    creates "#{dir_name}/bin/gaurun"
end

template node["gaurun"]["init_file"] do
    source "gaurun.sh.erb"
    owner "root"
    group "root"
    mode 755
    variables node["gaurun"]
end

link "/etc/rc3.d/S99gaurun" do
    to node["gaurun"]["init_file"]
end
