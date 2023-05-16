\version "2.24.0"

tune = \relative c'' {
  \time 3/4
  \displayMusic #(open-output-file "afterGrace1.scm")
  \afterGrace e2.( {d16 e)}

  \displayMusic #(open-output-file "whatASlurLooksLike.scm")
  { e2 (d8 e) }

  \displayLilyMusic
  #(make-music 'ContextSpeccedMusic
               'property-operations '()
               'context-type 'Bottom
               'element
               (make-music 'SimultaneousMusic
                           'elements
                           (list (make-music 'NoteEvent
                                             'articulations (list (make-music 'SlurEvent 'span-direction -1))
                                             'duration (ly:make-duration 1 1)
                                             'pitch (ly:make-pitch -1 2))
                                 (make-music 'SequentialMusic
                                             'elements
                                             (list (make-music 'SkipMusic
                                                               'duration (ly:make-duration 0 0 9/16))
                                                   (make-music 'GraceMusic
                                                               'element
                                                               (make-music 'SequentialMusic
                                                                           'elements
                                                                           (list (make-music 'NoteEvent
                                                                                             'duration (ly:make-duration 4)
                                                                                             'pitch (ly:make-pitch -1 1))
                                                                                 (make-music 'NoteEvent
                                                                                             'articulations (list (make-music 'SlurEvent 'span-direction 1))
                                                                                             'pitch (ly:make-pitch -1 2)
                                                                                             'duration (ly:make-duration 4))))))))))



}

\score {
  \new Staff \tune
}