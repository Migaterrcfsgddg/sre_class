# Bearstech — étude d'une entreprise et du SRE

Travail de cours : analyser une entreprise sous l'angle du **Site Reliability Engineering (SRE)**.
Entreprise retenue : **[Bearstech](https://bearstech.com)**, SCOP française d'hébergement et d'infogérance open source (Paris, depuis 2004).

---

## Pourquoi Bearstech ?

- Entreprise **française, indépendante et transparente** : beaucoup d'infos publiques, contrairement aux géants du cloud.
- **SCOP** : tous les salariés sont associés et détiennent 100 % du capital. Modèle de gouvernance rare et vérifiable.
- **20 ans d'exploitation continue** d'infrastructures critiques pour des clients grands comptes (RATP, SNCF, BNP Paribas, La Poste, Reporters Sans Frontières).
- Une démarche **GreenOps chiffrée** — donc mesurable, donc critiquable.

---

## Ce qui est bien (et prouvable)

### Gouvernance
- SCOP immatriculée depuis le 01/11/2004, adhérente à la CGSCOP.
- Un associé = une voix, quel que soit le nombre de parts.
- Décisions collectives : salaires, embauches, stratégie, investissements.
- **Écart salarial maximum de 1 à 2** (contre ~1 à 100 dans le CAC 40).
- Redistribution systématique des profits aux salariés.

### Environnement (GreenOps)
- **PUE 1,36** (optimum théorique = 1,0 ; moyenne mondiale ≈ 1,5).
- **2,5 tCO₂e par salarié**.
- **100 % énergies renouvelables** (hydraulique, garantie d'origine), datacenter DC3 Opcore, Tier 3.
- **Serveurs gardés 10 ans minimum** — ~80 % de l'impact d'un serveur est dans sa fabrication.
- Bilan carbone calculé **par VM** et restitué au client dans un dashboard.
- Réemploi du matériel en Fablabs et associations.

### Communs numériques
- **181 dépôts publics** sur GitHub (`pussh` 266 ★, `phptop` 253 ★).
- Soutien à Framasoft, April, La Quadrature du Net.

### Exploitation
- Astreinte **24/7/365**, GTI 1 h, GTR 2 h, > 99 % de disponibilité.
- Stack de supervision Telegraf / InfluxDB / Grafana.
- Sauvegardes nocturnes répliquées sur un second site à ~300 km.

---

## Ce qui est moins bien (les limites)

### 1. Bearstech n'est PAS une entreprise SRE
C'est la limite principale, et elle est assumée dans ce travail.

- Le terme **« SRE » n'apparaît nulle part** sur leur site (ni page DevOps, ni glossaire).
- **Pas de SLO, pas de SLI, pas d'error budget.**
- Pas de postmortems publics, pas de status page.
- Ni toil, ni on-call formalisé, ni culture blameless documentée.
- Ce qu'ils affichent (GTI/GTR/99 %) est un **SLA contractuel d'infogérance classique**, pas du SRE.

> Le SRE naît chez **Google en 2003** avec Ben Treynor Sloss. En France, le cas le mieux documenté est **OUI.sncf**. Bearstech n'est ni pionnier ni leader du domaine.

### 2. Aucune formalisation RSE
Rien de tout cela n'existe :
- Pacte Mondial de l'ONU
- Rapport ou livret RSE
- Charte d'achats responsables
- Label RSE (Lucie, Numérique Responsable, Planet Tech'Care, B Corp, ESUS)
- ISO 14001 / 27001 / 50001
- BEGES publié à l'ADEME

C'est cohérent avec la taille (**~1,4 M€ de CA, 10–19 salariés**) : aucun seuil réglementaire (CSRD, BEGES) ne s'applique. Mais rien n'est audité par un tiers.

### 3. Méthode carbone maison
Leur calcul n'est rattaché à **aucun référentiel externe** (ni GHG Protocol, ni ADEME, ni Boavizta). Méthode cohérente, mais non vérifiable de l'extérieur.

### 4. Tout le reste est déclaratif
L'écart salarial 1 à 2, la gouvernance participative, le PUE : ce sont leurs propres chiffres. Seul le **statut SCOP** est juridiquement opposable.

### 5. Petite taille
~15 personnes. Peu de publications, pas de conférences, pas de contribution reconnue à l'état de l'art de la fiabilité.

---

## L'angle retenu

Plutôt que de présenter Bearstech comme un « leader SRE » — ce qui serait faux — le travail utilise le **SRE comme grille d'analyse** :

1. Rappeler ce qu'est le SRE (Google, 2003) et ses marqueurs : SLI / SLO / error budget, postmortem blameless, réduction du toil, automatisation.
2. Confronter Bearstech à cette grille.
3. Montrer **ce qu'ils font sans le nommer**, ce qu'ils ne formalisent pas, et **pourquoi** (taille, modèle coopératif, clientèle).
4. Ouvrir sur leur vraie originalité : la **sobriété appliquée à l'exploitation**, un axe que le SRE classique ignore largement.

---

## Sources

**Bearstech**
- [Site](https://bearstech.com) · [La SCOP](https://bearstech.com/societe/scop) · [Nos valeurs](https://bearstech.com/societe/nos-valeurs)
- [Démarche GreenOps et éco-conception](https://bearstech.com/societe/efficacite-energetique-et-conscience-ecologique)
- [Les 10 commandements de l'éco-conception](https://bearstech.com/societe/blog/les-10-commandements-de-leco-conception-dinfrastructures-chez-bearstech) (16/01/2025)
- [Bilan carbone de votre infrastructure](https://bearstech.com/services/hebergement-et-infogerance/dashboard-de-pilotage-multi-cloud/bilan-carbone-de-votre-infrastructure)
- [Hébergement et infogérance](https://bearstech.com/services/hebergement-et-infogerance) · [DevOps](https://bearstech.com/devops) · [Métrologie et supervision](https://bearstech.com/devops/metrologie-et-supervision)
- [Références clients](https://bearstech.com/societe/references) · [GitHub](https://github.com/bearstech)

**Données légales**
- [Pappers — SIREN 479227993](https://www.pappers.fr/entreprise/bearstech-479227993) · [Societe.com](https://www.societe.com/societe/bearstech-479227993.html) · [Fiche CGSCOP](https://www.les-scop.coop/bearstech)

**SRE**
- [Google SRE](https://sre.google/) · [Wikipedia — Site reliability engineering](https://en.wikipedia.org/wiki/Site_reliability_engineering)
- [OUI.sncf et le SRE — Blog du Modérateur](https://www.blogdumoderateur.com/oui-sncf-sre/)

*Sources consultées le 21 septembre 2026.*
