\version "2.14.2"
%\include "../util.ly"
\include "inc-header.ly"
\header {
  title = \markup{\override #'(font-name . "Garamond Premr Pro"){ \abs-fontsize #18 "Holy, Holy, Holy!"}}
  composer = \markup"John B Dykes (1823-1876)"
  poet = \markup "Reginald Heber (1783-1826)"
  tagline = ""
}
% #(set-global-staff-size 20) \paper{ #(define fonts (make-pango-font-tree "Garamond Premr Pro" "Garamond Premr Pro" "Garamond Premr Pro" (/ 22 20))) }
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
  d4 d fis fis | a2 a | \slurDashed b4( b) b b | a2 fis |
  a4. a8 a4 a | d( d) cis a | e a b4. a8 | a1 |
  d,4 d fis fis | a( a) a2 | b4. b8 b4 b | a2 a |
  d a4 a | b2 fis | g4 e e4. d8 | d1 \bar "|."
}
sopWords = \lyricmode {
  \set stanza = "1. " \set shortVocalName = "1. "
  Ho -- ly, ho -- ly, ho -- ly!
  Lord God Al -- might -- y!
  Ear -- ly in the morn -- ing our song shall rise to thee.
  Ho -- ly, ho -- ly, ho -- ly,
  mer -- ci -- ful and might -- y!
  God in three Per -- sons, bless -- ed Trin -- i -- ty!
}

sopWordsII = \lyricmode {
  \set stanza = "2. " \set shortVocalName = "2. "
  Ho -- ly, ho -- ly, ho -- ly!
  \set ignoreMelismata = ##t
  All the saints a -- dore thee.
  Cast -- ing down their gold -- en crowns a -- round the glass -- y sea;
  Chur -- u -- bim and ser -- a -- phim fall -- ing down be -- fore thee,
  Which wert, and art, and ev -- er -- more shalt be.
}

sopWordsIII = \lyricmode {
  \set stanza = "3. " \set shortVocalName = "3. "
  Ho -- ly, ho -- ly, ho -- ly!
  \set ignoreMelismata = ##t
  Though the dark -- ness hide thee.
  Though the eye of sin -- ful man thy glo -- ry may not see,
  \set ignoreMelismata = ##f
  On -- ly thou art ho -- ly; there is none be -- side thee,
  Per -- fect in pow’r, in love, and pu -- ri -- ty.
}

sopWordsIV = \lyricmode {
  \set stanza = "4. " \set shortVocalName = "4. "
  Ho -- ly, ho -- ly, ho -- ly!
  Lord God Al -- might -- y!
  \set ignoreMelismata = ##t
  All thy works shall praise thy name in earth and sky and sea.
  \set ignoreMelismata = ##f
  Ho -- ly, ho -- ly, ho -- ly,
  mer -- ci -- ful and might -- y!
  God in three Per -- sons, bless -- ed Trin -- i -- ty!
}

altoMusic = \relative c' {
  a4 a d d | cis( e) d( cis) | \slurDashed b( cis) d e | fis2 d |
  e4 e fis e | d( e) e fis | e cis d4. cis8 | cis1 |
  a4 a d d | cis( e) \slurSolid d( cis) | b cis d e | fis2 d |
  d d4 d | d2 d4( c) | b b cis4. d8 | d1 \bar "|."
}
tenorMusic = \relative c {
  fis4 fis d d | e( g) fis( a) | \slurDashed g( a) b cis | \slurSolid d( a) a2 |
  a4 a a a | \slurDashed fis( gis) a a | cis a gis4. a8 | \slurSolid a2( g!) |
  fis4 fis d d | \slurDashed e( g) \slurSolid fis( a) | g a b cis | d( a) fis2 |
  fis4( g) a c | b2 a | g4 g g4. fis8 | fis1 \bar "|."
}

bassMusic = \relative c {
  d4 d b b | a2 d | \slurDashed g,4( g) g' g | d2 d |
  cis4 cis d cis | b( b) cis d | e e e4. a,8 | a1 |
  d4 d b b | a( a) d2 | g,4. g8 g'4 g | d2 d |
  b fis'4 fis | g2 d | g,4 g a4. d8 | d1 | \bar "|."
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
