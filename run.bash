sudo docker-compose -f laradock/testLaravel.docker-compose.yml -p testLaravel down
git submodule update --init --recursive
cp docker/.env laradock/.env
cp docker/testLaravel.docker-compose.yml laradock/testLaravel.docker-compose.yml
cp -r docker/apache2/ laradock/
echo "127.0.0.1   testLaravel.test" | sudo tee -a /etc/hosts
sudo docker-compose -f laradock/testLaravel.docker-compose.yml up -d apache2 mysql
sudo docker-compose -f laradock/testLaravel.docker-compose.yml exec --user=laradock -w /var/www/testLaravel/ workspace php composer.phar install -n
sudo docker-compose -f laradock/testLaravel.docker-compose.yml exec --user=laradock -w /var/www/testLaravel/ workspace php artisan key:generate
#sudo docker-compose -f laradock/testLaravel.docker-compose.yml exec --user=laradock -w /var/www/testLaravel/ workspace php artisan migrate

