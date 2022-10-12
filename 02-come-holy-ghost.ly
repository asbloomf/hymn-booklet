\version "2.14.2"
%\include "../util.ly"
\include "inc-header.ly"
\header {
  title = \markup{\override #'(font-name . "Garamond Premr Pro"){ \abs-fontsize #18 "Come, Holy Ghost"}}
  composer = \markup"Louis Lambilotte"
  poet = \markup "Rabanus Maurus"
  tagline = ""
}
#(set-global-staff-size 20) \paper{ #(define fonts (make-pango-font-tree "Garamond Premr Pro" "Garamond Premr Pro" "Garamond Premr Pro" (/ 20 20))) }
global = {
  \key f \major
  \time 3/4
  %\dynamicUp
  %\set crescendoSpanner = #'dashed-line
  %\set midiInstrument = "recorder"
  \autoBeamOff
  \override DynamicTextSpanner #'style = #'none
}

sopMusic = \relative c' {
  c4 c c | f2. | g4 g g a2. |
  a4 g a | c( bes) a | a( bes) a | g2. |
  c,4 c c | f2. | g4 g g | a2. |
  \repeat volta 2 {
    c4 c c | d2 c8[ bes] | a2 g4
  }
  \alternative {
    { c2. }
    { f,2. }
  }
  \bar "|."
}
sopWords = \lyricmode {
  \set stanza = "1. " \set shortVocalName = "1. "
  Come, Ho -- ly Ghost, Cre -- a -- tor blest,
  And in our hearts take up thy rest;
  Come with thy grace and heav’n -- ly aid
  To fill the hearts which thou hast made. made.
  %To fill the hearts which thou hast made.
}

sopWordsII = \lyricmode {
  \set stanza = "2. " \set shortVocalName = "2. "
  O Com -- fort blest, to thee we cry,
  Thou heav-n -- ly gift of God most high,
  Thou font of life and fire of love,
  And sweet a -- noint -- ing from a -- bove.  bove.
  %And sweet a -- noint -- ing from a -- bove.
}

sopWordsIII = \lyricmode {
  \set stanza = "3. " \set shortVocalName = "3. "
  Praise be to thee, Fa -- ther and Son,
  And Ho -- ly Spir -- it, Three in one;
  And may the Son on us be -- stow
  The gifts that from the Spir -- it flow. flow.
  %The gifts that from the Spir -- it flow.
}

altoMusic = \relative c' {
  % c4 c c | d2. | d4 f e | f2. |
  % f4 d f | g2 f4 | d2 d4 | d2. |
  % c4 c c | d2. | d4 f e | f2. |
  % a4 g a | bes2 g4 | f2 e4 | f4( e f) |
  % a4 g a | bes2 g4 | f2 e4 | c2.
  g4 a bes | a2. | c4 d c | c2. |
  f4 g f | e( g) f | f2 f4 | e2. |
  c4 c c | c2. | d4 d c | c2. |
  \repeat volta 2 {
    f4 f ees | d2 d4 | f2 e4 | 
  }
  \alternative {
    { f4( ees2) }
    { c2. }
  }
  \bar "|."
}
tenorMusic = \relative c' {
  % a4 bes g | a2. | bes4 d c | c2. |
  % d4 bes d | c2 c4 | c2 c4 | bes2. |
  % a4 bes g | a2. | bes4 d c | c2. |
  % c4 c c | f2 d4 | c2 bes4 | c bes a |
  % c4 c c | f2 d4 | c2 bes4 | a2.
  e,4 f g | f2. | e4 g e | f2. |
  c'4 d c | c2 c4 | d( bes) c | c2. |
  g4 a bes | a2. | g4 f e | f2. |
  \repeat volta 2 {
    a4 bes c | bes2 f8[ g] | a4( c) bes |
  }
  \alternative {
    { a2. }
    { a2. }
  }
  \bar "|."
}

bassMusic = \relative c {
  % f4 g e | d2. | g4 bes, c | f2. |
  % d4 g d | e2 f4 | g2 g4 |  g2. |
  % f4 g e | d2. | g4 bes, c | f2. |
  % f4 e f | bes,2 g'4 | c,2 c4 | a' g f |
  % f4 e f | bes,2 g'4 | c,2 c4 | f2.
  c4 c c | f,2. | c'4 bes c | f,2. |
  f'4 bes a | g( e) f | d2 f4 | c2. |
  e4 f g | f2. | bes,4 bes c | f2. |
  \repeat volta 2 {
    f4 g a | bes( bes,) d | c2 c4 |
  }
  \alternative {
    { a'2. }
    { f2. }
  }
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
