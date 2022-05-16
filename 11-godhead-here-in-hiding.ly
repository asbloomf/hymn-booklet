\version "2.14.2"
%\include "../util.ly"
\include "inc-header.ly"
\include "chant-inc.ly"
\header {
  title = \markup{\override #'(font-name . "Garamond Premr Pro"){ \abs-fontsize #18 "Godhead Here in Hiding"}}
  composer = \markup""
  poet = \markup "St Thomas Aquinas"
  tagline = ""
}
\paper {
  inner-margin = 0.25\in
  outer-margin = 0.25\in
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
  \cadenzaOn \stemOff
  d4 fis a a a( b) a2 \divisioMinima
  g4 fis e d d2 \divisioMajor \bar""
  d4 fis a a a( b) a2 \divisioMinima
  g4 fis e d d2 \divisioMajor \bar""
  a'4 a b( cis) d d( cis) a2 \divisioMinima
  b4 a g fis e2 \divisioMajor \bar""
  fis4 a g fis e( d) e2 \divisioMinima
  fis4 d e d d2
  \bar "|."
}
sopWords = \lyricmode {
  \set stanza = "1. " \set shortVocalName = "1. "
  God -- head here in hid -- ing whom I do a -- dore
  Masked by these bare shad -- ows, shape and noth -- ing more.
  See, Lord, at thy serv -- ice low lies here a heart
  Lost, all lost in won -- der at the God thou art.
}

sopWordsII = \lyricmode {
  \set stanza = "2. " \set shortVocalName = "2. "
  See -- ing, touch -- ing, tast -- ing are in thee de -- ceived;
  How says trust -- y hear -- ing? that shall be be -- lieved;
  What God’s Son has told me, take for truth I do;
  Truth him -- self speaks tru -- ly or there’s noth -- ing true.
}

sopWordsIII = \lyricmode {
  \set stanza = "3. " \set shortVocalName = "3. "
  On the cross thy god -- head made no sign to men;
  Here thy ver -- y man -- hood steals from hu -- man ken:
  Both are my con -- fes -- sion, both are my be -- lief,
  And I pray the pray -- er of the dy -- ing thief.
}

sopWordsIV = \lyricmode {
  \set stanza = "4. " \set shortVocalName = "4. "
  I am not like Thom -- as, wounds I can -- not see,
  But I plain -- ly call thee Lord and God as he:
  This faith each day deep -- er be my hold -- ing of,
  Dai -- ly make me hard -- er hope and dear -- er love.
}

sopWordsV = \lyricmode {
  \set stanza = "5. " \set shortVocalName = "5. "
  O thou, our re -- mind -- er of the Cru -- ci -- fied,
  Liv -- ing Bread, the life of us for whom he died,
  Lend this life to me, then; feed and feast my mind,
  There be thou the sweet -- ness man was meant to find.
}

sopWordsVI = \lyricmode {
  \set stanza = "6. " \set shortVocalName = "6. "
  Like what ten -- der tales tell of the Pe -- li -- can,
  Bathe me, Je -- sus Lord, in what thy bo -- som ran,
  Blood that but one drop of has the pow’r to win
  All the world for -- give -- ness of its world of sin.
}

sopWordsVII = \lyricmode {
  \set stanza = "7. " \set shortVocalName = "7. "
  Je -- sus whom I look at shroud -- ed here be -- low,
  I be -- seech thee, send me what I thirst for so,
  Some day to gaze on thee face to face in light
  And be blest for -- ev -- er with thy glo -- ry’s sight.
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
%      \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
    >>
    \new Lyrics = "altos"  \lyricsto "sopranos" \sopWords
    \new Lyrics = "altosII"  \lyricsto "sopranos" \sopWordsII
    \new Lyrics = "altosII"  \lyricsto "sopranos" \sopWordsIII
    \new Lyrics = "altosII"  \lyricsto "sopranos" \sopWordsIV
    \new Lyrics = "altosII"  \lyricsto "sopranos" \sopWordsV
    \new Lyrics = "altosII"  \lyricsto "sopranos" \sopWordsVI
    \new Lyrics = "altosII"  \lyricsto "sopranos" \sopWordsVII
   % \new Staff = men <<
   %    \clef bass
   %    \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
   %    \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
   %  >>
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
