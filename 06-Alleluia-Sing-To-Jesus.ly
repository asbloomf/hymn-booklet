\version "2.14.2"
%\include "../util.ly"
\include "inc-header.ly"
\header {
  title = \markup{\override #'(font-name . "Garamond Premr Pro"){ \abs-fontsize #18 "Alleluia, Sing to Jesus!"}}
  composer = \markup"Rowland H Prichard (1811-1887)"
  poet = \markup "William C Dix (1837-1898)"
  tagline = ""
}
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
  f2 g4 | f4.( g8) a4 | bes2 a4 | g( f) g | c2 bes4 | a2 a4 | g( f) g f2. |
  f2 g4 | f4.( g8) a4 | bes2 a4 | g( f) g | c2 bes4 | a2 a4 | g( f) g f2. |
  c'2 c4 | c( bes) a | bes2 bes4 | bes( a) g | a2 a4 | a( bes) c | c( bes) a | g2. |
  c4( a) c | bes( g) bes | a( f) a | g8([ a] bes[ a]) g4 | c2 c4 | d( c) bes | a2 g4 | f2.
  \bar "|."
}
sopWords = \lyricmode {
  \set stanza = "1. " \set shortVocalName = "1. "
  Al -- le -- lu -- ia!
  Sing to Je -- sus!
  His the scep -- ter, his the throne;
  Al -- le -- lu -- ia!
  His the tri -- umph,
  His the vic -- to -- ry a -- lone;
  Hark! the songs of peace -- ful Si -- on
  Thun -- der like a might -- y flood;
  Je -- sus out of ev -- ’ry na -- tion
  Hath re -- deemed us by his blood.
}

sopWordsII = \lyricmode {
  \set stanza = "2. " \set shortVocalName = "2. "
  Al -- le -- lu -- ia!
  Not as or -- phans
  Are we left in sor -- row now;
  Al -- le -- lu -- ia!
  He is near us,
  Faith be -- lieves, nor ques -- tions how:
  Though the cloud from sight re -- ceived him,
  When the for -- ty days were o’er,
  Shall our hearts for -- get his prom -- ise,
  “I am with you ev -- er -- more”?
}

sopWordsIII = \lyricmode {
  \set stanza = "3. " \set shortVocalName = "3. "
  Al -- le -- lu -- ia!
  Bread of An -- gels,
  Thou on earth our food, our stay;
  Al -- le -- lu -- ia!
  Here the sin -- ful
  Flee to thee from day to day:
  In -- ter -- ces -- sor, friend of sin -- ners,
  Earth’s Re -- deem -- er, plead for me,
  Where the songs of all the sin -- less
  Sweep a -- cross the crys -- tal sea.
}

sopWordsIV = \lyricmode {
  \set stanza = "4. " \set shortVocalName = "4. "
  Al -- le -- lu -- ia!
  King e -- ter -- nal,
  Thee the Lord of lords we own;
  Al -- le -- lu -- ia!
  Born of Ma -- ry,
  Earth thy foot -- stool, heav’n thy throne:
  Thou with -- in the veil hast en -- tered,
  Robed in flesh, our great High Priest;
  Thou on earth both Priest and Vic -- tim
  In the Eu -- cha -- ris -- tic feast.
}

altoMusic = \relative c' {
  c2 e4 | f2 f4 | g2 f4 | e( d) e | f( c) d8[ e] | f2 f8[ e] | d2 e4 | f2. |
  c2 e4 | f2 f4 | g2 f4 | e( d) e | f( c) d8[ e] | f2 f8[ e] | d2 e4 | f2. |
  e2 e4 | f2 f4 | f( e) d | e( f) c | c2 f4 | f( g) a | a( g) f | f2( e4) |
  f2 a4 | g2 g4 | f( c) f | g8([ e] f4) c | c( f) ees | d( f) f | f2 e4 | f2.
  \bar "|."
}
tenorMusic = \relative c' {
  a2 g4 | a4.( bes8) c4 | d( c) c | c( a) c | c2 c4 | c2 c4 | bes( a) c | a2. |
  a2 g4 | a4.( bes8) c4 | d( c) c | c( a) c | c2 c4 | c2 c4 | bes( a) c | a2. |
  c2 c4 | f,( g) a | g2 g4 | g( c) bes | a2 c4 | d2 c4 | d2 d4 | g,2. |
  c2 d4 | d2 c4 | c( a) b | c( bes!) bes | a2 c4 | bes( c) d | c2 bes4 | a2.
  \bar "|."
}

bassMusic = \relative c, {
  f4( a) c | f2 f4 | f( e) f | c( d) c | a'2 g4 | f2 a,4 | bes( d) c | f2. |
  f,4( a) c | f2 f4 | f( e) f | c( d) c | a'2 g4 | f2 a,4 | bes( d) c | f2. |
  a2 a4 | d,2 d4 | g2 g4 | c,( d) e | f2 e4 | d2 a4 | g2 bes4 | c2. |
  a'2 f4 | f( e8[ d]) e4 | f( e) d | e8([ c] d4) e | f2 a,4 | bes( a) bes | c2 c4 | f2.
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
