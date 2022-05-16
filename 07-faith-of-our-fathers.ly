\version "2.14.2"
%\include "../util.ly"
\include "inc-header.ly"
\header {
  title = \markup{\override #'(font-name . "Garamond Premr Pro"){ \abs-fontsize #18 "Faith of Our Fathers"}}
  composer = \markup"Henri F Hemy  (1818-1888)"
  poet = \markup "Frederick W Faber (1814-1863)"
  tagline = ""
}
% #(set-global-staff-size 20) \paper{ #(define fonts (make-pango-font-tree "Garamond Premr Pro" "Garamond Premr Pro" "Garamond Premr Pro" (/ 22 20))) }
global = {
  \key g \major
  \time 3/4
  %\dynamicUp
  %\set crescendoSpanner = #'dashed-line
  %\set midiInstrument = "recorder"
  \autoBeamOff
  \override DynamicTextSpanner #'style = #'none
}

sopMusic = \relative c'' {
  b4 a g | g( fis) g | a( e) fis | g2. |
  g4 fis e | d2 g4 | g( fis) g | a2. |
  b4 a g | g( fis) g | a( e) fis | g2. |
  g4 fis e | d2 b'4 | a( b) a | g2. |
  c4 c c | b2 b4 | a2 a4 | b2. |
  b4 a g | e2 g4 | a2 a4 | g2.
  \bar "|."
}
sopWords = \lyricmode {
  \set stanza = "1. " \set shortVocalName = "1. "
  Faith of our fa -- thers, liv -- ing still,
  In spite of dun -- geon, fire, and sword;
  O how our hearts beat high with joy,
  When -- e'er we hear that glo -- rious word:
  \set shortVocalName = ""
  Faith of our fa -- thers, ho -- ly faith!
  We will be true to thee till death.
}

sopWordsII = \lyricmode {
  \set stanza = "2. " \set shortVocalName = "2. "
  Our fa -- thers, chained in pris -- ons dark,
  Were still in heart and con -- science free;
  And blest would be their chil -- dren's fate
  If we, like them, should die for thee.
}

sopWordsIII = \lyricmode {
  \set stanza = "3. " \set shortVocalName = "3. "
  Faith of our fa -- thers, Ma -- ry's prayers
  Shall win all na -- tions un -- to thee;
  And through the truth that comes from God,
  Man -- kind shall then in -- deed be free.
}

sopWordsIV = \lyricmode {
  \set stanza = "4. " \set shortVocalName = "4. "
  Faith of our fa -- thers, we will love
  Both friend and foe in all our strife,
  And preach thee, too, as love knows how,
  By kindly deeds and vir -- tuous life.
}

altoMusic = \relative c' {
  d4 d d | d2 d4 | e2 d4 | d2. |
  e4 d c | b2 d4 | cis2 cis4 | d2. |
  d4 d d | d2 d4 | e2 c4 | b2. |
  e4 d c | b2 d4 | cis2 c4 | b2. |
  g'4 g g | g2 g4 | fis2 fis4 | g2. |
  b,4 c d | c2 b4 | d2 c4 | b2.
  \bar "|."
}
tenorMusic = \relative c' {
  d4 c b | b( c) b | c2 a4 | b2. |
  g4 g g | g2 b4 | a2 g4 | fis2. |
  g4 c b | b( c) b | c2 a4 | g2. |
  g4 g g | g2 g4 | g2 fis4 | g2. |
  e'4 e e | d2 d4 | d2 d4 | d2. |
  g,4 fis g | g2 g4 | g2 fis4 | g2.
  \bar "|."
}

bassMusic = \relative c' {
  g4 g g | g( a) g | c,2 d4 | g,2. |
  c4 c e | g2 g,4 | a2 a4 | d2. |
  g4 g g | g( a) g | c,2 d4 | e2. |
  c4 c e | g2 g,4 | a2 d4 | g,2. |
  c4 c c | g'2 g4 | d2 d4 | g2. |
  g,4 a b | c2 e4 | d2 d4 | g,2.
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
