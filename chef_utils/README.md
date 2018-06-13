chef_utils Cookbook
===================

This cookbook contains setup recipes for Chef utilities and Knife plugins.

## Contents

- [Requirements](#requirements)
  - [packages](#packages)
- [Attributes](#attributes)
- [Usage](#usage)
  - [recipes](#recipes)
- [License and Authors](#license-and-authors)

## Requirements

### packages

- `build-essential` - to build native libraries for berkshelf.
- `ssl_cert`

## Attributes

|Key|Type|Description, example|Default|
|:--|:--|:--|:--|
|`['chef_utils']['chef_gem']['clear_sources']`|Boolean|chef_gem resource's clear_sources property.|`false`|
|`['chef_utils']['chef_gem']['source']`|String|chef_gem resource's source property.|`nil`|
|`['chef_utils']['chef_gem']['options']`|String|chef_gem resource's options property.|`nil`|
|`['chef_utils']['chef_gem_packages']`|Array|These packages are installed by the `chef-gem-packages` recipe.|`[]`|
|`['chef_utils']['bracecomp']['version']`|String|installation version.|`nil`|
|`['chef_utils']['chef-client']['version']`|String||`'12.17.44'`|
|`['chef_utils']['chef-client']['checksum']`|String|sha256 checksum of the release artifact.|`nil` (no check)|
|`['chef_utils']['chef-client']['force_install']`|String|(re)install forcely.|`false`|
|`['chef_utils']['chef-client']['release_url']`|String|This URL is build from the `node['chef_utils']['chef-client']['version']` automatically.|See `attributes/default.rb`|
|`['chef_utils']['chef-client']['fallback_omnitruck_install']`|String|If this is true, Chef will try to install it by the omnitruck install script, when direct package installation fails.|`false`|
|`['chef_utils']['chef-client']['omnitruck_installer_url']`|String||`'https://omnitruck.chef.io/install.sh'`|
|`['chef_utils']['chef-vault']['version']`|String|chef-vault installation version.|`'~> 2.6'`|
|`['chef_utils']['chefspec']['version']`|String|installation version.|`nil`|
|`['chef_utils']['knife-acl']['version']`|String|installation version.|`nil`|
|`['chef_utils']['knife-ec2']['version']`|String|installation version.|`nil`|
|`['chef_utils']['knife-eucalyptus']['version']`|String|installation version.|`nil`|
|`['chef_utils']['knife-openstack']['version']`|String|installation version.|`nil`|
|`['chef_utils']['knife-push']['version']`|String|installation version.|`nil`|
|`['chef_utils']['knife-reporting']['version']`|String|installation version.|`nil`|
|`['chef_utils']['knife-solo']['version']`|String|installation version.|`nil`|
|`['chef_utils']['knife-spec']['version']`|String|installation version.|`nil`|
|`['chef_utils']['knife-supermarket']['version']`|String|installation version.|`nil`|
|`['chef_utils']['knife-zero']['version']`|String|installation version.|`nil`|
|`['chef_utils']['spiceweasel']['version']`|String|installation version.|`nil`|
|`['chef_utils']['chef-server']['with_ssl_cert_cookbook']`|Boolean||`false`|
|`['chef_utils']['chef-server']['ssl_cert']['common_name']`|String||`node['fqdn']`|
|`['chef_utils']['chef-server']['config']`|Hash|Content in the `chef-server.rb`.|See `attributes/default.rb`.|
|`['chef_utils']['chef-server']['extra_config_str']`|String|Extra configuration string in the `chef-server.rb`.|`nil`|
|`['chef_utils']['chef-server']['configuration']`|String|DEPRECATED: instead use the `['chef_utils']['chef-server']['config']` and `['chef_utils']['chef-server']['extra_config_str']` attributes.|`nil`|

## Usage

### recipes
- `chef_utils::berkshelf` - Berkshelf gem installation. this is already included in the Chef DK.
- `chef_utils::bracecomp` - bracecomp gem installation.
- `chef_utils::chefspec` - chefspec gem installation. this is already included in the Chef DK.
- `chef_utils::chef-gem-packages` - bulk gem installation. packages must be listed in the `['chef_utils']['chef_gem_packages']` attribute (ver. 0.7.0 or later)
- `chef_utils::chef-server-configuration` - chef-server.rb configuration file deployment recipe. (ver. 0.6.0 or later)
- `chef_utils::chef-client` - chef-client self updater. (ver. 0.8.0 or later)
- `chef_utils::chef-vault` - chef-vault gem installation. this is already included in the Chef DK. (ver. 0.5.0 or later)
- `chef_utils::default` - same as bracecomp. 
- `chef_utils::knife-acl` - knife-acl plugin gem installation. (ver. 0.3.0 or later)
- `chef_utils::knife-ec2` - knife-ec2 plugin gem installation.
- `chef_utils::knife-eucalyptus` - knife-eucalyptus plugin gem installation.
- `chef_utils::knife-push` - knife-push plugin gem installation. this is already included in the Chef DK.
- `chef_utils::knife-reporting` - knife-reporting plugin gem installation.
- `chef_utils::knife-solo` - knife-solo plugin gem installation.
- `chef_utils::knife-spec` - knife-spec plugin gem installation.
- `chef_utils::knife-supermarket` - knife-supermarket plugin gem installation. Note: knife-supermarket feature has been moved into core Chef in versions greater than 12.11.18 and it is already included in the Chef DK. (ver. 0.7.0 or later)
- `chef_utils::knife-zero` - knife-zero plugin gem installation. (ver. 0.5.0 or later)
- `chef_utils::librarian-chef` - librarian-chef gem installation.
- `chef_utils::spiceweasel` - spiceweasel gem installation.

## License and Authors

- Author:: whitestar at osdn.jp

```text
Copyright 2013-2016, whitestar

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
