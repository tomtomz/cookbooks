#
# Cookbook Name:: ssl_cert
# Library:: Helper
#
# Copyright 2016, whitestar
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

module ChefUtils
  # Helper methods.
  module Helper
    def chef_gem_package(pkg)
      pkg_ver = if node['chef_utils'][pkg].nil?
                  nil
                else
                  node['chef_utils'][pkg]['version']
                end

      resources(chef_gem: pkg) rescue chef_gem pkg do
        compile_time true if respond_to?(:compile_time)
        clear_sources node['chef_utils']['chef_gem']['clear_sources']
        source        node['chef_utils']['chef_gem']['source']
        options       node['chef_utils']['chef_gem']['options']
        version       pkg_ver
        action :install
      end
    end

    def chef_client_checksum
      pf = node['platform']
      pf_ver = node['platform_version']

      case node['chef_utils']['chef-client']['version']
=begin
      when ''
        case pf
        when 'debian'
          case #{pf_ver.to_i}
          when '8', '7', '6' then return ''
          end
        when 'ubuntu'
          case pf_ver
          when '16.04', '14.04', '12.04' then return ''
          end
        when 'rhel', 'centos', 'amazon', 'scientific', 'oracle'
          case #{pf_ver.to_i}
          when '7' then return ''
          when '6' then return ''
          when '5' then return ''
          end
        end
=end
      when '12.17.44'
        case pf
        when 'debian'
          case #{pf_ver.to_i}
          when '8', '7', '6' then return '37d6b52b83a8ce6f7686d10b6bb21fecc328f29d5d5709288fdd53e1897d2704'
          end
        when 'ubuntu'
          case pf_ver
          when '16.04', '14.04', '12.04' then return 'de5991b073fb22aa295fd0142f5e4ed3ca7da6ffe2c3fdcb01da29e4cdd0bd04'
          end
        when 'rhel', 'centos', 'amazon', 'scientific', 'oracle'
          case #{pf_ver.to_i}
          when '7' then return 'beccc11f5861bde369f62ca3fd7361b536786e91d73f538857e625a622f8caef'
          when '6' then return 'd2722da49d2039cfa5444f6fa3a820a3e3b9be8148a84524a5e814f0a69d9de3'
          when '5' then return '4c862fbeded6fe6602c50df705b43c3d7448df6c46524e7534450e0cbffd4415'
          end
        end
      when '12.16.42'
        case pf
        when 'debian'
          case #{pf_ver.to_i}
          when '8', '7', '6' then return 'e32f7e3d05e701d818c6dc26ad4b5b2d257335f009845937d9c0121407103871'
          end
        when 'ubuntu'
          case pf_ver
          when '16.04', '14.04', '12.04' then return '48e574a90ed653e1fcc3efacf89ad447273dece6b8c41f5376acebbb17909034'
          end
        when 'rhel', 'centos', 'amazon', 'scientific', 'oracle'
          case #{pf_ver.to_i}
          when '7' then return '4adf75a32f4b417d4c6c764ebb7a5f1c746075da3d3e9a23465ce75f2926d34e'
          when '6' then return 'bca097d9107bd4b20df88045b676a1d032b68a8b66bcf751dabc2e58715ae0ae'
          when '5' then return '74e49aaa70e20a4c656e19009533988a9a44eeaa5430657551c2120718572245'
          end
        end
      when '12.15.19'
        case pf
        when 'debian'
          case #{pf_ver.to_i}
          when '8', '7', '6' then return '4394c9373cc0911d2925324ceee884ee63056794654bb7d0b4a494a2481429c6'
          end
        when 'ubuntu'
          case pf_ver
          when '16.04', '14.04', '12.04' then return '7073541beb4294c994d4035a49afcf06ab45b3b3933b98a65b8059b7591df6b8'
          end
        when 'rhel', 'centos', 'amazon', 'scientific', 'oracle'
          case #{pf_ver.to_i}
          when '7' then return '66a514699bddd3f507a3b80b687cd71079a09e2aa01fa8111bee7f06a95c44c7'
          when '6' then return '10407373c4bd03362b960366696d1072d725319b7e10e82c08829ad87ad4eec8'
          when '5' then return 'e5e4be4059d0fdafdce0bc5c6d738e0b89f5790785c920c5d0d288dff0bb7ba7'
          end
        end
      when '12.14.89'
        case pf
        when 'debian'
          case #{pf_ver.to_i}
          when '8', '7', '6' then return 'cdc4933fe5593c32b5c8d95038ea2379af94c3ed504b5b3dce835725e7204b6e'
          end
        when 'ubuntu'
          case pf_ver
          when '14.04', '12.04' then return '22bb016e2b5dc669e4bd46cf49ed954ad09f4bc29ff0524606ec03e25d564951'
          end
        when 'rhel', 'centos', 'amazon', 'scientific', 'oracle'
          case #{pf_ver.to_i}
          when '7' then return 'f2a49e0755d260dadb995dc70afd4571edaefb6a79ff3564819046446383392c'
          when '6' then return '63993b9f93d56b9fa4fd4258cdb0ba473397e4cc2fc9d2047099df8552864fa3'
          when '5' then return '9055826bf106e6c2ea28352d9ab1034f47d35cddb69e825a1dc7e3d6d085d656'
          end
        end
      when '12.13.37'
        case pf
        when 'debian'
          case #{pf_ver.to_i}
          when '8', '7', '6' then return '42743b9d982e9d97806669d7c4e30557174cdbd648073bc52bedaad55e84ce25'
          end
        when 'ubuntu'
          case pf_ver
          when '14.04', '12.04' then return '973c2bc9a84822158ba7c0c360d0a25c97420f293ccbe5d8019615a411460785'
          end
        when 'rhel', 'centos', 'amazon', 'scientific', 'oracle'
          case #{pf_ver.to_i}
          when '7' then return '99beef40d6574e5a1e37e166b812dc80399c77cd42f239d79f4103591dcc4898'
          when '6' then return '16d908e3d25ec99e4d3abbc080f050c902467de2b481ec226b5e10ccd7062152'
          when '5' then return 'afc8e0f4c60055cf08ab3914c6ae25e183e234e7efcfa81080339e2986a97e0e'
          end
        end
      when '12.12.15'
        case pf
        when 'debian'
          case #{pf_ver.to_i}
          when '8', '7', '6' then return 'aac21d07740f65486f35a23da9a28e0dc003f42f62050108a9a3857fd58dd401'
          end
        when 'ubuntu'
          case pf_ver
          when '14.04', '12.04' then return 'd64a029bc5402e2c2e2e1ad479e8b49b3dc7599a9d50ea3cefe4149b070582be'
          end
        when 'rhel', 'centos', 'amazon', 'scientific', 'oracle'
          case #{pf_ver.to_i}
          when '7' then return 'ce1f216242f26d7274c108a9cb9d8add7095727e039bac968de9291f56a90c25'
          when '6' then return '9c6455bd30568c639e19485837bacbd07972c8e9f5cc3831fba4bc415bed24ad'
          when '5' then return 'eb97c91b44a3f71ff9bf7aad56948c6e38c3f52b177695d1b0488eeeb20ee86c'
          end
        end
      when '12.11.18'
        case pf
        when 'debian'
          case #{pf_ver.to_i}
          when '8', '7', '6' then return 'a79378be1c0eeed548fbd19fef0f1a1af25b70abf1db1b4ea1a40a90a0bafa31'
          end
        when 'ubuntu'
          case pf_ver
          when '14.04', '12.04' then return 'f1cf5d0f6dd12d2d2296ec6d8dbb16363f8541f5c15298cafa70e65ff2b5a22f'
          end
        when 'rhel', 'centos', 'amazon', 'scientific', 'oracle'
          case #{pf_ver.to_i}
          when '7' then return 'a5d5db51eb57cdb0045953f4007f10bf50199c40c0d89c41272cf171d56b6c53'
          when '6' then return 'e51559dc7747c03b446f9d1a3cdbb122f274352ba0ed7dd8fdac41e10514b9e2'
          when '5' then return '13be875c134e8463185883ad84020f37f1c68021d83ddc4d39b2f13e583a4f84'
          end
        end
      when '12.10.24'
        case pf
        when 'debian'
          case #{pf_ver.to_i}
          when '8', '7', '6' then return 'ede5b0c5fcaf72685f6d701f23502fe35257ebd7aafcc3e692b9e16c8573a532'
          end
        when 'ubuntu'
          case pf_ver
          when '14.04', '12.04', '10.04' then return '663d6c42c90bbb9463bc02a7c5d777f7aa6ebd52c071a0c1963bc8c4db76dea2'
          end
        when 'rhel', 'centos', 'amazon', 'scientific', 'oracle'
          case #{pf_ver.to_i}
          when '7' then return '6f00c7bdf96a3fb09494e51cd44f4c2e5696accd356fc6dc1175d49ad06fa39f'
          when '6' then return '445b64e38827d8c787267bda57d2cd6be797b6f6f70eb34ec846eceee8f6fae9'
          when '5' then return 'd210623933edd6d13491862dfdba21f1613c27ebf6847740904409acfc925e2a'
          end
        end
=begin
      when ''
        case pf
        when 'debian'
          case #{pf_ver.to_i}
          when '8', '7', '6' then return ''
          end
        when 'ubuntu'
          case pf_ver
          when '16.04', '14.04', '12.04' then return ''
          end
        when 'rhel', 'centos', 'amazon', 'scientific', 'oracle'
          case #{pf_ver.to_i}
          when '7' then return ''
          when '6' then return ''
          when '5' then return ''
          end
        end
=end
        return nil
      end
    end
  end
end
