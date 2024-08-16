# This Puppet manifest fixes file permissions for the WordPress directory and ensures required PHP modules are installed.

# Ensure the necessary PHP modules are installed
package { ['php', 'php-mysql', 'php-xml', 'php-mbstring']:
  ensure => installed,
}

# Ensure correct ownership and permissions for the WordPress directory
file { '/var/www/html':
  ensure  => directory,
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0755',
  recurse => true,
}

# Restart Apache to apply changes
service { 'apache2':
  ensure    => running,
  enable    => true,
  subscribe => File['/var/www/html'],
  notify    => Package['php', 'php-mysql', 'php-xml', 'php-mbstring'],
}

