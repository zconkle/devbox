class supervisor {
    package { 'supervisor':
        ensure => installed,
    }

    file { 'supervisor.conf':
        path => '/etc/supervisor/supervisord.conf',
        ensure => file,
        owner => root,
        group => root,
        source => 'puppet:///modules/supervisor/supervisord.conf',
        require => Package['supervisor'],
    }

    file { 'queue-listeners.conf':
        path => '/etc/supervisor/conf.d/queue-listeners.conf',
        ensure => file,
        owner => root,
        group => root,
        source => 'puppet:///modules/supervisor/queue-listeners.conf',
        require => Package['supervisor'],
    }
}
