# = Class: gearman
#
# This is the main gearman class
#
#
# == Parameters
#
# Specific parameters
#
# [*backlog*]
# Number of backlog connections for listen.
#
# [*file_descriptors*]
# Number of file descriptors to allow for the process.
# Default is max allowed for user.
#
# [*threads*]
# Number of I/O threads to use. Default=4.
#
# [*job_retries*]
# Number of attempts to run the job before the job server removes it.
# Thisis helpful to ensure a bad job does not crash all available workers.
# Default is no limit.
#
# [*round_robin*]
# Assign work in round-robin order per workerconnection. The default is to
# assign work in the order of functions added by the worker
# Default : no
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, gearman class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $gearman_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, gearman main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $gearman_source
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, gearman main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $gearman_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $gearman_options
#
# [*service_autorestart*]
#   Automatically restarts the gearman service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $gearman_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $gearman_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $gearman_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $gearman_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for gearman checks
#   Can be defined also by the (top scope) variables $gearman_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $gearman_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $gearman_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $gearman_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $gearman_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for gearman port(s)
#   Can be defined also by the (top scope) variables $gearman_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling gearman. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $gearman_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $gearman_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $gearman_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $gearman_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: false
#
# Default class params - As defined in gearman::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of gearman package
#
# [*service*]
#   The name of gearman service
#
# [*service_status*]
#   If the gearman service init script supports status argument
#
# [*process*]
#   The name of gearman process
#
# [*process_args*]
#   The name of gearman arguments. Used by puppi and monitor.
#   Used only in case the gearman process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user gearman runs with. Used by puppi and monitor.
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $gearman_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $gearman_protocol
#
#
# See README for usage patterns.
#
class gearman (
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $template            = params_lookup( 'template' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $noops               = params_lookup( 'noops' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $port                = params_lookup( 'port' ),
  $protocol            = params_lookup( 'protocol' ),
  $backlog             = params_lookup( 'backlog' ),
  $file_descriptors    = params_lookup( 'file_descriptors'),
  $threads             = params_lookup( 'threads' ),
  $job_retries         = params_lookup( 'job_retries' ),
  $round_robin         = params_lookup( 'round_robin' ),
  ) inherits gearman::params {

  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)
  $bool_noops=any2bool($noops)
  $bool_round_robin=any2bool($round_robin)

  ### Definition of some variables used in the module
  $manage_package = $gearman::bool_absent ? {
    true  => 'absent',
    false => $gearman::version,
  }

  $manage_service_enable = $gearman::bool_disableboot ? {
    true    => false,
    default => $gearman::bool_disable ? {
      true    => false,
      default => $gearman::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $gearman::bool_disable ? {
    true    => 'stopped',
    default =>  $gearman::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $gearman::bool_service_autorestart ? {
    true    => Service[gearman],
    false   => undef,
  }

  $manage_file = $gearman::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $gearman::bool_absent == true
  or $gearman::bool_disable == true
  or $gearman::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $gearman::bool_absent == true
  or $gearman::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $gearman::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $gearman::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $gearman::source ? {
    ''        => undef,
    default   => $gearman::source,
  }

  $manage_file_content = $gearman::template ? {
    ''        => undef,
    default   => $manage_file_content ? {
      undef   => template($gearman::template),
      default => undef,
    },
  }

  ### Managed resources
  package { 'gearman':
    name    => $gearman::package,
    ensure  => $gearman::manage_package,
    noop    => $gearman::bool_noops,
  }

  service { 'gearman':
    ensure     => $gearman::manage_service_ensure,
    name       => $gearman::service,
    enable     => $gearman::manage_service_enable,
    hasstatus  => $gearman::service_status,
    pattern    => $gearman::process,
    require    => Package['gearman'],
    noop       => $gearman::bool_noops,
  }

  file { 'gearman_init_default':
    ensure  => $gearman::manage_file,
    path    => $gearman::config_file_init,
    mode    => $gearman::config_file_mode,
    owner   => $gearman::config_file_owner,
    group   => $gearman::config_file_group,
    content => $manage_file_content,
    source  => $manage_file_source,
    notify  => $manage_service_autorestart,
    require => Package['gearman'],
    noop    => $gearman::bool_noops,
  }

  ### Include custom class if $my_class is set
  if $gearman::my_class {
    include $gearman::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $gearman::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'gearman':
      ensure    => $gearman::manage_file,
      variables => $classvars,
      helper    => $gearman::puppi_helper,
      noop      => $gearman::bool_noops,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $gearman::bool_monitor == true {
    if $gearman::port != '' {
      monitor::port { "gearman_${gearman::protocol}_${gearman::port}":
        protocol => $gearman::protocol,
        port     => $gearman::port,
        target   => $gearman::monitor_target,
        tool     => $gearman::monitor_tool,
        enable   => $gearman::manage_monitor,
        noop     => $gearman::bool_noops,
      }
    }
    if $gearman::service != '' {
      monitor::process { 'gearman_process':
        process  => $gearman::process,
        service  => $gearman::service,
        pidfile  => $gearman::pid_file,
        user     => $gearman::process_user,
        argument => $gearman::process_args,
        tool     => $gearman::monitor_tool,
        enable   => $gearman::manage_monitor,
        noop     => $gearman::bool_noops,
      }
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $gearman::bool_firewall == true and $gearman::port != '' {
    firewall { "gearman_${gearman::protocol}_${gearman::port}":
      source      => $gearman::firewall_src,
      destination => $gearman::firewall_dst,
      protocol    => $gearman::protocol,
      port        => $gearman::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $gearman::firewall_tool,
      enable      => $gearman::manage_firewall,
      noop        => $gearman::bool_noops,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $gearman::bool_debug == true {
    file { 'debug_gearman':
      ensure  => $gearman::manage_file,
      path    => "${settings::vardir}/debug-gearman",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
      noop    => $gearman::bool_noops,
    }
  }

}
