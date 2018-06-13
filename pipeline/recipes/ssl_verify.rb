#
# Cookbook Name:: pipeline
# Recipe:: berkshelf
#
# Copyright 2014, Stephen Lauck <lauck@getchef.com>
# Copyright 2014, Chef, Inc.
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


# manage ssl errors if needed or on proxy

# create berkshelf
directory "#{node['jenkins']['master']['home']}/.berkshelf" do
  owner node['jenkins']['master']['user']
  group node['jenkins']['master']['group']
  mode 0755
end

file "#{node['jenkins']['master']['home']}/.berkshelf/config.json" do
 content <<-EOD
   {"ssl":{"verify": false }}
 EOD
  owner node['jenkins']['master']['user']
  group node['jenkins']['master']['user']
end

file "#{node['jenkins']['master']['home']}/.gitconfig" do
  content <<-EOD
  [http]
        sslVerify = false 
  EOD
  owner node['jenkins']['master']['user']
  group node['jenkins']['master']['user']
end