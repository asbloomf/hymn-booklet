\version "2.14.2"
%\include "../util.ly"
\include "inc-header.ly"
\header {
  title = \markup{\override #'(font-name . "Garamond Premr Pro"){ \abs-fontsize #18 "To Jesus Christ, Our Sovereign King"}}
  composer = \markup"ICH GLAUB AN GOTT"
  poet = \markup "Martin B Hellriegel (1890-1981)"
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
  \partial 4 c4 | f g a8[ bes] c4 | bes a g a | a f bes a | g2 f4
              c | f g a8[ bes] c4 | bes a g a | a f bes a | g2 f \bar "||"
  c'2 c4 c | d2 d | bes a4 g | c2 c |
  c, f4 a | c2 bes4 a | g1 | f2.
  \bar "|."
}
sopWords = \lyricmode {
  \set stanza = "1. " \set shortVocalName = "1. "
  To Je -- sus Christ, our sov -- "’reign" King Who is the world’s sal -- va -- tion,
  All praise and hom -- age do we bring And thanks and ad -- o -- ra -- tion.
  \set shortVocalName = ""
  Christ Je -- sus, Vic -- tor! Christ Je -- sus, Rul -- er!
  Christ Je -- sus, Lord and Re -- deem -- er!
}

sopWordsII = \lyricmode {
  \set stanza = "2. " \set shortVocalName = "2. "
  Thy reign ex -- tend, O King be -- nign, To ev -- "’ry" land and na -- tion;
  For in thy king -- dom, Lord di -- vine, A -- lone we find sal -- va -- tion.
}

sopWordsIII = \lyricmode {
  \set stanza = "3. " \set shortVocalName = "3. "
  To thee and to thy Church, great King, We pledge our hearts’ ob -- la -- tion;
  Un -- til be -- fore thy throne we sing In end -- less ju -- bi -- la -- tion.
}

altoMusic = \relative c' {
  \partial 4 c4 | c c c f | f f e e | f d f f | f( e) c
              c | c c c f | f f e e | f d f f | f( e) c2 \bar "||"
  a'2 g4 a | bes2 a | g f4 d | g2 a |
  c, d4 e | f2 f4 f | f2( e) | c2.
  \bar "|."
}
tenorMusic = \relative c' {
  \partial 4 bes4 | a e f f | d' c c a | a a d c | c2 a4
              bes | a e f f | d' c c a | a a d c | c2 a \bar "||"
  c2 c4 c | f2 f | d d4 g, | e'2 f |
  a, a4 a | f2 d'4 c | d2( c) | a2.
  \bar "|."
}

bassMusic = \relative c' {
  \partial 4 bes4 | a e f a, | bes f c' cis | d4. c?8 bes4 f | c'2 f,4
             bes' | a e f a, | bes f c' cis | d4. c?8 bes4 f | c'2 f,
  f'2 e4 f | bes,2 d | g, d'4 bes | c2 f, |
  f' d4 c | a2 bes4 g | bes2 c | f,2.
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
