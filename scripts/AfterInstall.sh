#!/bin/bash
# Set permissions to storage and bootstrap cache
sudo chown -R root:www-data /var/www/typer-api/storage
sudo chown -R root:www-data /var/www/typer-api/bootstrap/cache

sudo find /var/www/typer-api/storage -type f -exec chmod 664 {} \;    
sudo find /var/www/typer-api/bootstrap/cache -type f -exec chmod 664 {} \;    

sudo find /var/www/typer-api/storage -type d -exec chmod 775 {} \;    
sudo find /var/www/typer-api/bootstrap/cache -type d -exec chmod 775 {} \;    

cd /var/www/typer-api
# Run composer
sudo composer install
#configure .env - conexao com o banco
sudo mv .env.example .env
# Run artisan commands
sudo php artisan key:generate
sudo php artisan config:cache
sudo php artisan route:cache
