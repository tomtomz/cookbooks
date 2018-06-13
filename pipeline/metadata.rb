name             'pipeline'
maintainer       "Stephen Lauck"
maintainer_email "lauck@getchef.com"
license          'All rights reserved'
description      'Installs/Configures a Jenkins based chef delivery pipeline'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.3.0'

%w{ apt yum git java jenkins chef-zero emacs sudo chef-dk }.each do |cb|
  depends cb
end
