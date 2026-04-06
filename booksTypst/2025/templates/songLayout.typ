#let songLayout(children) = {
  set page(
    header: 
      box(width: 100%)[
        #set align(center)
        #set align(horizon)
        #set par(leading: 0em, spacing: .5em)
        #context [
          #let pageNum = counter(page).get().first()
          #let section = state("section").get()
          #if calc.even(pageNum) {
            text(size: 0.75em, "TKO-äly")
          } else if section != none {
            text(size: 0.75em, section)
          }
        ]
        #line(start: (0%, 0cm), end: (100%, 0cm))
      ],
    footer:
      box(width: 100%)[
        #set align(center)
        #set align(horizon)
        #set par(leading: 0em, spacing: .5em)
        #line(start: (0%, 0cm), end: (100%, 0cm))
        #context [
          #let pageNum = counter(page).get().first()
          #let txt = text(font: "IBM Plex Mono", size: 0.65em, spacing: 0em, "/" + str(pageNum) + "/")
          #if calc.even(pageNum) {
            set align(left)
            txt
          } else {
            set align(right)
            txt
          }
        ]
      ],
  )
  children
}