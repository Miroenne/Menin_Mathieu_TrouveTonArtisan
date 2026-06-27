# Trouve Ton Artisan

Projet fullstack permettant de rechercher des artisans de la région Auvergne-Rhône-Alpes, de consulter leur fiche détaillée et de les contacter par email.

Le projet est composé d'une application frontend React, d'une API Express/Node.js et d'une base de données MySQL.

## Fonctionnalités

- Affichage des trois artisans du mois sur la page d'accueil.
- Navigation par catégories d'artisans.
- Recherche d'un artisan par nom.
- Consultation de la fiche détaillée d'un artisan.
- Affichage de la note, de la spécialité, de la ville, du site web et de la présentation de l'artisan.
- Formulaire de contact générant un lien `mailto:`.
- API REST pour consulter, créer, modifier et supprimer des catégories et artisans.
- Protection des routes d'écriture avec un JWT stocké dans un cookie HTTP-only.
- Initialisation automatique de la base de données et import des données de départ.

## Technologies Utilisées

### Frontend

- React
- React Router
- Sass
- Bootstrap classes
- Create React App

### Backend

- Node.js
- Express
- Sequelize
- MySQL avec `mysql2`
- CORS
- Cookie-parser
- JSON Web Token
- Nodemon
- Env-cmd

### Base de Données

- MySQL
- Scripts SQL d'initialisation et d'import
- Modèle de base de données réalisé avec MySQL Workbench

## Structure du Projet

```txt
Trouve_ton_artisan/
├── Database/
│   ├── Model/
│   │   ├── DB_Model.mwb
│   │   └── DB_Model.png
│   └── Scripts/
│       ├── initialize_DB.sql
│       ├── import.sql
│       └── data_Import.sql
├── Front_trouve_ton_artisan/
│   ├── public/
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── scss/
│   │   └── utils/
│   └── README.md
├── trouve_ton_artisan/
│   ├── controllers/
│   ├── db/
│   ├── middlewares/
│   ├── models/
│   ├── repositories/
│   ├── routes/
│   ├── services/
│   ├── utils/
│   └── README.md
└── README.md
```

## Prérequis

- Node.js
- npm
- Une base MySQL compatible
- Deux terminaux : un pour l'API et un pour le frontend

## Installation

Installer les dépendances de l'API :

```bash
cd trouve_ton_artisan
npm install
```

Installer les dépendances du frontend :

```bash
cd ../Front_trouve_ton_artisan
npm install
```

## Configuration de l'API

L'API lit sa configuration depuis les variables d'environnement.

Exemple :

```env
HOST=127.0.0.1
DB_PORT=4000
TIDB_USER=root
PASSWORD=
DATABASE=your_database_name
PORT=3000
SECRET_KEY=your_jwt_secret
FRONT_ORIGIN=http://localhost:3001
ADMIN_ORIGIN=http://localhost:5173
```

`FRONT_ORIGIN` et `ADMIN_ORIGIN` sont utilisés pour configurer CORS.

`SECRET_KEY` est nécessaire pour vérifier et renouveler les tokens JWT utilisés sur les routes protégées.

## Configuration du Frontend

Le frontend utilise la variable d'environnement suivante pour connaître l'URL de l'API :

```env
REACT_APP_API_URL=http://localhost:3000
```

Avec Create React App, les variables exposées au frontend doivent commencer par `REACT_APP_`.

## Lancement du Projet

Dans un premier terminal, démarrer l'API :

```bash
cd trouve_ton_artisan
npm start
```

URL par défaut de l'API :

```txt
http://localhost:3000
```

Dans un second terminal, démarrer le frontend :

```bash
cd Front_trouve_ton_artisan
npm start
```

Create React App démarre par défaut sur le port `3000`. Comme l'API utilise déjà ce port, le frontend peut proposer d'utiliser le port `3001`.

URL habituelle du frontend :

```txt
http://localhost:3001
```

## Scripts Disponibles

### API

```bash
npm start
```

Démarre l'API avec `node ./bin/www`.

```bash
npm run dev
```

Démarre l'API avec `nodemon` et charge `./env/.env.dev`.

```bash
npm run prod
```

Démarre l'API avec `nodemon` et charge `./env/.env.prod`.

### Frontend

```bash
npm start
```

Démarre l'application React en mode développement.

```bash
npm test
```

Lance les tests en mode interactif.

```bash
npm run build
```

Génère une version de production dans le dossier `build`.

## Routes Frontend

| Route | Page | Description |
| --- | --- | --- |
| `/` | `Home` | Accueil et artisans du mois |
| `/catégories/:categoryName` | `Category` | Liste des artisans d'une catégorie |
| `/artisans/:id` | `Artisan` | Détail d'un artisan |
| `/error` | `Error` | Page d'erreur |

## Endpoints API

| Méthode | Endpoint | Description |
| --- | --- | --- |
| `GET` | `/top3` | Retourne les trois artisans du mois. |
| `GET` | `/categories` | Retourne toutes les catégories. |
| `POST` | `/categories` | Crée une catégorie. Route protégée par cookie JWT. |
| `GET` | `/categories/{id}` | Retourne une catégorie par identifiant. |
| `PUT` | `/categories/{id}` | Met à jour une catégorie. Route protégée par cookie JWT. |
| `DELETE` | `/categories/{id}` | Supprime une catégorie. Route protégée par cookie JWT. |
| `GET` | `/societies` | Retourne tous les artisans. |
| `POST` | `/societies` | Crée un artisan. Route protégée par cookie JWT. |
| `GET` | `/societies/id/{id}` | Retourne un artisan par identifiant. |
| `PUT` | `/societies/id/{id}` | Met à jour un artisan. Route protégée par cookie JWT. |
| `DELETE` | `/societies/id/{id}` | Supprime un artisan. Route protégée par cookie JWT. |
| `GET` | `/societies/{nom}` | Recherche des artisans par nom, sans tenir compte de la casse. |
| `GET` | `/societies/categorized/{category}` | Recherche des artisans par catégorie. |

## Base de Données

La base de données contient les entités principales suivantes :

- `Catégories`
- `Spécialités`
- `Artisans`
- `Villes`
- `Top`

Au démarrage, l'API appelle l'initialisation de la base de données :

1. exécution du script `db/scripts/initialize_DB.sql` ;
2. vérification de la présence de données dans la table `Catégories` ;
3. import des données de départ avec `db/scripts/import.sql` si nécessaire.

Le dossier `Database/Model` contient aussi le modèle MySQL Workbench et son export visuel.

## Sécurité

Les routes de lecture `GET` sont publiques afin que le frontend puisse afficher les artisans, les catégories et les artisans du mois.

Les routes d'écriture `POST`, `PUT` et `DELETE` sont protégées par le middleware `middlewares/verifyToken.js`.

Ce middleware :

- lit le token JWT dans le cookie `token` ;
- vérifie le token avec `SECRET_KEY` ;
- ajoute l'utilisateur décodé dans `req.user` ;
- renouvelle le cookie pour 24 heures ;
- renvoie une erreur `401` si le token est absent ou invalide.

## Documentation

Les composants React, les routes Express, les controllers, les services, les repositories et les utilitaires contiennent des commentaires JSDoc pour faciliter la maintenance et la compréhension du projet.

Les routes de l'API contiennent aussi des blocs compatibles avec Swagger/OpenAPI, même si Swagger UI n'est pas encore branché dans l'application.

## Points d'Attention Connus

- Le frontend doit être configuré avec `REACT_APP_API_URL` pour communiquer avec l'API.
- La recherche par nom retourne actuellement le premier résultat utilisé par la navbar lorsqu'il y a plusieurs correspondances.
- La recherche côté API ignore la casse, mais pas nécessairement les accents selon la collation de la base MySQL.
- Les routes d'administration nécessitent une future route de connexion capable de générer le cookie JWT attendu par les routes protégées.
