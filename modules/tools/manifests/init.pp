class tools {
    $packages = ['python-software-properties', 'curl', 'imagemagick','mpg321','sox','libsox-fmt-mp3']
    
    package { $packages:
        ensure => installed,
    }
}
