#import 'nodes.pp'

file {'/tmp/hello':
	content => "Hello World\n"
}
