class index_file {
  
  file { "/var/www/html/index.html":
    ensure => file,
    source => "puppet:///modules/webserver/static_index.html";
  }
  $mysql_password1 = 'secret'
  file { '/opt/backup-mysql.sh':
    content => template('webserver/mysql_backup.sh.erb'),
    mode    => '0755',
  }
  
}

