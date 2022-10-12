lilypond --ps *.ly
gswin64c -q -dSAFER -dDEVICEWIDTHPOINTS=396 -dDEVICEHEIGHTPOINTS=612 -dCompatibilityLevel=1.4 -dNOPAUSE -dBATCH -r1200 -sDEVICE=pdfwrite -dEmbedAllFonts=true -dSubsetFonts=true -sOutputFile=output/out.pdf -c.setpdfwrite -f *.ps
