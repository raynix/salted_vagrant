/etc/nginx/sites-enabled/drupal.conf:
  file.managed:
    - source:
      - salt://drupal-nginx-site
    - user: root
    - group: root
    - mode: 644

php.packages:
  pkg.installed:
    - pkgs:
      - php-gd
      - php-mysql
      - php-xml

