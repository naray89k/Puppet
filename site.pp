#node 'admaticip-172-31-52-112' {
node 'ip-172-31-55-203' {
	include webserver
}

node /^ip/{
	include webserver
}
node default {
	notify { "Could not match any nodes":}
}
