#import "@preview/arkheion:0.1.2": arkheion, arkheion-appendices
#import "@preview/lilaq:0.5.0" as lq

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
#lorem(50)
