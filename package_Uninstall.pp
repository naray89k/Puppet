package { 'apache2':
  ensure => 'absent',
  require => Service['apache2']
}

service { 'apache2':
  ensure => false
  #ensure => true
  #ensure => 'running'
}
