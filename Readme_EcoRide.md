
# Ecoride - Plateforme de covoiturages

## Présentation
Écoride est une application web de covoiturage écologique, conçue pour faciliter les trajets entre conducteurs et passagers tout en respectant l’environnement.

Le projet est développé avec :
- **Back-End** : Laravel (PHP)
- **Front-End** : HTML, CSS, JavaScript, thème professionnel
- **Base de données** : MySQL

---

## Prérequis

- PHP >= 8.2
- Composer
- Node.js & NPM
- MySQL
- serveur local : XAMPP

---

## Installation & Déploiement en local

### 1. Cloner le dépôt
```bash
git clone https://github.com/utilisateur a mettre/ecoride-v2.git
cd ecoride-v2
```

### 2. Installer les dépendances PHP
```bash
composer install
```

### 3. Configurer le fichier d’environnement
Copier le fichier `.env.example` :
```bash
cp .env.example .env
```

Modifier ensuite les informations suivantes dans `.env` :
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3307
DB_DATABASE=ecoride
DB_USERNAME=ecoride
DB_PASSWORD=Ecoride@2025
```

### 4. Générer la clé d’application
```bash
php artisan key:generate
```

### 5. Lancer les migrations et seeders
```bash
php artisan migrate --seed
```

### 6. Installer les dépendances front-end
```bash
npm install
npm run dev
```

### 7. Lancer le serveur local Laravel
```bash
php artisan serve
```

Accéder à l’application :
```
http://127.0.0.1:8000
```

---

## Accès API
Les routes API sont accessibles sous :
```
http://127.0.0.1:8000/api
```

Exemple :
```
http://127.0.0.1:8000/api/trajets
```

---

## Sécurité
- Authentification sécurisée avec Laravel Sanctum
- Protection CSRF
- Validation et sanitation des entrées utilisateurs
- Hashage des mots de passe (bcrypt)
- Rôles et permissions utilisateurs

---
