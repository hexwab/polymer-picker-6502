REM set up variables for main game
A$=STRING$(40," "):REM preallocate
*FX143,12,255
?&D00=64:REM this gives us &D01-&D5F now that we're done with the disc

REM row table for the sprite plotter
FOR A%=0 TO31
A%?&D01=(&3000+A%*640)DIV256
NEXT

HIMEM=&2C00
VDU6
RESTORE:REM without this we read data from POLY3!
PROCvdu:B$=A$
DATA4,28,0,31,19,27,17,143,12,26,28,0,28,19,27,17,132,12,26,5,-1

PROCvdu:C$=A$
DATA18,0,15,25,4,512,920,230,231,232,10,8,8,8,233,234,235,236,18,0,7,25,4,512,924,230,231,232,10,8,8,8,233,234,235,236,-1

PROCvdu:D$=A$
DATA26,4,17,143,17,7,31,11,30,65,105,114,31,1,30,251,32,17,7,-1

PROCvdu:E$=A$
DATA18,3,6,25,4,612,850,237,0,-1

PROCvdu:F$=A$
DATA23,0,8202,0,0,0,0,0,0,-1

PROCvdu:G$=A$
REMVDU4,17,128,31,5,15:PRINTSPC(10):FORZ=0TO15:VDU19,Z,Z;0;:NEXT:VDU19,0,4;0;19,15,0;0;19,14,6;0;5:
DATA4,17,128,31,5,15,32,32,32,32,32,32,32,32,32,32,20,19,0,4,0,0,0,19,15,0,0,0,0,19,14,6,0,0,0,5,-1

PROCvdu:H$=A$
REMVDU19,14,7;0;17,14,31,5,15
DATA19,14,7,0,0,0,17,14,31,5,15,-1

PROCvdu:REM leave the last one in A$
REMVDU5,18,0,14:MOVE920,40:MOVE1216,40:PLOT85,920,52:PLOT85,1216,52:
DATA5,18,0,14,25,4,920,40,0,25,4,1216,40,0,25,85,920,52,0,25,85,1216,52,0,-1

N%=RND(-TIME):S%=0
k%=&AB8:n%=&AC0:q%=&AC8:t%=&AD0:F%=&AD8:G%=&AE0:J%=&AE8

REM high scores
DIMh%(8),h$(8)
FORT%=1TO8
h$(T%)=STRING$(14," "):REM preallocate space to avoid memory allocation failures later
h%(T%)=(9-T%)*500:READh$(T%)
NEXT
h%(1)=75000
DATASTEVE,NUNI,ANDON,EDORA,GRAEME,EWOK,ROCKY,ECCLES

REM let's see what we have to work with
PRINT "HIMEM=&";~HIMEM
PRINT "TOP=&";~TOP
PRINT "LOMEM=&";~LOMEM
PRINT "VARTOP=&";~(!2 AND&FFFF)
PRINT "Program takes ";(TOP-&E00);" bytes"
PRINT "Variables take ";((!2 AND&FFFF)-LOMEM);" bytes"
PRINT (HIMEM-(!2 AND&FFFF));" bytes free"
IFGET
REM and we're go!
PAGE=&E00
GOTO1

DEF PROCvdu:A$=""
REPEATREADA%:IF A%<0ENDPROC
IFA%>255A$=A$+CHR$(A%AND255):A%=A%DIV256:REM this hack for 2-byte values is the best we can do
A$=A$+CHR$A%:UNTIL0
