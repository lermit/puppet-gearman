# Puppet module: gearman

This is a Puppet module for gearman based on the second generation layout ("NextGen") of Example42 Puppet Modules.

Made by Romain THERRAT / AddOnline

Based on Example42 rules

Made by Alessandro Franceschi / Lab42

Official site: http://www.example42.com

Official git repository: http://github.com/lermit/puppet-gearman

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.


## USAGE - Basic management

* Install gearman with default settings

        class { 'gearman': }

* Install a specific version of gearman package

        class { 'gearman':
          version => '1.0.1',
        }

* Disable gearman service.

        class { 'gearman':
          disable => true
        }

* Remove gearman package

        class { 'gearman':
          absent => true
        }

* Enable auditing without without making changes on existing gearman configuration *files*

        class { 'gearman':
          audit_only => true
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'gearman':
          noops => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file

        class { 'gearman':
          source => [ "puppet:///modules/example42/gearman/gearman.conf-${hostname}" , "puppet:///modules/example42/gearman/gearman.conf" ],
        }


* Use custom template for main config file. Note that template and source arguments are alternative.

        class { 'gearman':
          template => 'example42/gearman/gearman.conf.erb',
        }

* Automatically include a custom subclass

        class { 'gearman':
          my_class => 'example42::my_gearman',
        }


## USAGE - Example42 extensions management
* Activate puppi (recommended, but disabled by default)

        class { 'gearman':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands

        class { 'gearman':
          puppi        => true,
          puppi_helper => 'myhelper',
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'gearman':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'gearman':
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }


## CONTINUOUS TESTING

Travis {<img src="https://travis-ci.org/lermit/puppet-gearman.png?branch=master" alt="Build Status" />}[https://travis-ci.org/lermit/puppet-gearman]
