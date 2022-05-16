\paper {
  %print-all-headers = ##t
  paper-height = 8.5\in
  paper-width = 5.5\in
  indent = 0\in
  %system-system-spacing = #'((basic-distance . 10) (padding . 0))
  ragged-last-bottom = ##f
  ragged-bottom = ##t
  two-sided = ##t
  inner-margin = 0.5\in
  outer-margin = 0.5\in
  top-margin = 0.26\in
  bottom-margin = 0.25\in
  first-page-number = #136
  print-first-page-number = ##t
  headerLine = ""
  oddHeaderMarkup = \markup\fill-line{}
  evenHeaderMarkup = \markup {}
}
#(set-global-staff-size 20) \paper{ #(define fonts (make-pango-font-tree "Garamond Premr Pro" "Garamond Premr Pro" "Garamond Premr Pro" (/ 22 20))) }
\layout {
  indent = 0.0\cm
  \context { \Lyrics
    \override InstrumentName #'font-size = #0
    \override InstrumentName #'font-series = #'bold
    \override InstrumentName #'X-offset = #3
  }
}
