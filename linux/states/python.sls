condarc:
  file.managed:
    - user: nicholas
    - group: nicholas
    - source: salt://.condarc
    - name: /home/nicholas/.condarc
miniconda:
  file.managed:
    - user: nicholas
    - group: nicholas
    - mode: '777'
    - source: salt://install-miniconda.sh
    - name: /home/nicholas/install-miniconda.sh
  cmd.run:
    - shell: /bin/zsh
    - name: ./install-miniconda.sh
    - creates: $HOME/miniconda3
    - runas: nicholas
