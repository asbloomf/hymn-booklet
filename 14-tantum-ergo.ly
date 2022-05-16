\version "2.14.2"
%\include "../util.ly"
\include "inc-header.ly"
\header {
  title = \markup{\override #'(font-name . "Garamond Premr Pro"){ \abs-fontsize #18 "Tantum Ergo"}}
  composer = \markup"John Wade (-1786)"
  poet = \markup "St Thomas Aquinas (-1274)"
  tagline = ""
}
\paper {
  inner-margin = 0.3\in
  outer-margin = 0.3\in
}
#(set-global-staff-size 19) \paper{ #(define fonts (make-pango-font-tree "Garamond Premr Pro" "Garamond Premr Pro" "Garamond Premr Pro" (/ 21 20))) }
global = {
  \key d \major
  \time 4/4
  %\dynamicUp
  %\set crescendoSpanner = #'dashed-line
  %\set midiInstrument = "recorder"
  \autoBeamOff
  \override DynamicTextSpanner #'style = #'none
}

sopMusic = \relative c' {
  d4 e fis d | e fis g fis \fermata | b a g fis | e e d2 |
  d'4 cis d a | b a g fis \fermata | b cis d cis | b b a2 |
  a4 a fis d | e fis g fis \fermata | b a g fis | e e d2 \bar "||"
  d d
  \bar "|."
}
sopWords = \lyricmode {
  \set stanza = "1. " \set shortVocalName = "1. "
  Tan -- tum er -- go Sa -- cra -- mén -- tum
  ve -- ne -- ré -- mur cér -- nu -- "i :"
  et an -- tí -- quum do -- cu -- mén -- tum
  no -- vo ce -- dat rí -- tu -- "i :"
  præ -- stet fi -- des sup -- ple -- mén -- tum
  sén -- su -- um de -- féc -- tu -- i.
}

sopWordsII = \lyricmode {
  \set stanza = "2. " \set shortVocalName = "2. "
  Ge -- ni -- tó -- ri ge -- ni -- tó -- que
  laus et ju -- bi -- lá -- ti -- o,
  sa -- lus, ho -- nor, vir -- tus quo -- que
  sit et be -- ne -- díc -- ti -- "o :"
  pro -- ce -- dén -- ti ab u -- tró -- que
  com -- par sit lau -- dá -- ti -- o.
  A -- men.
}

altoMusic = \relative c' {
  a4 cis d d | cis d e d | d d d8[ cis] d4 | d cis d2 |
  fis4 e d d | d d d8[ cis] d4 | fis fis fis8[ gis] a4 | a gis e2 |
  d4 e d d | cis d d8[ cis] d4 | d d d d | d cis d2 \bar "||"
  b a
  \bar "|."
}
tenorMusic = \relative c {
  fis4 a a a | g a a a | g a a a | b a8[ g] fis2 |
  a4 a a a | g a a a | d e d e | fis e8[ d] cis2 |
  a4 a a a | a a a a | g fis e d | b' a8[ g] fis2 \bar "||"
  g fis
  \bar "|."
}

bassMusic = \relative c {
  d4 a d fis | e d cis d | g fis e d | g, a d2 |
  d4 g fis fis | g fis e d | b ais b cis | d e a( g) |
  fis cis d fis | g fis e d | g, a a b | g a d2 \bar "||"
  g, d'
  \bar "|."
}
\score {
<<
   \new ChoirStaff <<
    \new Staff = women <<
      \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
      \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
    >>
    \new Lyrics = "altos"  \lyricsto "sopranos" \sopWords
    \new Lyrics = "altosII"  \lyricsto "sopranos" \sopWordsII
   \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
  >>
%    \new PianoStaff << \new Staff { \new Voice { \pianoRH } } \new Staff { \clef "bass" \pianoLH } >>
  >>
  \midi {
    \tempo 4 = 90
    \set Staff.midiInstrument = "flute"
  
    \context {
      \Voice
      \remove "Dynamic_performer"
    }
  }
  \layout {
    \context {
      \Lyrics
      % \override LyricText #'font-size = #1.3
      % \override VerticalAxisGroup #'staff-affinity = #0
      % \override LyricText #'X-offset = #center-on-word
    }
    \context {
      \Score
      % \override SpacingSpanner #'base-shortest-duration = #(ly:make-moment 1 8)
      % \override SpacingSpanner #'common-shortest-duration = #(ly:make-moment 1 4)
    }
    \context {
      % Remove all empty staves
      \Staff \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t
      
      \override VerticalAxisGroup #'staff-staff-spacing =
      #'((basic-distance . 0)
         (minimum-distance . 0)
         (padding . -1)
         (stretchability . 2))
    }
  }
}
