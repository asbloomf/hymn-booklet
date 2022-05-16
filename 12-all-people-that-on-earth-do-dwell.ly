\version "2.14.2"
%\include "../util.ly"
\include "inc-header.ly"
\header {
  title = \markup{\override #'(font-name . "Garamond Premr Pro"){ \abs-fontsize #18 "All People That On Earth Do Dwell"}}
  composer = \markup"Louis Bourgeois (c 1510-1561)"
  poet = \markup "William Kethe(c 1530-1594)"
  tagline = ""
}
\paper {
  inner-margin = 0.45\in
  outer-margin = 0.45\in
}
#(set-global-staff-size 19) \paper{ #(define fonts (make-pango-font-tree "Garamond Premr Pro" "Garamond Premr Pro" "Garamond Premr Pro" (/ 19 20))) }
global = {
  \key g \major
  \time 4/4
  %\dynamicUp
  %\set crescendoSpanner = #'dashed-line
  %\set midiInstrument = "recorder"
  \autoBeamOff
  \override DynamicTextSpanner #'style = #'none
}

sopMusic = \relative c'' {
  \partial 2 g2 | g4 fis e d | g2 a | b
              b | b4 b a g | c2 b a
              g | a4 b a g | e2 fis | g
              d' | b4 g a c | b2 a | g2
  \bar "|."
}
sopWords = \lyricmode {
  \set stanza = "1. " \set shortVocalName = "1. "
  All peo -- ple that on earth do dwell,
  Sing to the Lord with cheer -- ful voice;
  Him serve with mirth, his praise forth tell,
  Come ye be -- fore him and re -- joice.
}

sopWordsII = \lyricmode {
  \set stanza = "2. " \set shortVocalName = "2. "
  Know that the Lord is God in -- deed;
  With -- out our aid he did us make;
  We are his folk, he doth us feed,
  And for his sheep he doth us take.
}

sopWordsIII = \lyricmode {
  \set stanza = "3. " \set shortVocalName = "3. "
  O en -- ter then his gates with praise;
  Ap -- proach with joy his courts un -- to;
  Praise, laud, and bless his name al -- ways,
  For it is seem -- ly so to do.
}

sopWordsIV = \lyricmode {
  \set stanza = "4. " \set shortVocalName = "4. "
  For why? The Lord our God is good:
  His mer -- cy is for -- ev -- er sure;
  His truth at all times firm -- ly stood,
  And shall from age to age en -- dure.
}

sopWordsV = \lyricmode {
  \set stanza = "5. " \set shortVocalName = "5. "
  To Fa -- ther, Son, and Ho -- ly Ghost,
  The God whom heav’n and earth a -- dore,
  From men and from the an -- gel host
  Be praise and glo -- ry ev -- er -- more.
}

altoMusic = \relative c' {
  \partial 2 d2 | d4 d b b | b2 d | d \bar ""
              d | d4 d d b | e2 d | d \bar ""
              b | d4 d c d | c2 c | b \bar ""
              d | d4. cis8 d4 e | d2. c4 | b2
  \bar "|."
}
tenorMusic = \relative c' {
  \partial 2 b2 | b4 a g fis | e2 fis | g
              b | g4 g fis g | g2 g | fis
              g | fis4 g e g | g2 a | g
              a | g4 g fis g | g2 fis | g
  \bar "|."
}

bassMusic = \relative c' {
  \partial 2 g2 | g4 d e b | e2 d | g,
             g' | g4 g d e | c2 g | d'
             e  | d4 g, a b | c2 a | e'
             fis | g4 e d c | d2 d | g,
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
    \new Lyrics = "altosII"  \lyricsto "sopranos" \sopWordsIV
    \new Lyrics = "altosII"  \lyricsto "sopranos" \sopWordsV
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
