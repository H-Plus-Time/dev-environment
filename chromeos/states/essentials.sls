base:
  pkgrepo.managed:
    - ppa: webupd8team/java
  debconf.set:
    - name: oracle-java8-installer
    - data:
        'shared/accepted-oracle-license-v1-1': {'type': 'select', 'value': 'true'}
common_packages:
  pkg.installed:
    - pkgs:
      - dos2unix
      - zsh
      - git
      - curl
      - vim
      - python
      - wget
      - unzip
      - entr
      - libzmq3-dev
      - clang
      - exuberant-ctags
      - ack-grep
      - python-software-properties
      - debconf-utils
      - software-properties-common
      - gccgo
us_locale:
  locale.present:
    - name: en_US.UTF-8

default_locale:
  locale.system:
    - name: en_US.UTF-8
    - require:
      - locale: us_locale
nicholas:
  user.present:
    - shell: /bin/zsh
