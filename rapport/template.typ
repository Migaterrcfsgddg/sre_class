// =====================================================================
// TEMPLATE RAPPORT EPITA - TYPST
// Modèle sobre et institutionnel inspiré du guide officiel EPITA
// =====================================================================

#let project(
  title: "Titre du Document",
  subtitle: "",
  course: "Intelligence Artificielle pour la Cybersécurité",
  authors: ("xydrive", "fyrielle", "sia"),
  professor: "",
  promotion: "2028",
  group: "Apping2_C1",
  date: "Septembre 2026",
  body
) = {
  // Métadonnées du document PDF
  set document(title: title, author: authors)

  // Typographie générale : sobre, sans-serif, lisible
  set text(
    font: ("Liberation Sans", "Carlito", "DejaVu Sans"),
    size: 10.5pt,
    lang: "fr",
    fill: rgb("1a1a1a"),
  )

  // Paragraphes : texte justifié, interligne soigné
  set par(justify: true, leading: 0.75em)

  // Hiérarchie des titres : sobre, pas d'effets superflus
  show heading.where(level: 1): it => block(
    above: 1.8em, below: 0.8em,
    text(weight: "bold", size: 14pt, fill: rgb("00335e"), it.body)
  )

  show heading.where(level: 2): it => block(
    above: 1.3em, below: 0.6em,
    text(weight: "bold", size: 11.5pt, fill: rgb("00335e"), it.body)
  )

  show heading.where(level: 3): it => block(
    above: 1em, below: 0.4em,
    text(weight: "bold", size: 10.5pt, fill: rgb("2d3748"), it.body)
  )

  // Style des listes à puces
  set list(indent: 10pt, body-indent: 6pt, marker: ([•], [•]))

  // ===================================================================
  // PAGE 1 : PAGE DE GARDE (SOBRE, FOND BLEU EPITA #00335e)
  // ===================================================================
  set page(
    paper: "a4",
    margin: 0cm,
    fill: rgb("00335e"),
    header: none,
    footer: none,
  )

  block(
    width: 100%,
    height: 100%,
    inset: (x: 2.5cm, top: 3.2cm, bottom: 2.2cm),
    [
      // Logo EPITA en haut (polygone blanc officiel)
      #align(center + top)[
        #image("assets/epita_logo_cover.png", width: 50%)
      ]

      #v(1fr)

      // Bloc central : Cours, Titre, Sous-titre
      #align(center)[
        #if course != "" [
          #text(size: 11pt, weight: "medium", fill: rgb("dbeafe"), tracking: 0.6pt)[
            Cours : #course
          ]
          #v(0.8cm)
        ]

        #text(size: 24pt, weight: "bold", fill: white)[
          #title
        ]

        #if subtitle != "" [
          #v(0.5cm)
          #text(size: 11.5pt, fill: rgb("cbd5e1"), weight: "regular")[
            #subtitle
          ]
        ]

        #v(1.8cm)

        // Bloc Métadonnées : Auteurs et Enseignant (strictement carré, sobre)
        #let sorted-authors = authors.sorted(key: it => it.split(" ").last())
        #block(
          width: 100%,
          stroke: 0.5pt + rgb("204a75"),
          fill: rgb("002b50"),
          radius: 0pt, // Angles droits stricts
          inset: 14pt,
          [
            #grid(
              columns: (1fr, 1fr),
              gutter: 16pt,
              align: (left + top, left + top),
              [
                #text(size: 8pt, weight: "bold", fill: rgb("93c5fd"), tracking: 0.5pt)[AUTEURS & ÉDITEURS] \
                #v(6pt)
                #for author in sorted-authors [
                  #text(size: 9.5pt, weight: "bold", fill: white)[#author] \
                  #v(2.5pt)
                ]
              ],
              [
                #text(size: 8pt, weight: "bold", fill: rgb("93c5fd"), tracking: 0.5pt)[ENSEIGNANT RÉFÉRENT] \
                #v(6pt)
                #text(size: 9.5pt, fill: white)[
                  Professeur : #if professor != "" [*#professor*] else [#box(line(length: 120pt, stroke: 0.5pt + rgb("94a3b8")))]
                ]
              ]
            )
          ]
        )
      ]

      #v(1fr)

      // Bas de page de garde : 3 éléments (gauche, centre, droite)
      #align(bottom)[
        #line(length: 100%, stroke: 0.5pt + rgb("204a75"))
        #v(8pt)
        #grid(
          columns: (1fr, 1fr, 1fr),
          align: (left, center, right),
          text(size: 9.5pt, fill: rgb("cbd5e1"))[
            *Promotion :* #promotion
          ],
          text(size: 9.5pt, fill: rgb("cbd5e1"))[
            *Groupe :* #group
          ],
          text(size: 9.5pt, fill: rgb("cbd5e1"))[
            *Date de remise :* #date
          ]
        )
      ]
    ]
  )

  // ===================================================================
  // PAGES SUIVANTES : CORPS DU DOCUMENT (PAGES 2+)
  // ===================================================================
  set page(
    paper: "a4",
    margin: (top: 2.6cm, bottom: 2.4cm, x: 2.4cm),
    fill: white,
    header-ascent: 1.2cm,
    footer-descent: 1.2cm,
    header: context {
      let page-num = counter(page).get().first()
      if page-num > 1 [
        #block(width: 100%)[
          #grid(
            columns: (1fr, 1fr),
            align: (left, right),
            text(size: 9pt, fill: luma(60), weight: "medium")[#page-num],
            text(size: 8.5pt, fill: luma(110))[EPITA Apprentissage]
          )
          #v(3pt)
          #line(length: 100%, stroke: 0.4pt + luma(180))
        ]
      ]
    },
    footer: context {
      let page-num = counter(page).get().first()
      if page-num > 1 [
        #align(right + bottom)[
          #image("assets/epita_logo_footer.png", height: 1.1cm)
        ]
      ]
    }
  )

  body
}
