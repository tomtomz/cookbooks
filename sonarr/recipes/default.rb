user node[:sonarr][:user] do
  system true
  manage_home true
  home node[:sonarr][:home]
  shell '/bin/bash'
end

apt_repository 'sonarr' do
  uri node[:sonarr][:apt][:uri]
  distribution 'master'
  components %w(main)
  keyserver 'keyserver.ubuntu.com'
  key 'FDA5DFFC'
end

package 'nzbdrone'

case node['platform']
when 'ubuntu'
  if node['platform_version'].to_f >= 15.04
    template '/etc/systemd/system/sonarr.service' do
      source 'sonarr.service.erb'
      variables user: node[:sonarr][:user]
  end
  elsif node['platform_version'].to_f >= 12.04
    template '/etc/init/sonarr.conf' do
      source 'init.conf.erb'
      variables user: node[:sonarr][:user]
    end
  end
else
  template '/etc/init/sonarr.conf' do
    source 'init.conf.erb'
    variables user: node[:sonarr][:user]
  end
end

service 'sonarr'

directory ::File.join(node[:sonarr][:home], '.config') do
  user node[:sonarr][:user]
  group node[:sonarr][:user]
  recursive true
end

directory ::File.join(node[:sonarr][:home], '.config/NzbDrone') do
  user node[:sonarr][:user]
  group node[:sonarr][:user]
end

template ::File.join(node[:sonarr][:home], '.config/NzbDrone/config.xml') do
  source 'config.xml.erb'
  user node[:sonarr][:user]
  group node[:sonarr][:user]
  mode 0600
  variables settings: node[:sonarr][:settings]
  notifies :restart, 'service[sonarr]'
end
