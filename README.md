# Génération automatique de certificats SSL

## Foundry VTT (sous linux ubuntu

Si vous en avez marre de tenter de trouver de l'information sur la génération de certificats SSL sous ubuntu pour votre système Foundry VTT
Ce projet est fait pour vous.
  
## Pré-requis
1. Installer git `sudo apt install git`
2. Avoir une adresse mail valide
3. Avoir son propre nom de domaine
4. Avoir créé les entrées A/AAAA dans son sous-domaine dédiée
5. Avoir une licence Foundry VTT déjà installée sous ubuntu en ayant laissé les dossiers par défaut

Le but à moyen terme est d'intégrer ce script dans une configuration automatique plus grande.

Quelques modifs sont encore en cours afin que le script puisse utiliser des installation Foundry VTT aplus personnalisées.

Par exemple: en incluant la possibilité de changer de dossier pendant l'installation (TODO)

## Comment ça marche
Ouvrez un terminal sous ubuntu

Tapez ces 3 instructions:

    cd
    git clone https://github.com/prolice/SSL-Automation.git
    ./SSL-Automation/scripts/global/install_prolice.sh

*Les 3 instructions servent dans l'ordre à
1. Se placer dans votre dossier home
2. Récupérer le script et ses dépendances
3. Lancer le script *
Il ne faut pas lancer la dernière commande en la précédent de "sudo"

Et voilà c'est terminé ;-)
