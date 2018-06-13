CHANGELOG for chef_utils
=========================

0.8.5
-----
- refactoring.

0.8.4
-----
- adds ARM architecture support.

0.8.3
-----
- includes the `ssl_cert::server_key_pairs` recipe in the `chef_utils::chef-server-configuration` recipe automatically.
- adds a guard property for ARM architecture to the `chef-client` recipe.

0.8.2
-----
- adds the Concourse pipeline configuration.
- adds the Chef version pinning feature for the Debian family.

0.8.1
-----
- adds the SSL server key pair's deployment feature for a Chef Server.

0.8.0
-----
- adds the `chef_utils::chef-client` recipe.

0.7.0
-----
- Cleanup for FoodCritic and RuboCop.
- adds the `chef_utils::chef-gem-packages` recipe.
- adds the `chef_utils::knife-supermarket` recipe.

0.6.1
-----
- adds some attributes to the `chef_utils::chef-vault` recipe.

0.6.0
-----
- adds the `chef_utils::chef-server-configuration` recipe.

0.1.0
-----
- Initial release of chef_utils

