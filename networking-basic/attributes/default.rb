#
# Cookbook Name:: networking-basic
# Attributes:: default
#
# Copyright (C) 2014-2017 Pulselocker, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node['platform']
when "debian","ubuntu"
  default['networking']['packages'] = %w[ lsof iptables jwhois whois curl wget rsync jnettop nmap traceroute ethtool iproute iputils-ping netcat-openbsd tcptraceroute tcputils tcpdump elinks lynx ]
when "redhat","centos","scientific","amazon"
  default['networking']['packages'] = %w[ lsof iptables jwhois curl wget rsync nmap traceroute ethtool iproute iputils nc tcputils tcpdump elinks lynx ]
end
