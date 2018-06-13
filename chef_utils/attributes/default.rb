#
# Cookbook Name:: chef_utils
# Attributes:: default
#
# Copyright 2015-2016, whitestar
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

pf = node['platform']
pf_ver = node['platform_version']
arch = node['kernel']['machine']
arch_alias = arch == 'x86_64' ? 'amd64' : arch

default['chef_utils']['chef_gem']['clear_sources'] = false
default['chef_utils']['chef_gem']['source'] = nil
default['chef_utils']['chef_gem']['options'] = nil
default['chef_utils']['chef_gem_packages'] = []
default['chef_utils']['bracecomp']['version'] = nil
default['chef_utils']['chef-client']['version'] = '12.21.26'
default['chef_utils']['chef-client']['checksum'] = nil  # no check
default['chef_utils']['chef-client']['force_install'] = false
chef_client_ver = node['chef_utils']['chef-client']['version']
rel_base_url = 'https://packages.chef.io/files/stable/chef'
default['chef_utils']['chef-client']['release_url'] = node.value_for_platform(
  'debian' => {
    'default' => "#{rel_base_url}/#{chef_client_ver}/#{pf}/#{pf_ver.to_i}/chef_#{chef_client_ver}-1_#{arch_alias}.deb",
  },
  'ubuntu' => {
    'default' => "#{rel_base_url}/#{chef_client_ver}/#{pf}/#{pf_ver}/chef_#{chef_client_ver}-1_#{arch_alias}.deb",
  },
  ['rhel', 'centos'] => {
    'default' => "#{rel_base_url}/#{chef_client_ver}/el/#{pf_ver.to_i}/chef-#{chef_client_ver}-1.el#{pf_ver.to_i}.#{arch}.rpm",
  }
)
default['chef_utils']['chef-client']['fallback_omnitruck_install'] = false
default['chef_utils']['chef-client']['omnitruck_installer_url'] = 'https://omnitruck.chef.io/install.sh'
default['chef_utils']['chef-vault']['version'] = '>= 2.6'
default['chef_utils']['chefspec']['version'] = nil
default['chef_utils']['knife-acl']['version'] = nil
default['chef_utils']['knife-ec2']['version'] = nil
default['chef_utils']['knife-eucalyptus']['version'] = nil
default['chef_utils']['knife-openstack']['version'] = nil
default['chef_utils']['knife-push']['version'] = nil
default['chef_utils']['knife-reporting']['version'] = nil
default['chef_utils']['knife-solo']['version'] = nil
default['chef_utils']['knife-spec']['version'] = nil
default['chef_utils']['knife-supermarket']['version'] = nil
default['chef_utils']['knife-zero']['version'] = nil
default['chef_utils']['spiceweasel']['version'] = nil

default['chef_utils']['chef-server']['with_ssl_cert_cookbook'] = false
default['chef_utils']['chef-server']['ssl_cert']['common_name'] = node['fqdn']
# /etc/opscode/chef-server.rb
default['chef_utils']['chef-server']['config'] = {
  #'default_orgname' => 'default',
  'addons' => {
    'install' => false,
  },
}
default['chef_utils']['chef-server']['extra_config_str'] = nil
# DEPRECATED: instead use the `['chef_utils']['chef-server']['config']`
# and `['chef_utils']['chef-server']['extra_config_str']` attributes.
default['chef_utils']['chef-server']['configuration'] = nil
