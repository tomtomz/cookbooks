#
# Cookbook Name:: chef_utils
# Recipe:: chef-client
#
# Copyright 2016-2017, whitestar
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

::Chef::Recipe.send(:include, ChefUtils::Helper)

kernel_machine = node['kernel']['machine']

version = node['chef_utils']['chef-client']['version']
release_url = node['chef_utils']['chef-client']['release_url']
pkg_file = File.basename(release_url)
pkg_file_path = "#{Chef::Config['file_cache_path']}/#{pkg_file}"
file_checksum = node['chef_utils']['chef-client']['checksum']
file_checksum = chef_client_checksum if file_checksum.nil?
force_install = node['chef_utils']['chef-client']['force_install']
fallback_omnitruck_install = node['chef_utils']['chef-client']['fallback_omnitruck_install']
omnitruck_installer_url = node['chef_utils']['chef-client']['omnitruck_installer_url']
expected_version = "[ \"$(chef-client -v | awk '{ print $2 }')\" = '#{version}' ]"
status_file = '/tmp/install_chef-client_status'

# armv7l architecture
if kernel_machine == 'armv7l'
  Chef::Log.warn("This chef_utils::chef-client recipe installs Chef by the gem package on #{kernel_machine} architecture.")

  [
    'ruby-ffi',
    'ruby-ffi-yajl',
  ].each {|pkg|
    resources(package: pkg) rescue package pkg do
      action :install
    end
  }

  gem_package 'chef' do
    version version
    options('--no-rdoc --no-ri')
    action :nothing
  end

  log 'update chef-client at the very end of the chef-client run.' do
    notifies :install, 'gem_package[chef]', :delayed
  end

  return
end

# x86_64, i386 architecture

# Pinning chef version
template '/etc/apt/preferences.d/chef.pref' do
  source  'etc/apt/preferences.d/chef.pref'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    pkg_name: 'chef'
  )
  only_if { node['platform_family'] == 'debian' }
end

remote_file pkg_file_path do
  source release_url
  checksum file_checksum unless file_checksum.nil?
  not_if expected_version unless force_install
  ignore_failure true if fallback_omnitruck_install
end

install_command = nil
case node['platform_family']
when 'debian'
  install_command = "dpkg -i --force-downgrade #{pkg_file_path}; echo $? > #{status_file}"
when 'rhel'
  install_command = "rpm -Uvh --oldpackage #{pkg_file_path}; echo $? > #{status_file}"
end

log 'update chef-client at the very end of the chef-client run.' do
  notifies :run, 'execute[install_chef-client]', :delayed
end

execute 'install_chef-client' do
  user 'root'
  command install_command
  action :nothing
  not_if expected_version unless force_install
  if fallback_omnitruck_install
    ignore_failure true
    notifies :install, 'package[curl]', :immediately
    notifies :run, 'execute[install_chef-client_by_omnitruck_installer]', :delayed
  end
end

pkg = 'curl'
resources(package: pkg) rescue package pkg do
  action :nothing
end

execute 'install_chef-client_by_omnitruck_installer' do
  user 'root'
  command "curl -L #{omnitruck_installer_url} | bash -s -- -v #{version}"
  action :nothing
  not_if { kernel_machine.start_with?('arm') }
  not_if expected_version unless force_install
  not_if "[ \"$(cat #{status_file})\" = '0' ]"
end
