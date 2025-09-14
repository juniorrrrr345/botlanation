# Guide de Contribution - BotLanation

## 🤝 Comment Contribuer

Nous accueillons toutes les contributions à BotLanation ! Que ce soit pour corriger des bugs, ajouter des fonctionnalités, ou améliorer la documentation.

## 🚀 Démarrage Rapide

### 1. Fork du Repository
1. Allez sur [BotLanation GitHub](https://github.com/juniorrrrr345/botlanation)
2. Cliquez sur "Fork" en haut à droite
3. Clonez votre fork localement

```bash
git clone https://github.com/VOTRE_USERNAME/botlanation.git
cd botlanation
```

### 2. Configuration de l'Environnement
```bash
# Installer les dépendances
npm install

# Copier la configuration
cp .env.example .env

# Configurer votre bot de test
nano .env
```

### 3. Créer une Branche
```bash
git checkout -b feature/nom-de-votre-fonctionnalite
# ou
git checkout -b fix/nom-du-bug
```

## 📝 Types de Contributions

### 🐛 Correction de Bugs
- Identifiez le problème
- Créez une issue détaillée
- Proposez une solution
- Testez votre correction

### ✨ Nouvelles Fonctionnalités
- Discutez de l'idée dans une issue
- Implémentez la fonctionnalité
- Ajoutez des tests si nécessaire
- Mettez à jour la documentation

### 📚 Amélioration de la Documentation
- Corrigez les erreurs
- Améliorez la clarté
- Ajoutez des exemples
- Traduisez dans d'autres langues

## 🔧 Standards de Code

### Style de Code
- Utilisez des noms de variables clairs
- Commentez le code complexe
- Suivez les conventions JavaScript/Node.js
- Utilisez des emojis dans les messages utilisateur

### Structure des Fichiers
```
botlanation/
├── bot-complete.js      # Bot principal
├── config.js           # Configuration
├── db-*.js             # Gestionnaires de base de données
├── worker.js           # Cloudflare Worker
├── docs/               # Documentation
├── tests/              # Tests
└── examples/           # Exemples
```

### Messages de Commit
```bash
# Format
type(scope): description

# Exemples
feat(admin): add user management
fix(db): resolve SQLite connection issue
docs(readme): update installation guide
style(ui): improve button layout
refactor(bot): simplify message handling
```

## 🧪 Tests

### Tests Locaux
```bash
# Tester le bot
npm test

# Tester avec différents types de DB
DB_TYPE=memory npm test
DB_TYPE=sqlite npm test
```

### Tests de Fonctionnalités
1. Testez toutes les commandes utilisateur
2. Vérifiez le panel d'administration
3. Testez avec différents types de base de données
4. Vérifiez la gestion des erreurs

## 📋 Processus de Contribution

### 1. Créer une Issue
- Décrivez clairement le problème ou la fonctionnalité
- Utilisez les templates d'issue fournis
- Assignez les labels appropriés

### 2. Développer
- Créez une branche à partir de `main`
- Implémentez votre solution
- Ajoutez des tests si nécessaire
- Mettez à jour la documentation

### 3. Tester
- Testez votre code localement
- Vérifiez que tous les tests passent
- Testez avec différents environnements

### 4. Soumettre une Pull Request
- Décrivez clairement vos changements
- Référencez l'issue liée
- Attendez la review

## 🔍 Review Process

### Critères de Review
- ✅ Code fonctionne correctement
- ✅ Tests passent
- ✅ Documentation mise à jour
- ✅ Pas de régression
- ✅ Style de code cohérent

### Feedback
- Soyez constructif dans vos commentaires
- Expliquez vos suggestions
- Respectez les autres contributeurs
- Apprenez des retours

## 📚 Documentation

### Mise à Jour de la Documentation
- README.md : Vue d'ensemble du projet
- INSTALLATION.md : Guide d'installation
- DEPLOYMENT.md : Guide de déploiement
- FEATURES.md : Liste des fonctionnalités
- CONTRIBUTING.md : Ce guide

### Standards de Documentation
- Utilisez un langage clair et simple
- Ajoutez des exemples de code
- Incluez des captures d'écran si nécessaire
- Vérifiez l'orthographe et la grammaire

## 🐛 Signaler des Bugs

### Template d'Issue
```markdown
## Description
Description claire du problème

## Étapes pour Reproduire
1. Aller à '...'
2. Cliquer sur '...'
3. Voir l'erreur

## Comportement Attendu
Ce qui devrait se passer

## Comportement Actuel
Ce qui se passe réellement

## Environnement
- OS: [ex: Ubuntu 20.04]
- Node.js: [ex: 18.17.0]
- Type de DB: [ex: SQLite]
- Version: [ex: 1.0.0]

## Logs
```
Logs d'erreur si disponibles
```
```

## ✨ Proposer des Fonctionnalités

### Template d'Issue
```markdown
## Description
Description claire de la fonctionnalité

## Problème Résolu
Quel problème cette fonctionnalité résout-elle ?

## Solution Proposée
Comment proposez-vous de l'implémenter ?

## Alternatives
Y a-t-il d'autres solutions possibles ?

## Contexte Additionnel
Toute autre information pertinente
```

## 🏷️ Labels

### Types d'Issues
- `bug` : Problème à corriger
- `enhancement` : Amélioration
- `feature` : Nouvelle fonctionnalité
- `documentation` : Documentation
- `question` : Question

### Priorité
- `priority: high` : Critique
- `priority: medium` : Important
- `priority: low` : Optionnel

### Statut
- `status: needs-triage` : À trier
- `status: in-progress` : En cours
- `status: blocked` : Bloqué
- `status: needs-review` : À revoir

## 📞 Support

### Questions
- 📧 Issues GitHub
- 💬 Discussions GitHub
- 📖 Documentation

### Communication
- Soyez respectueux
- Utilisez un langage clair
- Fournissez des détails
- Soyez patient

## 🎉 Reconnaissance

### Contributeurs
Tous les contributeurs sont listés dans le README et reconnus pour leurs efforts.

### Types de Contributions
- Code
- Documentation
- Tests
- Design
- Traduction
- Support

## 📄 Licence

En contribuant, vous acceptez que vos contributions soient sous licence MIT.

---

Merci de contribuer à BotLanation ! 🚀