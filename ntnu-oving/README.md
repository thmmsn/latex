# NTNU-øving i LaTeX

Mal for øvinger og løsningsforslag i NTNU-stil. Den bygger på NTNU sin
offisielle øvingsklasse `NTNUoving` og løsningsforslagsklassen `NTNUlf`,
og legger til pakken `ovingekstra` med hint, løsningsblokker,
bolkoverskrifter, litteraturtabell og NTNU sin skrifttype Open Sans.
Klassefilene er ikke endret.

## Filer

| Fil | Innhold |
|---|---|
| `NTNUoving.cls` | NTNU sin øvingsklasse (Håvard Berland og Harald Hanche-Olsen) |
| `NTNUlf.cls` | Løsningsforslagsklassen, bygger på `NTNUoving` |
| `ovingekstra.sty` | Tilleggene, se kommandoene under |
| `ntnulogoblaa.png` | Blå NTNU-logo, brukes som standard |
| `ntnulogosort.pdf` | Sort logo, brukes med klasseopsjonen `sortlogo` eller `graalogo` |
| `mwe.tex` | Minimalt eksempel, gir oppgavesettet |
| `mwe-lf.tex` | Gir løsningsforslaget til `mwe.tex` |

## Kom i gang

Legg filene i samme mappe som dokumentet ditt, eller i din lokale
TeX-mappe (`~/Library/texmf/tex/latex/ntnu-oving/` på Mac,
`~/texmf/tex/latex/ntnu-oving/` på Linux). På Overleaf laster du dem opp
i prosjektet.

Bygg eksemplet med pdflatex to ganger, så sidetall og hintliste blir
riktige:

```bash
pdflatex mwe.tex && pdflatex mwe.tex
```

```bash
pdflatex mwe-lf.tex && pdflatex mwe-lf.tex
```

Filnavnene må skrives med store og små bokstaver nøyaktig som her
(`NTNUoving.cls`, `NTNUlf.cls`). Mac skiller ikke mellom dem, men Linux og
Overleaf gjør det.

## Minimalt eksempel

```latex
\documentclass[11pt,a4paper,norsk]{NTNUoving}   % NTNUlf for løsningsforslag
\usepackage{ovingekstra}

\fag{TBA4155 Byggeprosess: Tidligfasen i prosjekter}
\semester{Høst 2026}
\institutt{Institutt for bygg- og miljøteknikk}
\ovingnummer{1}
\ovingtittel{Eksempeløving}

\begin{document}
\ovingtittelblokk

\bolk{Begrep og termer}

\oppgave{Forklar begrepet forventningsverdi.}
\hint{Kapittel 2.}
\losning{Forventningsverdien er middelverdien.}

\clearpage
\appendix
\hinttabell
\end{document}
```

Med `NTNUoving` vises bare oppgavene. Med `NTNUlf` vises også svarene i
`\losning{...}`, og etiketten øverst blir «Løsningsforslag til øving».

## Oppgavesett og løsningsforslag fra samme fil

Den enkleste måten å holde oppgaver og svar i takt på er én fil med alt
innhold og en liten fil som bare bytter klasse. Slik er `mwe.tex` og
`mwe-lf.tex` laget:

```latex
% mwe.tex
\providecommand{\ovingklasse}{NTNUoving}
\documentclass[11pt,a4paper,norsk]{\ovingklasse}
```

```latex
% mwe-lf.tex
\newcommand{\ovingklasse}{NTNUlf}
\input{mwe}
```

## Kommandoer

| Kommando | Virkning |
|---|---|
| `\fag{...}` | Emnenavn i rammen øverst |
| `\semester{...}` | Semester under emnenavnet |
| `\institutt{...}` | Institutt, kan settes, men vises ikke i rammen i dette oppsettet |
| `\ovingnummer{N}` | Øvingsnummer |
| `\ovingtittel{...}` | Tittel på øvingen |
| `\ovingtittelblokk` | Skriver «Øving N» og tittelen sentrert under rammen |
| `\bolk{...}` | Bolkoverskrift, for eksempel «Begrep og termer» |
| `\oppgave{...}` | Oppgave med automatisk nummer i ramme |
| `\hint{...}` | Hint til forrige oppgave, samles i hintlisten bakerst |
| `\losning{...}` | Svar, vises bare med `NTNUlf` |
| `\sporsmaal{a}` | Navngitt delspørsmål, «Spørsmål a.» |
| `litteratur`-miljø | Litteraturtabell med forfatter til venstre og referanse til høyre |
| `\hinttabell` | Skriver hintlisten, legges sist i dokumentet |

I `litteratur`-miljøet skrives hver rad som `Forfatter (år). & Referanse. \\`
og radene skilles med `\midrule`.

## Valgfrie innstillinger

Settes i preamble etter `\usepackage{ovingekstra}`. Uten dem brukes
standardoppsettet.

| Innstilling | Virkning |
|---|---|
| `\hinttittel{Hintliste}` | Overskrift over hintene (standard «Hint til øvingen») |
| `\hintkolonner` | Hint som tabell med kolonnene «Hint 1» og «Hint 2», krever to `\hint` per oppgave |
| `\hintliste` | Hint som nummerert liste, passer med ett hint per oppgave |
| `\losningsetikett{Svar:}` | Tekst foran hvert svar (standard «Løsningsforslag.») |
| `\forfatterbredde{0.35}` | Bredde på forfatterkolonnen i litteraturtabellen (standard 0.30) |

## Klasseopsjoner

| Opsjon | Virkning |
|---|---|
| `norsk`, `nynorsk`, `english` | Språk for faste tekster |
| `sortlogo` eller `graalogo` | Sort logo i stedet for blå |
| `nogeometry` | Klassen setter ikke marger selv |

## Pakker som trengs

Alt følger med en vanlig TeX Live eller Overleaf: babel, geometry,
lastpage, amsmath, amssymb, graphicx, opensans, tikz, pgfplots, booktabs,
tabularx, array, enumitem, etoolbox, hyperref og needspace.

## Opphav

`NTNUoving.cls` og `NTNUlf.cls` er hentet uendret fra NTNU sitt arkiv for
LaTeX-maler (math.ntnu.no/hg/texmf/tex/latex/ntnumaler). `ovingekstra.sty`
er laget for øvingene i TBA4155 Byggeprosess: Tidligfasen i prosjekter.
