#
# Author:: Stephen Lauck <lauck@opscode.com>
# Author:: Mauricio Silva <msilva@exacttarget.com>
#
# Cookbook Name:: pipeline
# Recipe:: default
#
# Copyright 2013, Exact Target
# Copyright 2013, Opscode, Inc.
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

%w{
  # see .kitchen.yml for usage
}.each { |recipe_name| include_recipe recipe_name }








