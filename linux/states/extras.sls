global_deps:
  file.managed:
    - name: {{ salt.cmd.run('echo $HOME') }}/core.sh
    - source: salt://core.sh
    - user: nicholas
    - group: nicholas
    - mode: '777'
  cmd.run:
    - name: {{ salt.cmd.run('echo $HOME') }}/core.sh
    - runas: nicholas
