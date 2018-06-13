name             'networking-basic'
maintainer       'Sean M. Sullivan'
maintainer_email 'sean@pulselocker.com'
license          'Apache-2.0'
description      'Install Basic Networking Tools and Utilities on Debian, Centos RedHat and Ubuntu.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'
issues_url       'https://github.com/arktos65/networking-basic/issues' if respond_to?(:issues_url)
source_url       'https://github.com/arktos65/networking-basic' if respond_to?(:source_url)
supports         'ubuntu', '>= 14.04'
chef_version     '~> 12'

%w{ ubuntu debian centos redhat }.each do |os|
  supports os
end

depends 'apt'
