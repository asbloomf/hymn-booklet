\version "2.14.2"
%\include "../util.ly"
\include "inc-header.ly"
\header {
  title = \markup{\override #'(font-name . "Garamond Premr Pro"){ \abs-fontsize #18 "Jesus, My Lord, My God, My All"}}
  % composer = \markup"Louis Lambilotte"
  poet = \markup "Frederick W. Faber"
  tagline = ""
}
% #(set-global-staff-size 20) \paper{ #(define fonts (make-pango-font-tree "Garamond Premr Pro" "Garamond Premr Pro" "Garamond Premr Pro" (/ 22 20))) }
global = {
  \key d \major
  \time 3/4
  %\dynamicUp
  %\set crescendoSpanner = #'dashed-line
  %\set midiInstrument = "recorder"
  \autoBeamOff
  \override DynamicTextSpanner #'style = #'none
}

sopMusic = \relative c'' {
  a4 fis d | d( cis) d | e( a) g | g( fis2) |
  fis4 e d | g2 e4 | d2 cis4 d2. |
  a'4 fis d | d( cis) d | e( a) g | g( fis2) |
  fis4 e d | g2 e4 | d2 cis4 d2. \bar "||" \break
  a'4 a a | b2 b4 | cis2 cis4 | d2. |
  a4 g fis | b2 g4 | e( a) g | g( fis2) |
  fis4 e d | g2 e4 | d2 cis4 | d2. \bar "|."
}
sopWords = \lyricmode {
  \set stanza = "1. " \set shortVocalName = "1. "
  Je -- sus, my Lord, my God, my All,
  How can I love thee as I ought?
  And how re -- vere this won -- drous gift,
  So far sur -- pass -- ing hope or thought?
  \set shortVocalName = ""
  Sweet Sac -- ra -- ment, we thee a -- dore;
  Oh, make us love thee more and more.
  Oh, make us love thee more and more.
}

sopWordsII = \lyricmode {
  \set stanza = "2. " \set shortVocalName = "2. "
  Had I but Ma -- ry’s sin -- less heart
  To love thee with, my dear -- est King,
  Oh, with what bursts of fer -- vent praise
  Thy good -- ness, Je -- sus, would I sing.
}

sopWordsIII = \lyricmode {
  \set stanza = "3. " \set shortVocalName = "3. "
  Thy Bod -- y, Soul, and God -- head, all,
  O mys -- ter -- y of love di -- vine.
  I can -- not com -- pass all I have,
  For all thou hast and art are mine.
}

altoMusic = \relative c' {
  d4 d d | a2 a4 | a( cis) e | e( d2) |
  d4 cis b | b2 b4 | a( b) a | a2. |
  d4 d d | a2 a4 | a( cis) e | d2. |
  d4 cis d | b2 b4 | a( b) a | a2. \bar "||"
  d4 cis d | d2 e4 | g( fis) e | d2. |
  d4 e d | d2 e4 | d( cis) e | e( d2) |
  d4 cis b | b2 b4 | b( a) a | a2. \bar "|."
}
tenorMusic = \relative c {
  fis4 a a | g2 fis4 | a2 a4 | a2. |
  a4 a fis | e( fis) g | fis( g) e | fis2. |
  fis4 a g | a( g) fis | a2 a4 | a2. |
  a4 g a | g2 g4 | fis( g) e | fis2. \bar "||"
  fis4 g a | g( a) g | b( a) g | fis( b2) |
  a4 a a | g( a) b | a2 a4 | a2. |
  a4 a fis | e( fis) g | g( fis) e | fis2. \bar "|."
}

bassMusic = \relative c {
  d4 d fis | e2 d4 | cis( a) cis | d2. |
  d4 a b | e2 g,4 | a2 a4 | d2. |
  d4 d e | fis( e) d | cis( a) cis | d2. |
  d4 e fis | e( e,) g | a2 a4 | d2. |
  d4 e fis | g( fis) e | a,2 a4 | b2. |
  fis'4 cis d | g( fis) e | a( a,) cis | d2. |
  d4 a b | e2 g,4 | a2 a4 | d2. \bar "|."
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
