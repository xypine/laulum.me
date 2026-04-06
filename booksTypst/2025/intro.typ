#let preHeading(body) = [
  #block(spacing: 0em, inset: (bottom: 1em))[
    #text(
      font: "Montserrat",
      size: 16pt,
      weight: "black",
      style: "normal",
      body,
    )
  ]
]

#let intro(organisation) = [
  #page()[
    #let lineUntilEnd() = [
      #box(width: 1fr, repeat[\_])
    ]
    #let field(fieldlabel, double: false) = [
      #block()[
        #set par(leading: 1.5em)
        #text(fieldlabel)#lineUntilEnd()
        #linebreak()
        #if double {
          lineUntilEnd()
          linebreak()
        }
      ]
    ]
    #grid(
      columns: (1fr, 3cm),
      column-gutter: 1em,
      [
        #align(horizon)[
          #set align(center)
          #block(inset: (top: 1.5em, bottom: 0em))[
            #preHeading("Minä")
          ]
        ]
        #align(bottom)[
          #block(inset: (top: 0em, bottom: 1.5em))[
            #field("Nimi:")
          ]
        ]
      ],
      [
        #rect(height: 4cm, width: 3cm)
      ],
    )
    #set block(spacing: 3em)
    #field("Käyttäjänimi: ")
    #field("Aloitusvuodet: ")
    #field("Lempisitsilaulu: ", double: true)
    #field("Ohjelmointiäidinkieli: ", double: true)
  ]
  #counter(page).update(0)
  #page()[]
  #page()[]
  #page()[
    #set text(size: 0.69em)
    Julkaisija: #linebreak()
    #organisation #linebreak()
    #linebreak()
    #lorem(20) #linebreak()
    #linebreak()
    #lorem(40) #linebreak()
    #linebreak()
    #lorem(30) #linebreak()
    #linebreak()
    #lorem(20) #linebreak()
    #linebreak()
    #lorem(10) #linebreak()
    #align(bottom)[
      #grid(
        columns: (1fr, auto),
        [
          Painos:#linebreak()
          \1. painos
          1/2026 #linebreak()
          750 kpl #linebreak()
          Painotalo
        ],
        [
          // TODO
          #image(width: 1.5cm, "graphics/Logo-white-on-black.png")
        ],
      )
    ]
  ]

  #page()[
    #set align(horizon)
    #align(center)[
      #image("graphics/Logo-white-on-black.png")
    ]
  ]

  #page()[
    #preHeading("Esipuhe")
    #set text(size: 0.69em)
    #lorem(100)
  ]

  #page()[
    #set text(size: 0.69em)
    TODO: Esipuhe jatkuu
  ]

  #page()[
    #set text(size: 0.69em)
    #preHeading("Sitsiohjeet")
    #lorem(100)
  ]

  #page()[
    #set text(size: 0.69em)
    #preHeading("Sitsi Instructions")
    #lorem(100)
  ]

]
