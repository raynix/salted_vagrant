drupal:
  lookup:
    name: drupalsite
    ip: '*'
    port: 80
    user: 'www-data'
    group: 'www-data'
    home: /var/www
    version: '8.2.6'
    source_hash: 'md5=57526a827771ea8a06db1792f1602a85'
    fix_permissions: True
