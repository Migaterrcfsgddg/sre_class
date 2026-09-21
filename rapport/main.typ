#import "template.typ": project

// =====================================================================
// CONFIGURATION DU RAPPORT
// =====================================================================
#show: project.with(
  title: "Bearstech, une SCOP à l'épreuve de la RSE",
  subtitle: "Étude de cas : actions concrètes, chartes, labels, notation extra-financière et analyse critique",
  course: "Responsabilité Sociétale des Entreprises",
  authors: ("Khalil BEMKIRAT", "Germain GODEFROID", "Maurice KONE"),
  professor: "Laurence FRANCESCHI",
  promotion: "2028",
  group: "Apping2_C1",
  date: "Septembre 2026",
)

// Mise en forme des tableaux, commune à tout le document
#set table(
  stroke: 0.4pt + luma(180),
  inset: 6pt,
  fill: (_, y) => if y == 0 { luma(238) },
)
#show table.cell.where(y: 0): strong

#let ok = text(fill: rgb("1b7a3d"), weight: "bold")[oui]
#let ko = text(fill: rgb("a32020"), weight: "bold")[non]
#let mid = text(fill: rgb("9a6b00"), weight: "bold")[partiel]

// =====================================================================
// TABLE DES MATIÈRES
// =====================================================================
#block[
  #set text(size: 8pt)
  #set par(leading: 0.5em)
  #outline(
    title: "Table des matières",
    indent: auto,
  )
]

#pagebreak()

= 1. Cadre du travail et méthode

== 1.1 L'objet de l'étude

La responsabilité sociétale des entreprises désigne la contribution volontaire d'une organisation aux enjeux du développement durable, au delà de ses seules obligations légales. La norme ISO 26000, publiée en 2010, en donne le cadre de référence le plus utilisé : sept questions centrales, dont la gouvernance de l'organisation, les relations et conditions de travail, l'environnement, la loyauté des pratiques et les communautés.

Ce rapport applique cette grille à une entreprise précise : *Bearstech*, société coopérative et participative française d'hébergement et d'infogérance open source, immatriculée à Paris depuis 2004. Le travail répond à six questions :

+ Quelles actions concrètes l'entreprise réalise-t-elle réellement ?
+ Dispose-t-elle d'une charte RSE, d'une lettre d'engagement, d'une charte de bonne conduite envers ses partenaires, ses fournisseurs et ses clients ?
+ Est-elle certifiée, labellisée, ou évaluée par une agence de notation extra-financière ?
+ Comment se situe-t-elle face à un concurrent de taille comparable, Enix, et face à un acteur majeur, Scaleway ?
+ Qu'aurait-elle pu faire de plus, concrètement ?
+ Que disent la presse, la jurisprudence et les organisations non gouvernementales du secteur dans lequel elle opère ?

== 1.2 Pourquoi Bearstech

Trois raisons. La *forme juridique* d'abord : la SCOP est un modèle de gouvernance rare, enregistré au registre du commerce, donc vérifiable et non déclaratif. La *transparence* ensuite : contrairement aux grands fournisseurs de cloud, Bearstech publie des chiffres environnementaux précis, donc mesurables et critiquables. La *taille* enfin : avec moins de vingt salariés, l'entreprise échappe à toute obligation réglementaire de reporting, ce qui permet d'observer ce qu'une très petite entreprise fait quand rien ne l'y oblige.

== 1.3 La méthode et les précautions prises

Toutes les affirmations reposent sur des sources vérifiées les 20 et 21 septembre 2026, de quatre natures : *sources légales et financières* (annuaire des entreprises, Pappers) ; *sources primaires* (l'intégralité du site bearstech.com, soit *353 pages* aspirées depuis son fichier sitemap.xml puis analysées en texte intégral) ; *sources tierces indépendantes* (mentions légales des sites clients, fiches techniques de l'exploitant du datacenter, interface de programmation de GitHub, travaux de l'ADEME, de l'Arcep et de l'AFNOR) ; *mesures réalisées par nos soins* (sobriété des pages web selon l'algorithme EcoIndex du collectif GreenIT, script reproductible fourni dans le dépôt de travail).

Une convention de lecture traverse tout le rapport : nous distinguons trois niveaux de preuve.

#table(
  columns: (auto, 1fr),
  table.header([Niveau], [Définition retenue]),
  [Dire], [L'entreprise affirme quelque chose sur son site, sans élément justificatif consultable.],
  [Documenter], [L'entreprise publie la méthode, le périmètre et les données qui permettent à un tiers de refaire le calcul.],
  [Faire auditer], [Un organisme indépendant vérifie et engage sa responsabilité sur le résultat, par une certification, un label ou une notation.],
)

Cette distinction est la clé de l'analyse critique : elle sépare la performance réelle de la preuve de cette performance, et nous verrons que Bearstech se situe presque toujours au premier niveau.



= 2. Bearstech en quelques chiffres

== 2.1 Carte d'identité

#table(
  columns: (auto, 1fr),
  table.header([Élément], [Valeur vérifiée]),
  [Raison sociale], [BEARSTECH],
  [Forme juridique], [SARL coopérative ouvrière de production (SCOP)],
  [Immatriculation], [12 novembre 2004, SIREN 479 227 993],
  [Siège], [122 rue Amelot, 75011 Paris],
  [Activité (code NAF)], [63.11Z, traitement de données, hébergement et activités connexes],
  [Effectif], [10 à 19 salariés],
  [Capital social], [5 000 euros],
  [Chiffre d'affaires], [1,41 million d'euros (exercice 2025)],
  [Résultat net], [218 000 euros (exercice 2025)],
  [Économie sociale et solidaire], [appartenance déclarée au répertoire officiel],
)

L'entreprise exerce trois métiers : l'hébergement de serveurs, l'infogérance d'infrastructures applicatives et le conseil. Sa spécificité technique est l'usage exclusif de logiciels libres, principalement Debian, Docker et les piles applicatives PHP, Python et Node.

== 2.2 Ses clients, vérifiés un par un

La liste des références est publique. Nous avons vérifié chaque organisation citée dans le sujet de cette étude, et corrigé deux affirmations courantes.

#table(
  columns: (0.75fr, 0.65fr, 2.1fr),
  table.header([Organisation], [Statut vérifié], [Élément de preuve]),
  [BNP Paribas], [Client], [Page de référence dédiée : infogérance du dispositif web et maintenance de la plateforme Drupal L'Atelier],
  [SNCF], [Client], [Page de référence dédiée : gestion de la plateforme hébergeant le dispositif web de recrutement],
  [Crédit Agricole], [Client], [Mentions légales du site carrières du groupe : « Bearstech, 40 passage des panoramas 75002 Paris » désigné comme hébergeur],
  [État français], [Client public], [Mentions légales de choisirleservicepublic.gouv.fr, site de la Direction générale de l'administration et de la fonction publique : Bearstech désigné comme hébergeur du site],
  [Devialet], [Client], [Cité sur la page des références],
  [Ministère de la Culture], [Non confirmé], [culture.gouv.fr est hébergé par les services du ministère, et les sous-sites testés le sont par OVH. Aucune preuve d'une relation contractuelle n'a été trouvée.],
  [multi.coop et ALTER SI], [Partenaires, pas clients], [Cités sur la page « Les amis de Bearstech » comme coopératives partenaires],
)

Figurent également parmi les références publiques la RATP, La Poste, Transdev, BPI France, Paris Habitat, Le Canard Enchaîné, Les Inrockuptibles, Radio Nova, Reporters Sans Frontières, Prestashop, L-Acoustics, Ramsay Santé et Mazars.

Ce portefeuille est le point d'entrée de toute l'analyse qui suit : *une très petite entreprise sans aucune formalisation RSE fournit des groupes qui, eux, sont soumis au devoir de vigilance, à la loi Sapin II, à la directive sur le reporting de durabilité et au code de la commande publique.*



= 3. Le volet social et la gouvernance

C'est le terrain sur lequel Bearstech est la plus solide, et pour une raison simple : son engagement social n'est pas une déclaration, c'est un statut juridique enregistré.

== 3.1 Ce que le statut de SCOP impose réellement

Une société coopérative et participative est régie par la loi du 19 juillet 1978 et intégrée au champ de l'économie sociale et solidaire par la loi du 31 juillet 2014. Ce statut n'est pas un label que l'on s'attribue : il conditionne les statuts déposés au greffe et fait l'objet d'une révision coopérative quinquennale obligatoire.

Bearstech en décline les principes sur sa page dédiée, dans des termes que nous citons exactement :

#quote(block: true)[« tous les salariés sont associés et possèdent l'intégralité du capital », « chaque associé possède une voix quel que soit son nombre de parts », « écarts de salaire maximum de 1 à 2 », « les bénéfices sont partagés entre les salariés », « Nous validons ensemble les décisions sur les sujets cruciaux : salaires, embauches, orientations stratégiques, investissements ».]

== 3.2 L'écart salarial, le chiffre le plus fort du dossier

L'engagement d'un écart maximal de 1 à 2 entre la rémunération la plus basse et la plus haute mérite d'être mis en perspective : dans les grandes entreprises cotées françaises, le rapport entre la rémunération du dirigeant et le salaire moyen se compte en dizaines, parfois en centaines. Deux réserves de méthode s'imposent toutefois :

- Ce chiffre est *déclaratif*. Aucun document public, aucun index, aucun auditeur ne permet de le vérifier de l'extérieur.
- Il concerne l'écart des salaires, pas celui des revenus globaux : la participation et les dividendes coopératifs ne sont pas couverts par la formulation.

Il s'agit donc d'un engagement crédible parce que cohérent avec le statut, mais non prouvé au sens de la section 1.3.

== 3.3 Les autres actions sociales, documentées

- *Le télétravail intégral.* L'entreprise indique que « Cela fait des années que l'ensemble de notre équipe est en télétravail », avec un effet revendiqué sur l'empreinte carbone : suppression des trajets domicile travail et d'un espace de bureaux en centre ville.
- *L'épargne salariale orientée.* Sur la question des placements et de l'investissement salarié, l'entreprise déclare pousser les portefeuilles les plus respectueux de l'environnement. C'est un point rare pour une structure de cette taille, car il touche au financement, donc au scope 3 le plus difficile à traiter.
- *La rémunération comme sujet collectif.* Un article de leur blog, intitulé « Travailler en coopérative, c'est aussi être mieux rémunéré », assume explicitement ce positionnement.

== 3.4 La contribution aux communs numériques

Le volet « communautés et développement local » de l'ISO 26000 trouve ici une traduction concrète et, pour le coup, entièrement vérifiable par un tiers.

#table(
  columns: (auto, 1fr),
  table.header([Indicateur], [Valeur relevée le 21 septembre 2026]),
  [Dépôts publics sur GitHub], [181 dépôts, organisation créée en mars 2010],
  [Projets les plus repris], [pussh (266 étoiles), phptop (253 étoiles), quickbench (81 étoiles)],
  [Associations soutenues], [Framasoft, April, La Quadrature du Net, Wikimédia, Sésamath, AFPy, Debian Long Term Support, Lichess, Libera, Linux.fr],
  [Partenaires coopératifs], [multi.coop, coopérative numérique, et ALTER SI, société coopérative d'édition d'outils de gestion],
)

Le soutien à Debian Long Term Support mérite d'être souligné : c'est un financement direct de la maintenance de sécurité d'un système d'exploitation utilisé par des millions de serveurs, y compris ceux de leurs concurrents. C'est une externalité positive au sens strict.

== 3.5 Lecture critique du volet social

La gouvernance est le seul domaine où Bearstech atteint le niveau « documenter » et s'approche du niveau « faire auditer », puisque la révision coopérative quinquennale est une obligation légale des SCOP. C'est aussi le seul domaine où l'entreprise devance largement ses deux comparables, Enix et Scaleway, qui ne publient aucun élément sur leur gouvernance interne ni sur leur politique salariale.

Ce qui manque : aucun indicateur social chiffré n'est publié. Ni taux de rotation, ni pyramide des âges, ni index d'égalité professionnelle entre les femmes et les hommes, ni nombre d'heures de formation, ni répartition femmes hommes des associés. Une TPE n'y est pas tenue, mais ces indicateurs sont précisément ceux qu'une notation extra-financière exige, et leur absence empêche toute évaluation externe.



= 4. Le volet environnemental : les actions concrètes

== 4.1 Ce que l'entreprise affiche

La page « GreenOps, bilan carbone et éco-conception » met en avant quatre chiffres, repris tels quels :

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  table.header([PUE moyen], [Émissions par salarié], [Énergie], [Durée de vie du matériel]),
  [1,36], [2,5 tCO#sub[2]e], [100 % renouvelable], [10 ans],
)

À ces quatre indicateurs s'ajoutent plusieurs actions décrites dans le détail : un freecooling indirect avec circuit d'eau réfrigérée haute température, un indicateur interne baptisé rDCE qui combine le PUE et le WUE, le réemploi des machines encore fonctionnelles dans des Fablabs et des associations, et un tableau de bord qui restitue au client l'empreinte carbone de son infrastructure.

== 4.2 La longévité du matériel : le point fort, et il est réel

C'est l'action la plus solide de tout le dossier environnemental, et c'est celle qui mérite d'être défendue.

L'entreprise formule son engagement dans son article « Les 10 commandements de l'éco-conception d'infrastructures chez Bearstech », publié le 16 janvier 2025 :

#quote(block: true)[« nous orientons nos choix pour des équipements de qualité, robustes et réparables (donc cher), qui nous permet de garantir une durée en exploitation optimale de plus de 10 ans »]

Une autre page va plus loin encore :

#quote(block: true)[« Depuis sa création, Bearstech n'a jamais jeté une machine, car conscients que le renouvellement coûte 20 fois plus en énergie que sa consommation tout au long de son cycle de vie. »]

*Pourquoi c'est le bon levier.* Dans le numérique, l'essentiel de l'impact environnemental se joue à la fabrication, pas à l'usage. L'étude de l'ADEME et de l'Arcep sur l'impact environnemental du numérique en France attribue *78 % de l'empreinte carbone du secteur à la phase de fabrication, contre 21 % à la phase d'utilisation*. Quand la fabrication domine, la seule variable réellement efficace est la durée pendant laquelle on amortit cette fabrication.

*L'ordre de grandeur.* La base Empreinte de l'ADEME retient un facteur d'émission de l'ordre de 600 kg équivalent CO#sub[2] pour la fabrication d'un serveur, valeur ancienne et affectée d'une incertitude élevée, que Boavizta travaille à affiner. En amortissement linéaire, cela représente environ 120 kg par an sur une durée de vie de 5 ans, et environ 60 kg par an sur 10 ans. *Doubler la durée de vie divise par deux l'empreinte de fabrication annualisée.* Aucune optimisation logicielle ne produit un gain de cet ordre.

*Le point de comparaison.* The Shift Project retient une durée de vie de 4 à 5 ans pour un serveur, et Scaleway parle d'un standard industriel de 5 à 6 ans. Bearstech, comme Scaleway, annonce 10 ans. Sur cet indicateur précis, une TPE coopérative fait donc aussi bien que le premier acteur français du cloud, et environ deux fois mieux que la pratique courante du secteur.

*La limite.* Le réemploi est annoncé, « réutiliser les machines fonctionnelles dans des Fablabs ou associations », mais il n'est pas chiffré : aucun nombre de machines, aucun partenaire nommé, aucune année de référence. À titre de comparaison, Scaleway publie près de 15 000 serveurs reconditionnés au titre de son programme Transformers et plus de 12 000 disques durs reconditionnés sur la seule année 2024.

== 4.3 Le PUE de 1,36 n'appartient pas à Bearstech

C'est le résultat le plus important de notre vérification, et il change la lecture de toute la page GreenOps.

Bearstech héberge ses serveurs dans le datacenter *DC3, exploité par Opcore*, situé 61 rue Julian Grimau à Vitry-sur-Seine. Opcore est la société de centres de données du *groupe Iliad*, issue en 2023 de la séparation de l'activité datacenter de *Scaleway*. Les fiches techniques publiées pour ce bâtiment annoncent un *PUE de 1,36*, exactement la valeur que Bearstech affiche comme son « PUE moyen ».

Ce n'est pas une coïncidence, et l'entreprise ne le cache d'ailleurs pas. Sa page décrivant la méthodologie du bilan carbone précise :

#quote(block: true)[« Les consommations indirectes (climatisation, exploitation du datacenter) sont intégrées à ce calcul en utilisant le PUE moyen annuel fourni par l'exploitant du datacenter. »]

Trois conséquences :

+ Le PUE, le freecooling, l'alimentation « 100 % hydraulique garantie d'origine » et la conception Tier III sont des *caractéristiques du bailleur*, pas des résultats propres à Bearstech. L'entreprise est locataire de baies, pas exploitante d'un datacenter.
+ Les seules certifications dont bénéficie l'infrastructure de Bearstech sont *celles du bâtiment* : ISO 27001, ISO 50001, hébergeur de données de santé, code de conduite européen des centres de données et conception Tier III. Bearstech, à son crédit, ne les revendique pas comme siennes.
+ Bearstech et Scaleway, les deux entreprises comparées dans ce rapport, *partagent le même bâtiment*. Scaleway publie pour ce site, qu'elle nomme PAR-DC3, un PUE de 1,39 en 2024. Les deux entreprises ont donc la même performance physique. Ce qui les distingue n'est pas l'efficacité énergétique, c'est la preuve qu'elles en donnent.

Cette observation ne disqualifie pas la démarche : choisir un datacenter performant est une décision d'achat responsable et cohérente. Mais afficher 1,36 comme un indicateur de performance de l'entreprise, sans préciser qu'il s'agit du chiffre de l'exploitant, revient à s'approprier une performance qui n'est pas la sienne.

== 4.4 La mesure de l'empreinte : une méthode maison, honnête mais invérifiable

Le tableau de bord multicloud restitue au client une empreinte carbone intégrant la fabrication des équipements, la consommation électrique des serveurs et les opérations de Bearstech, répartie par machine virtuelle selon l'usage processeur. L'entreprise écrit avoir vérifié que « les bilans ainsi obtenus mesuraient correctement la consommation réelle observée au niveau de chaque serveur physique ».

La limite est nette : cette méthode n'est rattachée à *aucun référentiel externe*, ni GHG Protocol, ni méthode Bilan Carbone de l'ADEME, ni référentiel Boavizta, et n'est vérifiée par aucun tiers. Un client ne peut donc ni la comparer, ni l'intégrer avec confiance dans son propre reporting de durabilité.

Second point : les chiffres de contexte affichés sur la page GreenOps, « 2,5 % de l'empreinte carbone » et « 10 % de la consommation électrique », correspondent à l'étude de l'ADEME et de l'Arcep publiée en janvier 2022 sur des données 2020. *Cette étude a été actualisée en novembre 2024 : le numérique représente désormais 4,4 % de l'empreinte carbone française, soit 29,5 millions de tonnes équivalent CO#sub[2], et 11 % de la consommation électrique.* La page de Bearstech affiche donc, en septembre 2026, des données dépassées qui minorent de moitié l'enjeu qu'elle décrit.

== 4.5 Ce qui est dit mais jamais démontré : l'extinction des serveurs

Le premier des dix commandements de l'éco-conception de Bearstech est :

#quote(block: true)[« quand on n'a pas besoin d'un serveur, on l'éteint »]

Notre recherche en texte intégral sur les 353 pages du site montre que cette phrase n'est suivie d'*aucun élément de preuve* : aucun mécanisme d'extinction automatique décrit, aucun planificateur d'arrêt nocturne ou de week-end, aucune mise à l'échelle jusqu'à zéro, et aucun chiffre, ni nombre de machines virtuelles concernées, ni kilowattheures économisés, ni pourcentage du parc. C'est d'autant plus frappant que l'entreprise sait produire des chiffres quand elle le veut, puisqu'elle en publie quatre en haut de sa page GreenOps.

Même observation pour l'EcoIndex. L'entreprise dispose de l'outil et le dit :

#quote(block: true)[« nous leur mettons un outil à disposition qui calcule l'éco-index (avec Sitespeed "sustainable" plugin) de leurs applications, et qu'ils peuvent déclencher à volonté, notamment pour visualiser l'impact sur les performances d'une mise à jour avant sa mise en production »]

Mais *aucun score n'est publié*, ni pour ses clients, ni pour son propre site. La section 9 de ce rapport comble cette lacune en réalisant la mesure nous-mêmes.



= 5. Chartes, engagements et adhésions : l'inventaire

== 5.1 La méthode

Pour répondre sans approximation à la question « Bearstech a-t-elle une charte ? », nous n'avons pas interrogé un moteur de recherche : nous avons téléchargé les *353 adresses* du fichier sitemap.xml du site, retiré le balisage HTML, normalisé les accents, puis recherché une liste de mots clés dans le texte obtenu. Chaque occurrence a été relue en contexte pour écarter les correspondances parasites.

== 5.2 Le résultat

#table(
  columns: (1.5fr, auto, 1.4fr),
  table.header([Document ou engagement recherché], [Pages], [Verdict]),
  [Pacte Mondial des Nations Unies, Global Compact], [0], ko,
  [Charte d'engagement environnemental], [0], ko,
  [Charte ou code de conduite fournisseurs], [0], ko,
  [Charte d'achats responsables], [0], ko,
  [Code de conduite anticorruption], [0], ko,
  [Déontologie], [0], ko,
  [Dispositif de lanceur d'alerte], [0], ko,
  [Devoir de vigilance], [0], ko,
  [Loi Sapin II], [0], ko,
  [Parties prenantes], [1], [contexte technique, page sur le plan de reprise d'activité],
  [Charte, toutes acceptions confondues], [2], [une charte graphique citée en exemple, une charte IA interne],
)

*Les correspondances parasites écartées.* Le mot « corruption » apparaît sur trois pages, mais il y désigne une corruption de données ou de mémoire, dans des articles sur Docker, sur le stockage objet et sur la bibliothèque Rustls. Rien à voir avec la lutte anticorruption. Le sigle « EMAS » ressort sur trois pages, uniquement à l'intérieur du nom de fichier storage-schemas.conf d'un tutoriel sur Graphite. Enfin, quatre termes ressortent sur la totalité des 353 pages, parce qu'ils figurent dans le menu de navigation présent sur chaque page : « SCOP », « open source », « label » et « Sitespeed ». Ils ont donc été neutralisés dans l'analyse.

== 5.3 La seule charte qui existe, et elle n'est pas publiée

Un unique document de ce type est mentionné sur tout le site, dans un article du 24 juillet 2026 consacré à la mise en production de l'intelligence artificielle :

#quote(block: true)[« Nous terminons donc la rédaction de notre charte IA, qui précise comment nous avons le droit d'utiliser ces outils. »]

#quote(block: true)[« Notre charte IA est donc entièrement orientée sécurité. L'enjeu n'est pas de maintenir une liste parfaite de tous les modèles à la mode. Nous voulons définir quelles données peuvent être envoyées à un LLM, dans quel cadre, selon quel niveau de confidentialité. »]

Quatre observations s'imposent. Cette charte est un document d'*usage interne*, pas un engagement envers des tiers. Elle est *orientée sécurité de l'information*, pas responsabilité sociétale ni éthique des affaires. À la date de l'article elle était *encore en cours de rédaction*. Et elle *n'est pas publiée*.

Un élément est toutefois à porter au crédit de l'entreprise : l'article précise que, la SCOP réunissant régulièrement l'ensemble de ses associés, un outil peut être rediscuté collectivement à tout moment. La gouvernance coopérative sert ici de mécanisme de révision, ce qui est une forme de contrôle interne réel, même s'il n'est pas formalisé.

== 5.4 Rien de tout cela n'est légalement obligatoire

C'est l'argument de défense, et il est factuel.

#table(
  columns: (1.3fr, 1.5fr, auto),
  table.header([Obligation], [Seuil d'assujettissement], [Bearstech]),
  [Code de conduite anticorruption, article 17 de la loi Sapin II], [500 salariés *et* plus de 100 millions d'euros de chiffre d'affaires, critères cumulatifs], [non assujettie],
  [Plan de vigilance, loi du 27 mars 2017], [5 000 salariés en France ou 10 000 dans le monde], [non assujettie],
  [Reporting de durabilité, directive CSRD], [seuils européens des grandes entreprises], [non assujettie],
  [Bilan d'émissions de gaz à effet de serre réglementaire], [500 salariés], [non assujettie],
)

L'absence de code anticorruption n'est donc pas une faute : c'est le régime normal d'une entreprise de quinze personnes. En revanche, l'absence de charte fournisseurs, de lettre d'engagement environnemental ou d'adhésion au Pacte Mondial relève d'un *choix*, et non d'une contrainte. L'adhésion au Pacte Mondial des Nations Unies, par exemple, est ouverte aux entreprises de moins de 250 salariés pour une contribution annuelle modeste. C'est précisément là que la critique devient légitime.



= 6. Certifications et normes : l'inventaire est vide

== 6.1 Le relevé

#table(
  columns: (1fr, auto, 2.1fr),
  table.header([Norme ou label], [Bearstech], [Ce que dit réellement le site]),
  [ISO 27001, sécurité de l'information], ko, [3 pages en parlent, jamais comme d'une certification détenue. L'une évoque « les exigences de la norme ISO 27001 » comme cadre de travail.],
  [ISO 14001, management environnemental], ko, [0 occurrence],
  [ISO 9001, qualité], ko, [0 occurrence],
  [ISO 50001, management de l'énergie], ko, [0 occurrence],
  [EMAS, règlement européen d'éco-audit], ko, [0 occurrence réelle],
  [AFAQ 26000 ou Label Engagé RSE de l'AFNOR], ko, [0 occurrence],
  [Label Numérique Responsable], ko, [0 occurrence],
  [EcoVadis], ko, [0 occurrence],
)

Bearstech ne détient donc *aucune certification, aucun label et aucune évaluation par un tiers*, dans aucun des trois domaines : qualité, sécurité, environnement.

== 6.2 Un point de méthode : « être certifié ISO 26000 » n'existe pas

Cette précision mérite d'être faite parce qu'elle est fréquemment escamotée.

L'ISO 26000 est une norme de *lignes directrices*. Contrairement à l'ISO 9001, à l'ISO 14001 ou à l'ISO 45001, elle ne contient aucune exigence vérifiable par audit externe. Aucune organisation au monde ne peut donc être « certifiée ISO 26000 », et l'AFNOR le rappelle explicitement. Ce qui existe à la place, en France :

- *L'évaluation AFAQ 26000*, créée en 2011 : une évaluation, pas une certification, qui positionne l'organisation sur une échelle de maturité en quatre niveaux.
- *Le label Engagé RSE*, créé en 2021 par AFNOR Certification, dérivé de l'ISO 26000 et des lignes directrices de la Global Reporting Initiative, explicitement dimensionné pour les entreprises de moins de 50 salariés.

Cette distinction a une conséquence directe sur nos recommandations : reprocher à Bearstech de ne pas être certifiée ISO 26000 n'aurait aucun sens, alors que lui recommander le label Engagé RSE ou le label Numérique Responsable est parfaitement opérant.

== 6.3 Le paradoxe des certifications du bailleur

Comme établi en section 4.3, l'infrastructure de Bearstech est hébergée dans un bâtiment certifié ISO 27001 et ISO 50001, conforme au code de conduite européen des centres de données et conçu selon le niveau Tier III.

Autrement dit, *les seules certifications qui protègent les clients de Bearstech sont celles de son fournisseur*. L'entreprise bénéficie du système de management de l'énergie de l'exploitant sans avoir elle-même de système de management de l'énergie. Pour un donneur d'ordre soumis au devoir de vigilance, cette distinction n'est pas théorique : c'est exactement ce qu'un audit de chaîne d'approvisionnement cherche à établir.



= 7. L'évaluation extra-financière par les agences de notation

== 7.1 De quoi parle-t-on

La notation extra-financière consiste à faire évaluer, par un organisme indépendant, la performance d'une entreprise sur des critères environnementaux, sociaux et de gouvernance. Les principaux acteurs qui interviennent sur le marché français sont :

- *EcoVadis*, fondée en 2007, devenue le standard de fait de l'évaluation des fournisseurs. Sa méthodologie est alignée sur l'ISO 26000, la Global Reporting Initiative et le Pacte Mondial, et couvre quatre thèmes : environnement, social et droits humains, éthique des affaires et achats responsables. Le résultat est une note sur 100 et, le cas échéant, une médaille bronze, argent, or ou platine.
- *EthiFinance*, avec sa notation Gaïa Research dédiée aux entreprises de taille intermédiaire et aux PME, et *Moody's ESG Solutions*, héritière de Vigeo Eiris, ainsi que *Sustainalytics* et *MSCI ESG*, tournées vers les sociétés cotées et leurs investisseurs.

== 7.2 Le constat pour Bearstech

*Bearstech n'a aucune notation extra-financière.* Le terme EcoVadis n'apparaît sur aucune des 353 pages de son site, et aucune recherche externe n'a permis de trouver la moindre évaluation, même expirée, la concernant.

Ce constat appelle une nuance de taille, qui joue en sa faveur : l'évaluation extra-financière n'est ni gratuite ni obligatoire, et son coût annuel est calibré pour des structures plus grandes. Beaucoup de TPE de service n'en ont jamais entendu parler.

== 7.3 Mais ses clients, eux, sont notés, et font noter leurs fournisseurs

C'est ce qui rend l'absence problématique, et non le principe.

- *BNP Paribas*, premier client de référence affiché par Bearstech, est évaluée par EcoVadis depuis 2010 et se classe dans le *top 4 % des fournisseurs les plus responsables au monde*. Plus significatif encore : la banque est devenue elle-même *prescriptrice*, puisqu'elle propose à ses clients entreprises de faire évaluer leur performance RSE par EcoVadis.
- *Scaleway*, le comparable de grande taille retenu dans ce rapport, détient une *médaille EcoVadis Gold*, obtenue début 2024, qui la place dans le top 5 % des entreprises évaluées.

Le risque n'est donc pas réglementaire, il est *commercial*. Le jour où un acheteur de BNP Paribas, de la SNCF ou du Crédit Agricole applique sa grille d'évaluation fournisseurs, Bearstech n'a rien à présenter : ni note, ni label, ni rapport, ni charte signée. Sa performance réelle, notamment sur la gouvernance et la durée de vie du matériel, devient alors invisible faute de format pour l'exprimer.



= 8. Le miroir des donneurs d'ordre : les chartes existent, mais ce sont celles des autres

Le sujet de cette étude demandait de vérifier si les partenaires, fournisseurs et clients de Bearstech disposent eux-mêmes de chartes. La réponse est particulièrement éclairante : *tous les grands clients en ont, et ces documents s'appliquent contractuellement à Bearstech.*

#table(
  columns: (0.8fr, 2.6fr),
  table.header([Donneur d'ordre], [Dispositif RSE qui s'impose à ses fournisseurs]),
  [BNP Paribas], [Charte Achats Responsables, Charte RSE des Fournisseurs, Code de conduite du groupe. Signataire de la Charte Relations Fournisseurs Responsables depuis juin 2010 et adhérente au Pacte Mondial des Nations Unies depuis juin 2003. La Charte RSE des Fournisseurs énonce les engagements attendus en matière sociale et environnementale.],
  [SNCF], [Charte éthique du groupe articulée autour de cinq valeurs, Charte Relation Fournisseurs et RSE, Code de conduite anticorruption pris au titre de la loi Sapin II. Le groupe est titulaire du label Relations Fournisseurs et Achats Responsables depuis 2012.],
  [Crédit Agricole], [Charte Achats Responsables fondée sur les principes du Pacte Mondial, et Charte éthique du groupe. La charte est transmise lors des appels d'offres puis intégrée aux contrats, ce qui la rend opposable au fournisseur.],
  [État français, Direction générale de l'administration et de la fonction publique], [Code de la commande publique. Depuis le 22 août 2026, l'article 35 de la loi Climat et Résilience impose que *100 % des marchés publics* comportent au moins un critère d'attribution tenant compte des caractéristiques environnementales de l'offre et au moins une condition d'exécution environnementale. La direction des affaires juridiques de Bercy précise qu'une clause se bornant à rappeler la réglementation applicable ne suffit plus.],
  [Devialet], [Aucun document public d'engagement fournisseurs n'a pu être consulté : la page de développement durable du site renvoie une erreur d'accès. Nous ne formulons donc aucune conclusion sur ce client.],
)

== 8.1 L'asymétrie et ce qu'elle révèle

Bearstech *signe* les chartes de ses clients mais n'en *émet* aucune : elle est destinataire d'engagements, jamais émettrice. Deux conséquences. D'abord, l'affirmation selon laquelle « Bearstech n'a aucun dispositif de loyauté des pratiques » doit être nuancée : en tant que fournisseur de BNP Paribas, de la SNCF et du Crédit Agricole, elle est contractuellement tenue à des engagements anticorruption et RSE issus du Pacte Mondial. Elle est donc dans le périmètre du devoir de vigilance de ses clients, sans y être assujettie elle-même.

Ensuite, cette situation est fragile. Un dispositif subi n'est pas un dispositif piloté : Bearstech ne choisit ni le contenu, ni le calendrier, ni le niveau d'exigence des engagements qu'elle signe, et n'a aucun moyen d'en faire un argument commercial.

== 8.2 Le cas de la commande publique, une échéance déjà passée

L'entrée en vigueur de l'article 35 de la loi Climat et Résilience, le 22 août 2026, soit un mois avant la rédaction de ce rapport, est l'élément le plus opérationnel de cette étude. Bearstech héberge un site de l'État, celui de la Direction générale de l'administration et de la fonction publique, et l'acheteur public *doit désormais* noter chaque offre sur un critère environnemental et imposer une condition d'exécution vérifiable. Une entreprise sans bilan carbone rattaché à un référentiel reconnu, sans certification environnementale, sans label et sans score d'éco-conception publié se présente à ces consultations sans aucune pièce à verser au dossier, alors même que ses pratiques réelles, à commencer par la durée de vie de dix ans de son matériel, seraient très bien notées si elles étaient documentées.



= 9. Mesures : le discours résiste-t-il à sa propre vitrine ?

Bearstech dispose d'un outil de calcul de l'EcoIndex mais ne publie aucun score. Nous avons donc réalisé la mesure nous-mêmes, le 21 septembre 2026.

== 9.1 Ce que mesure l'EcoIndex et avec quelles précautions

L'EcoIndex, conçu par le collectif GreenIT, note une page web de A à G à partir de trois variables : le nombre d'éléments du document, le nombre de requêtes réseau et le poids transféré. Une page lourde mobilise plus de bande passante, plus de cache et plus de calcul sur le terminal, donc plus d'énergie sur toute la chaîne.

*Précaution méthodologique.* Nos chiffres proviennent d'une réimplémentation de l'algorithme officiel, appliquée aux ressources réellement téléchargées, et non de la mesure de référence d'ecoindex.fr qui utilise un navigateur sans interface graphique. Les quantiles employés sont ceux du collectif GreenIT. Il faut donc admettre un écart possible d'environ une note. Nous donnons systématiquement deux valeurs : au chargement initial, et une fois la page entièrement parcourue, ce second chiffre correspondant à ce que mesurent les outils de référence.

== 9.2 Les résultats pour Bearstech

#table(
  columns: (1fr, auto, auto, auto, auto, auto),
  table.header([Page], [Éléments], [Requêtes], [Poids], [Score], [Note]),
  [Accueil], [1 296], [42], [2,26 Mo], [19,8], [*F*],
  [Références clients], [533], [59], [2,78 Mo], [34,1], [*E*],
  [Article « 10 commandements »], [495], [15], [469 Ko], [55,5], [C],
  [Page GreenOps], [583], [9], [313 Ko], [58,4], [C],
)

Au seul chargement initial, avant défilement, la page d'accueil obtient 42,9 et la note D, les images étant chargées en différé.

== 9.3 La cause est identifiée, et elle est simple

*Toutes les images bitmap du site sont au format PNG. Aucune image WebP, aucune image AVIF.* La page d'accueil charge 34 fichiers PNG pour un total de 1 969 kilooctets, la page des références en charge 51 pour 2 510 kilooctets. Il s'agit essentiellement de captures d'écran non optimisées : certaines dépassent 200 kilooctets à elles seules.

La conversion en WebP produit couramment 60 à 80 % d'économie à qualité visuelle équivalente : la page d'accueil passerait sous les 700 kilooctets et remonterait d'environ deux notes. À décharge, le reste de la chaîne est correctement réglé, avec compression active, temps de réponse serveur excellent et chargement différé sur la quasi-totalité des images.

== 9.4 Comparaison des trois sites, mesurés avec le même outil le même jour

#table(
  columns: (auto, auto, auto, auto, auto, 1.6fr),
  table.header([Site], [Requêtes], [Poids], [Score], [Note], [Formats d'images utilisés]),
  [enix.io], [52], [519 Ko], [42,9], [*D*], [31 SVG, 8 WebP, 1 GIF],
  [bearstech.com], [42], [2,26 Mo], [19,8], [*F*], [34 PNG, 1 SVG],
  [scaleway.com], [60], [2,42 Mo], [10,5], [*F*], [14 SVG, 11 PNG, 3 WebP, et 1 041 Ko de JavaScript répartis sur 21 fichiers],
)

Ce tableau est le résultat le plus contre-intuitif de l'étude et il mérite d'être énoncé clairement :

+ *Scaleway, médaillée EcoVadis Gold, obtient la plus mauvaise note des trois.* Son site charge plus d'un mégaoctet de JavaScript avant même la première image.
+ *Enix, qui ne publie aucune page environnementale et aucun engagement RSE, a de loin le site le plus sobre.* Non par vertu affichée, mais par choix technique : génération statique, images vectorielles et WebP.
+ *Bearstech, qui explique l'éco-conception, est notée F sur sa page d'accueil.*

La conclusion à en tirer n'est pas que le discours environnemental est mensonger, mais qu'il *ne prédit rien* : l'entreprise qui parle le plus n'est pas celle qui fait le mieux, et celle qui ne dit rien peut très bien faire.

== 9.5 Mesure de performance complémentaire

#table(
  columns: (auto, auto, auto, auto),
  table.header([Site], [Performance Score], [Structure Score], [Grade]),
  [bearstech.com], [à compléter], [à compléter], [à compléter],
  [enix.io], [à compléter], [à compléter], [à compléter],
  [scaleway.com], [à compléter], [à compléter], [à compléter],
)

Ce tableau est destiné à recevoir les relevés GTmetrix réalisés par l'équipe. Nous avons choisi de ne pas y inscrire de valeurs estimées : un rapport qui reproche à son sujet d'avancer des chiffres non vérifiables ne peut pas en produire lui-même.

== 9.6 La nuance à ne pas oublier

Bearstech est un hébergeur, pas une agence web, et son site vitrine n'est pas son produit. La hiérarchie des impacts lui donne d'ailleurs raison sur le fond : avec 78 % de l'empreinte du numérique située dans la fabrication, allonger la durée de vie d'un serveur à dix ans pèse infiniment plus lourd que convertir des images en WebP. Il n'en reste pas moins que cette conversion est *gratuite, immédiate et mesurable*, et qu'elle concerne la page qui explique aux clients comment éco-concevoir.



= 10. Comparaison sectorielle : Enix et Scaleway

== 10.1 Pourquoi ces deux entreprises

*Enix* est le comparable le plus juste : société parisienne créée elle aussi au milieu des années 2000, même métier d'infogérance d'infrastructures critiques, 20 à 49 salariés. *Scaleway* sert de contrepoint : plusieurs centaines de salariés, filiale du groupe Iliad et, comme établi en section 4.3, rattachée par l'intermédiaire d'Opcore au datacenter dans lequel Bearstech héberge ses machines.

== 10.2 Le tableau comparatif

#table(
  columns: (1.3fr, 1fr, 1fr, 1fr),
  table.header([Critère], [Bearstech], [Enix], [Scaleway]),
  [Forme juridique], [SCOP, champ de l'ESS], [SAS], [SAS, groupe Iliad],
  [Effectif], [10 à 19], [20 à 49], [plusieurs centaines],
  [Gouvernance publiée], [*capital détenu à 100 % par les salariés, une voix par associé, écart salarial de 1 à 2*], [rien de publié], [politique de groupe],
  [Page ou rapport environnemental], [oui, chiffré, non audité], [*aucune*], [oui, chiffré et audité],
  [PUE], [1,36, qui est celui de son bailleur], [non publié], [1,37 en moyenne 2024, 1,25 sur PAR-DC5],
  [WUE], [« suivi », non chiffré], [non publié], [0,00009 sur PAR-DC3, 0,00002 sur PAR-DC4],
  [Durée de vie du matériel], [*10 ans*], [non publié], [*10 ans*],
  [Réemploi], [Fablabs et associations, non chiffré], [non publié], [près de 15 000 serveurs et 12 000 disques en 2024],
  [Objectif climat], [aucun], [aucun], [*moins 90 % sur les scopes 1, 2 et 3 d'ici 2050, validé par la SBTi*],
  [ISO 27001], ko, [*oui*], [*oui, version 2022*],
  [ISO 14001 ou EMAS], ko, ko, ko,
  [Notation extra-financière], [aucune], [aucune], [*EcoVadis Gold*],
  [Rapport d'impact public], [aucun], [aucun], [annuel depuis 2018],
  [Note EcoIndex du site], [F], [*D*], [F],
)

== 10.3 Lecture

*Enix bat Bearstech sur la certification.* À taille comparable, Enix a obtenu l'ISO 27001 sur son activité d'infogérance. L'argument « nous sommes trop petits pour être certifiés » ne tient donc pas : un concurrent direct du même secteur, à peine plus grand, l'a fait. En revanche, Enix ne publie strictement rien sur l'environnement, la gouvernance ou le social. Sur le terrain de la RSE, Bearstech est très loin devant.

*Scaleway bat Bearstech sur la preuve, pas sur la performance.* C'est le point central. Les deux entreprises annoncent une durée de vie de dix ans, un approvisionnement en énergie renouvelable par garanties d'origine, et un PUE compris entre 1,36 et 1,39, pour cause de bâtiment commun. Ce qui sépare les deux n'est pas ce qu'elles font, c'est ce qu'elles peuvent prouver : Scaleway publie, fait auditer par EcoVadis, fait valider ses objectifs par la Science Based Targets initiative et publie un rapport d'impact annuel depuis 2018. Bearstech déclare.

*Aucune des trois n'a de système de management environnemental certifié.* Ni ISO 14001, ni EMAS. C'est une caractéristique du secteur de l'hébergement français, pas une faiblesse propre à Bearstech.

*Et aucune corrélation entre le discours et la sobriété réelle du site*, comme le montre la dernière ligne du tableau.



= 11. Analyse critique, première partie : ce qui aurait pu être fait

Au vu de ce que l'entreprise fait déjà, que pouvait-elle raisonnablement entreprendre de plus ? Nous avons écarté toute recommandation hors de portée d'une structure de quinze personnes, et retenu dix actions concrètes, regroupées en trois familles.

== 11.1 Se faire labelliser, ce qui est à sa portée

Deux dispositifs correspondent exactement à son profil. *Le label Numérique Responsable*, créé par l'Institut du Numérique Responsable et opéré par l'agence Lucie, dont le niveau 1 est explicitement accessible à toute organisation quels que soient sa taille, son secteur et son statut juridique. *Le label Engagé RSE de l'AFNOR*, dérivé de l'ISO 26000, conçu pour les entreprises de moins de 50 salariés, structuré en huit chapitres et quatre niveaux de maturité.

L'argument de la taille est réfutable par l'exemple : *Boscop*, société coopérative de services numériques française, a renouvelé début 2026 pour quatre ans sa double labellisation Lucie et Numérique Responsable de niveau 2. Une SCOP du numérique peut donc être labellisée, et l'a fait.

Bearstech dispose déjà de la matière : gouvernance coopérative, écart salarial encadré, mesure du carbone par machine virtuelle, allongement de la durée de vie du matériel, réemploi. Il lui manque la formalisation et l'audit, pas le fond.

== 11.2 Prouver ce qu'elle fait déjà

*Publier les scores d'éco-conception.* L'entreprise dispose de l'outil de calcul de l'EcoIndex et le met à disposition de ses clients. Publier les scores de son propre site et les suivre dans le temps ne coûte rien et transformerait une affirmation en donnée. Corollaire immédiat : convertir les fichiers PNG du site en WebP, ce qui ferait remonter la page d'accueil de la note F à la note C ou D selon nos mesures.

*Appliquer le RGESN.* Le Référentiel général d'écoconception de services numériques, publié le 17 mai 2024 par l'Arcep et l'Arcom avec l'ADEME, la DINUM, la CNIL et l'Inria, comporte 78 critères en 9 familles et permet de produire une déclaration d'écoconception publique. Il est obligatoire pour les acteurs publics : pour un prestataire de l'État, s'y conformer volontairement serait à la fois un alignement avec ses clients et un argument de réponse aux appels d'offres.

*Documenter l'extinction des machines.* Rendre crédible le premier commandement de l'entreprise demande peu : publier le nombre de machines virtuelles soumises à une politique d'extinction, les plages horaires concernées et l'économie mesurée en kilowattheures. La métrologie nécessaire existe déjà, puisque la consommation est mesurée au niveau de chaque serveur physique.

*Rattacher le bilan carbone à un référentiel reconnu.* Passer d'une méthode maison au GHG Protocol, à la méthode Bilan Carbone de l'ADEME ou au référentiel ouvert de Boavizta permettrait à un client de réutiliser le chiffre dans son propre reporting. L'effort technique est faible, puisque le calcul existe, et le gain commercial élevé.

== 11.3 Formaliser ses engagements

*Écrire une charte fournisseurs et un code de conduite*, non pour se conformer à la loi, puisque aucun seuil ne s'applique, mais par symétrie : Bearstech signe les chartes de BNP Paribas, de la SNCF et du Crédit Agricole sans rien demander à ses propres fournisseurs, alors qu'elle achète du matériel dont la chaîne d'approvisionnement concentre l'essentiel de son impact et les principaux risques sociaux du secteur.

*Signer des engagements gratuits ou peu coûteux.* La Charte Relations Fournisseurs et Achats Responsables, portée par le Médiateur des entreprises et le Conseil national des achats, est ouverte et gratuite. L'adhésion au Pacte Mondial des Nations Unies est accessible aux petites structures pour une contribution modeste. Chacune produit une page de preuve opposable, ce que l'entreprise n'a aujourd'hui nulle part.

*Publier un rapport d'impact annuel, même court.* Quatre pages suffiraient : les chiffres déjà affichés, leur méthode de calcul, leur évolution d'une année sur l'autre et les limites assumées. C'est l'action qui fait passer l'entreprise du niveau « dire » au niveau « documenter », et c'est le préalable à toute évaluation externe.

== 11.4 Synthèse des recommandations

#table(
  columns: (1.6fr, auto, auto, auto),
  table.header([Action], [Coût], [Effort], [Gain]),
  [Convertir les images en WebP], [nul], [faible], [immédiat et mesurable],
  [Publier les scores EcoIndex], [nul], [faible], [élevé, crédibilité],
  [Signer la Charte Relations Fournisseurs], [nul], [faible], [preuve opposable],
  [Publier un rapport d'impact annuel], [faible], [moyen], [élevé],
  [Documenter l'extinction des serveurs], [nul], [moyen], [élevé, comble la faille principale],
  [Rattacher le bilan carbone à un référentiel], [faible], [moyen], [très élevé, usage client],
  [Appliquer le RGESN], [faible], [moyen], [élevé, marchés publics],
  [Label Numérique Responsable niveau 1], [moyen], [élevé], [très élevé, audit tiers],
  [Label Engagé RSE de l'AFNOR], [moyen], [élevé], [très élevé, audit tiers],
  [Adhérer au Pacte Mondial], [faible], [faible], [moyen, symbolique],
)

Aucune de ces dix actions n'exige un service RSE dédié. Six d'entre elles sont réalisables en quelques jours de travail.



= 12. Analyse critique, seconde partie : ce que disent la presse, le droit et les ONG

== 12.1 Le secteur dans lequel Bearstech opère se dégrade vite

Une démarche d'entreprise ne se juge pas dans l'absolu, mais au regard de la trajectoire de son secteur. Les données publiées par le régulateur sont sans ambiguïté.

Dans son enquête annuelle « Pour un numérique soutenable » publiée le 21 mai 2026, *l'Arcep* relève que les 160 centres de données étudiés ont consommé *2,7 térawattheures d'électricité en 2024*, soit *12 % de plus en un an et 38 % de plus en trois ans*, malgré les gains d'efficacité. Sur la même période, *575 000 mètres cubes d'eau*, presque entièrement de l'eau potable, ont été prélevés pour le refroidissement, et les émissions du secteur ont progressé de *23 % en une seule année*, à 178 000 tonnes équivalent CO#sub[2]. Plus de 70 % de la consommation se concentre en Île-de-France, là précisément où se situe le datacenter utilisé par Bearstech.

Côté ADEME, l'actualisation de novembre 2024 porte l'empreinte du numérique français à *4,4 % de l'empreinte carbone nationale*, soit 29,5 millions de tonnes équivalent CO#sub[2], avec une part des centres de données passée de 16 % à *46 %*.

Autrement dit : l'efficacité par machine progresse, et l'impact total explose. C'est l'effet rebond, et il relativise fortement la portée d'un bon PUE.

== 12.2 La presse et les ONG : ce qui est reproché au secteur touche directement Bearstech

*Le gaspillage de la chaleur.* Dans un article du 10 avril 2025 intitulé « Data centers, un immense gâchis de chaleur », *Reporterre* décrit une chaleur dite fatale « qui se dissipe largement dans la nature », et relève que les 35 nouveaux centres prévus « vont générer plus de 100 térawattheures de chaleur par an, soit 2,5 fois les besoins en chauffage de tous les logements du Grand Paris ». Le journal souligne qu'une loi de 2021 oblige les industriels à étudier la récupération de cette chaleur, mais que l'obligation reste « uniquement déclarative ». Le constat vaut pour notre sujet : Bearstech ne mentionne nulle part la valorisation de la chaleur fatale de son hébergeur.

*Les garanties d'origine.* C'est la critique la plus directe. Bearstech annonce une alimentation « 100 % hydraulique garantie d'origine ». *Greenpeace France*, dans son classement des fournisseurs d'électricité, dénonce précisément ce mécanisme : la réglementation européenne permet de commercialiser comme verte une électricité produite à partir de n'importe quelle source, dès lors que le fournisseur achète les certificats correspondants, ce que l'ONG qualifie de greenwashing en l'absence d'investissement dans de nouvelles capacités renouvelables. Cette critique ne vise pas Bearstech en particulier : elle frappe à l'identique Scaleway et la quasi-totalité des hébergeurs français.

*La sobriété numérique.* *The Shift Project* retient une durée de vie de 4 à 5 ans pour un serveur et fait de l'allongement de la durée d'usage le premier levier de réduction. C'est le seul point sur lequel Bearstech devance les recommandations des organisations critiques, et cela mérite d'être dit.

== 12.3 Le droit se referme sur les allégations non prouvées

Trois éléments juridiques encadrent désormais ce que Bearstech affiche sur son site.

*La jurisprudence.* Par un jugement du *23 octobre 2024*, le tribunal judiciaire de Paris a condamné *TotalEnergies* pour pratiques commerciales trompeuses, à la suite d'une action des Amis de la Terre France, de Greenpeace France et de Notre Affaire à Tous. Le tribunal a jugé que les messages sur « l'ambition d'atteindre la neutralité carbone en 2050 » et sur le rôle d'acteur majeur de la transition énergétique étaient de nature à altérer le comportement du consommateur et à l'induire en erreur. La société a été condamnée à verser 8 000 euros à chacune des trois associations, à retirer les messages incriminés sous astreinte de 20 000 euros par jour et à publier un lien vers la décision.

La portée de cette décision dépasse largement le pétrole : elle établit qu'*une allégation environnementale invérifiable, diffusée par une entreprise à destination de ses clients, est une pratique commerciale susceptible d'être sanctionnée*, sur le fondement des articles L. 121-2 et suivants du code de la consommation.

*Le droit français des allégations.* Le décret n° 2022-539 du 13 avril 2022, pris pour l'application de l'article 12 de la loi Climat et Résilience, interdit depuis le 1#super[er] janvier 2023 d'affirmer dans une publicité qu'un produit ou un service est neutre en carbone, ou toute formulation équivalente, sans mettre à disposition du public les éléments qui le justifient.

*Le droit européen, applicable dans quelques jours.* La directive (UE) 2024/825 du 28 février 2024, dite directive anti-greenwashing, est applicable dans les États membres à compter du *27 septembre 2026*, soit six jours après la rédaction de ce rapport. Elle interdit les allégations environnementales génériques non étayées par une performance reconnue et démontrable, ainsi que les labels de durabilité qui ne reposent pas sur un système de certification. La transposition française n'était pas achevée au 19 août 2026, le texte ayant été adopté par le Sénat en février puis transmis à l'Assemblée nationale.

== 12.4 Conclusion générale

Bearstech n'est pas une entreprise qui fait du greenwashing. Cette étude, qui a examiné 353 pages de son site, ses comptes, ses dépôts de code, les mentions légales de ses clients et les fiches techniques de son hébergeur, n'a trouvé *aucune affirmation fausse*. Le statut coopératif est réel et enregistré. La durée de vie de dix ans du matériel est cohérente avec une politique d'achat assumée et revendiquée depuis des années. La contribution aux communs numériques est vérifiable dépôt par dépôt. L'écart salarial de 1 à 2, s'il est exact, place l'entreprise très au dessus de la norme du secteur.

Ce que cette étude établit est différent, et plus intéressant : *Bearstech pratique sans formaliser, et formalise sans faire auditer.* Sur les trois niveaux de preuve posés en introduction, dire, documenter, faire auditer, l'entreprise s'arrête presque toujours au premier. Elle affiche quatre chiffres sur sa page environnementale sans qu'aucun tiers ne les ait vérifiés, et l'un d'eux, le PUE de 1,36, est en réalité celui de son bailleur. Elle affirme éteindre les serveurs inutilisés sans le démontrer. Elle calcule des EcoIndex sans les publier, et son propre site est noté F. Elle affiche des chiffres de l'ADEME dépassés depuis deux ans.

Cette situation était défendable tant qu'elle ne portait pas à conséquence. Elle l'est de moins en moins, pour trois raisons convergentes, toutes datées de moins de deux ans :

+ *Le droit ne tolère plus l'allégation non étayée.* Le jugement TotalEnergies du 23 octobre 2024, le décret de 2022 sur les allégations de neutralité carbone et la directive européenne applicable le 27 septembre 2026 dessinent un régime dans lequel l'absence de preuve devient un risque juridique, et non plus une simple faiblesse de communication.
+ *La commande publique a basculé.* Depuis le 22 août 2026, tout marché public doit comporter un critère environnemental d'attribution. Bearstech, qui héberge un site de l'État, se présentera à ces consultations sans aucune pièce justificative, alors que ses pratiques réelles seraient bien notées.
+ *Les donneurs d'ordre privés évaluent leurs fournisseurs.* BNP Paribas, son client de référence, est à la fois évaluée par EcoVadis depuis 2010 et prescriptrice de cette évaluation.

La comparaison avec Scaleway résume tout le dossier. Les deux entreprises hébergent dans le même bâtiment, affichent le même PUE à deux centièmes près et la même durée de vie de dix ans pour leurs serveurs. L'une est médaillée EcoVadis Gold et voit ses objectifs climatiques validés par la SBTi, l'autre n'a rien. La différence entre les deux n'est pas la performance : *c'est la preuve*.

Et la comparaison avec Enix interdit d'en tirer une leçon trop simple. Enix ne publie pas la moindre ligne sur l'environnement, la gouvernance ou le social, et son site web est pourtant le plus sobre des trois, tandis que celui de Scaleway, labellisé, est le plus lourd. Le discours RSE d'une entreprise ne dit donc rien de ses pratiques réelles, dans un sens comme dans l'autre. C'est très exactement pour cette raison que l'audit par un tiers, le label et la notation extra-financière existent : non pas pour récompenser ceux qui parlent bien, mais pour permettre de vérifier ceux qui font.

C'est la seule chose qui manque à Bearstech, et c'est à sa portée.



= 13. Sources et références

Toutes les sources ci-dessous ont été consultées les 20 et 21 septembre 2026.

#set text(size: 9pt)

== 13.1 Sources primaires : Bearstech

- Site institutionnel, 353 pages analysées depuis sitemap.xml \ #link("https://bearstech.com")
- La SCOP : gouvernance, capital, écart salarial \ #link("https://bearstech.com/societe/scop")
- Démarche GreenOps et éco-conception \ #link("https://bearstech.com/societe/efficacite-energetique-et-conscience-ecologique")
- Efficacité énergétique : « Bearstech n'a jamais jeté une machine » \ #link("https://bearstech.com/performance/efficacite-energetique")
- Les 10 commandements de l'éco-conception d'infrastructures, 16 janvier 2025 \ #link("https://bearstech.com/societe/blog/les-10-commandements-de-leco-conception-dinfrastructures-chez-bearstech")
- Bilan carbone : méthodologie et usage du PUE de l'exploitant \ #link("https://bearstech.com/services/hebergement-et-infogerance/dashboard-de-pilotage-multi-cloud/bilan-carbone-de-votre-infrastructure")
- Références clients \ #link("https://bearstech.com/societe/references")
- Les amis de Bearstech : multi.coop et ALTER SI \ #link("https://bearstech.com/societe/les-amis-de-bearstech")
- Partenaires associatifs : Framasoft, April, La Quadrature du Net, Debian LTS \ #link("https://bearstech.com/societe/partenaires")
- PME, l'IA passe en production, 24 juillet 2026 : mention de la charte IA \ #link("https://bearstech.com/blog/pme-lia-passe-en-production")
- Organisation GitHub, 181 dépôts publics \ #link("https://github.com/bearstech")

== 13.2 Sources légales et financières

- Annuaire des entreprises, SIREN 479 227 993 \ #link("https://annuaire-entreprises.data.gouv.fr/entreprise/bearstech-bearstech-479227993")
- Pappers, comptes et dirigeants \ #link("https://www.pappers.fr/entreprise/bearstech-479227993")
- Pappers, fiche ENIX, SIREN 481 912 970 \ #link("https://www.pappers.fr/entreprise/enix-481912970")

== 13.3 Les donneurs d'ordre et leurs chartes

- BNP Paribas, Charte Achats Responsables \ #link("https://cdn-group.bnpparibas.com/uploads/file/charte_achats_responsables_fr.pdf")
- BNP Paribas, Charte RSE des Fournisseurs \ #link("https://group.bnpparibas/uploads/file/charte_rse_fournisseurs_fr_version2016.pdf")
- BNP Paribas dans le top 4 % des fournisseurs les plus responsables selon EcoVadis \ #link("https://group.bnpparibas/actualite/bnp-paribas-top-4-fournisseurs-responsables-monde-2020-ecovadis")
- SNCF, Charte Relation Fournisseurs et RSE \ #link("https://www.groupe-sncf.com/medias-publics/2024-02/charte_rse.pdf")
- SNCF, Code de conduite anticorruption \ #link("https://www.groupe-sncf.com/medias-publics/2024-04/code-conduite-anticorruption.pdf")
- SNCF, Charte éthique du groupe \ #link("https://www.groupe-sncf.com/medias-publics/2024-03/charteethique2023.pdf")
- Crédit Agricole, Charte Achats Responsables \ #link("https://www.credit-agricole.com/pdfPreview/208541")
- Mentions légales du site carrières du groupe Crédit Agricole, Bearstech désigné hébergeur \ #link("https://groupecreditagricole.jobs/mentions-legales/")
- Mentions légales de Choisir le service public, DGAFP, Bearstech désigné hébergeur \ #link("https://choisirleservicepublic.gouv.fr/mentions-legales/")

== 13.4 Le datacenter et les comparables

- OpCore DC3, Vitry-sur-Seine, fiche technique et PUE de 1,36 \ #link("https://www.datacenters.com/opcore-paris-dc3")
- OpCore DC3, fiche datacentermap \ #link("https://www.datacentermap.com/france/paris/iliad-dc3/")
- OPCORE, fiche PeeringDB \ #link("https://www.peeringdb.com/fac/1402")
- Scaleway, Environmental leadership : PUE, WUE, SBTi, EcoVadis Gold, réemploi \ #link("https://www.scaleway.com/en/environmental-leadership/")
- Enix, Kubernetes managé et infogérance certifiée ISO 27001 \ #link("https://enix.io/fr/kubernetes-manage/")
- Enix, organisation GitHub \ #link("https://github.com/enix")

== 13.5 Normes, labels et référentiels

- AFNOR, la démarche ISO 26000 \ #link("https://www.afnor.org/en/corporate-social-responsibility/iso-26000-approach/")
- AFNOR Certification, label Engagé RSE \ #link("https://certification.afnor.org/en/sustainable-development-csr/corporate-social-responsibility-commitment-label")
- Institut du Numérique Responsable, label Numérique Responsable \ #link("https://institutnr.org/label-numerique-responsable")
- Agence Lucie, label Numérique Responsable niveau 1 \ #link("https://agence-lucie.com/fr/nos-labels/label-lucie-numerique-responsable-niveau-1/")
- Boscop, SCOP du numérique, double labellisation Lucie et NR niveau 2 \ #link("https://boscop.fr/labellisation-lucie-numerique-responsable/")
- Référentiel général d'écoconception de services numériques, version 2024 \ #link("https://ecoresponsable.numerique.gouv.fr/publications/referentiel-general-ecoconception/")
- Charte Relations fournisseurs et achats responsables, Médiateur des entreprises \ #link("https://www.economie.gouv.fr/mediateur-des-entreprises/la-charte-relations-fournisseurs-et-achats-responsables")

== 13.6 Droit et jurisprudence

- Décret n° 2022-539 du 13 avril 2022, allégations de neutralité carbone dans la publicité \ #link("https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045570611")
- Directive (UE) 2024/825 du 28 février 2024, applicable le 27 septembre 2026 \ #link("https://eur-lex.europa.eu/eli/dir/2024/825/oj")
- Bercy, décret d'application de l'article 35 de la loi Climat et Résilience \ #link("https://www.economie.gouv.fr/daj/le-decret-dapplication-de-larticle-35-de-la-loi-climat-resilience-est-publie")
- Les critères environnementaux des marchés publics évoluent le 21 août 2026 \ #link("https://entreprendre.service-public.gouv.fr/actualites/A19042")
- Condamnation de TotalEnergies pour greenwashing, jugement du 23 octobre 2024, analyse de Novethic \ #link("https://www.novethic.fr/environnement/climat/totalenergies-condamne-greenwashing-climat-net-zero")
- Même décision, analyse de l'UFC Que Choisir \ #link("https://www.quechoisir.org/actualite-greenwashing-totalenergies-condamne-par-la-justice-n172264/")
- Même décision, compte rendu de Public Sénat \ #link("https://www.publicsenat.fr/actualites/environnement/proces-de-totalenergies-la-multinationale-partiellement-condamnee-pour-greenwashing")

== 13.7 Études, presse et organisations non gouvernementales

- ADEME et Arcep, impact environnemental du numérique en France, actualisation 2024 \ #link("https://ecoresponsable.numerique.gouv.fr/actualites/actualisation-ademe-impact/")
- ADEME et Arcep, rapport complet 2024 \ #link("https://ecoresponsable.numerique.gouv.fr/docs/2024/etude-ademe-impacts-environnementaux-numerique.pdf")
- ADEME et Arcep, note de synthèse de janvier 2022 \ #link("https://www.arcep.fr/uploads/tx_gspublication/etude-numerique-environnement-ademe-arcep-note-synthese_janv2022.pdf")
- Arcep, enquête annuelle Pour un numérique soutenable, édition 2026 \ #link("https://www.arcep.fr/fileadmin/user_upload/observatoire/enquete-pns/edition-2026/enquete-annuelle-pour-un-numerique-soutenable_edition2026_mai2026.pdf")
- Arcep, communiqué du 21 mai 2026 \ #link("https://www.arcep.fr/actualites/actualites-et-communiques/detail/n/environnement-eapns-210526.html")
- Next, consommation des datacenters en France : plus 38 % sur l'électricité en trois ans \ #link("https://next.ink/238656/consommation-des-datacenters-en-france-38-sur-lelectricite-et-16-sur-leau-en-trois-ans/")
- Reporterre, Data centers, un immense gâchis de chaleur, 10 avril 2025 \ #link("https://reporterre.net/Data-centers-un-immense-gachis-de-chaleur")
- Greenpeace France, classement des fournisseurs et critique des garanties d'origine \ #link("https://www.greenpeace.fr/espace-presse/electricite-verte-greenpeace-france-devoile-un-nouveau-classement-des-fournisseurs/")
- Greenpeace France, quel fournisseur d'électricité choisir \ #link("https://www.greenpeace.fr/fournisseur-electricite-choisir/")
- The Shift Project, Déployer la sobriété numérique \ #link("https://theshiftproject.org/en/publications/deploying-digital-sobriety/")
- Boavizta, comment évaluer l'empreinte de la fabrication d'un serveur \ #link("https://boavizta.org/en/blog/empreinte-de-la-fabrication-d-un-serveur")

== 13.8 Outils de mesure

- EcoIndex, collectif GreenIT \ #link("https://www.ecoindex.fr/")
- GreenIT-Analysis, extension de mesure \ #link("https://github.com/cnumr/GreenIT-Analysis")
- Script de mesure du rapport, mesure_ecoindex.py, fourni dans le dépôt de travail : réimplémentation de l'algorithme EcoIndex appliquée aux ressources réellement téléchargées.



#set text(size: 10.5pt)

= 14. Remerciements

Ce travail a été mené collectivement, et chacun tient à remercier ce qui l'a porté.

*Khalil BEMKIRAT* remercie tout le monde, sans exception.

*Germain GODEFROID* remercie, comme toujours, son infrastructure.

*Maurice KONE* remercie l'animé Naruto, qui l'inspire chaque jour.

#v(1cm)

#line(length: 100%, stroke: 0.4pt + luma(180))
#v(6pt)
#grid(
  columns: (1fr, 1fr, 1fr),
  align: (left, center, right),
  text(size: 8.5pt, fill: luma(100))[
    Document rédigé avec Typst
  ],
  text(size: 8.5pt, fill: luma(100))[
    EPITA Apprentissage
  ],
  text(size: 8.5pt, fill: luma(100))[
    Promotion 2028
  ]
)
