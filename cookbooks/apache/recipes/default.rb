#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2017, MSys
#
# All rights reserved - Do Not Redistribute
#

package	'apache2'	do
	action :install
end

cookbook_file 'var/www/html/index.html' do
	source 'index.html'
end

service 'apache2' do
	action [:start, :enable]	
end
