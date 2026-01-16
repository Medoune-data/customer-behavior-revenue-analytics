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

Les opérations de nettoyage et de filtrage ont été réalisées en SQL afin de garantir la qualité des données en amont.
Les agrégations client et la logique de segmentation RFM ont ensuite été implémentées dans R pour bénéficier d'une plus grande flexibilité analytique et faciliter l'exploration métier.

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

## Insights clés

- Une minorité de clients concentre l'essentiel du chiffre d’affaires, confirmant une forte asymétrie de création de valeur au sein de la base clients. Une approche uniforme des actions marketing entraîne donc mécaniquement une dilution des investissements.

- Les clients les plus récents présentent un potentiel de valeur élevé et contribuent significativement au chiffre d'affaires, juste après les clients les plus stratégiques. Leur activation rapide constitue un levier important de croissance.

- Certains clients historiquement rentables montrent des signes de désengagement, ce qui représente un risque direct de perte de chiffre d'affaires futur s'ils ne sont pas identifiés et traités à temps.

- Une large partie de la base clients génère une contribution économique limitée malgré un volume élevé de clients, indiquant que tous les segments ne justifient pas le même niveau d'investissement marketing.

- Les priorités marketing non différenciées risquent de concentrer les efforts sur des segments à faible impact économique, au détriment des clients à forte valeur ou à potentiel.

## Recommandations Business

### Priorité 1 (P1) — Protéger et fidéliser les clients stratégiques
Les clients à forte contribution doivent être considérés comme des actifs stratégiques. L'entreprise doit concentrer ses efforts de rétention sur ces profils afin de sécuriser le chiffre d'affaires existant et d'éviter toute perte de valeur significative. Une attention particulière doit être portée aux signaux de désengagement afin d’anticiper les risques de churn sur les clients les plus rentables.

---

### Priority 2 (P2) — Développer des segments à fort potentiel
Les clients à potentiel représentent un levier de croissance important à moyen terme. L'objectif est de renforcer leur engagement et d'augmenter progressivement leur valeur à travers des actions ciblées et mesurées. Ces segments doivent bénéficier d'un suivi adapté, sans pour autant mobiliser des ressources comparables à celles des clients stratégiques.

---

### Priority 3 (P3) — Rationaliser les segments à faible valeur ajoutée
Les clients à faible contribution ne justifient pas un investissement marketing élevé. L'entreprise doit privilégier des approches automatisées et à faible coût afin de limiter les dépenses tout en maintenant une présence minimale. Cette rationalisation permet de réallouer les ressources vers les segments à plus fort impact économique.

## ⚠️ Limitations & Next Steps

### Limitations

- **Données historiques uniquement**  
  L'analyse repose uniquement sur les transactions passées (life-to-date). Elle ne prend pas en compte des facteurs externes pouvant influencer le comportement futur des clients (saisonnalité, concurrence, promotions à venir).

- **Segmentation statique**  
  La segmentation RFM est calculée à un instant donné à partir d'une date de référence fixe. Elle ne modélise pas l'évolution des clients dans le temps ni leurs transitions entre segments.

- **Seuils RFM définis par logique métier**  
  Les seuils de scoring RFM ont été choisis pour favoriser la lisibilité et l'actionnabilité business. Ils ne résultent pas d’une optimisation statistique ou algorithmique.

- **Variables limitées**  
  L'analyse ne prend pas en compte d'autres dimensions potentielles telles que les catégories de produits, les canaux d'achat ou la sensibilité aux promotions.

### Next Steps

- **Automatisation de la segmentation**  
  Mettre en place une mise à jour régulière (mensuelle ou hebdomadaire) afin de suivre l'évolution des clients entre segments et détecter plus tôt les signaux de risque.

- **Extension vers le CLV prédictif**  
  Compléter la segmentation RFM par une estimation de la valeur future des clients afin de prioriser les décisions non seulement sur la valeur passée mais aussi sur le potentiel long terme (→ voir **Projet 02 - CLV**).

- **Analyse churn orientée revenu**  
  Approfondir les segments À Risque via un modèle de churn permettant d'estimer la perte de chiffre d'affaires future et d'orienter les actions de rétention (→ voir **Projet 04 - Churn**).

- **Exploitation opérationnelle du dashboard**  
  Utiliser le dashboard Looker Studio comme outil de pilotage pour l'allocation budgétaire, le ciblage des campagnes marketing et le suivi des indicateurs clés par segment.

- **Enrichissement des données**  
  Intégrer des variables supplémentaires (catégories produits, canaux, exposition marketing) afin d'affiner la segmentation et d'améliorer la précision des recommandations business.
