# 🏪 SuperSmartMarket – Audit d’un Environnement de Données

Projet réalisé dans le cadre de la formation **Data Engineer – OpenClassrooms**.

Ce projet consiste à auditer un environnement de données décisionnel (OLAP) afin d’identifier des incohérences dans les indicateurs métiers, notamment le **chiffre d’affaires**, puis de proposer des recommandations pour améliorer la qualité et la fiabilité des données.

---

##  ---Objectif du projet---

Les objectifs de ce projet sont :

- comprendre l’architecture data d’une entreprise
- analyser la qualité et la cohérence des données
- identifier les causes d’incohérences dans les indicateurs
- reconstruire un prototype de base de données local (POC)
- valider les données via des requêtes SQL
- analyser les logs pour comprendre les modifications
- proposer des recommandations pour améliorer le système

---

##  ---Contexte métier---

L’entreprise **SuperSmartMarket** utilise une architecture décisionnelle basée sur :

- une base de données relationnelle
- un entrepôt de données (**OLAP**)
- un outil de visualisation (**Power BI**)

Les données sont utilisées pour analyser les performances commerciales et personnaliser l’expérience client.

Cependant, des incohérences ont été observées dans le **chiffre d’affaires**, qui varie pour une même date. 

---

## ---Architecture des données---

Flux de données :


Sources métiers → ETL → Entrepôt OLAP → Power BI


L’audit a permis de comprendre :

- la structure des données
- les flux d’alimentation
- les points de transformation
- les risques liés à la qualité des données

---

## ---Étapes du projet---

### 1. Analyse de la base de données

- étude du fichier à plat OLAP
- création d’un **dictionnaire des données**
- conception d’un **schéma relationnel**
- compréhension des dimensions et tables de faits

---

### 2. Création d’un prototype (POC)

- mise en place d’une base locale (**SQLite**)
- création des tables
- import des données CSV
- vérification de la cohérence des données

---

### 3. Analyse SQL

Requêtes réalisées :

- chiffre d’affaires total
- top 10 clients
- chiffre d’affaires par employé

👉 Résultat validé :
**284 243,88 € pour le 14 août** 

---

### 4. Analyse des logs

- intégration des logs dans la base
- analyse des actions (INSERT, UPDATE, DELETE)
- compréhension des modifications de données 

👉 Résultat clé :

- certaines ventes ont été **insérées avec un jour de retard**
- ce décalage explique la variation du chiffre d’affaires 

---

### 5. Identification du problème

Le problème principal identifié est :

❌ **Retard d’intégration des données**

- ventes du 14/08 insérées le 15/08
- chiffre d’affaires incomplet lors du premier calcul
- mise à jour tardive des indicateurs

👉 Écart identifié :
**9 057,29 €** 

---

##  ---Résultats de l’audit---

###  Constats

- incohérence du chiffre d’affaires
- instabilité des indicateurs dans le temps
- manque de synchronisation des flux de données

###  Impacts

- perte de fiabilité des analyses
- risque de mauvaise prise de décision
- manque de confiance dans les données

---

##  ---Recommandations---

Plusieurs solutions ont été proposées :

### 1. Historisation des prix

- stocker les prix avec une période de validité
- garantir la stabilité des indicateurs dans le temps

### 2. Stockage du prix dans la table ventes

- ajout d’une colonne `prix_unitaire`
- calcul basé sur le prix au moment de la vente

### 3. Amélioration des logs

- meilleure traçabilité des modifications
- ajout des anciennes et nouvelles valeurs

### 4. Contrôles qualité

- contraintes sur les données
- alertes en cas d’anomalie

👉 Ces recommandations visent à améliorer la **fiabilité des données** et la **qualité des analyses** 

---

##  ---Technologies utilisées---

- **SQL**
- **SQLite**
- **Modélisation relationnelle**
- **OLAP**
- **Analyse de logs**
- **Data Quality**
- **Power BI**

---

## ---Livrables du projet---

### 📊 Présentation

- Support PowerPoint présentant :
  - architecture data
  - schéma relationnel
  - résultats SQL
  - analyse du problème
  - recommandations

👉 Fichier : `presentation_powerpoint.pdf` 


---

### 📄 Rapport d’audit

- document structuré avec :
  - constats
  - analyse des causes
  - évaluation des risques
  - recommandations
  - plan d’action

👉 Fichier : `rapport_audit.pdf` 

---

## ---Compétences développées---

Ce projet met en pratique :

- audit de systèmes de données
- analyse de qualité des données
- modélisation de bases de données
- écriture de requêtes SQL
- analyse de logs
- compréhension des architectures OLAP
- formulation de recommandations data

---

## ---Conclusion---

Ce projet met en évidence l’importance de la **qualité des données** dans les systèmes décisionnels.

L’analyse a permis d’identifier un problème critique de **retard d’intégration**, impactant directement les indicateurs métiers.

Les solutions proposées permettent de :

- stabiliser les données
- améliorer la fiabilité des analyses
- renforcer la gouvernance data

---

## ---Auteur---

**YAD95**  
Projet OpenClassrooms – Data Engineer
