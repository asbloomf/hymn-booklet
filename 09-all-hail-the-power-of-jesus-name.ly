\version "2.14.2"
%\include "../util.ly"
\include "inc-header.ly"
\header {
  title = \markup{\override #'(font-name . "Garamond Premr Pro"){ \abs-fontsize #18 "All Hail the Power of Jesus' Name"}}
  composer = \markup"Oliver Holden (1765-1844)"
  poet = \markup "Edward Perronet (1726-1792)"
  tagline = ""
}
% #(set-global-staff-size 20) \paper{ #(define fonts (make-pango-font-tree "Garamond Premr Pro" "Garamond Premr Pro" "Garamond Premr Pro" (/ 22 20))) }
global = {
  \key f \major
  \time 4/4
  %\dynamicUp
  %\set crescendoSpanner = #'dashed-line
  %\set midiInstrument = "recorder"
  \autoBeamOff
  \override DynamicTextSpanner #'style = #'none
}

sopMusic = \relative c' {
  \partial 4 c4 | f f a a | g f g a | g f a g | f2.
             g4 | a g f a | c8[ bes] a[ g] a4 c | c2 c | d c4( b) | c2. \bar"" \break
             a4 | c a f a | g8[ f] g[ a] g4 f | c'2 bes | a4.( bes8 g4) g | f2.
  \bar "|."
}
sopWords = \lyricmode {
  \set stanza = "1. " \set shortVocalName = "1. "
  All hail the pow'r of Je -- sus' name!
  Let an -- gels pros -- trate fall;
  Bring forth the roy -- al di -- a -- dem
  And crown him Lord of all;
  Bring forth the roy -- al di -- a -- dem
  And crown him Lord of all.
}

sopWordsII = \lyricmode {
  \set stanza = "2. " \set shortVocalName = "2. "
  Ye cho -- sen seed of Is -- rael's race,
  Ye ran -- somed from the fall,
  Hail him who saves you by his grace,
  And crown him Lord of all;
  Hail him who saves you by his grace,
  And crown him Lord of all.
}

sopWordsIII = \lyricmode {
  \set stanza = "3. " \set shortVocalName = "3. "
  Let ev -- "'ry" kin -- dred, ev -- "'ry" tribe,
  On this ter -- res -- trial ball,
  To him all maj -- es -- ty as -- cribe,
  And crown him Lord of all;
  To him all maj -- es -- ty as -- cribe,
  And crown him Lord of all.
}

sopWordsIV = \lyricmode {
  \set stanza = "4. " \set shortVocalName = "4. "
  O that with yon -- der sa -- cred throng,
  We at his feet may fall,
  We'll join the ev -- er -- last -- ing song,
  And crown him Lord of all;
  We'll join the ev -- er -- last -- ing song,
  And crown him Lord of all.
}

altoMusic = \relative c' {
  \partial 4 c4 | a c c f | e f e f | e f f e | f2.
             c4 | f c a f' | a8[ g] f[ e] f4 e | f2 g | f e4( d) | e2.
             f4 | c f c f e8[ d] e[ f] e4 f | f2 f | f2. e4 | f2.
  \bar "|."
}
tenorMusic = \relative c {
  \partial 4 c4 | f a c c | c a c c | bes a c bes | a2.
             g4 | a g f a | c8[ bes] a[ g] a4 g | a2 g | a g | g2.
             f4 | a c c c | c g c a | c2 d | c2. bes4 | a2.
  \bar "|."
}

bassMusic = \relative c {
  \partial 4 c4 | f f f f | c d c a | c d c c | f2.
             c4 | f c a f' | a8[ g] f[ e] f4 c | f2 e | d g, | c2.
             f4 | f f a f | c c c d | a2 bes | c2. c4 | f2.
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
