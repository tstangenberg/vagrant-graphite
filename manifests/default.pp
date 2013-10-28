# works currently only on port 80 due to setup issues with ports.conf
class { 'graphite':
  port => 80,
}

# add all NameVirtualHost directives to the ports.conf
# @see https://forge.puppetlabs.com/puppetlabs/apache#configure-a-virtual-host
# class { 'apache::namevirtualhost': }

include apache

include graphite

