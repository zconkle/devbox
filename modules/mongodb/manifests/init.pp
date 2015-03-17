class mongodb {
    package { 'mongodb':
        ensure => installed,
    }

    file { 'mongodb.conf':
        path => '/etc/mongodb.conf',
        ensure => file,
        owner => root,
        group => root,
        source => 'puppet:///modules/mongodb/mongodb.conf',
        require => Package['mongodb'],
    }


}
