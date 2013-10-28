include apt

# this repo is needed vor collectd version 5.3
apt::ppa { "ppa:vbulax/collectd5": }

exec { "apt-update":
	command => '/usr/bin/apt-get update',
	user => root,
	require => Apt::Ppa["ppa:vbulax/collectd5"],
}

# works currently only on port 80 due to setup issues with ports.conf
class { 'graphite':
  port => 80,
  require => Exec["apt-update"],
}

# add all NameVirtualHost directives to the ports.conf
# @see https://forge.puppetlabs.com/puppetlabs/apache#configure-a-virtual-host
# class { 'apache::namevirtualhost': }

class { '::apache':
	require => Exec["apt-update"],
}

class { '::collectd':
  require => Exec["apt-update"],
}

include apache 

include graphite

include collectd

collectd::plugin { 'cpu': }
collectd::plugin { 'df': }

class { 'collectd::plugin::disk':
  disks          => ['/^dm/'],
  ignoreselected => true
}

collectd::plugin { 'entropy': }
collectd::plugin { 'interface': }
collectd::plugin { 'irq': }
collectd::plugin { 'iptables': }
collectd::plugin { 'memory': }
collectd::plugin { 'processes': }

class { 'collectd::plugin::write_graphite':
  graphitehost => 'localhost',
}
