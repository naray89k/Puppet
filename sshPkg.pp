package { 'openssh-server':
    ensure       => present,
    before => File['/etc/ssh/sshd_config'],
}

file { '/etc/ssh/sshd_config':
    ensure  => file,
    mode    => 600,
    source  => 'puppet:///modules/sshd/sshd_config',
    require => Package['openssh-server'],
}

