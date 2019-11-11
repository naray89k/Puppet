file { '/tmp/testfile.txt':
	ensure => present,
	mode => '0755',
	#mode => '0644',
	replace => true,
	content => "Ware Wow! \n",
	}
