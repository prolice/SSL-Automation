#!/bin/bash
source foundryssl/variables.sh

foundry_file="foundryvtt.conf"

#install nginx && unzip
sudo apt-get install nginx unzip
sudo mkdir /var/log/nginx/foundry
cp SSL-Automation/files/nginx/${foundry_file} /etc/nginx/conf.d/foundryvtt.conf
sudo sed -i "s/YOURSUBDOMAINHERE/${subdomain}/g" /etc/nginx/conf.d/foundryvtt.conf
sudo sed -i "s/YOURDOMAINHERE/${fqdn}/g" /etc/nginx/conf.d/foundryvtt.conf

# start nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# configure foundry for nginx
sudo sed -i "s/\"hostname\":.*/\"hostname\": \"${subdomain}\.${fqdn}\",/g" ${foundrydata}/options.json
sudo sed -i 's/"proxyPort":.*/"proxyPort": "80",/g' ${foundrydata}/options.json

systemctl restart nginx

sudo apt install certbot python3-certbot-nginx

# install certificates
sudo certbot --agree-tos -n --nginx -d ${subdomain}.${fqdn} -m ${email} --no-eff-email

# configure to autorenew certs
crontab -l | { cat; echo "@reboot    /usr/bin/certbot renew --quiet"; } | crontab -
crontab -l | { cat; echo "0 12 * * *     /usr/bin/certbot renew --quiet"; } | crontab -

sudo sed -i -e "s|location / {|include conf.d/drop;\n\n\tlocation / {|g" /etc/nginx/conf.d/foundryvtt.conf
sudo cp SSL-Automation/files/nginx/drop /etc/nginx/conf.d/drop
sudo systemctl restart nginx

# configure foundry to use ssl
sudo sed -i 's/"proxyPort":.*/"proxyPort": "443",/g' ${foundrydata}/options.json
sudo sed -i 's/"proxySSL":.*/"proxySSL": true,/g' ${foundrydata}/options.json
