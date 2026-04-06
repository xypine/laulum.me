#let sectionTitle(title) = [
  #state("section").update(_old => title)
  #block(height: 50%, width: 100%)[
    #set align(horizon)
    #set align(center)
    #heading(title)
    // TODO: Illustrations
  ]
]