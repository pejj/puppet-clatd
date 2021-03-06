[![Build Status](https://travis-ci.org/obliadp/puppet-clatd.svg?branch=master)](https://travis-ci.org/obliadp/puppet-clatd)

# clatd: installs clatd and manages service and config

For the clatd doc see https://github.com/toreanderson/clatd

Supports Debian/Ubuntu/Redhat and Systemd/Upstart

## On RedHat/Centos we rely on EPEL

clatd is packaged as part of EPEL, and we use the upstream package

## installs config to /etc/clatd.conf

Passes anything you give from hiera verbatim to the config file

## Using this module

include ::clatd

### vanilla example:

clatd itself has good defaults, so you should not need to change
anything. If your organization has a nat64 gateway and dns64-servers it
should be able to autodetect all relevant settings 

### hiera example for hosts with no configured dns64:

```
clatd::options:
  debug: 1
  v4-conncheck-enable: 0
  v4-defaultroute-replace: 1
  plat-dev: eth0
  plat-prefix: 64:ff9b::/96 # change this to whatever your organization uses
  dns64-servers: 2001:4860:4860::6464, 2001:4860:4860::64 # google, replace if applicable
```

## For more information about 464XLAT see:
* https://tools.ietf.org/html/rfc6877
* https://sites.google.com/site/tmoipv6/464xlat
* https://redpill-linpro.com/techblog/2016/09/02/ipv6-clatd-a-component-of-464xlat-for-fedora-and-epel.html
* https://en.wikipedia.org/wiki/IPv6_transition_mechanism

Google provides a free dns64 service if your infrastructure lacks one:
* https://developers.google.com/speed/public-dns/docs/dns64



