#page(columns: 2, header: [
  #set text(size: 0.69em)
  #heading([Hakemisto], outlined: true, numbering: none)
])[
  #set text(size: 0.69em)
  #context {
     let entries = query(<songtitle>)
     // sort entries by given key function
     let sortedEntries = entries.sorted(key: entry => {
       entry.value
     })
     sortedEntries.map(entry => {
       entry.value
       [ ]
       box(width: 1fr, repeat[.])
       [ ]
       [#text(font: "IBM Plex Mono",str(entry.location().page()))]
     }).join([ \ ])
  }
  #{
  }
]
