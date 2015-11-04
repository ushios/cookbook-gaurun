#
# Cookbook Name:: gaurun
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
install_method = node["gaurun"]["install"]

case install_method
when "source" then
    include_recipe "gaurun::source"
else
end
