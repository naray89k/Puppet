# Manage apache server
class apache {
	package { 'apache':
		ensure => installed,
	}
}
