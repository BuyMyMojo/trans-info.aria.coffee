#import "@preview/ssrn-scribe:0.9.1": *
#import "@preview/lilaq:0.5.0" as lq
#import "@preview/dashy-todo:0.1.3": todo
#import "@preview/orchid:0.1.0"
#import "@preview/glossarium:0.5.10": gls, glspl, make-glossary, print-glossary, register-glossary


#show: make-glossary
#let entry-list = (
  (
    key: "E2",
    long: "Oestradiol",
    description: [#link("https://en.wikipedia.org/wiki/Estradiol")[Oestradiol], also called oestrogen, oestradiol, is an estrogen steroid hormone and the major female sex hormone.],
  ),
  (
    key: "T",
    long: "Testosterone",
    description: [#link("https://en.wikipedia.org/wiki/Testosterone")[Testosterone] is the primary male sex hormone and androgen in males],
  ),
  (
    key: "eun",
    short: "EUn",
    long: "Estradiol undecylate",
    description: [
      #link("https://en.wikipedia.org/wiki/Estradiol_undecylate")[Estradiol undecylate], also known as estradiol undecanoate is a lesser used ester of #link("https://en.wikipedia.org/wiki/Estradiol")[Oestradiol]. Typically taken on a 30 day injection cycle, also taken in a shorter 14 day injection cycle.
    ],
  ),
  // Add more terms
)
#register-glossary(entry-list)

#set quote(block: true)
#show quote: set align(center)
#show quote: set pad(x: 5em)

//#import "@preview/catppuccin:1.1.0": catppuccin, flavors
//#show: catppuccin.with(flavors.frappe)

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
      note: [#orchid.generate-link("0009-0004-6743-0109", format: "full", name: "Aia Quinlan")],
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
  body-paragraph-spacing: 2em, // spacing between main-text paragraphs
  body-text-spacing: 106%, // glyph tracking for the body text

  bibliography: bibliography(
    "bibliography.yml",
    title: "References",
    style: "apa",
  ), // attach your references
)

#outline(title: "TODOs", target: figure.where(kind: "todo"))

= Abstract
#lorem(5)

#todo(position: "inline")["Start Abstract"]

= Introduction
#lorem(5)

#todo(position: "inline")["Start Introduction"]

= Methods
Frequent blood tests where taken, every 1 to 2 weeks depending on avaliability of my GP, in order to map out the trend of my #gls("E2") levels through out the usual injection cycle of #gls("eun") which is 30 days.

I sampled my lowest #gls("E2") either on the day of my injection or the day before when my injection day landed on a Sunday as my local pathology lab was closed.

#todo(position: "inline")["Expand on my method as I continue researching"]

== Target Range
In this paper I will mention a "target range" in a few places, depending on what you've been taught or where you look this can mean several different things! I will list a few examples that are most common and explain my target and teh reasoning behind it.

=== AuthPATH guidelines:
#quote(attribution: [@auspath-e2-level-rec])[
  "For those wishing to have complete testosterone suppression, the total testosterone target is < 2 nmol/L."

  "AusPATH SOC 2025 recommends maintaining estradiol concerntrations above 250 pmol/L, in accordance with Cheung et al."
]

=== Cheung et al:
#quote(attribution: [@position-statement-hormonal-management])[
  "We recommend targeting estradiol levels of 250–600 pmol/L and total testosterone levels < 2 nmol/L"
]

=== WPATH Standards of Care, Version 8
#quote(attribution: [@wpath-e2-level-rec])[
  "Serum testosterone levels should be less than 50 ng/dL."


  "Serum estradiol should be in the range of 100-200 pg/mL."
]

=== Journal of Clinical Endocrinology & Metabolism

#quote(attribution: [@endocrine-treatment-of-fender-dysphoric-and-gender-incongruent-persons])[
  "Serum estradiol should not exceed the peak physiologic range: 100–200 pg/mL."
]

== Decision

The above quotes are from trusted sources typically used in the education of medical professionals to help guide their decisions relating to GAHT.

We convert the levels mentioned above to the same format in @e2-recommendations.

#figure(
  lq.diagram(
    width: 100%,
    height: 8cm,
    title: [Target range by source],
    ylabel: "pmol/L",
    xlabel: "source",
    xlim: (0, 5),
    legend: (position: left, dy: -7.8em),
    xaxis: (
      ticks: range(1, 5).zip(([AusPath], [MJA], [WPATH], [JCEM])),
    ),
    lq.scatter(
      (1, 2, 3, 4),
      (250, 250, 367, 367),
      size: (180, 180, 180, 180),
      color: auto,
      label: "Recommended Min",
    ),
    lq.scatter(
      (2, 3, 4),
      (600, 734, 734),
      size: (180, 180, 180),
      color: auto,
      label: "Recommended Max",
    ),
  ),
  caption: [Overview of #gls("E2") recommendations converted to pmol/L#footnote["AusPATH SOC 2025 does not recommend a specific upper limit for serum estradiol[...]" - @auspath-e2-level-rec]],
)<e2-recommendations>

Being informed about the recommended ranges as shown in @e2-recommendations helped form the goals for my own levels, I am aiming for my E2 trough levels to sit around 650pmol/L.

to achieve this 32mg of EUn should prove sufficient in this goal.#footnote[Simulated injection cycle demonstrating this: #link("https://estrannai.se/#it1_cu,32,30,5-32,30,5-32,28,5-32,28,5-32,28,5-32,28,5-32,28,5-32,28,5-32,28,5-32,28,5_cu,32,28,5")]

#todo(position: "inline")["list more target ranges"]

#todo(position: "inline")["Define my target range"]

= Results

== Overall levels

in @all-e2-levels we look at my #gls("E2") levels(pmol per litre) over the entire course of this research.

#figure(
  lq.diagram(
    width: 100%,
    height: 8cm,
    title: [OESTRADIOL],
    ylabel: "pmol/L",
    xlabel: "date",
    xaxis: (tick-distance: 1),
    lq.plot(
      (
        datetime(year: 2026, month: 2, day: 06),
        datetime(year: 2026, month: 2, day: 13),
        datetime(year: 2026, month: 2, day: 20),
      ),
      (1189, 906, 496),
      smooth: false,
      mark: "s",
      label: [E2],
    ),
  ),
  caption: [Overview of all #gls("E2") levels during this research],
)<all-e2-levels>


== The first cycle
in @first-e2-levels we look at the very first 28 days after starting #gls("eun"), this mainly shows the fall off from EEn and the build up of #gls("eun") over that initial transition between medications.

The test taken on the first injection day, #datetime(day: 6, month: 2, year: 2026).display(), shows my trough levels at the end of an EEn injection cycle with 5mg of EEn#footnote([Simulated injection cycle for reference: #link("https://estrannai.se/#i1_cu,5,7,2-5,7,2-5,7,2-5,7,2-5,7,2-5,7,2-4,7,2-5,7,2-5,7,2-5,7,2_c,5,7,2")]) but before the initial injection of #gls("eun").

The first injection was an injection of 16mg, this was origionally done in error as I read the wrong value in my early research. Continuing this dose size would have caused substancially lower #gls("E2") levels than desired#footnote([Simulated values continuing this cycle: #link("https://estrannai.se/#it1_cu,5,7,2-5,7,2-5,7,2-5,7,2-5,7,2-5,7,2-5,7,2-5,7,2-5,7,2-16,7,5-16,30,5-16,30,5-16,30,5-16,30,5-16,30,5-16,30,5-16,30,5_cu,16,30,5")]).

#figure(
  lq.diagram(
    width: 100%,
    height: 8cm,
    title: [OESTRADIOL],
    ylabel: "pmol/L",
    xlabel: "date",
    xaxis: (tick-distance: 1),
    lq.plot(
      (
        datetime(year: 2026, month: 2, day: 06),
        datetime(year: 2026, month: 2, day: 13),
        datetime(year: 2026, month: 2, day: 20),
      ),
      (1189, 906, 496),
      smooth: false,
      mark: "s",
      label: [E2],
    ),
  ),
  caption: [The first 30 days of #gls("E2") after starting #gls("eun")],
)<first-e2-levels>

#quote(attribution: [@why-dont-we-want-zero-testosterone])[
  "...near-zero testosterone (less than 10 ng/dl, or 0.35 nmol/L) can cause issues..."
]

#figure(
  lq.diagram(
    width: 100%,
    height: 8cm,
    title: [TESTOSTERONE],
    ylabel: "nmol/L",
    xlabel: "date",
    xaxis: (tick-distance: 1),
    lq.plot(
      (
        datetime(year: 2026, month: 2, day: 06),
        datetime(year: 2026, month: 2, day: 13),
        datetime(year: 2026, month: 2, day: 20),
      ),
      (0.7, 0.6, 0.5),
      smooth: false,
      mark: "s",
      label: [T],
    ),
  ),
  caption: [The first 28 days of #gls("T") after starting #gls("eun")],
)<first-T-levels>

From this point forward I moved to 32mg injection cycle as shown in @dosing-examples. This generally should bring my #gls("E2") levels to the recomended range#footnote([Simulation of #gls("E2") levels after sapping from the 16mg injection to continuous 32mg injections: #link("https://estrannai.se/#it1_cu,5,7,2-5,7,2-5,7,2-5,7,2-5,7,2-5,7,2-5,7,2-5,7,2-5,7,2-16,7,5-32,30,5-32,30,5-32,30,5-32,30,5-32,30,5-32,30,5-32,30,5_cu,32,30,5")]).

#figure(
  image("./Injection-Monotherapy-dosing.png", width: 80%),
  caption: [
    Dosages for estradiol injections @injection-monotherapy-dosing
  ],
)<dosing-examples>

== Average monthly cycle

After my levels stabilized I started taking my blood tests at varying different times during my monthly cycle to build a scatter plot of where my levels sit X days after injection
#figure(
  lq.diagram(
    width: 100%,
    height: 8cm,
    title: [E2 levels by days since injection],
    ylabel: "pmol/L",
    xlabel: "days since injection",
    lq.scatter(
      (0, 7, 14, 0, 7, 14, 1, 8, 16, 1, 8, 16),
      (1189, 906, 496, 1180, 920, 480, 1100, 880, 470, 1120, 860, 465),
      size: auto,
      color: auto,
      label: [E2],
    ),
  ),
  caption: [
    E2 levels sorted by days since injection#footnote[THIS IS A FABRICATION OF DATA!! It is too early to use real data, this figure is here just to help with laying out the paper.]
  ],
)<e2-by-days-from-injection>

= Discussion
#lorem(5)
#todo(position: "inline")["Start Discussion"]

= Conclusions
#lorem(5)
#todo(position: "inline")["Start Conclusion"]

= Acknowledgements
#lorem(5)
#todo(position: "inline")["Start Acknowledgements"]

= Glossary

#print-glossary(
  entry-list,
)

