class mysql 
{
    $mysqlPassword = "root"
 
    package 
    { 
        "mysql-server":
            ensure  => present,
            require => Exec['apt-get update']
    }

    package
    {
      "mysql-client":
        ensure  => present
    }

    service 
    { 
        "mysql":
            enable => true,
            ensure => running,
            require => Package["mysql-server"],
    }

    exec 
    { 
        "set-mysql-password":
            unless  => "mysqladmin -uroot -p$mysqlPassword status",
            command => "mysqladmin -uroot password $mysqlPassword | mysql --user=root --password=root < /vagrant/modules/mysql/mysql_bootstrap.sql",
            path    => "/bin:/usr/bin",
            require => Service["mysql"],
    }

    file { 'my.cnf':
        notify  => Service['mysql'],
        path => '/etc/mysql/my.cnf',
        ensure => file,
        owner => root,
        group => root,
        source => 'puppet:///modules/mysql/my.cnf',
        require => Package['mysql-server'],
    }
}
