# Utilise l'image Ubuntu 20.04 officielle en tant qu'image de base
FROM ubuntu:20.04

# Met à jour les packages et installe les dépendances
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y nginx git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Supprime le contenu existant du répertoire /var/www/html
RUN rm -rf /var/www/html/*

# Clone le dépôt Git directement dans /var/www/html/
RUN git clone https://github.com/diranetafen/static-website-example.git /var/www/html/

# Expose le port 80 pour les requêtes HTTP
EXPOSE 80

# Instruction CMD avec chemin complet pour démarrer le serveur nginx en mode daemon off
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

# Ajoute l'instruction LABEL pour spécifier le nom du mainteneur
LABEL maintainer="Parfait"

