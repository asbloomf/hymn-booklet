\version "2.14.2"
%\include "../util.ly"
\include "inc-header.ly"
\header {
  title = \markup{\override #'(font-name . "Garamond Premr Pro"){ \abs-fontsize #18 "O Salutaris"}}
  composer = \markup"Duguet"
  poet = \markup "St Thomas Aquinas"
  tagline = ""
}
% #(set-global-staff-size 20) \paper{ #(define fonts (make-pango-font-tree "Garamond Premr Pro" "Garamond Premr Pro" "Garamond Premr Pro" (/ 22 20))) }
global = {
  \key ees \major
  \time 4/4
  %\dynamicUp
  %\set crescendoSpanner = #'dashed-line
  %\set midiInstrument = "recorder"
  \autoBeamOff
  \override DynamicTextSpanner #'style = #'none
}

sopMusic = \relative c'' {
  \partial 4 ees,4 | g f g aes | g f ees g | g f g bes | bes a bes\fermata
  bes | c bes g aes | bes  aes8[ g] f4 g | ees f g aes | g f ees\fermata
  \bar "||"
  \cadenzaOn ees2 ees \bar "|."
}
sopWords = \lyricmode {
  \set stanza = "1. " \set shortVocalName = "1. "
  O sa -- lu -- tá -- ris hó -- sti -- a,
  Quæ coe -- li pan -- dis ó -- sti -- um,
  Bel -- la pre -- munt ho -- stí -- li -- a,
  Da ro -- bur, fer au -- xí -- li -- um.
}

sopWordsII = \lyricmode {
  \set stanza = "2. " \set shortVocalName = "2. "
  U -- ni tri -- nó -- que Dó -- mi -- no,
  Sit sem -- pi -- tér -- na gló -- ri -- a_:
  Qui vi -- tam si -- ne tér -- mi -- no
  No -- bis do -- net in pá -- tri -- a.
  A -- men.
}

altoMusic = \relative c' {
  \partial 4 bes4 | ees d ees ees | ees d bes ees | ees d ees f | ees ees d
  ees | ees d ees ees | f ees d d | c d ees ees | ees d bes
  \bar "||"
  \cadenzaOn c2 bes \bar "|."

}
tenorMusic = \relative c' {
  \partial 4 g4 | bes bes bes c | bes4. aes8 g4 bes | bes bes bes f | g f f
  g | aes f ees aes8[ c] | bes4 bes bes g | g bes bes c | bes4. aes8 g4
  \bar "||"
  \cadenzaOn aes2 g \bar "|."
}

bassMusic = \relative c' {
  \partial 4 ees,4 | ees bes ees aes, | bes bes ees ees | ees bes ees d | c c bes
  ees | aes, bes ees8[ d] c4 | d ees bes b | c bes ees aes, | bes bes ees
  \bar "||"
  \cadenzaOn aes,2 ees' \bar "|."
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
   \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
  >>
%    \new PianoStaff << \new Staff { \new Voice { \pianoRH } } \new Staff { \clef "bass" \pianoLH } >>
  >>
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
  \midi {
    \tempo 4 = 90
    \set Staff.midiInstrument = "flute"

    \context {
      \Voice
      \remove "Dynamic_performer"
    }
  }
}
