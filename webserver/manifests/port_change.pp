class port_change {
    $webserver_port = '8888'
     file { '/etc/apache2/ports.conf':
       content => template('webserver/ports.conf.erb'),
       mode    => '644',
     }
     ->
     exec { 'service apache2 restart':
     	path => '/bin:/usr/bin:/usr/sbin',
     }
}

