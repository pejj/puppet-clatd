class clatd::deps {

  case $::osfamily {
    'Debian': {
      $_packages = [
        'perl-base',
        'perl-modules',
        'libnet-ip-perl',
        'libnet-dns-perl',
        'libio-socket-inet6-perl',
        'perl',
        'iproute',
        'iptables',
        'tayga',
      ]

      ensure_packages($_packages)

      Package[$_packages] ~> Service['clatd']
    }

    'RedHat': {
      case $::lsbmajdistrelease {
        /^(6|7)$/: {
          package { 'clatd':
            notify => Service['clatd'],
          }
        }

        default: {
          fail("${::lsbmajdistrelease} not supported")
        }
      }
    }
    default: {
      fail("${::osfamily} not supported")
    }
  }
}
