class apache{
package {
	'apache2':
	ensure => 'installed',
}
->
service {
	'apache2':
	#ensure => 'stopped',
	ensure => 'running',

}

}
