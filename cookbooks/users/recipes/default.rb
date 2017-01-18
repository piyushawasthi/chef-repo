#
# Cookbook:: users
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Add Database helper
# userpasswd = data_bag_item('user_password', 'testuser_2')

# Load data by Vault

# Add chef-vault gem
chef_gem 'chef-vault' do	
	compile_time true if respond_to?(:compile_time)
end

# Require Gem

require 'chef-vault'

# Load data by chef-vault

userpasswd = ChefVault::Item.load('user_password', 'testuser_2')


user userpasswd['id']	do
	comment "testuser_2 created"
	uid	2000
	home '/home/testuser_2'
	shell '/bin/bash'
	password userpasswd['password'] #openssl passwd -1 -salt bacon testuser2
end


file '/tmp/sys_details.txt.erb' do
  content 'Name=> '+ node['hostname'] + ', IP =>' + node['ipaddress']
  mode '0755'
  owner userpasswd['id']
end

template '/tmp/sys_details_2' do
  source 'sys_details.erb'
  mode '0755'
  owner userpasswd['id']
end