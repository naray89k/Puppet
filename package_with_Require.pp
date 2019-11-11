package { 'apache2':
  ensure => 'installed',
}

service { 'apache2':
  ensure => 'running',
  require => Package['apache2'],
}

file { '/var/www/html/index.html':
  content => "Hello World\n",
  require => Service['apache2'],
}

