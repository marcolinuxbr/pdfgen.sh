#!/bin/bash

PDF1=$(cat  <<'END'
%PDF-1.7

1 0 obj  % entry point
<<
  /Type /Catalog
  /Pages 2 0 R
>>
endobj

2 0 obj
<<
  /Type /Pages
  /MediaBox [ 0 0 400 550 ]
  /Count 1
  /Kids [ 3 0 R ]
>>
endobj

3 0 obj
<<
  /Type /Page
  /Parent 2 0 R
  /Resources <<
    /Font <<
      /F1 4 0 R 
    >>
  >>
  /Contents 5 0 R
>>
endobj

4 0 obj
<<
  /Type /Font
  /Subtype /Type1
  /BaseFont /Times-Roman
>>
endobj

5 0 obj  % page content
<<
  /Length 44
>>
stream
BT
70 50 TD
/F1 12 Tf
END
)




PDF2=$(cat  <<'END1'
ET
endstream
endobj

xref
0 6
0000000000 65535 f 
0000000010 00000 n 
0000000079 00000 n 
0000000173 00000 n 
0000000301 00000 n 
0000000380 00000 n 
trailer
<<
  /Size 6
  /Root 1 0 R
>>
startxref
492
%%EOF

END1
)

NUM="012345"
#ramdom (nanoseconds actually): to make pdfs in bytes different
STR="(number: $NUM  random: $(date +%N)) Tj"
NUMPDF=500
DATA=$(date +%Y-%m-%d_%H_%M_%S)


rm -f makePdf*.pdf

for F in $(seq -f "%03g" 1 $NUMPDF) ;do
 echo "$PDF1 (number: $NUM  random: $(date +%N) id: $F ) Tj $PDF2" > makePdf-$NUM-$F.pdf
done
 rm -f makePdf*.zip
 zip makePdf-$DATA-$NUMPDF-pdfs.zip makePdf*.pdf
 rm -f makePdf*.pdf






