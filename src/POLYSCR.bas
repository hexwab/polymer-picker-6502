REM Polymer Picker title screen loader
REM by Stephen Scott (c) 2021-22
REM Thanks to ChrisB, jms2 and lurkio
REM Hi to the Stardot community
MODE0:VDU23;8202;0;0;0;19,1,0;0;
*FX200,1
*LOAD PPBY 3000
VDU19,1,7;0;
TIME=0:REPEATUNTILTIME=100
MODE1:VDU23;8202;0;0;0;19,1,0;0;19,2,0;0;19,3,0;0;
*LOAD PPSCR 3000
VDU19,1,4;0;19,2,6;0;19,3,7;0;
TIME=0:REPEATUNTILTIME=100
PRINTTAB(5,30)"  Press SPACEBAR to continue  ":*FX15
REPEATUNTILGET=32
MODE7:VDU23;8202;0;0;0;
PAGE=&1100
CHAIN"POLY1"
