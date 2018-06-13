#
# Cookbook Name:: chef_utils
# Recipe:: chef-server-configuration
#
# Copyright 2015-2017, whitestar
#
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

force_override_config = node.force_override['chef_utils']['chef-server']['config']

if node['chef_utils']['chef-server']['with_ssl_cert_cookbook']
  include_recipe 'ssl_cert::server_key_pairs'
  ::Chef::Recipe.send(:include, SSLCert::Helper)
  cn = node['chef_utils']['chef-server']['ssl_cert']['common_name']
  force_override_config['nginx']['ssl_certificate'] = server_cert_path(cn)
  force_override_config['nginx']['ssl_certificate_key'] = server_key_path(cn)
end

template '/etc/opscode/chef-server.rb' do
  source  'etc/opscode/chef-server.rb'
  owner 'root'
  group 'root'
  mode '0640'
end
