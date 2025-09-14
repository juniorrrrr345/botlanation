# Guide d'Installation - BotLanation

## 🚀 Installation Rapide

### 1. Prérequis
- Node.js 18+ installé
- Un bot Telegram créé via @BotFather
- Votre ID Telegram (obtenez-le via @userinfobot)

### 2. Installation

```bash
# Cloner le repository
git clone https://github.com/juniorrrrr345/botlanation.git
cd botlanation

# Installer les dépendances
npm install

# Copier le fichier de configuration
cp .env.example .env

# Éditer la configuration
nano .env
```

### 3. Configuration

Éditez le fichier `.env` avec vos informations :

```env
BOT_TOKEN=1234567890:ABCdefGHIjklMNOpqrsTUVwxyz
ADMIN_ID=123456789
DB_TYPE=sqlite
DB_NAME=botlanation.db
```

### 4. Démarrage

```bash
# Mode développement
npm run dev

# Mode production
npm start
```

## 🗄️ Types de Base de Données

### SQLite (Recommandé pour VPS)
```env
DB_TYPE=sqlite
DB_NAME=botlanation.db
```

### Cloudflare D1 (Pour Workers)
```env
DB_TYPE=d1
CLOUDFLARE_ACCOUNT_ID=your_account_id
CLOUDFLARE_DATABASE_ID=your_database_id
CLOUDFLARE_API_TOKEN=your_api_token
```

### En Mémoire (Développement uniquement)
```env
DB_TYPE=memory
```

## 🔧 Configuration du Bot

1. Ouvrez Telegram et cherchez votre bot
2. Tapez `/start` pour tester
3. Tapez `/admin` pour accéder au panel d'administration
4. Configurez les messages, services et réseaux sociaux

## 📦 Déploiement avec PM2

```bash
# Installer PM2
npm install -g pm2

# Démarrer le bot
pm2 start bot.js --name "botlanation"

# Sauvegarder la configuration
pm2 save
pm2 startup
```

## 🌐 Déploiement sur Cloudflare Workers

```bash
# Installer Wrangler
npm install -g wrangler

# Se connecter à Cloudflare
wrangler login

# Configurer wrangler.toml
# Créer la base de données D1
wrangler d1 create botlanation-db

# Déployer
wrangler publish
```

## 🆘 Support

En cas de problème, consultez :
- Les logs : `pm2 logs botlanation`
- La documentation : README.md
- Les issues GitHub