# package_set chef cookbook

Installs extra packages that don't warrant their own cookbook (tree, htop,
colordiff and so on), yet still provides visibility, dev-vs-production
tradeoffs, and fine-grained version control where necessary.

## Overview

All but the most hermetic production machines benefit from certain base
packages -- git, htop, libxml, etc -- be present. Creating a stupid one-line
cookbook for each is overkill and clutters your runlist. Having a fixed
'big_dumping_ground_for_packages' is a proven disaster -- one coder's
convenience gems is anothers' bundler hell.

Package sets provide
* visibility: I know *exactly* which miscellaneous packages are installed
* package sets are repeatable and match the machine's purpose: dev boxes get a
  variety of kitchen sinks, production boxes get only bare essentials.
* Fine-grained control over versions, and ability to knock out a conflicting
  package.
  
### Choosing package sets

The package_sets attribute group defines what package sets to install, and the
contents of those package sets.

Choose the package sets to install by setting `node[:package_sets][:install]`. The
default is

    default[:package_sets][:install] = %w[ base dev sysadmin ]

Targets for `package` resource go in `node[:package_sets][:pkgs][{set_name}]`,
targets for `gem_package` go in `node[:package_sets][:gems][{set_name}]`, and so
forth. For instance, the 'base' group is defined as

    default[:package_sets][:pkgs][:base] = %w[ tree git zip openssl ]
    default[:package_sets][:gems][:base] = %w[ bundler rake ]

In your clusters file or a role, you can both specify which sets (if any) the
machine installs, and modify (for that node or role only) what packages are
in any given group.

Defining package_sets is distributed -- anything can define a 'foo' group by
setting `node[:package_sets][:pkgs][:foo]`, no need to modify this
cookbook. Selecting *which* packages to install is however unambiguous -- you
must expressly add the set 'foo' to your node[:package_sets][:install] attribute.

## Attributes

* `[:package_sets][:install]`             - 
* `[:package_sets][:pkgs][:base]`         - 
* `[:package_sets][:pkgs][:dev]`          - 
* `[:package_sets][:pkgs][:sysadmin]`     - 
* `[:package_sets][:pkgs][:text]`         - 
* `[:package_sets][:pkgs][:ec2]`          - 
* `[:package_sets][:pkgs][:vagrant]`      - 
* `[:package_sets][:pkgs][:python]`       - 
* `[:package_sets][:pkgs][:datatools]`    - 
* `[:package_sets][:pkgs][:emacs]`        - 
* `[:package_sets][:gems][:base]`         - 
* `[:package_sets][:gems][:dev]`          - 
* `[:package_sets][:gems][:sysadmin]`     - 
* `[:package_sets][:gems][:text]`         - 
* `[:package_sets][:gems][:ec2]`          - 
* `[:package_sets][:gems][:vagrant]`      - 

## Recipes 

* `default`                  - Base configuration for package_set
## Integration

Supports platforms: debian and ubuntu



## License and Author

Author::                Philip (flip) Kromer - Infochimps, Inc (<coders@infochimps.com>)
Copyright::             2011, Philip (flip) Kromer - Infochimps, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

> readme generated by [cluster_chef](http://github.com/infochimps/cluster_chef)'s cookbook_munger
