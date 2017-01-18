#
# Cookbook Name:: chef-user
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
user 'test_msys' do
  comment 'Creating a test user'
  uid '1234'
  home '/home/random'
  shell '/bin/bash'
  password '$1$e4/fE.66$lGzBls.ooTbmi0nnhxhMF.' #openssl passwd -1 "testuser"
end