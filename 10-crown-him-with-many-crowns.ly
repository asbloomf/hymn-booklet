\version "2.14.2"
%\include "../util.ly"
\include "inc-header.ly"
\header {
  title = \markup{\override #'(font-name . "Garamond Premr Pro"){ \abs-fontsize #18 "Crown Him with Many Crowns"}}
  composer = \markup"George J Elvey (1816-1893)"
  poet = \markup "Matthew Bridges (1800-1894)"
  tagline = ""
}
#(set-global-staff-size 19) \paper{ #(define fonts (make-pango-font-tree "Garamond Premr Pro" "Garamond Premr Pro" "Garamond Premr Pro" (/ 20 20))) }
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
  d4 d8 d8 fis4 fis | b2. b4 | a d, g fis |
  e2. e4 | fis a b a | gis fis8[ e] a4
  d | cis d b b | a2. a4 | a fis e d
  b'2. b4 | b gis fis e | cis'2.
  cis4 | d4. cis8 b4 a | g e fis
  a | g fis e e | d1
  \bar "|."
}
sopWords = \lyricmode {
  \set stanza = "1. " \set shortVocalName = "1. "
  Crown him with man -- y crowns,
  The Lamb up -- on his throne;
  Hark how the heav'n -- ly an -- them drowns
  All mu -- sic but its own.
  A -- wake, my soul, and sing
  Of him who died for thee,
  And hail him as thy match -- less King
  Through all e -- ter -- ni -- ty.
}

sopWordsII = \lyricmode {
  \set stanza = "2. " \set shortVocalName = "2. "
  Crown him the Lord of life,
  Who tri -- umphed o'er the grave,
  And rose vic -- to -- rious in the strife
  For those he came to save.
  His glo -- ries now we sing,
  Who died and rose on high,
  Who died e -- ter -- nal life to bring,
  And lives that death may die.
}

sopWordsIII = \lyricmode {
  \set stanza = "3. " \set shortVocalName = "3. "
  Crown him the Lord of love,
  Be -- hold his hands and side,
  Rich wounds yet vis -- i-- ble a -- bove
  In beau -- ty glo -- ri -- fied.
  No an -- gel in the sky
  Can ful -- ly bear that sight,
  But down -- ward bends his burn -- ing eye
  At mys -- ter -- ies so bright.
}

sopWordsIV = \lyricmode {
  \set stanza = "4. " \set shortVocalName = "4. "
  Crown him the Lord of peace,
  Whose pow'r a scep -- ter sways
  From pole to pole, that wars may cease,
  Ab -- sorbed in prayer and praise.
  His reign shall know no end,
  And "'round" his pierc -- ed feet
  Fair flow'rs of Par -- a -- dise ex -- tend
  Their fra -- grance ev -- er sweet.
}

sopWordsV = \lyricmode {
  \set stanza = "5. " \set shortVocalName = "5. "
  Crown him the Lord of years,
  The Po -- ten -- tate of time,
  Crea -- a -- tor of the roll -- ing spheres,
  In -- eff -- fa -- bly sub -- lime.
  All hail, Re -- deem -- er, hail!
  For thou hast died for me;
  Thy praise and glo -- ry shall not fail
  Through -- out e -- ter -- ni -- ty.
}

altoMusic = \relative c' {
  a4 a8 a d4 d | d2. d4 | d d cis d | cis2.
  cis4 | d e d d | b b e d | e fis b, e | cis2.
  cis4 | d d cis d | d2. dis4 | e e d? e | e2.
  e4 | d d d d | d cis d d | d d d cis | d1
  \bar "|."
}
tenorMusic = \relative c {
  fis4 fis8 fis fis4 fis | g2. g4 | a b g a | a2.
  a4 | a a fis fis | gis gis a gis | a a a gis | a2.
  a4 | a a g a | b2. a4 | gis b a b | a2.
  a4 | a a g a | b a a a | b a a4. g8 | fis1
  \bar "|."
}

bassMusic = \relative c {
  d4 d8 d b4 b | g2. g'4 | fis g e d | a2.
  a4 | d cis b d | e d cis b | a d e e | a2.
  g4 | fis d e fis | g2. fis4 | e e fis gis | a2.
  g4 | fis fis g fis | e a d, fis, | g d' a a | d1
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
