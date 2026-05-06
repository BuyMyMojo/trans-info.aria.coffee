#import "@preview/arkheion:0.1.2": arkheion, arkheion-appendices
#import "@preview/lilaq:0.5.0" as lq
#import "@preview/glossarium:0.5.10": gls, glspl, make-glossary, print-glossary, register-glossary

#show: make-glossary
#let entry-list = (
  (
    key: "e2",
    short: "E2",
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
  (
    key: "een",
    short: "EEn",
    long: "Estradiol enantate",
    description: [
      #link("https://en.wikipedia.org/wiki/Estradiol_enantate")[Estradiol enantate], also spelled estradiol enanthate and sold under the brand names Perlutal and Topasel among others is an ester of #link("https://en.wikipedia.org/wiki/Estradiol")[Oestradiol]. Typically taken on a 7 day injection cycle, it is most commonly used within Canada, Mexico and much of South America.
    ],
  ),
  // Add more terms
)
#register-glossary(entry-list)

#show: arkheion.with(
  title: "The data from the WIP paper: \"Use of Estradiol Undecylate for MTF HRT: Research and Experimentation\"",
  authors: (
    (
      name: "Aria Brady Quinlan",
      email: "hello@aria.coffee",
      affiliation: "trans-info.aria.coffee",
      orcid: "0009-0004-6743-0109",
    ),
  ),
  // Insert your abstract after the colon, wrapped in brackets.
  // Example: `abstract: [This is my abstract...]`
  abstract: [The paper "Use of Estradiol Undecylate for MTF HRT: Research and Experimentation" is under active development but the data may be useful for those who are looking for it.],
  keywords: ("Transgender", "Estradiol", "Estradiol Undecylate", "HRT", "MTF"),
  date: datetime.today().display(),
)

= About
While working on my own case study on #gls("eun") and it's resulting #gls("e2") levels I have gathered several points of data. This report is to release the data on it's own while I am still in the process of writing the full case study.


#pagebreak()
= Data Tables

#let blood_results = csv("bloods.csv")
#let e_after_injection = csv("E2 days after injection.csv")
#let injection_days = csv("injection days.csv")

Any days where injection and tests share the order is always a blood test before injection to measure trough levels.

#figure(
table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  ..blood_results.flatten(),
),
caption: [#gls("e2") and #gls("T") levels from each test result]
)<blood-tests>

#figure(
table(
  columns: (auto, auto),
  inset: 10pt,
  align: horizon,
  ..injection_days.flatten(),
),
caption: [Dates injections took place and corresponding dosages]
)<injection-days>

#figure(
table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  ..e_after_injection.flatten(),
),
caption: [#gls("e2") levels measured in relation to days since last injection]
)<e2-since-injection>

#pagebreak()
= Glossary

#print-glossary(
  entry-list,
)
