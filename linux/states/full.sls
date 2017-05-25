chromeInst:
  pkgrepo.managed:
    - humanname: Google Chrome
    - name: deb http://dl.google.com/linux/chrome/deb/ stable main
    - dist: stable
    - file: /etc/apt/sources.list.d/chrome-browser.list
    - gpgcheck: 1
    - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub
  pkg.installed:
    - pkgs:
      - google-chrome-stable
      - google-chrome-beta
      - google-chrome-unstable
virtuals:
  pkg.installed:
    - pkgs:
      - virtualbox
