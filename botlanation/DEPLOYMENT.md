# Guide de Déploiement - BotLanation

## 🚀 Déploiement Rapide

### Option 1: Script Automatique (Recommandé)

```bash
# Cloner BotLanation
git clone https://github.com/juniorrrrr345/botlanation.git
cd botlanation

# Rendre le script exécutable
chmod +x duplicate-botlanation.sh

# Dupliquer le bot
./duplicate-botlanation.sh mon-bot MON-BOT 123456:ABCdef... 123456789
```

### Option 2: Installation Manuelle

```bash
# 1. Cloner le repository
git clone https://github.com/juniorrrrr345/botlanation.git
cd botlanation

# 2. Installer les dépendances
npm install

# 3. Configurer l'environnement
cp .env.example .env
nano .env

# 4. Démarrer le bot
npm start
```

## 🖥️ Déploiement sur VPS

### Prérequis
- Ubuntu/Debian/CentOS
- Node.js 18+
- PM2 (optionnel mais recommandé)
- Un bot Telegram créé via @BotFather

### Installation PM2
```bash
npm install -g pm2
pm2 startup
```

### Configuration
```bash
# Créer le fichier .env
cat > .env << EOF
BOT_TOKEN=your_bot_token_here
ADMIN_ID=your_telegram_id_here
DB_TYPE=sqlite
DB_NAME=botlanation.db
NODE_ENV=production
EOF

# Démarrer avec PM2
pm2 start bot-complete.js --name "botlanation"
pm2 save
```

### Gestion du Bot
```bash
# Voir les logs
pm2 logs botlanation

# Redémarrer
pm2 restart botlanation

# Arrêter
pm2 stop botlanation

# Statut
pm2 status botlanation
```

## ☁️ Déploiement sur Cloudflare Workers

### Prérequis
- Compte Cloudflare
- Wrangler CLI installé
- Bot Telegram configuré

### Installation Wrangler
```bash
npm install -g wrangler
wrangler login
```

### Configuration
```bash
# Créer la base de données D1
wrangler d1 create botlanation-db

# Configurer les secrets
wrangler secret put BOT_TOKEN
wrangler secret put ADMIN_ID

# Déployer
wrangler publish
```

### Configuration du Webhook
```bash
# Définir le webhook (remplacez YOUR_WORKER_URL)
curl "https://api.telegram.org/bot<YOUR_BOT_TOKEN>/setWebhook?url=https://YOUR_WORKER_URL.workers.dev/webhook"
```

## 🐳 Déploiement avec Docker

### Dockerfile
```dockerfile
FROM node:18-alpine

WORKDIR /app

# Copier les fichiers
COPY package*.json ./
RUN npm ci --only=production

COPY . .

# Créer un utilisateur non-root
RUN addgroup -g 1001 -S nodejs
RUN adduser -S botlanation -u 1001
USER botlanation

EXPOSE 3000

CMD ["node", "bot-complete.js"]
```

### Docker Compose
```yaml
version: '3.8'
services:
  botlanation:
    build: .
    environment:
      - BOT_TOKEN=your_bot_token
      - ADMIN_ID=your_admin_id
      - DB_TYPE=sqlite
      - DB_NAME=botlanation.db
    volumes:
      - ./data:/app/data
    restart: unless-stopped
```

### Commandes Docker
```bash
# Construire l'image
docker build -t botlanation .

# Lancer le conteneur
docker run -d --name botlanation \
  -e BOT_TOKEN=your_token \
  -e ADMIN_ID=your_id \
  -v $(pwd)/data:/app/data \
  botlanation

# Voir les logs
docker logs botlanation

# Arrêter
docker stop botlanation
```

## 🔧 Configuration Avancée

### Variables d'Environnement

#### Obligatoires
```env
BOT_TOKEN=1234567890:ABCdefGHIjklMNOpqrsTUVwxyz
ADMIN_ID=123456789
```

#### Base de Données
```env
# SQLite (recommandé)
DB_TYPE=sqlite
DB_NAME=botlanation.db

# Cloudflare D1
DB_TYPE=d1
CLOUDFLARE_ACCOUNT_ID=your_account_id
CLOUDFLARE_DATABASE_ID=your_database_id
CLOUDFLARE_API_TOKEN=your_api_token

# En mémoire (développement)
DB_TYPE=memory
```

#### Optionnelles
```env
NODE_ENV=production
PORT=3000
LOG_LEVEL=info
```

### Configuration Nginx (Optionnel)

```nginx
server {
    listen 80;
    server_name your-domain.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

## 📊 Monitoring et Logs

### PM2 Monitoring
```bash
# Interface web
pm2 web

# Monitoring en temps réel
pm2 monit

# Logs avec rotation
pm2 install pm2-logrotate
```

### Logs Personnalisés
```bash
# Voir les logs en temps réel
tail -f /opt/botlanation/logs/bot.log

# Logs avec filtrage
grep "ERROR" /opt/botlanation/logs/bot.log
```

## 🔄 Mise à Jour

### Mise à jour du Code
```bash
cd /opt/botlanation
git pull origin main
npm install
pm2 restart botlanation
```

### Sauvegarde des Données
```bash
# SQLite
cp botlanation.db backup-$(date +%Y%m%d).db

# Cloudflare D1
wrangler d1 export botlanation-db --output backup.sql
```

## 🆘 Dépannage

### Problèmes Courants

#### Bot ne répond pas
```bash
# Vérifier les logs
pm2 logs botlanation

# Vérifier le token
curl "https://api.telegram.org/bot<TOKEN>/getMe"

# Redémarrer
pm2 restart botlanation
```

#### Erreurs de base de données
```bash
# Vérifier les permissions
ls -la botlanation.db

# Réparer SQLite
sqlite3 botlanation.db ".recover" | sqlite3 botlanation-fixed.db
```

#### Problèmes de mémoire
```bash
# Vérifier l'utilisation
pm2 monit

# Redémarrer si nécessaire
pm2 restart botlanation
```

### Support
- 📧 Issues GitHub
- 📖 Documentation complète
- 💬 Communauté Telegram