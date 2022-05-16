\version "2.14.2"
%\include "../util.ly"
\include "inc-header.ly"
\header {
  title = \markup{\override #'(font-name . "Garamond Premr Pro"){ \abs-fontsize #18 "Be Thou My Vision"}}
  composer = \markup"SLANE"
  poet = \markup "Irish hymn, 8th c."
  tagline = ""
}
\paper {
  inner-margin = 0.35\in
  outer-margin = 0.35\in
}
#(set-global-staff-size 19) \paper{ #(define fonts (make-pango-font-tree "Garamond Premr Pro" "Garamond Premr Pro" "Garamond Premr Pro" (/ 20 20))) }
global = {
  \key ees \major
  \time 3/4
  %\dynamicUp
  %\set crescendoSpanner = #'dashed-line
  %\set midiInstrument = "recorder"
  \autoBeamOff
  \override DynamicTextSpanner #'style = #'none
}

sopMusic = \relative c' {
  ees4 ees f8[ ees] | c4 bes bes8[ c] | ees4 ees f g2. |
  f4 f f | f g bes | c bes g | bes2. |
  c4 c8[ d] ees[ d] | \slurDashed c4( bes) g | bes ees, d | \slurSolid c2( bes4) |
  ees g bes | c8[ bes] g4 ees8[ g] | f4 ees ees | ees2.
  \bar "|."
}
sopWords = \lyricmode {
  \set stanza = "1. " \set shortVocalName = "1. "
  Be thou my vi -- sion, O Lord of my heart;
  All else be nought to me, save that thou art.
  Thou my best thought, by day or by night,
  Wak -- ing or sleep -- ing, thy pres -- ence my light.
}

sopWordsII = \lyricmode {
  \set stanza = "2. " \set shortVocalName = "2. "
  Be thou my wis -- dom, and thou my true word;
  I ev -- er with thee and thou with me, Lord;
  Thou my great \set ignoreMelismata = ##t Fa -- ther, \set ignoreMelismata = ##f thine own may I be:
  Thou in me dwell -- ing, and I one with thee.
}

sopWordsIII = \lyricmode {
  \set stanza = "3. " \set shortVocalName = "3. "
  High King of heav -- en, when vic -- t'ry is won,
  May I reach heav -- en's joys, bright heav -- en's Sun!
  Heart of my heart, what -- ev -- er be -- fall,
  Still be my vi -- sion, O Rul -- er of all.
}

altoMusic = \relative c' {
  bes4 bes bes | aes bes bes8[ aes] | bes4 c d | bes2( ees4) |
  d d ees | f ees ees | ees ees ees | f2( g4) |
  ees  ees ees | \slurDashed ees( ees) ees | ees c bes | \slurSolid c2( bes4) |
  bes ees ees | ees8[ d] ees4 ees8[ g] | c,4 c aes | bes2.
  \bar "|."
}
tenorMusic = \relative c' {
  g4 g ees | ees d ees | ees g bes | bes2. |
  bes4 bes a | bes bes bes | aes bes c | d2. |
  aes4 aes8[ bes] c[ bes] | \slurDashed aes4( g) bes | bes g g | \slurSolid ees2( d4) |
  g bes bes | aes g g8[ bes] | aes4 aes aes | g2.
  \bar "|."
}

bassMusic = \relative c {
  ees4 ees g, | aes bes aes | g c bes | ees2( g,4) |
  bes bes c | d ees g, | aes g c | bes2. |
  aes4 aes aes' | \slurDashed ees( ees) ees | g, c g | \slurSolid aes2( bes4) |
  ees ees g, | aes8[ bes] c4 c | aes aes c | ees2.
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
    \new Lyrics = "altosII"  \lyricsto "sopranos" \sopWordsIII
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
