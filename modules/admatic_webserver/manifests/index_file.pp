class index_file {

file {

"/var/www/html/index.html":

ensure => file,

source => "puppet:///modules/admatic_webserver/static_index.html";

}

     $mysql_password1 = 'secret'
     file { '/opt/backup-mysql.sh':
       content => template('admatic_webserver/mysql_backup.sh.erb'),
       mode    => '0755',
       }

}
