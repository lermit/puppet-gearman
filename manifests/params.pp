# Class: gearman::params
#
# This class defines default parameters used by the main module class gearman
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to gearman class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class gearman::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'gearman-job-server',
    default                   => 'gearmand',
  }

  $service = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'gearman-job-server',
    default                   => 'gearmand',
  }

  $service_status = $::operatingsystem ? {
    default => false,
  }

  $process = $::operatingsystem ? {
    default => 'gearmand',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'gearman',
    default                   => 'gearmand',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/gearman',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/gearman/gearman.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/gearman-job-server',
    default                   => '/etc/sysconfig/gearmand',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/gearman/gearmand.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/etc/gearman',
  }

  $log_dir = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/var/log/gearman-job-server',
    default                   => '/var/log/gearman',
  }

  $log_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/var/log/gearman-job-server/gearman.log',
    default                   => '/var/log/gearman/gearman.log',
  }

  $backlog = '32'
  $file_descriptors = '0'
  $job_retries = '0'
  $threads = '4'
  $round_robin = 'no'


  $port = '4730'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $template = 'gearman/default.erb'
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
