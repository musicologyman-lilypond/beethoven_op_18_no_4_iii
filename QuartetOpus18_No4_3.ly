\version "2.24.1"

\include "violinoone.ly"
\include "violinotwo.ly"
\include "viola.ly"
\include "cello.ly"

#(set-global-staff-size 11)

\header {
  tagline = ##f
}

\paper {
  #(set-paper-size '(cons ( * 126 mm ) ( * 176 mm )))
  systems-per-page = #4
  %system-separator-markup = \slashSeparator
  indent = #15
}

\score {

  \new StaffGroup <<
    \new Staff \violinoone
    \new Staff \violinotwo
    \new Staff \viola
    \new Staff \cello
  >>
  \layout {
    \context {
      \Score
      \override BarNumber.Y-offset = #4.0
    }
    \context {
      \Staff
      \override BarLine.hair-thickness = #1.4
      \override BarLine.thick-thickness = #3.0
    }
  }

  \midi { \tempo 4=192 }

}




