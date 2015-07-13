node 'demo' {
	#include apache
	$var="TempVariable"


	file { '/tmp/hello_world':
		content => "Hello, world\n",
	}
	package { 'apache2' :
		ensure => latest,
	}

	package { 'gdebi':
		#ensure => present,
		ensure => latest,
		#ensure => '0.9.5.3ubuntu2'
	}
	package { 'g++':
		ensure => latest
	}
	if defined(File['/tmp/hello_world']){
		notice("This file is already defined")
	}
	if defined('$var'){
		notice("The Variable \$var is defined and its value is $var")
	}
}
