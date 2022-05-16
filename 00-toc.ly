\version "2.14.2"
\include "inc-header.ly"
\header {
  title = ""
  tagline = ""
}

#(set-global-staff-size 23) \paper{ #(define fonts (make-pango-font-tree "Garamond Premr Pro" "Garamond Premr Pro" "Garamond Premr Pro" (/ 25 20))) }

\markup\fill-line \center-align {\override #'(font-name . "Garamond Premr Pro Subh"){ \abs-fontsize #18 "The Holy Name Men’s Society"}}
\markup\fill-line \center-align {\override #'(font-name . "Garamond Premr Pro Subh"){ \abs-fontsize #18 "Eucharistic Procession"}}
\markup\vspace #0.9

\markup{{%\override #'(line-width . 41.3) \override #'(baseline-skip . 2.48) \override #'(word-space . 0)
\column{
{\fill-with-pattern #0.1 #CENTER . "O Salutáris" 1}
{\fill-with-pattern #0.1 #CENTER . "Come, Holy Ghost" 2}
{\fill-with-pattern #0.1 #CENTER . "Jesus, My Lord, My God, My All" 3}
{\fill-with-pattern #0.1 #CENTER . "Holy, Holy, Holy!" 5}
{\fill-with-pattern #0.1 #CENTER . "Holy God, We Praise Thy Name" 7}
{\fill-with-pattern #0.1 #CENTER . "Alleluia, Sing to Jesus!" 9}
{\fill-with-pattern #0.1 #CENTER . "Faith of Our Fathers" 11}
{\fill-with-pattern #0.1 #CENTER . "To Jesus Christ, Our Sovereign King" 13}
{\fill-with-pattern #0.1 #CENTER . "All Hail the Power of Jesus’ Name" 15}
{\fill-with-pattern #0.1 #CENTER . "Crown Him with Many Crowns" 17}
{\fill-with-pattern #0.1 #CENTER . "Godhead Here in Hiding" 19}
{\fill-with-pattern #0.1 #CENTER . "All People That On Earth Do Dwell" 20}
{\fill-with-pattern #0.1 #CENTER . "Be Thou My Vision" 21}
{\fill-with-pattern #0.1 #CENTER . "Tantum Ergo" 22}
}}}

\markup\vspace #1

\markup\fill-line \center-align { "The Divine Praises"}

\markup\vspace #0.3

\markup{{%\override #'(line-width . 41.3) \override #'(baseline-skip . 2.48) \override #'(word-space . 0)
\column{
{"Blessed be God."}
{"Blessed be his Holy Name."}
{"Blessed be Jesus Christ, true God and true man."}
{"Blessed be the Name of Jesus."}
{"Blessed be his Most Sacred Heart."}
{"Blessed be Jesus in the Most Holy Sacrament of the Altar."}
{"Blessed be the Holy Spirit, the Paraclete."}
{"Blessed be the great Mother of God, Mary most holy."}
{"Blessed be her holy and Immaculate Conception."}
{"Blessed be her glorious Assumption."}
{"Blessed be the Name of Mary, Virgin and Mother."}
{"Blessed be Saint Joseph, her most chaste spouse."}
{"Blessed be God in his angels and in his Saints."}
}}}
