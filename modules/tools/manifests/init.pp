class tools {
    $packages = ['python-software-properties', 'curl', 'imagemagick','mpg321','sox']
    
    package { $packages:
        ensure => installed,
    }
}
