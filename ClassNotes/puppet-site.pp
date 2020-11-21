node default {
  package { 'elinks':
    ensure    => 'absent',
  }
  file { '/tmp/info.txt':
    ensure    => 'absent',
    content   => "This file was created via puppet"
  }
  user { 'sk12k':
    ensure    => 'absent',
    password  => '123456',
    shell     => '/bin/bash',
    home      => '/home/sk12k',
  }
}

node webserver {
  policy definitions
}

node dbservers {
  policy definitions
}






