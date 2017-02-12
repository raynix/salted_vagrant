base:
  '*':
    - common

  'minion1':
    - mysql.client
    - php
    - afl
    - nginx
    - drupal
  'minion2':
    - mysql
