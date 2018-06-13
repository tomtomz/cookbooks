#
# Cookbook Name:: chef_utils
# Recipe:: berkshelf
#
# Copyright 2013-2016, whitestar
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

# ref. http://community.opscode.com/cookbooks/build-essential
node.set['build-essential']['compile_time'] = true
include_recipe 'build-essential'

# for nokogiri
dependent_packages = value_for_platform_family(
  'rhel' => [
    'libxslt-devel',
    'libxml2-devel',
  ],
  'debian' => [
    'libxslt-dev',
    'libxml2-dev',
  ]
)

dependent_packages.each {|pkg|
  package pkg do
    action :nothing
  end.run_action(:install)
}

chef_gem_package('berkshelf')
