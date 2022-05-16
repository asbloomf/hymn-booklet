\version "2.18.2"

\layout {
  \context {
      \Staff
      \remove "Time_signature_engraver"
  }
  \context {
      \Lyrics
      \override LyricSpace #'minimum-distance = #1.2
  }
}

stemOff = {
  \hide Staff.Stem
}
divisioMinima = {
  \once \override BreathingSign.stencil =
    #ly:breathing-sign::divisio-minima
  %\once \override BreathingSign.Y-offset = #0
  \breathe
}
divisioMajor = {
  \once \override BreathingSign.stencil =
    #ly:breathing-sign::divisio-maior
  \once \override BreathingSign.Y-offset = #0
  \breathe
}
divisioMaxima = {
  \once \override BreathingSign.stencil =
    #ly:breathing-sign::divisio-maxima
  \once \override BreathingSign.Y-offset = #0
  \breathe
}
finalis = {
  \once \override BreathingSign.stencil =
    #ly:breathing-sign::finalis
  \once \override BreathingSign.Y-offset = #0
  \breathe
}

