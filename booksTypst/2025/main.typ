#import "intro.typ": intro

#set text(lang: "fi")
#set page(width: 10cm, height: 15cm)

#set text(size: 0.95em, font: "EB Garamond 12")


// TODO: Parse songs etc from book.json
#intro("TKO-äly ry.")

#page()[]

#include "sectionOutline.typ"

#page()[]

#let roman-sections() = (..numbers) => {
  if numbers.pos().len() == 1 {
    // Only top level headings (sections)
    numbering("I", ..numbers)
  }
}

#set heading(numbering: roman-sections())

#include "part1.typ"
#page[]
#include "part2.typ"

#include "songIndex.typ"
