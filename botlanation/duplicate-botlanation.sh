#!/bin/bash

# Script de duplication automatique pour BotLanation
# Usage: ./duplicate-botlanation.sh NOM_DOSSIER NOM_PM2 BOT_TOKEN [ADMIN_ID]

# Couleurs pour l'affichage
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Vérifier les arguments
if [ $# -lt 3 ]; then
    echo -e "${RED}❌ Erreur: Nombre d'arguments incorrect${NC}"
    echo "Usage: ./duplicate-botlanation.sh NOM_DOSSIER NOM_PM2 BOT_TOKEN [ADMIN_ID]"
    echo "Exemple: ./duplicate-botlanation.sh shop-bot SHOP-BOT 123456:ABCdef... 123456789"
    exit 1
fi

FOLDER_NAME=$1
PM2_NAME=$2
BOT_TOKEN=$3
ADMIN_ID=${4:-8346344099}  # ID admin par défaut

echo -e "${BLUE}🤖 BotLanation - Script de Duplication${NC}"
echo -e "${YELLOW}🚀 Début de la duplication du bot...${NC}"

# Vérifier si le dossier existe déjà
if [ -d "/opt/$FOLDER_NAME" ]; then
    echo -e "${RED}❌ Erreur: Le dossier /opt/$FOLDER_NAME existe déjà${NC}"
    exit 1
fi

# Vérifier si PM2 est installé
if ! command -v pm2 &> /dev/null; then
    echo -e "${YELLOW}⚠️  PM2 n'est pas installé. Installation...${NC}"
    npm install -g pm2
fi

# Créer le dossier
echo -e "${GREEN}📁 Création du dossier /opt/$FOLDER_NAME${NC}"
mkdir -p /opt/$FOLDER_NAME
cd /opt/$FOLDER_NAME

# Cloner le repository BotLanation
echo -e "${GREEN}📥 Clonage du repository BotLanation...${NC}"
git clone https://github.com/juniorrrrr345/botlanation.git . --quiet

# Installer les dépendances
echo -e "${GREEN}📦 Installation des dépendances...${NC}"
npm install --silent
npm install sqlite3 --silent

# Créer le fichier .env
echo -e "${GREEN}⚙️ Création du fichier .env...${NC}"
cat > .env << EOF
# BotLanation Configuration
BOT_TOKEN=$BOT_TOKEN
ADMIN_ID=$ADMIN_ID

# Base de données SQLite
DB_TYPE=sqlite
DB_NAME=${FOLDER_NAME}.db

# Configuration pour le développement
NODE_ENV=production

# Cloudflare D1 (optionnel, décommentez si nécessaire)
# CLOUDFLARE_ACCOUNT_ID=
# CLOUDFLARE_DATABASE_ID=
# CLOUDFLARE_API_TOKEN=
EOF

# Créer un script de démarrage personnalisé
echo -e "${GREEN}🔧 Création du script de démarrage...${NC}"
cat > start-bot.sh << EOF
#!/bin/bash
cd /opt/$FOLDER_NAME
export NODE_ENV=production
node bot-complete.js
EOF

chmod +x start-bot.sh

# Démarrer le bot avec PM2
echo -e "${GREEN}🤖 Démarrage du bot avec PM2...${NC}"
pm2 start bot-complete.js --name "$PM2_NAME" --env production
pm2 save --force

# Créer un script de gestion
echo -e "${GREEN}📝 Création du script de gestion...${NC}"
cat > manage-bot.sh << EOF
#!/bin/bash
case "\$1" in
    start)
        pm2 start $PM2_NAME
        echo "Bot démarré"
        ;;
    stop)
        pm2 stop $PM2_NAME
        echo "Bot arrêté"
        ;;
    restart)
        pm2 restart $PM2_NAME
        echo "Bot redémarré"
        ;;
    logs)
        pm2 logs $PM2_NAME
        ;;
    status)
        pm2 status $PM2_NAME
        ;;
    *)
        echo "Usage: \$0 {start|stop|restart|logs|status}"
        exit 1
        ;;
esac
EOF

chmod +x manage-bot.sh

# Afficher le résumé
echo -e "${GREEN}✅ BotLanation dupliqué avec succès!${NC}"
echo ""
echo -e "${BLUE}📋 Informations du Bot:${NC}"
echo -e "   📁 Dossier: ${YELLOW}/opt/$FOLDER_NAME${NC}"
echo -e "   🤖 Nom PM2: ${YELLOW}$PM2_NAME${NC}"
echo -e "   💾 Base de données: ${YELLOW}${FOLDER_NAME}.db${NC}"
echo -e "   🔧 Script de gestion: ${YELLOW}./manage-bot.sh${NC}"
echo ""
echo -e "${BLUE}📝 Commandes utiles:${NC}"
echo -e "   📊 Voir les logs: ${YELLOW}pm2 logs $PM2_NAME${NC}"
echo -e "   🔄 Redémarrer: ${YELLOW}pm2 restart $PM2_NAME${NC}"
echo -e "   ⏹️  Arrêter: ${YELLOW}pm2 stop $PM2_NAME${NC}"
echo -e "   📈 Statut: ${YELLOW}pm2 status $PM2_NAME${NC}"
echo ""
echo -e "${BLUE}🎯 Configuration du Bot:${NC}"
echo -e "   1. Ouvrez Telegram et cherchez votre bot"
echo -e "   2. Tapez ${YELLOW}/start${NC} pour tester"
echo -e "   3. Tapez ${YELLOW}/admin${NC} pour configurer"
echo -e "   4. Personnalisez les messages et services"
echo ""
echo -e "${GREEN}🎉 Votre BotLanation est maintenant opérationnel!${NC}"
echo -e "${BLUE}💡 Astuce: Utilisez ${YELLOW}./manage-bot.sh${NC} pour gérer votre bot${NC}"