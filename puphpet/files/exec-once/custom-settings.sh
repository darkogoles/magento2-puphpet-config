#!/usr/bin/env bash
mv -f /etc/php/5.6/fpm/php.ini /etc/php/5.6/php.ini
cd /etc/php/5.6/fpm/
ln -s /etc/php/5.6/php.ini php.ini
cd /etc/php/5.6/cli/
mv php.ini php.ini.old
ln -s /etc/php/5.6/php.ini php.ini
cd /etc/php/5.6/
sed -i 's/;always_populate_raw_post_data = -1/always_populate_raw_post_data = -1/g' php.ini
sed -i 's/;max_input_time = 60/max_input_time = 1800/g' php.ini
sed -i 's/;memory_limit = 128M/memory_limit = 2048M/g' php.ini
sed -i 's/;max_execution_time = 30/max_execution_time = 1800/g' php.ini
sudo service php5.6-fpm restart
sudo service apache2 restart