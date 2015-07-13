#import 'nodes.pp'

file {'/home/narayanan/hello':
	content => "Hello World\n",
}

file {'/home/narayanan/push_git_changes.txt':
	content => "Test\n",
	ensure => present,
}
