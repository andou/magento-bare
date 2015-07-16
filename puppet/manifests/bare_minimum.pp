node default {
  class { 'php': }
  class { 'apache':
    mpm_module => 'prefork',
    user => 'vagrant',
    group => 'vagrant',
  }
  include apache::mod::php
  include apache::mod::rewrite

  php::module {  "mcrypt": }
  php::module {  "curl": }
  php::module {  "gd": }
  php::module {  "mysql": }
  php::module {  "xdebug": }

  apache::vhost { 'www.magebare.lo':
    port    => 80,
    docroot => '/vagrant/app/public',
  }

  class { '::mysql::server':
    root_password => 'o4o4'
  }

  mysql::db { 'mage':
    user     => 'mage_user',
    password => 'mageo4o4',
  }

  file { 'xdebug':
    path    => '/etc/php5/apache2/conf.d/20-xdebug.ini',
    ensure  => '/vagrant/resources/xdebug.ini',
    require => Class['php'],
    notify  => Service['apache2'],
  }

  file { 'mcrypt':
    path    => '/etc/php5/apache2/conf.d/30-mcrypt.ini',
    ensure  => '/vagrant/resources/mcrypt.ini',
    require => Class['php'],
    notify  => Service['apache2'],
  }

}
