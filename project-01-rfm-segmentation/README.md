# Projet 1 — Segmentation client orientée valeur (RFM, Pareto, ABC)

## Contexte Business 
Dans un contexte de ressources marketing limitées, une entreprise de retail ne peut pas traiter l'ensemble de sa base clients de manière uniforme. Tous les clients ne contribuent pas de la même façon au chiffre d’affaires, et certaines actions marketing peuvent générer un retour faible, voire négatif. Pour améliorer la performance commerciale, l'entreprise doit comprendre le comportement d'achat de ses clients afin d'identifier ceux qui génèrent le plus de valeur, ceux dont la valeur peut être développée, et ceux pour lesquels une stratégie automatisée ou minimale est plus pertinente.

## Question de décision
Quels clients doivent être priorisés, protégés ou rationalisés afin de maximiser l'impact des investissements marketing et de rétention sur le chiffre d'affaires ?

## Approche analytique
L’approche retenue repose sur une segmentation des clients orientée valeur, dont l’objectif principal est de prioriser les décisions marketing et de rétention en fonction de la contribution réelle de chaque client au chiffre d’affaires.

Dans un premier temps, l'analyse s'appuie sur le comportement d'achat des clients afin d'évaluer leur engagement et leur importance économique. Trois dimensions clés sont utilisées : la récence des achats, la fréquence d'achat et le montant dépensé. Ces dimensions permettent de capturer à la fois l'actualité de la relation client, son intensité et sa valeur monétaire.

Dans un second temps, l'analyse intègre une logique de concentration du chiffre d'affaires inspirée de la loi de Pareto, selon laquelle une minorité de clients génère une part majoritaire des revenus. Cette approche permet d'identifier les clients stratégiques à forte contribution, mais aussi de distinguer les segments à potentiel ou à faible impact économique.

Enfin, la combinaison de l'analyse comportementale et de la concentration du chiffre d'affaires permet de transformer les données clients en catégories directement actionnables. Cette segmentation vise à guider l'allocation des ressources marketing, à protéger les clients à forte valeur, à développer les segments prometteurs et à rationaliser les investissements sur les clients à faible contribution.

## Methodology

### Data preparation
L'analyse repose sur le dataset *Online Retail*, contenant l'historique des transactions clients. Les données ont été préparées afin de ne conserver que les transactions pertinentes pour l'analyse de la valeur client. Les opérations annulées ou non représentatives (quantités ou prix négatifs ou nuls) ont été exclues.

Les transactions ont ensuite été agrégées au niveau client afin d’obtenir une vision consolidée du comportement d'achat. Les variables clés retenues sont la date de transaction, le nombre de commandes et le montant total dépensé par client.

L'analyse est menée sur l'ensemble des transactions disponibles, avec une date de référence correspondant à la dernière transaction observée dans le dataset.

---

### Analyse RFM 
La segmentation comportementale repose sur trois dimensions complémentaires : la récence des achats, la fréquence d'achat et le montant total dépensé. Ces indicateurs permettent d'évaluer respectivement l'actualité de la relation client, son intensité et sa valeur économique.

Chaque dimension est traduite en scores ordinalisés afin de rendre les profils clients comparables et interprétables. Les seuils de scoring ont été définis selon une logique métier, privilégiant la lisibilité et l'actionnabilité plutôt que des découpages purement statistiques.

---

### Concentration des revenus (Pareto)
Afin d'identifier les clients stratégiques du point de vue du chiffre d'affaires, une analyse de concentration des revenus a été réalisée. Cette approche permet de mettre en évidence l'asymétrie de contribution entre clients et de confirmer que la création de valeur repose sur une minorité de la base.

Cette étape est essentielle pour distinguer les clients à forte valeur économique des clients à faible impact, indépendamment de leur comportement récent.

---

### ABC classification
Sur la base de leur contribution au chiffre d'affaires, les clients ont été classés en trois catégories (A, B et C). Cette classification permet de traduire la valeur économique en niveaux de priorité exploitables pour les décisions marketing et de rétention.

---

### Analyse croisée et segmentation
Enfin, les dimensions comportementales (RFM) ont été croisées avec la classification de valeur (ABC) afin de construire une segmentation finale orientée décision. Cette approche permet d'identifier des profils clients distincts tels que les clients stratégiques à protéger, les clients à potentiel qu'on doit développer et les clients pour lesquels une rationalisation des investissements est plus pertinente.

La segmentation a été volontairement limitée à un nombre restreint de groupes afin de faciliter la prise de décision et l'allocation des ressources.

