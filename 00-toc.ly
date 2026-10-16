\version "2.14.2"
\include "inc-header.ly"
\paper { oddFooterMarkup = ##f }
\header {
  title = ""
  tagline = ""
}

#(set-global-staff-size 23) \paper{ #(define fonts (make-pango-font-tree "Garamond Premr Pro" "Garamond Premr Pro" "Garamond Premr Pro" (/ 25 20))) }

\markup\fill-line \center-align {\override #'(font-name . "Garamond Premr Pro Subh"){ \abs-fontsize #18 "The Holy Name Men’s Society"}}
\markup\fill-line \center-align {\override #'(font-name . "Garamond Premr Pro Subh"){ \abs-fontsize #18 "Eucharistic Procession"}}
\markup\vspace #0.5

\markup{{%\override #'(line-width . 41.3) \override #'(baseline-skip . 2.48) \override #'(word-space . 0)
\column{
{\fill-with-pattern #0.1 #CENTER . "O Salutáris" 2}
{\fill-with-pattern #0.1 #CENTER . "Come, Holy Ghost" 3}
{\fill-with-pattern #0.1 #CENTER . "Jesus, My Lord, My God, My All" 4}
{\fill-with-pattern #0.1 #CENTER . "Holy, Holy, Holy!" 6}
{\fill-with-pattern #0.1 #CENTER . "Holy God, We Praise Thy Name" 8}
{\fill-with-pattern #0.1 #CENTER . "Alleluia, Sing to Jesus!" 10}
{\fill-with-pattern #0.1 #CENTER . "Faith of Our Fathers" 12}
{\fill-with-pattern #0.1 #CENTER . "To Jesus Christ, Our Sovereign King" 14}
{\fill-with-pattern #0.1 #CENTER . "All Hail the Power of Jesus’ Name" 16}
{\fill-with-pattern #0.1 #CENTER . "Crown Him with Many Crowns" 18}
{\fill-with-pattern #0.1 #CENTER . "Godhead Here in Hiding" 20}
{\fill-with-pattern #0.1 #CENTER . "All People That on Earth Do Dwell" 21}
{\fill-with-pattern #0.1 #CENTER . "Be Thou My Vision" 22}
{\fill-with-pattern #0.1 #CENTER . "Tantum Ergo" 23}
}}}

\markup\vspace #0.6

\markup\fill-line \center-align { "The Divine Praises"}

\markup\vspace #0.3

\markup{{%\override #'(line-width . 41.3) \override #'(baseline-skip . 2.48) \override #'(word-space . 0)
\column{
{"Blessed be God."}
{"Blessed be his Holy Name."}
{"Blessed be Jesus Christ, true God and true man."}
{"Blessed be the Name of Jesus."}
{"Blessed be his Most Sacred Heart."}
{"Blessed be his Most Precious Blood."}
{"Blessed be Jesus in the Most Holy Sacrament of the Altar."}
{"Blessed be the Holy Spirit, the Paraclete."}
{"Blessed be the great Mother of God, Mary most holy."}
{"Blessed be her holy and Immaculate Conception."}
{"Blessed be her glorious Assumption."}
{"Blessed be the Name of Mary, Virgin and Mother."}
{"Blessed be Saint Joseph, her most chaste spouse."}
{"Blessed be God in his angels and in his Saints."}
}}}
