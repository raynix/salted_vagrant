mysql:
  global:
    client-server:
      default_character_set: utf8

  clients:
    mysql:
      default_character_set: utf8
    mysqldump:
      default_character_set: utf8

  library:
    client:
      default_character_set: utf8

  server:
    # root_password: '' - to have root@localhost without password
    root_password: ''
    #user: mysql
    # If you only manage the dbs and users and the server is on
    # another host
    #host: 123.123.123.123
    # my.cnf sections changes
    mysqld:
      # you can use either underscore or hyphen in param names
      bind-address: 0.0.0.0
  salt_user:
    salt_user_name: 'root'
    grants:
      - 'all privileges'
 
  # Manage databases
  database:
    - drupal
  # Manage users
  # you can get pillar for existing server using scripts/import_users.py script
  user:
    drupal:
      password: 'drupal'
      host: '%'
      databases:
        - database: drupal
          grants: ['all privileges']

