base:
  pkg.installed:
    - pkgs:
      - python-software-properties
      - software-properties-common
      - debconf-utils
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
nvm:
  cmd.run:
    - runas: nicholas
    - name: curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | zsh
    - creates: {{ salt.cmd.run('echo $HOME') }}/.nvm
us_locale:
  locale.present:
    - name: en_US.UTF-8

create-default-locale:
  cmd.run:
    - name: touch /etc/default/locale
    - unless: test -f /etc/default/locale
default_locale:
  locale.system:
    - name: en_US.UTF-8
nicholas:
  user.present:
    - shell: /bin/zsh
