#import "@preview/ssrn-scribe:0.9.1": *
#import "@preview/lilaq:0.5.0" as lq
#import "@preview/dashy-todo:0.1.3": todo
#import "@preview/orchid:0.1.0"

#import "@preview/catppuccin:1.1.0": catppuccin, flavors
#show: catppuccin.with(flavors.frappe)

// if you do not want to use the integrated packages, you can comment out the following lines
#import "extra.typ": *
#show: great-theorems-init

#show: paper.with(
  font: "TX-02", // core body font family
  fontsize: 12pt, // core body font size
  maketitle: true, // true → dedicate a cover page; false → inline title
  title: [Use of Estradiol Undecylate for MTF HRT: Research and Experimentation], // document title
  subtitle: "The independent research of a crazy woman", // optional subtitle line

  // Cover-page–only spacing and typography (ignored when maketitle=false)
  cover-text-width: 90%, // width of the abstract/keywords block
  cover-line-leading: 1.32em, // line height for cover/front matter paragraphs
  cover-paragraph-spacing: 0.7em, // paragraph spacing on the cover/front matter

  // Author grid controls (shared across both modes)
  author-columns: 2, // override the auto-detected column count
  author-alignment: center, // column alignment for author details
  authors: (
    (
      name: "Aria Quinlan",
      affiliation: "trans-info.aria.coffee",
      email: "hello@aria.coffee",
      note: [#orchid.generate-link("0009-0004-6743-0109", format: "full",name: "Aia Quinlan")],
    ),
  ),
  date: "Febuary 2026", // version/date string (shown in both modes)
  abstract: [Estradiol Valerate is the only form of _injectable_ estrogen for use in HRT within Australia, outside of Australia there are more esters available with longer injection cycles improving quality of life for gender diverse individuals. This paper will focus specifically on Estradiol Undecylate, my personal experience with it, my levels before and during it and other general information regarding its use.], // optional abstract (rendered front matter)
  keywords: [
    Transgender,
    Estradiol,
    Estradiol Undecylate,
    HRT,
    MTF],
  acknowledgments: "This paper is a work in progress. Please do not cite without permission.", // footnote on title block
  frontmatter-gap: 210pt, // spacing between abstract/keywords/JEL entries

  // Body typography (applies to both modes)
  body-line-leading: 1.32em, // main-text line height
  body-paragraph-spacing: 0.7em, // spacing between main-text paragraphs
  body-text-spacing: 106%, // glyph tracking for the body text

  bibliography: bibliography(
    "bibliography.yml",
    title: "References",
    style: "apa",
  ), // attach your references
)

#outline(title: "TODOs", target: figure.where(kind: "todo"))

= Abstract
#lorem(30)

= Introduction
#lorem(10)

= Methods
#lorem(10)

= Results
in @heam-levels we look at my haemoglobin levels(grams per litre) from weekly blood tests


#let (x-heam, y-heam) = lq.load-txt(read("heamoglobin.csv"))
#figure(
  lq.diagram(
    width: 100%,
    height: 8cm,
    title: [HAEMOGLOBIN],
    ylabel: "g/L",
    xlabel: "week",
    xaxis: (tick-distance: 1),
    lq.plot(
      x-heam,
      y-heam,
      smooth: false,
      mark: "s",
    ),
  ),
  caption: [Weekly haemoglobin levels],
)<heam-levels>

= Discussion
#lorem(20)

= Conclusions
#lorem(20)

= Acknowledgements
#lorem(20)
