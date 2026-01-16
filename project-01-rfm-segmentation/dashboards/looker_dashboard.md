# Dashboard Looker Studio — RFM Segmentation & Priorisation Clients

**Lien du dashboard** :  https://lookerstudio.google.com/reporting/ba8c33e4-7c54-4aa1-9b53-aaf942626280


---

## Objectifs du dashboard

Ce dashboard a été conçu comme un **outil d’aide à la décision pour le COMEX / Marketing**, avec trois objectifs principaux :

- Comprendre **où se concentre réellement le chiffre d’affaires**
- Identifier les **segments clients à forte valeur ou à risque**
- Aider à la **priorisation budgétaire et opérationnelle** (P1 / P2 / P3)

---

## Périmètre des données

- Transactions clients valides (quantité > 0, prix unitaire > 0)
- Analyse life-to-date
- Date de référence : dernière date de commande du dataset
- Segmentation basée sur la méthodologie RFM métier (non statistique)

---

## Visuels principaux du dashboard

### 1. Répartition des clients par segment (RFM)

**Type** : Pie chart  
**Objectif** :  
Montrer la distribution des clients entre les segments :
- VIP
- Récents
- Fidèles
- À Risque
- Dormants

👉 Permet de constater que **la majorité des clients n'appartient pas aux segments les plus rentables**.

---

### 2. Contribution au chiffre d'affaires par segment

**Type** : Bar chart  
**Objectif business (clé)** :  
Comparer la **contribution réelle au CA** de chaque segment.

👉 Met en évidence que :
- Une **minorité de segments** génère l'essentiel du chiffre d’affaires
- Les VIP et clients récents concentrent une part disproportionnée du CA

---

### 4. Table — Top clients à forte valeur

**Type** : Table  
**Contenu** :
- Segment RFM  
- Classe ABC intra-segment 
- Code Priorité
-  Priorité exécutive (P1 / P2 / P3)
- Budget Categorie
- CA
- NB clients

👉 Vue actionnable pour les équipes CRM / Sales.

---

### 5. KPI exécutifs (Scorecards)

**Indicateurs clés affichés** :
- Nombre total de clients
- Nombre de clients VIP
- % du CA généré par les Top 20 % clients
- Nombre de clients À Risque
- Répartition des clients par priorité (P1 / P2 / P3)

---

## Logique de priorisation business

### Priorité 1 — Investir (P1)
Segments concernés :
- VIP A
- À Risque A

🎯 Objectif :  
Protéger le chiffre d'affaires existant et éviter les pertes critiques.

---

### Priorité 2 — Maintenir / Tester (P2)
Segments concernés :
- VIP B
- Récents A
- Fidèles A

🎯 Objectif :  
Développer le potentiel et faire monter ces clients en valeur.

---

### Priorité 3 — Automatiser / Limiter les coûts (P3)
Segments concernés :
- Dormants
- Fidèles C
- À Risque C

🎯 Objectif :  
Réduire les coûts marketing sur les clients à faible ROI.

---

## Bonnes pratiques d’interprétation

- Le nombre de clients **ne doit jamais être confondu avec la valeur créée**
- Les segments à faible volume peuvent représenter un **enjeu financier majeur**
- La priorisation P1 / P2 / P3 permet une **lecture immédiate pour la prise de décision**

---

## Statut du dashboard

- Dashboard finalisé
- Basé sur des tables agrégées issues des scripts SQL et R
- Captures d'écran disponibles dans `visuals/screenshots`

**Dernière mise à jour** : Janvier 2026
