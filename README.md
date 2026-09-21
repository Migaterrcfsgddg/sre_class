# Bearstech — étude d'une entreprise et du SRE

Travail de cours : analyser une entreprise sous l'angle du **Site Reliability Engineering (SRE)**.
Entreprise retenue : **[Bearstech](https://bearstech.com)**, SCOP française d'hébergement et d'infogérance open source (Paris, depuis 2004).

> **Conclusion en une phrase :** Bearstech n'est ni pionnière ni leader en SRE — le mot n'apparaît nulle part chez eux. Mais c'est un excellent **cas d'étude par contraste** : une TPE coopérative qui applique certains principes SRE sans jamais les nommer ni les formaliser.

---

## Sommaire

1. [Pourquoi Bearstech](#1-pourquoi-bearstech)
2. [Ce qui est bien (et prouvable)](#2-ce-qui-est-bien-et-prouvable)
3. [Ce qui est moins bien — les limites](#3-ce-qui-est-moins-bien--les-limites)
4. [Mesures : leur site est-il léger ?](#4-mesures--leur-site-est-il-léger-)
5. [Comparaison avec d'autres entreprises](#5-comparaison-avec-dautres-entreprises)
6. [Chartes, engagements et certifications](#6-chartes-engagements-et-certifications)
7. [L'angle retenu pour la présentation](#7-langle-retenu-pour-la-présentation)
8. [Sources](#8-sources)

---

## 1. Pourquoi Bearstech ?

- Entreprise **française, indépendante et transparente** : beaucoup d'infos publiques, contrairement aux géants du cloud.
- **SCOP** : tous les salariés sont associés et détiennent 100 % du capital. Modèle de gouvernance rare et juridiquement vérifiable.
- **20 ans d'exploitation continue** d'infrastructures critiques (RATP, SNCF, BNP Paribas, La Poste, Reporters Sans Frontières).
- Une démarche **GreenOps chiffrée** — donc mesurable, donc critiquable.

---

## 2. Ce qui est bien (et prouvable)

### Gouvernance — le point le plus solide

Le statut SCOP est **enregistré, pas déclaratif** : c'est la seule chose réellement opposable dans tout leur discours.

| Élément | Preuve |
|---|---|
| SARL coopérative ouvrière de production, depuis le 01/11/2004 | RCS, SIREN 479227993 |
| Adhérente à la Confédération générale des SCOP | Fiche officielle CGSCOP |
| Tous les salariés associés, 100 % du capital | bearstech.com/societe/scop |
| Un associé = une voix, quel que soit le nombre de parts | idem |
| Décisions collectives : salaires, embauches, stratégie, investissements | idem |
| **Écart salarial maximum de 1 à 2** | idem *(déclaratif, non audité)* |
| Redistribution systématique des profits aux salariés | Nos valeurs |

L'écart 1 à 2 est un chiffre fort : la moyenne du CAC 40 tourne autour de 1 à 100.

### Environnement (GreenOps)

- **PUE moyen 1,36** (optimum théorique = 1,0 ; moyenne mondiale ≈ 1,5)
- **2,5 tCO₂e par salarié**
- **100 % énergies renouvelables** (hydraulique, garantie d'origine), datacenter DC3 Opcore (Vitry-sur-Seine), Tier 3
- **Serveurs gardés 10 ans minimum** — ~80 % de l'impact d'un serveur est dans sa fabrication
- Bilan carbone calculé **par VM** et restitué au client dans un dashboard (scopes 1, 2 et 3)
- Freecooling indirect, circuit d'eau fermé ; indicateurs WUE et rDCE suivis
- Réemploi du matériel en Fablabs et associations

### Communs numériques

- **181 dépôts publics** sur GitHub (`pussh` 266 ★, `phptop` 253 ★)
- Soutien à Framasoft, April, La Quadrature du Net

### Exploitation

- Astreinte **24/7/365**, GTI 1 h, GTR 2 h, > 99 % de disponibilité
- Supervision Telegraf / InfluxDB / Grafana
- Sauvegardes nocturnes répliquées sur un second site (~300 km)
- Infra web très bien réglée : **TTFB 14–33 ms**, HTTP/2, gzip, cache Varnish, HSTS preload, CSP stricte

---

## 3. Ce qui est moins bien — les limites

### 3.1 Bearstech n'est PAS une entreprise SRE

C'est la limite principale, et elle est assumée dans ce travail.

- Le terme **« SRE » n'apparaît nulle part** : 0 occurrence dans le HTML du site, absent de la page DevOps et du glossaire.
- **Pas de SLO, pas de SLI, pas d'error budget.**
- **Aucune status page publique** (`status.bearstech.com` n'existe pas ; `bearstech.statuspage.io` renvoie une page générique Atlassian).
- **Aucun postmortem public.**
- Ni toil, ni on-call formalisé, ni culture blameless documentée.
- Ce qu'ils affichent (GTI 1 h / GTR 2 h / 99 %) est un **SLA contractuel d'infogérance classique**, pas du SRE.

> Le SRE naît chez **Google en 2003** avec Ben Treynor Sloss. En France, le cas le mieux documenté est **OUI.sncf**.

### 3.2 Aucune formalisation RSE

Rien de tout cela n'existe :

| ❌ Absent | |
|---|---|
| Pacte Mondial de l'ONU | Rapport ou livret RSE |
| Charte d'achats responsables | Label RSE (Lucie, NR, Planet Tech'Care, B Corp, ESUS) |
| ISO 14001 / 27001 / 50001 | BEGES publié à l'ADEME |

Cohérent avec la taille (**1,41 M€ de CA, 10–19 salariés**) : aucun seuil réglementaire (CSRD, BEGES) ne s'applique. Mais **rien n'est audité par un tiers**.

### 3.3 Méthode carbone maison

Leur calcul n'est rattaché à **aucun référentiel externe** (ni GHG Protocol, ni ADEME, ni Boavizta). Méthode cohérente, mais invérifiable de l'extérieur.

### 3.4 L'EcoIndex : outil possédé, jamais publié

Ils citent le **plugin « sustainable » de Sitespeed.io** (qui calcule l'EcoIndex) et disent le mettre à disposition de leurs équipes :

> « qu'ils peuvent déclencher à volonté, notamment pour visualiser l'impact sur les performances d'une mise à jour avant sa mise en production »

Mais **aucun score n'est publié** : pas de note A–G, pas de rapport GreenIT-Analysis, nulle part.

### 3.5 « On éteint les serveurs » : dit, jamais démontré

C'est le **commandement n°1** de leur article d'éco-conception, et la formulation complète tient en une phrase :

> « quand on n'a pas besoin d'un serveur, on l'éteint »

Rien derrière : aucun mécanisme d'**auto-shutdown**, pas de **scheduler** nuit/week-end, pas de **scale-to-zero**, aucun chiffre (combien de VM, quelles économies). Du déclaratif pur — alors qu'ailleurs ils donnent des chiffres précis.

Leur seule pratique d'achat documentée (commandement n°5) :

> « nous orientons nos choix pour des équipements de qualité, robustes et réparables (donc cher), qui nous permet de garantir une durée en exploitation optimale de plus de 10 ans »

### 3.6 Petite taille

~15 personnes. Peu de publications, pas de conférences, pas de contribution reconnue à l'état de l'art de la fiabilité.

---

## 4. Mesures : leur site est-il léger ?

Mesures réalisées le **21/09/2026** avec [`mesure_ecoindex.py`](./mesure_ecoindex.py) (curl + recalcul de l'algorithme EcoIndex du collectif GreenIT : DOM / nb requêtes / poids).

### Résultats Bearstech

| Page | DOM | Requêtes | Poids | Score | **Note** |
|---|---|---|---|---|---|
| **Accueil** | 1 296 | 42 | **2,26 Mo** | 19,8/100 | **F** |
| **Références clients** | 533 | 59 | **2,78 Mo** | 34,1/100 | **E** |
| Article « 10 commandements » | 495 | 15 | 469 Ko | 55,5/100 | C |
| Page GreenOps | 583 | 9 | 313 Ko | 58,4/100 | C |

*Chiffres pour la page entièrement parcourue (ce que mesurent EcoIndex et GreenIT-Analysis). Au chargement initial seul, l'accueil est à ~292 Ko → D.*

### La cause est simple

**100 % des images sont en PNG. Zéro WebP, zéro AVIF.** 92 PNG sur les pages testées, essentiellement des captures d'écran non optimisées :

- `screely-1669216066451.png` → **293 Ko**
- `screely-1669216173625.png` → **222 Ko**
- `dashboard-removebg-preview.png` → **185 Ko**
- `vue-top.png` → **118 Ko**, servie **deux fois** (`vue-top.png` et `vue-top (1).png` — même fichier dupliqué)

En WebP : 60–80 % d'économie typique. L'accueil passerait sous 700 Ko sans perte visible.

### Le paradoxe

Ils optimisent parfaitement la couche qu'ils **vendent** (serveur, cache, réseau : TTFB 14 ms, gzip ×6, Varnish, lazy-loading sur 68 des 71 images) et négligent la couche qu'ils ne vendent pas (leur contenu éditorial). **Le site qui explique l'éco-conception est noté F.**

À nuancer : ils sont hébergeurs, pas agence web. Et 80 % de l'impact d'un serveur étant dans sa fabrication, leur priorité « 10 ans de durée de vie » est objectivement plus impactante qu'une image WebP. Mais le décalage discours/vitrine est réel et démontrable en direct.

> ⚠️ **Précaution méthodologique :** ces scores sont une *réimplémentation* de l'algorithme EcoIndex, pas la mesure officielle d'[ecoindex.fr](https://www.ecoindex.fr/) (leur API publique ne répond plus sur les endpoints testés). Les quantiles sont ceux du collectif GreenIT, mais la mesure officielle utilise un navigateur headless réel. Attendre ±1 note d'écart. **Pour la soutenance : relancer la mesure via l'extension GreenIT-Analysis ou ecoindex.fr** — plus crédible, et la démo en direct fait son effet.

---

## 5. Comparaison avec d'autres entreprises

### 5.1 Qui compare-t-on ?

| | **Bearstech** | **Enix** | **Scaleway** |
|---|---|---|---|
| Forme | SCOP (SARL coop.) | SAS | SAS, filiale du groupe Iliad |
| Créée en | 2004 | 2004 | 1999 (Online.net) |
| Effectif | 10–19 | 20–49 | plusieurs centaines |
| CA / résultat | CA 1,41 M€ · RN 218 k€ (2025) | RN 995 k€ · fonds propres 2,3 M€ (2025) | non isolé (groupe Iliad) |
| Capital social | 5 000 € | 500 000 € | — |
| Métier | Hébergement + infogérance LAMP/Docker | Infogérance Kubernetes / Cloud Native | Cloud public (IaaS/PaaS) |

**Enix est le comparable le plus juste** : même année de création, même ville, même métier (infogérance d'infra critique), taille du même ordre. **Scaleway sert de contre-point** : ce que fait un acteur 100× plus gros.

### 5.2 Marqueurs SRE et transparence publique

C'est le cœur de la comparaison. Tous ces points sont **vérifiables publiquement** (vérifiés le 21/09/2026).

| Marqueur | Bearstech | Enix | Scaleway | Clever Cloud | Google |
|---|---|---|---|---|---|
| Emploie le terme « SRE » | ❌ 0 occurrence | ❌ 0 occurrence | ❌ 0 sur l'accueil | ⚠️ partiel | ✅ **l'a inventé** |
| SLO / SLI publics | ❌ | ❌ | ❌ | ❌ | ✅ |
| **Status page publique** | ❌ | ❌ | ✅ `status.scaleway.com` | ✅ `status.clever.com` | ✅ |
| **Postmortems publics** | ❌ | ❌ | ⚠️ incidents seulement | ✅ **5 publiés** | ✅ référence |
| Blog d'ingénierie | ⚠️ généraliste | ✅ technique fourni (~60 articles) | ✅ | ✅ | ✅ |
| Contenus observabilité | ⚠️ page produit | ✅ Prometheus, Thanos | ✅ | ✅ | ✅ |
| Open source « fiabilité » | ⚠️ outils sysadmin anciens | ✅ **outils SRE modernes** | ✅ | ✅ | ✅ |
| Certification ISO 27001 | ❌ | ✅ | ✅ | ✅ | ✅ |
| Données environnementales | ✅ chiffrées, non auditées | ❌ **aucune page** | ✅ **auditées** | ⚠️ | ✅ |
| Rapport RSE annuel | ❌ | ❌ | ✅ **depuis 2018** | ❌ | ✅ |
| Label RSE tiers | ❌ | ❌ | ✅ **EcoVadis Gold** | ❌ | ✅ |

### 5.3 Ce que ça dit, entreprise par entreprise

**Enix — le vrai comparable, et il gagne sur la technique**

Même taille, même âge, et pourtant :
- **ISO 27001** (Bearstech n'a aucune certification) + organisme de formation **Qualiopi**
- Open source nettement plus fort et plus pertinent pour la fiabilité :
  - `x509-certificate-exporter` — **951 ★**, un exporter Prometheus pour certificats X.509, pensé pour Kubernetes. C'est un **outil SRE au sens strict** : il sert à ne pas tomber sur une expiration de certificat.
  - `kube-image-keeper` — **751 ★**, cache d'images conteneur (résilience au registry down)
  - `netbox-prometheus-sd`, `prometheus-cephfs-exporter`
  - À comparer aux 266 ★ de `pussh` et 253 ★ de `phptop` chez Bearstech, qui sont des outils sysadmin des années 2010.
- Blog technique nourri : Prometheus, Thanos, migration Flux v1→v2 à grande échelle, retours de KubeCon.

**Mais Enix non plus n'est pas SRE** : 0 occurrence du terme, pas de SLO public, pas de status page (`enix.statuspage.io` = page Atlassian générique), pas de postmortem public. Et **aucune page RSE, environnement ou gouvernance** sur tout le site — sur ce terrain, Bearstech est très largement devant.

> **Conclusion croisée :** Enix bat Bearstech sur la crédibilité technique et les certifications. Bearstech bat Enix sur la gouvernance et l'environnement. **Aucun des deux ne fait de SRE au sens formel.** C'est donc une caractéristique du segment (TPE/PME d'infogérance française), pas un défaut propre à Bearstech.

**Scaleway — ce que « leader » veut vraiment dire**

| Indicateur | Bearstech | Scaleway |
|---|---|---|
| PUE | 1,36 *(auto-déclaré)* | **1,37 moyen 2024**, 1,25 sur PAR-DC5 *(publié et audité)* |
| WUE | « suivi » | **0,00009** (PAR-DC3) et **0,00002** (PAR-DC4), chiffrés |
| Durée de vie serveurs | 10 ans | **10 ans** (vs 5-6 ans dans l'industrie) |
| Réemploi | « Fablabs et associations » | **~15 000 serveurs** reconditionnés (prog. *Transformers*), **12 000 disques** en 2024 (prog. *Nursery*) |
| Énergie | 100 % hydraulique (GO) | 100 % éolien/hydraulique (GO) |
| Objectif climat | ❌ aucun | **−90 % scopes 1-2-3 d'ici 2050, validé SBTi** |
| Label tiers | ❌ | **EcoVadis Gold** (top 5 %), Green Web Foundation |
| Rapport d'impact | ❌ | **annuel et public depuis 2018** |
| Calculateur carbone client | ✅ dashboard par VM | ✅ scopes 1-2-3 + impact matériel individualisé + eau |
| Status page | ❌ | ✅ |

**Le point clé : sur le PUE, Bearstech (1,36) fait aussi bien que Scaleway (1,37).** La différence n'est pas la performance — c'est **la preuve**. Scaleway publie, fait auditer (EcoVadis), fait valider ses objectifs (SBTi). Bearstech déclare.

**Mais — et c'est la nuance la plus intéressante — j'ai mesuré leurs sites avec le même script :**

| Site | Requêtes | Poids | **Note EcoIndex** |
|---|---|---|---|
| **Enix** | 52 | 519 Ko | **D** (42,9) |
| **Bearstech** | 42 | 2,26 Mo | **F** (19,8) |
| **Scaleway** | 60 | **2,42 Mo** (dont **1 Mo de JS**) | **F** (10,5) |

**Scaleway, EcoVadis Gold, a la pire note des trois.** Leur site charge 21 fichiers JS pour 1 Mo. Enix, qui ne parle jamais d'environnement, a le site le plus léger — parce qu'il est généré en statique (Hugo) et utilise WebP et SVG.

> **C'est l'argument le plus fort de la présentation :** le discours environnemental d'une entreprise ne prédit pas la sobriété de ses propres pratiques. Enix ne dit rien et fait mieux ; Scaleway dit tout et fait pire ; Bearstech dit beaucoup et fait moyen.

**Clever Cloud — ce à quoi ressemble la transparence SRE en France**

C'est la référence française du postmortem public. **5 postmortems** publiés (2024-08-02, 2025-03-03, 2025-10-09, 2026-03-19, 2026-08-27), avec pour celui du 02/08/2024 :

- une **timeline horodatée de 80+ entrées**, de 10:06 à 22:53 CEST
- une **analyse de cause racine multi-couches** : maintenance Apache Pulsar ratée → pression I/O et CPU → kernel panics
- l'**impact détaillé par produit** (runtimes, bases de données, VPN, observabilité)
- des **actions correctives** listées (mais non datées)
- un **ton blameless** assumé : l'article reconnaît une lacune systémique (« la simulation n'a pas eu lieu ») plutôt que de désigner un responsable

C'est exactement ce que Bearstech ne fait pas. Et c'est faisable à petite échelle — Clever Cloud est une PME française, pas un géant.

---

## 6. Chartes, engagements et certifications

Recherche **plein texte sur les 353 pages du site** (sitemap complet aspiré le 21/09/2026, script reproductible). Les faux positifs de sous-chaîne ont été écartés manuellement en relisant chaque occurrence en contexte.

### 6.1 Chartes et engagements : le résultat est net

| Document recherché | Occurrences | Verdict |
|---|---|---|
| **Pacte Mondial ONU** / Global Compact | **0** | ❌ absent |
| **Charte d'engagement environnemental** | **0** | ❌ absente |
| **Charte / code de conduite fournisseurs** | **0** | ❌ absente |
| **Charte d'achats responsables** | **0** | ❌ absente |
| **Code de conduite anticorruption** | **0** | ❌ absent |
| Déontologie | **0** | ❌ absent |
| Lanceur d'alerte | **0** | ❌ absent |
| Devoir de vigilance | **0** | ❌ absent |
| Loi Sapin (II) | **0** | ❌ absent |
| Parties prenantes | 1 | ⚠️ contexte technique (page PRA) |

**Faux positifs écartés :**
- « corruption » → 3 pages, mais il s'agit de *corruption de données* et *corruption mémoire* (articles Docker, object storage, Rustls). Rien à voir avec l'anticorruption.
- « éthique » → 10 pages, toujours au sens philosophique : « un choix technique et **éthique** » à propos de Debian, « un service **éthique**, transparent » à propos du logiciel libre. **Jamais une charte éthique d'entreprise.**
- « charte » → 2 pages, dont une « **charte graphique** » citée en exemple de ce qu'ils ne font pas.

### 6.2 La seule charte qui existe : la charte IA, et elle n'est pas publiée

Un seul document de ce type est mentionné sur tout le site, dans un article du **24 juillet 2026** :

> « Nous terminons donc la rédaction de notre **charte IA**, qui précise comment nous avons le droit d'utiliser ces outils. »

> « Notre charte IA est donc **entièrement orientée sécurité**. »

Elle définit « quelles données peuvent être envoyées à un LLM, dans quel cadre, selon quel niveau de confidentialité ». Donc :

- c'est une charte **d'usage interne**, pas un engagement envers des partenaires ou fournisseurs ;
- elle est **orientée sécurité**, pas RSE, pas éthique des affaires ;
- à la date de l'article elle était **encore en cours de rédaction** ;
- elle **n'est pas publiée**.

### 6.3 Certifications : l'inventaire

| Norme | Bearstech | Statut réel |
|---|---|---|
| **ISO 27001** (sécurité de l'information) | ❌ | 3 pages en parlent, **jamais comme leur certification** : ils évoquent « les exigences de la norme » ou le besoin d'un client. Une page écrit même « cela vaut tous les ISO 27001 » — ton plutôt distant vis-à-vis de la démarche. |
| **ISO 14001** (management environnemental) | ❌ | 0 occurrence |
| **ISO 9001** (qualité) | ❌ | 0 occurrence |
| **ISO 50001** (énergie) | ❌ | 0 occurrence |
| **EMAS** (règlement européen d'éco-audit) | ❌ | 0 occurrence *(le seul « match » était `storage-sch**emas**.conf` dans un tuto Graphite)* |
| **AFNOR / AFAQ 26000 / Label Engagé RSE** | ❌ | 0 occurrence |
| **EcoVadis** | ❌ | 0 occurrence |

### 6.4 ⚠️ Point méthodologique : « avoir l'ISO 26000 » n'existe pas

À corriger dans la présentation si la question tombe — c'est un piège classique de jury.

**ISO 26000 n'est pas certifiable.** C'est une norme de *lignes directrices* : contrairement à ISO 9001, ISO 14001 ou ISO 45001, elle **ne contient aucune exigence vérifiable par audit externe**. Aucune entreprise au monde ne peut donc être « certifiée ISO 26000 ».

Ce qui existe à la place, en France, via l'AFNOR :

- **AFAQ 26000** — une **évaluation** (créée en 2011), pas une certification, qui positionne l'entreprise sur une échelle de maturité.
- **Label Engagé RSE** — créé en **2021**, dérivé d'ISO 26000 et du GRI, **explicitement conçu pour les PME et les entreprises de moins de 50 salariés**. 8 chapitres, 55 critères, 4 niveaux (initial / progression / confirmé / exemplaire).

> **C'est la recommandation naturelle de ce travail** : le label Engagé RSE est exactement dimensionné pour une structure comme Bearstech. Ils ont déjà la matière (gouvernance SCOP, GreenOps chiffré, écart salarial 1 à 2) — il leur manque uniquement la formalisation et l'audit tiers.

### 6.5 Rien de tout cela ne leur est légalement obligatoire

C'est l'argument de défense à donner, et il est factuel :

| Obligation | Seuil légal | Bearstech (~15 salariés, 1,41 M€ CA) |
|---|---|---|
| **Code de conduite anticorruption** (loi Sapin II, art. 17) | ≥ 500 salariés **ET** > 100 M€ de CA *(critères cumulatifs)* | ❌ **non assujettie** |
| **Devoir de vigilance** (loi de 2017) | ≥ 5 000 salariés en France ou 10 000 dans le monde | ❌ non assujettie |
| **CSRD** (reporting de durabilité) | seuils européens grandes entreprises | ❌ non assujettie |
| **BEGES** (bilan GES réglementaire) | ≥ 500 salariés | ❌ non assujettie |

Donc l'absence de charte anticorruption **n'est pas une faute** : c'est le régime normal d'une TPE. En revanche, l'absence de charte fournisseurs ou d'engagement environnemental formalisé reste un **choix**, pas une contrainte — et c'est là que la critique est légitime.

### 6.6 Comparaison des certifications

| | **Bearstech** | **Enix** | **Scaleway** |
|---|---|---|---|
| ISO 27001 | ❌ | ✅ badge affiché en pied de page | ✅ **ISO/IEC 27001:2022** |
| ISO 27701 (données perso) | ❌ | ❌ | ✅ |
| ISO 50001 (énergie) | ❌ | ❌ | ✅ |
| HDS (données de santé) | ❌ | ❌ | ✅ |
| SecNumCloud (ANSSI) | ❌ | ❌ | ⚠️ en cours (jalon J0 validé) |
| ISO 14001 | ❌ | ❌ | ❌ |
| EMAS | ❌ | ❌ | ❌ |
| ISO 26000 | *non certifiable* | *non certifiable* | *non certifiable* |
| EcoVadis | ❌ | ❌ | ✅ **Gold** (top 5 %) |
| Objectif climat validé SBTi | ❌ | ❌ | ✅ −90 % d'ici 2050 |
| Charte fournisseurs / code éthique | ❌ | ❌ | ✅ **via le groupe Iliad** |
| Rapport RSE annuel public | ❌ | ❌ | ✅ depuis 2018 |

**Trois lectures de ce tableau :**

1. **Bearstech est le seul des trois sans aucune certification.** Même Enix, de taille comparable (20–49 salariés), a décroché ISO 27001. L'argument « on est trop petits » ne tient donc pas complètement.
2. **Nuance sur Enix :** la certification est affichée sous forme de **logo en pied de page**, sans numéro de certificat ni périmètre publié. C'est une revendication, pas une preuve consultable.
3. **Scaleway hérite de son groupe.** Son espace fournisseurs (Iliad) contient code de conduite, code anticorruption, code éthique et charte de relations partenaires. Une filiale d'un grand groupe dispose de cet arsenal « gratuitement » — c'est un effet de structure, pas de vertu.

### 6.7 Ce qu'il faut en retenir pour la présentation

> Bearstech pratique **sans formaliser**, et formalise **sans faire certifier**. Sur les trois niveaux de preuve — *dire* / *documenter* / *faire auditer* — ils s'arrêtent au premier.

C'est défendable pour une TPE, et ça devient un vrai angle critique quand on le met en regard de leur discours : ils publient des chiffres précis (PUE 1,36, 2,5 tCO₂e/salarié, écart salarial 1 à 2) **sans aucun tiers pour les valider**. Scaleway affiche des chiffres du même ordre (PUE 1,37) mais les fait auditer par EcoVadis et valider par la SBTi.

**La différence entre les deux n'est pas la performance. C'est la preuve.**

---

## 7. L'angle retenu pour la présentation

Plutôt que de présenter Bearstech comme un « leader SRE » — ce qui serait faux et se verrait à la première question du jury — le travail utilise le **SRE comme grille d'analyse** :

1. **Rappeler ce qu'est le SRE** (Google, Ben Treynor Sloss, 2003) et ses marqueurs : SLI / SLO / error budget, postmortem blameless, réduction du toil, automatisation.
2. **Confronter Bearstech à cette grille** — résultat : ils échouent sur presque tous les marqueurs formels.
3. **Montrer ce qu'ils font sans le nommer** : astreinte 24/7 réelle, supervision, PRA, GTI/GTR contractuels, 20 ans d'uptime sur des infras critiques.
4. **Élargir : ce n'est pas propre à Bearstech.** Enix, même taille et plus fort techniquement, ne fait pas de SRE formel non plus. Le SRE reste une pratique de grande échelle.
5. **Montrer où est leur vraie originalité** : la **sobriété appliquée à l'exploitation** — un axe que le SRE classique ignore presque totalement. Le livre SRE de Google ne parle jamais de carbone.
6. **Conclure sur la preuve** : comparer Bearstech à Scaleway montre que la différence entre « faire » et « être reconnu » tient à l'audit tiers, pas à la performance. Et la mesure EcoIndex montre que même les labellisés ne sont pas exemplaires partout.

---

## 8. Sources

**Bearstech**
- [Site](https://bearstech.com) · [La SCOP](https://bearstech.com/societe/scop) · [Nos valeurs](https://bearstech.com/societe/nos-valeurs)
- [Démarche GreenOps et éco-conception](https://bearstech.com/societe/efficacite-energetique-et-conscience-ecologique)
- [Les 10 commandements de l'éco-conception](https://bearstech.com/societe/blog/les-10-commandements-de-leco-conception-dinfrastructures-chez-bearstech) (16/01/2025)
- [Bilan carbone de votre infrastructure](https://bearstech.com/services/hebergement-et-infogerance/dashboard-de-pilotage-multi-cloud/bilan-carbone-de-votre-infrastructure)
- [Hébergement et infogérance](https://bearstech.com/services/hebergement-et-infogerance) · [DevOps](https://bearstech.com/devops) · [Métrologie et supervision](https://bearstech.com/devops/metrologie-et-supervision)
- [Références clients](https://bearstech.com/societe/references) · [GitHub](https://github.com/bearstech)
- [Pappers — SIREN 479227993](https://www.pappers.fr/entreprise/bearstech-479227993) · [Fiche CGSCOP](https://www.les-scop.coop/bearstech)

**Enix**
- [enix.io](https://enix.io/fr/) · [Infogérance cloud](https://enix.io/fr/blog/infogerance-cloud/) · [Blog](https://enix.io/fr/blog/) · [GitHub](https://github.com/enix)
- [Pappers — ENIX, SIREN 481912970](https://www.pappers.fr/entreprise/enix-481912970)

**Scaleway**
- [Environmental leadership](https://www.scaleway.com/en/environmental-leadership/) · [Impact Report 2024 (PDF)](https://www-uploads.scaleway.com/Impact_Report2024_A4_FR_0f17976c93.pdf)
- [status.scaleway.com](https://status.scaleway.com/)

**Clever Cloud**
- [Postmortems publics](https://www.clever.cloud/developers/postmortem/) · [Postmortem du 02/08/2024](https://www.clever.cloud/developers/postmortem/2024-08-02/) · [Historique des incidents](https://status.clever.com/history)

**Chartes, normes et obligations légales**
- [ISO 26000 — Groupe AFNOR](https://www.afnor.org/en/corporate-social-responsibility/iso-26000-approach/) · [Label Engagé RSE — AFNOR Certification](https://certification.afnor.org/en/sustainable-development-csr/corporate-social-responsibility-commitment-label)
- [L'ISO 26000 est-elle certifiable ?](https://way2xl.fr/le-blog/rse-et-certification-liso-26000-est-elle-certifiable)
- [Article 17 de la loi Sapin 2 — LexisNexis](https://www.lexisnexis.com/fr-fr/glossaire/article-17-loi-sapin-2) · [Loi Sapin 2, entreprises concernées et seuils](https://www.leto.legal/guides/loi-sapin-2-entreprises-concernees)
- [Charte Relations fournisseurs et achats responsables — economie.gouv.fr](https://www.economie.gouv.fr/mediateur-des-entreprises/la-charte-relations-fournisseurs-et-achats-responsables)
- [Espace fournisseurs Iliad](https://fournisseurs.iliad.fr/login) · [Sécurité et conformité — Scaleway](https://www.scaleway.com/en/security-and-compliance/)
- [Bearstech — PME : l'IA passe en production](https://bearstech.com/blog/pme-lia-passe-en-production) (24/07/2026, mention de la charte IA)

**SRE — références**
- [Google SRE](https://sre.google/) · [SRE Book](https://sre.google/sre-book/introduction/) · [Postmortem culture](https://sre.google/sre-book/postmortem-culture/)
- [Wikipedia — Site reliability engineering](https://en.wikipedia.org/wiki/Site_reliability_engineering)
- [OUI.sncf et le SRE — Blog du Modérateur](https://www.blogdumoderateur.com/oui-sncf-sre/)

**Éco-conception web**
- [EcoIndex.fr](https://www.ecoindex.fr/) · [GreenIT-Analysis (cnumr)](https://github.com/cnumr/GreenIT-Analysis) · [Sous le capot de la mesure EcoIndex — OCTO](https://blog.octo.com/sous-le-capot-de-la-mesure-ecoindex)

---

*Sources consultées et mesures réalisées le 21 septembre 2026. Mesures reproductibles via [`mesure_ecoindex.py`](./mesure_ecoindex.py) :*

```bash
python3 mesure_ecoindex.py "https://bearstech.com/::BEARSTECH" "https://enix.io/fr/::ENIX"
```
