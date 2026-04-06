#import "@preview/cmarker:0.1.8"

#let songGrid(left, right) = [
    #grid(columns: (1cm, 1fr), column-gutter: .50cm)[
      #left
    ][
      #right
    ]
]

#let song(filename) = [
  #let content = read("/songs/" + filename + ".md")
  #let parts = content.split("---").map(v => v.trim()).filter(v => v != "")

  #let frontmatter_lines = parts.first()
  #let content_raw = parts.last()
  #let content = content_raw.replace(regex("[\n]:,:(.*):,:[\n]"),  m => "\n:,: " + m.captures.first().trim() + " :,:\n").trim().replace("\n", "\\\n")

  #let title = frontmatter_lines.split("\n").find(v => v.starts-with("title:")).slice(6).trim()
  #let writers_opt = frontmatter_lines.split("\n").find(v => v.starts-with("writers:"))
  #let writers = if writers_opt != none {
    writers_opt.slice(9)
  }
  #let melody_opt = frontmatter_lines.split("\n").find(v => v.starts-with("melody:"))
  #let melody = if melody_opt != none {
    melody_opt.slice(8)
  }


  #heading(numbering: none, outlined: true, level: 2, [
    #context [
      #let n = int(counter("song").display())
      #let n = if n < 16 {
        "0x0" + upper(str(n, base: 16)) + "."
      } else {
        "0x" + upper(str(n, base: 16)) + "."
      }
      #let n = n
      #songGrid(
        [
          #text(font: "IBM Plex Mono", size: 0.9em,n)
        ],
        [
          #text(font: "IBM Plex Mono", size: 0.9em,title)
        ]
      )
      #metadata(title) <songtitle>
    ]
  ])
  #songGrid([], [
    #if melody != none {
      text(font: "IBM Plex Mono", size: 0.7em, "Säv. " + melody)
      linebreak()
    }
    #if writers != none {
      text(font: "IBM Plex Mono", size: 0.7em, "San. " + writers)
      linebreak()
    }
    #block()[
      #set par(leading: 0.5em)
      #set par(spacing: 0.5em)
      #cmarker.render(content)
      #box(width: 1em, height: 1em, baseline: .2em, inset: (left: .2em))[
        // TODO: Replace with the cute duck
        #image("../graphics/Logo-white-on-black.png", width: 1em)
      ]
    ]
  ])

  #counter("song").step()
]
