class composer {
  exec { 'download_composer':
        command => '/usr/bin/wget http://getcomposer.org/composer.phar -O /home/vagrant/composer.phar',
        cwd     => '/home/vagrant',
        creates => '/home/vagrant/composer.phar',
        require => Package['curl', 'php5-cli']
    }

    file { '/usr/local/bin':
        ensure => directory,
    }

    # move file to target_dir
    file { "/usr/local/bin/composer":
    ensure      => present,
    source      => "/home/vagrant/composer.phar",
    require     => [ Exec['download_composer'], File['/usr/local/bin'], ],
    group       => 'staff',
    mode        => '0755',
    }
    
    exec { 'rollback_composer_version':
          command => '/usr/local/bin/composer self-update 1.0.0-alpha8',
          require => [ Exec['download_composer'], File['/usr/local/bin'],File['/usr/local/bin/composer'], ]
    }
}
