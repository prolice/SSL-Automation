#!/bin/bash
mkdir foundryssl
echo '#!/bin/bash' >> foundryssl/variables.sh

echo 'Veuilez entrer votre nom de registrar : <registrar.domain.com>'
read domain_registrar
echo 'domain_registrar='$domain_registrar >> foundryssl/variables.sh

echo 'Veuillez entrer votre FQDN (Full Qualified Domain Name) : <domain.com>'
read fqdn
echo 'fqdn='$fqdn >> foundryssl/variables.sh

echo 'Veuillez entrer votre de nom de sous-domain : <foundry>.domain.com *** MAIS UNIQUEMENT LA PARTIE AVANT .domain.com dans ce cas-ci <foundry>' 
read subdomain
echo 'subdomain='$subdomain >> foundryssl/variables.sh

echo 'Veuillez entrer un adresse e-mail vailde'
read email
echo 'email='$email >> foundryssl/variables.sh

echo 'currentuser='$(whoami) >> foundryssl/variables.sh

sudo chown root:root foundryssl/variables.sh
sudo chmod 700 foundryssl/variables.sh

sudo ./certbot.sh
