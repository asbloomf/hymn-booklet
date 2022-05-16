\version "2.14.2"
%\include "../util.ly"
\include "inc-header.ly"
\header {
  title = \markup{\override #'(font-name . "Garamond Premr Pro"){ \abs-fontsize #18 "Holy God, We Praise Thy Name"}}
  composer = \markup"GROSSER GOTT"
  poet = \markup "Fr Ignaz Franz"
  tagline = ""
}
% \paper {
%   inner-margin = 0.25\in
%   outer-margin = 0.25\in
% }
% #(set-global-staff-size 18) \paper{ #(define fonts (make-pango-font-tree "Garamond Premr Pro" "Garamond Premr Pro" "Garamond Premr Pro" (/ 18 20))) }
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
  f2 f4 | f( e) f | g( a) g | f2. |
  a2 a4 | a( g) f | c'( bes) a | a g2 |
  f2 f4 | f( e) f | g( a) g | f2. |
  a2 a4 | a( g) f | c'( bes) a | a g2 |
  \repeat volta 2 {
    g2 a4 | bes( a) g | a2 bes4 | c2. |
    d2 d4 | c( bes) a | bes( a) g | f2.
  }
  %\bar "|."
}
sopWords = \lyricmode {
  \set stanza = "1. " \set shortVocalName = "1. "
  Ho -- ly God we praise thy name;
  Lord of all, we bow be -- fore thee!
  All on earth thy scep -- ter claim,
  All in heav’n a -- bove a -- dore thee;
  In -- fi -- nite thy vast do -- main,
  Ev -- er -- last -- ing is thy reign.
}

sopWordsII = \lyricmode {
  \set stanza = "2. " \set shortVocalName = "2. "
  Hark! The loud ce -- les -- tial hymn
  An -- gel choirs a -- bove are rais -- ing,
  Cher -- u -- bim and ser -- a -- phim,
  In un -- ceas -- ing cho -- rus prais -- ing;
  Fill the heav’ns with sweet ac -- cord:
  Ho -- ly, ho -- ly, ho -- ly Lord.
}

sopWordsIII = \lyricmode {
  \set stanza = "3. " \set shortVocalName = "3. "
  Ho -- ly Fa -- ther, Ho -- ly Son,
  Ho -- ly Spir -- it, Three we name thee;
  While in es -- sence on -- ly One,
  Un -- di -- vid -- ed God we claim thee;
  And a -- dor -- ing bend the knee,
  While we own the mys -- ter -- y.
}

altoMusic = \relative c' {
  c2 c4 | c2 c4 | d2 e4 | f2. |
  f2 g4 | f( d) d | f2 f4 | f4 e2 |
  c2 c4 | c2 c4 | d2 e4 | f2. |
  f2 g4 | f( d) f | f2 f4 | f4 e2 |
  \repeat volta 2 {
    e2 fis4 | g( f?) e | f2 f4 | g2. |
    f2 g4 | g2 f4 | d( f) e | c2.
  }
}
tenorMusic = \relative c' {
  a2 a4 | g2 c4 | g( f) c' | a2. |
  c2 cis4 | d( bes) a | c( d) c | c c2 |
  a2 a4 | g2 c4 | g( f) c' | a2. |
  c2 cis4 | d( bes) a | c( d) c | c c2 |
  \repeat volta 2 {
    c c4 | d( c) c | c2 d4 | e2. |
    bes2 bes4 | c2 c4 | bes( c) c | a2.
  }
}

bassMusic = \relative c {
  f2 f4 | c2 a4 | bes( d) c | f2. |
  f2 e4 | d2 d4 | a( bes) f' | f c2 |
  f2 f4 | c2 a4 | bes( d) c | f2. |
  f2 e4 | d2 c4 | a( bes) f' | f c2 |
  \repeat volta 2 {
    c4 bes a | g( a) c | f( e) d | c2. |
    bes2 g'4 | e2 f4 | g,( a8[ bes]) c4 | f2.
  }
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
