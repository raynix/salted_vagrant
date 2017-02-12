/etc/nginx/sites-enabled/drupal.conf:
  file.managed:
    - source:
      - salt://drupal-nginx-site
    - user: root
    - group: root
    - mode: 644

/etc/php/7.0/fpm/pool.d/www.conf:
  file.managed:
    - source:
      - salt://php-fpm-pool
    - user: root
    - group: root
    - mode: 644

php.packages:
  pkg.installed:
    - pkgs:
      - php-gd
      - php-mysql
      - php-xml

