class php {

    exec { 'add_repo':
        command => '/usr/bin/add-apt-repository ppa:ondrej/php5'
    }

    exec { 'update_repo':
        command => '/usr/bin/apt-get update',
        require => Exec['add_repo']
    }

    exec { 'php5-hotfix':
        command => '/usr/bin/dpkg -i /vagrant/modules/php/files/libsystemd-daemon0_44-12_i386.deb',
        require => Exec['add_repo']
    }

    $packages = ['php5', 'php5-mcrypt', 'php-xml-parser', 'php5-xdebug', 'php5-mysqlnd', 'php5-cli', 'php5-curl', 'php5-fpm', 'libssh2-1-dev', 'php-apc', 'php-pear']
    package { $packages:
        ensure => latest,
        require => [Exec['update_repo'],Exec['php5-hotfix']],
    }

    file { 'php.ini':
        path => '/etc/php5/fpm/php.ini',
        ensure => file,
        owner => root,
        group => root,
        source => 'puppet:///modules/php/php.ini',
        require => Package['php5-fpm'],
    }

    file { 'www.conf':
        notify  => Service['php5-fpm'],
        path => '/etc/php5/fpm/pool.d/www.conf',
        ensure => file,
        owner => root,
        group => root,
        source => 'puppet:///modules/php/www.conf',
        require => Package['php5-fpm'],
    }
    
    file { 'browscap.ini':
        path => '/etc/php5/browscap.ini',
        ensure => file,
        owner => root,
        group => root,
        source => 'puppet:///modules/php/browscap.ini',
        require => Package['php5-fpm'],
    }

    service { 'php5-fpm':
        ensure => running,
        enable => true,
        require => File['php.ini','www.conf'],
    } 

    include php::pear
}
