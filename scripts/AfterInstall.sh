#!/bin/bash
# Set permissions to storage and bootstrap cache
sudo chown -R root.www-data /var/www/typer-api/storage
sudo chown -R root.www-data /var/www/typer-api/bootstrap/cache
cd /var/www/typer-api
# Run composer
sudo composer install
#configure .env - conexao com o banco
sudo mv .env.example .env
# Run artisan commands
sudo php /var/www/typer-api/artisan key:generate
