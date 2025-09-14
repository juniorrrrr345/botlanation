# Fonctionnalités - BotLanation

## 🚀 Fonctionnalités Principales

### Pour les Utilisateurs

#### 🎯 Menu Principal (/start)
- **Message d'accueil personnalisable** avec support des variables `{firstname}`
- **Photo d'accueil** configurable par l'administrateur
- **Mini application web** intégrée (optionnelle)
- **Services principaux** : Livraison, Postal, Meet Up
- **Réseaux sociaux** configurables avec emojis et URLs
- **Interface intuitive** avec boutons inline

#### 🛠️ Services Disponibles
1. **🚚 Livraison**
   - Texte et photo personnalisables
   - Sous-menus configurables
   - Gestion des commandes

2. **📮 Postal**
   - Service d'envoi de colis
   - Tarifs et informations
   - Suivi des envois

3. **📍 Meet Up**
   - Organisation de rencontres
   - Événements et planning
   - Inscriptions

### Pour les Administrateurs

#### 🔧 Panel d'Administration (/admin)
- **Accès sécurisé** avec vérification des permissions
- **Interface complète** pour gérer tous les aspects du bot
- **Statistiques en temps réel**

#### ✏️ Gestion du Contenu
- **Message d'accueil** : Modification du texte avec variables
- **Photo d'accueil** : Upload et gestion des images
- **Mini application** : Configuration de l'URL et du texte du bouton
- **Services** : Personnalisation des textes et photos
- **Sous-menus** : Création et gestion des sous-sections

#### 🔗 Gestion des Réseaux Sociaux
- **Ajout/Suppression** de réseaux sociaux
- **Personnalisation** : nom, emoji, URL
- **Réorganisation** par glisser-déposer
- **Activation/Désactivation** individuelle

#### 👥 Gestion des Administrateurs
- **Ajout d'administrateurs** par ID ou @username
- **Suppression d'administrateurs** (sauf l'admin principal)
- **Liste des administrateurs** avec informations détaillées

#### 📊 Statistiques Avancées
- **Utilisateurs totaux** et nouveaux utilisateurs
- **Démarrages** du bot
- **Statistiques temporelles** (aujourd'hui, cette semaine)
- **Administrateurs actifs**

#### 📢 Système de Broadcast
- **Envoi de messages** à tous les utilisateurs
- **Gestion des erreurs** d'envoi
- **Statistiques d'envoi** (envoyés/échecs)

## 🗄️ Gestion des Bases de Données

### SQLite (Recommandé)
- **Persistance locale** des données
- **Facile à sauvegarder** et restaurer
- **Performance optimale** pour les petits bots
- **Support complet** de toutes les fonctionnalités

### Cloudflare D1
- **Déploiement serverless** sur Cloudflare Workers
- **Scalabilité automatique**
- **Synchronisation** entre plusieurs instances
- **Backup automatique**

### En Mémoire (Développement)
- **Développement rapide** sans configuration
- **Données temporaires** (perdues au redémarrage)
- **Tests et prototypes**

## 🔧 Configuration Avancée

### Variables d'Environnement
```env
# Bot
BOT_TOKEN=your_bot_token
ADMIN_ID=your_telegram_id

# Base de données
DB_TYPE=sqlite|d1|memory
DB_NAME=botlanation.db

# Cloudflare (si DB_TYPE=d1)
CLOUDFLARE_ACCOUNT_ID=your_account_id
CLOUDFLARE_DATABASE_ID=your_database_id
CLOUDFLARE_API_TOKEN=your_api_token
```

### Personnalisation
- **Messages** : Tous les textes sont personnalisables
- **Emojis** : Support complet des emojis Unicode
- **Photos** : Upload et gestion des images
- **Boutons** : Disposition et style configurables
- **Services** : Ajout de nouveaux services possible

## 🚀 Déploiement

### VPS avec PM2
```bash
# Installation automatique
./duplicate-botlanation.sh mon-bot MON-BOT token admin_id

# Gestion
./manage-bot.sh start|stop|restart|logs|status
```

### Cloudflare Workers
```bash
# Configuration
wrangler login
wrangler d1 create botlanation-db

# Déploiement
wrangler publish
```

### Docker (Optionnel)
```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY . .
RUN npm install
CMD ["node", "bot-complete.js"]
```

## 📱 Support Mobile

- **Interface responsive** pour tous les appareils
- **Boutons optimisés** pour les écrans tactiles
- **Navigation intuitive** avec retours
- **Messages clairs** et concis

## 🔒 Sécurité

- **Vérification des permissions** pour toutes les actions admin
- **Validation des entrées** utilisateur
- **Protection contre les injections** SQL
- **Gestion des erreurs** robuste
- **Logs détaillés** pour le debugging

## 📈 Performance

- **Base de données optimisée** avec index
- **Mise en cache** des configurations
- **Requêtes asynchrones** pour les performances
- **Gestion mémoire** efficace
- **Monitoring** avec PM2

## 🛠️ Maintenance

- **Logs détaillés** pour le debugging
- **Sauvegarde automatique** (SQLite)
- **Mise à jour facile** via Git
- **Scripts de gestion** inclus
- **Documentation complète**