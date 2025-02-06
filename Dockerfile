
#######################################################
# Pour travailler en local, il faut lancer docker desktop
# Il faut l'utiliser pour supprimer les conteneurs/images 
# et voir les logs et les fichiers du contneur
############################"
# avant de commencer le dépoiement, 
# il faut changer les adresses des services appelés 
# et lancer ng build
#######################################################

# Stage 1: Compiler le code

# Image officielle de node
FROM node:latest as build

# Répertoire de travail
WORKDIR /usr/local/app

# Ajout du code source
COPY ./ /usr/local/app/

# Installer npm
RUN npm install

# Compilation
RUN npm run build


# Stage 2: Server avec nginx server

# Utilise l'image officielle de nginx
FROM nginx:latest

# Copie du code compilé dans le serveur
COPY --from=build /usr/local/app/dist/bibliothque /usr/share/nginx/html

# Exposer l'application 80
EXPOSE 80


###################################
# Créer l'image
# docker build -t bibliothque-app-image:latest .

###################################
# Afficher l'image
# docker image ls

###################################
# Exécuter l'image et créer le conteneur
# docker run -d -p 4200:80 bibliothque-app-image:latest
# http://localhost:4200/

###################################
# Afficher le conteneur
# docker ps

###################################
# Supprimer le conteneur
# docker ps -a
# docker container rm -f 74c2b2043f92

###################################
# Pousser l'image dans docker hub
# docker tag bibliothque-app-image:latest rassanane/bibliothque-app-image:latest
# docker push rassanane/bibliothque-app-image:latest

###################################
# Supprimer l'image
# docker image ls
# docker rmi 533fd48a1f9e

###################################
# Récupérer l'image de docker hub
# docker pull rassanane/bibliothque-app-image
# docker image ls
# docker run -d -p 4200:80 rassanane/bibliothque-app-image:latest

#http://localhost:4200
#http://192.168.1.92:4200


