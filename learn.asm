
.686p
.mmx
.model large


; Segment type: Pure code
seg000 segment byte public 'CODE' use16
assume cs:seg000
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing
byte_10000 db 0BBh, 1, 2 dup(0), 0FCh, 3, 4Eh, 0Fh
db 48h, 0
dw 0
db 20h, 0
dw 0
byte_10010 db 40h, 0, 1, 0
word_10014 dw 0
db 26h, 0Dh, 18h, 0, 80h, 0Dh, 18h, 0, 0B2h
db 0Dh
dw seg seg002
db 0DEh, 0Dh, 18h, 0
db 0
db 0
dw seg seg000
db 0D6h, 0Ah, 20h, 0
byte_1002E db 0
db 0
dw 64h
db 7Ch, 9
db 15h
byte_10035 db 5 dup(0), 96h, 9, 20h, 3 dup(0), 1, 6 dup(0)
byte_10047 db 44h
db 2 dup(0), 20h, 0, 0A0h, 0, 1, 0, 8, 70h
db 40h, 0, 1, 7 dup(0)
aDos4gCopyright db 'DOS/4G  Copyright (C) Rational Syst'
db 'ems, Inc. 1987 - 1993',0
byte_10095 db 0, 87h, 0DBh, 0Ch dup(0)
dw 0
dw 0
db 2 dup(0)
word_100AA dw 0
byte_100AC db 16h dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h
db 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h, 4 dup(0), 18h, 2 dup(0)
db 86h, 4 dup(0), 18h, 2 dup(0), 86h, 4 dup(0)
db 18h, 2 dup(0), 86h
db 0Ah dup(0)
db 9Fh, 4 dup(0), 93h
align 4
db 0FFh, 7, 3 dup(0), 93h
align 4
db 2 dup(0FFh), 3 dup(0), 9Bh, 2 dup(0)
db 2 dup(0FFh), 3 dup(0), 93h, 12h dup(0)
db 2 dup(0FFh), 3 dup(0), 93h, 2 dup(0)
db 0FFh, 0Fh, 0, 4, 0, 93h, 2 dup(0), 2 dup(0FFh)
db 3 dup(0), 93h, 2 dup(0), 0Fh, 4 dup(0)
db 93h, 2 dup(0), 67h, 4 dup(0), 81h, 2 dup(0)
db 2 dup(0FFh), 3 dup(0), 93h, 2 dup(0)
db 2 dup(0FFh), 3 dup(0), 82h, 2 dup(0)
db 2 dup(0FFh), 3 dup(0), 9Bh, 3Eh dup(0)
db 0FFh, 2, 4 dup(0)
dw 2F38h
dw 2FFh
dw 0
db 0
db 0Bh dup(0)
dw seg seg000
db 4 dup(0), 0C0h, 0
dw seg seg000
word_10996 dw 0
db 20h, 3 dup(0), 20h, 3 dup(0)
dw seg seg000
align 4
dd byte_10095+3
dd byte_10F8A
dd byte_11026
db 80h, 0, 28h, 0
dw seg seg000
seg_109B6 dw seg seg002
byte_109B8 db 2 dup(0), 0B2h, 8, 9Fh, 0Ah, 0A4h, 0Ah
db 0FCh, 2, 0B5h, 2, 22h, 3 dup(0), 1, 26h dup(0)
db 94h, 0Bh
dw seg seg002
align 2
db 2, 3 dup(0), 0FFh, 0CFh, 4 dup(0), 3Eh
db 7, 70h, 0, 1, 0, 7, 0, 0A0h, 7, 70h, 7 dup(0)
dw seg seg003
byte_10A12 db 4 dup(0)
byte_10A16 db 0
db 0FFh, 3, 9 dup(0), 50h, 15h
dw seg seg000
byte_10A26 db 56h dup(0), 44h, 4Fh, 53h, 31h, 36h, 4Dh
db 2Eh, 33h, 38h, 36h, 18h dup(0), 3, 3 dup(0)
db 50h, 0, 9, 3Bh, 9, 3Bh
dword_10AA8 dd 0
byte_10AAC db 0Dh, 0Ah, 2 dup(0), 30h, 31h, 32h, 33h
db 34h, 35h, 36h, 37h, 38h, 39h, 41h, 42h
db 43h, 44h, 45h, 46h, 2 dup(0), 12h, 24h
db 20h, 65h, 2 dup(72h), 6Fh, 72h, 3Ah, 20h
db 0, 20h, 27h, 0, 27h, 0, 3Dh, 0, 20h, 0
db 34h, 2Eh, 34h, 33h, 16h dup(0), 2 dup(0FFh)
db 5Eh, 3Eh, 70h, 0, 92h, 1Eh, 18h, 0, 0FAh
db 0Ah, 14h dup(0)
dw seg seg004


; Attributes: bp-based frame

sub_10B12 proc far

arg_0= word ptr  6

push    bp
mov     bp, sp
mov     al, ds:9F5h
or      al, ds:0E6Ah
jnz     short loc_10B5D
mov     bx, [bp+arg_0]
mov     ax, ds:0CE4h
sub     ax, ds:0CDCh
sub     ax, bx
ja      short loc_10B5D
neg     ax
add     ax, 0Fh
mov     cl, 4
shr     ax, cl
mov     dx, ax
mov     cx, ds:0B10h
inc     cx
add     ax, cx
sub     ax, ds:0CEAh
xchg    ax, bx
mov     ax, [bp+4]
sub     cx, ax
shl     cx, 1
shl     cx, 1
shl     cx, 1
shl     cx, 1
mov     ah, 4Ah ; 'J'
mov     es, word ptr ds:0CEAh
int     21h             ; DOS - 2+ - ADJUST MEMORY BLOCK SIZE (SETBLOCK)
                        ; ES = segment address of block to change
                        ; BX = new size in paragraphs
mov     ax, 0
jnb     short loc_10B62

loc_10B5D:
pop     bp
sti
push    ss
pop     es
retf

loc_10B62:
mov     ds:5Ah, bx
add     ds:0B10h, dx
mov     ax, dx
push    cx
mov     cl, 4
shl     ax, cl
pop     cx
add     ds:0CE4h, ax
mov     ax, [bp+4]
mov     ds, ax
add     ax, dx
mov     es, ax
push    si
push    di
mov     si, cx
dec     si
dec     si
mov     di, si
std
cli
shr     cx, 1
rep movsw
cld
push    ss
pop     ds
mov     dx, [bp+4]
mov     [bp+4], ax
mov     es:28A9h, ax
mov     ds:9F1h, ax
mov     ds:9B6h, ax
mov     ds:20h, ax
cmp     word ptr ds:0A12h, 0
jnz     short loc_10BB2
mov     cx, ax
sub     cx, dx
add     ds:0A10h, cx

loc_10BB2:
mov     es, word ptr ds:0CEAh
cmp     es:0Ch, dx
jnz     short loc_10BC1
mov     es:0Ch, ax

loc_10BC1:
xor     bx, bx
mov     es, bx
assume es:nothing
mov     di, 0F8Ch
mov     si, 1028h
mov     cx, 27h ; '''

loc_10BCE:
cmp     [bx+di], dx
jnz     short loc_10BD4
mov     [bx+di], ax

loc_10BD4:
cmp     [bx+si], dx
jnz     short loc_10BDA
mov     [bx+si], ax

loc_10BDA:
cmp     es:[bx+22h], dx
jnz     short loc_10BE4
mov     es:[bx+22h], ax

loc_10BE4:
add     bx, 4
loop    loc_10BCE
mov     bl, ds:34h
cmp     bl, 2Eh ; '.'
jbe     short loc_10C02
xor     bh, bh
shl     bx, 1
shl     bx, 1
cmp     es:[bx+2], dx
jnz     short loc_10C02
mov     es:[bx+2], ax

loc_10C02:
push    ax
pop     es
assume es:nothing
mov     es:12CAh, ax
pop     di
pop     si
jmp     loc_10B5D
sub_10B12 endp

align 2
db 78h, 11h dup(0), 8, 0, 10h, 0, 18h, 0
db 20h, 0, 28h, 0, 30h, 0, 38h, 0, 40h, 0
db 48h, 0, 50h, 3 dup(0), 60h, 3 dup(0)
db 70h, 0, 78h, 0, 80h, 5 dup(0), 3, 0, 8
db 5 dup(0), 45h, 2 dup(72h), 6Fh, 72h, 20h
db 5Bh, 33h, 35h, 5Dh, 3Ah, 20h, 0
aGeneralProtect db 'General Protection Fault',0
aInvalidOpcode db 'Invalid Opcode',0
aPageFault db 'Page Fault',0
aUnexpectedInte db 'Unexpected Interrupt',0
aIn db ' in ',0
aAt db ' at ',0
db ':',0
aMap db ' map',0
aCode db 'code',0
aSs db 'ss',0
aDs db 'ds',0
aEs db 'es',0
aAx db 'ax',0
aBx db 'bx',0
aCx db 'cx',0
aDx db 'dx',0
aSp db 'sp',0
aBp db 'bp',0
aSi db 'si',0
aDi db 'di',0
db 2 dup(0)
word_10CDA dw 0
dw 1BCCh
dw seg seg000
db 2 dup(0), 0DCh, 0Ch
word_10CE4 dw 0
word_10CE6 dw 0
db 2 dup(0)
word_10CEA dw 0
word_10CEC dw 0
byte_10CEE db 0
align 2
word_10CF0 dw 0
word_10CF2 dw 0
word_10CF4 dw 0
dword_10CF6 dd 81810000h
db 81h, 2 dup(1), 0Fh dup(0), 5, 0
word_10D0E dw 0
db 0, 16h, 2 dup(2), 18h, 0Dh, 9, 3 dup(0Ch)
db 7, 8, 2 dup(16h), 0FFh, 2, 0Dh, 12h, 2
db 0FFh, 10h dup(0), 38h, 0Dh, 6 dup(0)
db 4Eh, 0Dh, 2 dup(0), 54h, 0Dh, 2 dup(0)
db 68h, 0, 58h, 0, 4, 2Ah, 2 dup(0), 18h
db 7 dup(0), 0FFh, 7, 4 dup(0)
byte_10D5A db 6 dup(0)
byte_10D60 db 10h dup(0), 80h, 0Bh dup(0), 20h, 21h dup(0)
db 68h, 1Dh dup(0), 20h, 3 dup(0), 18h, 3 dup(0)
db 20h, 3 dup(0), 20h, 0Bh dup(0), 68h, 5 dup(0)
db 68h, 0, 2 dup(0FFh), 3 dup(0), 93h, 0Ch dup(0)
word_10DEE dw 1
word_10DF0 dw 0FF00h
word_10DF2 dw 1
align 8
word_10DF8 dw 0
db 5 dup(0)
byte_10DFF db 0
byte_10E00 db 0, 70h, 61h, 67h, 65h, 73h, 20h, 61h
db 2 dup(6Ch), 6Fh, 63h, 0, 70h, 61h, 67h
db 65h, 73h, 20h, 66h, 72h, 2 dup(65h), 0
db 44h, 4Fh, 53h, 2Fh, 31h, 36h, 4Dh, 0
aDos16mProtecte db 'DOS/16M Protected Mode Run-Time    '
db ' Version ',0
align 2
aRunCom db 'RUN.COM',0
aLoader3Exe db 'LOADER3.EXE',0
aExp db '.EXP',0
aC db 'C',0
db 1
db 0
align 2
db 0F3h, 17h
dw 0
dw 0FFFFh
db 0
aVmExp db '\VM.EXP',0
aVmdExp db '\VMD.EXP',0
aDos16m db 'DOS16M=',0
aSwmode db 'SWMODE=',0
aInboard db 'INBOARD',0
aFast db 'FAST',0
aVcpi db 'VCPI',0
aDpmi db 'DPMI',0
aPs2 db 'PS2',0
aPs2_0 db 'PS/2',0
aNovm db 'NOVM',0
aA20 db 'A20',0
aTstk db 'TSTK',0
aDos16m_0 db 'DOS16M=',0
word_10ECA dw 400h
dw 3C00h
dw 4000h
db 1, 30h, 58h, 6 dup(0), 5Ch, 56h, 4Dh
db 2Eh, 0, 5Ch, 56h, 4Dh, 44h, 2Eh, 0, 51h
db 45h, 58h, 54h, 3 dup(58h), 30h, 2 dup(0)
db 56h, 44h, 49h, 53h, 4Bh, 0
aMicrosoftEmmCt db 'MICROSOFT EMM CTRL',0
align 2
db 0A5h, 0Fh, 0F0h, 5Ah, 43h, 4Fh, 4Dh, 50h
db 0, 41h, 51h, 0, 45h, 2 dup(52h), 31h
db 36h, 4Dh, 3Dh, 0, 2Eh, 45h, 54h, 58h
db 2 dup(0), 0CCh, 1Bh, 52h, 4Dh, 53h, 47h
db 0, 45h, 2 dup(53h), 41h, 47h, 45h, 0
db 4Fh, 4Eh, 54h, 49h, 4Eh, 55h, 45h, 0
db 4Eh, 44h, 4Dh, 53h, 47h, 3 dup(0), 0ECh
db 23h, 0ECh, 23h, 0ECh, 23h, 4 dup(0)
dw seg seg004
byte_10F4C db 2Eh dup(0)
word_10F7A dw 0
byte_10F7C db 8 dup(0)
dw 0
dw 0
byte_10F88 db 2 dup(0)
byte_10F8A db 9Ch dup(0)
byte_11026 db 0CCh dup(0)
dd 0
db 90h dup(0)
db 0
db 4Bh dup(0)
db 0
align 2
dw 0
db 4 dup(0)
dw 0
dw 0
align 4
dw 0
dw 0
db 0Ah dup(0)
dw 0
byte_111F0 db 0
db 0
dw 0
dw 0
dw 0
db 0Eh dup(0)
dw 0
db 6 dup(0)
dw 0
seg000 ends


; Segment type: Uninitialized
seg001 segment byte stack 'STACK' use16
assume cs:seg001
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing
byte_11210 db 340h dup(0), 57h, 49h, 43h, 42h, 34h dup(0)
db 6Fh, 9 dup(0), 50h, 57h, 58h, 5Fh, 54h dup(0)
db 69h, 6Eh, 76h, 6Fh, 6Ch, 75h, 6Eh, 74h
db 61h, 72h, 79h, 20h, 73h, 77h, 69h, 74h
db 63h, 68h, 20h, 74h, 6Fh, 20h, 72h, 65h
db 61h, 6Ch, 20h, 6Dh, 6Fh, 64h, 65h, 0
db 1, 0, 6Eh, 6Fh, 74h, 20h, 65h, 6Eh, 6Fh
db 75h, 67h, 68h, 20h, 65h, 78h, 74h, 65h
db 6Eh, 64h, 65h, 64h, 20h, 6Dh, 65h, 6Dh
db 6Fh, 72h, 79h, 0, 2, 0, 6Eh, 6Fh, 74h
db 20h, 61h, 20h, 44h, 4Fh, 53h, 2Fh, 31h
db 36h, 4Dh, 20h, 65h, 78h, 65h, 63h, 75h
db 74h, 61h, 62h, 6Ch, 65h, 0, 3, 0, 6Eh
db 6Fh, 20h, 44h, 4Fh, 53h, 20h, 6Dh, 65h
db 6Dh, 6Fh, 72h, 79h, 20h, 66h, 6Fh, 72h
db 20h, 74h, 72h, 61h, 6Eh, 73h, 70h, 61h
db 72h, 65h, 6Eh, 74h, 20h, 73h, 65h, 67h
db 6Dh, 65h, 6Eh, 74h, 0, 4, 0, 63h, 61h
db 2 dup(6Eh), 6Fh, 74h, 20h, 6Dh, 61h, 6Bh
db 65h, 20h, 74h, 72h, 61h, 6Eh, 73h, 70h
db 61h, 72h, 65h, 6Eh, 74h, 20h, 73h, 65h
db 67h, 6Dh, 65h, 6Eh, 74h, 0, 5, 0, 74h
db 2 dup(6Fh), 20h, 6Dh, 61h, 6Eh, 79h, 20h
db 74h, 72h, 61h, 6Eh, 73h, 70h, 61h, 72h
db 65h, 6Eh, 74h, 20h, 73h, 65h, 67h, 6Dh
db 65h, 6Eh, 74h, 73h, 0, 6, 0, 6Eh, 6Fh
db 74h, 20h, 65h, 6Eh, 6Fh, 75h, 67h, 68h
db 20h, 6Dh, 65h, 6Dh, 6Fh, 72h, 79h, 20h
db 74h, 6Fh, 20h, 6Ch, 6Fh, 61h, 64h, 20h
db 70h, 72h, 6Fh, 67h, 72h, 61h, 6Dh, 0
db 7, 0, 6Eh, 6Fh, 20h, 72h, 65h, 6Ch, 6Fh
db 63h, 61h, 74h, 69h, 6Fh, 6Eh, 20h, 73h
db 65h, 67h, 6Dh, 65h, 6Eh, 74h, 0, 8, 0
db 63h, 61h, 2 dup(6Eh), 6Fh, 74h, 20h, 6Fh
db 70h, 65h, 6Eh, 20h, 66h, 69h, 6Ch, 65h
db 0, 9, 0, 63h, 61h, 2 dup(6Eh), 6Fh, 74h
db 20h, 61h, 2 dup(6Ch), 6Fh, 63h, 61h, 74h
db 65h, 20h, 74h, 73h, 74h, 61h, 63h, 6Bh
db 0, 0Ah, 0, 63h, 61h, 2 dup(6Eh), 6Fh
db 74h, 20h, 61h, 2 dup(6Ch), 6Fh, 63h, 61h
db 74h, 65h, 20h, 6Dh, 65h, 6Dh, 6Fh, 72h
db 79h, 20h, 66h, 6Fh, 72h, 20h, 47h, 44h
db 54h, 0, 0Bh, 0, 6Eh, 6Fh, 20h, 70h, 61h
db 2 dup(73h), 75h, 70h, 20h, 73h, 74h, 61h
db 63h, 6Bh, 20h, 73h, 65h, 6Ch, 65h, 63h
db 74h, 6Fh, 72h, 73h, 20h, 2 dup(2Dh), 20h
db 47h, 44h, 54h, 20h, 74h, 2 dup(6Fh), 20h
db 73h, 6Dh, 61h, 2 dup(6Ch), 0, 0Ch, 0
db 6Eh, 6Fh, 20h, 63h, 6Fh, 6Eh, 74h, 72h
db 6Fh, 6Ch, 20h, 70h, 72h, 6Fh, 67h, 72h
db 61h, 6Dh, 20h, 73h, 65h, 6Ch, 65h, 63h
db 74h, 6Fh, 72h, 73h, 20h, 2 dup(2Dh), 20h
db 47h, 44h, 54h, 20h, 74h, 2 dup(6Fh), 20h
db 73h, 6Dh, 61h, 2 dup(6Ch), 0, 0Dh, 0
db 63h, 61h, 2 dup(6Eh), 6Fh, 74h, 20h, 61h
db 2 dup(6Ch), 6Fh, 63h, 61h, 74h, 65h, 20h
db 74h, 72h, 61h, 6Eh, 73h, 66h, 65h, 72h
db 20h, 62h, 75h, 2 dup(66h), 65h, 72h, 0
db 0Eh, 0, 70h, 72h, 65h, 6Dh, 61h, 74h
db 75h, 72h, 65h, 20h, 45h, 4Fh, 46h, 0
db 0Fh, 0, 70h, 72h, 6Fh, 74h, 65h, 63h
db 74h, 65h, 64h, 20h, 6Dh, 6Fh, 64h, 65h
db 20h, 61h, 76h, 61h, 69h, 6Ch, 61h, 62h
db 6Ch, 65h, 20h, 6Fh, 6Eh, 6Ch, 79h, 20h
db 77h, 69h, 74h, 68h, 20h, 33h, 38h, 36h
db 20h, 6Fh, 72h, 20h, 34h, 38h, 36h, 0
db 10h, 0, 63h, 61h, 2 dup(6Eh), 6Fh, 74h
db 20h, 72h, 75h, 6Eh, 20h, 75h, 6Eh, 64h
db 65h, 72h, 20h, 4Fh, 53h, 2Fh, 32h, 0
db 11h, 0, 73h, 79h, 73h, 74h, 65h, 6Dh
db 20h, 73h, 6Fh, 66h, 74h, 77h, 61h, 72h
db 65h, 20h, 64h, 6Fh, 65h, 73h, 20h, 6Eh
db 6Fh, 74h, 20h, 66h, 6Fh, 2 dup(6Ch), 6Fh
db 77h, 20h, 56h, 43h, 50h, 49h, 20h, 6Fh
db 72h, 20h, 44h, 50h, 4Dh, 49h, 20h, 73h
db 70h, 65h, 63h, 69h, 66h, 69h, 63h, 61h
db 74h, 69h, 6Fh, 6Eh, 73h, 0, 12h, 0, 79h
db 6Fh, 75h, 20h, 6Dh, 75h, 73h, 74h, 20h
db 73h, 70h, 65h, 63h, 69h, 66h, 79h, 20h
db 61h, 6Eh, 20h, 65h, 78h, 74h, 65h, 6Eh
db 64h, 65h, 64h, 20h, 6Dh, 65h, 6Dh, 6Fh
db 72h, 79h, 20h, 72h, 61h, 6Eh, 67h, 65h
db 20h, 28h, 53h, 45h, 54h, 20h, 44h, 4Fh
db 53h, 31h, 36h, 4Dh, 3Dh, 20h, 29h, 0
db 13h, 0, 63h, 6Fh, 6Dh, 70h, 75h, 74h
db 65h, 72h, 20h, 6Dh, 75h, 73h, 74h, 20h
db 62h, 65h, 20h, 41h, 54h, 2Dh, 20h, 6Fh
db 72h, 20h, 50h, 53h, 2Fh, 32h, 2Dh, 20h
db 63h, 6Fh, 6Dh, 70h, 61h, 74h, 69h, 62h
db 6Ch, 65h, 0, 14h, 0, 75h, 6Eh, 73h, 75h
db 2 dup(70h), 6Fh, 72h, 74h, 65h, 64h, 20h
db 44h, 4Fh, 53h, 31h, 36h, 4Dh, 20h, 73h
db 77h, 69h, 74h, 63h, 68h, 6Dh, 6Fh, 64h
db 65h, 20h, 63h, 68h, 6Fh, 69h, 63h, 65h
db 0, 15h, 0, 72h, 65h, 71h, 75h, 69h, 72h
db 65h, 73h, 20h, 44h, 4Fh, 53h, 20h, 33h
db 2Eh, 30h, 20h, 6Fh, 72h, 20h, 6Ch, 61h
db 74h, 65h, 72h, 0, 16h, 0, 63h, 61h, 2 dup(6Eh)
db 6Fh, 74h, 20h, 66h, 72h, 2 dup(65h), 20h
db 6Dh, 65h, 6Dh, 6Fh, 72h, 79h, 0, 17h
db 0, 6Eh, 6Fh, 20h, 6Dh, 65h, 6Dh, 6Fh
db 72h, 79h, 20h, 66h, 6Fh, 72h, 20h, 56h
db 43h, 50h, 49h, 20h, 70h, 61h, 67h, 65h
db 20h, 74h, 61h, 62h, 6Ch, 65h, 0, 18h
db 0, 56h, 43h, 50h, 49h, 20h, 70h, 61h
db 67h, 65h, 20h, 74h, 61h, 62h, 6Ch, 65h
db 20h, 61h, 2 dup(64h), 72h, 65h, 2 dup(73h)
db 20h, 69h, 6Eh, 63h, 6Fh, 2 dup(72h), 65h
db 63h, 74h, 0, 19h, 0, 63h, 61h, 2 dup(6Eh)
db 6Fh, 74h, 20h, 69h, 6Eh, 69h, 74h, 69h
db 61h, 6Ch, 69h, 7Ah, 65h, 20h, 56h, 43h
db 50h, 49h, 0, 1Ah, 0, 38h, 30h, 34h, 32h
db 20h, 74h, 69h, 6Dh, 65h, 6Fh, 75h, 74h
db 0, 1Bh, 0, 65h, 78h, 74h, 65h, 6Eh, 64h
db 65h, 64h, 20h, 6Dh, 65h, 6Dh, 6Fh, 72h
db 79h, 20h, 69h, 73h, 20h, 63h, 6Fh, 6Eh
db 66h, 69h, 67h, 75h, 72h, 65h, 64h, 20h
db 62h, 75h, 74h, 20h, 69h, 74h, 20h, 63h
db 61h, 2 dup(6Eh), 6Fh, 74h, 20h, 62h, 65h
db 20h, 61h, 2 dup(6Ch), 6Fh, 63h, 61h, 74h
db 65h, 64h, 0, 1Ch, 0, 6Dh, 65h, 6Dh, 6Fh
db 72h, 79h, 20h, 65h, 2 dup(72h), 6Fh, 72h
db 2Ch, 20h, 61h, 76h, 61h, 69h, 6Ch, 20h
db 6Ch, 2 dup(6Fh), 70h, 0, 1Dh, 0, 6Dh
db 65h, 6Dh, 6Fh, 72h, 79h, 20h, 65h, 2 dup(72h)
db 6Fh, 72h, 2Ch, 20h, 6Fh, 75h, 74h, 20h
db 6Fh, 66h, 20h, 72h, 61h, 6Eh, 67h, 65h
db 0, 1Eh, 0, 70h, 72h, 6Fh, 67h, 72h, 61h
db 6Dh, 20h, 6Dh, 75h, 73h, 74h, 20h, 62h
db 65h, 20h, 62h, 75h, 69h, 6Ch, 74h, 20h
db 2Dh, 41h, 55h, 54h, 4Fh, 20h, 66h, 6Fh
db 72h, 20h, 44h, 50h, 4Dh, 49h, 0, 1Fh
db 0, 70h, 72h, 6Fh, 74h, 65h, 63h, 74h
db 65h, 64h, 20h, 6Dh, 6Fh, 64h, 65h, 20h
db 61h, 6Ch, 72h, 65h, 61h, 64h, 79h, 20h
db 69h, 6Eh, 20h, 75h, 73h, 65h, 20h, 69h
db 6Eh, 20h, 74h, 68h, 69h, 73h, 20h, 44h
db 50h, 4Dh, 49h, 20h, 76h, 69h, 72h, 74h
db 75h, 61h, 6Ch, 20h, 6Dh, 61h, 63h, 68h
db 69h, 6Eh, 65h, 0, 20h, 0, 44h, 50h, 4Dh
db 49h, 20h, 68h, 6Fh, 73h, 74h, 20h, 65h
db 2 dup(72h), 6Fh, 72h, 20h, 28h, 70h, 6Fh
db 2 dup(73h), 69h, 62h, 6Ch, 79h, 20h, 69h
db 6Eh, 73h, 75h, 2 dup(66h), 69h, 63h, 69h
db 65h, 6Eh, 74h, 20h, 6Dh, 65h, 6Dh, 6Fh
db 72h, 79h, 29h, 0, 21h, 0, 44h, 50h, 4Dh
db 49h, 20h, 68h, 6Fh, 73h, 74h, 20h, 65h
db 2 dup(72h), 6Fh, 72h, 20h, 28h, 6Eh, 2 dup(65h)
db 64h, 20h, 36h, 34h, 4Bh, 20h, 58h, 4Dh
db 53h, 29h, 0, 22h, 0, 44h, 50h, 4Dh, 49h
db 20h, 68h, 6Fh, 73h, 74h, 20h, 65h, 2 dup(72h)
db 6Fh, 72h, 20h, 28h, 63h, 61h, 2 dup(6Eh)
db 6Fh, 74h, 20h, 6Ch, 6Fh, 63h, 6Bh, 20h
db 73h, 74h, 61h, 63h, 6Bh, 29h, 0, 24h
db 0, 54h, 68h, 65h, 20h, 44h, 4Fh, 53h
db 31h, 36h, 4Dh, 2Eh, 33h, 38h, 36h, 20h
db 76h, 69h, 72h, 74h, 75h, 61h, 6Ch, 20h
db 64h, 65h, 76h, 69h, 63h, 65h, 20h, 64h
db 72h, 69h, 76h, 65h, 72h, 20h, 77h, 61h
db 73h, 20h, 6Eh, 65h, 76h, 65h, 72h, 20h
db 6Ch, 6Fh, 61h, 64h, 65h, 64h, 0, 25h
db 0, 55h, 6Eh, 61h, 62h, 6Ch, 65h, 20h
db 74h, 6Fh, 20h, 72h, 65h, 73h, 65h, 72h
db 76h, 65h, 20h, 73h, 65h, 6Ch, 65h, 63h
db 74h, 6Fh, 72h, 73h, 20h, 66h, 6Fh, 72h
db 20h, 44h, 4Fh, 53h, 31h, 36h, 4Dh, 2Eh
db 33h, 38h, 36h, 20h, 57h, 69h, 6Eh, 64h
db 6Fh, 77h, 73h, 20h, 64h, 72h, 69h, 76h
db 65h, 72h, 0, 26h, 0, 43h, 61h, 2 dup(6Eh)
db 6Fh, 74h, 20h, 75h, 73h, 65h, 20h, 65h
db 78h, 74h, 65h, 6Eh, 64h, 65h, 64h, 20h
db 6Dh, 65h, 6Dh, 6Fh, 72h, 79h, 3Ah, 20h
db 48h, 49h, 4Dh, 45h, 4Dh, 2Eh, 53h, 59h
db 53h, 20h, 6Eh, 6Fh, 74h, 20h, 76h, 65h
db 72h, 73h, 69h, 6Fh, 6Eh, 20h, 32h, 0
db 27h, 0, 41h, 6Eh, 20h, 6Fh, 62h, 73h
db 6Fh, 6Ch, 65h, 74h, 65h, 20h, 76h, 65h
db 72h, 73h, 69h, 6Fh, 6Eh, 20h, 6Fh, 66h
db 20h, 44h, 4Fh, 53h, 31h, 36h, 4Dh, 2Eh
db 33h, 38h, 36h, 20h, 77h, 61h, 73h, 20h
db 6Ch, 6Fh, 61h, 64h, 65h, 64h, 0, 28h
db 0, 6Eh, 6Fh, 74h, 20h, 65h, 6Eh, 6Fh
db 75h, 67h, 68h, 20h, 61h, 76h, 61h, 69h
db 6Ch, 61h, 62h, 6Ch, 65h, 20h, 65h, 78h
db 74h, 65h, 6Eh, 64h, 65h, 64h, 20h, 6Dh
db 65h, 6Dh, 6Fh, 72h, 79h, 20h, 28h, 58h
db 4Dh, 49h, 4Eh, 29h, 0, 2 dup(0FFh), 4 dup(0)
seg001 ends


; Segment type: Pure code
seg002 segment byte public 'CODE' use16
assume cs:seg002
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing
seg_11BD0 dw seg seg000
db 46h, 2, 66h, 0CFh, 2 dup(0), 2 dup(0FFh)
db 2 dup(0)
dword_11BDC dd 0
pushf
mov     cx, ss
mov     dx, sp
mov     ss, cs:seg_11BD0
assume ss:seg000
mov     sp, word ptr ss:byte_10F4C+4
push    cx
push    dx
call    sub_11C38
mov     ax, ds:10C2h
mov     dx, ds:10C4h
pop     cx
pop     ss
assume ss:nothing
mov     sp, cx
push    dx
push    ax
iret

loc_11C02:
pop     cx
push    ss
db 1Fh
cmp     byte ptr ds:2Eh, 0
jz      short loc_11C30
call    sub_11C38
cmp     byte ptr ds:10EFh, 0
jz      short loc_11C30
xor     ax, ax
sub     al, ds:37h
sbb     ah, ah
and     ah, 2
cmp     byte ptr ds:2Eh, 2
jz      short loc_11C33

loc_11C28:
or      ah, 0DDh
cli
call    sub_127A1
sti

loc_11C30:
call    sub_13FF0

loc_11C33:
call    sub_12793
jmp     short loc_11C30



sub_11C38 proc near
cld
push    ss
pop     ds
inc     byte ptr ds:9F8h
jnz     short loc_11CA2
push    0F8Ah
call    sub_12E68
pop     cx
push    es
xor     di, di
mov     cx, 200h
mov     ax, cs
mov     bx, ds:56h
mov     dx, ds:58h

loc_11C58:
jcxz    short loc_11C7E
repne scasw
jnz     short loc_11C7E
test    di, 2
jnz     short loc_11C58
cmp     word ptr es:[di-4], 12CCh
jz      short loc_11C58
cmp     word ptr es:[di-4], 14D8h
jz      short loc_11C58
mov     es:[di-4], bx
mov     es:[di-2], dx
jmp     short loc_11C58

loc_11C7E:
pop     es
cmp     byte ptr ds:0CD8h, 0
jnz     short loc_11C8D
inc     byte ptr ds:0CD8h
call    sub_13011

loc_11C8D:
cmp     word ptr ds:0A14h, 0
jz      short loc_11C97
call    sub_13294

loc_11C97:
cli
call    sub_11D3C
sti
call    sub_136CF
call    sub_12F7D

loc_11CA2:
cmp     byte ptr ds:2Eh, 0Bh
jnz     short loc_11CAE
call    sub_147AF
jmp     short loc_11CE2

loc_11CAE:
test    byte ptr ds:47h, 80h
jz      short loc_11CC8
mov     ax, 0BFDEh
mov     bx, 0Ah
call    near ptr byte_12AC4
or      ax, ax
jl      short loc_11CC8
mov     word ptr ds:0ADCh, 0

loc_11CC8:
cmp     byte ptr ds:2Eh, 2
jle     short loc_11CE2
test    byte ptr ds:47h, 1
jz      short loc_11CE2
cli
mov     al, 0Fh
out     70h, al         ; CMOS Memory/RTC Index Register:
                        ; shutdown status byte
jmp     short $+2

loc_11CDD:
xor     al, al
out     71h, al         ; CMOS Memory/RTC Data Register
sti

loc_11CE2:
call    sub_139BC
mov     es, word ptr ds:0CEAh
mov     ax, ds:9B8h
mov     es:2Ch, ax
push    es
push    word ptr ds:120Ah
call    sub_138D6
pop     cx
xor     bx, bx
mov     es, bx
assume es:nothing
test    byte ptr ds:47h, 80h
jz      short loc_11D0F
mov     ax, 0BFDEh
mov     bx, 15h
mov     cx, 5
int     15h

loc_11D0F:
pop     es
assume es:nothing

loc_11D10:
cmp     word ptr es:0Ah, 10h
jnz     short loc_11D30
mov     ax, cs
cmp     es:0Ch, ax
jnz     short loc_11D30
mov     ax, ds:10C2h
mov     es:0Ah, ax
mov     ax, ds:10C4h
mov     es:0Ch, ax

loc_11D30:
cmp     byte ptr ds:2Fh, 3
jb      short locret_11D3B
mov     eax, ds:10F2h

locret_11D3B:
retn
sub_11C38 endp



; Attributes: noreturn

sub_11D3C proc near
xor     bx, bx
mov     dx, 0
mov     cx, 100h
xor     ax, ax

loc_11D46:
mov     [bx+0C6h], ax
mov     word ptr [bx+0C4h], 8E00h
mov     word ptr [bx+0C2h], 70h ; 'p'
mov     [bx+0C0h], dx
add     dx, 4
add     bx, 8
loop    loc_11D46
mov     cx, 11h
mov     dx, 41F1h
xor     bx, bx

loc_11D6A:
mov     [bx+0C0h], dx
add     dx, 1Ch
add     bx, 8
loop    loc_11D6A
mov     word ptr ds:128h, 1F96h
mov     word ptr ds:1B8h, 84h
mov     word ptr ds:1C0h, 0C80h
mov     word ptr ds:1C2h, 18h
mov     word ptr ds:1C8h, 0C9Eh
mov     word ptr ds:1D8h, 5EBh
mov     word ptr ds:248h, 448Eh
cmp     byte ptr ds:2Eh, 0Bh
jnz     short loc_11DB4
mov     word ptr ds:3F8h, 2C6Fh
mov     word ptr ds:3FAh, 18h

loc_11DB4:
call    sub_13C41
sub_11D3C endp

test    byte ptr ds:47h, 1
jz      short loc_11DE6
mov     word ptr ds:170h, 4FAh
mov     word ptr ds:1B0h, 0C7Ch
mov     word ptr ds:1B2h, 18h
mov     bl, ds:51h
or      bl, bl
jz      short loc_11DE6
add     bl, 5
xor     bh, bh
shl     bx, 3
mov     word ptr [bx+0C0h], 556h

loc_11DE6:
cmp     byte ptr ds:3Eh, 0
jz      short locret_11E15
fninit
mov     bx, ds:0F82h
or      bx, bx
jz      short loc_11DF9
fnsave  byte ptr [bx]

loc_11DF9:
mov     byte ptr cs:sub_124FC, 9Bh
mov     byte ptr cs:sub_12501, 9Bh
mov     al, ds:2Eh
or      al, al
jz      short loc_11E12
cmp     al, 0Bh
jz      short loc_11E12
clts

loc_11E12:
fsetpm

locret_11E15:
retn



sub_11E16 proc near
call    sub_128E5
call    word ptr ds:97Ah
call    sub_128DC
retn
sub_11E16 endp

; START OF FUNCTION CHUNK FOR sub_1286F
;   ADDITIONAL PARENT FUNCTION sub_17E2F

loc_11E21:
call    sub_11E16
mov     sp, ds:996h
mov     bp, sp
mov     di, [bp+0Eh]
mov     word ptr cs:dword_11BDC, di
mov     ax, [bp+2]
mov     word ptr cs:dword_11BDC+2, ax
call    sub_11E60
lea     si, [bp+1Eh]
cld
les     di, cs:dword_11BDC
movsd
movsd
movsd
pop     word ptr ds:996h
inc     sp
inc     sp
pop     ds
pop     es
popa
mov     ss, word ptr cs:dword_11BDC+2
mov     sp, word ptr cs:dword_11BDC
iretd
; END OF FUNCTION CHUNK FOR sub_1286F



sub_11E60 proc near
mov     dx, 20h ; ' '
sub_11E60 endp




sub_11E63 proc near
pusha
call    word ptr ds:9C0h
mov     ss, dx
assume ss:nothing
mov     dx, 20h ; ' '
mov     ds, dx
assume ds:nothing
mov     es, dx
assume es:nothing
mov     ax, 68h ; 'h'
lldt    ax
smsw    ax
or      ax, ds:40h
lmsw    ax
jmp     word ptr ds:9C2h
sub_11E63 endp


loc_11E85:
popa
retn
db 60h, 0FFh, 16h, 0C0h, 9, 0B8h, 20h, 0
db 8Eh, 0D8h, 8Eh, 0C0h, 0Fh, 1, 0E0h, 0Bh
db 6, 40h, 0, 0Fh, 1, 0F0h, 8Bh, 36h, 52h
db 0Fh, 83h, 0E6h, 38h, 3, 36h, 54h, 0Fh
db 83h, 6, 52h, 0Fh, 8, 0B8h, 8, 0, 8Eh
db 0D8h, 89h, 7Ch, 2, 88h, 54h, 4, 32h, 0F6h
db 88h, 74h, 7, 8Eh, 0D6h, 0B8h, 68h, 0
db 0Fh, 0, 0D0h, 6, 1Fh, 61h, 0C3h, 90h
db 2 dup(0), 2Eh, 8Fh, 6, 0FAh, 2, 0FAh
db 9Ch, 58h, 80h, 0E4h, 0Fh, 50h, 0Eh, 0E8h
db 0B4h, 0Eh, 0E8h, 0FEh, 8, 88h, 0Eh, 35h
db 0, 0B8h, 34h, 3, 0FFh, 16h, 0BAh, 9, 0Fh
db 1, 0E0h, 0Ch, 1
byte_11EEF db 3Eh
db 0Fh, 1, 16h, 74h, 9, 0Fh, 1, 1Eh, 0D0h
db 8, 0Fh, 1, 0F0h, 0EAh, 34h, 3, 18h, 0
db 87h, 0DBh, 0E9h, 31h, 26h, 2Eh, 0FFh
db 26h, 0FAh, 2, 57h, 0BFh, 56h, 0Fh, 0BEh
db 67h, 4, 33h, 0DBh, 8Eh, 0DBh, 0BBh
dw seg seg000
mov     es, bx
assume es:nothing
movsw
movsw
mov     [si-4], ax
mov     [si-2], cx
mov     si, 3E0h
mov     cx, 10h
rep movsw
mov     ds, bx
assume ds:nothing
pop     di
retn



sub_11F30 proc near
xor     bx, bx
mov     es, bx
assume es:nothing
mov     bx, seg seg000
mov     ds, bx
assume ds:seg000
mov     si, 0F56h
mov     di, 467h
cld
movsw
movsw
mov     di, 3E0h
mov     cx, 10h
rep movsw
mov     es, bx
assume es:seg000
retn
sub_11F30 endp

cmp     [bx+di], cl
cmp     ax, 0B009h
push    cs
out     37h, al
xor     ax, ax
out     0F2h, al
mov     cx, word ptr byte_10010
nop

loc_11F5E:
loop    loc_11F5E
mov     es, ax
assume es:nothing
mov     word ptr es:406h, ds
mov     word ptr es:404h, 9EFh
mov     al, 0Ah
out     37h, al
retn
db 0D7h, 9, 0DCh, 9, 33h, 0C0h, 8Eh, 0C0h
db 26h, 0C7h, 6, 0FCh, 3, 94h, 0Bh, 26h
db 8Ch, 0Eh, 0FEh, 3, 8Bh, 1Eh, 82h, 0Fh
db 0Bh, 0DBh, 74h, 4, 9Bh, 0DDh, 27h, 9Bh
db 0Fh, 1, 0E0h, 0Bh, 6, 40h, 0, 0Fh, 1
db 0F0h, 0B0h, 0A0h, 0E6h, 20h, 0C3h, 0Eh
db 4, 13h, 4, 33h, 0C0h, 8Eh, 0C0h, 26h
db 0C7h, 6, 60h, 1, 94h, 0Bh, 26h, 8Ch, 0Eh
db 62h, 1, 0Fh, 1, 0E0h, 0Bh, 6, 40h, 0
db 0Fh, 1, 0F0h, 0E4h, 0F2h, 24h, 0FEh, 0EBh
db 0, 0E6h, 0F2h, 80h, 3Eh, 2Fh, 0, 3, 72h
db 0Eh, 9Ch, 0FAh, 52h, 0BAh, 40h, 1, 0B0h
db 1, 0EEh, 0FEh, 0C8h, 0EEh, 5Ah, 9Dh, 0C3h
db 50h, 53h, 0BBh
dw seg seg000
db 0FAh, 80h, 3Eh, 2Fh, 0, 3, 72h, 3, 0E9h
db 1Eh, 24h, 60h, 89h, 1Eh, 7Ch, 0Fh, 89h
db 26h, 7Ah, 0Fh, 0B8h, 38h, 0, 8Eh, 0C0h
db 26h, 0C7h, 6, 60h, 1, 43h, 4, 0A1h, 0B6h
db 9, 26h, 0A3h, 62h, 1, 0E4h, 0F0h, 0Ch
db 1, 0EBh, 0, 0E6h, 0F0h, 0F4h, 0E4h, 0F2h
db 0Ch, 1, 0EBh, 0, 0E6h, 0F2h, 0BBh
dw seg seg000
mov     ds, bx
assume ds:nothing
mov     ss, word ptr ds:0F7Ch
assume ss:nothing
mov     sp, ds:0F7Ah
mov     es, bx
assume es:nothing
popa
pop     bx
pop     ax
retn
db 91h, 4, 96h, 4, 33h, 0C0h, 8Eh, 0C0h
db 26h, 0C7h, 6, 0FCh, 3, 94h, 0Bh, 26h
db 8Ch, 0Eh, 0FEh, 3, 0Fh, 1, 0E0h, 0Bh
db 6, 40h, 0, 0Fh, 1, 0F0h, 52h, 0BAh, 2 dup(4)
db 0ECh, 24h, 0FBh, 0Ch, 2, 0EBh, 0, 0EEh
db 5Ah, 8Bh, 0Eh, 10h, 0, 90h, 0E2h, 0FEh
db 0C3h, 50h, 53h, 0BBh
dw seg seg000
db 0FAh, 80h, 3Eh, 2Fh, 0, 3, 72h, 3, 0E9h
db 9Bh, 23h, 60h, 89h, 1Eh, 7Ch, 0Fh, 89h
db 26h, 7Ah, 0Fh, 0FAh, 0B8h, 38h, 0, 8Eh
db 0C0h, 26h, 0C7h, 6, 0FCh, 3, 0D3h, 4
db 0A1h, 0B6h, 9, 26h, 0A3h, 0FEh, 3, 0BAh
db 84h, 4, 0EDh, 0EBh, 0, 25h, 2 dup(0FEh)
db 0EFh, 0EBh, 0, 0BAh, 2 dup(4), 0B0h, 4
db 0EBh, 0, 0EEh, 0F4h, 0BAh, 2 dup(4), 0ECh
db 24h, 0F9h, 0Ch, 1, 0EBh, 0, 0EEh, 0EBh
db 0, 0BBh
dw seg seg000
mov     ds, bx
mov     ss, word ptr ds:0F7Ch
mov     sp, ds:0F7Ah
mov     es, bx
popa
pop     bx
pop     ax
retn
db 0AFh, 5, 0B4h, 5, 52h, 0B0h, 1Fh, 0E6h
db 0A1h, 33h, 0C0h, 8Eh, 0C0h, 0FAh, 8Ch
db 0C9h, 0BAh, 68h, 3, 0B0h, 18h, 0EEh, 0EBh
db 0, 0B2h, 6Ah, 8Ah, 0C1h, 24h, 0Fh, 0EEh
db 0EBh, 0, 0B2h, 68h, 0B0h, 17h, 0EEh, 0EBh
db 0, 8Ah, 0C1h, 0C0h, 0E8h, 4, 0B2h, 6Ah
db 24h, 0Fh, 0EEh, 0EBh, 0, 0B2h, 68h, 0B0h
db 16h, 0EEh, 0EBh, 0, 8Ah, 0C5h, 0B2h, 6Ah
db 24h, 0Fh, 0EEh, 0EBh, 0, 0B2h, 68h, 0B0h
db 15h, 0EEh, 0EBh, 0, 8Ah, 0C5h, 0B2h, 6Ah
db 0C0h, 0E8h, 4, 24h, 0Fh, 0EEh, 0EBh, 0
db 0B9h, 0ABh, 5, 0B2h, 68h, 0B0h, 14h, 0EEh
db 0EBh, 0, 8Ah, 0C1h, 0B2h, 6Ah, 24h, 0Fh
db 0EEh, 0EBh, 0, 0B2h, 68h, 0B0h, 13h, 0EEh
db 0EBh, 0, 8Ah, 0C1h, 0C0h, 0E8h, 4, 0B2h
db 6Ah, 24h, 0Fh, 0EEh, 0B2h, 68h, 0B0h
db 12h, 0EEh, 0EBh, 0, 8Ah, 0C5h, 0B2h, 6Ah
db 24h, 0Fh, 0EEh, 0EBh, 0, 0B2h, 68h, 0B0h
db 11h, 0EEh, 0EBh, 0, 8Ah, 0C5h, 0C0h, 0E8h
db 4, 0B2h, 6Ah, 24h, 0Fh, 0EEh, 0EBh, 0
db 0B2h, 68h, 0B0h, 10h, 0EEh, 0EBh, 0, 0B0h
db 8, 0B2h, 6Ah, 0EEh, 0EBh, 0, 0Fh, 1, 0E0h
db 0Bh, 6, 40h, 0, 0Fh, 1, 0F0h, 5Ah, 0C3h
db 94h, 0Bh
dw seg seg002
db 50h, 53h, 0BBh
dw seg seg000
db 0FAh, 60h, 52h, 89h, 1Eh, 7Ch, 0Fh, 89h
db 26h, 7Ah, 0Fh, 0A1h, 0B6h, 9, 50h, 0B8h
db 65h, 6, 50h, 8Bh, 0CBh, 0BAh, 68h, 3
db 0B0h, 18h, 0EEh, 0EBh, 0, 0B2h, 6Ah, 8Ah
db 0C1h, 24h, 0Fh, 0EEh, 0EBh, 0, 0B2h, 68h
db 0B0h, 17h, 0EEh, 0EBh, 0, 8Ah, 0C1h, 0C0h
db 0E8h, 4, 0B2h, 6Ah, 24h, 0Fh, 0EEh, 0EBh
db 0, 0B2h, 68h, 0B0h, 16h, 0EEh, 0EBh, 0
db 8Ah, 0C5h, 0B2h, 6Ah, 24h, 0Fh, 0EEh
db 0EBh, 0, 0B2h, 68h, 0B0h, 15h, 0EEh, 0EBh
db 0, 8Ah, 0C5h, 0B2h, 6Ah, 0C0h, 0E8h, 4
db 24h, 0Fh, 0EEh, 0EBh, 0, 8Bh, 0CCh, 0B2h
db 68h, 0B0h, 14h, 0EEh, 0EBh, 0, 8Ah, 0C1h
db 0B2h, 6Ah, 24h, 0Fh, 0EEh, 0EBh, 0, 0B2h
db 68h, 0B0h, 13h, 0EEh, 0EBh, 0, 8Ah, 0C1h
db 0C0h, 0E8h, 4, 0B2h, 6Ah, 24h, 0Fh, 0EEh
db 0B2h, 68h, 0B0h, 12h, 0EEh, 0EBh, 0, 8Ah
db 0C5h, 0B2h, 6Ah, 24h, 0Fh, 0EEh, 0EBh
db 0, 0B2h, 68h, 0B0h, 11h, 0EEh, 0EBh, 0
db 8Ah, 0C5h, 0C0h, 0E8h, 4, 0B2h, 6Ah, 24h
db 0Fh, 0EEh, 0EBh, 0, 0B2h, 68h, 0B0h, 10h
db 0EEh, 0B0h, 8, 0B2h, 6Ah, 0EEh, 0B0h
db 5Fh, 0E6h, 0A1h, 0F4h, 0B0h, 0F0h, 0E6h
db 0A0h, 0BBh
dw seg seg000
mov     ds, bx
mov     es, bx
pop     dx
popa
pop     bx
pop     ax
retn
xchg    ax, di
push    es
pushf
push    es
push    dx
mov     ah, 80h
call    sub_122CC
pop     dx
xor     ax, ax
mov     es, ax
assume es:nothing
mov     word ptr es:467h, offset loc_12764
mov     word ptr es:469h, cs
mov     byte ptr es:412h, 0Ah
retn
push    ax
push    bx
mov     bx, seg seg000
cli
pusha
mov     ds:0F7Ch, bx
mov     ds:0F7Ah, sp
mov     ax, 38h ; '8'
mov     es, ax
assume es:nothing
mov     ax, ds:9B6h
mov     es:469h, ax
mov     word ptr es:467h, 6CAh
mov     byte ptr es:412h, 0Ah

loc_1228F:
mov     ah, 0C0h
call    sub_122CC
xor     cx, cx

loc_12296:
loop    loc_12296
jmp     short loc_1228F
mov     bx, cs:seg_11BD0
mov     ds, bx
assume ds:seg000
mov     ss, word ptr byte_10F7C
assume ss:nothing
mov     sp, word_10F7A
xor     ax, ax
mov     es, ax
assume es:nothing
mov     es:412h, al
mov     es, bx
assume es:seg000
call    sub_122CC
in      al, 69h
jmp     short $+2

loc_122BA:
or      al, 4
out     69h, al
jmp     short $+2

loc_122C0:              ; PIC 2  same as 0020 for PIC 1
in      al, 0A0h
jmp     short $+2

loc_122C4:
or      al, 80h
out     0A0h, al        ; PIC 2  same as 0020 for PIC 1
popa
pop     bx
pop     ax
retn



sub_122CC proc near
mov     dx, 0FC87h
in      al, dx
jmp     short $+2

loc_122D2:
mov     dl, 84h
in      al, dx
jmp     short $+2

loc_122D7:
and     al, 3Fh
or      ah, al
mov     dl, 87h
in      al, dx
jmp     short $+2

loc_122E0:
mov     al, ah
mov     dl, 84h
out     dx, al
retn
sub_122CC endp

pop     si
or      ah, [bp+di+0Ah]
push    dx
mov     dx, 3F20h
mov     al, 90h
out     dx, al
pop     dx
xor     ax, ax
mov     es, ax
assume es:nothing
mov     word ptr es:4A2h, offset loc_12764
mov     word ptr es:4A4h, cs
retn



sub_12303 proc near
out     22h, al
mov     ah, al
jmp     short $+2

loc_12309:
in      al, 23h
retn
sub_12303 endp




sub_1230C proc near
out     22h, al
xchg    al, ah
jmp     short $+2

loc_12312:
out     23h, al
retn
sub_1230C endp

outsw
pop     es
assume es:nothing
jz      short loc_12320
mov     cx, word ptr byte_10010
nop

loc_1231E:
loop    loc_1231E

loc_12320:
mov     al, 45h ; 'E'
call    sub_12303
and     al, 3Fh
xchg    al, ah
call    sub_1230C
xor     ax, ax
mov     es, ax
assume es:nothing
mov     word ptr es:467h, offset loc_12764
mov     word ptr es:469h, cs
jmp     loc_124EE
push    ax
push    bx
mov     bx, seg seg000
cli
in      al, 66h
pusha
test    al, 0A0h
jnz     short loc_12350
or      al, 0A0h
out     66h, al

loc_12350:
mov     word ptr byte_10F7C, bx
mov     word_10F7A, sp
push    38h ; '8'
pop     es
assume es:nothing
mov     word ptr es:467h, 7B9h
mov     ax, seg_109B6
mov     es:469h, ax
mov     ax, 144h
call    sub_1230C
jmp     short $+2

loc_12371:
jmp     short $+2

loc_12373:
jmp     short $+2

loc_12375:
mov     ax, 44h ; 'D'
call    sub_1230C
mov     al, 45h ; 'E'
call    sub_12303
or      al, 80h
xchg    al, ah
call    sub_1230C

loc_12387:
jmp     short loc_12387
mov     ax, seg seg000
mov     ds, ax
mov     es, ax
assume es:seg000
mov     ss, word ptr byte_10F7C
assume ss:nothing
mov     sp, word_10F7A
popa
test    al, 0A0h
jnz     short loc_1239F
out     66h, al

loc_1239F:
mov     al, 45h ; 'E'
call    sub_12303
and     al, 3Fh
cmp     byte_10035, 0
jnz     short loc_123AF
or      al, 40h

loc_123AF:
xchg    al, ah
call    sub_1230C
pop     bx
pop     ax
retn
db 50h, 53h, 0BBh
dw seg seg000
db 0FAh, 0E4h, 21h, 60h, 33h, 0C0h, 0E6h
db 43h, 8Bh, 16h, 0B6h, 9, 33h, 0C9h, 0B0h
db 0Bh, 0E6h, 20h, 6Ah, 38h, 0E4h, 40h, 2Ah
db 0C8h, 1Fh, 0E4h, 40h, 1Ah, 0E8h, 9Ch
db 0E4h, 20h, 0A8h, 1, 74h, 4, 0B0h, 20h
db 0E6h, 20h, 9Dh, 0FFh, 36h, 22h, 0, 0FFh
db 36h, 20h, 0, 0B0h, 0FEh, 0E6h, 21h, 0B0h
db 10h, 0E6h, 43h, 89h, 16h, 22h, 0, 0C7h
db 6, 20h, 0, 52h, 8, 0E6h, 40h, 89h, 1Eh
db 69h, 4, 89h, 26h, 67h, 4, 6Ah, 20h, 0B0h
db 34h, 0E6h, 43h, 1Fh, 33h, 0C0h, 0E6h
db 40h, 29h, 0Eh, 0C6h, 9, 83h, 1Eh, 0C8h
db 9, 0, 0E6h, 40h, 0E9h, 83h, 2, 0FAh, 83h
db 0C4h, 6, 33h, 0C0h, 8Eh, 0D8h, 8Fh, 6
db 20h, 0, 8Fh, 6, 22h, 0, 0E8h, 0FBh, 0FAh
db 86h, 6, 0CCh, 9, 3Ch, 8, 74h, 24h, 0Ah
db 0C0h, 74h, 1Ch, 33h, 0C0h, 39h, 6, 0C8h
db 9, 7Dh, 14h, 3Ch, 21h, 74h, 8, 0F7h, 6
db 0CAh, 9, 0, 2, 74h, 8, 0FFh, 6, 0C8h
db 9, 0CDh, 8, 0EBh, 4, 0B0h, 20h, 0E6h
db 20h, 61h, 0E6h, 21h, 0C7h, 6, 0D0h, 8
db 0FFh, 7, 81h, 3Eh, 35h, 2 dup(0), 80h
db 75h, 3, 0E8h, 56h, 3, 5Bh, 58h, 0C3h
db 0E7h, 7, 0ECh, 7, 0EBh, 4, 9Fh, 0Ah, 0A4h
db 0Ah, 80h, 3Eh, 35h, 2 dup(0), 75h, 9
db 0E8h, 2Dh, 3, 8Bh, 0Eh, 10h, 0, 0E2h
db 0FEh, 0B8h, 0DBh, 9, 8Ch, 0D9h, 0E8h
db 72h, 0FAh, 0B0h, 0Fh, 0E6h, 70h, 0EBh
db 0, 0A0h, 0EEh, 10h, 0E6h, 71h, 0C3h, 9Bh
db 9, 0A0h, 9, 80h, 3Eh, 2Fh, 0, 3, 72h
db 14h, 8Ch, 0E8h, 0A3h, 66h, 0Dh, 8Ch, 0E0h
db 0A3h, 64h, 0Dh, 0A1h, 60h, 0Dh, 8Eh, 0E0h
db 0A1h, 62h, 0Dh, 8Eh, 0E8h, 0E4h, 92h
db 0Ch, 2, 24h, 0FEh, 0EBh, 0, 0E6h, 92h
db 0EBh, 1Dh, 0E2h, 0Ah, 0E7h, 0Ah, 80h
db 3Eh, 35h, 2 dup(0), 75h, 0Ah, 0E8h, 0DAh
db 2, 8Bh, 0Eh, 10h, 0, 90h, 0E2h, 0FEh
db 0B8h, 94h, 0Bh, 8Ch, 0C9h, 0E8h, 1Eh
db 0FAh

loc_124EE:
mov     al, 0Fh
out     70h, al         ; CMOS Memory/RTC Index Register:
                        ; shutdown status byte
jmp     short $+2

loc_124F4:
mov     al, 0Ah
out     71h, al         ; CMOS Memory/RTC Data Register
retn



sub_124F9 proc near
push    20h ; ' '
pop     ds
sub_124F9 endp

assume ds:nothing



sub_124FC proc near
nop
jmp     word ptr ds:9BCh
sub_124FC endp




sub_12501 proc near
nop
push    ax
push    bx
jmp     word ptr ds:9BEh
sub_12501 endp

db 50h, 53h, 0BBh
dw seg seg000
db 0FAh, 80h, 3Eh, 2Fh, 0, 3, 72h, 3, 0E9h
db 0F4h, 1Eh, 0B0h, 0Eh, 0E6h, 37h, 0B8h
dw seg seg000
db 2 dup(50h), 60h, 0FFh, 36h, 0B6h, 9, 68h
db 7Bh, 9, 0B0h, 0Ah, 0E6h, 37h, 0B8h, 38h
db 0, 8Eh, 0D8h, 89h, 1Eh, 6, 4, 89h, 26h
db 2 dup(4), 0BEh, 78h, 9, 0B9h, 3, 0, 0FCh
db 0BAh, 0F0h, 0, 0F3h, 0F0h, 2Eh, 6Eh, 3 dup(0)
db 0B0h, 0Fh, 0E6h, 37h, 0EBh
byte_12550 db 0
out     52h, al
cmp     word ptr ds:35h, 8000h
jz      short loc_12561
mov     al, 0
out     0F2h, al
jmp     short loc_12565

loc_12561:
mov     al, 3
out     0F6h, al

loc_12565:
popa
pop     es
assume es:nothing
pop     ds
assume ds:nothing
pop     bx
pop     ax
retn
db 50h, 53h, 0BBh
dw seg seg000
byte_12570 db 0FAh, 60h, 89h, 1Eh, 7Ch, 0Fh, 89h, 26h
db 7Ah, 0Fh, 0B8h, 38h, 0, 8Eh, 0C0h, 0A1h
db 0B6h, 9, 26h, 0A3h, 69h, 4, 26h, 0C7h
db 6, 67h, 4, 6Eh, 0Bh, 0F6h, 6, 0Ch, 12h
db 2, 74h, 0Bh, 0E4h, 92h, 0Ch, 3, 0EBh
db 0, 0E6h, 92h, 0F4h, 0EBh, 0FDh, 0B0h
db 0FEh, 0E6h, 64h, 0F4h, 0E9h, 65h, 1Eh
db 50h, 53h, 0BBh
dw seg seg000
db 0FAh, 80h, 3Eh, 2Fh, 0, 3, 73h, 0F0h
db 53h, 8Bh, 1Eh, 82h, 0Fh, 0Bh, 0DBh, 74h
db 3, 0DDh, 37h, 9Bh, 5Bh, 60h, 0B8h
dw seg seg000
db 2 dup(50h), 0B8h, 38h, 0, 8Eh, 0C0h, 26h
db 0C7h, 6, 0FCh, 3, 35h, 0Ah, 0A1h, 0B6h
db 9, 26h, 0A3h, 0FEh, 3, 0E4h, 2, 8Ah, 0C8h
db 0E4h, 12h, 8Ah, 0E8h, 0B0h, 0FBh, 0E6h
db 12h, 0B0h, 0FFh, 0E6h, 2, 0B0h, 1, 0BAh
db 0B0h, 31h, 0EEh, 0E4h, 60h, 0C0h, 0E8h
db 2, 24h, 7, 60h, 89h, 1Eh, 7Ch, 0Fh, 89h
db 26h, 7Ah, 0Fh, 0B0h, 9, 0E6h, 20h, 0F4h
db 0B0h, 80h, 0E6h, 20h, 0BBh
dw seg seg000
mov     ds, bx
mov     ss, word ptr ds:0F7Ch
mov     sp, ds:0F7Ah
popa
out     60h, al         ; 8042 keyboard controller data register.
cli
mov     al, ch
out     12h, al
mov     al, cl
out     2, al           ; DMA controller, 8237A-5.
                        ; channel 1 base address
                        ; (also sets current address)
xor     al, al
mov     dx, 31B0h
out     dx, al
pop     es
pop     ds
popa
pop     bx
pop     ax
retn
push    ax
push    bx
mov     bx, seg seg000
cli
pusha
mov     ax, 38h ; '8'
mov     es, ax
assume es:nothing
mov     word ptr es:4A2h, 0A86h
mov     ax, ds:9B6h
mov     es:4A4h, ax
mov     ds:0F7Ch, bx
mov     ds:0F7Ah, sp
mov     dx, 3F00h
in      ax, dx

loc_12654:
jmp     short loc_12654
mov     ax, seg seg000
mov     ds, ax
assume ds:seg000
mov     es, ax
assume es:seg000
mov     ss, word ptr byte_10F7C
mov     sp, word_10F7A
mov     dx, 3F20h
mov     al, 0
out     dx, al
popa
pop     bx
pop     ax
retn
db 50h, 53h, 0BBh
dw seg seg000
db 0FAh, 0E4h, 21h, 60h, 9Ch, 0FFh, 36h
db 0B6h, 9, 68h, 3Fh, 0Bh, 2Bh, 26h, 0C4h
db 9, 0B0h, 0FFh, 0E6h, 21h, 0B8h, 38h, 0
db 8Eh, 0C0h, 26h, 89h, 1Eh, 69h, 4, 26h
db 89h, 26h, 67h, 4, 80h, 3Eh, 0D0h, 0Eh
db 0, 75h, 7, 0B0h, 0FEh, 0E6h, 64h, 0F4h
db 0EBh, 0FDh, 0C7h, 6, 0D0h, 8, 2 dup(0)
db 0Fh, 1, 1Eh, 0D0h, 8, 0CDh, 0FFh, 50h
db 53h, 0BBh
dw seg seg000
db 0FAh, 0E4h, 21h, 60h, 89h, 1Eh, 7Ch, 0Fh
db 89h, 26h, 7Ah, 0Fh, 0B8h, 38h, 0, 8Eh
db 0C0h, 0A1h, 0B6h, 9, 26h, 0A3h, 69h, 4
db 26h, 0C7h, 6, 67h, 4, 14h, 0Bh, 80h, 3Eh
db 0D0h, 0Eh, 0, 75h, 0C8h, 0B0h, 0FEh, 0E6h
db 64h, 0F4h, 0EBh, 0FDh, 0B8h
dw seg seg000
mov     ds, ax
assume ds:nothing
mov     ss, word ptr ds:0F7Ch
mov     sp, ds:0F7Ah
call    sub_11F30
mov     al, 0Dh
out     70h, al         ; CMOS Memory/RTC Index Register:
                        ; RTC Register D
popa
out     21h, al         ; Interrupt controller, 8259A.
mov     word ptr ds:8D0h, 7FFh
cmp     word ptr ds:35h, 8000h
jz      short loc_1270C
pop     bx
pop     ax
retn

loc_1270C:
jmp     loc_144BB
cli
call    sub_11F30
popa
out     21h, al         ; Interrupt controller, 8259A.
mov     word ptr ds:8D0h, 7FFh
cmp     byte ptr ds:35h, 0
jnz     short loc_12730
cmp     byte ptr ds:3Fh, 0
jz      short loc_1272D
call    sub_127B3

loc_1272D:
pop     bx
pop     ax
retn

loc_12730:
push    cx
mov     cx, ds:10h
nop

loc_12736:
loop    loc_12736
call    sub_127B9
pop     cx
jmp     short loc_1272D
mov     ax, seg seg000
mov     ds, ax
assume ds:seg000
mov     ss, word ptr byte_10F7C
mov     sp, word_10F7A
mov     al, 0Dh
out     70h, al         ; CMOS Memory/RTC Index Register:
                        ; RTC Register D
popa
in      al, 71h         ; CMOS Memory/RTC Data Register
cmp     byte_10035, 0
in      al, 92h         ; PS/2 System Control Port A
                        ; 1: A20 address line (1=active)
                        ; 0: Alternate CPU reset (to effect mode switch from
                        ;    Protected Virtual Address Mode to Real Address Mode).
jnz     short loc_1275D
and     al, 0FDh

loc_1275D:
and     al, 0FEh
out     92h, al         ; PS/2 System Control Port A
                        ; 1: A20 address line (1=active)
                        ; 0: Alternate CPU reset (to effect mode switch from
                        ;    Protected Virtual Address Mode to Real Address Mode).
pop     bx
pop     ax
retn

loc_12764:
mov     ax, seg seg000
mov     ds, ax
mov     ss, ax
assume ss:seg000
mov     sp, word_10996
sub     sp, 180h
mov     bp, sp
mov     di, sp
mov     cx, 2Ah ; '*'
cld
xor     ax, ax
rep stosb
mov     word_10996, sp
mov     bp, sp
mov     word ptr [bp+18h], 0FFFEh
mov     sp, word ptr byte_10F4C+4
push    0
call    sub_13E6D



sub_12793 proc near
in      al, 92h         ; PS/2 System Control Port A
                        ; 1: A20 address line (1=active)
                        ; 0: Alternate CPU reset (to effect mode switch from
                        ;    Protected Virtual Address Mode to Real Address Mode).
and     ah, 2
and     al, 0FDh
or      al, ah
jmp     short $+2

loc_1279E:              ; PS/2 System Control Port A
out     92h, al         ; 1: A20 address line (1=active)
                        ; 0: Alternate CPU reset (to effect mode switch from
                        ;    Protected Virtual Address Mode to Real Address Mode).
retn
sub_12793 endp




sub_127A1 proc near
call    sub_127F8
mov     al, 0D1h
out     64h, al         ; 8042 keyboard controller command register.
                        ; Write output port (next byte to port 60h):
                        ; 7:  1=keyboard data line pulled low (inhibited)
                        ; 6:  1=keyboard clock line pulled low (inhibited)
                        ; 5:  enables IRQ 12 interrupt on mouse IBF
                        ; 4:  enables IRQ 1 interrupt on keyboard IBF
                        ; 3:  1=mouse clock line pulled low (inhibited)
                        ; 2:  1=mouse data line pulled low (inhibited)
                        ; 1:  A20 gate on/off
                        ; 0:  reset the PC (THIS BIT SHOULD ALWAYS BE SET TO 1)
call    sub_127F8
xchg    al, ah
out     60h, al         ; 8042 keyboard controller data register.
call    sub_127F8
retn
sub_127A1 endp




sub_127B3 proc near
mov     al, 0FFh
out     64h, al         ; 8042 keyboard controller command register.
                        ; Pulse output port.
                        ; Bits 0-3 indicate ports to pulse.
jmp     short sub_127F8
sub_127B3 endp




sub_127B9 proc near
mov     ah, 0DFh
call    sub_127A1
test    byte ptr word_10014, 1
jz      short sub_127B3

loc_127C5:
call    sub_127DD
jz      short loc_127C5
retn
sub_127B9 endp




sub_127CB proc near
mov     ah, 0DDh
call    sub_127A1
test    byte ptr word_10014, 1
jz      short sub_127B3

loc_127D7:
call    sub_127DD
jnz     short loc_127D7
retn
sub_127CB endp




sub_127DD proc near
cli
xor     cx, cx
push    ds
mov     ds, cx
assume ds:nothing
push    si
mov     si, 20h ; ' '
dec     cx
mov     es, cx
assume es:nothing
push    di
mov     di, 30h ; '0'
cld
mov     cx, 4

loc_127F2:
repe cmpsw
pop     di
pop     si
pop     ds
assume ds:nothing
retn
sub_127DD endp




sub_127F8 proc near
push    cx
xor     cx, cx

loc_127FB:              ; 8042 keyboard controller status register
in      al, 64h         ; 7:  PERR    1=parity error in data received from keyboard
                        ;    +----------- AT Mode ----------+------------ PS/2 Mode ------------+
                        ; 6: |RxTO    receive (Rx) timeout  | TO      general timeout (Rx or Tx)|
                        ; 5: |TxTO    transmit (Tx) timeout | MOBF    mouse output buffer full  |
                        ;    +------------------------------+-----------------------------------+
                        ; 4:  INH     0=keyboard communications inhibited
                        ; 3:  A2      0=60h was the port last written to, 1=64h was last
                        ; 2:  SYS     distinguishes reset types: 0=cold reboot, 1=warm reboot
                        ; 1:  IBF     1=input buffer full (keyboard can't accept data)
                        ; 0:  OBF     1=output buffer full (data from keyboard is available)
test    al, 2
jnz     short loc_12803

loc_12801:
pop     cx

locret_12802:
retn

loc_12803:
loopne  loc_127FB
jz      short loc_12801
push    1Ah

loc_12809:
call    sub_13E6D
call    sub_1286B
add     al, ch
pop     ax
add     [bx+di], al
call    sub_1286B
add     ch, al
push    ax
add     [bp+di], al
call    sub_1286B
add     al, 0E8h
dec     ax
add     [di], al
call    sub_1286B
push    es
call    sub_1286B
pop     es
call    sub_1286F
or      al, ch
cmp     [bx+si], al
or      ax, bp
cmp     [bx+si], al
or      ch, al
xor     al, 0
or      bp, ax
xor     [bx+si], al
or      al, 0E8h
sub     al, 0
or      ax, 28E8h
add     ds:20E8h, cl
add     [bx], cl
call    sub_1286B
push    ds
call    sub_1286B

loc_12853:
and     [bx], bl
pop     ax
pusha
push    es
push    ds
push    ss
mov     ax, 20h ; ' '
mov     ds, ax
assume ds:nothing
push    word ptr ds:996h
mov     bp, sp
add     word ptr [bp+0Eh], 6
jmp     short loc_128BC
sub_127F8 endp




sub_1286B proc near
push    0
push    0
sub_1286B endp ; sp-analysis failed




sub_1286F proc near

; FUNCTION CHUNK AT 0251 SIZE 0000003F BYTES

cli
push    ax
push    ds
mov     ax, 20h ; ' '
mov     ds, ax
mov     word ptr ds:0F7Ch, ss
mov     ds:0F7Ah, sp
cmp     ds:0F7Ch, ax
jz      short near ptr loc_12853+1
mov     ss, ax
assume ss:nothing
mov     sp, ds:996h
sub     sp, 180h
pusha
push    es
push    ds
push    word ptr ds:0F7Ch
push    word ptr ds:996h
mov     bp, sp
mov     es, ax
assume es:nothing
lds     si, ds:0F7Ah
assume ds:nothing
cld
lodsw
mov     [bp+4], ax
lea     di, [bp+16h]
movsw
movsw
movsd
mov     [bp+0Eh], si
movsd
movsd
movsd
mov     ax, 20h ; ' '

loc_128BA:
mov     ds, ax
assume ds:nothing

loc_128BC:
mov     ds:996h, bp
mov     sp, ds:0F50h
call    sub_124FC
xor     ax, ax
mov     bx, [bp+18h]
or      bx, bx
jnz     short loc_128D3
xchg    bx, [bp+1Ch]

loc_128D3:
mov     al, cs:[bx]
mov     [bp+18h], ax
jmp     loc_11E21
sub_1286F endp




sub_128DC proc near
cli
push    1026h
call    sub_12E68
pop     cx
retn
sub_128DC endp




sub_128E5 proc near
cli
push    1026h
call    sub_12E50
pop     cx
push    0F8Ah
call    sub_12E68
pop     cx
sti
retn
sub_128E5 endp



; Attributes: bp-based frame

sub_128F6 proc far

var_s0= word ptr  0
arg_0= dword ptr  6
arg_4= dword ptr  0Ah

push    bp
mov     bp, sp
push    ds
push    es
push    si
push    di
lds     si, [bp+arg_4]
assume ds:nothing
mov     ax, si
mov     dx, ds
mov     cx, ss
cmp     cx, dx
jnz     short loc_1292C
mov     cx, si
sub     cx, sp
sub     si, cx
les     di, [bp+arg_0]
assume es:nothing
sub     di, cx
add     [bp+var_s0], di
sub     [bp+var_s0], si
mov     bx, es
mov     ss, bx
assume ss:nothing
mov     sp, di
shr     cx, 1
cld
rep movsw

loc_12926:
pop     di
pop     si
pop     es
pop     ds
pop     bp
retf

loc_1292C:
xor     ax, ax
xor     dx, dx
jmp     short loc_12926
sub_128F6 endp




sub_12932 proc near
and     bl, 0F8h
mov     dh, [bx+7]
mov     dl, [bx+4]
mov     bx, [bx+2]
and     bl, 0F0h
or      bl, dl
ror     bx, 4
test    dx, 0FFF0h
jz      short locret_1294F
mov     bx, 0E000h

locret_1294F:
retn
sub_12932 endp



; Attributes: bp-based frame

sub_12950 proc far
push    bp
mov     bp, sp
mov     cx, ds
mov     ax, 8
mov     ds, ax
assume ds:nothing
mov     bx, [bp+4]
call    sub_12932
jnz     short loc_1297C
xchg    ax, bx
mov     bx, cx
call    sub_12932
push    bx
mov     bx, ss
call    sub_12932
jnz     short loc_1297C
xchg    ax, [bp+4]
push    20h ; ' '
pop     ds
assume ds:nothing
call    sub_12501
pop     ds
assume ds:nothing
pop     bp
retf

loc_1297C:
xor     ax, ax
mov     ds, cx
leave
retf
sub_12950 endp



; Attributes: bp-based frame

sub_12982 proc far

arg_0= word ptr  6
arg_2= word ptr  8
arg_4= word ptr  0Ah
arg_6= word ptr  0Ch

push    bp
mov     bp, sp
mov     dx, [bp+arg_2]
xor     ax, ax
jnz     short loc_129A3
mov     ax, seg seg000
mov     ds, ax
assume ds:seg000
call    sub_11E63
mov     ax, [bp+arg_0]
mov     [bp+4], ax
mov     ds, [bp+arg_4]
assume ds:nothing
mov     es, [bp+arg_6]
mov     ax, 1

loc_129A3:
pop     bp
retf
sub_12982 endp

align 2
word_129A6 dw 0
word_129A8 dw 0
word_129AA dw 0
word_129AC dw 0
pop     ax
pop     bx
pushf
cli
push    bx
push    ax
push    bp
mov     bp, sp
sub     sp, 6
push    es
push    ds
push    si
push    di
sub     sp, 14h
lds     si, [bp+0Ah]
cld
push    ss
pop     es
mov     di, sp
mov     cx, 0Ah
rep movsw
push    ss
lea     ax, [bp+0Ah]
push    ax
push    20h ; ' '
pop     ds
assume ds:nothing
push    ds
mov     ax, ds:0Ah
add     ax, ds:0Eh
add     ax, ds:48h
sub     word ptr ds:0Eh, 200h
sub     word ptr ds:996h, 180h
mov     bx, ds:996h
mov     word ptr [bx+2], ss
lea     cx, [bp+2]
mov     [bx+0Eh], cx
and     al, 0FEh
push    ax
push    cs
call    near ptr sub_128F6
add     sp, 8
mov     [bp-4], ax
mov     [bp-2], dx
push    cs
call    near ptr sub_12950
mov     [bp-6], ax
mov     al, [bp+8]
xchg    al, cs:byte_12A42
mov     byte ptr cs:word_129AC, al
push    word ptr [bp+6]
push    cs
call    near ptr nullsub_1
pop     ds
assume ds:nothing
pop     es
popa
push    cs:word_129A6
push    cs:word_129A8
push    cs:word_129AC
mov     cs:word_129A8, ss
mov     cs:word_129A6, sp
db 0CDh
byte_12A42 db 0
mov     ss, cs:word_129A8
mov     sp, cs:word_129A6
pushf
cli
pop     cs:word_129AA
pop     cs:word_129AC
pop     cs:word_129A8
pop     cs:word_129A6
pusha
mov     al, byte ptr cs:word_129AC
mov     cs:byte_12A42, al
push    es
push    ds
mov     bp, sp
pushf
add     bp, 22h ; '"'
push    word ptr [bp-8]
push    word ptr [bp-0Ah]
push    20h ; ' '
push    18h
push    cs
call    near ptr sub_12982
add     word ptr ss:996h, 180h
add     word ptr ss:0Eh, 200h
add     sp, 8
push    ss
lea     ax, [bp+0Ah]
push    ax
push    word ptr [bp-2]
push    word ptr [bp-4]
push    cs
call    near ptr sub_128F6
add     sp, 8
cld
pop     ax
les     di, [bp+0Eh]
push    ss
pop     ds
mov     si, sp
mov     cx, 0Ah
rep movsw
add     sp, 14h
pop     di
pop     si
pop     ds
pop     es
mov     sp, bp
pop     bp
mov     ax, cs:word_129AA
or      al, 2
iret
byte_12AC4 db 0CDh
byte_12AC5 db 15h
retn
align 2
mov     word ptr [bx+1Eh], cs
xchg    ax, bx
mov     bp, sp
mov     al, [bx+10BEh]
add     bx, bx
add     bx, bx
xor     cx, cx
lea     dx, [bx-20h]
cmp     dx, 98h
ja      short loc_12AEC
test    al, al
jz      short loc_12AEC
mov     cx, seg seg000
add     bx, 0F6Ah

loc_12AEC:
mov     es, cx
assume es:seg000
mov     cx, es:[bx+2]
jcxz    short loc_12B01
mov     ax, es:[bx]
mov     [bp+16h], cx
mov     [bp+14h], ax
pop     ds
pop     es
assume es:nothing
popa
iret

loc_12B01:
jmp     loc_11E21
db 9Ch, 0FAh, 52h, 66h, 53h, 55h, 1Eh, 0BAh
dw seg seg000
db 6, 8Eh, 0DAh, 8Bh, 2Eh, 96h, 9, 0E8h
db 48h, 0F3h, 5Ah, 0EAh, 7Ch, 4, 70h, 0
db 0E8h, 1Dh
dw 0
byte_12B22 db 0E8h, 19h, 2 dup(0), 0E8h, 15h, 2 dup(0)
db 0E8h, 11h, 2 dup(0), 0E8h, 0Dh, 2 dup(0)
db 0E8h, 9, 2 dup(0), 0E8h, 5, 2 dup(0)
db 0E8h, 1, 2 dup(0), 0FAh, 1Eh, 6, 55h
db 52h, 8Bh, 0ECh, 56h, 8Dh, 76h, 4, 57h
db 0BFh
dw seg seg000
db 8Eh, 0C7h, 26h, 8Bh, 3Eh, 96h, 9, 83h
db 0EFh, 0Ch, 16h, 1Fh, 26h, 8Ch, 55h, 0FEh
db 2Eh, 8Bh, 16h, 8, 0, 26h, 89h, 55h, 2 dup(0FCh)
db 51h, 0B9h, 6, 0, 0F3h, 0A5h, 59h, 6, 1Fh
db 81h, 66h, 0Eh, 0FFh, 0Ch, 8Bh, 7Eh, 8
db 2Eh, 8Bh, 3Dh, 81h, 0E7h, 0FFh, 0, 57h
db 2Eh, 89h, 3Eh, 8, 0, 8Ch, 0D2h, 81h, 0FAh
dw seg seg000
db 75h, 3Bh, 0E8h, 0D0h, 0F2h, 0BAh, 48h
db 0, 8Eh, 0C2h, 5Ah, 80h, 0FAh, 24h, 74h
db 28h, 80h, 0FAh, 23h, 74h, 1Eh, 26h, 88h
db 16h, 0E8h, 0Fh, 0EBh, 1, 90h, 5Fh, 5Eh
db 5Ah, 0BDh, 2 dup(0), 8Eh, 0C5h, 8Eh, 0DDh
db 5Dh, 83h, 0C4h, 0Ah, 9Dh, 0CDh, 21h, 0EAh
db 6Ah, 5, 70h, 0, 0EAh, 0BEh, 5, 70h, 0
db 0EAh, 0F0h, 5, 70h, 0, 0C1h, 0C2h, 4
db 8Bh, 0FAh, 83h, 0E7h, 0F0h, 80h, 0E2h
db 0Fh, 68h, 0C0h, 0Fh, 0E9h, 0AEh, 0F2h
db 0E8h, 25h, 0F9h, 5Bh, 56h, 8Bh, 37h, 2Eh
db 89h, 36h, 8, 0, 8Bh, 77h, 8, 2Eh, 80h
db 3Ch, 24h, 0C4h, 77h, 0Ah, 89h, 76h, 2
db 8Ch, 46h, 4, 75h, 1Ah, 83h, 3Eh, 0F0h
db 10h, 0, 74h, 13h, 8Bh, 36h, 0F0h, 10h
db 0C6h, 46h, 6, 0, 9, 76h, 6, 0C7h, 46h
db 2, 0B7h, 10h, 8Ch, 4Eh, 4, 5Eh, 50h, 8Bh
db 7, 2Eh, 0A3h, 8, 0, 58h, 8Eh, 47h, 4
db 8Eh, 5Fh, 6, 5Bh, 5Dh, 0CFh, 15h dup(0)
db 2Eh, 0FFh, 36h, 64h, 10h, 89h, 67h, 1Eh
db 8Bh, 46h, 26h, 89h, 47h, 0EEh, 0B8h, 20h
db 0, 8Eh, 0D0h, 8Dh, 67h, 0EEh, 0C6h, 6
db 0CCh, 9, 21h, 0E8h, 0A6h, 0F8h, 8Dh, 47h
db 18h, 2Eh, 0A3h, 64h, 10h, 8Bh, 47h, 16h
db 2Eh, 0C6h, 2 dup(6), 0, 21h, 2Eh, 88h
db 26h, 7, 0, 0FFh, 77h, 10h, 8Bh, 4Fh, 14h
db 8Bh, 57h, 12h, 8Bh, 6Fh, 0Ch, 8Bh, 77h
db 0Ah, 8Bh, 7Fh, 8, 8Eh, 47h, 6, 8Eh, 5Fh
db 4, 5Bh, 9Dh, 0CDh, 21h, 9Ch, 2Eh, 8Fh
db 6, 66h, 10h, 0FAh, 2Eh, 8Eh, 16h, 2 dup(0)
db 2Eh, 8Bh, 26h, 64h, 10h, 60h, 6, 1Eh
db 2Eh, 8Eh, 1Eh, 2 dup(0), 0E8h, 0BDh, 0F1h
db 2Eh, 0A1h, 66h, 10h, 0EAh, 81h, 0Dh, 70h
db 0, 66h, 9Ch, 66h, 0Eh, 6Ah, 0, 68h, 0E9h
db 10h, 0E8h, 0B3h, 0FBh, 0FFh, 0EAh, 89h
db 0Ah, 70h, 0, 0E8h, 0AAh, 0FBh, 21h, 0Eh
db 0E8h, 8Ah, 0FCh, 5Bh, 0FEh, 6, 82h, 11h
db 0E8h, 0B4h, 21h, 2 dup(59h), 8Bh, 0C4h
db 2Dh, 6, 0, 50h, 0E8h, 0ACh, 1Dh, 59h
db 0FEh, 0Eh, 82h, 11h, 0Eh, 0E8h, 0A0h
db 0FCh, 0EAh, 0DAh, 9, 70h, 0, 90h, 98h
db 0
dw seg seg000
db 0E8h, 4Fh, 0FEh, 8, 0E8h, 4Bh, 0FEh, 9
db 0E8h, 47h, 0FEh, 0Ah, 0E8h, 43h, 0FEh
db 0Bh, 0E8h, 3Fh, 0FEh, 0Ch, 0E8h, 3Bh
db 0FEh, 0Dh, 0E8h, 37h, 0FEh, 0Eh, 0E8h
db 33h, 0FEh, 0Fh, 0E8h, 2Fh, 0FEh, 10h
db 0E8h, 2Bh, 0FEh, 11h, 0E8h, 27h, 0FEh
db 12h, 0E8h, 23h, 0FEh, 13h, 0E8h, 1Fh
db 0FEh, 14h, 0E8h, 1Bh, 0FEh, 15h, 0E8h
db 17h, 0FEh, 16h, 0E8h, 13h, 0FEh, 17h
db 0E8h, 0Fh, 0FEh, 18h, 0E8h, 0Bh, 0FEh
db 19h, 0E8h, 7, 0FEh, 1Ah, 0E8h, 3, 0FEh
db 1Bh, 0E8h, 0FFh, 0FDh, 1Ch, 0E8h, 0FBh
db 0FDh, 1Dh, 0E8h, 0F7h, 0FDh, 1Eh, 0E8h
db 0F3h, 0FDh, 1Fh, 0E8h, 0EFh, 0FDh, 20h
db 0E8h, 0EBh, 0FDh, 21h, 0E8h, 0E7h, 0FDh
db 22h, 0E8h, 0E3h, 0FDh, 23h, 0E8h, 0DFh
db 0FDh, 24h, 0E8h, 0DBh, 0FDh, 25h, 0E8h
db 0D7h, 0FDh, 26h, 0E8h, 0D3h, 0FDh, 27h
db 0E8h, 0CFh, 0FDh, 28h, 0E8h, 0CBh, 0FDh
db 29h, 0E8h, 0C7h, 0FDh, 2Ah, 0E8h, 0C3h
db 0FDh, 2Bh, 0E8h, 0BFh, 0FDh, 2Ch, 0E8h
db 0BBh, 0FDh, 2Dh, 0E8h, 0B7h, 0FDh, 2Eh
db 8 dup(0)
; [00000001 BYTES: COLLAPSED FUNCTION nullsub_1. PRESS CTRL-NUMPAD+ TO EXPAND]



sub_12D91 proc near
push    cs
call    near ptr sub_12950
sti
retn
sub_12D91 endp




sub_12D97 proc near
mov     al, ds:0A17h
cmp     al, 0FFh
jz      short locret_12DAC
xchg    ax, cx
mov     ah, 0Fh
int     10h             ; - VIDEO - GET CURRENT VIDEO MODE
                        ; Return: AH = number of columns on screen
                        ; AL = current video mode
                        ; BH = current active display page
cmp     al, cl
jz      short locret_12DAC
xchg    ax, cx
xor     ah, ah
int     10h             ; - VIDEO - SET VIDEO MODE
                        ; AL = mode

locret_12DAC:
retn
sub_12D97 endp




sub_12DAD proc near
mov     bx, sp
mov     ax, ss:[bx+2]
add     ax, 10h
rcr     ax, 1
mov     cl, 3
shr     ax, cl
retn
sub_12DAD endp



; Attributes: bp-based frame

sub_12DBD proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
push    si
push    di
call    sub_11E60
push    8
pop     ds
assume ds:nothing
mov     ax, [bp+arg_0]
mov     ds:62h, ax
mov     ax, [bp+arg_2]
mov     ds:64h, al
mov     ds:67h, ah
mov     cx, [bp+arg_6]
push    60h ; '`'
pop     ds
assume ds:nothing
xor     si, si
mov     di, [bp+arg_4]
cld
rep movsb
push    ss
pop     ds
assume ds:nothing
call    sub_124F9
pop     di
pop     si
mov     sp, bp
pop     bp
sti
retn
sub_12DBD endp



; Attributes: bp-based frame

sub_12DF2 proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
push    si
push    di
call    sub_11E60
push    60h ; '`'
mov     ax, [bp+arg_0]
push    8
pop     es
assume es:nothing
mov     es:62h, ax
mov     ax, [bp+arg_2]
mov     es:64h, al
mov     es:67h, ah
pop     es
assume es:nothing
xor     di, di
mov     si, [bp+arg_4]
mov     cx, [bp+arg_6]
cld
shr     cx, 1
rep movsw
rcl     cx, 1
rep movsb
push    8
pop     es
assume es:nothing
mov     es:66h, cx
call    sub_124F9
pop     di
pop     si
mov     sp, bp
pop     bp
sti
retn
sub_12DF2 endp




sub_12E36 proc near
mov     bx, sp
pushf
pop     ax
cmp     word ptr ss:[bx+2], 0
cli
jz      short loc_12E43
sti

loc_12E43:
shr     ax, 9
and     ax, 1
retn
sub_12E36 endp




sub_12E4A proc near
pop     ax
int     3               ; Trap to Debugger
add     [bx+di], al
add     [bx+di], al
sub_12E4A endp ; sp-analysis failed




sub_12E50 proc near
mov     bx, sp
mov     di, [bx+2]
xor     ax, ax
mov     ds, ax
assume ds:nothing
push    ss
pop     es
assume es:nothing
mov     si, 20h ; ' '
cld
mov     cx, 4Eh ; 'N'
cli
rep movsw

loc_12E65:
push    ss
pop     ds
assume ds:nothing
retn
sub_12E50 endp




sub_12E68 proc near
mov     bx, sp
mov     si, [bx+2]
xor     ax, ax
mov     es, ax
assume es:nothing
mov     bx, 8
cld
cli
mov     di, 20h ; ' '

loc_12E79:
cmp     byte ptr [bx+10BEh], 0
jnz     short loc_12E8A

loc_12E80:
cmpsw
cmpsw

loc_12E82:
inc     bx
cmp     bl, 2Eh ; '.'
jbe     short loc_12E79
jmp     short loc_12E65

loc_12E8A:
cmp     bl, ds:34h
jz      short loc_12E80
movsw
movsw
jmp     short loc_12E82
sub_12E68 endp

dword_12E94 dd 0
db 0CCh
db 12h
word_12E9A dw 0
cmp     ah, 88h
jz      short loc_12EAB
cmp     ah, 0BFh
jz      short loc_12ED8

loc_12EA6:
jmp     cs:dword_12E94

loc_12EAB:
push    ds
mov     ds, cs:seg_11BD0
assume ds:seg000
cmp     byte_1002E, 0Bh
jz      short loc_12ED5
cmp     word ptr byte_10AAC+30h, 0
jnz     short loc_12ED5
push    dx
mov     ax, word ptr byte_10095+3
mov     dx, word ptr byte_10095+5
shr     ax, 6
shl     dx, 0Ah
or      ax, dx
sub     ax, 400h
pop     dx
pop     ds
assume ds:nothing
iret

loc_12ED5:
pop     ds
jmp     short loc_12EA6

loc_12ED8:
cmp     al, 5
jz      short loc_12F03
push    ds
mov     ds, cs:seg_11BD0
assume ds:seg000
cmp     al, 0DCh
jz      short loc_12EF5
cmp     al, 6
ja      short loc_12ED5
cmp     al, 2
ja      short loc_12F18
cmp     byte_10A16, 0
jnz     short loc_12ED5

loc_12EF5:
cmp     word ptr byte_10A12+2, 0
jnz     short loc_12ED5
mov     si, 98h
mov     dx, ds
pop     ds
assume ds:nothing
iret

loc_12F03:
call    sub_148C6
iret

loc_12F07:
push    es
mov     es, bx
assume es:nothing
call    loc_11D10
pop     es
call    sub_13213
mov     ax, 0BF04h

loc_12F14:
pop     bx
pop     ds
jmp     short loc_12EA6

loc_12F18:
push    bx
cmp     bx, ds:0CEAh
jnz     short loc_12F14
cmp     al, 4
jz      short loc_12F07
push    bx
push    ax
inc     byte ptr ds:11D8h
mov     ax, ss
cmp     ax, ds:9B4h
mov     dx, sp
jz      short loc_12F39
push    ds
pop     ss
mov     sp, ds:0F50h

loc_12F39:
push    ax
push    dx
call    sub_11C38
pop     dx
pop     ss
mov     sp, dx
pop     ax
pop     dx
cmp     al, 6
jz      short loc_12F7A
mov     ah, 52h
int     21h             ; DOS - 2+ internal - GET LIST OF LISTS
                        ; Return: ES:BX -> DOS list of lists
mov     si, es:[bx-2]

loc_12F50:
mov     ds, si
cmp     byte ptr ds:0, 5Ah ; 'Z'
jz      short loc_12F75
mov     bx, si
add     bx, ds:3
inc     bx
mov     ds, bx
cmp     ds:1, dx
jz      short loc_12F6C
mov     si, bx
jmp     short loc_12F50

loc_12F6C:
mov     ah, 49h ; 'I'
inc     bx
mov     es, bx
int     21h             ; DOS - 2+ - FREE MEMORY
                        ; ES = segment address of area to be freed
jmp     short loc_12F50

loc_12F75:
mov     ax, 0BF03h
jmp     short loc_12F14

loc_12F7A:
pop     bx
pop     ds
iret



sub_12F7D proc near
call    sub_1323B
jnz     short loc_12FF7
xor     bx, bx
mov     es, bx
assume es:nothing
mov     bl, ds:34h
shl     bx, 2
mov     dx, cs
cmp     dx, es:[bx+2]
jnz     short loc_12FB4
mov     ah, 25h ; '%'
cmp     byte ptr ds:34h, 15h
lds     dx, cs:dword_12E94
jz      short loc_12FA8
lds     dx, ss:0F84h

loc_12FA8:
cli
mov     es:[bx], dx
mov     word ptr es:[bx+2], ds
sti
push    ss
pop     ds
retn

loc_12FB4:
xchg    ax, cx

loc_12FB5:
mov     ds, ax
cmp     ax, [bx-2]
jnz     short loc_12FF7
cmp     bx, [bx-4]
jnz     short loc_12FF7
mov     ax, [bx-6]
cmp     dx, ax
jz      short loc_12FCD
mov     bx, [bx-8]
jmp     short loc_12FB5

loc_12FCD:
mov     ax, word ptr cs:dword_12E94
cli
mov     [bx-8], ax
mov     ax, word ptr cs:dword_12E94+2
mov     [bx-6], ax
sti
mov     ax, ds:0
or      ax, ax
jnz     short loc_12FE7
mov     ax, ds:10h

loc_12FE7:
or      ax, ax
jz      short loc_12FF7
sub     ax, 11h
mov     ds, ax
inc     ax
cmp     ds:1, ax
jz      short loc_12FFA

loc_12FF7:
mov     ax, 0FFFFh

loc_12FFA:
mov     bx, ss:0CEAh
dec     bx
mov     ds, bx
mov     ds:1, ax
push    ss
pop     ds
retn
sub_12F7D endp




sub_13008 proc near
mov     ax, ds:0F88h
or      al, 1
lmsw    ax
retn
sub_13008 endp




sub_13011 proc near
mov     bx, ds:8B2h
cmp     bx, 80h
jb      short locret_13066
mov     ax, ds:8AAh
cmp     ax, 80h
jb      short locret_13066
call    sub_11E60
xor     cx, cx
lar     cx, bx
and     ch, 18h
cmp     ch, 18h
jnz     short loc_13063
xor     cx, cx
lar     cx, ax
and     ch, 18h
cmp     ch, 10h
jnz     short loc_13063
mov     ds:0F50h, sp
mov     ss, ax
mov     sp, ds:8A8h
push    20h ; ' '
push    word ptr ds:996h
mov     ds, word ptr ds:8AEh
call    dword ptr es:8B0h
push    20h ; ' '
pop     ds
assume ds:nothing
push    20h ; ' '
pop     ss
assume ss:nothing
mov     sp, ds:0F50h

loc_13063:
call    sub_124F9

locret_13066:
retn
sub_13011 endp




sub_13067 proc near
mov     bx, sp
mov     ax, [bx+2]
push    ax
push    ax
call    sub_141E0
xchg    ax, cx
pop     ax
pop     dx
mov     bx, 2
mov     ah, 40h
int     21h             ; DOS - 2+ - WRITE TO FILE WITH HANDLE
                        ; BX = file handle, CX = number of bytes to write, DS:DX -> buffer
retn
sub_13067 endp




sub_1307C proc near
mov     bx, sp
push    word ptr ds:0AC2h
mov     word ptr ds:0AC2h, 14C4h
push    word ptr ss:[bx+2]
call    sub_13E6D
pop     cx
pop     word ptr ds:0AC2h
retn
sub_1307C endp

align 10h
db 44h, 31h, 36h, 2Fh
dword_130A4 dd 0
cmp     ax, 1605h
jz      short loc_130C2
cmp     ax, 1606h
jz      short loc_130C2
cmp     ax, 1607h
jz      short loc_130BC

loc_130B7:
jmp     cs:dword_130A4

loc_130BC:
cmp     bx, 22C0h
jnz     short loc_130B7

loc_130C2:
push    ax
pushf
call    cs:dword_130A4
pop     ax
sti
push    ax
push    dx
push    si
push    di
push    ds
mov     ds, cs:seg_11BD0
assume ds:seg000
cmp     al, 5
jz      short loc_13130
cmp     al, 7
jz      short loc_13103
cmp     word ptr byte_10A12+2, 0
jz      short loc_130FD
cli
mov     ax, word ptr byte_10A26+63h
mov     word ptr byte_109B8+8, ax
mov     ax, word ptr byte_10A26+65h
mov     word ptr byte_109B8+4, ax
mov     ax, word ptr byte_10A26+67h
mov     word ptr byte_109B8+6, ax
mov     word ptr byte_10A12+2, 0

loc_130FD:
pop     ds
assume ds:nothing
pop     di
pop     si
pop     dx
pop     ax
iret

loc_13103:
test    word ptr ds:1582h, 4
jnz     short loc_13125
mov     ds:1554h, di
mov     word ptr ds:1556h, es
mov     ax, es
or      ax, di
jz      short loc_13125
mov     word ptr es:[di+8], (offset byte_11210+340h - offset byte_10000)
mov     word ptr es:[di+0Ah], seg seg000

loc_13125:
push    ds
pop     es
assume es:nothing
mov     di, 1550h
pop     ds
pop     ax
pop     si
pop     dx
pop     ax
iret

loc_13130:
test    dx, 1
jnz     short loc_130FD
test    cx, cx
jnz     short loc_130FD
mov     ds:0A2Ah, cx
mov     word ptr ds:0A99h, 0
mov     word ptr ds:0A1Ch, es
mov     ds:0A1Ah, bx
cmp     word ptr ds:0A87h, 0
jnz     short loc_13174
mov     ax, 25h ; '%'

loc_13156:
mov     ds:0A95h, sp
mov     word ptr ds:0A97h, ss
push    ds
pop     ss
assume ss:nothing
mov     sp, ds:0F50h
push    ax
call    sub_1307C
lss     sp, ds:0A95h
mov     byte ptr ds:0A2Ah, 1
jmp     short loc_1319E

loc_13174:
mov     dx, 0A2Ch
mov     ax, 4300h
int     21h             ; DOS - 2+ - GET FILE ATTRIBUTES
                        ; DS:DX -> ASCIZ file name or directory
                        ; name without trailing slash
jb      short loc_13184
test    cx, 1Eh
jz      short loc_13190

loc_13184:
test    byte ptr ds:15h, 8
jz      short loc_1319B
mov     ax, 24h ; '$'
jmp     short loc_13156

loc_13190:
mov     word ptr ds:0A20h, ds
mov     dx, 0A2Ch
mov     ds:0A1Eh, dx

loc_1319B:
call    sub_131AA

loc_1319E:
push    ds
pop     es
mov     bx, 0A18h
mov     cx, ds:0A2Ah
jmp     loc_130FD



sub_131AA proc near
mov     ax, ds:0A87h
mov     ds:1578h, ax
and     word ptr ds:1582h, 0FFFDh
cmp     byte ptr ds:3Eh, 0
jz      short loc_131C1
or      word ptr ds:1582h, 2

loc_131C1:
mov     ax, ds:8C8h
mov     ds:1560h, ax
mov     ax, ds:8CAh
mov     ds:1562h, ax
mov     al, ds:8CCh
mov     ah, ds:8CFh
mov     ds:1564h, ax
mov     ax, ds:8D0h
mov     ds:1566h, ax
mov     ax, ds:8D2h
mov     ds:1568h, ax
mov     al, ds:8D4h
mov     ah, ds:8D7h
mov     ds:156Ah, ax
cli
mov     ax, 1706h
xchg    ax, ds:9C0h
mov     ds:0A89h, ax
mov     ax, 173Dh
xchg    ax, ds:9BCh
mov     ds:0A8Bh, ax
mov     ax, 1749h
xchg    ax, ds:9BEh
mov     ds:0A8Dh, ax
mov     word ptr ds:0A14h, 1
retn
sub_131AA endp




sub_13213 proc near
pusha
push    ds
push    es
mov     ax, ds:2Eh
cmp     ah, 3
jb      short loc_13237
mov     ax, 352Fh
int     21h             ; DOS - 2+ - GET INTERRUPT VECTOR
                        ; AL = interrupt number
                        ; Return: ES:BX = value of interrupt vector
mov     word ptr cs:dword_130A4, bx
mov     word ptr cs:dword_130A4+2, es
push    cs
pop     ds
assume ds:seg002
mov     dx, 14D8h
mov     ax, 252Fh
int     21h             ; DOS - SET INTERRUPT VECTOR
                        ; AL = interrupt number
                        ; DS:DX = new vector to be used for specified interrupt

loc_13237:
pop     es
pop     ds
assume ds:nothing
popa
retn
sub_13213 endp




sub_1323B proc near
pusha
push    ds
push    es
mov     dx, word ptr cs:dword_130A4
mov     cx, word ptr cs:dword_130A4+2
mov     ds, cx
or      cx, dx
jz      short loc_13284
push    0
pop     es
assume es:nothing
mov     bx, es:0BEh
mov     cx, cs
sub     cx, bx
jb      short loc_1325F
mov     cx, 0

loc_1325F:
jnz     short loc_1326B
mov     es:0BCh, dx
mov     word ptr es:0BEh, ds

loc_1326B:
push    ss
pop     ds
test    word ptr ds:1582h, 1
jz      short loc_13284
mov     ax, 1706h
mov     ds:9C0h, ax
mov     ax, 2
call    dword ptr ds:155Ch
rcl     cx, 1

loc_13284:
pop     es
assume es:nothing
pop     ds
xor     ax, ax
mov     word ptr cs:dword_130A4, ax
mov     word ptr cs:dword_130A4+2, ax
test    cx, cx
popa
retn
sub_1323B endp




sub_13294 proc near
test    word ptr ds:1582h, 1
jz      short locret_132A9
mov     ax, 1706h
mov     ds:9C0h, ax
mov     ax, 2
call    dword ptr ds:155Ch

locret_132A9:
retn
sub_13294 endp

test    word ptr ds:1582h, 1
jnz     short loc_132E2
mov     ax, 24h ; '$'
; START OF FUNCTION CHUNK FOR sub_132D6

loc_132B5:
cmp     word ptr ds:0A99h, 0
jnz     short loc_132CC
mov     word ptr ds:0A99h, 1
push    ds
pop     ss
mov     sp, ds:0F50h
push    ax
call    sub_1307C

loc_132CC:
mov     ax, 4C00h
int     21h             ; DOS - 2+ - QUIT WITH EXIT CODE (EXIT)
                        ; AL = exit code

loc_132D1:
mov     ax, 27h ; '''
jmp     short loc_132B5
; END OF FUNCTION CHUNK FOR sub_132D6



sub_132D6 proc near

; FUNCTION CHUNK AT 16E5 SIZE 00000021 BYTES

test    word ptr ds:1582h, 1
jnz     short loc_132E2
jmp     word ptr ds:0A89h

loc_132E2:
cmp     word ptr ds:1588h, 6Dh ; 'm'
jb      short loc_132D1
pop     bx
mov     si, sp
mov     ax, 1
mov     cx, 18h
cmp     ds:0, al
cmp     byte ptr cs:sub_148FC, al
call    dword ptr ds:155Ch
mov     ax, 20h ; ' '
mov     ds, ax
assume ds:nothing
mov     ds:157Ch, esp
mov     sp, si
jmp     bx
sub_132D6 endp ; sp-analysis failed

test    word ptr ds:1582h, 1
jnz     short loc_13325
jmp     word ptr ds:0A8Bh
test    word ptr ds:1582h, 1
jnz     short loc_1332A
jmp     word ptr ds:0A8Dh

loc_13325:
push    ax
push    bx
mov     bx, seg seg000

loc_1332A:
push    cx
cli
mov     ds:0A97h, bx
mov     ds:0A95h, sp
lss     esp, ds:157Ch
mov     ax, 0
mov     cx, ds:9B6h
call    large [fword ptr ds:1572h]
lss     sp, ds:0A95h
pop     cx
pop     bx
pop     ax
retn
db 8Bh, 0F4h, 8Bh, 0Eh, 0B6h, 9, 0B8h, 3
db 0, 66h, 0Fh, 0B2h, 26h, 7Ch, 15h, 66h
db 0FFh, 1Eh, 72h, 15h, 0B8h
dw seg seg000
db 8Eh, 0D0h, 8Bh, 0E6h, 8Eh, 0D8h, 0FBh
db 0FAh, 0E8h, 65h, 0FFh, 8Eh, 0D0h, 83h
db 0C4h, 10h, 0B8h, 68h, 0, 0Fh, 0, 0D0h
db 8Fh, 6, 96h, 9, 8Fh, 6, 93h, 0Ah, 66h
db 8Fh, 6, 8Fh, 0Ah, 0EAh, 33h, 1Eh, 70h
db 0
dword_1338E dd 186B3Fh
dword_13392 dd 200000h
db 0E8h, 0D6h, 0F4h, 0Dh, 2Eh, 0FFh, 2Eh
db 60h, 10h, 0E8h, 0C9h, 0F4h, 0FEh, 0, 2Bh
db 0C0h, 0C3h, 0



sub_133A8 proc near
mov     ax, 0AACh
push    ax
call    sub_13067
pop     bx
retn
sub_133A8 endp

push    bp
mov     bp, sp
sub     ax, ax
push    ax
push    word ptr [bp+4]
call    sub_133C3
pop     bx
pop     bx
mov     sp, bp
pop     bp
retn


; Attributes: bp-based frame

sub_133C3 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
mov     ax, 0E18h
push    ax
call    sub_13067
pop     bx
mov     ax, 0AC4h
push    ax
call    sub_13067
pop     bx
push    [bp+arg_0]
call    sub_13067
pop     bx
cmp     [bp+arg_2], 0
jz      short loc_133FA
mov     ax, 0ACDh
push    ax
call    sub_13067
pop     bx
push    [bp+arg_2]
call    sub_13067
pop     bx
mov     ax, 0AD0h
push    ax
call    sub_13067
pop     bx

loc_133FA:
call    sub_133A8
cmp     word ptr ds:11D4h, 0
jnz     short loc_1340A
mov     word ptr ds:11D4h, 0FFFFh

loc_1340A:
push    word ptr ds:11D4h
call    word ptr ds:0AC2h
pop     bx
mov     sp, bp
pop     bp
retn
sub_133C3 endp



; Attributes: bp-based frame

sub_13417 proc near

var_6= byte ptr -6
var_2= byte ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 6
push    si
cmp     [bp+arg_0], 0
jz      short loc_13433
push    [bp+arg_0]
call    sub_13067
pop     bx
mov     ax, 0AD2h
push    ax
call    sub_13067
pop     bx

loc_13433:
mov     si, 5
jmp     short loc_13452

loc_13438:
lea     cx, [si-1]
shl     cl, 1
shl     cl, 1
mov     bx, [bp+arg_2]
shr     bx, cl
and     bx, 0Fh
mov     al, [bx+0AB0h]
lea     bx, [bp+var_2]
sub     bx, si
mov     [bx], al

loc_13452:
dec     si
jns     short loc_13438
mov     [bp+var_2], 0
lea     ax, [bp+var_6]
push    ax
call    sub_13067
pop     bx
cmp     [bp+arg_0], 0
jz      short loc_1346F
mov     ax, 0AD4h
push    ax
call    sub_13067
pop     bx

loc_1346F:
pop     si
mov     sp, bp
pop     bp
retn
sub_13417 endp



; Attributes: bp-based frame

sub_13474 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    [bp+arg_0]
mov     ax, ds:11F8h
add     ax, 1190h
push    ax
call    sub_141AE
pop     bx
pop     bx
mov     sp, bp
pop     bp
retn
sub_13474 endp



; Attributes: bp-based frame

sub_1348A proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     ax, 1190h
push    ax
call    sub_141E0
pop     bx
cmp     ax, ds:11F8h
jnz     short loc_134A2
push    [bp+arg_0]
call    sub_13474
pop     bx

loc_134A2:
mov     sp, bp
pop     bp
retn
sub_1348A endp



; Attributes: bp-based frame

sub_134A6 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     ax, [bp+arg_0]
sub     ax, 61h ; 'a'
cmp     ax, 19h
ja      short loc_134BC
mov     ax, [bp+arg_0]
sub     ax, 20h ; ' '
pop     bp
retn

loc_134BC:
mov     ax, [bp+arg_0]
pop     bp
retn
sub_134A6 endp



; Attributes: bp-based frame

sub_134C1 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 2
jmp     short loc_134D6

loc_134C9:
push    ax
call    sub_134A6
pop     bx
mov     bx, [bp+arg_0]
inc     [bp+arg_0]
mov     [bx], al

loc_134D6:
mov     bx, [bp+arg_2]
inc     [bp+arg_2]
mov     al, [bx]
cbw
or      ax, ax
jnz     short loc_134C9
mov     bx, [bp+arg_0]
mov     byte ptr [bx], 0
mov     sp, bp
pop     bp
retn
sub_134C1 endp



; Attributes: bp-based frame

sub_134ED proc near

var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 2
push    [bp+arg_0]
mov     ax, 1190h
push    ax
call    sub_134C1
pop     bx
pop     bx
mov     ax, 1190h
push    ax
call    sub_141E0
pop     bx
mov     [bp+var_2], ax
mov     ds:11F8h, ax
jmp     short loc_13524

loc_1350F:
mov     bx, [bp+var_2]
cmp     byte ptr [bx+1190h], 5Ch ; '\'
jz      short loc_13529
cmp     byte ptr [bx+1190h], 2Eh ; '.'
jnz     short loc_13524
mov     ds:11F8h, bx

loc_13524:
dec     [bp+var_2]
jns     short loc_1350F

loc_13529:
mov     sp, bp
pop     bp
retn
sub_134ED endp



; Attributes: bp-based frame

sub_1352D proc near

var_4= word ptr -4
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 4
jmp     short loc_1354B

loc_13535:
mov     [bp+var_4], bx
inc     [bp+arg_2]
mov     al, [bx]
mov     bx, [bp+arg_0]
inc     [bp+arg_0]
cmp     [bx], al
jz      short loc_1354B
sub     ax, ax
jmp     short loc_13556

loc_1354B:
mov     bx, [bp+arg_2]
cmp     byte ptr [bx], 0
jnz     short loc_13535
mov     ax, 1

loc_13556:
mov     sp, bp
pop     bp
retn
sub_1352D endp




sub_1355A proc near
push    20h ; ' '
push    20h ; ' '
push    20h ; ' '
push    18h
call    dword ptr ds:1Eh
add     sp, 8
retn
sub_1355A endp



; Attributes: bp-based frame

sub_1356A proc near

var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_2= word ptr -2

enter   10h, 0
push    si
mov     ax, ds:9B4h
sub     dx, dx
mov     cl, 4
call    sub_14364
mov     bx, dx
mov     ds:8E2h, ax
mov     dx, ax
mov     si, bx
mov     ds:8E4h, bl
mov     [bp+var_8], dx
mov     [bp+var_6], si
add     dx, 8C0h
adc     si, 0
mov     ds:976h, dx
mov     ds:978h, si
mov     word ptr ds:8C8h, 9Fh
mov     [bp+var_C], dx
mov     [bp+var_A], si
mov     ds:8CAh, dx
mov     al, byte ptr [bp+var_A]
mov     ds:8CCh, al
mov     ax, 960h
sub     ax, 8C0h
sub     dx, dx
add     ax, [bp+var_C]
adc     dx, si
mov     cx, ax
mov     bx, dx
mov     ds:912h, ax
mov     dx, ax
mov     si, bx
mov     ds:914h, bl
sub     ax, ax
mov     ds:8CEh, ax
mov     ds:916h, ax
mov     ax, 960h
sub     ax, 0C0h
sub     dx, ax
sbb     si, 0
mov     [bp+var_E], si
mov     ds:8D2h, dx
mov     al, byte ptr [bp+var_E]
mov     ds:8D4h, al
mov     ax, ds:9B6h
sub     dx, dx
mov     cl, 4
call    sub_14364
mov     bx, dx
mov     ds:90Ah, ax
mov     ds:8DAh, ax
mov     ds:90Ch, bl
mov     ds:8DCh, bl
mov     ax, 0D74h
sub     dx, dx
add     ax, [bp+var_8]
adc     dx, [bp+var_6]
mov     cx, ax
mov     bx, dx
mov     ds:91Ah, ax
mov     ds:91Ch, bl
mov     ax, ds:0A10h
mov     dx, ds:0A12h
mov     cl, 4
call    sub_14364
mov     [bp+var_2], dx
mov     ds:932h, ax
mov     al, byte ptr [bp+var_2]
mov     ds:934h, al
mov     word ptr ds:0D70h, 80h
cmp     byte ptr ds:2Fh, 3
jl      short loc_13648
mov     word ptr ds:8FEh, 8Fh

loc_13648:
pop     si
leave
retn
sub_1356A endp



; Attributes: bp-based frame

sub_1364B proc near

var_16= word ptr -16h
var_10= word ptr -10h
var_E= byte ptr -0Eh
var_D= byte ptr -0Dh
var_2= word ptr -2
arg_0= word ptr  4

enter   18h, 0
cmp     [bp+arg_0], 0
jnz     short loc_1365A
mov     ax, 1
leave
retn

loc_1365A:
mov     ax, [bp+arg_0]
mov     [bp+var_10], ax
mov     [bp+var_16], ax
mov     [bp+var_D], 49h ; 'I'
lea     ax, [bp+var_16]
push    ax
lea     ax, [bp+var_E]
push    ax
push    ax
call    sub_142D8
mov     ax, [bp+var_2]
not     ax
and     ax, 1
leave
retn
sub_1364B endp



; Attributes: bp-based frame

sub_1367D proc near

var_2= word ptr -2
arg_0= dword ptr  4

enter   2, 0
les     bx, [bp+arg_0]
test    byte ptr es:[bx+5], 10h
jz      short locret_136CD
mov     al, es:[bx+7]
sub     ah, ah
mov     [bp+var_2], ax
test    byte ptr es:[bx+4], 0F0h
jnz     short loc_1369F
or      ax, ax
jz      short locret_136CD

loc_1369F:
push    word ptr es:[bx]
call    sub_12DAD
pop     bx
push    0
push    ax
les     bx, [bp+arg_0]
mov     ax, es:[bx+2]
mov     dx, es:[bx+4]
and     al, 0F0h
sub     dh, dh
mov     ch, byte ptr [bp+var_2]
sub     cl, cl
sub     bx, bx
add     ax, bx
adc     dx, cx
mov     cl, 4
call    sub_14370
push    dx
push    ax
call    sub_13A32

locret_136CD:
leave
retn
sub_1367D endp



; Attributes: bp-based frame

sub_136CF proc near

var_10= dword ptr -10h
var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= byte ptr -8

enter   10h, 0
push    di
push    si
sub     ax, ax
mov     ds:0D60h, ax
mov     ds:0D62h, ax
mov     ax, ds:990h
or      ax, ds:98Eh
jnz     short loc_136E9
jmp     loc_137F4

loc_136E9:
mov     ax, 938h
push    si
mov     di, ax
mov     si, 8C8h
push    ds
pop     es
assume es:nothing
movsw
movsw
movsw
movsw
pop     si
mov     si, 8
cmp     byte ptr ds:11D8h, 0
jnz     short loc_13737
push    50h ; 'P'
call    sub_13804
pop     bx
push    si
lea     di, [bp+var_8]
mov     si, 11E4h
push    ss
pop     es
assume es:nothing
movsw
movsw
movsw
movsw
pop     si
call    sub_1356A
cmp     word ptr ds:0A14h, 0
jnz     short loc_13724
call    sub_11D3C

loc_13724:
mov     ax, 910h
push    si
mov     di, ax
lea     si, [bp+var_8]
push    ds
pop     es
assume es:nothing
movsw
movsw
movsw
movsw
pop     si
mov     si, 78h ; 'x'

loc_13737:
mov     word ptr [bp+var_10], 0
mov     word ptr [bp+var_10+2], 50h ; 'P'
mov     ax, ds:938h
and     al, 0F8h
mov     [bp+var_C], ax
mov     [bp+var_A], si
call    sub_1355A
push    1
call    sub_12E36
pop     bx
jmp     short loc_13775

loc_13757:
mov     bx, [bp+var_C]
shr     bx, 3
les     di, [bp+var_10]
assume es:nothing
test    byte ptr es:[bx+di], 1
jz      short loc_13771
push    [bp+var_A]
push    [bp+var_C]
call    sub_1367D
pop     bx
pop     bx

loc_13771:
sub     [bp+var_C], 8

loc_13775:
cmp     [bp+var_C], 80h
jnb     short loc_13757
mov     [bp+var_C], 50h ; 'P'
push    [bp+var_A]
push    [bp+var_C]
call    sub_1367D
pop     bx
pop     bx
mov     [bp+var_C], 8
push    [bp+var_A]
push    [bp+var_C]
call    sub_1367D
pop     bx
pop     bx
mov     [bp+var_C], 70h ; 'p'
cmp     byte ptr ds:9F8h, 0
jnz     short loc_137BA
test    byte ptr ds:47h, 80h
jnz     short loc_137BA
push    [bp+var_A]
push    [bp+var_C]
call    sub_1367D
pop     bx
pop     bx

loc_137BA:
call    sub_13008
call    sub_12D91
cmp     byte ptr ds:11D8h, 0
jnz     short loc_137F4
mov     ax, ds:990h
or      ax, ds:98Eh
jz      short loc_137F4
cmp     word ptr ds:990h, 10h
jg      short loc_137F4
jge     short loc_137F4
mov     ax, ds:98Eh
mov     dx, ds:990h
mov     cl, 4
call    sub_14370
push    ax
call    sub_1364B
pop     bx
or      ax, ax
jnz     short loc_137F4
push    16h
call    sub_13E6D
pop     bx

loc_137F4:
mov     word ptr ds:97Eh, 0
mov     word ptr ds:97Ch, 2FFh
pop     si
pop     di
leave
retn
sub_136CF endp



; Attributes: bp-based frame

sub_13804 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     ax, ds:97Ch
cmp     [bp+arg_0], ax
jbe     short loc_13824
sub     al, al
mov     ds:11E9h, al
mov     ds:11E8h, al
sub     ax, ax
mov     ds:11EAh, ax
mov     ds:11E6h, ax
mov     ds:11E4h, ax
leave
retn

loc_13824:
push    8
push    11E4h
mov     ax, [bp+arg_0]
and     al, 0F8h
sub     dx, dx
add     ax, ds:98Eh
adc     dx, ds:990h
push    dx
push    ax
call    sub_12DBD
mov     ax, 1
leave
retn
sub_13804 endp

push    bp
mov     bp, sp
mov     ax, ds:97Ch
cmp     [bp+4], ax
jbe     short loc_13851
sub     ax, ax
leave
retn

loc_13851:
push    8
push    11E4h
mov     ax, [bp+4]
and     al, 0F8h
sub     dx, dx
add     ax, ds:98Eh
adc     dx, ds:990h
push    dx
push    ax
call    sub_12DF2
mov     ax, 1
leave
retn


; Attributes: bp-based frame

sub_1386F proc near

var_8= word ptr -8
var_6= word ptr -6
var_4= byte ptr -4
var_3= byte ptr -3
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah
arg_8= byte ptr  0Ch

enter   8, 0
mov     ax, [bp+arg_6]
mov     [bp+var_8], ax
mov     al, [bp+arg_8]
mov     [bp+var_3], al
mov     ax, [bp+arg_2]
shl     ax, 4
mov     [bp+var_6], ax
mov     ax, [bp+arg_2]
mov     dx, [bp+arg_4]
mov     cl, 0Ch
call    sub_14370
mov     [bp+var_4], al
mov     ax, [bp+arg_4]
sar     ax, 4
mov     ah, al
sub     al, al
mov     [bp+var_2], ax
push    8
lea     ax, [bp+var_8]
push    ax
mov     ax, [bp+arg_0]
shl     ax, 3
sub     dx, dx
add     ax, ds:98Eh
adc     dx, ds:990h
push    dx
push    ax
call    sub_12DF2
leave
retn
sub_1386F endp



; Attributes: bp-based frame

sub_138C0 proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
push    92h
push    [bp+arg_4]
push    0
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1386F
leave
retn
sub_138C0 endp



; Attributes: bp-based frame

sub_138D6 proc near

var_56= byte ptr -56h
var_46= word ptr -46h
var_44= word ptr -44h
var_42= byte ptr -42h
var_41= byte ptr -41h
var_3E= word ptr -3Eh
var_3A= byte ptr -3Ah
var_39= byte ptr -39h
var_38= word ptr -38h
var_26= word ptr -26h
var_1E= word ptr -1Eh
var_1C= word ptr -1Ch
var_1A= word ptr -1Ah
var_18= word ptr -18h
var_16= dword ptr -16h
var_12= byte ptr -12h
var_11= byte ptr -11h
var_E= word ptr -0Eh
var_A= word ptr -0Ah
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

enter   56h, 0
push    si
cmp     [bp+arg_0], 0
jnz     short loc_138E6
sub     ax, ax
pop     si
leave
retn

loc_138E6:
push    30h ; '0'
push    0
lea     ax, [bp+var_56]
push    ax
call    sub_14336
add     sp, 6
lea     ax, [bp+var_1E]
mov     [bp+var_1A], ax
mov     [bp+var_18], ss
mov     ax, ss
sub     dx, dx
mov     cl, 4
call    sub_14364
add     ax, [bp+var_1A]
adc     dx, 0
mov     [bp+var_4], ax
mov     [bp+var_2], dx
mov     bx, dx
mov     [bp+var_44], ax
mov     [bp+var_42], bl
mov     [bp+var_3A], 0C0h
mov     [bp+var_38], 8000h
mov     al, 0F2h
mov     [bp+var_39], al
mov     [bp+var_41], al
mov     [bp+var_11], 87h
mov     ax, 1
mov     [bp+var_46], ax
mov     [bp+var_3E], ax
mov     [bp+var_E], ax
lea     ax, [bp+var_56]
mov     [bp+var_1A], ax
mov     [bp+var_18], ss
mov     [bp+var_A], ax
mov     ax, ss
mov     [bp+var_26], ax
mov     [bp+var_1E], 0FEh
lea     ax, [bp+var_26]
push    ax
lea     cx, [bp+var_12]
push    cx
push    cx
push    15h
call    sub_141FC
add     sp, 8
mov     ax, ds:11ECh
mov     dx, 0F000h
mov     word ptr [bp+var_16], ax
mov     word ptr [bp+var_16+2], dx
mov     es, dx
assume es:nothing
mov     bx, ax
mov     cx, [bp+arg_0]
sub     es:[bx+4], cx
mov     si, es:[bx+6]
mov     [bp+var_1C], si
sub     es:[bx+6], cx
mov     [bp+var_1E], 0FCh
mov     [bp+var_11], 87h
mov     [bp+var_E], 1
lea     ax, [bp+var_26]
push    ax
lea     ax, [bp+var_12]
push    ax
push    ax
push    15h
call    sub_141FC
add     sp, 8
mov     ax, [bp+var_1C]
les     bx, [bp+var_16]
assume es:nothing
sub     ax, es:[bx+6]
mov     [bp+arg_0], ax
sub     ds:120Ah, ax
mov     ax, ds:120Ah
pop     si
leave
retn
sub_138D6 endp

word_139BA dw 0



sub_139BC proc near
mov     bx, 10h

loc_139BF:
dec     bx
dec     bx
js      short locret_139E1
mov     dx, [bx+0ADCh]
or      dx, dx
jz      short loc_139BF
push    bx
mov     ah, 0Dh
call    dword ptr ds:0AECh
mov     ah, 0Ah
call    dword ptr ds:0AECh
pop     bx
mov     word ptr [bx+0ADCh], 0
jmp     short loc_139BF

locret_139E1:
retn
sub_139BC endp

db 33h, 0C0h, 99h, 0EBh, 3Ch, 0E8h, 0A7h
db 0F3h, 5Ah, 0Bh, 0D2h, 74h, 19h, 0B4h
db 9, 0FFh, 1Eh, 0ECh, 0Ah, 0Bh, 0C0h, 74h
db 0E9h, 89h, 14h, 0B4h, 0Ch, 0FFh, 1Eh
db 0ECh, 0Ah, 0Bh, 0C0h, 74h, 0DDh, 93h
db 0EBh, 1Bh, 0B4h, 8, 0FFh, 1Eh, 0ECh, 0Ah
db 2Eh, 2Bh, 6, 0EAh, 1Dh, 72h, 0CDh, 3Bh
db 6, 0F0h, 0Ah, 76h, 3, 0A1h, 0F0h, 0Ah
db 0B9h, 0, 4, 0F7h, 0E1h, 52h, 50h, 0E8h
db 32h, 0FBh, 0EAh, 3Ch, 3Eh, 70h, 0

loc_13A2D:
call    sub_13A4B
cwd
db 22h



sub_13A32 proc near
call    sub_13A4B
fldenv  byte ptr [si]
call    sub_13A4B

loc_13A3A:
shl     byte ptr [bx+di], 0E8h
sub_13A32 endp

or      al, 0
outsb
aas



sub_13A41 proc near
call    sub_13A4B
das
aas
sub_13A41 endp




sub_13A46 proc near
call    sub_13A4B
jns     short loc_13A84
sub_13A46 endp




sub_13A4B proc near
pop     bx
mov     cx, cs:[bx]
mov     bx, ds:0AFAh
inc     bx
inc     bx
mov     ds:0AFAh, bx
pop     word ptr [bx]
push    3E4Ah
jmp     dword ptr ds:0AF2h
sub_13A4B endp ; sp-analysis failed

jmp     cx



sub_13A64 proc near
mov     bx, sp
push    di
push    si
mov     di, ss:[bx+4]
cmp     word ptr ds:0A12h, 0
jnz     short loc_13ACF
call    sub_13AE9
shr     ax, 1
xchg    ax, cx
add     di, 0Fh
and     di, 0FFF0h
mov     ax, di
shr     ax, 4

loc_13A84:
mov     bx, ds:0A10h
mov     dx, cs
sub     bx, dx
sub     bx, ax
add     ax, dx
cld
xchg    ax, ds:0A10h
xor     si, si
mov     ds, ax
assume ds:nothing
mov     es, dx
assume es:seg002
rep movsw
push    ss
pop     ds
push    bx
call    sub_13AF3
pop     cx
shl     cx, 3

loc_13AA7:
push    cs
pop     es
mov     ax, 0CCCCh
mov     bx, di
rep stosw
add     bx, 0Fh
shr     bx, 4
add     bx, ds:9B6h
mov     ax, ds:0CEAh
sub     bx, ax
mov     ds:5Ah, bx
mov     es, ax
assume es:nothing
mov     ah, 4Ah
int     21h             ; DOS - 2+ - ADJUST MEMORY BLOCK SIZE (SETBLOCK)
                        ; ES = segment address of block to change
                        ; BX = new size in paragraphs
pop     si
pop     di
pop     ax
pop     sp
pop     bp
retn

loc_13ACF:
mov     cx, ds:0CEAh
dec     cx
mov     es, cx
add     cx, es:3
inc     cx
mov     ax, cs
sub     cx, ax
shl     cx, 4
sub     cx, di
shr     cx, 1
jmp     short loc_13AA7
sub_13A64 endp ; sp-analysis failed




sub_13AE9 proc near
mov     ax, seg seg004
sub     ax, seg seg003
shl     ax, 4
retn
sub_13AE9 endp




sub_13AF3 proc near
push    9Bh
call    sub_13AE9
dec     ax
push    ax
mov     ds:930h, ax
mov     dx, ds:0A12h
mov     ax, ds:0A10h
push    dx
push    ax
mov     cx, 4

loc_13B0A:
shl     ax, 1
rcl     dx, 1
loop    loc_13B0A
mov     ds:932h, ax
mov     ds:934h, dl
push    0Eh
call    sub_1386F
add     sp, 0Ah
retn
sub_13AF3 endp

db 0E8h, 85h, 2 dup(0), 0E8h, 81h, 0, 1
db 0E8h, 7Dh, 0, 2, 0E8h, 79h, 0, 3, 0E8h
db 75h, 0, 4, 0E8h, 71h, 0, 5, 0E8h, 6Dh
db 0, 6, 0E8h, 69h, 0, 7, 0E8h, 65h, 0, 8
db 0E8h, 61h, 0, 9, 0E8h, 5Dh, 0, 0Ah, 0E8h
db 59h, 0, 0Bh, 0E8h, 55h, 0, 0Ch, 0E8h
db 51h, 0, 0Dh, 0E8h, 4Dh, 0, 0Eh, 0E8h
db 49h, 0, 0Fh
dd 0
word_13B64 dw 0
db 0E8h, 93h, 0E9h, 2Eh, 87h, 0Eh, 0ABh
db 1Fh, 89h, 4Eh, 14h, 0EBh, 0, 58h, 17h
db 94h, 1Fh, 7, 66h, 61h, 9Dh
dw 0FFFFh
db 9Ch, 0FAh, 2Eh, 8Fh, 6, 94h, 1Fh, 68h
dw seg seg000
db 17h, 36h, 8Bh, 26h, 96h, 9, 66h, 60h
db 6, 1Eh, 16h, 1Fh, 8Bh, 0ECh, 8Bh, 46h
db 38h, 2Eh, 0A3h, 0ABh, 1Fh, 0E8h, 0C1h
db 0E2h, 2Eh, 0A1h, 94h, 1Fh, 0EAh, 5Dh
db 4Ch, 70h, 0, 9Ch, 0FAh, 2Eh, 8Fh, 6, 94h
db 1Fh, 2Eh, 8Ch, 16h, 92h, 1Fh, 2Eh, 89h
db 26h, 90h, 1Fh, 68h
dw seg seg000
db 17h, 36h, 8Bh, 26h, 96h, 9, 81h, 0ECh
db 80h, 1, 66h, 60h, 6, 1Eh, 16h, 1Fh, 2Eh
db 0FFh, 36h, 94h, 1Fh, 2Eh, 0C4h, 1Eh, 90h
db 1Fh, 6, 53h, 26h, 8Bh, 1Fh, 2Eh, 0FFh
db 37h, 0E8h, 7Fh, 0E2h, 0EAh, 75h, 4Eh
db 70h, 0, 0E8h, 13h, 0E9h, 8Eh, 0DFh, 2Eh
db 89h, 3Eh, 92h, 1Fh, 2Eh, 89h, 36h, 90h
db 1Fh, 8Fh, 4, 8Fh, 44h, 2, 8Fh, 44h, 4
db 1Fh, 7, 66h, 61h, 2Eh, 8Eh, 16h, 92h
db 1Fh, 2Eh, 8Bh, 26h, 90h, 1Fh, 0CFh, 0CBh
db 9Ch, 0FAh, 2Eh, 8Fh, 6, 94h, 1Fh, 68h
dw seg seg000
pop     ss
mov     sp, ss:996h
sub     sp, 80h
pusha
push    ss
pop     ds
call    sub_11E60

loc_13C27:
popa
mov     ds, ax
mov     es, cx
mov     ss, dx
mov     sp, bx
push    cs:word_13B64
push    si
push    di
iret
call    sub_124FC
jmp     short loc_13C27
call    sub_1286B
pop     es


; Attributes: noreturn

sub_13C41 proc near
call    sub_11E60
jmp     far ptr 70h:5401h
sub_13C41 endp

call    sub_124FC
retn
align 2
word_13C4E dw 20h



sub_13C50 proc far
pop     ax
pop     bx
pop     cx
push    ax
push    0
push    cx
push    bx
push    word ptr ds:0C3Ah
push    54E2h
retf
sub_13C50 endp ; sp-analysis failed




sub_13C60 proc near
push    di
push    si
mov     al, ds:0CD8h
inc     byte ptr ds:0CD8h
or      al, al
jnz     short loc_13C70
call    sub_13011

loc_13C70:
mov     bx, ds:996h
cmp     word ptr [bx+18h], 21h ; '!'
jnz     short loc_13C83
mov     al, [bx+16h]
cbw
push    ax
call    loc_11C02
pop     bx

loc_13C83:
call    sub_12D97
call    sub_133A8
mov     bx, ds:996h
cmp     word ptr [bx+18h], 0
jge     short loc_13C96
jmp     loc_13E27

loc_13C96:
mov     ax, 0C4Ch
push    ax
call    sub_13067
pop     bx
mov     bx, ds:996h
cmp     word ptr [bx+18h], 0Dh
jnz     short loc_13CAD
mov     ax, 0C59h
jmp     short loc_13CB6

loc_13CAD:
cmp     word ptr [bx+18h], 6
jnz     short loc_13CBC
mov     ax, 0C72h

loc_13CB6:
push    ax
call    sub_13067
jmp     short loc_13CE2

loc_13CBC:
cmp     word ptr [bx+18h], 0Eh
jnz     short loc_13CD7
push    word ptr ds:0D32h
mov     ax, 0C81h
push    ax
call    sub_13417
pop     bx
pop     bx
push    word ptr ds:0D30h
sub     ax, ax
jmp     short loc_13CDD

loc_13CD7:
push    word ptr [bx+18h]
mov     ax, 0C8Ch

loc_13CDD:
push    ax
call    sub_13417
pop     bx

loc_13CE2:
pop     bx
mov     ax, 0CA1h
push    ax
call    sub_13067
pop     bx
mov     si, ds:11F8h
add     si, 1190h
jmp     short loc_13CFF

loc_13CF5:
cmp     byte ptr [si], 3Ah ; ':'
jz      short loc_13D06
cmp     byte ptr [si], 5Ch ; '\'
jz      short loc_13D06

loc_13CFF:
dec     si
cmp     si, 1190h
jnb     short loc_13CF5

loc_13D06:
lea     ax, [si+1]
push    ax
call    sub_13067
pop     bx
mov     ax, 0CA6h
push    ax
call    sub_13067
pop     bx
mov     bx, ds:996h
push    word ptr [bx+22h]
sub     ax, ax
push    ax
call    sub_13417
pop     bx
pop     bx
mov     ax, 0CABh
push    ax
call    sub_13067
pop     bx
mov     bx, ds:996h
push    word ptr [bx+1Eh]
sub     ax, ax
push    ax
call    sub_13417
pop     bx
pop     bx
mov     bx, ds:996h
push    word ptr [bx+22h]
call    sub_13E32
pop     bx
mov     di, ax
or      di, di
jz      short loc_13D57
push    di
mov     ax, 0CADh
push    ax
call    sub_13417
pop     bx
pop     bx

loc_13D57:
call    sub_133A8
mov     bx, ds:996h
push    word ptr [bx+1Ah]
mov     ax, 0CB2h
push    ax
call    sub_13417
pop     bx
pop     bx
mov     bx, ds:996h
push    word ptr [bx+2]
mov     ax, 0CB7h
push    ax
call    sub_13417
pop     bx
pop     bx
mov     bx, ds:996h
push    word ptr [bx+4]
mov     ax, 0CBAh
push    ax
call    sub_13417
pop     bx
pop     bx
mov     bx, ds:996h
push    word ptr [bx+6]
mov     ax, 0CBDh
push    ax
call    sub_13417
pop     bx
pop     bx
call    sub_133A8
mov     bx, ds:996h
push    word ptr [bx+16h]
mov     ax, 0CC0h
push    ax
call    sub_13417
pop     bx
pop     bx
mov     bx, ds:996h
push    word ptr [bx+10h]
mov     ax, 0CC3h
push    ax
call    sub_13417
pop     bx
pop     bx
mov     bx, ds:996h
push    word ptr [bx+14h]
mov     ax, 0CC6h
push    ax
call    sub_13417
pop     bx
pop     bx
mov     bx, ds:996h
push    word ptr [bx+12h]
mov     ax, 0CC9h
push    ax
call    sub_13417
pop     bx
pop     bx
mov     bx, ds:996h
push    word ptr [bx+0Eh]
mov     ax, 0CCCh
push    ax
call    sub_13417
pop     bx
pop     bx
mov     bx, ds:996h
push    word ptr [bx+0Ch]
mov     ax, 0CCFh
push    ax
call    sub_13417
pop     bx
pop     bx
mov     bx, ds:996h
push    word ptr [bx+0Ah]
mov     ax, 0CD2h
push    ax
call    sub_13417
pop     bx
pop     bx
mov     bx, ds:996h
push    word ptr [bx+8]
mov     ax, 0CD5h
push    ax
call    sub_13417
pop     bx
pop     bx
test    byte ptr ds:15h, 80h
jz      short loc_13E27
call    sub_12E4A

loc_13E27:
mov     ax, 0FFFFh
push    ax
call    loc_11C02
pop     bx
pop     si
pop     di
retn
sub_13C60 endp



; Attributes: bp-based frame

sub_13E32 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    di
push    si
cmp     word ptr ds:0ED6h, 0
jz      short loc_13E65
les     bx, ds:0ED4h
mov     si, es:[bx+2]
jmp     short loc_13E49

loc_13E48:
dec     si

loc_13E49:
cmp     si, 10h
jl      short loc_13E65
mov     ax, [bp+arg_0]
mov     di, si
shl     di, 1
cmp     es:[bx+di], ax
jnz     short loc_13E48
mov     ax, si
mov     cl, 3
shl     ax, cl
add     ax, es:[bx]
jmp     short loc_13E67

loc_13E65:
sub     ax, ax

loc_13E67:
pop     si
pop     di
mov     sp, bp
pop     bp
retn
sub_13E32 endp



; Attributes: bp-based frame

sub_13E6D proc near

var_9A= word ptr -9Ah
var_98= byte ptr -98h
var_97= byte ptr -97h
var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 9Ch
push    di
push    si
mov     [bp+var_2], 0
cmp     [bp+arg_0], 0
jge     short loc_13E89
mov     [bp+var_2], 1
neg     [bp+arg_0]

loc_13E89:
mov     ax, [bp+arg_0]
mov     [bp+var_9A], ax
lea     si, [bp+var_98]
cmp     byte ptr ds:0F21h, 1
jz      short loc_13EED
mov     [bp+var_98], 5Bh ; '['
lea     si, [bp+var_97]

loc_13EA4:
inc     si
mov     cx, 0Ah
mov     ax, [bp+var_9A]
cwd
idiv    cx
mov     [bp+var_9A], ax
or      ax, ax
jnz     short loc_13EA4
mov     di, si
mov     ax, [bp+arg_0]
mov     [bp+var_9A], ax

loc_13EC0:
cwd
idiv    cx
mov     bx, dx
mov     al, [bx+0AB0h]
dec     di
mov     [di], al
mov     ax, [bp+var_9A]
cwd
idiv    cx
mov     [bp+var_9A], ax
or      ax, ax
jnz     short loc_13EC0
inc     si
mov     byte ptr [si-1], 5Dh ; ']'
inc     si
mov     byte ptr [si-1], 20h ; ' '
inc     si
mov     byte ptr [si-1], 20h ; ' '
mov     byte ptr [si], 0

loc_13EED:
mov     di, 15E8h
jmp     short loc_13F0D

loc_13EF2:
cmp     ds:0F22h, di
jbe     short loc_13F19
cmp     ax, [bp+arg_0]
jnz     short loc_13F06
push    di
push    si
call    sub_141AE
pop     bx
pop     bx
jmp     short loc_13F19

loc_13F06:
inc     di
cmp     byte ptr [di-1], 0
jnz     short loc_13F06

loc_13F0D:
mov     ax, [di]
inc     di
inc     di
mov     [bp+var_9A], ax
or      ax, ax
jge     short loc_13EF2

loc_13F19:
cmp     [bp+var_2], 0
jz      short loc_13F2E
mov     ax, 1190h
push    ax
lea     ax, [bp+var_98]
push    ax
call    word ptr ds:0E6Ch
pop     bx
pop     bx

loc_13F2E:
sub     ax, ax
push    ax
lea     ax, [bp+var_98]
push    ax
call    word ptr ds:0E6Ch
pop     bx
pop     bx
pop     si
pop     di
mov     sp, bp
pop     bp
retn
sub_13E6D endp

assume ss:seg001, ds:nothing



public start
start proc near
mov     di, seg seg000
mov     ss, di
assume ss:seg000
add     sp, 120Eh
mov     si, seg seg002
sub     si, di
mov     ax, si
mov     cl, 4
shl     ax, cl
dec     ax
mov     ss:word_10CE4, ax
mov     ss:word_10CDA, sp
mov     si, seg seg004
inc     si
mov     ds:2, si
mov     bx, es
sub     bx, si
neg     bx
mov     ah, 4Ah
int     21h             ; DOS - 2+ - ADJUST MEMORY BLOCK SIZE (SETBLOCK)
                        ; ES = segment address of block to change
                        ; BX = new size in paragraphs
mov     ss:word_10CEA, ds
push    ss
pop     es
assume es:seg000
cld
mov     di, 1186h
mov     cx, 1210h
sub     cx, di
xor     ax, ax
rep stosb
push    ss
pop     ds
assume ds:seg000
mov     ah, 30h
int     21h             ; DOS -
mov     word_10CEC, ax
mov     bx, 4

loc_13F92:
mov     ax, 4400h
int     21h             ; DOS - 2+ - IOCTL - GET DEVICE INFORMATION
                        ; BX = file or device handle
jb      short loc_13FA3
test    dl, 80h
jz      short loc_13FA3
or      byte ptr [bx+0CF8h], 40h

loc_13FA3:
dec     bx
jns     short loc_13F92
call    sub_14020
xor     bp, bp
push    ss
pop     ds
push    word_10CF4
push    word_10CF2
push    word_10CF0
call    sub_14958
retn
start endp ; sp-analysis failed

db 4 dup(0)
dw seg seg000
align 2


; Attributes: bp-based frame

sub_13FC4 proc near

var_E= byte ptr -0Eh
var_D= byte ptr -0Dh
arg_0= byte ptr  4

push    bp
mov     bp, sp
sub     sp, 0Eh
mov     [bp+var_D], 4Ch ; 'L'
mov     al, [bp+arg_0]
mov     [bp+var_E], al
lea     ax, [bp+var_E]
push    ax
push    ax
call    sub_14290
pop     bx
pop     bx
mov     sp, bp
pop     bp
retn
sub_13FC4 endp



; Attributes: bp-based frame

sub_13FE2 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    [bp+arg_0]
call    sub_13FC4
pop     bx
mov     sp, bp
pop     bp
retn
sub_13FE2 endp



; Attributes: bp-based frame

sub_13FF0 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    [bp+arg_0]
call    sub_13FE2
pop     bx
mov     sp, bp
pop     bp
retn
sub_13FF0 endp



; Attributes: bp-based frame

sub_13FFE proc near

var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 2
push    [bp+arg_0]
call    sub_18173
pop     bx
mov     [bp+var_2], ax
inc     ax
jz      short loc_14016
mov     ax, [bp+var_2]
jmp     short loc_14018

loc_14016:
sub     ax, ax

loc_14018:
mov     sp, bp
pop     bp
retn
sub_13FFE endp

sub     ax, ax
cwd
retn



sub_14020 proc near
pop     word_10D0E
mov     ah, 30h
int     21h             ; DOS - GET DOS VERSION
                        ; Return: AL = major version number (00h for DOS 1.x)
mov     word_10CEC, ax
mov     dx, 1
cmp     al, 2
jz      short loc_1405B
mov     es, word_10CEA
assume es:nothing
mov     es, word ptr es:2Ch
mov     word ptr dword_10CF6+2, es
xor     ax, ax
cwd
mov     cx, 8000h
xor     di, di

loc_14047:
repne scasb
scasb
jnz     short loc_14047
inc     di
inc     di
mov     word ptr dword_10CF6, di
mov     cx, 0FFFFh
repne scasb
not     cx
mov     dx, cx

loc_1405B:
mov     di, 1
mov     si, 81h
mov     ds, word_10CEA
assume ds:nothing

loc_14065:
lodsb
cmp     al, 20h ; ' '
jz      short loc_14065
cmp     al, 9
jz      short loc_14065
cmp     al, 0Dh
jz      short loc_140E1
or      al, al
jz      short loc_140E1
inc     di

loc_14077:
dec     si

loc_14078:
lodsb
cmp     al, 20h ; ' '
jz      short loc_14065
cmp     al, 9
jz      short loc_14065
cmp     al, 0Dh
jz      short loc_140E1
or      al, al
jz      short loc_140E1
cmp     al, 22h ; '"'
jz      short loc_140B1
cmp     al, 5Ch ; '\'
jz      short loc_14094
inc     dx
jmp     short loc_14078

loc_14094:
xor     cx, cx

loc_14096:
inc     cx
lodsb
cmp     al, 5Ch ; '\'
jz      short loc_14096
cmp     al, 22h ; '"'
jz      short loc_140A4
add     dx, cx
jmp     short loc_14077

loc_140A4:
mov     ax, cx
shr     cx, 1
adc     dx, cx
test    al, 1
jnz     short loc_14078
jmp     short loc_140B1

loc_140B0:
dec     si

loc_140B1:
lodsb
cmp     al, 0Dh
jz      short loc_140E1
or      al, al
jz      short loc_140E1
cmp     al, 22h ; '"'
jz      short loc_14078
cmp     al, 5Ch ; '\'
jz      short loc_140C5
inc     dx
jmp     short loc_140B1

loc_140C5:
xor     cx, cx

loc_140C7:
inc     cx
lodsb
cmp     al, 5Ch ; '\'
jz      short loc_140C7
cmp     al, 22h ; '"'
jz      short loc_140D5
add     dx, cx
jmp     short loc_140B0

loc_140D5:
mov     ax, cx
shr     cx, 1
adc     dx, cx
test    al, 1
jnz     short loc_140B1
jmp     short loc_14078

loc_140E1:
push    ss
pop     ds
assume ds:seg000
mov     word_10CF0, di
add     dx, di
inc     di
shl     di, 1
add     dx, di
inc     dx
and     dl, 0FEh
sub     sp, dx
mov     ax, sp
mov     word_10CF2, ax
mov     bx, ax
add     di, bx
push    ss
pop     es
assume es:seg000
mov     ss:[bx], di
inc     bx
inc     bx
lds     si, dword_10CF6
assume ds:nothing

loc_14108:
lodsb
stosb
or      al, al
jnz     short loc_14108
mov     ds, ss:word_10CEA
mov     si, 81h
jmp     short loc_1411B

loc_14118:
xor     ax, ax
stosb

loc_1411B:
lodsb
cmp     al, 20h ; ' '
jz      short loc_1411B
cmp     al, 9
jz      short loc_1411B
cmp     al, 0Dh
jz      short loc_141A4
or      al, al
jz      short loc_141A4
mov     ss:[bx], di
inc     bx
inc     bx

loc_14131:
dec     si

loc_14132:
lodsb
cmp     al, 20h ; ' '
jz      short loc_14118
cmp     al, 9
jz      short loc_14118
cmp     al, 0Dh
jz      short loc_141A1
or      al, al
jz      short loc_141A1
cmp     al, 22h ; '"'
jz      short loc_1416E
cmp     al, 5Ch ; '\'
jz      short loc_1414E
stosb
jmp     short loc_14132

loc_1414E:
xor     cx, cx

loc_14150:
inc     cx
lodsb
cmp     al, 5Ch ; '\'
jz      short loc_14150
cmp     al, 22h ; '"'
jz      short loc_14160
mov     al, 5Ch ; '\'
rep stosb
jmp     short loc_14131

loc_14160:
mov     al, 5Ch ; '\'
shr     cx, 1
rep stosb
jnb     short loc_1416E
mov     al, 22h ; '"'
stosb
jmp     short loc_14132

loc_1416D:
dec     si

loc_1416E:
lodsb
cmp     al, 0Dh
jz      short loc_141A1
or      al, al
jz      short loc_141A1
cmp     al, 22h ; '"'
jz      short loc_14132
cmp     al, 5Ch ; '\'
jz      short loc_14182
stosb
jmp     short loc_1416E

loc_14182:
xor     cx, cx

loc_14184:
inc     cx
lodsb
cmp     al, 5Ch ; '\'
jz      short loc_14184
cmp     al, 22h ; '"'
jz      short loc_14194
mov     al, 5Ch ; '\'
rep stosb
jmp     short loc_1416D

loc_14194:
mov     al, 5Ch ; '\'
shr     cx, 1
rep stosb
jnb     short loc_14132
mov     al, 22h ; '"'
stosb
jmp     short loc_1416E

loc_141A1:
xor     ax, ax
stosb

loc_141A4:
push    ss
pop     ds
assume ds:seg000
mov     word ptr [bx], 0
jmp     word_10D0E
sub_14020 endp ; sp-analysis failed



; Attributes: bp-based frame

sub_141AE proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
mov     dx, di
mov     bx, si
mov     si, [bp+arg_2]
mov     di, si
mov     ax, ds
mov     es, ax
xor     ax, ax
mov     cx, 0FFFFh
repne scasb
not     cx
mov     di, [bp+arg_0]
mov     ax, di
test    al, 1
jz      short loc_141D2
movsb
dec     cx

loc_141D2:
shr     cx, 1
rep movsw
adc     cx, cx
rep movsb
mov     si, bx
mov     di, dx
pop     bp
retn
sub_141AE endp



; Attributes: bp-based frame

sub_141E0 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     dx, di
mov     ax, ds
mov     es, ax
mov     di, [bp+arg_0]
xor     ax, ax
mov     cx, 0FFFFh
repne scasb
not     cx
dec     cx
xchg    ax, cx
mov     di, dx
pop     bp
retn
sub_141E0 endp

align 2


; Attributes: bp-based frame

sub_141FC proc near

var_10= dword ptr -10h
var_C= byte ptr -0Ch
var_B= byte ptr -0Bh
var_A= byte ptr -0Ah
var_9= byte ptr -9
var_8= byte ptr -8
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
push    si
push    di
push    ds
sub     sp, 0Ah
mov     [bp+var_C], 0CDh
mov     ax, [bp+arg_0]
mov     [bp+var_B], al
cmp     al, 25h ; '%'
jz      short loc_1421D
cmp     al, 26h ; '&'
jz      short loc_1421D
mov     [bp+var_A], 0CBh
jmp     short loc_14229

loc_1421D:
mov     [bp+var_8], 0CBh
mov     [bp+var_9], 44h ; 'D'
mov     [bp+var_A], 44h ; 'D'

loc_14229:
mov     word ptr [bp+var_10+2], ss
lea     ax, [bp+var_C]
mov     word ptr [bp+var_10], ax
mov     di, [bp+arg_2]
mov     ax, [di]
mov     bx, [di+2]
mov     cx, [di+4]
mov     dx, [di+6]
mov     si, [di+8]
push    word ptr [di+0Ah]
mov     di, [bp+arg_6]
mov     es, word ptr [di]
assume es:nothing
mov     ds, word ptr [di+6]
assume ds:nothing
pop     di
push    bp
call    [bp+var_10]
pop     bp
cld
push    di
push    ds
push    ss
pop     ds
assume ds:seg000
mov     di, [bp+arg_6]
mov     word ptr [di], es
pop     word ptr [di+6]
mov     di, [bp+arg_4]
mov     [di], ax
mov     [di+2], bx
mov     [di+4], cx
mov     [di+6], dx
mov     [di+8], si
pop     word ptr [di+0Ah]
jb      short loc_1427B
xor     si, si
jmp     short loc_14283

loc_1427B:
call    sub_1439E
mov     si, 1
mov     ax, [di]

loc_14283:
mov     [di+0Ch], si
add     sp, 0Ah
pop     ds
assume ds:nothing
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_141FC endp



; Attributes: bp-based frame

sub_14290 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    si
push    di
mov     di, [bp+arg_0]
mov     ax, [di]
mov     bx, [di+2]
mov     cx, [di+4]
mov     dx, [di+6]
mov     si, [di+8]
mov     di, [di+0Ah]
int     21h             ; DOS -
push    di
mov     di, [bp+arg_2]
mov     [di], ax
mov     [di+2], bx
mov     [di+4], cx
mov     [di+6], dx
mov     [di+8], si
pop     word ptr [di+0Ah]
jb      short loc_142C6
xor     si, si
jmp     short loc_142CE

loc_142C6:
call    sub_1439E
mov     si, 1
mov     ax, [di]

loc_142CE:
mov     [di+0Ch], si
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_14290 endp

align 2


; Attributes: bp-based frame

sub_142D8 proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
push    si
push    di
mov     di, [bp+arg_0]
mov     ax, [di]
mov     bx, [di+2]
mov     cx, [di+4]
mov     dx, [di+6]
mov     si, [di+8]
push    word ptr [di+0Ah]
mov     di, [bp+arg_4]
mov     es, word ptr [di]
mov     ds, word ptr [di+6]
pop     di
int     21h             ; DOS -
push    di
push    ds
mov     di, ss
mov     ds, di
assume ds:seg000
mov     di, [bp+arg_4]
mov     word ptr [di], es
pop     word ptr [di+6]
mov     di, [bp+arg_2]
mov     [di], ax
mov     [di+2], bx
mov     [di+4], cx
mov     [di+6], dx
mov     [di+8], si
pop     word ptr [di+0Ah]
jb      short loc_14324
xor     si, si
jmp     short loc_1432C

loc_14324:
call    sub_1439E
mov     si, 1
mov     ax, [di]

loc_1432C:
mov     [di+0Ch], si
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_142D8 endp

align 2


; Attributes: bp-based frame

sub_14336 proc near

arg_0= word ptr  4
arg_2= byte ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
mov     dx, di
mov     ax, ds
mov     es, ax
assume es:seg000
mov     di, [bp+arg_0]
mov     bx, di
mov     cx, [bp+arg_4]
jcxz    short loc_1435E
mov     al, [bp+arg_2]
mov     ah, al
test    di, 1
jz      short loc_14356
stosb
dec     cx

loc_14356:
shr     cx, 1
rep stosw
adc     cx, cx
rep stosb

loc_1435E:
mov     di, dx
xchg    ax, bx
pop     bp
retn
sub_14336 endp

align 2



sub_14364 proc near
xor     ch, ch
jcxz    short locret_1436E

loc_14368:
shl     ax, 1
rcl     dx, 1
loop    loc_14368

locret_1436E:
retn
sub_14364 endp

align 2



sub_14370 proc near
xor     ch, ch
jcxz    short locret_1437A

loc_14374:
sar     dx, 1
rcr     ax, 1
loop    loc_14374

locret_1437A:
retn
sub_14370 endp

align 2
jb      short loc_14393

loc_1437E:
xor     ax, ax
mov     sp, bp
pop     bp
retn
jnb     short loc_1437E
push    ax
call    sub_143A4
pop     ax
xor     ah, ah
mov     sp, bp
pop     bp
retn
jnb     short loc_1439A

loc_14393:
call    sub_143A4
mov     ax, 0FFFFh
cwd

loc_1439A:
mov     sp, bp
pop     bp
retn



sub_1439E proc near
xor     ah, ah
call    sub_143A4
retn
sub_1439E endp




sub_143A4 proc near
mov     byte_10CEE, al
or      ah, ah
jnz     short loc_143CD
cmp     byte ptr word_10CEC, 3
jb      short loc_143BE
cmp     al, 22h ; '"'
jnb     short loc_143C2
cmp     al, 20h ; ' '
jb      short loc_143BE
mov     al, 5
jmp     short loc_143C4

loc_143BE:
cmp     al, 13h
jbe     short loc_143C4

loc_143C2:
mov     al, 13h

loc_143C4:
mov     bx, 0D10h
xlat

loc_143C8:
cbw
mov     word_10CE6, ax
retn

loc_143CD:
mov     al, ah
jmp     short loc_143C8
sub_143A4 endp

align 10h
db 54h, 28h, 3Ch, 28h, 8Ch, 2Eh, 66h, 0Dh
db 8Ch, 26h, 64h, 0Dh, 8Eh, 26h, 60h, 0Dh
db 8Eh, 2Eh, 62h, 0Dh, 33h, 0C0h, 38h, 6
db 35h, 0, 75h, 3, 0E8h, 0BAh, 0E3h, 80h
db 3Eh, 0F0h, 11h, 0, 75h, 5, 0B1h, 9, 0E9h
db 87h, 0E0h, 0C3h, 53h, 8Ch, 0D3h, 80h
db 0E3h, 0F8h, 6Ah, 8, 7, 0B8h, 2 dup(0FFh)
db 0FAh, 26h, 87h, 7, 8Eh, 0D3h, 26h, 87h
db 7, 5Bh, 0EBh, 7, 50h, 53h, 8Bh, 1Eh, 0B4h
db 9, 0FAh, 80h, 3Eh, 0F0h, 11h, 0, 75h
db 0Ah, 0B0h, 0Fh, 0E6h, 70h, 0EBh, 0, 32h
db 0C0h, 0E6h, 71h, 8Ch, 0D8h, 8Eh, 0C0h
db 8Ch, 2Eh, 62h, 0Dh, 8Ch, 26h, 60h, 0Dh
db 8Eh, 0E0h, 8Eh, 0E8h, 66h, 50h, 51h, 0Fh
db 20h, 0C0h, 0C6h, 6, 0FEh, 0Dh, 0, 66h
db 0Fh, 0BAh, 0F0h, 1Fh, 0Fh, 83h, 0Ah, 0
db 0C6h, 6, 0FEh, 0Dh, 1, 0Fh, 0, 0Eh, 0FCh
db 0Dh, 8Bh, 0Eh, 40h, 0, 0F7h, 0D1h, 23h
db 0C1h, 59h, 0Fh, 22h, 0C0h, 0EAh, 0ABh
db 28h
dw seg seg002
mov     ss, bx
assume ss:nothing
mov     ds, cs:seg_11BD0
mov     gs, word ptr byte_10D60+6
assume gs:nothing
mov     fs, word ptr byte_10D60+4
assume fs:nothing
lidt    fword ptr byte_10D60+7Ch
pop     eax
cmp     word ptr byte_10035, 8000h
jnz     short loc_144BE
cmp     byte_111F0, 0
jnz     short loc_144C8
xor     ax, ax
mov     es, ax
assume es:nothing
mov     ax, word ptr byte_10F4C+0Ah
mov     es:467h, ax
mov     ax, word ptr byte_10F4C+0Ch
mov     es:469h, ax
mov     es, bx
assume es:nothing
cmp     byte_1002E, 2
jz      short loc_144C1

loc_144BB:
call    sub_127CB

loc_144BE:
pop     bx
pop     ax
retn

loc_144C1:
xor     ah, ah
call    sub_12793
jmp     short loc_144BE

loc_144C8:
cmp     byte_1002E, 5
jz      short loc_144E7
cmp     byte_1002E, 0Eh
jz      short loc_144EF
cmp     byte_1002E, 0Fh
jz      short loc_1450A
cmp     byte_1002E, 1
jz      short loc_14517
pop     bx
pop     ax
retn

loc_144E7:
mov     es, bx
mov     al, 80h
out     20h, al         ; Interrupt controller, 8259A.
jmp     short loc_144BE

loc_144EF:
mov     al, 0FFh
out     0F2h, al
pushf
cli
push    dx
mov     dx, 140h
mov     al, 1
out     dx, al
dec     al
out     dx, al
pop     dx
popf
push    cx
mov     cx, 0FA0h

loc_14505:
loop    loc_14505
pop     cx
jmp     short loc_144BE

loc_1450A:
push    dx
mov     dx, 404h
in      al, dx
and     al, 0F9h
jmp     short $+2

loc_14513:
out     dx, al
pop     dx
jmp     short loc_144BE

loc_14517:
mov     al, 3
out     0F6h, al
jmp     short loc_144BE
push    eax
mov     eax, cr0
mov     ax, word ptr byte_10F88
mov     cr0, eax
pop     eax
pop     bx
pop     ax
retn
mov     fs, word ptr byte_10D60
mov     gs, word ptr byte_10D60+2
jmp     loc_11E85
db 80h, 3Eh, 0FEh, 0Dh, 1, 0Fh, 85h, 34h
db 0, 66h, 50h, 0Fh, 20h, 0C0h, 66h, 0Dh
db 3 dup(0), 80h, 0Fh, 22h, 0C0h, 0A1h, 0FCh
db 0Dh, 0Bh, 0C0h, 0Fh, 84h, 1Bh, 0, 53h
db 8Bh, 1Eh, 0FCh, 0Dh, 0B8h, 8, 0, 8Eh
db 0D8h, 0C6h, 47h, 5, 89h, 8Bh, 0C3h, 0BBh
db 20h, 0, 8Eh, 0DBh, 5Bh, 0Fh, 0, 0D8h
db 0Fh, 6, 66h, 58h, 0E9h, 8Fh, 0D9h, 46h
db 2Ah, 4Ch, 2Ah, 93h, 58h, 8Ch, 2Eh, 66h
db 0Dh, 8Ch, 26h, 64h, 0Dh, 66h, 0A3h, 6Ch
db 0Dh, 66h, 89h, 36h, 68h, 0Dh, 8Bh, 0CCh
db 66h, 0A1h, 0C8h, 8, 66h, 0A3h, 4Eh, 0Dh
db 0A0h, 0CCh, 8, 0A2h, 52h, 0Dh, 0A1h, 0D2h
db 8, 0A3h, 56h, 0Dh, 0A0h, 0D4h, 8, 0A2h
db 58h, 0Dh, 0C7h, 6, 0FEh, 8, 80h, 0, 0C6h
db 6, 1Dh, 9, 2 dup(89h), 26h, 78h, 0Dh
db 89h, 26h, 0B0h, 0Dh, 66h, 8Bh, 36h, 34h
db 0Dh, 0A1h, 70h, 0Dh, 0A3h, 5Eh, 0Dh, 33h
db 0C0h, 8Eh, 0E0h, 8Eh, 0E8h, 0B8h, 0Ch
db 0DEh, 0CDh, 67h, 8Bh, 0E1h, 0B9h, 20h
db 0, 8Eh, 0D9h, 0F6h, 6, 47h, 0, 20h, 75h
db 13h, 66h, 0A1h, 6Ch, 0Dh, 66h, 8Bh, 36h
db 68h, 0Dh, 8Eh, 26h, 60h, 0Dh, 8Eh, 2Eh
db 62h, 0Dh, 0FFh, 0E3h, 66h, 8Bh, 36h, 0E4h
db 0Dh, 0B8h, 38h, 0, 8Eh, 0E0h, 66h, 97h
db 0C4h, 3Eh, 0E8h, 0Dh, 66h, 0Fh, 0B7h
db 0FFh, 0FCh, 67h, 66h, 64h, 0A5h, 67h
db 66h, 64h, 0A5h, 66h, 97h, 0EBh, 0CCh
db 50h, 53h, 8Bh, 1Eh, 0B4h, 9, 0FAh, 66h
db 50h, 66h, 52h, 66h, 51h, 66h, 56h, 0Fh
db 1, 0E1h, 0A1h, 40h, 0, 0F7h, 0D0h, 23h
db 0C1h, 0Fh, 1, 0F0h, 0A1h, 70h, 0Dh, 0A3h
db 5Eh, 0Dh, 66h, 0Fh, 0B7h, 0Eh, 0B4h, 9
db 66h, 8Bh, 0D4h, 8Ch, 2Eh, 62h, 0Dh, 8Ch
db 26h, 60h, 0Dh, 66h, 33h, 0C0h, 8Eh, 0E0h
db 8Eh, 0E8h, 50h, 0Fh, 0A8h, 50h, 0Fh, 0A0h
db 66h, 51h, 66h, 51h, 50h, 53h, 66h, 52h
db 66h, 2 dup(50h), 0FFh, 36h, 0B6h, 9, 50h
db 68h, 0B0h, 2Ah, 0B8h, 20h, 0, 8Eh, 0C0h
db 0B8h, 38h, 0, 8Eh, 0D8h, 0B8h, 0Ch, 0DEh
db 66h, 0Fh, 0B7h, 0E4h, 66h, 26h, 0FFh
db 1Eh, 5Ah, 0Dh, 26h, 8Eh, 2Eh, 66h, 0Dh
db 26h, 8Eh, 26h, 64h, 0Dh, 66h, 5Eh, 66h
db 59h, 66h, 5Ah, 66h, 58h, 5Bh, 58h, 0C3h
word_14695 dw 0



sub_14697 proc near
mov     dx, cs:word_14695
or      dx, dx
jz      short locret_146A4
mov     ah, 45h ; 'E'
int     67h             ;  - LIM EMS - RELEASE HANDLE AND MEMORY
                        ; DX = EMM handle
                        ; Return: AH = status

locret_146A4:
retn
sub_14697 endp

pop     bp
retn



sub_146A7 proc far
cli
push    38h ; '8'
pop     es
assume es:nothing
movzx   esi, word_100AA
add     si, 100h
shl     esi, 4
cmp     byte_10DFF, 0
jz      short loc_146C6
mov     esi, 3FF000h

loc_146C6:
xor     cx, cx
mov     fs, cx
mov     gs, cx
retf
sub_146A7 endp




sub_146CD proc near
push    cx
and     dx, 0F000h
mov     cx, word_10DEE
dec     cx
jnz     short loc_146FE
mov     ax, 0DE05h

loc_146DC:
call    large [fword ptr byte_10D5A]
mov     ax, [bp+0Eh]

loc_146E4:
and     es:[edi], ax
inc     word_10DF8
sub     dword_10AA8, 1000h
add     edi, 4
dec     cx
jns     short loc_146E4
pop     cx
retn

loc_146FE:
mov     ax, 0DF01h
jmp     short loc_146DC
sub_146CD endp



; Attributes: bp-based frame

sub_14703 proc far

var_4= word ptr -4
arg_0= dword ptr  6
arg_4= dword ptr  0Ah

push    bp
mov     bp, sp
pushad
push    fs
push    gs
push    word_10DF8
test    ds:byte_11210+372h, 1
jnz     short loc_14796
test    byte_10047, 80h
jz      short loc_14723
mov     ax, 101Bh
int     15h             ; TopView - "BEGINC" - BEGIN CRITICAL REGION

loc_14723:
push    cs
call    near ptr sub_146A7
movsx   ecx, word_10DF0
not     ecx
movzx   edi, word_10ECA
shl     edi, 6
mov     edx, [bp+arg_0]
cmp     edi, edx
ja      short loc_14746
mov     edi, edx

loc_14746:
add     edi, ecx
not     ecx
and     di, cx
shr     edi, 6
and     ecx, [bp+arg_4]
shr     ecx, 6
add     edi, esi
add     ecx, esi
mov     [bp+arg_4], ecx
jmp     short loc_1476A

loc_14766:
add     edi, 4

loc_1476A:
cmp     edi, ecx
jnb     short loc_1478A
mov     edx, es:[edi]
test    dh, 4
jnz     short loc_14766
mov     ax, dx
and     ax, word_10DF2
cmp     ax, word_10DF2
jnz     short loc_14766
call    sub_146CD
jmp     short loc_1476A

loc_1478A:
test    byte_10047, 80h
jz      short loc_14796
mov     ax, 101Ch
int     15h             ; TopView - "ENDC" - END CRITICAL REGION

loc_14796:
pop     bx
mov     ax, word_10DF8
sub     ax, bx
mov     [bp+var_4], ax
jz      short loc_147A7
mov     ebx, cr3
mov     cr3, ebx

loc_147A7:
pop     gs
assume gs:nothing
pop     fs
assume fs:nothing
popad
pop     bp
retf
sub_14703 endp




sub_147AF proc near
pushad
call    sub_14697
xor     cx, cx
xchg    cl, byte_10E00
jcxz    short loc_14805
test    byte_10047, 80h
jz      short loc_147DD
les     bx, dword ptr byte_10095+0Bh
assume es:nothing
mov     eax, es:[bx+14h]
mov     dword ptr byte_100AC, eax
mov     ax, 0BFDEh
mov     bx, 0Ah
call    near ptr byte_12AC4
or      ax, ax
jge     short loc_14805

loc_147DD:
mov     word_10ECA, 1000h
sti
push    0F7FFh
push    large [dword ptr byte_10095+7]
movzx   eax, word_10ECA
shl     eax, 6
push    eax
call    sub_11E60
push    cs
call    near ptr sub_14703
add     sp, 0Ah
call    sub_124FC

loc_14805:
popad
retn
sub_147AF endp

xor     ax, ax
xor     dx, dx
test    ds:byte_11210+372h, 1
jnz     short locret_1483E
cmp     byte_1002E, 0Bh
jnz     short locret_1483E
mov     ax, 0DE03h
call    large [fword ptr byte_10D5A]
imul    eax, edx, 100h
sub     eax, dword ptr byte_10095+7
add     eax, dword ptr byte_100AC
sub     eax, 9
mov     edx, eax
shr     edx, 10h

locret_1483E:
retn
db 50h, 66h, 9Ch, 66h, 0Eh, 6Ah, 0, 68h
db 7Eh, 2Ch, 0EAh, 0C0h, 57h, 70h, 0, 60h
db 8Bh, 0ECh, 8Ah, 46h, 11h, 2Ch, 40h, 3Ch
db 0Fh, 77h, 8, 91h, 0B8h, 82h, 0Dh, 0D3h
db 0E0h, 79h, 33h, 1Eh, 6Ah, 20h, 1Fh, 0F6h
db 6, 82h, 15h, 1, 75h, 27h, 8Ch, 0D1h, 8Bh
db 0DCh, 81h, 2Eh, 96h, 9, 80h, 1, 0Fh, 0B2h
db 26h, 96h, 9, 83h, 0ECh, 10h, 51h, 53h
db 0E8h, 78h, 0DCh, 0E8h, 3Fh, 0, 0E8h, 0D0h
db 0ECh, 81h, 6, 96h, 9, 80h, 1, 5Bh, 17h
db 8Bh, 0E3h, 1Fh, 61h, 2 dup(44h), 66h
db 0CFh, 66h, 50h, 0Fh, 20h, 0D0h, 1Eh, 6Ah
db 20h, 1Fh, 66h, 0A3h, 30h, 0Dh, 1Fh, 66h
db 58h, 0E8h, 0C2h, 0DFh, 0Eh, 0BFh
dw seg seg000
mov     es, di
jmp     short loc_148C3
xor     di, di
mov     ds, di
assume ds:nothing
mov     di, seg seg000
mov     es, di
assume es:seg000
xchg    di, cs:seg_11BD0

loc_148C3:
push    0F7Fh



sub_148C6 proc near
pushad
push    ds
push    es
mov     ds, cs:seg_11BD0
assume ds:seg000
test    ds:byte_11210+372h, 1
jnz     short loc_148F7
cmp     word ptr byte_10D60+8Ch, 602h
jnb     short loc_148F7
mov     cx, word_100AA
inc     ch
mov     es, cx
assume es:nothing
xor     di, di
push    ss
pop     ds
assume ds:nothing
sub     sp, 18h
mov     si, sp
mov     ax, 0DE01h
int     67h             ;  - LIM EMS Program Interface - GET PROTECTED MODE INTERFACE
                        ; ES:DI -> 4K page table buffer
                        ; DS:SI -> three descriptor table entries in GDT
                        ; Return: AH = 00h successful, AH = nonzero  failed
add     sp, 18h

loc_148F7:
pop     es
assume es:nothing
pop     ds
popad
retn
sub_148C6 endp




sub_148FC proc near
sub     ax, ax
retn
sub_148FC endp




sub_148FF proc near
mov     word ptr ds:11D4h, 7
mov     ax, 15h
push    ax
call    sub_13E6D
pop     bx
retn
sub_148FF endp




sub_1490E proc near

; FUNCTION CHUNK AT 6529 SIZE 0000000F BYTES

mov     ax, 1
push    ax
call    sub_18205
pop     bx
mov     ds:1186h, al
cmp     byte ptr ds:26h, 0
jz      short loc_1493E
mov     ax, 0E20h
push    ax
call    sub_13067
pop     bx
mov     ax, 0AD6h
push    ax
call    sub_13067
pop     bx
call    sub_133A8
push    word ptr ds:30h
call    sub_13067
pop     bx
call    sub_133A8

loc_1493E:
mov     word ptr ds:0Eh, 2000h
jmp     loc_180F9
sub_1490E endp




sub_14947 proc near
mov     al, ds:1186h
cbw
push    ax
call    sub_18205
pop     bx
retn
sub_14947 endp




sub_14951 proc near
mov     ax, 0FFFFh
retn
sub_14951 endp




sub_14955 proc near
sub     ax, ax
retn
sub_14955 endp



; Attributes: bp-based frame

sub_14958 proc near

var_A= word ptr -0Ah
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 0Ah
call    sub_18191
mov     ds:2Fh, al
mov     ax, 2
push    ax
mov     ax, 9B8h
push    ax
mov     ax, 2Ch ; ','
push    ax
push    word ptr ds:0CEAh
call    sub_18291
add     sp, 8
mov     bx, [bp+arg_2]
push    word ptr [bx]
call    sub_134ED
pop     bx
mov     ax, 0E4Eh
push    ax
mov     ax, 1190h
push    ax
call    sub_17D00
pop     bx
pop     bx
or      ax, ax
jnz     short loc_149A8
mov     ax, 0E56h
push    ax
mov     ax, 1190h
push    ax
call    sub_17D00
pop     bx
pop     bx
or      ax, ax
jnz     short loc_149A8
jmp     loc_14A3C

loc_149A8:
cmp     [bp+arg_0], 1
jg      short loc_149B1
jmp     loc_14A3C

loc_149B1:
mov     bx, [bp+arg_2]
push    word ptr [bx+2]
call    sub_134ED
pop     bx
mov     ax, 0E62h
push    ax
call    sub_1348A
pop     bx
mov     ax, 80h
mov     dx, ds:0CEAh
mov     word ptr [bp+var_8], ax
mov     word ptr [bp+var_8+2], dx
mov     es, dx
mov     bx, ax
mov     cl, es:[bx]
sub     ch, ch
mov     [bp+var_A], cx
inc     ax
mov     word ptr [bp+var_4], ax
mov     word ptr [bp+var_4+2], dx
jmp     short loc_149ED

loc_149E5:
dec     [bp+var_A]
js      short loc_14A08
inc     word ptr [bp+var_4]

loc_149ED:
les     bx, [bp+var_4]
mov     al, es:[bx]
sub     ah, ah
push    ax
call    sub_14B3B
pop     bx
or      ax, ax
jnz     short loc_149E5
jmp     short loc_14A08

loc_14A00:
dec     [bp+var_A]
js      short loc_14A19
inc     word ptr [bp+var_4]

loc_14A08:
les     bx, [bp+var_4]
mov     al, es:[bx]
sub     ah, ah
push    ax
call    sub_14B3B
pop     bx
or      ax, ax
jz      short loc_14A00

loc_14A19:
mov     al, byte ptr [bp+var_A]
les     bx, [bp+var_8]
mov     es:[bx], al

loc_14A22:
les     bx, [bp+var_4]
inc     word ptr [bp+var_4]
mov     al, es:[bx]
inc     word ptr [bp+var_8]
les     bx, [bp+var_8]
mov     es:[bx], al
dec     [bp+var_A]
jns     short loc_14A22
call    nullsub_4

loc_14A3C:
call    sub_17548
mov     ax, 0E67h
push    ax
mov     bx, [bp+arg_2]
push    word ptr [bx]
call    sub_17BDE
pop     bx
pop     bx
or      ax, ax
jnz     short loc_14A57
call    sub_148FF
call    sub_17548

loc_14A57:
cmp     byte ptr ds:2Fh, 3
jge     short loc_14A66
mov     ax, 0Fh
push    ax
call    sub_13E6D
pop     bx

loc_14A66:
call    sub_15A8E
cmp     byte ptr ds:2Fh, 3
jl      short loc_14A7E
call    sub_14955
push    ax
mov     bx, [bp+arg_2]
push    word ptr [bx]
call    sub_185DD
pop     bx
pop     bx

loc_14A7E:
call    sub_17E2F
mov     sp, bp
pop     bp
retn
sub_14958 endp



; Attributes: bp-based frame

sub_14A85 proc near

var_18= word ptr -18h
var_16= byte ptr -16h
var_10= word ptr -10h
var_E= byte ptr -0Eh
var_D= byte ptr -0Dh
var_8= word ptr -8
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 18h
mov     [bp+var_D], 1Ah
mov     [bp+var_8], 80h
mov     ax, ds:0CEAh
mov     [bp+var_10], ax
lea     ax, [bp+var_16]
push    ax
lea     ax, [bp+var_E]
push    ax
push    ax
call    sub_142D8
add     sp, 6
cmp     byte ptr ds:0E6Ah, 0
jnz     short loc_14B04
cmp     byte ptr ds:980h, 1
jz      short loc_14AC1
cmp     byte ptr ds:980h, 3
jz      short loc_14AC1
call    sub_1749C

loc_14AC1:
mov     [bp+var_18], 2D2Ch
cmp     byte ptr ds:2Eh, 0Bh
jz      short loc_14AD9
test    byte ptr ds:47h, 80h
jnz     short loc_14AD9
mov     [bp+var_18], 29ACh

loc_14AD9:
test    byte ptr ds:14h, 8
jz      short loc_14AE5
mov     [bp+var_18], 625Fh

loc_14AE5:
cmp     word ptr ds:0E6Eh, 0
jz      short loc_14AF5
mov     ax, [bp+var_18]
cmp     ds:0E6Eh, ax
jbe     short loc_14B04

loc_14AF5:
mov     ax, [bp+var_18]
mov     ds:0E6Eh, ax
push    ax
push    [bp+arg_0]
call    sub_13A64
pop     bx
pop     bx

loc_14B04:
mov     sp, bp
pop     bp
retn
sub_14A85 endp

push    bp
mov     bp, sp
mov     word ptr ds:97Ah, 2090h
mov     word ptr ds:97Eh, 0
call    sub_1490E
call    sub_1723C
mov     ax, ds:0CEAh
mov     ds:11E2h, ax
mov     word ptr ds:11E0h, 80h
call    sub_153D2
call    sub_14947
mov     ax, bp
push    ax
call    sub_14A85
pop     bx
mov     sp, bp
pop     bp
retn
retn


; Attributes: bp-based frame

sub_14B3B proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
cmp     [bp+arg_0], 20h ; ' '
jz      short loc_14B56
cmp     [bp+arg_0], 9
jz      short loc_14B56
cmp     [bp+arg_0], 0Ah
jz      short loc_14B56
cmp     [bp+arg_0], 0Dh
jnz     short loc_14B5B

loc_14B56:
mov     ax, 1
pop     bp
retn

loc_14B5B:
sub     ax, ax
pop     bp
retn
sub_14B3B endp

; [00000001 BYTES: COLLAPSED FUNCTION nullsub_2. PRESS CTRL-NUMPAD+ TO EXPAND]
; [00000001 BYTES: COLLAPSED FUNCTION nullsub_3. PRESS CTRL-NUMPAD+ TO EXPAND]
; [00000001 BYTES: COLLAPSED FUNCTION nullsub_4. PRESS CTRL-NUMPAD+ TO EXPAND]


; Attributes: bp-based frame

sub_14B62 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
mov     ax, ds:97Ch
cmp     [bp+arg_0], ax
jnb     short locret_14B81
push    [bp+arg_2]
push    0FFFFh
push    0
push    [bp+arg_0]
mov     ax, [bp+arg_0]
shr     ax, 3
push    ax
call    sub_1386F

locret_14B81:
leave
retn
sub_14B62 endp




sub_14B83 proc near
push    si
mov     si, 9F00h
jmp     short loc_14B8C

loc_14B89:
add     si, 40h ; '@'

loc_14B8C:
cmp     si, 0A000h
jz      short loc_14BA1
push    92h
push    si
call    sub_14B62
pop     bx
pop     bx
jmp     short loc_14B89

loc_14B9D:
add     si, 200h

loc_14BA1:
or      si, si
jz      short loc_14BC5
mov     cx, si
shr     cx, 0Ch
mov     ax, 0D000h
shr     ax, cl
and     ax, 1
cmp     ax, 1
sbb     ax, ax
and     al, 0F8h
add     ax, 9Ah
push    ax
push    si
call    sub_14B62
pop     bx
pop     bx
jmp     short loc_14B9D

loc_14BC5:
pop     si
retn
sub_14B83 endp



; Attributes: bp-based frame

sub_14BC7 proc near

var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

enter   6, 0
mov     bx, [bp+arg_0]
mov     ax, [bx+4]
sub     dx, dx
mov     cl, 9
call    sub_14364
mov     [bp+var_4], ax
mov     [bp+var_2], dx
mov     [bp+var_6], 0
mov     bx, [bp+arg_0]
cmp     word ptr [bx+2], 0
jz      short loc_14C03
cmp     byte ptr [bx], 4Dh ; 'M'
jnz     short loc_14BF6
mov     [bp+var_6], 200h

loc_14BF6:
mov     ax, [bx+2]
sub     ax, [bp+var_6]
cwd
add     [bp+var_4], ax
adc     [bp+var_2], dx

loc_14C03:
mov     ax, [bp+var_4]
mov     dx, [bp+var_2]
leave
retn
sub_14BC7 endp



; Attributes: bp-based frame

sub_14C0B proc near

var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

enter   2, 0
mov     [bp+var_2], 2

loc_14C14:
push    word ptr ds:11DCh
push    word ptr ds:11DAh
call    sub_17B80
pop     bx
pop     bx
push    [bp+arg_4]
push    [bp+arg_0]
call    sub_17B98
pop     bx
pop     bx
cmp     ax, [bp+arg_4]
jnz     short loc_14C7E
mov     bx, [bp+arg_0]
cmp     byte ptr [bx], 4Dh ; 'M'
jnz     short loc_14C4F
cmp     byte ptr [bx+1], 46h ; 'F'
jnz     short loc_14C4F
mov     ax, [bx+2]
mov     dx, [bx+4]

loc_14C45:
add     ds:11DAh, ax
adc     ds:11DCh, dx
jmp     short loc_14C78

loc_14C4F:
cmp     byte ptr [bx], 4Dh ; 'M'
jnz     short loc_14C61
cmp     byte ptr [bx+1], 5Ah ; 'Z'
jnz     short loc_14C61
push    bx
call    sub_14BC7
pop     bx
jmp     short loc_14C45

loc_14C61:
cmp     byte ptr [bx], 42h ; 'B'
jnz     short loc_14C71
cmp     byte ptr [bx+1], 57h ; 'W'
jnz     short loc_14C71
mov     ax, 1
leave
retn

loc_14C71:
mov     ah, 0Dh
int     21h             ; DOS - DISK RESET
dec     [bp+var_2]

loc_14C78:
cmp     [bp+var_2], 0
jge     short loc_14C14

loc_14C7E:
cmp     [bp+arg_2], 0
jz      short loc_14C8A
push    0FFFEh
call    sub_13E6D
pop     bx

loc_14C8A:
sub     ax, ax
mov     ds:11DCh, ax
mov     ds:11DAh, ax
leave
retn
sub_14C0B endp



; Attributes: bp-based frame

sub_14C94 proc near

var_BA= word ptr -0BAh
var_B8= word ptr -0B8h
var_B6= word ptr -0B6h
var_B4= word ptr -0B4h
var_B2= byte ptr -0B2h
var_B1= byte ptr -0B1h
var_A8= word ptr -0A8h
var_A6= word ptr -0A6h
var_96= word ptr -96h
var_94= word ptr -94h
var_8C= word ptr -8Ch
var_8A= word ptr -8Ah
var_82= word ptr -82h
var_2= word ptr -2

enter   0BCh, 0
mov     al, ds:0E72h
inc     byte ptr ds:0E72h
or      al, al
jz      short loc_14CA6
jmp     locret_14E26

loc_14CA6:
cmp     word ptr ds:0E70h, 0
jge     short loc_14CB4
push    1190h
call    sub_17B6E
pop     bx

loc_14CB4:
cmp     word ptr ds:0E70h, 0
jge     short loc_14CBE
jmp     locret_14E26

loc_14CBE:
sub     ax, ax
mov     [bp+var_BA], ax
mov     [bp+var_2], ax
mov     [bp+var_B8], ax
mov     [bp+var_B6], ax
push    0B0h
push    ax
lea     ax, [bp+var_B2]
push    ax
call    sub_14C0B
add     sp, 6
or      ax, ax
jnz     short loc_14CE5
jmp     loc_14D6F

loc_14CE5:
cmp     [bp+var_B2], 42h ; 'B'
jnz     short loc_14CF3
cmp     [bp+var_B1], 57h ; 'W'
jz      short loc_14CF5

loc_14CF3:
jmp     short loc_14D6F

loc_14CF5:
mov     ax, [bp+var_82]
or      ds:14h, ax
mov     ax, [bp+var_B6]
cmp     [bp+var_A8], ax
jbe     short loc_14D0F
mov     ax, [bp+var_A8]
mov     [bp+var_B6], ax

loc_14D0F:
mov     ax, [bp+var_B8]
cmp     [bp+var_A6], ax
jbe     short loc_14D21
mov     ax, [bp+var_A6]
mov     [bp+var_B8], ax

loc_14D21:
mov     ax, [bp+var_2]
cmp     [bp+var_8A], ax
jbe     short loc_14D31
mov     ax, [bp+var_8A]
mov     [bp+var_2], ax

loc_14D31:
mov     ax, [bp+var_BA]
cmp     [bp+var_8C], ax
jbe     short loc_14D43
mov     ax, [bp+var_8C]
mov     [bp+var_BA], ax

loc_14D43:
mov     ax, [bp+var_94]
or      ax, [bp+var_96]
jz      short loc_14D6F
push    [bp+var_94]
push    [bp+var_96]
call    sub_17B80
pop     bx
pop     bx
push    0B0h
lea     ax, [bp+var_B2]
push    ax
call    sub_17B98
pop     bx
pop     bx
cmp     ax, 0B0h
jnz     short loc_14D6F
jmp     loc_14CE5

loc_14D6F:
cmp     [bp+var_B6], 0
jz      short loc_14D83
mov     ax, [bp+var_B6]
cmp     ds:0ECCh, ax
jbe     short loc_14D83
mov     ds:120Eh, ax

loc_14D83:
mov     ax, [bp+var_BA]
mov     [bp+var_B4], ax
or      ax, ax
jz      short loc_14DA0
mov     byte ptr ds:0A16h, 2
mov     ax, [bp+var_2]
cmp     ds:1206h, ax
jnb     short loc_14DA0
mov     ds:1206h, ax

loc_14DA0:
cmp     byte ptr ds:2Eh, 0
jnz     short loc_14DBB
mov     ax, [bp+var_B8]
mov     [bp+var_B4], ax
mov     ax, [bp+var_2]
cmp     ds:1206h, ax
jnb     short loc_14DBB
mov     ds:1206h, ax

loc_14DBB:
cmp     [bp+var_B4], 0
jz      short loc_14DDD
cmp     [bp+var_B4], 7FFFh
jz      short loc_14DDD
test    byte ptr ds:11D2h, 1
jnz     short loc_14DDD
mov     ax, [bp+var_B4]
mov     ds:0ECCh, ax
or      byte ptr ds:11D2h, 1

loc_14DDD:
test    byte ptr ds:15h, 20h
jz      short loc_14E09
cmp     byte ptr ds:2Eh, 0
jz      short loc_14E09
test    byte ptr ds:11D2h, 4
jnz     short loc_14DF8
mov     word ptr ds:0ECEh, 0FFFEh

loc_14DF8:
test    byte ptr ds:11D2h, 1
jnz     short loc_14E09
mov     ax, ds:0ECEh
sub     ax, ds:0ECAh
mov     ds:0ECCh, ax

loc_14E09:
cmp     word ptr ds:0ECCh, 3C00h
ja      short loc_14E21
cmp     word ptr ds:0ECAh, 4000h
ja      short loc_14E21
cmp     word ptr ds:0ECEh, 4000h
jbe     short locret_14E26

loc_14E21:
or      byte ptr ds:15h, 20h

locret_14E26:
leave
retn
sub_14C94 endp



; Attributes: bp-based frame

sub_14E28 proc near

var_40= byte ptr -40h

enter   40h, 0
mov     ax, ds:11DAh
mov     dx, ds:11DCh
add     ax, 40h ; '@'
adc     dx, 0
push    dx
push    ax
call    sub_17B80
pop     bx
pop     bx
push    40h ; '@'
lea     ax, [bp+var_40]
push    ax
call    sub_17B98
pop     bx
pop     bx
push    0E73h
lea     ax, [bp+var_40]
push    ax
call    sub_17D00
pop     bx
pop     bx
or      ax, ax
jnz     short loc_14E6B
push    0E7Bh
lea     ax, [bp+var_40]
push    ax
call    sub_17D00
pop     bx
pop     bx
or      ax, ax
jz      short loc_14E7E

loc_14E6B:
mov     ax, ds:11F4h
mov     dx, ds:11F6h
mov     ds:11DAh, ax
mov     ds:11DCh, dx
mov     ax, 1
leave
retn

loc_14E7E:
sub     ax, ax
leave
retn
sub_14E28 endp



; Attributes: bp-based frame

sub_14E82 proc near

var_4A= word ptr -4Ah
var_48= word ptr -48h
var_46= word ptr -46h
var_44= word ptr -44h
var_42= word ptr -42h
var_40= word ptr -40h
var_3E= word ptr -3Eh
var_3C= byte ptr -3Ch
var_2E= word ptr -2Eh
var_2C= word ptr -2Ch
var_2A= word ptr -2Ah
var_28= word ptr -28h
var_26= word ptr -26h
var_24= word ptr -24h
var_20= word ptr -20h
var_1E= word ptr -1Eh
var_1C= word ptr -1Ch
var_1A= word ptr -1Ah
var_18= word ptr -18h
var_16= word ptr -16h
var_12= byte ptr -12h
var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_A= byte ptr -0Ah
var_8= word ptr -8
var_6= dword ptr -6
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

enter   4Ah, 0
push    di
push    si
mov     [bp+var_1E], 0
mov     [bp+var_44], 0

loc_14E92:
push    1Ch
push    1
lea     ax, [bp+var_3C]
push    ax
call    sub_14C0B
add     sp, 6
push    4
push    11F4h
call    sub_17B98
pop     bx
pop     bx
add     word ptr ds:11DAh, 30h ; '0'
adc     word ptr ds:11DCh, 0
push    word ptr ds:11DCh
push    word ptr ds:11DAh
call    sub_17B80
pop     bx
pop     bx
push    10h
lea     ax, [bp+var_16]
push    ax
call    sub_17B98
pop     bx
pop     bx
cmp     byte ptr ds:11F1h, 0
jz      short loc_14EDA
call    sub_14E28
or      ax, ax
jnz     short loc_14E92

loc_14EDA:
cmp     [bp+var_8], 0
jz      short loc_14EED
cmp     word ptr ds:0Ah, 0
jnz     short loc_14EED
mov     ax, [bp+var_8]
mov     ds:0Eh, ax

loc_14EED:
mov     ax, [bp+var_E]
mov     [bp+var_3E], ax
cmp     ax, ds:97Ch
jbe     short loc_14EFF
add     ah, 2
mov     ds:97Ch, ax

loc_14EFF:
mov     ax, ds:97Ch
cmp     [bp+var_3E], ax
jbe     short loc_14F0D
mov     word ptr ds:97Ch, 0FFFFh

loc_14F0D:
mov     ax, [bp+var_C]
mov     ds:11F2h, ax
cmp     ax, 80h
jnb     short loc_14F1E
mov     word ptr ds:11F2h, 80h

loc_14F1E:
cmp     [bp+arg_0], 0
jnz     short loc_14F3B
call    sub_136CF
mov     ax, [bp+var_24]
mov     ds:97Ch, ax
call    sub_1553B
mov     al, [bp+var_A]
mov     ds:980h, al
call    sub_1723C
jmp     short loc_14F3E

loc_14F3B:
call    sub_1553B

loc_14F3E:
cmp     [bp+arg_0], 0
jge     short loc_14F4E
mov     [bp+arg_0], 0
and     byte ptr ds:14h, 0F7h

loc_14F4E:
test    [bp+var_12], 2
jz      short loc_14F5E
mov     [bp+arg_0], 0FFFFh
or      byte ptr ds:14h, 8

loc_14F5E:
cmp     [bp+arg_0], 0
jz      short loc_14FA5
mov     ax, ds:11F2h
neg     ax
mov     [bp+var_44], ax
test    [bp+var_12], 1
jz      short loc_14F96
mov     ax, [bp+var_3E]
inc     ax
shr     ax, 3
mul     [bp+arg_0]
neg     ax
push    ax
call    sub_15781
pop     bx
shl     ax, 3
mov     ds:11F2h, ax
mov     bx, [bp+arg_2]
mov     [bx+8], ax
or      ax, ax
jnz     short loc_14F96
jmp     loc_153CE

loc_14F96:
mov     ax, ds:11F2h
add     [bp+var_44], ax
mov     ax, [bp+var_44]
add     [bp+var_2E], ax
add     [bp+var_26], ax

loc_14FA5:
mov     ax, [bp+var_16]
or      ds:14h, ax
mov     ax, ds:11DAh
mov     dx, ds:11DCh
add     ax, 80h
adc     dx, 0
push    dx
push    ax
call    sub_17B80
pop     bx
pop     bx
call    sub_1355A
mov     ax, [bp+var_3E]
sub     ax, 7Fh
mov     ds:11EEh, ax
push    ax
push    word ptr ds:11F2h
push    8
call    sub_1563E
add     sp, 6
mov     ax, ds:11F2h
add     ds:11EEh, ax
mov     word ptr [bp+var_6], 0
mov     word ptr [bp+var_6+2], 8
mov     [bp+var_42], 0
mov     [bp+var_40], 50h ; 'P'
mov     es, word ptr [bp+var_6+2]

loc_14FF7:
sub     word ptr ds:11EEh, 8
mov     bx, ds:11EEh
and     bl, 0F8h
add     bx, word ptr [bp+var_6]
cmp     byte ptr es:[bx+5], 0
jz      short loc_14FF7
mov     ax, ds:11F2h
mov     [bp+var_18], ax

loc_15013:
mov     ax, [bp+var_18]
mov     [bp+var_1C], ax
and     al, 0F8h
add     ax, word ptr [bp+var_6]
mov     dx, word ptr [bp+var_6+2]
mov     bx, 11E4h
push    si
push    di
push    ds
mov     di, bx
mov     si, ax
push    ds
pop     es
mov     ds, dx
movsw
movsw
movsw
movsw
pop     ds
pop     di
pop     si
mov     si, ds:11E4h
mov     al, ds:11E9h
sub     ah, ah
mov     [bp+var_2], ax
or      ax, ax
jnz     short loc_15049
jmp     loc_15264

loc_15049:
mov     ax, ds:11EAh
and     ah, 1Fh
mov     [bp+var_4A], ax
sub     di, di
or      si, si
jz      short loc_1505F
push    si
call    sub_12DAD
pop     bx
mov     di, ax

loc_1505F:
test    byte ptr ds:11EBh, 20h
jz      short loc_15068
sub     si, si

loc_15068:
cmp     [bp+var_4A], di
jbe     short loc_15070
mov     di, [bp+var_4A]

loc_15070:
sub     ax, ax
mov     ds:1204h, ax
mov     ds:1202h, ax
or      di, di
jnz     short loc_1507F
jmp     loc_15184

loc_1507F:
test    byte ptr ds:11EBh, 80h
jnz     short loc_15089
jmp     loc_15167

loc_15089:
mov     ax, [bp+var_2E]
cmp     [bp+var_18], ax
jz      short loc_1509A
mov     al, byte ptr [bp+var_2]
and     al, 18h
cmp     al, 18h
jnz     short loc_150A1

loc_1509A:
mov     [bp+var_20], 7
jmp     short loc_150AA

loc_150A1:
mov     [bp+var_20], 0
or      byte ptr [bp+var_2], 60h

loc_150AA:
call    sub_12D91
mov     ax, [bp+var_20]
add     ax, di
mov     [bp+var_1A], ax
cmp     ax, 8
jnb     short loc_150BF
mov     [bp+var_1A], 8

loc_150BF:
push    [bp+var_1A]
call    sub_15511
pop     bx
mov     ds:1202h, ax
mov     ds:1204h, dx
mov     [bp+var_1A], ax
or      ax, ax
jnz     short loc_150DA
push    3
call    sub_13E6D
pop     bx

loc_150DA:
mov     ax, ds:1202h
add     ax, [bp+var_20]
mov     cx, [bp+var_20]
not     cx
and     cx, ax
sub     ax, ax
mov     ds:1202h, cx
mov     ds:1204h, ax
mov     [bp+var_1C], cx
cmp     cx, ds:97Ch
jb      short loc_150FF

loc_150F9:
push    4
call    sub_13E6D
pop     bx

loc_150FF:
push    [bp+var_1C]
push    [bp+var_18]
call    sub_17B62
pop     bx
pop     bx
mov     cx, 1210h
add     cx, 64h ; 'd'
cmp     ax, cx
jg      short loc_1511A
push    5
call    sub_17BD3
pop     bx

loc_1511A:
call    sub_1355A
mov     bx, [bp+var_1C]
and     bl, 0F8h
add     bx, word ptr [bp+var_6]
mov     es, word ptr [bp+var_6+2]
cmp     byte ptr es:[bx+5], 0
jz      short loc_15135
call    sub_12D91
jmp     short loc_150F9

loc_15135:
cmp     [bp+var_20], 0
jz      short loc_15162
mov     ax, [bp+var_2E]
cmp     [bp+var_18], ax
jnz     short loc_15149
mov     ax, [bp+var_1C]
mov     [bp+var_2E], ax

loc_15149:
mov     ax, [bp+var_26]
cmp     [bp+var_18], ax
jnz     short loc_15157
mov     ax, [bp+var_1C]
mov     [bp+var_26], ax

loc_15157:
push    [bp+var_1A]
push    [bp+var_1C]
call    sub_13A46
pop     bx
pop     bx

loc_15162:
inc     [bp+var_1E]
jmp     short loc_15184

loc_15167:
push    di
call    sub_154B6
pop     bx
mov     ds:1202h, ax
mov     ds:1204h, dx
mov     ax, dx
or      ax, ds:1202h
jnz     short loc_15184
call    sub_12D91
push    6
call    sub_13E6D
pop     bx

loc_15184:
mov     byte ptr ds:11E9h, 0F2h
mov     ax, ds:1202h
shl     ax, 4
mov     ds:11E6h, ax
mov     ax, ds:1202h
mov     dx, ds:1204h
mov     cl, 0Ch
call    sub_14370
mov     ds:11E8h, al
mov     word ptr ds:11E4h, 0
or      di, di
jz      short loc_151C4
mov     ax, di
shl     ax, 4
dec     ax
mov     ds:11E4h, ax
mov     bx, [bp+var_1C]
shr     bx, 3
add     bx, [bp+var_42]
mov     es, [bp+var_40]
mov     byte ptr es:[bx], 1

loc_151C4:
test    byte ptr ds:11EBh, 40h
jz      short loc_151DB
mov     bx, [bp+var_1C]
shr     bx, 3
add     bx, [bp+var_42]
mov     es, [bp+var_40]
or      byte ptr es:[bx], 2

loc_151DB:
mov     word ptr ds:11EAh, 0
mov     ax, [bp+var_1C]
and     al, 0F8h
add     ax, word ptr [bp+var_6]
mov     dx, word ptr [bp+var_6+2]
push    si
push    di
mov     di, ax
mov     si, 11E4h
mov     es, dx
movsw
movsw
movsw
movsw
pop     di
pop     si
or      si, si
jz      short loc_15212
test    si, 0Fh
jz      short loc_15206
inc     si

loc_15206:
push    si
push    0
push    [bp+var_1C]
call    sub_1563E
add     sp, 6

loc_15212:
cmp     [bp+var_4A], 0
jz      short loc_1522F
mov     di, [bp+var_4A]
shl     di, 4
sub     di, si
jz      short loc_1522F
push    0
push    di
push    si
push    [bp+var_1C]
call    near ptr loc_13A3A+2
add     sp, 8

loc_1522F:
mov     al, byte ptr [bp+var_2]
mov     ds:11E9h, al
mov     bx, [bp+var_1C]
and     bl, 0F8h
add     bx, word ptr [bp+var_6]
mov     es, word ptr [bp+var_6+2]
mov     es:[bx+5], al
mov     ax, [bp+var_18]
cmp     [bp+var_1C], ax
jz      short loc_15264
and     al, 0F8h
add     ax, word ptr [bp+var_6]
mov     dx, word ptr [bp+var_6+2]
push    si
push    di
mov     di, ax
mov     si, 11E4h
mov     es, dx
movsw
movsw
movsw
movsw
pop     di
pop     si

loc_15264:
mov     ax, ds:11EEh
add     [bp+var_18], 8
cmp     [bp+var_18], ax
ja      short loc_15273
jmp     loc_15013

loc_15273:
cmp     [bp+arg_0], 0
jg      short loc_15283
shr     ax, 3
les     bx, [bp+var_6]
mov     es:[bx+2], ax

loc_15283:
mov     ax, [bp+var_2C]
sub     ax, 0Ch
and     al, 0FEh
mov     bx, [bp+arg_2]
mov     [bx+0Eh], ax
mov     ax, [bp+var_2E]
mov     [bx+2], ax
mov     ax, [bp+var_26]
mov     [bx+22h], ax
mov     ax, [bp+var_28]
mov     [bx+1Eh], ax
mov     ax, ds:11F2h
mov     [bx+0Ah], ax
mov     ax, [bp+var_18]
sub     ax, 18h
mov     [bx+8], ax
call    sub_12D91
push    [bp+arg_2]
push    [bp+arg_0]
call    nullsub_3
pop     bx
pop     bx
cmp     [bp+arg_0], 0
jl      short loc_152D3
call    sub_17BAD
sub     ax, ax
mov     ds:11DCh, ax
mov     ds:11DAh, ax
jmp     short loc_152E1

loc_152D3:
mov     ax, ds:11F4h
mov     dx, ds:11F6h
mov     ds:11DAh, ax
mov     ds:11DCh, dx

loc_152E1:
sub     [bp+var_18], 8
cmp     [bp+var_2A], 0
jz      short loc_1533C
call    sub_1355A
push    1
call    sub_12E36
pop     bx
cmp     [bp+var_44], 0
jz      short loc_1531F
push    [bp+var_44]
push    [bp+var_18]
mov     ax, [bp+var_44]
add     [bp+var_2A], ax
push    [bp+var_2A]
call    sub_15935
add     sp, 6
jmp     short loc_1531F

loc_15311:
push    [bp+var_18]
push    [bp+var_2A]
call    sub_159CE
pop     bx
pop     bx
call    sub_17B69

loc_1531F:
dec     [bp+var_1E]
jns     short loc_15311
push    [bp+var_2A]
call    sub_1364B
pop     bx
mov     ax, [bp+var_2A]
sub     ax, 8
mov     bx, [bp+arg_2]
mov     [bx+8], ax
call    sub_12D91
jmp     short loc_15381

loc_1533C:
cmp     [bp+var_44], 0
jz      short loc_1534D
push    [bp+var_44]
push    [bp+var_18]
call    sub_156D6
pop     bx
pop     bx

loc_1534D:
cmp     [bp+var_1E], 0
jle     short loc_15381
push    [bp+var_18]
call    sub_13804
pop     bx
mov     al, ds:11E9h
and     al, 18h
cmp     al, 10h
jz      short loc_15369
push    7
call    sub_13E6D
pop     bx

loc_15369:
cmp     word ptr ds:11E4h, 0
jz      short loc_15381
jmp     short loc_1537C

loc_15372:
push    [bp+var_18]
call    sub_15852
pop     bx
call    sub_17B69

loc_1537C:
dec     [bp+var_1E]
jns     short loc_15372

loc_15381:
cmp     [bp+var_1E], 0
jl      short loc_1538D
test    [bp+var_12], 1
jz      short loc_1539A

loc_1538D:
cmp     [bp+var_2A], 0
jnz     short loc_1539A
push    [bp+var_18]
call    sub_15917
pop     bx

loc_1539A:
mov     ax, 28h ; '('
mov     bx, [bp+arg_2]
mov     [bx+4], ax
mov     [bx+6], ax
mov     word ptr [bx+26h], 200h
cmp     [bp+arg_0], 0
jg      short loc_153CE
call    sub_14B83
mov     ax, ds:0CEAh
mov     ds:97Eh, ax
mov     cx, 2Ch ; ','
mov     dx, ax
mov     [bp+var_48], cx
mov     [bp+var_46], dx
mov     es, ax
mov     bx, cx
mov     word ptr es:[bx], 30h ; '0'

loc_153CE:
pop     si
pop     di
leave
retn
sub_14E82 endp




sub_153D2 proc near
cmp     word ptr ds:0E70h, 0
jge     short loc_153E0
push    1190h
call    sub_17B6E
pop     bx

loc_153E0:
cmp     word ptr ds:0E70h, 0
jge     short loc_153ED
push    0FFF8h
call    sub_13E6D
pop     bx

loc_153ED:
push    word ptr ds:996h
push    0
call    sub_14E82
pop     bx
pop     bx
retn
sub_153D2 endp



; Attributes: bp-based frame

sub_153F9 proc near

var_2= word ptr -2

enter   2, 0
mov     ax, ds:0D0Ch
mov     cx, 180h
imul    cx
add     ax, 2Ah ; '*'
mov     [bp+var_2], ax
cmp     word ptr ds:0F4Eh, 0
jnz     short loc_15433
mov     word ptr ds:11D4h, 8
push    ax
call    sub_10B12
pop     bx
push    [bp+var_2]
call    sub_13FFE
pop     bx
mov     ds:0F4Eh, ax
or      ax, ax
jnz     short loc_15433
push    9
call    sub_13E6D
pop     bx

loc_15433:
push    [bp+var_2]
push    0
push    word ptr ds:0F4Eh
call    sub_14336
mov     ax, [bp+var_2]
add     ax, ds:0F4Eh
mov     ds:0F4Ch, ax
sub     ax, 2Ah ; '*'
mov     ds:996h, ax
mov     bx, ax
mov     cx, ds:0F4Ch
mov     [bx], cx
mov     word ptr [bx+18h], 0FFFFh
mov     word ptr ds:99Eh, 0
leave
retn
sub_153F9 endp

enter   4, 0
cmp     byte ptr ds:980h, 1
jnz     short loc_15488
push    word ptr [bp+4]
call    sub_15511
pop     bx
mov     [bp-4], ax
mov     [bp-2], dx
or      dx, ax
jz      short loc_15488

loc_15480:
mov     ax, [bp-4]
mov     dx, [bp-2]
leave
retn

loc_15488:
cmp     byte ptr ds:980h, 3
jge     short loc_154AD
call    sub_1355A
push    0
push    word ptr [bp+4]
call    loc_13A2D
pop     bx
pop     bx
mov     [bp-4], ax
mov     [bp-2], dx
call    sub_12D91
mov     ax, [bp-2]
or      ax, [bp-4]
jnz     short loc_15480

loc_154AD:
push    word ptr [bp+4]
call    sub_15511
pop     bx
leave
retn


; Attributes: bp-based frame

sub_154B6 proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

enter   4, 0
cmp     byte ptr ds:980h, 1
jz      short loc_154E4
cmp     byte ptr ds:980h, 3
jge     short loc_154E4
push    0
push    [bp+arg_0]
call    loc_13A2D
pop     bx
pop     bx
mov     [bp+var_4], ax
mov     [bp+var_2], dx
or      dx, ax
jz      short loc_154E4

loc_154DC:
mov     ax, [bp+var_4]
mov     dx, [bp+var_2]
leave
retn

loc_154E4:
call    sub_12D91
push    [bp+arg_0]
call    sub_15511
pop     bx
mov     [bp+var_4], ax
mov     [bp+var_2], dx
call    sub_1355A
mov     ax, [bp+var_2]
or      ax, [bp+var_4]
jnz     short loc_154DC
push    0
push    [bp+arg_0]
call    loc_13A2D
pop     bx
pop     bx
mov     [bp+var_4], ax
mov     [bp+var_2], dx
jmp     short loc_154DC
sub_154B6 endp



; Attributes: bp-based frame

sub_15511 proc near

var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_2= byte ptr -2
arg_0= word ptr  4

enter   18h, 0
mov     byte ptr [bp+var_E+1], 48h ; 'H'
mov     ax, [bp+arg_0]
mov     [bp+var_C], ax
lea     ax, [bp+var_E]
push    ax
push    ax
call    sub_14290
pop     bx
pop     bx
test    [bp+var_2], 1
jz      short loc_15534
sub     ax, ax
cwd
leave
retn

loc_15534:
mov     ax, [bp+var_E]
sub     dx, dx
leave
retn
sub_15511 endp




sub_1553B proc near
push    di
push    si
sub     ax, ax
mov     ds:11D0h, ax
mov     ds:1208h, ax
cmp     ds:0Ah, ax
jnz     short loc_155C5
mov     si, ds:0Eh
cmp     ds:11D6h, ax
jz      short loc_15559
mov     si, ds:11D6h

loc_15559:
or      si, si
jnz     short loc_15560
mov     si, 800h

loc_15560:
cmp     si, 400h
jnb     short loc_15569
mov     si, 400h

loc_15569:
mov     ax, ds:9B8h
dec     ax
sub     bx, bx
mov     es, ax
cmp     byte ptr es:[bx], 4Dh ; 'M'
jnz     short loc_15590
mov     ax, ds:0CEAh
cmp     es:[bx+1], ax
jnz     short loc_15590
mov     di, es:[bx+3]
add     di, 20h ; ' '
shl     di, 4
cmp     di, si
jbe     short loc_15590
mov     si, di

loc_15590:
cmp     si, 8200h
jbe     short loc_15599
mov     si, 8200h

loc_15599:
add     si, 0Fh
push    si
call    sub_10B12
pop     bx
or      ax, ax
jnz     short loc_155AD

loc_155A7:
push    0Dh
call    sub_13E6D
pop     bx

loc_155AD:
push    si
call    sub_13FFE
pop     bx
add     ax, 0Fh
and     al, 0F0h
mov     ds:0Ah, ax
or      ax, ax
jz      short loc_155A7
mov     ax, si
and     al, 0F0h
mov     ds:0Eh, ax

loc_155C5:
pop     si
pop     di
retn
sub_1553B endp



; Attributes: bp-based frame

sub_155C8 proc near

var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= word ptr -8
var_2= byte ptr -2

enter   10h, 0
call    sub_12D91
push    1
call    sub_12E36
pop     bx
mov     [bp+var_E], 4201h
mov     ax, ds:0E70h
mov     [bp+var_C], ax
sub     ax, ax
mov     [bp+var_8], ax
mov     [bp+var_A], ax
lea     ax, [bp+var_E]
push    ax
push    ax
call    sub_14290
pop     bx
pop     bx
mov     ah, ds:0Fh
and     ax, 0FE00h
mov     cx, [bp+var_E]
and     ch, 1
sub     ax, cx
mov     [bp+var_A], ax
mov     byte ptr [bp+var_E+1], 3Fh ; '?'
mov     ax, ds:0Ah
mov     ds:11D0h, ax
mov     [bp+var_8], ax
lea     ax, [bp+var_E]
push    ax
push    ax
call    sub_14290
pop     bx
pop     bx
test    [bp+var_2], 1
jz      short loc_15626
mov     [bp+var_E], 0

loc_15626:
mov     ax, [bp+var_E]
add     ax, ds:11D0h
mov     ds:1208h, ax
call    sub_1355A
push    1
call    sub_12E36
pop     bx
mov     ax, [bp+var_E]
leave
retn
sub_155C8 endp



; Attributes: bp-based frame

sub_1563E proc near

var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

enter   2, 0
push    di
push    si
mov     ax, [bp+arg_4]
neg     ax
and     ax, 0Fh
mov     [bp+var_2], ax

loc_1564F:
mov     di, ds:1208h
sub     di, ds:11D0h
jnz     short loc_1565C
call    sub_155C8

loc_1565C:
mov     di, ds:1208h
sub     di, ds:11D0h
jnz     short loc_15688
cmp     [bp+arg_2], 0
jz      short loc_1567F
push    0
push    [bp+arg_4]
push    [bp+arg_2]
push    [bp+arg_0]
call    near ptr loc_13A3A+2
add     sp, 8
jmp     short loc_156D2

loc_1567F:
call    sub_12D91
push    0FFF2h
call    sub_13E6D
pop     bx

loc_15688:
mov     si, [bp+arg_4]
cmp     si, di
ja      short loc_15693
or      si, si
jnz     short loc_15695

loc_15693:
mov     si, di

loc_15695:
push    si
push    [bp+arg_2]
push    [bp+arg_0]
push    word ptr ds:11D0h
push    20h ; ' '
call    sub_17CB8
add     sp, 0Ah
add     [bp+arg_2], si
add     ds:11D0h, si
sub     [bp+arg_4], si
jnz     short loc_1564F
jmp     short loc_156BD

loc_156B6:
call    sub_155C8
or      ax, ax
jz      short loc_156D2

loc_156BD:
mov     ax, [bp+var_2]
add     ds:11D0h, ax
mov     ax, ds:11D0h
sub     ax, ds:1208h
mov     [bp+var_2], ax
or      ax, ax
jg      short loc_156B6

loc_156D2:
pop     si
pop     di
leave
retn
sub_1563E endp



; Attributes: bp-based frame

sub_156D6 proc near

var_16= word ptr -16h
var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_A= dword ptr -0Ah
var_6= word ptr -6
var_4= word ptr -4
var_2= byte ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

enter   16h, 0
push    di
push    si
call    sub_1355A
mov     ax, [bp+arg_0]
sub     dx, dx
mov     cx, ax
mov     bx, dx
mov     [bp+var_6], dx
mov     [bp+var_4], ax
sub     ax, 8
mov     [bp+var_E], dx
mov     [bp+var_C], ax
or      bl, 8
mov     word ptr [bp+var_A], cx
mov     word ptr [bp+var_A+2], bx
mov     es, bx
assume es:nothing
mov     bx, cx
mov     si, es:[bx]
inc     si
shr     si, 1
jmp     short loc_15777

loc_1570C:
mov     bx, si
shl     bx, 1
add     bx, [bp+var_E]
mov     es, [bp+var_C]
assume es:nothing
mov     di, es:[bx]
cmp     di, 80h
jb      short loc_15777
add     di, [bp+arg_2]
mov     bx, si
shl     bx, 1
mov     ax, bx
add     bx, [bp+var_E]
mov     es:[bx], di
mov     cx, di
sub     dx, dx
mov     [bp+var_16], cx
or      dl, 8
mov     word ptr [bp+var_A], cx
mov     word ptr [bp+var_A+2], dx
mov     es, dx
assume es:nothing
mov     bx, di
mov     cl, es:[bx+5]
mov     [bp+var_2], cl
mov     byte ptr es:[bx+5], 92h
mov     bx, ax
add     bx, [bp+var_6]
mov     es, [bp+var_4]
assume es:nothing
mov     ax, [bp+var_16]
mov     cx, es:[bx]
mov     es, ax
mov     bx, cx
cmp     word ptr es:[bx], 80h
jb      short loc_1576D
mov     dx, [bp+arg_2]
add     es:[bx], dx

loc_1576D:
mov     al, [bp+var_2]
les     bx, [bp+var_A]
mov     es:[bx+5], al

loc_15777:
dec     si
jns     short loc_1570C
call    sub_12D91
pop     si
pop     di
leave
retn
sub_156D6 endp



; Attributes: bp-based frame

sub_15781 proc near

var_8= word ptr -8
var_6= dword ptr -6
var_2= word ptr -2
arg_0= word ptr  4

enter   8, 0
push    di
push    si
mov     [bp+var_8], 0
call    sub_1355A
mov     word ptr [bp+var_6], 0
mov     word ptr [bp+var_6+2], 8
cmp     [bp+arg_0], 0
jle     short loc_157F3
mov     bx, 8
mov     es, bx
assume es:nothing
mov     si, es:[bx]
shr     si, 3
dec     si
dec     si
mov     ax, [bp+arg_0]
add     ax, 10h
mov     [bp+var_2], ax
jmp     short loc_157C0

loc_157B7:
cmp     [bp+var_2], si
jl      short loc_157BF
jmp     loc_15848

loc_157BF:
dec     si

loc_157C0:
mov     bx, si
shl     bx, 3
add     bx, word ptr [bp+var_6]
mov     es, word ptr [bp+var_6+2]
assume es:nothing
cmp     byte ptr es:[bx+5], 0
jnz     short loc_157B7
mov     di, [bp+arg_0]
dec     di

loc_157D6:
dec     di
jns     short loc_157DE

loc_157D9:
mov     [bp+var_8], si
jmp     short loc_15848

loc_157DE:
dec     si
mov     bx, si
shl     bx, 3
add     bx, word ptr [bp+var_6]
mov     es, word ptr [bp+var_6+2]
cmp     byte ptr es:[bx+5], 0
jz      short loc_157D6
jmp     short loc_157C0

loc_157F3:
les     bx, [bp+var_6]
mov     ax, es:[bx+8]
shr     ax, 3
add     ax, [bp+arg_0]
dec     ax
dec     ax
mov     [bp+var_2], ax
mov     si, 10h
jmp     short loc_15842

loc_1580A:
mov     bx, si
shl     bx, 3
add     bx, word ptr [bp+var_6]
cmp     byte ptr es:[bx+5], 0
jnz     short loc_1583A
mov     di, [bp+arg_0]
neg     di
add     si, di

loc_15820:
dec     si
mov     bx, si
shl     bx, 3
add     bx, word ptr [bp+var_6]
mov     es, word ptr [bp+var_6+2]
cmp     byte ptr es:[bx+5], 0
jnz     short loc_15842
dec     di
or      di, di
jg      short loc_15820
jmp     short loc_157D9

loc_1583A:
inc     si
cmp     [bp+var_2], si
jg      short loc_1580A
jmp     short loc_15848

loc_15842:
cmp     [bp+var_8], 0
jz      short loc_1580A

loc_15848:
call    sub_12D91
mov     ax, [bp+var_8]
pop     si
pop     di
leave
retn
sub_15781 endp



; Attributes: bp-based frame

sub_15852 proc near

var_12= dword ptr -12h
var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_6= word ptr -6
var_4= word ptr -4
var_2= byte ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

enter   12h, 0
push    di
push    si
call    sub_1355A
mov     ax, [bp+arg_0]
sub     dx, dx
mov     cx, ax
mov     bx, dx
mov     [bp+var_6], dx
mov     [bp+var_4], ax
sub     ax, 8
mov     [bp+var_E], dx
mov     [bp+var_C], ax
or      bl, 8
mov     es, bx
assume es:nothing
mov     bx, cx
mov     si, es:[bx]
inc     si
shr     si, 1
jmp     short loc_158F5

loc_15882:
mov     bx, si
shl     bx, 1
add     bx, [bp+var_E]
mov     es, [bp+var_C]
assume es:nothing
mov     di, es:[bx]
cmp     di, 80h
jb      short loc_158F5
cmp     [bp+arg_2], di
jnz     short loc_158A7
mov     ax, [bp+arg_4]
mov     bx, si
shl     bx, 1
add     bx, [bp+var_E]
mov     es:[bx], ax

loc_158A7:
mov     ax, [bp+arg_2]
mov     bx, si
shl     bx, 1
add     bx, [bp+var_6]
mov     es, [bp+var_4]
mov     bx, es:[bx]
mov     cx, di
mov     es, cx
mov     word ptr [bp+var_12], bx
mov     word ptr [bp+var_12+2], es
cmp     es:[bx], ax
jnz     short loc_158F5
mov     ax, di
and     al, 0F8h
mov     bx, ax
mov     cx, 8
mov     es, cx
assume es:nothing
mov     al, es:[bx+5]
mov     [bp+var_2], al
mov     byte ptr es:[bx+5], 0F2h
mov     ax, [bp+arg_4]
mov     cx, bx
mov     dx, es
les     bx, [bp+var_12]
assume es:nothing
mov     es:[bx], ax
mov     al, [bp+var_2]
mov     es, dx
assume es:nothing
mov     bx, cx
mov     es:[bx+5], al

loc_158F5:
dec     si
jns     short loc_15882
mov     ax, [bp+arg_2]
and     al, 0F8h
mov     bx, ax
mov     cx, 8
mov     es, cx
mov     byte ptr es:[bx+5], 80h
mov     ax, [bp+arg_4]
mov     es:[bx+6], ax
call    sub_12D91
pop     si
pop     di
leave
retn
sub_15852 endp



; Attributes: bp-based frame

sub_15917 proc near

arg_0= word ptr  4

enter   16h, 0
call    sub_1355A
push    [bp+arg_0]
call    sub_1364B
pop     bx
mov     ax, [bp+arg_0]
sub     ax, 8
push    ax
call    sub_1364B
pop     bx
call    sub_12D91
leave
retn
sub_15917 endp



; Attributes: bp-based frame

sub_15935 proc near

var_10= word ptr -10h
var_E= word ptr -0Eh
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= word ptr  4
arg_4= word ptr  8

enter   10h, 0
push    di
push    si
mov     word ptr [bp+var_8], 0
mov     word ptr [bp+var_8+2], 8

loc_15945:
mov     ax, [bp+arg_0]
mov     word ptr [bp+var_4], 0
mov     word ptr [bp+var_4+2], ax

loc_15950:
les     bx, [bp+var_4]
assume es:nothing
mov     ax, es:[bx]
mov     [bp+var_10], ax
mov     ax, [bp+arg_4]
add     es:[bx], ax
mov     cx, [bp+var_10]
and     cl, 0F8h
add     ax, cx
mov     si, ax
mov     word ptr [bp+var_8], ax
les     bx, [bp+var_8]
mov     al, es:[bx+5]
sub     ah, ah
mov     [bp+var_E], ax
mov     byte ptr es:[bx+5], 92h
add     word ptr [bp+var_4], 2
les     bx, [bp+var_4]
mov     di, es:[bx]
lea     ax, [bx+2]
mov     word ptr [bp+var_4], ax
jmp     short loc_159AA

loc_1598F:
les     bx, [bp+var_4]
add     word ptr [bp+var_4], 2
mov     bx, es:[bx]
mov     cx, si
mov     es, cx
cmp     word ptr es:[bx], 80h
jb      short loc_159AA
mov     ax, [bp+arg_4]
add     es:[bx], ax

loc_159AA:
dec     di
jns     short loc_1598F
mov     al, byte ptr [bp+var_E]
les     bx, [bp+var_8]
mov     es:[bx+5], al
test    byte ptr [bp+var_10], 3
jz      short loc_15950
add     [bp+arg_0], 8
test    byte ptr [bp+var_10], 2
jnz     short loc_159CA
jmp     loc_15945

loc_159CA:
pop     si
pop     di
leave
retn
sub_15935 endp



; Attributes: bp-based frame

sub_159CE proc near

var_10= word ptr -10h
var_E= word ptr -0Eh
var_A= word ptr -0Ah
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= word ptr  4
arg_4= word ptr  8
arg_6= word ptr  0Ah

enter   14h, 0
push    di
push    si
mov     word ptr [bp+var_8], 0
mov     word ptr [bp+var_8+2], 8

loc_159DE:
mov     ax, [bp+arg_0]
mov     word ptr [bp+var_4], 0
mov     word ptr [bp+var_4+2], ax

loc_159E9:
les     bx, [bp+var_4]
mov     si, es:[bx]
mov     [bp+var_10], si
and     si, 0FFF8h
cmp     si, [bp+arg_4]
jnz     short loc_15A09
mov     al, byte ptr [bp+var_10]
xor     al, byte ptr [bp+arg_6]
and     ax, 7
xor     ax, [bp+arg_6]
mov     es:[bx], ax

loc_15A09:
mov     word ptr [bp+var_8], si
mov     [bp+var_A], si
les     bx, [bp+var_8]
mov     al, es:[bx+5]
sub     ah, ah
mov     [bp+var_E], ax
mov     byte ptr es:[bx+5], 92h
add     word ptr [bp+var_4], 2
les     bx, [bp+var_4]
mov     di, es:[bx]
lea     ax, [bx+2]
mov     word ptr [bp+var_4], ax
jmp     short loc_15A51

loc_15A32:
les     bx, [bp+var_4]
add     word ptr [bp+var_4], 2
mov     ax, es:[bx]
mov     dx, [bp+var_A]
mov     es, dx
mov     bx, ax
mov     cx, [bp+arg_4]
cmp     es:[bx], cx
jnz     short loc_15A51
mov     cx, [bp+arg_6]
mov     es:[bx], cx

loc_15A51:
dec     di
jns     short loc_15A32
mov     al, byte ptr [bp+var_E]
les     bx, [bp+var_8]
mov     es:[bx+5], al
test    byte ptr [bp+var_10], 3
jz      short loc_159E9
add     [bp+arg_0], 8
test    byte ptr [bp+var_10], 2
jnz     short loc_15A71
jmp     loc_159DE

loc_15A71:
mov     ax, [bp+arg_4]
mov     word ptr [bp+var_8], ax
les     bx, [bp+var_8]
mov     byte ptr es:[bx+5], 80h
mov     ax, [bp+arg_6]
les     bx, [bp+var_8]
mov     es:[bx+6], ax
pop     si
pop     di
leave
retn
sub_159CE endp

align 2


; Attributes: bp-based frame

sub_15A8E proc near

var_EC= word ptr -0ECh
var_EA= word ptr -0EAh
var_E8= byte ptr -0E8h
var_E6= word ptr -0E6h
var_E4= word ptr -0E4h
var_E2= byte ptr -0E2h
var_62= word ptr -62h
var_60= word ptr -60h
var_5E= byte ptr -5Eh
var_5C= word ptr -5Ch
var_5A= word ptr -5Ah
var_58= word ptr -58h
var_56= byte ptr -56h
var_4= byte ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 0ECh
push    di
push    si
sub     al, al
mov     [bp+var_E8], al
mov     [bp+var_56], al
mov     [bp+var_5E], al
mov     [bp+var_5C], 0
call    sub_17EA8
mov     word ptr ds:0ACh, 0
mov     word ptr ds:0AEh, 10h
mov     [bp+var_E6], 0FFFEh
mov     [bp+var_E4], 0F000h
mov     word ptr ds:11D4h, 2
mov     bx, 0F000h
mov     es, bx
assume es:nothing
mov     bx, 0FFFEh
mov     si, es:[bx]
and     si, 0FFh
cmp     si, 0FBh
jz      short loc_15AE4
cmp     si, 0FDh
jl      short loc_15AE8

loc_15AE4:
inc     byte ptr ds:11F0h

loc_15AE8:
call    sub_18472
mov     ds:3Eh, al
call    sub_148FC
mov     si, ax
mov     word ptr ds:11D4h, 3
mov     al, 1
mov     [bp+var_4], al
mov     [bp+var_5E], al
or      si, si
jz      short loc_15B08
jmp     loc_15D5A

loc_15B08:
mov     si, 0Ah
sub     al, al
mov     [bp+var_4], al
mov     [bp+var_5E], al
lea     ax, [bp+var_E2]
push    ax
mov     cx, 0E84h
push    cx
call    sub_1621B
pop     bx
pop     bx
mov     di, ax
or      di, di
jnz     short loc_15B3E
lea     ax, [bp+var_E2]
push    ax
mov     ax, 0E8Ch
push    ax
call    sub_1621B
pop     bx
pop     bx
mov     di, ax
or      di, di
jnz     short loc_15B3E
jmp     loc_15D5A

loc_15B3E:
push    di
call    sub_161FB
pop     bx
push    ax
push    di
call    sub_134C1
pop     bx
pop     bx
mov     [bp+var_5C], di
mov     ax, 0E94h
push    ax
push    di
call    sub_1352D
pop     bx
pop     bx
or      ax, ax
jz      short loc_15B65
mov     si, 3
inc     byte ptr ds:11F0h
inc     [bp+var_4]

loc_15B65:
mov     ax, 0E9Ch
push    ax
push    di
call    sub_1352D
pop     bx
pop     bx
or      ax, ax
jz      short loc_15B76
inc     [bp+var_4]

loc_15B76:
mov     ax, 0EA1h
push    ax
push    di
call    sub_1352D
pop     bx
pop     bx
or      ax, ax
jz      short loc_15B8A
mov     si, 0Bh
inc     [bp+var_4]

loc_15B8A:
mov     ax, 0EA6h
push    ax
push    di
call    sub_1352D
pop     bx
pop     bx
or      ax, ax
jz      short loc_15BC8
mov     ax, 31h ; '1'
push    ax
push    word ptr ds:30h
call    sub_17CD6
pop     bx
pop     bx
mov     [bp+var_2], ax
push    ax
call    sub_141E0
pop     bx
mov     [bp+var_58], ax
jmp     short loc_15BBD

loc_15BB2:
mov     bx, [bp+var_58]
add     bx, [bp+var_2]
mov     al, [bx]
mov     [bx+1], al

loc_15BBD:
dec     [bp+var_58]
jns     short loc_15BB2
mov     bx, [bp+var_2]
mov     byte ptr [bx], 20h ; ' '

loc_15BC8:
mov     ax, 0EABh
push    ax
push    di
call    sub_1352D
pop     bx
pop     bx
or      ax, ax
jnz     short loc_15BE4
mov     ax, 0EAFh
push    ax
push    di
call    sub_1352D
pop     bx
pop     bx
or      ax, ax
jz      short loc_15BEC

loc_15BE4:
mov     si, 2
inc     [bp+var_4]
jmp     short loc_15C1B

loc_15BEC:
push    di
call    sub_17C36
pop     bx
mov     [bp+var_62], ax
mov     [bp+var_60], dx
or      dx, ax
jz      short loc_15C1B
inc     [bp+var_4]
cmp     [bp+var_60], 1
jl      short loc_15C19
jg      short loc_15C0A
or      ax, ax
jz      short loc_15C19

loc_15C0A:
mov     dx, [bp+var_60]
sub     ax, 3880h
sbb     dx, 1
mov     [bp+var_62], ax
mov     [bp+var_60], dx

loc_15C19:
mov     si, ax

loc_15C1B:
mov     ax, 2Ch ; ','
push    ax
mov     [bp+var_2], di
push    di
call    sub_17CD6
pop     bx
pop     bx
mov     di, ax
or      di, di
jz      short loc_15C48
lea     ax, [di+1]
push    ax
call    sub_17C32
pop     bx
mov     [bp+var_58], ax
or      ax, ax
jl      short loc_15C48
inc     ax
mov     ds:12h, ax
mov     ds:10h, ax
inc     [bp+var_E8]

loc_15C48:
mov     ax, 40h ; '@'
push    ax
push    [bp+var_2]
call    sub_17CD6
pop     bx
pop     bx
mov     di, ax
or      di, di
jz      short loc_15C95
push    di
call    sub_16179
pop     bx
mov     [bp+var_58], ax
or      ax, ax
jz      short loc_15C6E
mov     ds:0ECAh, ax
or      byte ptr ds:11D2h, 2

loc_15C6E:
mov     ax, 2Dh ; '-'
push    ax
push    di
call    sub_17CD6
pop     bx
pop     bx
mov     di, ax
or      di, di
jz      short loc_15C95
push    di
call    sub_16179
pop     bx
mov     [bp+var_58], ax
or      ax, ax
jz      short loc_15C95
mov     ds:0ECEh, ax
inc     [bp+var_5E]
or      byte ptr ds:11D2h, 4

loc_15C95:
mov     ax, 3Ah ; ':'
push    ax
push    [bp+var_2]
call    sub_17CD6
pop     bx
pop     bx
mov     di, ax
or      di, di
jz      short loc_15CB7
push    di
call    sub_16179
pop     bx
mov     ds:0ECCh, ax
inc     [bp+var_5E]
or      byte ptr ds:11D2h, 1

loc_15CB7:
mov     ax, 5Eh ; '^'
push    ax
push    [bp+var_2]
call    sub_17CD6
pop     bx
pop     bx
mov     di, ax
or      di, di
jz      short loc_15CD1
push    di
call    sub_16179
pop     bx
mov     ds:14h, ax

loc_15CD1:
mov     ax, 0EB4h
push    ax
push    [bp+var_2]
call    sub_17D00
pop     bx
pop     bx
or      ax, ax
jz      short loc_15CE5
inc     byte ptr ds:11F1h

loc_15CE5:
mov     ax, 0EB9h
push    ax
push    [bp+var_2]
call    sub_17D00
pop     bx
pop     bx
or      ax, ax
jz      short loc_15CFA
mov     byte ptr ds:36h, 80h

loc_15CFA:
mov     ax, 2Bh ; '+'
push    ax
push    [bp+var_2]
call    sub_17CD6
pop     bx
pop     bx
or      ax, ax
jz      short loc_15D0F
or      byte ptr ds:47h, 2

loc_15D0F:
mov     ax, 56h ; 'V'
push    ax
push    [bp+var_2]
call    sub_17CD6
pop     bx
pop     bx
mov     di, ax
or      di, di
jz      short loc_15D36
cmp     byte ptr [di+1], 43h ; 'C'
jz      short loc_15D36
push    di
call    sub_16179
pop     bx
mov     [bp+var_58], ax
or      ax, ax
jz      short loc_15D36
mov     ds:34h, al

loc_15D36:
mov     ax, 0EBDh
push    ax
push    [bp+var_2]
call    sub_17D00
pop     bx
pop     bx
mov     di, ax
or      di, di
jz      short loc_15D5A
lea     ax, [di+3]
push    ax
call    sub_16179
pop     bx
mov     [bp+var_58], ax
or      ax, ax
jz      short loc_15D5A
mov     ds:0D0Ch, ax

loc_15D5A:
push    si
call    sub_1613D
pop     bx
or      ax, ax
jz      short loc_15D68
call    sub_17F45
jmp     short loc_15D6D

loc_15D68:
or      byte ptr ds:47h, 1

loc_15D6D:
call    sub_1853B
or      si, si
jge     short loc_15D8B
inc     [bp+var_56]
mov     ax, si
neg     ax
mov     si, ax
cmp     si, 0Bh
jz      short loc_15D85
jmp     loc_15E7D

loc_15D85:
call    near ptr sub_19286
jmp     loc_15E7D

loc_15D8B:
call    sub_18252
or      ax, ax
jz      short loc_15D95
mov     si, 10h

loc_15D95:
cmp     si, 2
jnz     short loc_15D9D
call    sub_18217

loc_15D9D:
cmp     byte ptr ds:2Fh, 3
jl      short loc_15E0D
mov     word ptr ds:9C2h, 295Dh
call    sub_181C8
mov     ds:2Fh, al
call    sub_1894C
mov     [bp+var_58], ax
or      ax, ax
jz      short loc_15DD3
mov     ax, si
mov     ds:46h, al
cmp     si, 0Bh
jnz     short loc_15DCE
call    near ptr sub_19286
or      ax, ax
jle     short loc_15DCE
jmp     loc_15E7D

loc_15DCE:
sub     si, si
jmp     loc_160FE

loc_15DD3:
call    near ptr sub_19286
mov     [bp+var_58], ax
or      ax, ax
jle     short loc_15DE8
mov     ax, si
mov     ds:46h, al
mov     si, 0Bh
jmp     loc_15E7D

loc_15DE8:
mov     word ptr ds:11D4h, 4
or      ax, ax
jge     short loc_15DFA
mov     ax, 11h
push    ax
call    sub_13E6D
pop     bx

loc_15DFA:
push    si
call    sub_1613D
pop     bx
or      ax, ax
jnz     short loc_15E0D
mov     si, 3
call    sub_18222
or      ax, ax
jz      short loc_15E7D

loc_15E0D:
push    si
call    sub_1613D
pop     bx
or      ax, ax
jnz     short loc_15E22
call    sub_18222
or      ax, ax
jz      short loc_15E22
mov     si, 2
jmp     short loc_15E7D

loc_15E22:
cmp     [bp+var_4], 0
jnz     short loc_15E7D
call    sub_1844E
push    dx
push    ax
call    sub_18419
pop     bx
pop     bx
mov     [bp+var_EC], ax
mov     [bp+var_EA], dx
or      dx, ax
jnz     short loc_15E60
call    sub_18469
push    dx
push    ax
call    sub_18419
pop     bx
pop     bx
mov     [bp+var_EC], ax
mov     [bp+var_EA], dx
or      dx, ax
jnz     short loc_15E60
mov     [bp+var_EC], 0
mov     [bp+var_EA], 9

loc_15E60:
cmp     [bp+var_E8], 0
jnz     short loc_15E79
cmp     [bp+var_EC], 0
jz      short loc_15E79
mov     ax, [bp+var_EC]
inc     ax
mov     ds:12h, ax
mov     ds:10h, ax

loc_15E79:
mov     si, [bp+var_EA]

loc_15E7D:
cmp     si, 0Bh
jz      short loc_15E8C
test    byte ptr ds:47h, 80h
jz      short loc_15E8C
call    sub_1855C

loc_15E8C:
mov     byte ptr ds:10EEh, 0FFh
mov     ax, si
dec     ax
jnz     short loc_15E99
jmp     loc_15F24

loc_15E99:
dec     ax
jnz     short loc_15E9F
jmp     loc_15FA3

loc_15E9F:
dec     ax
jnz     short loc_15EA5
jmp     loc_15FC4

loc_15EA5:
dec     ax
jnz     short loc_15EAB
jmp     loc_1601F

loc_15EAB:
dec     ax
jnz     short loc_15EB1
jmp     loc_15FD9

loc_15EB1:
dec     ax
jnz     short loc_15EB7
jmp     loc_16012

loc_15EB7:
dec     ax
jnz     short loc_15EBD
jmp     loc_16022

loc_15EBD:
dec     ax
jnz     short loc_15EC3
jmp     loc_1603C

loc_15EC3:
dec     ax
jnz     short loc_15EC9
jmp     loc_16022

loc_15EC9:
dec     ax
jnz     short loc_15ECF
jmp     loc_16059

loc_15ECF:
dec     ax
jnz     short loc_15ED5
jmp     loc_16061

loc_15ED5:
dec     ax
jnz     short loc_15EDB
jmp     loc_16068

loc_15EDB:
dec     ax
jnz     short loc_15EE1
jmp     loc_1606F

loc_15EE1:
dec     ax
jnz     short loc_15EE7
jmp     loc_1607C

loc_15EE7:
dec     ax
jnz     short loc_15EED
jmp     loc_16084

loc_15EED:
dec     ax
jnz     short loc_15EF3
jmp     loc_16096

loc_15EF3:
sub     ax, 3
jnz     short loc_15EFB
jmp     loc_1601A

loc_15EFB:
dec     ax
jnz     short loc_15F01
jmp     loc_16051

loc_15F01:
sub     ax, 10Ah
jnz     short loc_15F09
jmp     loc_1601F

loc_15F09:
sub     ax, 64h ; 'd'
jnz     short loc_15F11
jmp     loc_15FC1

loc_15F11:
sub     ax, 171Ah
jnz     short loc_15F19
jmp     loc_1600F

loc_15F19:
sub     ax, 0DADh
jz      short loc_15F21
jmp     loc_1609D

loc_15F21:
mov     si, 1

loc_15F24:
mov     [bp+var_5A], 381h
cmp     [bp+var_5E], 0
jnz     short loc_15F3C
call    sub_18824
or      ax, ax
jnz     short loc_15F3C
call    sub_17FB0
mov     [bp+var_5E], al

loc_15F3C:
mov     word ptr ds:11FEh, 146h
mov     word ptr ds:1200h, 40h ; '@'
les     bx, ds:11FEh
assume es:nothing
test    byte ptr es:[bx], 80h
jz      short loc_15F60
cmp     word ptr ds:0ECAh, 500h
jnb     short loc_15F60
mov     word ptr ds:0ECAh, 500h

loc_15F60:
or      byte ptr ds:14h, 4
mov     word ptr ds:11D4h, 5
cmp     [bp+var_5E], 0
jnz     short loc_15F80
call    sub_18824
or      ax, ax
jnz     short loc_15F80
mov     ax, 12h
push    ax
call    sub_13E6D
pop     bx

loc_15F80:
mov     ax, ds:0ECAh
add     ax, ds:0ECCh
mov     [bp+var_58], ax
cmp     ax, ds:0ECEh
jge     short loc_15F93
mov     ds:0ECEh, ax

loc_15F93:
mov     ax, ds:0ECEh
sub     ax, 400h
mov     ds:0A8h, ax
inc     byte ptr ds:11F0h
jmp     loc_160D4

loc_15FA3:
mov     [bp+var_5A], 8DAh
call    sub_18222
mov     ds:120Ch, al
cmp     [bp+var_56], 0
jz      short loc_15FB9
or      byte ptr ds:120Ch, 2

loc_15FB9:
mov     byte ptr ds:10EFh, 1
jmp     loc_160D4

loc_15FC1:
mov     si, 3

loc_15FC4:
mov     [bp+var_5A], 2814h
mov     byte ptr ds:10EEh, 9

loc_15FCE:
mov     byte ptr ds:10EFh, 1
call    sub_18590
jmp     loc_160D4

loc_15FD9:
mov     [bp+var_5A], 3A7h
cmp     byte ptr ds:2Fh, 3
jl      short loc_15FED

loc_15FE5:
mov     byte ptr ds:36h, 80h
jmp     loc_15F60

loc_15FED:
cmp     byte ptr ds:3Eh, 0
jnz     short loc_15FF7
jmp     loc_15F60

loc_15FF7:
mov     ax, 5Eh ; '^'
push    ax
call    sub_10B12
pop     bx
mov     ax, 5Eh ; '^'
push    ax
call    sub_13FFE
pop     bx
mov     ds:0F82h, ax
jmp     loc_15F60

loc_1600F:
mov     si, 6

loc_16012:
mov     [bp+var_5A], 71Ah
jmp     loc_160D4

loc_1601A:
mov     byte ptr ds:0ED0h, 0

loc_1601F:
mov     si, 9

loc_16022:
mov     [bp+var_5A], 8B2h
cmp     byte ptr ds:11F0h, 0
jz      short loc_15FCE
cmp     byte ptr ds:2Fh, 2
jnz     short loc_15FCE
call    sub_18269
or      ax, ax
jz      short loc_1604C

loc_1603C:
mov     si, 8
mov     byte ptr ds:10EEh, 0Ah
mov     [bp+var_5A], 749h
jmp     loc_160D4

loc_1604C:
mov     ax, 13h
jmp     short loc_160CF

loc_16051:
mov     byte ptr ds:0ED0h, 0
mov     si, 0Ah

loc_16059:
mov     [bp+var_5A], 905h
jmp     loc_15FCE

loc_16061:
mov     [bp+var_5A], 29ACh
jmp     short loc_160D4

loc_16068:
mov     [bp+var_5A], 679h
jmp     short loc_160D4

loc_1606F:
mov     [bp+var_5A], 8ACh
mov     byte ptr ds:10EEh, 9
jmp     loc_15FB9

loc_1607C:
mov     [bp+var_5A], 3D6h
jmp     loc_15F60

loc_16084:
mov     [bp+var_5A], 462h
cmp     byte ptr ds:2Fh, 3
jge     short loc_16093
jmp     loc_15F60

loc_16093:
jmp     loc_15FE5

loc_16096:
mov     [bp+var_5A], 4F7h
jmp     short loc_160D4

loc_1609D:
mov     di, 1190h
mov     byte ptr [di], 0
cmp     [bp+var_5C], 0
jz      short loc_160C6
mov     ax, 0EC2h
push    ax
mov     ax, di
push    ax
call    sub_141AE
pop     bx
pop     bx
mov     ax, 14h
push    ax
push    [bp+var_5C]
mov     ax, 1197h
push    ax
call    sub_17C0A
add     sp, 6

loc_160C6:
mov     word ptr ds:11D4h, 6
mov     ax, 0FFECh

loc_160CF:
push    ax
call    sub_13E6D
pop     bx

loc_160D4:
cmp     byte ptr ds:10EEh, 0FFh
jnz     short loc_160E0
mov     ax, si
mov     ds:10EEh, al

loc_160E0:
mov     ax, si
mov     ds:2Eh, al
push    [bp+var_5A]
mov     [bp+var_EC], ax
call    sub_17E00
pop     bx
cmp     byte ptr ds:46h, 0
jnz     short loc_160FE
mov     al, byte ptr [bp+var_EC]
mov     ds:46h, al

loc_160FE:
mov     word ptr ds:42h, 9FAh
mov     word ptr ds:44h, 20h ; ' '
and     byte ptr ds:47h, 0FEh
mov     al, ds:46h
cbw
push    ax
call    sub_1613D
pop     bx
or      ax, ax
jnz     short loc_16121
or      byte ptr ds:47h, 1

loc_16121:
mov     ax, si
mov     ds:2Eh, al
cmp     si, 0Bh
jnz     short loc_1612E
call    sub_19801

loc_1612E:
cmp     [bp+var_56], 0
jnz     short loc_16137
call    sub_14C94

loc_16137:
pop     si
pop     di
mov     sp, bp
pop     bp
retn
sub_15A8E endp



; Attributes: bp-based frame

sub_1613D proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
cmp     [bp+arg_0], 1
jz      short loc_16158
cmp     [bp+arg_0], 5
jz      short loc_16158
cmp     [bp+arg_0], 0Eh
jz      short loc_16158
cmp     [bp+arg_0], 0Fh
jnz     short loc_1615D

loc_16158:
mov     ax, 1
pop     bp
retn

loc_1615D:
sub     ax, ax
pop     bp
retn
sub_1613D endp



; Attributes: bp-based frame

sub_16161 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
cmp     [bp+arg_0], 30h ; '0'
jl      short loc_16175
cmp     [bp+arg_0], 39h ; '9'
jg      short loc_16175
mov     ax, 1
pop     bp
retn

loc_16175:
sub     ax, ax
pop     bp
retn
sub_16161 endp



; Attributes: bp-based frame

sub_16179 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 2
push    di
push    si
mov     si, [bp+arg_0]
sub     di, di
mov     ax, 0ED1h
push    ax
lea     ax, [si+1]
push    ax
call    sub_161FB
pop     bx
mov     si, ax
push    si
call    sub_1352D
pop     bx
pop     bx
or      ax, ax
jnz     short loc_161B4
push    si
call    sub_17C36
pop     bx
mov     di, ax

loc_161A5:
mov     al, [si]
cbw
push    ax
call    sub_16161
pop     bx
or      ax, ax
jz      short loc_161D8
inc     si
jmp     short loc_161A5

loc_161B4:
inc     si
inc     si
jmp     short loc_161D3

loc_161B8:
mov     al, [si]
cbw
push    ax
mov     ax, 0AB0h
push    ax
call    sub_17CD6
pop     bx
pop     bx
or      ax, ax
jz      short loc_161D8
mov     cl, 4
shl     di, cl
sub     ax, 0AB0h
add     di, ax
inc     si

loc_161D3:
cmp     byte ptr [si], 0
jnz     short loc_161B8

loc_161D8:
push    si
call    sub_161FB
pop     bx
mov     bx, ax
cmp     byte ptr [bx], 4Dh ; 'M'
jnz     short loc_161F3
test    di, 0FFC0h
jz      short loc_161EF
mov     di, 0FFFFh
jmp     short loc_161F3

loc_161EF:
mov     cl, 0Ah
shl     di, cl

loc_161F3:
mov     ax, di
pop     si
pop     di
mov     sp, bp
pop     bp
retn
sub_16179 endp



; Attributes: bp-based frame

sub_161FB proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
jmp     short loc_1620F

loc_16204:
cmp     byte ptr [si], 20h ; ' '
jz      short loc_1620E
cmp     byte ptr [si], 9
jnz     short loc_16214

loc_1620E:
inc     si

loc_1620F:
cmp     byte ptr [si], 0
jnz     short loc_16204

loc_16214:
mov     ax, si
pop     si
mov     sp, bp
pop     bp
retn
sub_161FB endp



; Attributes: bp-based frame

sub_1621B proc near

var_6= word ptr -6
var_4= dword ptr -4
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 0Ah
push    si
cmp     word ptr ds:9B8h, 0
jnz     short loc_1622D

loc_16229:
sub     ax, ax
jmp     short loc_1628F

loc_1622D:
mov     ax, ds:9B8h
mov     word ptr [bp+var_4], 0
mov     word ptr [bp+var_4+2], ax

loc_16238:
les     bx, [bp+var_4]
cmp     byte ptr es:[bx], 0
jz      short loc_16229
mov     si, [bp+arg_0]
jmp     short loc_16262

loc_16246:
mov     al, [si]
les     bx, [bp+var_4]
cmp     es:[bx], al
jz      short loc_1625E

loc_16250:
mov     bx, word ptr [bp+var_4]
inc     word ptr [bp+var_4]
cmp     byte ptr es:[bx], 0
jz      short loc_16238
jmp     short loc_16250

loc_1625E:
inc     si
inc     word ptr [bp+var_4]

loc_16262:
cmp     byte ptr [si], 0
jnz     short loc_16246
mov     [bp+var_6], 80h
mov     si, [bp+arg_2]

loc_1626F:
dec     [bp+var_6]
cmp     [bp+var_6], 0
jle     short loc_16289
les     bx, [bp+var_4]
inc     word ptr [bp+var_4]
mov     al, es:[bx]
inc     si
mov     [si-1], al
or      al, al
jnz     short loc_1626F

loc_16289:
mov     byte ptr [si], 0
mov     ax, [bp+arg_2]

loc_1628F:
pop     si
mov     sp, bp
pop     bp
retn
sub_1621B endp



; Attributes: bp-based frame

sub_16294 proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

enter   4, 0
cmp     [bp+arg_2], 0
jz      short loc_162A5
cmp     [bp+arg_2], 7FFFh
jnz     short loc_162AA

loc_162A5:
mov     [bp+arg_2], 800h

loc_162AA:
cmp     word ptr ds:0ECCh, 3C00h
jz      short loc_162B8
mov     ax, ds:0ECCh
mov     [bp+arg_2], ax

loc_162B8:
cmp     [bp+arg_2], 0
jnz     short loc_162C1
jmp     locret_1634E

loc_162C1:
mov     ax, [bp+arg_2]
sub     dx, dx
mov     cl, 0Ah
call    sub_14364
push    dx
push    ax
call    near ptr sub_13C50
pop     bx
pop     bx
mov     [bp+var_4], ax
mov     [bp+var_2], dx
push    0Ah
lea     ax, [bp+var_4]
push    ax
call    sub_17D7C
mov     cx, [bp+arg_0]
sub     bx, bx
cmp     bx, dx
jl      short loc_162F6
jg      short loc_162F0
cmp     cx, ax
jbe     short loc_162F6

loc_162F0:
push    6
call    sub_13E6D
pop     bx

loc_162F6:
cmp     byte ptr ds:0ED8h, 0
jnz     short locret_1634E
inc     byte ptr ds:0ED8h
cmp     word ptr ds:11DEh, 5Ah ; 'Z'
jb      short locret_1634E
cmp     [bp+var_2], 0
jg      short loc_16316
jl      short locret_1634E
cmp     [bp+var_4], 28h ; '('
jb      short locret_1634E

loc_16316:
cmp     [bp+arg_4], 1
sbb     ax, ax
neg     ax
test    al, 4
jnz     short locret_1634E
push    word ptr ds:0C32h
call    sub_18D10
pop     bx
push    word ptr ds:0C4Ah
call    sub_18D10
pop     bx
push    word ptr ds:0C3Ah
call    sub_18D10
pop     bx
mov     cl, 4
call    sub_17D98
mov     ds:0A10h, ax
mov     ds:0A12h, dx
cmp     dx, 1
jl      short locret_1634E
call    sub_18D55

locret_1634E:
leave
retn
sub_16294 endp

push    bp
mov     bp, sp
mov     ax, 0FF80h
mov     dx, 1301h
mov     es, word ptr [bp+4]
int     21h             ; DOS - DOS v??? - OEM FUNCTION
jnb     short locret_16366
push    22h ; '"'
call    sub_13E6D
pop     bx

locret_16366:
leave
retn
byte_16368 db 0C8h, 0CEh, 2 dup(0), 57h, 56h, 2Bh, 0C0h
db 89h, 46h, 0FCh, 89h, 46h, 0FAh, 0C7h
db 6, 7Ch, 9, 2 dup(0FFh), 68h, 0B0h, 0
db 6Ah, 1, 8Dh, 86h, 38h, 0FFh, 50h, 0E8h
db 82h, 0E8h, 83h, 0C4h, 6, 8Bh, 86h, 54h
db 0FFh, 8Bh, 96h, 56h, 0FFh, 0A3h, 0F4h
db 11h, 89h, 16h, 0F6h, 11h, 68h, 0D9h, 0Eh
db 8Dh, 46h, 0A8h, 50h, 0E8h, 5Bh, 19h, 2 dup(5Bh)
db 0Bh, 0C0h, 75h, 10h, 68h, 0DEh, 0Eh, 8Dh
db 46h, 0A8h, 50h, 0E8h, 4Bh, 19h, 2 dup(5Bh)
db 0Bh, 0C0h, 74h, 10h, 0A1h, 0F4h, 11h
db 8Bh, 16h, 0F6h, 11h, 0A3h, 0DAh, 11h
db 89h, 16h, 0DCh, 11h, 0EBh, 0B1h, 81h
db 6, 0DAh, 11h, 0B0h, 0, 83h, 16h, 0DCh
db 11h, 0, 0FFh, 36h, 0DCh, 11h, 0FFh, 36h
db 0DAh, 11h, 0E8h, 9Fh, 17h, 2 dup(5Bh)
db 8Bh, 86h, 70h, 0FFh, 89h, 46h, 0E8h, 83h
db 7Eh, 6, 0, 75h, 7, 8Ah, 86h, 74h, 0FFh
db 0A2h, 80h, 9, 83h, 7Eh, 6, 0, 7Dh, 0Ah
db 0C7h, 46h, 6, 2 dup(0), 80h, 26h, 14h
db 0, 0F7h, 0F6h, 86h, 6Ch, 0FFh, 2, 74h
db 0Ah, 0C7h, 46h, 6, 2 dup(0FFh), 80h, 0Eh
db 14h, 0, 8, 0F6h, 86h, 6Ch, 0FFh, 1, 75h
db 6, 6Ah, 1Eh, 0E8h, 49h, 0DAh, 5Bh, 8Bh
db 86h, 68h, 0FFh, 9, 6, 14h, 0, 8Bh, 86h
db 72h, 0FFh, 89h, 46h, 0EAh, 0Bh, 0C0h
db 75h, 5, 0C7h, 46h, 0EAh, 80h, 0, 0FFh
db 0B6h, 6Ch, 2 dup(0FFh), 0B6h, 44h, 2 dup(0FFh)
db 0B6h, 42h, 0FFh, 0E8h, 48h, 0FEh, 83h
db 0C4h, 6, 8Bh, 46h, 0EAh, 3, 46h, 0E8h
db 2Dh, 7Fh, 0, 89h, 46h, 0ECh, 5, 0Fh, 0
db 0C1h, 0E8h, 4, 50h, 0E8h, 0D1h, 2, 5Bh
db 89h, 46h, 0FCh, 0Bh, 0C0h, 75h, 6, 6Ah
db 0Ah, 0E8h, 0FBh, 0D9h, 5Bh, 6Ah, 0, 0FFh
db 76h, 0ECh, 6Ah, 0, 0FFh, 76h, 0FCh, 0E8h
db 0BCh, 0D5h, 83h, 0C4h, 8, 8Bh, 76h, 0ECh
db 2Bh, 76h, 0EAh, 56h, 8Bh, 46h, 0EAh, 24h
db 0F8h, 3, 46h, 0FAh, 8Bh, 56h, 0FCh, 52h
db 50h, 0E8h, 1Fh, 17h, 83h, 0C4h, 6, 3Bh
db 0F0h, 76h, 6, 6Ah, 0Eh, 0E8h, 0C7h, 0D9h
db 5Bh, 83h, 6Eh, 0ECh, 8, 8Bh, 5Eh, 0ECh
db 80h, 0E3h, 0F8h, 3, 5Eh, 0FAh, 8Eh, 46h
db 0FCh, 26h, 80h, 7Fh, 5, 0, 74h, 0E9h
db 8Bh, 46h, 0EAh, 89h, 46h, 0FAh, 8Bh, 46h
db 0FAh, 8Bh, 56h, 0FCh, 56h, 57h, 1Eh, 8Dh
db 7Eh, 0F0h, 8Bh, 0F0h, 16h, 7, 8Eh, 0DAh
db 4 dup(0A5h), 1Fh, 5Fh, 5Eh, 8Bh, 76h
db 0F0h, 8Ah, 46h, 0F5h, 2Ah, 0E4h, 89h
db 46h, 0FEh, 0Bh, 0C0h, 75h, 3, 0E9h, 3
db 1, 8Bh, 46h, 0F6h, 80h, 0E4h, 1Fh, 89h
db 86h, 36h, 0FFh, 2Bh, 0FFh, 0Bh, 0F6h
db 74h, 7, 56h, 0E8h, 0AAh, 0C8h, 5Bh, 8Bh
db 0F8h, 0F6h, 46h, 0F7h, 20h, 74h, 2, 2Bh
db 0F6h, 39h, 0BEh, 36h, 0FFh, 76h, 4, 8Bh
db 0BEh, 36h, 0FFh, 0A0h, 80h, 9, 98h, 89h
db 46h, 0EEh, 8Bh, 8Eh, 46h, 0FFh, 39h, 4Eh
db 0FAh, 75h, 10h, 0Bh, 0C0h, 75h, 0Ch, 0F6h
db 86h, 6Ch, 0FFh, 4, 75h, 5, 0C6h, 6, 80h
db 9, 1, 57h, 0E8h, 0FAh, 1, 5Bh, 89h, 46h
db 0F8h, 0Bh, 0C0h, 75h, 6, 6Ah, 6, 0E8h
db 24h, 0D9h, 5Bh, 8Ah, 46h, 0EEh, 0A2h
db 80h, 9, 8Bh, 86h, 46h, 0FFh, 39h, 46h
db 0FAh, 75h, 7, 0FFh, 76h, 0F8h, 0E8h, 0F1h
db 0FDh, 5Bh, 8Bh, 46h, 0F8h, 0C4h, 5Eh
db 0FAh, 26h, 89h, 47h, 6, 8Bh, 0D8h, 0C1h
db 0EBh, 2 dup(3), 1Eh, 0A0h, 0Ah, 8Eh, 6
db 0A2h, 0Ah, 26h, 0C6h, 7, 1, 0F6h, 46h
db 0F7h, 40h, 74h, 4, 26h, 0C6h, 7, 3, 0Bh
db 0F6h, 74h, 35h, 0F7h, 0C6h, 0Fh, 0, 74h
db 1, 46h, 8Dh, 44h, 0FFh, 50h, 8Bh, 4Eh
db 0F8h, 2Bh, 0D2h, 51h, 52h, 89h, 96h, 32h
db 0FFh, 89h, 8Eh, 34h, 0FFh, 0E8h, 13h
db 16h, 83h, 0C4h, 6, 6Ah, 1, 8Dh, 44h, 0FFh
db 0Bh, 86h, 32h, 0FFh, 8Bh, 96h, 34h, 0FFh
db 52h, 50h, 0E8h, 0FEh, 15h, 83h, 0C4h
db 6, 83h, 0BEh, 36h, 0FFh, 0, 74h, 18h
db 8Bh, 0BEh, 36h, 0FFh, 0C1h, 0E7h, 4, 2Bh
db 0FEh, 74h, 0Dh, 6Ah, 0, 57h, 56h, 0FFh
db 76h, 0F8h, 0E8h, 62h, 0D4h, 83h, 0C4h
db 8, 8Bh, 46h, 0EAh, 39h, 46h, 0FAh, 75h
db 6, 8Bh, 46h, 0F8h, 0A3h, 3Eh, 0Ch, 0FFh
db 76h, 0F8h, 0E8h, 90h, 27h, 5Bh, 8Bh, 46h
db 0ECh, 83h, 46h, 0FAh, 8, 39h, 46h, 0FAh
db 77h, 3, 0E9h, 0C3h, 0FEh, 0C7h, 46h, 0FAh
db 2 dup(0), 8Bh, 9Eh, 46h, 0FFh, 80h, 0E3h
db 0F8h, 3, 5Eh, 0FAh, 8Eh, 46h, 0FCh, 26h
db 8Bh, 47h, 6, 0C4h, 5Eh, 8, 26h, 89h, 47h
db 2, 50h, 0E8h, 2Eh, 0FDh, 5Bh, 8Bh, 86h
db 48h, 0FFh, 2Dh, 0Ch, 0, 24h, 0FEh, 0C4h
db 5Eh, 8, 26h, 89h, 47h, 0Eh, 8Bh, 9Eh
db 4Eh, 0FFh, 80h, 0E3h, 0F8h, 3, 5Eh, 0FAh
db 8Eh, 46h, 0FCh, 26h, 8Bh, 47h, 6, 0C4h
db 5Eh, 8, 26h, 89h, 47h, 22h, 8Bh, 86h
db 4Ch, 0FFh, 26h, 89h, 47h, 1Eh, 0A1h, 3Eh
db 0Ch, 26h, 89h, 47h, 0Ah, 8Bh, 46h, 0F8h
db 26h, 89h, 47h, 8, 6, 53h, 0FFh, 76h, 6
db 0E8h, 0F7h, 0E4h, 83h, 0C4h, 6, 83h, 7Eh
db 6, 0, 7Ch, 0Dh, 0E8h, 38h, 15h, 2Bh, 0C0h
db 0A3h, 0DCh, 11h, 0A3h, 0DAh, 11h, 0EBh
db 0Eh, 0A1h, 0F4h, 11h, 8Bh, 16h, 0F6h
db 11h, 0A3h, 0DAh, 11h, 89h, 16h, 0DCh
db 11h, 0A1h, 28h, 0Ch, 0C4h, 5Eh, 8, 26h
db 89h, 47h, 4, 26h, 89h, 47h, 6, 26h, 0C7h
db 47h, 26h, 0, 2, 83h, 0BEh, 4Ah, 0FFh
db 0, 74h, 16h, 8Bh, 86h, 4Ah, 0FFh, 89h
db 46h, 0ECh, 0FFh, 76h, 0EAh, 50h, 0FFh
db 76h, 0FCh, 0FFh, 76h, 0FAh, 0E8h, 0D7h
db 0, 0EBh, 0Fh, 0FFh, 76h, 0EAh, 0FFh, 76h
db 0ECh, 0FFh, 76h, 0FCh, 0FFh, 76h, 0FAh
db 0E8h, 8Ah, 1, 83h, 0C4h, 8, 0FFh, 76h
db 0EAh, 0FFh, 76h, 0ECh, 0FFh, 76h, 0FCh
db 0FFh, 76h, 0FAh, 0E8h, 68h, 0, 83h, 0C4h
db 8, 0FFh, 76h, 0FCh, 0E8h, 63h, 0CFh, 5Bh
db 5Eh, 5Fh, 0C9h, 0CBh


; Attributes: bp-based frame

sub_166ED proc near

var_6= word ptr -6
var_4= dword ptr -4
arg_0= word ptr  4

enter   8, 0
mov     word ptr [bp+var_4], offset byte_16368
mov     word ptr [bp+var_4+2], seg seg002
mov     [bp+var_6], ds
cmp     word ptr ds:0E70h, 0
jge     short loc_1670C
push    1190h
call    sub_17B6E
pop     bx

loc_1670C:
cmp     word ptr ds:0E70h, 0
jge     short loc_16719
push    0FFF8h
call    sub_13E6D
pop     bx

loc_16719:
mov     ax, ds:0C24h
mov     word ptr [bp+var_4+2], ax
push    ds
push    [bp+arg_0]
push    0
call    [bp+var_4]
mov     ax, [bp+var_6]
mov     word ptr ds:42h, 9FAh
mov     ds:44h, ax
leave
retn
sub_166ED endp



; Attributes: bp-based frame

sub_16736 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     ah, 48h ; 'H'
mov     bx, [bp+arg_0]
int     21h             ; DOS - 2+ - ALLOCATE MEMORY
                        ; BX = number of 16-byte paragraphs desired
cmc
sbb     bx, bx
and     ax, bx
leave
retn
sub_16736 endp

enter   0Eh, 0
push    si
shr     word ptr [bp+8], 3
push    word ptr ds:0C24h
call    sub_188E0
pop     bx
mov     [bp-0Ah], ax
mov     si, [bp+0Ah]
shr     si, 3
jmp     short loc_1678B

loc_16763:
mov     bx, si
shl     bx, 3
add     bx, [bp+4]
mov     es, word ptr [bp+6]
mov     al, es:[bx+5]
and     al, 18h
cmp     al, 18h
jnz     short loc_1678A
mov     ax, es:[bx+6]
mov     [bp-0Ch], ax
lea     ax, [bp-0Eh]
push    ax
push    9
call    sub_18972
pop     bx
pop     bx

loc_1678A:
inc     si

loc_1678B:
cmp     [bp+8], si
ja      short loc_16763
pop     si
leave
retn
enter   0Eh, 0
push    di
push    si
mov     ax, [bp+8]
shr     ax, 3
mov     [bp-0Ch], ax
shr     word ptr [bp+0Ah], 3

loc_167A6:
mov     bx, [bp-0Ch]
shl     bx, 3
add     bx, [bp+4]
mov     es, word ptr [bp+6]
mov     ax, es:[bx+6]
mov     word ptr [bp-4], 0
mov     [bp-2], ax

loc_167BE:
les     bx, [bp-4]
add     word ptr [bp-4], 2
mov     bx, es:[bx]
mov     [bp-0Eh], bx
and     bl, 0F8h
add     bx, [bp+4]
mov     es, word ptr [bp+6]
mov     si, es:[bx+6]
les     bx, [bp-4]
add     word ptr [bp-4], 2
mov     di, es:[bx]
jmp     short loc_1682A

loc_167E4:
les     bx, [bp-4]
add     word ptr [bp-4], 2
mov     bx, es:[bx]
mov     cx, si
mov     es, si
mov     [bp-0Ah], bx
mov     word ptr [bp-8], es
mov     ax, es:[bx]
mov     [bp-6], ax
cmp     ax, 80h
jb      short loc_16817
mov     bx, ax
and     bl, 0F8h
add     bx, [bp+4]
mov     es, word ptr [bp+6]
mov     ax, es:[bx+6]
les     bx, [bp-0Ah]
jmp     short loc_16827

loc_16817:
mov     bx, [bp-6]
and     bl, 0FBh
shr     bx, 2
mov     ax, [bx+0C1Eh]
mov     bx, [bp-0Ah]

loc_16827:
mov     es:[bx], ax

loc_1682A:
dec     di
jns     short loc_167E4
test    byte ptr [bp-0Eh], 3
jz      short loc_167BE
inc     word ptr [bp-0Ch]
test    byte ptr [bp-0Eh], 2
jnz     short loc_1683F
jmp     loc_167A6

loc_1683F:
mov     bx, [bp+8]
and     bl, 0F8h
add     bx, [bp+4]
mov     es, word ptr [bp+6]
push    word ptr es:[bx+6]
call    sub_1364B
pop     bx
pop     si
pop     di
leave
retn
enter   0Ch, 0
push    di
push    si
shr     word ptr [bp+8], 3
mov     bx, [bp+8]
shl     bx, 3
add     bx, [bp+4]
mov     es, word ptr [bp+6]
mov     ax, es:[bx+6]
mov     word ptr [bp-4], 0
mov     [bp-2], ax
mov     ax, es:[bx-2]
mov     word ptr [bp-8], 0
mov     [bp-6], ax
mov     si, es:[bx]
inc     si
shr     si, 1
jmp     short loc_16901

loc_1688D:
mov     bx, si
shl     bx, 1
add     bx, [bp-8]
mov     es, word ptr [bp-6]
mov     di, es:[bx]
cmp     di, 80h
jb      short loc_16901
mov     bx, di
and     bl, 0F8h
add     bx, [bp+4]
mov     es, word ptr [bp+6]
mov     di, es:[bx+6]
mov     bx, si
shl     bx, 1
mov     ax, bx
add     bx, [bp-8]
mov     es, word ptr [bp-6]
mov     es:[bx], di
mov     bx, ax
add     bx, [bp-4]
mov     es, word ptr [bp-2]
mov     ax, es:[bx]
mov     dx, di
mov     [bp-0Ch], ax
mov     [bp-0Ah], dx
mov     es, di
mov     bx, ax
mov     di, es:[bx]
cmp     di, 80h
jb      short loc_168EF
mov     bx, di
and     bl, 0F8h
add     bx, [bp+4]
mov     es, word ptr [bp+6]
mov     ax, es:[bx+6]
jmp     short loc_168FB

loc_168EF:
mov     bx, di
and     bl, 0FBh
shr     bx, 2
mov     ax, [bx+0C1Eh]

loc_168FB:
les     bx, [bp-0Ch]
mov     es:[bx], ax

loc_16901:
dec     si
jns     short loc_1688D
push    word ptr [bp-6]
call    sub_1364B
pop     bx
push    word ptr [bp-2]
call    sub_1364B
pop     bx
cmp     byte ptr ds:2Eh, 0
jz      short loc_1691C
jmp     loc_169A9

loc_1691C:
cmp     word ptr ds:0ED6h, 0
jz      short loc_16926
jmp     loc_169A9

loc_16926:
mov     ax, [bp+8]
shl     ax, 1
add     ax, 0Fh
shr     ax, 4
push    ax
call    sub_16736
pop     bx
mov     si, ax
or      si, si
jz      short loc_169A9
sub     cx, cx
mov     ds:0ED4h, cx
mov     ds:0ED6h, ax
mov     [bp-8], cx
mov     [bp-6], ax
mov     si, 10h
jmp     short loc_16961

loc_16950:
mov     bx, si
shl     bx, 1
mov     ax, [bx+0C1Eh]
add     bx, [bp-8]
mov     es, word ptr [bp-6]
mov     es:[bx], ax

loc_16961:
dec     si
or      si, si
jg      short loc_16950
mov     ax, [bp+0Ah]
sub     ax, 80h
les     bx, [bp-8]
mov     es:[bx], ax
shr     ax, 3
mov     di, ax
sub     ax, [bp+8]
neg     ax
dec     ax
mov     es:[bx+2], ax
mov     si, ax
jmp     short loc_169A4

loc_16985:
mov     bx, di
add     bx, si
shl     bx, 3
add     bx, [bp+4]
mov     es, word ptr [bp+6]
mov     ax, es:[bx+6]
mov     bx, si
shl     bx, 1
add     bx, [bp-8]
mov     es, word ptr [bp-6]
mov     es:[bx], ax
dec     si

loc_169A4:
cmp     si, 10h
jge     short loc_16985

loc_169A9:
pop     si
pop     di
leave
retn
align 2
enter   0Ah, 0
push    8
lea     ax, [bp-0Ah]
push    ax
push    0Ah
push    word ptr [bp+4]
call    sub_18291
add     sp, 8
push    0EE4h
lea     ax, [bp-0Ah]
push    ax
call    sub_1352D
pop     bx
pop     bx
or      ax, ax
jz      short loc_169E6
mov     byte ptr ds:36h, 80h
cmp     word ptr ds:0ECAh, 440h
jnb     short loc_169E6
mov     word ptr ds:0ECAh, 440h

loc_169E6:
mov     al, ds:36h
cbw
leave
retn


; Attributes: bp-based frame

sub_169EC proc near

var_3E= word ptr -3Eh
var_39= byte ptr -39h
var_38= word ptr -38h
var_34= byte ptr -34h
var_22= byte ptr -22h
var_1D= byte ptr -1Dh
var_8= word ptr -8
var_6= word ptr -6
arg_0= word ptr  4
arg_2= word ptr  6

enter   3Eh, 0
push    30h ; '0'
lea     ax, [bp+var_34]
push    ax
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_18291
add     sp, 8
mov     [bp+var_1D], 0
cmp     byte ptr ds:0CECh, 4
jge     short loc_16A38
push    0EEEh
lea     ax, [bp+var_22]
push    ax
call    sub_1352D
pop     bx
pop     bx
or      ax, ax
jz      short loc_16A38
mov     ax, [bp+var_8]
mov     dx, [bp+var_6]
and     al, 0F0h
sub     dh, dh
mov     cl, 4
call    sub_14370
mov     ds:98h, ax
mov     ds:9Ah, dx
mov     ax, 1
leave
retn

loc_16A38:
push    0Ah
lea     ax, [bp+var_3E]
push    ax
push    0C8h
push    [bp+arg_0]
call    sub_18291
add     sp, 8
cmp     [bp+var_3E], 0FF2Eh
jnz     short loc_16A66
cmp     [bp+var_39], 24h ; '$'
jnz     short loc_16A66
push    [bp+var_38]
call    sub_182FC
pop     bx
add     ds:98h, ax
adc     ds:9Ah, dx

loc_16A66:
sub     ax, ax
leave
retn
sub_169EC endp



; Attributes: bp-based frame

sub_16A6A proc near

var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= byte ptr -8

enter   0Ch, 0
push    5
lea     ax, [bp+var_8]
push    ax
push    10h
push    3
call    sub_12DBD
add     sp, 8
push    0EEEh
lea     ax, [bp+var_8]
push    ax
call    sub_1352D
pop     bx
pop     bx
or      ax, ax
jz      short locret_16ADE
push    2
lea     ax, [bp+var_C]
push    ax
push    10h
push    1Eh
call    sub_12DBD
add     sp, 8
push    [bp+var_C]
call    sub_182FC
pop     bx
mov     [bp+var_C], ax
mov     [bp+var_A], dx
mov     ax, ds:98h
mov     dx, ds:9Ah
cmp     [bp+var_A], dx
jb      short locret_16ADE
ja      short loc_16ABE
cmp     [bp+var_C], ax
jbe     short locret_16ADE

loc_16ABE:
mov     ax, ds:9Ch
mov     dx, ds:9Eh
cmp     [bp+var_A], dx
ja      short locret_16ADE
jb      short loc_16AD1
cmp     [bp+var_C], ax
jnb     short locret_16ADE

loc_16AD1:
mov     ax, [bp+var_C]
mov     dx, [bp+var_A]
mov     ds:98h, ax
mov     ds:9Ah, dx

locret_16ADE:
leave
retn
sub_16A6A endp



; Attributes: bp-based frame

sub_16AE0 proc near

var_16= byte ptr -16h
var_4= word ptr -4
var_2= word ptr -2

enter   16h, 0
push    12h
lea     ax, [bp+var_16]
push    ax
push    10h
push    0
call    sub_12DBD
add     sp, 8
push    0EF4h
lea     ax, [bp+var_16]
push    ax
call    sub_1352D
pop     bx
pop     bx
or      ax, ax
jz      short loc_16B35
push    4
lea     ax, [bp+var_4]
push    ax
push    10h
push    32h ; '2'
call    sub_12DBD
add     sp, 8
mov     ax, [bp+var_4]
sub     ax, [bp+var_2]
add     ah, 4
sub     dx, dx
add     ax, 1
adc     dx, dx
mov     cl, 6
call    sub_14364
mov     ds:98h, ax
mov     ds:9Ah, dx
mov     ax, 1
leave
retn

loc_16B35:
sub     ax, ax
leave
retn
sub_16AE0 endp



; Attributes: bp-based frame

sub_16B39 proc near

var_1A= dword ptr -1Ah
var_16= word ptr -16h
var_E= byte ptr -0Eh
var_D= byte ptr -0Dh
var_C= word ptr -0Ch
arg_0= word ptr  4

enter   1Ah, 0
push    si
mov     si, 22h ; '"'
cmp     byte ptr ds:0CECh, 2
jnz     short loc_16B4B
mov     si, 17h

loc_16B4B:
cmp     byte ptr ds:0CECh, 3
jnz     short loc_16B5C
cmp     byte ptr ds:0CEDh, 0
jnz     short loc_16B5C
mov     si, 28h ; '('

loc_16B5C:
mov     [bp+var_D], 52h ; 'R'
lea     ax, [bp+var_16]
push    ax
lea     cx, [bp+var_E]
push    cx
push    cx
call    sub_142D8
add     sp, 6
mov     ax, [bp+var_C]
add     ax, si
mov     word ptr [bp+var_1A], ax
mov     ax, [bp+var_16]
mov     word ptr [bp+var_1A+2], ax
mov     si, 28h ; '('
jmp     short loc_16B92

loc_16B82:
dec     si
jz      short loc_16BA5
push    word ptr [bp+var_1A]
push    dx
call    [bp+arg_0]
pop     bx
pop     bx
or      ax, ax
jnz     short loc_16BA5

loc_16B92:
les     bx, [bp+var_1A]
mov     ax, es:[bx]
mov     dx, es:[bx+2]
mov     word ptr [bp+var_1A], ax
mov     word ptr [bp+var_1A+2], dx
inc     ax
jnz     short loc_16B82

loc_16BA5:
pop     si
leave
retn
sub_16B39 endp




sub_16BA8 proc near
call    sub_18824
push    4DDEh
call    sub_16B39
pop     bx
retn
sub_16BA8 endp



; Attributes: bp-based frame

sub_16BB3 proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

enter   4, 0
push    4
lea     ax, [bp+arg_0]
push    ax
call    sub_17D60
cmp     dx, 10h
jg      short loc_16BC7
jl      short loc_16C00

loc_16BC7:
push    4
push    0F08h
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_12DF2
add     sp, 8
push    4
lea     ax, [bp+var_4]
push    ax
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_12DBD
add     sp, 8
mov     ax, ds:0F08h
mov     dx, ds:0F0Ah
cmp     [bp+var_4], ax
jnz     short loc_16C00
cmp     [bp+var_2], dx
jnz     short loc_16C00
mov     ax, 1
leave
retn

loc_16C00:
sub     ax, ax
leave
retn
sub_16BB3 endp



; Attributes: bp-based frame

sub_16C04 proc near

var_1C= word ptr -1Ch
var_1A= word ptr -1Ah
var_12= word ptr -12h
var_10= word ptr -10h
var_E= word ptr -0Eh

enter   1Ch, 0
sub     ax, ax
mov     ds:0A6h, ax
mov     ds:0A4h, ax
mov     ds:9Eh, ax
mov     ds:9Ch, ax
mov     ds:9Ah, ax
mov     ds:98h, ax
mov     word ptr ds:0A0h, 98h
mov     word ptr ds:0A2h, ds
cmp     byte ptr ds:2Eh, 0Bh
jnz     short loc_16C62
push    word ptr ds:0ECAh
call    sub_182FC
pop     bx
mov     ds:98h, ax
mov     ds:9Ah, dx
mov     ax, ds:0ECCh
add     ax, ds:0ECAh
mov     [bp+var_1C], ax
cmp     ax, ds:0ECAh
jnb     short loc_16C51
mov     [bp+var_1C], 0FF00h

loc_16C51:
push    [bp+var_1C]
call    sub_182FC
pop     bx
mov     ds:9Ch, ax
mov     ds:9Eh, dx
jmp     loc_16D4C

loc_16C62:
test    byte ptr ds:47h, 1
jnz     short loc_16CAD
push    word ptr ds:0ECAh
call    sub_182FC
pop     bx
mov     ds:98h, ax
mov     ds:9Ah, dx
push    word ptr ds:0ECEh
call    sub_182FC
pop     bx
mov     ds:9Ch, ax
mov     ds:9Eh, dx
call    sub_18834
or      ax, ax
jnz     short loc_16C91
jmp     loc_16D4C

loc_16C91:
mov     ax, ds:0ECCh
mov     ds:0A8h, ax
push    ax
call    sub_182FC
pop     bx
add     ax, ds:98h
adc     dx, ds:9Ah

loc_16CA4:
mov     ds:9Ch, ax
mov     ds:9Eh, dx
leave
retn

loc_16CAD:
mov     byte ptr [bp+var_E+1], 88h
lea     ax, [bp+var_E]
push    ax
push    ax
push    15h
call    sub_17C3A
add     sp, 6
mov     ax, [bp+var_E]
mov     ds:0A8h, ax
call    sub_18834
or      ax, ax
jnz     short loc_16C91
cmp     word ptr ds:0A8h, 0FC00h
jb      short loc_16CD7
dec     word ptr ds:0A8h

loc_16CD7:
push    word ptr ds:0A8h
call    sub_182FC
pop     bx
add     ax, 0
adc     dx, 1
mov     [bp+var_12], ax
mov     [bp+var_10], dx
call    sub_16BA8
cmp     [bp+var_E], 0
jz      short loc_16D4C
mov     word ptr ds:0AA4h, 1B20h
mov     word ptr ds:0AA6h, 1B94h
mov     word ptr ds:98h, 0
mov     word ptr ds:9Ah, 1
mov     ax, [bp+var_12]
mov     dx, [bp+var_10]
mov     ds:9Ch, ax
mov     ds:9Eh, dx
call    sub_16AE0
or      ax, ax
jnz     short loc_16D4C
mov     [bp+var_E], 3519h
lea     ax, [bp+var_1A]
push    ax
lea     cx, [bp+var_E]
push    cx
push    cx
call    sub_142D8
add     sp, 6
push    0
push    [bp+var_1A]
call    sub_169EC
pop     bx
pop     bx
or      ax, ax
jnz     short loc_16D49
push    4E1Ch
call    sub_16B39
pop     bx

loc_16D49:
call    sub_16A6A

loc_16D4C:
cmp     word ptr ds:0ECCh, 0
jnz     short loc_16D5D
sub     ax, ax
mov     ds:9Eh, ax
mov     ds:9Ch, ax
leave
retn

loc_16D5D:
mov     ax, ds:9Ch
mov     dx, ds:9Eh
mov     cl, 6
call    sub_17D98
cmp     ax, ds:0ECEh
jbe     short loc_16D7E
push    word ptr ds:0ECEh
call    sub_182FC
pop     bx
mov     ds:9Ch, ax
mov     ds:9Eh, dx

loc_16D7E:
push    word ptr ds:0ECCh
call    sub_182FC
pop     bx
add     ax, ds:98h
adc     dx, ds:9Ah
mov     [bp+var_12], ax
mov     [bp+var_10], dx
mov     ax, ds:98h
mov     dx, ds:9Ah
mov     cl, 6
call    sub_17D98
cmp     ax, ds:0ECAh
jnb     short loc_16DE7
push    word ptr ds:0ECAh
call    sub_182FC
pop     bx
mov     ds:98h, ax
mov     ds:9Ah, dx
push    word ptr ds:0ECCh
call    sub_182FC
pop     bx
add     ax, ds:98h
adc     dx, ds:9Ah
mov     [bp+var_12], ax
mov     [bp+var_10], dx
mov     ax, ds:9Ch
mov     dx, ds:9Eh
cmp     [bp+var_10], dx
ja      short locret_16E16
jb      short loc_16DDE
cmp     [bp+var_12], ax
jnb     short locret_16E16

loc_16DDE:
mov     ax, [bp+var_12]
mov     dx, [bp+var_10]
jmp     loc_16CA4

loc_16DE7:
mov     ax, ds:9Ch
mov     dx, ds:9Eh
cmp     [bp+var_10], dx
ja      short locret_16E16
jb      short loc_16DFA
cmp     [bp+var_12], ax
jnb     short locret_16E16

loc_16DFA:
push    word ptr ds:0ECCh
call    sub_182FC
pop     bx
mov     cx, ds:9Ch
mov     bx, ds:9Eh
sub     cx, ax
sbb     bx, dx
mov     ds:98h, cx
mov     ds:9Ah, bx

locret_16E16:
leave
retn
sub_16C04 endp



; Attributes: bp-based frame

sub_16E18 proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

enter   4, 0
test    byte ptr ds:47h, 2
jz      short loc_16E9B
mov     [bp+var_4], 0A000h
mov     [bp+var_2], 0Fh

loc_16E2D:
cmp     [bp+var_2], 0Fh
jg      short loc_16E84
jl      short loc_16E3B
cmp     [bp+var_4], 0FFFFh
jnb     short loc_16E84

loc_16E3B:
push    [bp+var_2]
push    [bp+var_4]
call    sub_16BB3
pop     bx
pop     bx
or      ax, ax
jz      short loc_16E84
mov     ax, [bp+var_4]
mov     dx, [bp+var_2]
add     ax, 3FFh
adc     dx, 0
push    dx
push    ax
call    sub_16BB3
pop     bx
pop     bx
or      ax, ax
jz      short loc_16E84
push    4000h
push    0
mov     ax, [bp+var_4]
mov     dx, [bp+var_2]
mov     cl, 4
call    sub_14364
push    dx
push    ax
call    sub_12DF2
add     sp, 8
add     [bp+var_4], 400h
adc     [bp+var_2], 0
jmp     short loc_16E2D

loc_16E84:
mov     ax, [bp+var_4]
add     ah, 60h ; '`'
mov     bx, [bp+arg_0]
mov     [bx], ax
or      ax, ax
jz      short loc_16E9B
mov     ax, 0A000h
mov     dx, 0Fh
leave
retn

loc_16E9B:
and     byte ptr ds:47h, 0FDh
sub     ax, ax
cwd
leave
retn
sub_16E18 endp



; Attributes: bp-based frame

sub_16EA5 proc near

var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_4= dword ptr -4
arg_0= word ptr  4

enter   0Ah, 0
push    di
push    si
mov     word ptr [bp+var_4], 0FFE0h
mov     word ptr [bp+var_4+2], 0F000h
mov     ax, ds:9Ch
mov     dx, ds:9Eh
mov     [bp+var_8], ax
mov     [bp+var_6], dx
cmp     dx, 1
jg      short loc_16ED3
jge     short loc_16ED3
mov     [bp+var_8], 0
mov     [bp+var_6], 1

loc_16ED3:
mov     ax, ds:0F0Ch
mov     dx, ds:0F0Eh
les     bx, [bp+var_4]
cmp     es:[bx+0Ah], ax
jnz     short loc_16F13
cmp     es:[bx+0Ch], dx
jnz     short loc_16F13
mov     ax, ds:0F11h
cmp     es:[bx+0Eh], ax
jnz     short loc_16F13
cmp     word ptr ds:0ECEh, 3E00h
jb      short loc_16F13
mov     ax, [bp+var_8]
mov     dx, [bp+var_6]
sub     ax, ds:98h
sbb     dx, ds:9Ah
mov     cl, 6
call    sub_17D98
cmp     ax, ds:0ECCh
jb      short loc_16F18

loc_16F13:
sub     ax, ax
cwd
jmp     short loc_16F92

loc_16F18:
les     bx, [bp+var_4]
mov     ax, es:[bx]
mov     word ptr [bp+var_4], ax
mov     ds:11ECh, ax
mov     bx, ax
cmp     word ptr es:[bx], 0FFFFh
jz      short loc_16F13
mov     ax, es:[bx+4]
cmp     es:[bx+2], ax
jb      short loc_16F13
cmp     ax, es:[bx+6]
jnb     short loc_16F13
mov     [bp+var_A], ax
mov     bx, [bp+arg_0]
mov     [bx], ax
cmp     ax, 1000h
jb      short loc_16F13
mov     bx, word ptr [bp+var_4]
mov     ax, es:[bx+6]
mov     dx, 0Fh
mov     cx, ax
mov     bx, dx
sub     ax, 1
sbb     dx, 0
push    dx
push    ax
mov     si, cx
mov     di, bx
call    sub_16BB3
pop     bx
pop     bx
or      ax, ax
jz      short loc_16F13
sub     si, [bp+var_A]
sbb     di, 0
push    di
push    si
call    sub_16BB3
pop     bx
pop     bx
or      ax, ax
jz      short loc_16F13
push    [bp+var_A]
call    sub_138D6
pop     bx
or      ax, ax
jz      short loc_16F13
les     bx, [bp+var_4]
mov     ax, es:[bx+6]
mov     dx, 0Fh

loc_16F92:
pop     si
pop     di
leave
retn
sub_16EA5 endp



; Attributes: bp-based frame

sub_16F96 proc near

var_28= word ptr -28h
var_26= word ptr -26h
var_24= word ptr -24h
var_22= word ptr -22h
var_1A= word ptr -1Ah
var_18= word ptr -18h
var_16= word ptr -16h
var_14= word ptr -14h
var_12= word ptr -12h
var_10= word ptr -10h
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2

enter   28h, 0
push    di
push    si
mov     ax, ds:98h
mov     dx, ds:9Ah
cmp     ds:9Eh, dx
jnb     short loc_16FAC
jmp     loc_17032

loc_16FAC:
ja      short loc_16FB4
cmp     ds:9Ch, ax
jbe     short loc_16FBB

loc_16FB4:
cmp     byte ptr ds:2Eh, 0Bh
jnz     short loc_16FBD

loc_16FBB:
jmp     short loc_17032

loc_16FBD:
mov     [bp+var_4], ax
mov     [bp+var_2], dx
push    dx
push    ax
call    sub_16BB3
pop     bx
pop     bx
or      ax, ax
jz      short loc_17025

loc_16FCE:
mov     ax, [bp+var_4]
mov     dx, [bp+var_2]
add     ax, 3FFh
adc     dx, 0
mov     [bp+var_1A], ax
mov     [bp+var_18], dx
cmp     dx, ds:9Eh
ja      short loc_1700D
jb      short loc_16FEE
cmp     ax, ds:9Ch
jnb     short loc_1700D

loc_16FEE:
push    dx
push    ax
call    sub_16BB3
pop     bx
pop     bx
or      ax, ax
jz      short loc_17025
mov     ax, [bp+var_1A]
mov     dx, [bp+var_18]
add     ax, 1
adc     dx, 0
mov     [bp+var_4], ax
mov     [bp+var_2], dx
jmp     short loc_16FCE

loc_1700D:
mov     ax, ds:9Ch
mov     dx, ds:9Eh
sub     ax, 1
sbb     dx, 0
push    dx
push    ax
call    sub_16BB3
pop     bx
pop     bx
or      ax, ax
jnz     short loc_17032

loc_17025:
mov     ax, [bp+var_4]
mov     dx, [bp+var_2]
mov     ds:9Ch, ax
mov     ds:9Eh, dx

loc_17032:
sub     ax, ax
mov     ds:0A6h, ax
mov     ds:0A4h, ax
mov     [bp+var_10], ax
mov     [bp+var_12], ax
mov     [bp+var_18], ax
mov     [bp+var_1A], ax
cmp     byte ptr ds:2Eh, 3
jnz     short loc_1705F
lea     ax, [bp+var_6]
push    ax
call    sub_16EA5
pop     bx
mov     [bp+var_1A], ax
mov     [bp+var_18], dx
or      dx, ax
jnz     short loc_17071

loc_1705F:
lea     ax, [bp+var_6]
push    ax
call    sub_16E18
pop     bx
mov     [bp+var_1A], ax
mov     [bp+var_18], dx
or      dx, ax
jz      short loc_170A8

loc_17071:
mov     ax, ds:98h
mov     dx, ds:9Ah
cmp     ds:9Eh, dx
ja      short loc_170A8
jb      short loc_17086
cmp     ds:9Ch, ax
ja      short loc_170A8

loc_17086:
mov     ax, [bp+var_1A]
mov     dx, [bp+var_18]
mov     ds:98h, ax
mov     ds:9Ah, dx
add     ax, [bp+var_6]
adc     dx, 0
mov     ds:9Ch, ax
mov     ds:9Eh, dx
sub     ax, ax
mov     [bp+var_18], ax
mov     [bp+var_1A], ax

loc_170A8:
mov     ax, ds:98h
mov     dx, ds:9Ah
cmp     ds:9Eh, dx
jnb     short loc_170B8
jmp     loc_171C4

loc_170B8:
ja      short loc_170C3
cmp     ds:9Ch, ax
ja      short loc_170C3
jmp     loc_171C4

loc_170C3:
add     ax, 1
adc     dx, 0
mov     [bp+var_16], ax
mov     [bp+var_14], dx
mov     [bp+var_4], ax
mov     [bp+var_2], dx
mov     word ptr ds:11D4h, 9
cmp     byte ptr ds:2Eh, 0Bh
jnz     short loc_1711C
push    dx
push    ax
call    sub_19627
pop     bx
pop     bx
or      ax, ax
jnz     short loc_170F3
push    1Bh
call    sub_13E6D
pop     bx

loc_170F3:
test    byte ptr ds:0A16h, 2
jz      short loc_1711C
mov     ax, ds:9Ch
mov     dx, ds:9Eh
sub     ax, 1
sbb     dx, 0
push    dx
push    ax
call    sub_19627
pop     bx
pop     bx
mov     ax, ds:0ACh
mov     dx, ds:0AEh
mov     ds:9Ch, ax
mov     ds:9Eh, dx

loc_1711C:
push    10h
lea     ax, [bp+var_16]
push    ax
mov     ax, ds:98h
mov     dx, ds:9Ah
mov     cl, 4
call    sub_14364
push    dx
push    ax
call    sub_12DF2
add     sp, 8
mov     ax, ds:9Ch
mov     dx, ds:9Eh
sub     ax, [bp+var_16]
sbb     dx, [bp+var_14]
mov     [bp+var_12], ax
mov     [bp+var_10], dx
mov     ds:0A4h, ax
mov     ds:0A6h, dx
mov     ax, [bp+var_1A]
mov     dx, [bp+var_18]
mov     [bp+var_16], ax
mov     [bp+var_14], dx
push    10h
lea     cx, [bp+var_16]
push    cx
mov     ax, [bp+var_4]
mov     dx, [bp+var_2]
mov     cl, 4
call    sub_14364
push    dx
push    ax
call    sub_12DF2
add     sp, 8
mov     ax, [bp+var_18]
or      ax, [bp+var_1A]
jz      short loc_171C4
sub     ax, ax
mov     [bp+var_14], ax
mov     [bp+var_16], ax
mov     ax, [bp+var_6]
sub     dx, dx
mov     [bp+var_12], ax
mov     [bp+var_10], dx
add     ds:0A4h, ax
adc     ds:0A6h, dx
push    10h
lea     ax, [bp+var_16]
push    ax
mov     ax, [bp+var_1A]
mov     dx, [bp+var_18]
mov     cl, 4
call    sub_14364
push    dx
push    ax
call    sub_12DF2
add     sp, 8
mov     ax, [bp+var_1A]
mov     dx, [bp+var_18]
add     ax, [bp+var_12]
adc     dx, [bp+var_10]
mov     ds:9Ch, ax
mov     ds:9Eh, dx

loc_171C4:
test    byte ptr ds:47h, 80h
jz      short loc_17218
mov     byte ptr ds:0A16h, 1
mov     [bp+var_28], 0BFDEh
mov     [bp+var_26], 4
mov     [bp+var_24], 1
cmp     word ptr ds:0ADCh, 0
jnz     short loc_171ED
cmp     byte ptr ds:2Eh, 0Bh
jnz     short loc_171F2

loc_171ED:
mov     [bp+var_24], 0

loc_171F2:
lea     ax, [bp+var_28]
push    ax
push    ax
push    15h
call    sub_17C3A
add     sp, 6
mov     ax, [bp+var_22]
mov     dx, [bp+var_24]
mov     ds:0A0h, ax
mov     ds:0A2h, dx
mov     di, ax
mov     si, 98h
mov     es, dx
mov     cx, 0Ch
rep movsw

loc_17218:
cmp     byte ptr ds:2Eh, 0Bh
jz      short loc_17232
mov     ax, ds:0A4h
mov     dx, ds:0A6h
mov     cl, 4
call    sub_14364
mov     ds:0AA8h, ax
mov     ds:0AAAh, dx

loc_17232:
pop     si
pop     di
leave
retn
sub_16F96 endp




sub_17236 proc near
call    sub_16C04
jmp     sub_16F96
sub_17236 endp



; Attributes: noreturn bp-based frame

sub_1723C proc near

var_A= word ptr -0Ah
var_4= word ptr -4
var_2= word ptr -2

enter   0Ah, 0
push    di
push    si
push    word ptr ds:120Eh
call    sub_182FC
pop     bx
les     bx, ds:0A0h
mov     cx, es:[bx+0Ch]
mov     si, es:[bx+0Eh]
add     cx, 1
adc     si, 0
cmp     si, dx
jg      short loc_1726C
jl      short loc_17266
cmp     cx, ax
jnb     short loc_1726C

loc_17266:
push    28h ; '('
call    sub_13E6D
pop     bx

loc_1726C:
call    sub_1356A
call    sub_11D3C
push    word ptr ds:97Ch
call    sub_12DAD
pop     bx
mov     [bp+var_2], ax
shl     ax, 1
push    ax
call    sub_12DAD
pop     bx
mov     [bp+var_A], ax
mov     ax, [bp+var_2]
add     ax, [bp+var_A]
push    ax
cmp     byte ptr ds:981h, 0
jz      short loc_1729A
mov     ax, 3941h
jmp     short loc_1729D

loc_1729A:
mov     ax, 3894h

loc_1729D:
call    ax ; sub_15511
pop     bx
mov     cl, 4
call    sub_14364
mov     ds:98Eh, ax
mov     ds:990h, dx
mov     word ptr ds:11D4h, 0Bh
mov     ax, dx
or      ax, ds:98Eh
jnz     short loc_172C0
push    0Ah
call    sub_13E6D
pop     bx

loc_172C0:
mov     word ptr ds:11D4h, 0Ah
shl     [bp+var_A], 4
mov     ax, [bp+var_A]
dec     ax
mov     ds:910h, ax
mov     ax, [bp+var_2]
sub     dx, dx
mov     cl, 4
call    sub_14364
add     ax, ds:98Eh
adc     dx, ds:990h
mov     bx, dx
mov     ds:912h, ax
mov     ds:914h, bl
mov     ax, dx
mov     al, ah
cbw
mov     ah, al
sub     al, al
mov     ds:916h, ax
mov     ax, ds:97Ch
mov     ds:938h, ax
mov     ds:928h, ax
mov     cx, ds:98Eh
mov     ds:93Ah, cx
mov     ds:92Ah, cx
mov     cl, ds:990h
mov     ds:93Ch, cl
mov     ds:92Ch, cl
mov     al, ds:991h
cbw
mov     ah, al
sub     al, al
mov     ds:93Eh, ax
mov     ds:92Eh, ax
mov     al, 92h
mov     ds:915h, al
mov     ds:93Dh, al
push    word ptr ds:97Ch
push    0
push    78h ; 'x'
call    sub_182B1
add     sp, 6
mov     ax, ds:8C8h
inc     ax
push    ax
push    8C0h
push    word ptr ds:990h
push    word ptr ds:98Eh
call    sub_12DF2
add     sp, 8
push    0FFh
push    word ptr ds:0CEAh
push    5
call    sub_138C0
add     sp, 6
push    7FFFh
push    word ptr ds:9B8h
push    6
call    sub_138C0
add     sp, 6
push    8
push    938h
mov     ax, ds:98Eh
mov     dx, ds:990h
add     ax, 8
adc     dx, 0
push    dx
push    ax
call    sub_12DF2
add     sp, 8
mov     ax, 8C8h
mov     di, ax
mov     si, 938h
push    ds
pop     es
movsw
movsw
movsw
movsw
mov     ax, ds:98Eh
mov     dx, ds:990h
mov     ds:976h, ax
mov     ds:978h, dx
mov     ax, ds:97Ch
mov     ds:974h, ax
push    [bp+var_A]
push    0
push    50h ; 'P'
call    sub_182B1
add     sp, 6
call    sub_14B83
mov     ax, 1Ch
mov     [bp+var_4], ax
push    ax
call    sub_15781
pop     bx
mov     ds:0F54h, ax
or      ax, ax
jnz     short loc_173D5
push    0Bh
call    sub_13E6D
pop     bx

loc_173D5:
mov     ax, ds:0F54h
add     ax, 8
shl     ax, 3
mov     ds:0A9Ch, ax
add     ax, 8
mov     ds:0C14h, ax
jmp     short loc_173FC

loc_173E9:
push    0FFFFh
push    0E000h
mov     ax, [bp+var_4]
add     ax, ds:0F54h
push    ax
call    sub_138C0
add     sp, 6

loc_173FC:
dec     [bp+var_4]
jns     short loc_173E9
shl     word ptr ds:0F54h, 3
cmp     byte ptr ds:2Fh, 3
jl      short loc_1743E
mov     ax, 3
mov     [bp+var_4], ax
push    ax
call    sub_15781
pop     bx
mov     ds:0A87h, ax
or      ax, ax
jz      short loc_1743E
jmp     short loc_17434

loc_17421:
push    0FFFFh
push    0D000h
mov     ax, [bp+var_4]
add     ax, ds:0A87h
push    ax
call    sub_138C0
add     sp, 6

loc_17434:
dec     [bp+var_4]
jns     short loc_17421
shl     word ptr ds:0A87h, 3

loc_1743E:
call    sub_1921B
test    byte ptr ds:47h, 80h
jz      short loc_1745E
mov     ax, ds:98h
mov     dx, ds:9Ah
cmp     ds:0ACh, ax
jnz     short loc_1745E
cmp     ds:0AEh, dx
jnz     short loc_1745E
call    sub_16F96

loc_1745E:
cmp     byte ptr ds:2Eh, 0Bh
jnz     short loc_17498
push    3
call    sub_15781
pop     bx
mov     [bp+var_4], ax
or      ax, ax
jnz     short loc_17478
push    0Ch
call    sub_13E6D
pop     bx

loc_17478:
push    18h
push    940h
mov     ax, [bp+var_4]
shl     ax, 3
mov     ds:0D70h, ax
sub     dx, dx
add     ax, ds:98Eh
adc     dx, ds:990h
push    dx
push    ax
call    sub_12DF2
add     sp, 8

loc_17498:
pop     si
pop     di
leave
retn
sub_1723C endp



; Attributes: bp-based frame

sub_1749C proc near

var_14= word ptr -14h
var_12= word ptr -12h
var_10= word ptr -10h
var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= word ptr -8

enter   14h, 0
cmp     word ptr ds:0A12h, 1
jl      short loc_174AA
jmp     locret_17546

loc_174AA:
sub     ax, ax
mov     [bp+var_10], ax
mov     [bp+var_12], ax
test    byte ptr ds:47h, 80h
jz      short loc_174E0
mov     ax, ds:0DF4h
mov     ds:0AAh, ax
mov     [bp+var_E], 0BFDEh
mov     [bp+var_C], 2
sub     ax, ax
mov     [bp+var_A], ax
mov     [bp+var_8], ax
lea     ax, [bp+var_E]
push    ax
push    ax
push    15h
call    sub_17C3A
add     sp, 6
leave
retn

loc_174E0:
mov     ax, [bp+var_10]
or      ax, [bp+var_12]
jnz     short loc_1752E
call    sub_13AE9
mov     [bp+var_14], ax
call    sub_1355A
mov     ax, [bp+var_14]
shr     ax, 4
push    0
push    ax
call    loc_13A2D
pop     bx
pop     bx
mov     [bp+var_12], ax
mov     [bp+var_10], dx
or      dx, ax
jz      short loc_1752B
push    92h
push    0FFFFh
push    [bp+var_10]
push    ax
push    60h ; '`'
call    sub_13A41
add     sp, 0Ah
push    [bp+var_14]
push    0
push    60h ; '`'
push    0
push    70h ; 'p'
call    sub_17CB8
add     sp, 0Ah

loc_1752B:
call    sub_12D91

loc_1752E:
mov     ax, [bp+var_10]
or      ax, [bp+var_12]
jz      short locret_17546
mov     ax, [bp+var_12]
mov     dx, [bp+var_10]
mov     ds:0A10h, ax
mov     ds:0A12h, dx
call    sub_13AF3

locret_17546:
leave
retn
sub_1749C endp



; Attributes: bp-based frame

sub_17548 proc near

var_10A= word ptr -10Ah
var_108= word ptr -108h
var_106= word ptr -106h
var_104= byte ptr -104h
var_103= byte ptr -103h
var_102= word ptr -102h
var_100= byte ptr -100h

push    bp
mov     bp, sp
sub     sp, 10Ah
mov     ax, ds:0E70h
mov     [bp+var_108], ax
cmp     byte ptr ds:0F21h, 0
jg      short loc_17564
cmp     byte ptr ds:0CECh, 3
jge     short loc_17567

loc_17564:
jmp     loc_17688

loc_17567:
call    sub_1849C
mov     [bp+var_106], ax
call    sub_14951
mov     ds:0E70h, ax
or      ax, ax
jge     short loc_17593
lea     ax, [bp+var_100]
push    ax
mov     cx, 0F14h
push    cx
call    sub_1621B
pop     bx
pop     bx
or      ax, ax
jz      short loc_17593
lea     ax, [bp+var_100]
push    ax
call    sub_17B6E
pop     bx

loc_17593:
cmp     word ptr ds:0E70h, 0
jge     short loc_175FE
mov     ax, [bp+var_108]
mov     ds:0E70h, ax
call    sub_17BAD
mov     [bp+var_108], 0FFFFh
mov     ax, 1190h
push    ax
call    sub_17B6E
pop     bx
mov     ax, 1Ch
push    ax
lea     ax, [bp+var_104]
push    ax
call    sub_17B98
pop     bx
pop     bx
lea     ax, [bp+var_104]
push    ax
call    sub_176BF
pop     bx
push    dx
push    ax
call    sub_17B80
pop     bx
pop     bx
mov     [bp+var_104], 0
mov     ax, 6
push    ax
lea     ax, [bp+var_104]
push    ax
call    sub_17B98
pop     bx
pop     bx
cmp     [bp+var_104], 4Dh ; 'M'
jnz     short loc_175F1
cmp     [bp+var_103], 46h ; 'F'
jz      short loc_175FE

loc_175F1:
mov     ax, ds:0E70h
mov     [bp+var_108], ax
mov     word ptr ds:0E70h, 0FFFFh

loc_175FE:
cmp     word ptr ds:0E70h, 0
jge     short loc_17631
mov     ax, 1190h
push    ax
lea     cx, [bp+var_100]
push    cx
call    sub_141AE
pop     bx
pop     bx
mov     ax, 0F1Ch
push    ax
call    sub_13474
pop     bx
mov     ax, 1190h
push    ax
call    sub_17B6E
pop     bx
lea     ax, [bp+var_100]
push    ax
mov     ax, 1190h
push    ax
call    sub_141AE
pop     bx
pop     bx

loc_17631:
cmp     word ptr ds:0E70h, 0
jl      short loc_17677
lea     ax, [bp+var_104]
mov     ds:1188h, ax
sub     ax, ax
mov     [bp+var_102], ax
mov     [bp+var_10A], ax
mov     ax, 1
push    ax
lea     ax, [bp+var_10A]
push    ax
call    sub_17B98
pop     bx
pop     bx
cmp     [bp+var_10A], 4Dh ; 'M'
jnz     short loc_17663
call    sub_17988
jmp     short loc_17672

loc_17663:
push    [bp+var_106]
call    sub_17791
pop     bx
or      ax, ax
jz      short loc_17677
call    sub_17841

loc_17672:
mov     byte ptr ds:0F21h, 1

loc_17677:
cmp     [bp+var_108], 0
jl      short loc_17688
call    sub_17BAD
mov     ax, [bp+var_108]
mov     ds:0E70h, ax

loc_17688:
mov     sp, bp
pop     bp
retn
sub_17548 endp




sub_1768C proc near
push    si
mov     si, ds:1188h
inc     word ptr [si]
mov     ax, [si]
cmp     [si+2], ax
ja      short loc_176B7
mov     ax, 100h
push    ax
lea     ax, [si+4]
push    ax
call    sub_17B98
pop     bx
pop     bx
mov     [si+2], ax
or      ax, ax
jg      short loc_176B3
mov     ax, 0FFFFh
pop     si
retn

loc_176B3:
mov     word ptr [si], 0

loc_176B7:
mov     bx, [si]
mov     al, [bx+si+4]
cbw
pop     si
retn
sub_1768C endp



; Attributes: bp-based frame

sub_176BF proc near

var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 6
mov     bx, [bp+arg_0]
mov     ax, [bx+4]
sub     dx, dx
mov     cl, 9
call    sub_14364
mov     [bp+var_4], ax
mov     [bp+var_2], dx
mov     [bp+var_6], 0
mov     bx, [bp+arg_0]
cmp     word ptr [bx+2], 0
jz      short loc_176FD
cmp     byte ptr [bx], 4Dh ; 'M'
jnz     short loc_176F0
mov     [bp+var_6], 200h

loc_176F0:
mov     ax, [bx+2]
sub     ax, [bp+var_6]
cwd
add     [bp+var_4], ax
adc     [bp+var_2], dx

loc_176FD:
mov     ax, [bp+var_4]
mov     dx, [bp+var_2]
mov     sp, bp
pop     bp
retn
sub_176BF endp



; Attributes: bp-based frame

sub_17707 proc near

var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 2
push    si
mov     [bp+var_2], 0

loc_17713:
call    sub_1768C
mov     si, ax
cmp     si, 0Ah
jnz     short loc_17722
mov     ax, 0FFFEh
jmp     short loc_1775C

loc_17722:
cmp     si, 2Ah ; '*'
jnz     short loc_1772C
mov     ax, 0FFFDh
jmp     short loc_1775C

loc_1772C:
cmp     si, 40h ; '@'
jnz     short loc_17736
mov     ax, 0FFFCh
jmp     short loc_1775C

loc_17736:
lea     ax, [si-30h]
cmp     ax, 9
ja      short loc_17713

loc_1773E:
mov     ax, 0Ah
imul    [bp+var_2]
add     ax, si
sub     ax, 30h ; '0'
mov     [bp+var_2], ax
call    sub_1768C
mov     si, ax
lea     ax, [si-30h]
cmp     ax, 9
jbe     short loc_1773E
mov     ax, [bp+var_2]

loc_1775C:
pop     si
mov     sp, bp
pop     bp
retn
sub_17707 endp



; Attributes: bp-based frame

sub_17761 proc near

var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 2
jmp     short loc_17782

loc_17769:
mov     [bp+var_2], bx
inc     [bp+arg_0]
call    sub_1768C
mov     bx, [bp+var_2]
mov     cx, ax
mov     al, [bx]
cbw
cmp     cx, ax
jz      short loc_17782
sub     ax, ax
jmp     short loc_1778D

loc_17782:
mov     bx, [bp+arg_0]
cmp     byte ptr [bx], 0
jnz     short loc_17769
mov     ax, 1

loc_1778D:
mov     sp, bp
pop     bp
retn
sub_17761 endp



; Attributes: bp-based frame

sub_17791 proc near

var_42= byte ptr -42h
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 42h
push    di
push    si

loc_17799:
call    sub_1768C
inc     ax
jz      short loc_177E0
sub     ax, 3Ch ; '<'
jnz     short loc_177A7
jmp     loc_17828

loc_177A7:
sub     ax, 0Ah
jz      short loc_177B3
sub     ax, 0Dh

loc_177AF:
jz      short loc_177BB
jmp     short loc_17799

loc_177B3:
call    sub_1768C
cmp     ax, 52h ; 'R'
jmp     short loc_177AF

loc_177BB:
mov     ax, 0F24h
push    ax
call    sub_17761
pop     bx
or      ax, ax
jz      short loc_17799

loc_177C7:
call    sub_17707
mov     si, ax
cmp     si, [bp+arg_0]
jz      short loc_177D6
cmp     si, 0FFFDh
jnz     short loc_177DB

loc_177D6:
mov     ax, 1
jmp     short loc_1783B

loc_177DB:
cmp     si, 0FFFFh
jnz     short loc_177E4

loc_177E0:
sub     ax, ax
jmp     short loc_1783B

loc_177E4:
cmp     si, 3Bh ; ';'
jz      short loc_17828
cmp     si, 0FFFCh
jnz     short loc_17820
lea     di, [bp+var_42]
jmp     short loc_177F4

loc_177F3:
inc     di

loc_177F4:
call    sub_1768C
mov     [di], al
cmp     al, 20h ; ' '
jg      short loc_177F3
call    sub_17BAD
mov     bx, ds:1188h
mov     word ptr [bx+2], 0
mov     byte ptr [di], 0
lea     ax, [bp+var_42]
push    ax
call    sub_17B6E
pop     bx
cmp     word ptr ds:0E70h, 0
jl      short loc_1781E
jmp     loc_17799

loc_1781E:
jmp     short loc_177E0

loc_17820:
cmp     si, 0FFFEh
jnz     short loc_177C7
jmp     loc_17799

loc_17828:
call    sub_1768C
mov     si, ax
cmp     si, 0Ah
jnz     short loc_17835
jmp     loc_17799

loc_17835:
or      si, si
jge     short loc_17828
jmp     short loc_177E0

loc_1783B:
pop     si
pop     di
mov     sp, bp
pop     bp
retn
sub_17791 endp



; Attributes: bp-based frame

sub_17841 proc near

var_4= word ptr -4
var_2= byte ptr -2

push    bp
mov     bp, sp
sub     sp, 6
push    si
mov     [bp+var_2], 0
mov     si, 15E8h

loc_1784F:
call    sub_1768C
mov     [bp+var_4], ax
inc     ax
jz      short loc_178CE
sub     ax, 23h ; '#'
jnz     short loc_17860
jmp     loc_178E1

loc_17860:
sub     ax, 5
jz      short loc_178E1
sub     ax, 14h
jnz     short loc_1786D
jmp     loc_17918

loc_1786D:
sub     ax, 8
jz      short loc_1789E
dec     ax
dec     ax
jz      short loc_178C2
sub     ax, 8
jnz     short loc_1784F
mov     ax, 0F29h
push    ax
call    sub_17761
pop     bx
or      ax, ax
jz      short loc_1784F
cmp     [bp+var_2], 0
jz      short loc_17891
mov     byte ptr [si], 0
inc     si

loc_17891:
call    sub_17707
mov     [si], ax
inc     si
inc     si
mov     [bp+var_2], 1
jmp     short loc_1784F

loc_1789E:
mov     ax, 0F30h
push    ax
call    sub_17761
pop     bx
or      ax, ax
jz      short loc_1784F
cmp     [bp+var_2], 0
jnz     short loc_178B1
dec     si

loc_178B1:
mov     byte ptr [si], 0Dh
inc     si
mov     byte ptr [si], 0Ah
sub     al, al
mov     [bp+var_2], al
inc     si
mov     [si], al
jmp     short loc_178F4

loc_178C2:
mov     ax, 0F38h
push    ax
call    sub_17761
pop     bx
or      ax, ax
jz      short loc_1784F

loc_178CE:
mov     word ptr [si], 0FFFFh
inc     si
inc     si
mov     ds:0F22h, si
mov     ax, si
and     al, 0FEh
mov     ds:0CDCh, ax
jmp     short loc_1792A

loc_178E1:
cmp     [bp+var_2], 0
jnz     short loc_178E8
dec     si

loc_178E8:
mov     [bp+var_2], 0

loc_178EC:
call    sub_1768C
cmp     ax, [bp+var_4]
jnz     short loc_178F8

loc_178F4:
inc     si
jmp     loc_1784F

loc_178F8:
sub     ah, ah
mov     [si], ax
mov     ax, ds:0CE4h
sub     ax, 10h
inc     si
cmp     ax, si
jnb     short loc_178EC
mov     ax, 200h
push    ax
call    sub_10B12
pop     bx
or      ax, ax
jnz     short loc_178EC
inc     si
jmp     short loc_178CE

loc_17918:
call    sub_1768C
mov     [bp+var_4], ax
cmp     ax, 0Ah
jnz     short loc_17926
jmp     loc_1784F

loc_17926:
or      ax, ax
jge     short loc_17918

loc_1792A:
pop     si
mov     sp, bp
pop     bp
retn
sub_17841 endp



; Attributes: bp-based frame

sub_1792F proc near

var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 0Eh
mov     ax, [bp+arg_2]
mov     [bp+var_C], ax

loc_1793B:
mov     byte ptr [bp+var_E+1], 48h ; 'H'
lea     ax, [bp+var_E]
push    ax
push    ax
call    sub_14290
pop     bx
pop     bx
cmp     [bp+var_2], 0
jnz     short loc_17954
mov     ax, [bp+var_E]
jmp     short loc_17964

loc_17954:
cmp     [bp+var_E], 8
jnz     short loc_17962
mov     ax, [bp+arg_0]
cmp     [bp+var_C], ax
jnb     short loc_1793B

loc_17962:
sub     ax, ax

loc_17964:
mov     sp, bp
pop     bp
retn
sub_1792F endp



; Attributes: bp-based frame

sub_17968 proc near

var_16= word ptr -16h
var_E= byte ptr -0Eh
var_D= byte ptr -0Dh
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 16h
mov     [bp+var_D], 49h ; 'I'
mov     ax, [bp+arg_0]
mov     [bp+var_16], ax
lea     ax, [bp+var_16]
push    ax
lea     ax, [bp+var_E]
push    ax
push    ax
call    sub_142D8
mov     sp, bp
pop     bp
retn
sub_17968 endp



; Attributes: bp-based frame

sub_17988 proc near

var_26= word ptr -26h
var_24= word ptr -24h
var_22= word ptr -22h
var_20= word ptr -20h
var_1E= word ptr -1Eh
var_1C= word ptr -1Ch
var_1A= word ptr -1Ah
var_18= word ptr -18h
var_16= word ptr -16h
var_14= byte ptr -14h
var_13= byte ptr -13h
var_E= word ptr -0Eh
var_6= dword ptr -6
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 26h
push    di
push    si
mov     si, ds:1188h
mov     byte ptr [si], 4Dh ; 'M'
mov     ax, 1Bh
push    ax
lea     ax, [si+1]
push    ax
call    sub_17B98
pop     bx
pop     bx
or      ax, ax
jl      short loc_179FE
mov     ax, [si+8]
mov     [bp+var_1A], ax
push    ax
push    ax
call    sub_1792F
pop     bx
pop     bx
mov     [bp+var_1C], ax
or      ax, ax
jz      short loc_179FE
mov     cl, 4
shl     [bp+var_1A], cl
mov     ax, [bp+var_1A]
sub     ax, 1Ch
mov     [bp+var_1E], ax
push    ax
mov     cx, [bp+var_1C]
sub     dx, dx
push    cx
push    dx
mov     di, ax
call    sub_17BB9
add     sp, 6
cmp     ax, di
jl      short loc_179FE
mov     cl, 5
mov     ax, [si+4]
shl     ax, cl
mov     [bp+var_1E], ax
push    word ptr [si+0Ch]
add     ax, [si+0Ah]
add     ax, 10h
push    ax
call    sub_1792F
pop     bx
pop     bx
mov     [bp+var_2], ax
or      ax, ax
jnz     short loc_17A01

loc_179FE:
jmp     loc_17B5B

loc_17A01:
mov     cl, 4
shl     [bp+var_1E], cl
cmp     word ptr [si+2], 0
jz      short loc_17A15
mov     ax, [si+2]
sub     ax, 200h
add     [bp+var_1E], ax

loc_17A15:
mov     ax, [bp+var_1A]
sub     [bp+var_1E], ax
mov     ax, [bp+var_2]
add     ax, 10h
sub     cx, cx
mov     [bp+var_18], cx
mov     [bp+var_16], ax
push    [bp+var_1E]
push    ax
push    cx
call    sub_17BB9
add     sp, 6
cmp     ax, [bp+var_1E]
jge     short loc_17A3C
jmp     loc_17B5B

loc_17A3C:
mov     [bp+var_13], 26h ; '&'
mov     ax, [bp+var_2]
mov     [bp+var_E], ax
lea     cx, [bp+var_14]
push    cx
push    cx
call    sub_14290
pop     bx
pop     bx
mov     ax, [bp+var_2]
dec     ax
mov     bx, 3
mov     es, ax
mov     ax, es:[bx]
mov     cx, [bp+var_2]
sub     bx, bx
mov     [bp+var_26], bx
mov     [bp+var_24], cx
or      bl, 2
mov     es, cx
mov     es:[bx], ax
mov     ax, [bp+var_26]
mov     dx, [bp+var_24]
or      al, 18h
mov     cx, 18h
mov     bx, ds:0CEAh
push    si
push    ds
mov     di, ax
mov     si, cx
mov     es, dx
mov     ds, bx
mov     cx, 0Ah
rep movsw
pop     ds
pop     si
mov     ax, [si+18h]
sub     ax, 1Ch
mov     cx, [bp+var_1C]
mov     word ptr [bp+var_6], ax
mov     word ptr [bp+var_6+2], cx
mov     ax, [si+6]
mov     [bp+var_1A], ax
jmp     short loc_17AC1

loc_17AA6:
mov     ax, [bp+var_16]
les     bx, [bp+var_6]
mov     cx, es:[bx+2]
mov     bx, es:[bx]
add     bx, [bp+var_18]
adc     cx, ax
mov     es, cx
add     es:[bx], ax
add     word ptr [bp+var_6], 4

loc_17AC1:
dec     [bp+var_1A]
jns     short loc_17AA6
mov     [bp+var_20], 15E8h
lea     ax, [si+68h]
mov     [bp+var_22], ax
jmp     short loc_17ADE

loc_17AD3:
mov     bx, [bp+var_20]
inc     [bp+var_20]
cmp     byte ptr [bx], 0
jnz     short loc_17AD3

loc_17ADE:
mov     bx, [bp+var_20]
mov     ax, [bx]
mov     bx, [bp+var_22]
add     [bp+var_22], 2
mov     [bx], ax
add     [bp+var_20], 2
cmp     word ptr [bx], 0FFFFh
jnz     short loc_17AD3
lea     ax, [bp+var_1A]
push    ax
lea     cx, [si+68h]
push    cx
push    si
push    [bp+var_2]
call    near ptr sub_184B7
add     sp, 8
mov     word ptr [bp+var_6], ax
mov     word ptr [bp+var_6+2], dx
push    [bp+var_1C]
call    sub_17968
pop     bx
push    [bp+var_2]
call    sub_17968
pop     bx
cmp     word ptr [bp+var_6+2], 0
jz      short loc_17B5B
push    [bp+var_1A]
call    sub_10B12
pop     bx
or      ax, ax
jz      short loc_17B54
push    [bp+var_1A]
mov     ax, 15E8h
push    ax
push    word ptr ds:9B4h
push    word ptr [bp+var_6]
push    word ptr [bp+var_6+2]
call    sub_17CB8
add     sp, 0Ah
mov     ax, [bp+var_1A]
add     ax, 15E8h
mov     ds:0F22h, ax
inc     ax
and     al, 0FEh
mov     ds:0CDCh, ax

loc_17B54:
push    word ptr [bp+var_6+2]
call    sub_17968
pop     bx

loc_17B5B:
pop     si
pop     di
mov     sp, bp
pop     bp
retn
sub_17988 endp

align 2



sub_17B62 proc near
pop     cx
push    cx
push    cx
mov     ax, sp
jmp     cx
sub_17B62 endp




sub_17B69 proc near
pop     cx
pop     ax
pop     ax
jmp     cx
sub_17B69 endp ; sp-analysis failed




sub_17B6E proc near
mov     bx, sp
mov     dx, [bx+2]
mov     ax, 3D00h
int     21h             ; DOS - 2+ - OPEN DISK FILE WITH HANDLE
                        ; DS:DX -> ASCIZ filename
                        ; AL = access mode
                        ; 0 - read
sbb     bx, bx
or      ax, bx
mov     ds:0E70h, ax
retn
sub_17B6E endp




sub_17B80 proc near
mov     bx, sp
mov     dx, [bx+2]
mov     cx, [bx+4]
mov     bx, ds:0E70h
mov     ax, 4200h
int     21h             ; DOS - 2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
                        ; AL = method: offset from beginning of file
sbb     bx, bx
or      ax, bx
or      dx, bx
retn
sub_17B80 endp




sub_17B98 proc near
mov     bx, sp
mov     dx, [bx+2]
mov     cx, [bx+4]
mov     bx, ds:0E70h
mov     ah, 3Fh
int     21h             ; DOS - 2+ - READ FROM FILE WITH HANDLE
                        ; BX = file handle, CX = number of bytes to read
                        ; DS:DX -> buffer
sbb     bx, bx
or      ax, bx
retn
sub_17B98 endp




sub_17BAD proc near
mov     bx, 0FFFFh
xchg    bx, ds:0E70h
mov     ah, 3Eh
int     21h             ; DOS - 2+ - CLOSE A FILE WITH HANDLE
                        ; BX = file handle
retn
sub_17BAD endp




sub_17BB9 proc near
mov     bx, sp
push    ds
mov     ax, ds:0E70h
mov     cx, [bx+6]
mov     dx, [bx+2]
mov     ds, word ptr [bx+4]
xchg    ax, bx
mov     ah, 3Fh
int     21h             ; DOS - 2+ - READ FROM FILE WITH HANDLE
                        ; BX = file handle, CX = number of bytes to read
                        ; DS:DX -> buffer
pop     ds
sbb     bx, bx
or      ax, bx
retn
sub_17BB9 endp




sub_17BD3 proc near
pop     ax
pop     bx
mov     sp, ds:0F50h
push    bx
push    ax
jmp     sub_13E6D
sub_17BD3 endp



; Attributes: bp-based frame

sub_17BDE proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
mov     dx, di
mov     bx, si
mov     ax, ds
mov     es, ax
mov     si, [bp+arg_0]
mov     di, [bp+arg_2]
xor     ax, ax
mov     cx, 0FFFFh
repne scasb
not     cx
sub     di, cx
repe cmpsb
jz      short loc_17C03
sbb     ax, ax
sbb     ax, 0FFFFh

loc_17C03:
mov     si, bx
mov     di, dx
pop     bp
retn
sub_17BDE endp

align 2


; Attributes: bp-based frame

sub_17C0A proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
push    di
push    si
push    ds
pop     es
mov     di, [bp+arg_0]
mov     si, [bp+arg_2]
mov     bx, di
mov     cx, [bp+arg_4]
jcxz    short loc_17C2A

loc_17C1E:
lodsb
or      al, al
jz      short loc_17C26
stosb
loop    loc_17C1E

loc_17C26:
xor     al, al
rep stosb

loc_17C2A:
mov     ax, bx
pop     si
pop     di
mov     sp, bp
pop     bp
retn
sub_17C0A endp



; Attributes: thunk

sub_17C32 proc near
jmp     sub_17DA4
sub_17C32 endp

align 2


; Attributes: thunk

sub_17C36 proc near
jmp     sub_17DA4
sub_17C36 endp

align 2


; Attributes: bp-based frame

sub_17C3A proc near

var_E= dword ptr -0Eh
var_A= byte ptr -0Ah
var_9= byte ptr -9
var_8= byte ptr -8
var_7= byte ptr -7
var_6= byte ptr -6
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
push    si
push    di
sub     sp, 0Ah
mov     [bp+var_A], 0CDh
mov     ax, [bp+arg_0]
mov     [bp+var_9], al
cmp     al, 25h ; '%'
jz      short loc_17C5A
cmp     al, 26h ; '&'
jz      short loc_17C5A
mov     [bp+var_8], 0CBh
jmp     short loc_17C66

loc_17C5A:
mov     [bp+var_6], 0CBh
mov     [bp+var_7], 44h ; 'D'
mov     [bp+var_8], 44h ; 'D'

loc_17C66:
mov     word ptr [bp+var_E+2], ss
lea     ax, [bp+var_A]
mov     word ptr [bp+var_E], ax
mov     di, [bp+arg_2]
mov     ax, [di]
mov     bx, [di+2]
mov     cx, [di+4]
mov     dx, [di+6]
mov     si, [di+8]
mov     di, [di+0Ah]
push    bp
call    [bp+var_E]
pop     bp
cld
push    di
mov     di, [bp+arg_4]
mov     [di], ax
mov     [di+2], bx
mov     [di+4], cx
mov     [di+6], dx
mov     [di+8], si
pop     word ptr [di+0Ah]
jb      short loc_17CA4
xor     si, si
jmp     short loc_17CAC

loc_17CA4:
call    sub_1439E
mov     si, 1
mov     ax, [di]

loc_17CAC:
mov     [di+0Ch], si
add     sp, 0Ah
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_17C3A endp



; Attributes: bp-based frame

sub_17CB8 proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah
arg_8= word ptr  0Ch

push    bp
mov     bp, sp
push    si
push    di
push    ds
mov     ds, [bp+arg_0]
mov     si, [bp+arg_2]
mov     es, [bp+arg_4]
mov     di, [bp+arg_6]
mov     cx, [bp+arg_8]
rep movsb
pop     ds
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_17CB8 endp



; Attributes: bp-based frame

sub_17CD6 proc near

arg_0= word ptr  4
arg_2= byte ptr  6

push    bp
mov     bp, sp
push    di
mov     di, [bp+arg_0]
push    ds
pop     es
mov     bx, di
xor     ax, ax
mov     cx, 0FFFFh
repne scasb
inc     cx
neg     cx
mov     al, [bp+arg_2]
mov     di, bx
repne scasb
dec     di
cmp     [di], al
jz      short loc_17CF9
xor     di, di

loc_17CF9:
mov     ax, di
pop     di
mov     sp, bp
pop     bp
retn
sub_17CD6 endp



; Attributes: bp-based frame

sub_17D00 proc near

var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
push    ds
pop     es
mov     di, [bp+arg_2]
xor     ax, ax
mov     cx, 0FFFFh
repne scasb
not     cx
dec     cx
jcxz    short loc_17D53
dec     cx
mov     [bp+var_2], cx
mov     di, [bp+arg_0]
mov     bx, di
xor     ax, ax
mov     cx, 0FFFFh
repne scasb
not     cx
dec     cx
mov     dx, cx
sub     dx, [bp+var_2]
jbe     short loc_17D58
mov     di, bx

loc_17D35:
mov     si, [bp+arg_2]
lodsb
mov     di, bx
mov     cx, dx
repne scasb
jnz     short loc_17D58
mov     dx, cx
mov     bx, di
mov     cx, [bp+var_2]
jcxz    short loc_17D4E
repe cmpsb
jnz     short loc_17D35

loc_17D4E:
lea     ax, [bx-1]
jmp     short loc_17D5A

loc_17D53:
mov     ax, [bp+arg_0]
jmp     short loc_17D5A

loc_17D58:
xor     ax, ax

loc_17D5A:
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_17D00 endp



; Attributes: bp-based frame

sub_17D60 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    bx
mov     bx, [bp+arg_0]
mov     ax, [bx]
mov     dx, [bx+2]
mov     cx, [bp+arg_2]
call    sub_14364
mov     [bx], ax
mov     [bx+2], dx
pop     bx
pop     bp
retn    4
sub_17D60 endp



; Attributes: bp-based frame

sub_17D7C proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    bx
mov     bx, [bp+arg_0]
mov     ax, [bx]
mov     dx, [bx+2]
mov     cx, [bp+arg_2]
call    sub_14370
mov     [bx], ax
mov     [bx+2], dx
pop     bx
pop     bp
retn    4
sub_17D7C endp




sub_17D98 proc near
xor     ch, ch
jcxz    short locret_17DA2

loc_17D9C:
shr     dx, 1
rcr     ax, 1
loop    loc_17D9C

locret_17DA2:
retn
sub_17D98 endp

align 2


; Attributes: bp-based frame

sub_17DA4 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    di
push    si
mov     si, [bp+arg_0]
xor     ax, ax
cwd
xor     bx, bx

loc_17DB1:
lodsb
cmp     al, 20h ; ' '
jz      short loc_17DB1
cmp     al, 9
jz      short loc_17DB1
push    ax
cmp     al, 2Dh ; '-'
jz      short loc_17DC3
cmp     al, 2Bh ; '+'
jnz     short loc_17DC4

loc_17DC3:
lodsb

loc_17DC4:
cmp     al, 39h ; '9'
ja      short loc_17DE7
sub     al, 30h ; '0'
jb      short loc_17DE7
shl     bx, 1
rcl     dx, 1
mov     cx, bx
mov     di, dx
shl     bx, 1
rcl     dx, 1
shl     bx, 1
rcl     dx, 1
add     bx, cx
adc     dx, di
add     bx, ax
adc     dx, 0
jmp     short loc_17DC3

loc_17DE7:
pop     ax
cmp     al, 2Dh ; '-'
xchg    ax, bx
jnz     short loc_17DF4
neg     ax
adc     dx, 0
neg     dx

loc_17DF4:
pop     si
pop     di
pop     bp
retn
sub_17DA4 endp

align 10h



sub_17E00 proc near
mov     bx, sp
mov     bx, [bx+2]
mov     ds:9BAh, bx
cmp     byte ptr ds:2Fh, 3
jb      short loc_17E20
mov     cs:byte_11EEF, 66h ; 'f'
cmp     byte ptr ds:2Eh, 2
jnz     short loc_17E20
mov     bx, 2814h

loc_17E20:
mov     ax, cs:[bx-4]
mov     ds:9BCh, ax
mov     ax, cs:[bx-2]
mov     ds:9BEh, ax
retn
sub_17E00 endp




sub_17E2F proc near

; FUNCTION CHUNK AT 0251 SIZE 0000003F BYTES

mov     sp, ds:0CDAh
smsw    word ptr ds:0F88h
call    sub_153F9
call    sub_127DD
mov     ds:35h, cl
mov     ds:37h, cl
call    nullsub_2
cmp     byte ptr ds:2Eh, 0
jz      short loc_17E73
call    sub_1356A
cmp     byte ptr ds:2Eh, 0Ah
jnz     short loc_17E5D
call    sub_18067

loc_17E5D:
cmp     byte ptr ds:2Eh, 9
jnz     short loc_17E67
call    sub_17FCD

loc_17E67:
call    sub_11D3C
call    sub_18156
mov     word ptr ds:0AC2h, 32h ; '2'

loc_17E73:
push    0F8Ah
call    sub_12E50
pop     cx
mov     es, word ptr ds:0CEAh
mov     bx, 0Ah
mov     ax, es:[bx]
mov     ds:10C2h, ax
mov     ax, es:[bx+2]
mov     ds:10C4h, ax
mov     ds:0F50h, sp
cmp     byte ptr ds:2Eh, 0
jz      short loc_17EA5
mov     word ptr es:[bx], 10h
mov     word ptr es:[bx+2], cs
jmp     loc_11E21

loc_17EA5:
call    near ptr sub_18E40
sub_17E2F endp




sub_17EA8 proc near
pusha
push    ds
mov     ax, 0
mov     ds, ax
assume ds:nothing
mov     si, 2F6h
std

loc_17EB3:
mov     bx, si
lodsw
mov     dx, ax
lodsw

loc_17EB9:
cmp     bx, 2FAh
jnb     short loc_17EB3
inc     bx
inc     bx
cmp     [bx], ax
pushf
inc     bx
inc     bx
popf
jnz     short loc_17EB9
cmp     [bx], dx
jnz     short loc_17EB9
pop     ds
assume ds:nothing
mov     ds:56h, ax
mov     ds:58h, dx
popa
cld
retn
sub_17EA8 endp

push    bp
mov     bp, sp
push    dx
push    di
mov     ax, ds:56h
mov     dx, ds:58h
push    ds
mov     di, 0
mov     ds, di
assume ds:nothing
mov     di, [bp+4]

loc_17EED:
sub     di, 4
cmp     [di+2], dx
jnz     short loc_17EED
cmp     [di], ax
jnz     short loc_17EED
mov     ax, di
pop     ds
assume ds:nothing
pop     di
pop     dx
retn
db 0Fh, 0, 10h, 4, 14h, 4, 2, 0, 8, 10h
db 2 dup(0), 2, 0, 5, 3 dup(0), 10h, 0, 2
db 0, 40h, 48h, 40h, 0, 2, 0, 0Eh, 0, 10h
db 0, 18h, 0, 2, 0, 8, 10h, 8, 0, 2, 0, 10h
db 0, 20h, 0, 0A0h, 0, 1, 0, 8, 70h, 40h
db 0, 1, 0, 1, 3 dup(0), 8, 0, 2, 0, 8, 10h
db 71h, 0, 2, 0



sub_17F45 proc near
push    es
mov     di, 6321h

loc_17F49:
add     di, 0Eh
cmp     word ptr cs:[di], 1
jz      short loc_17F57
cmp     cs:[di], si
jnz     short loc_17F49

loc_17F57:
push    si
mov     si, di
push    ss
pop     es
mov     di, 4Ah ; 'J'
cld
lodsw
mov     cx, 6
rep movs word ptr es:[di], word ptr cs:[si]
pop     si
cmp     byte ptr ds:34h, 15h
jnz     short loc_17F74
mov     byte ptr ds:34h, 7Fh

loc_17F74:
mov     bx, 0
mov     es, bx
assume es:nothing
mov     bl, ds:34h
shl     bx, 2
lds     di, es:[bx]
mov     ax, ds
mov     ss:0F86h, ax
mov     ss:0F84h, di
sub     ax, [di-2]
sub     di, [di-4]
push    ss
pop     ds
or      ax, di
jz      short loc_17FA3
mov     word ptr es:[bx], 9F9h
mov     word ptr es:[bx+2], ds

loc_17FA3:
mov     al, ds:34h
mov     cs:byte_12AC5, al
mov     cs:byte_1B3FE, al
pop     es
assume es:nothing
retn
sub_17F45 endp




sub_17FB0 proc near
xor     ax, ax
xor     bx, bx
mov     cl, 82h
int     0DCh            ; used by BASIC while in interpreter
mov     al, bl
or      al, bh
jz      short locret_17FCC
shl     bx, 6
mov     ds:0ECAh, bx
shl     dx, 6
mov     ds:0ECEh, dx

locret_17FCC:
retn
sub_17FB0 endp



; Attributes: noreturn

sub_17FCD proc near
push    bp
cli
call    sub_127B9
xor     ax, ax
mov     ds, ax
assume ds:nothing
push    word ptr ds:0
push    word ptr ds:2
push    word ptr ds:4
mov     ss:0F7Ah, sp
mov     cx, 14h

loc_17FEA:
push    ax
loop    loc_17FEA
mov     word ptr ds:469h, ss
mov     ds:467h, sp
mov     al, 0Fh
out     70h, al         ; CMOS Memory/RTC Index Register:
                        ; shutdown status byte
mov     byte ptr ds:0, 0EAh
mov     word ptr ds:1, offset loc_18035
mov     word ptr ds:3, cs
mov     al, 9
out     71h, al         ; CMOS Memory/RTC Data Register
lgdt    fword ptr ss:8C8h
lidt    fword ptr ss:8D0h
smsw    ax
or      al, 1
lmsw    ax
jmp     far ptr 18h:6455h
sub_17FCD endp ; sp-analysis failed

db 0B8h, 20h, 0, 8Eh, 0D8h, 8Eh, 0C0h, 8Eh
db 0D0h, 0B0h, 0FEh, 0E6h, 64h, 0F4h, 0EBh
db 0FDh

loc_18035:
call    sub_127DD
mov     ax, ss:0F7Ah
xchg    ax, sp
sub     ax, sp
push    0
pop     ds
pop     word ptr ds:4
pop     word ptr ds:2
pop     word ptr ds:0
push    ss
pop     ds
assume ds:nothing
jcxz    short loc_18056
mov     ds:3Fh, cl

loc_18056:
add     ds:9C4h, ax
cmp     byte ptr ds:35h, 0
jz      short loc_18064
call    sub_127B9

loc_18064:
sti
pop     bp
retn


; Attributes: noreturn

sub_18067 proc near
push    bp
cli
call    sub_127B9
in      al, 21h         ; Interrupt controller, 8259A.
mov     ah, al
mov     al, 0FFh
out     21h, al         ; Interrupt controller, 8259A.
in      al, 0A1h        ; Interrupt Controller #2, 8259A
push    ax
not     al
out     0A1h, al        ; Interrupt Controller #2, 8259A
xor     ax, ax
mov     ds, ax
assume ds:nothing
mov     al, 0Fh
out     70h, al         ; CMOS Memory/RTC Index Register:
                        ; shutdown status byte
mov     word ptr ds:469h, cs
mov     word ptr ds:467h, 64E6h
mov     al, 0Ah
out     71h, al         ; CMOS Memory/RTC Data Register
mov     ss:0F7Ah, sp
lgdt    fword ptr ss:8C8h
lidt    fword ptr ss:8D0h
smsw    ax
or      al, 1
lmsw    ax
jmp     far ptr 18h:64DFh
sub_18067 endp

db 0B0h, 0FEh, 0E6h, 64h, 0F4h, 0EBh, 0FDh
db 0FAh, 0B8h
dw seg seg000
mov     ds, ax
assume ds:nothing
mov     ss, ax
mov     sp, ds:0F7Ah
in      al, 0A1h        ; Interrupt Controller #2, 8259A
not     al
mov     bl, al
in      al, 21h         ; Interrupt controller, 8259A.
mov     bh, al
pop     ax
out     0A1h, al        ; Interrupt Controller #2, 8259A
mov     cl, al
mov     al, ah
out     21h, al         ; Interrupt controller, 8259A.
mov     ch, 0FFh
cmp     bx, cx
jz      short loc_180EC
mov     byte ptr ds:2Eh, 9
mov     byte ptr ds:10EEh, 9
push    8B2h
call    sub_17E00
pop     ax

loc_180EC:
cmp     byte ptr ds:35h, 0
jnz     short loc_180F6
call    sub_127CB

loc_180F6:
sti
pop     bp
retn
; START OF FUNCTION CHUNK FOR sub_1490E

loc_180F9:
test    byte ptr ds:47h, 1
jz      short locret_18107
mov     ah, 0Fh
int     10h             ; - VIDEO - GET CURRENT VIDEO MODE
                        ; Return: AH = number of columns on screen
                        ; AL = current video mode
                        ; BH = current active display page
mov     ds:0A17h, al

locret_18107:
retn
; END OF FUNCTION CHUNK FOR sub_1490E



sub_18108 proc near
mov     ah, 35h ; '5'
mov     al, ds:34h
int     21h             ; DOS - 2+ - GET INTERRUPT VECTOR
                        ; AL = interrupt number
                        ; Return: ES:BX = value of interrupt vector
mov     word ptr cs:dword_12E94, bx
mov     word ptr cs:dword_12E94+2, es
cmp     word ptr ds:0A2h, 0
jnz     short locret_18155
xor     si, si
xor     dx, dx
mov     ax, 0BF01h
pushf
call    cs:dword_12E94
push    dx
or      dx, dx
jz      short loc_18154
mov     byte ptr ds:0A16h, 0
push    ss
pop     es
mov     di, 98h
mov     ds, dx
assume ds:nothing
mov     cx, 0Ch
rep movsw
push    ss
pop     ds
assume ds:nothing
mov     word ptr ds:0A4h, 0
mov     word ptr ds:0A6h, 0
call    sub_16BA8

loc_18154:
pop     ax

locret_18155:
retn
sub_18108 endp




sub_18156 proc near
call    sub_18108
or      ax, ax
jnz     short loc_18160
call    sub_17236

loc_18160:
mov     dx, 12CCh
mov     ah, 25h ; '%'
mov     al, ds:34h
push    cs
pop     ds
assume ds:seg002
mov     word_12E9A, cs
int     21h             ; DOS - SET INTERRUPT VECTOR
                        ; AL = interrupt number
                        ; DS:DX = new vector to be used for specified interrupt
push    ss
pop     ds
assume ds:nothing
retn
sub_18156 endp




sub_18173 proc near
mov     ax, ds:0CDCh
inc     ax
and     al, 0FEh
mov     bx, sp
mov     cx, [bx+2]
add     cx, ax
jb      short loc_1818D
cmp     cx, ds:0CE4h
ja      short loc_1818D
mov     ds:0CDCh, cx
retn

loc_1818D:
mov     ax, 0FFFFh
retn
sub_18173 endp




sub_18191 proc near
pushf
xor     ax, ax
push    ax
popf
pushf
pop     ax
and     ah, 0F0h
cmp     ah, 0F0h
jz      short loc_181C4
push    sp
pop     bx
cmp     bx, sp
jnz     short loc_181BF
mov     ax, 0F000h
push    ax
popf
pushf
pop     bx
and     bx, ax
jz      short loc_181BA
mov     ax, 3
mov     ds:10F2h, eax
jmp     short loc_181C6

loc_181BA:
mov     ax, 2
jmp     short loc_181C6

loc_181BF:
mov     ax, 1
jmp     short loc_181C6

loc_181C4:
xor     ax, ax

loc_181C6:
popf
retn
sub_18191 endp




sub_181C8 proc near
pushfd
pushfd
pop     edx
mov     ecx, edx
btc     edx, 15h
btc     edx, 12h
push    edx
popfd
pushfd
pop     edx
mov     ax, 3
xor     edx, ecx
shr     edx, 13h
jnb     short loc_18202
inc     ax
test    dl, 4
jz      short loc_18202
mov     eax, 1
cpuid
mov     al, ah
and     ax, 0Fh

loc_18202:
popfd
retn
sub_181C8 endp




sub_18205 proc near
mov     ax, 3300h
int     21h             ; DOS - EXTENDED CONTROL-BREAK CHECKING
                        ; AL = 00h get state / 01h set state / 02h set AND get
                        ; DL = 00h for OFF or 01h for ON
mov     cl, dl
mov     bx, sp
mov     dl, [bx+2]
inc     ax
int     21h             ; DOS -
xchg    ax, cx
cbw
retn
sub_18205 endp




sub_18217 proc near
mov     al, 0FFh
out     94h, al
jmp     short $+2

loc_1821D:
xor     al, al
out     96h, al
retn
sub_18217 endp




sub_18222 proc near
cmp     byte ptr ds:34h, 15h
mov     ax, 0
jnz     short locret_18251
mov     ah, 0C0h
int     15h             ; SYSTEM - GET CONFIGURATION (XT after 1/10/86,AT mdl 3x9,CONV,XT286,PS)
mov     ax, 0
jb      short locret_18251
mov     cx, es:[bx+2]
cmp     cl, 0E0h
jb      short locret_18251
cmp     cl, 0F8h
jle     short loc_1824D
cmp     cl, 0FCh
jnz     short locret_18251
cmp     ch, 4
jl      short locret_18251

loc_1824D:
mov     al, es:[bx+5]

locret_18251:
retn
sub_18222 endp




sub_18252 proc near
push    es
mov     ax, 0F000h
mov     es, ax
assume es:nothing
mov     ax, 0
mov     cl, es:0FFFEh
pop     es
assume es:nothing
cmp     cl, 0E1h
jnz     short locret_18268
mov     ax, cx

locret_18268:
retn
sub_18252 endp




sub_18269 proc near
call    sub_127DD
mov     al, 45h ; 'E'
call    sub_12303
test    al, 80h
jnz     short loc_18281
neg     cx
and     ch, 40h
xor     ch, al
jz      short loc_18281
mov     al, 1
retn

loc_18281:
xor     ax, ax
retn
sub_18269 endp




sub_18284 proc near
pushf
pop     ax
and     ah, 0CFh
push    ax
popf
pushf
pop     ax
and     ax, 3000h
retn
sub_18284 endp




sub_18291 proc near
mov     bx, sp
push    si
push    di
mov     ax, ds
push    ax
mov     es, ax
mov     cx, ss:[bx+8]
mov     di, ss:[bx+6]
mov     si, ss:[bx+4]
mov     ds, word ptr ss:[bx+2]
cld
rep movsb
pop     ds
pop     di
pop     si
retn
sub_18291 endp



; Attributes: bp-based frame

sub_182B1 proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
push    di
mov     cx, [bp+arg_4]
jcxz    short loc_182F6
call    sub_11E60
push    8
pop     es
assume es:nothing
mov     bx, [bp+arg_0]
and     bl, 0F8h
mov     ax, es:[bx+2]
mov     es:62h, ax
mov     al, es:[bx+4]
mov     es:64h, al
mov     al, es:[bx+7]
mov     es:67h, al
push    60h ; '`'
pop     es
assume es:nothing
mov     di, [bp+arg_2]
cld
xor     ax, ax
mov     cx, [bp+arg_4]
shr     cx, 1
jz      short loc_182F0
rep stosw

loc_182F0:
jnb     short loc_182F3
stosb

loc_182F3:
call    sub_124F9

loc_182F6:
pop     di
mov     sp, bp
pop     bp
sti
retn
sub_182B1 endp




sub_182FC proc near
mov     cx, 6

loc_182FF:
pop     bx
pop     ax
push    ax
xor     dx, dx

loc_18304:
shl     ax, 1
rcl     dx, 1
loop    loc_18304
jmp     bx
sub_182FC endp ; sp-analysis failed

mov     cx, 4
jmp     short loc_182FF
db 96h, 71h, 12h, 9Fh, 0Ah, 0, 4Eh, 3Fh
db 0ACh, 4, 0Ah, 0, 5, 0D5h, 0C0h, 9Bh, 0Ah
db 0, 0D6h, 46h, 73h, 0F3h, 1, 0, 1Eh, 7
db 61h, 7Dh, 1, 0, 0EAh, 30h, 1Eh, 9, 1
db 0, 0BDh, 0C6h, 9Fh, 55h, 1, 0, 64h, 89h
db 0F8h, 61h, 0Ah, 0, 89h, 8, 79h, 3Fh, 0Ah
db 0, 60h, 0B5h, 82h, 3Fh, 0Ah, 2 dup(0)
db 4Bh, 22h, 61h, 1, 0, 65h, 91h, 0F6h, 37h
db 0Ah, 2 dup(0), 7Ah, 18h, 0D4h, 0Ah, 0
db 0E7h, 8Ch, 0ADh, 0B4h, 0Ah, 0, 0E9h, 8Fh
db 0FAh, 42h, 0Dh, 0, 1Eh, 0AEh, 4Ah, 0C5h
db 0Dh, 0, 52h, 0A2h, 0BCh, 1Fh, 6, 0, 0B0h
db 99h, 55h, 57h, 6, 0, 91h, 0F8h, 0EDh
db 67h, 6, 0, 1, 6Ah, 0A7h, 0E1h, 6, 0, 70h
db 0A4h, 60h, 62h, 13h, 0, 0C6h, 5Ch, 0C9h
db 67h, 0Ah, 0, 0CEh, 72h, 1Ah, 0D3h, 0Ah
db 0, 0BEh, 3Ch, 84h, 5Fh, 0Ah, 0, 0F7h
db 0BFh, 0F6h, 0A2h, 0Ah, 0, 42h, 0, 95h
db 0E3h, 0Ah, 0, 63h, 15h, 55h, 0E1h, 0Ah
db 0, 0F4h, 0F5h, 6, 4Fh, 0Ah, 2 dup(0)
db 4Ah, 0A6h, 2, 0Ah, 0, 0B0h, 6Ch, 0D9h
db 0DAh, 0Ah, 0, 15h, 6Ch, 40h, 0B5h, 0Dh
db 0, 0E3h, 0Eh, 0C7h, 96h, 0Dh, 0, 5Ch
db 9Fh, 77h, 0FCh, 0Dh, 0, 15h, 0AEh, 2Fh
db 0A7h, 0Ah, 0, 34h, 44h, 3Eh, 54h, 0Ah
db 2Fh, 4Fh, 0DBh, 53h, 24h, 0Ah, 0, 0CFh
db 72h, 0, 3, 9, 15h, 18h, 2 dup(7Eh), 8Eh
db 0Ah, 0, 8, 0AAh, 0D5h, 86h, 0Ah, 0, 74h
db 5, 0D9h, 0D6h, 9, 0FFh, 0BCh, 0BAh, 2 dup(31h)
db 0Ah, 0, 1Eh, 16h, 0C7h, 0Eh, 0Ah, 40h
db 0Bh, 0CEh, 0Eh, 3Eh, 3, 40h, 0C0h, 56h
db 77h, 25h, 3, 40h



sub_18419 proc near
mov     bx, sp
mov     dx, [bx+4]
mov     bx, [bx+2]
push    si
push    di
push    cs
pop     ds
assume ds:seg002
mov     cx, 2Ch ; ','
mov     si, 6741h
jmp     short $+2

loc_1842D:
lodsw
xchg    ax, di
lodsw
cmp     ax, dx
lodsb
jnz     short loc_18439
cmp     di, bx
jz      short loc_18441

loc_18439:
loop    loc_1842D
xor     ax, ax
xor     dx, dx
jmp     short loc_18449

loc_18441:
xor     ah, ah
mov     dx, ax
lodsb
shl     ax, 4

loc_18449:
push    ss
pop     ds
assume ds:nothing
pop     di
pop     si
retn
sub_18419 endp




sub_1844E proc near
push    si
xor     si, si
mov     cx, 4000h

loc_18454:
xor     dx, dx
push    0F000h
pop     ds
assume ds:nothing
xor     bx, bx

loc_1845C:
lodsw
add     bx, ax
lodsw
adc     dx, ax
loop    loc_1845C
pop     si
push    ss
pop     ds
assume ds:nothing
xchg    ax, bx
retn
sub_1844E endp




sub_18469 proc near
push    si
mov     si, 8000h
mov     cx, 2000h
jmp     short loc_18454
sub_18469 endp



; Attributes: bp-based frame

sub_18472 proc near

var_2= word ptr -2

push    bp
mov     bp, sp
xor     cx, cx
push    0FFFFh
smsw    ax
test    al, 4
jnz     short locret_18499
fninit
fnstsw  [bp+var_2]
cmp     byte ptr [bp+var_2], cl
jnz     short locret_18499
fnstcw  [bp+var_2]
mov     ax, [bp+var_2]
and     ax, 103Fh
cmp     ax, 3Fh ; '?'
jnz     short locret_18499
inc     cx

locret_18499:
leave
xchg    ax, cx
retn
sub_18472 endp




sub_1849C proc near
mov     ax, 1
cmp     byte ptr ds:0CECh, 2
jbe     short locret_184B4
sub     sp, 22h
mov     dx, sp
mov     ax, 3800h
int     21h             ; DOS - 2+ - GET COUNTRY-DEPENDENT INFORMATION
                        ; get current-country info
                        ; DS:DX -> buffer for returned info
add     sp, 22h
xchg    ax, bx

locret_184B4:
retn
sub_1849C endp

word_184B5 dw 0


; Attributes: bp-based frame

sub_184B7 proc far

arg_0= word ptr  6
arg_2= word ptr  8

push    bp
mov     bp, sp
push    si
push    di
mov     dx, [bp+4]
mov     bx, dx
add     dx, 10h
mov     di, 80h
xor     ax, ax
mov     es, ax
assume es:nothing
push    word ptr es:2
push    word ptr es:0
mov     es, bx
assume es:nothing
stosb
mov     ax, 6936h
stosw
mov     ax, cs
stosw
mov     ax, [bp+arg_2]
stosw
mov     ax, ss
stosw
mov     al, 0Dh
stosb
mov     cs:word_184B5, sp
mov     bx, [bp+arg_0]
mov     ax, [bx+16h]
add     ax, dx
mov     cx, [bx+14h]
add     dx, [bx+0Eh]
mov     ss, dx
mov     sp, [bx+10h]
push    es
pop     ds
push    ax
push    cx
retf
sub_184B7 endp

pop     ax
pop     ax
pop     ax
pop     dx
pop     cx
mov     ss, cs:seg_11BD0
mov     sp, cs:word_184B5
xor     bx, bx
mov     ds, bx
assume ds:nothing
pop     word ptr ds:0
pop     word ptr ds:2
push    ss
pop     ds
assume ds:nothing
mov     bp, sp
lea     bp, [bp+4]
mov     bx, [bp+0Ah]
mov     [bx], cx
mov     bx, ds:0CEAh
push    ax
mov     ah, 50h
int     21h             ; DOS - 2+ internal - SET PSP SEGMENT
                        ; BX = segment address of new PSP
pop     ax
pop     di
pop     si
pop     bp
retn



sub_1853B proc near
test    byte ptr ds:47h, 80h
jnz     short locret_1855B
mov     ax, 0BFDEh
mov     bx, 8
mov     cx, cs
xor     dx, dx
call    near ptr byte_12AC4
or      bx, bx
jnz     short locret_1855B
or      ds:47h, al
mov     ds:0DECh, dx

locret_1855B:
retn
sub_1853B endp




sub_1855C proc near
mov     bx, 0Bh
mov     ax, 0BFDEh
jmp     near ptr byte_12AC4
sub_1855C endp

in      al, 92h         ; PS/2 System Control Port A
                        ; 1: A20 address line (1=active)
                        ; 0: Alternate CPU reset (to effect mode switch from
                        ;    Protected Virtual Address Mode to Real Address Mode).
or      al, 2
jmp     short $+2

loc_1856B:              ; PS/2 System Control Port A
out     92h, al         ; 1: A20 address line (1=active)
                        ; 0: Alternate CPU reset (to effect mode switch from
                        ;    Protected Virtual Address Mode to Real Address Mode).
retn
in      al, 92h         ; PS/2 System Control Port A
                        ; 1: A20 address line (1=active)
                        ; 0: Alternate CPU reset (to effect mode switch from
                        ;    Protected Virtual Address Mode to Real Address Mode).
and     al, 0FDh
jmp     short $+2

loc_18574:              ; PS/2 System Control Port A
out     92h, al         ; 1: A20 address line (1=active)
                        ; 0: Alternate CPU reset (to effect mode switch from
                        ;    Protected Virtual Address Mode to Real Address Mode).
retn



sub_18577 proc near
call    sub_127DD
cmp     cl, 1
sbb     dx, dx
in      al, 92h         ; PS/2 System Control Port A
                        ; 1: A20 address line (1=active)
                        ; 0: Alternate CPU reset (to effect mode switch from
                        ;    Protected Virtual Address Mode to Real Address Mode).
mov     bx, ax
and     bx, 2
cmp     bl, 2
sbb     bx, bx
xor     bx, dx
or      si, bx
retn
sub_18577 endp




sub_18590 proc near
push    si
push    di
xor     si, si
call    sub_18577
jnz     short loc_185D9
push    dx
xor     al, 2
push    ax
out     92h, al         ; PS/2 System Control Port A
                        ; 1: A20 address line (1=active)
                        ; 0: Alternate CPU reset (to effect mode switch from
                        ;    Protected Virtual Address Mode to Real Address Mode).
call    sub_18577
pop     cx
pop     bx
mov     ch, al
and     cx, 303h
cmp     ch, cl
jnz     short loc_185D9
xor     al, 2
out     92h, al         ; PS/2 System Control Port A
                        ; 1: A20 address line (1=active)
                        ; 0: Alternate CPU reset (to effect mode switch from
                        ;    Protected Virtual Address Mode to Real Address Mode).
xor     dx, bx
jz      short loc_185D9
call    sub_18577
jnz     short loc_185D9
push    cs
pop     ds
assume ds:seg002
push    cs
pop     es
assume es:seg002
mov     si, 6995h
mov     di, 0BE9h
mov     cx, 9
rep movsb
mov     di, 0BFBh
mov     cx, 9
rep movsb
push    ss
pop     ds
assume ds:nothing
mov     byte ptr ds:3Fh, 0FFh

loc_185D9:
sti
pop     di
pop     si
retn
sub_18590 endp



; Attributes: bp-based frame

sub_185DD proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
call    sub_18618
mov     si, [bp+arg_2]
test    si, si
jz      short loc_185F2
push    ds
pop     es
assume es:nothing
mov     di, 0A2Ch
cld
jmp     short loc_18610

loc_185F2:
mov     si, [bp+arg_0]
push    ds
pop     es
cld
mov     di, 0A2Ch
mov     bx, di

loc_185FD:
lodsb
test    al, al
jz      short loc_1860B
stosb
cmp     al, 5Ch ; '\'
jnz     short loc_185FD
mov     bx, di
jmp     short loc_185FD

loc_1860B:
mov     di, bx
mov     si, 0A7Ch

loc_18610:
lodsb
stosb
test    al, al
jnz     short loc_18610
pop     bp
retn
sub_185DD endp




sub_18618 proc near
mov     word ptr ds:1586h, ds
mov     ax, 98h
mov     ds:1584h, ax
mov     word ptr ds:158Eh, 20h ; ' '
mov     word ptr ds:158Ch, 70h ; 'p'
mov     word ptr ds:158Ah, 1BA6h
mov     ax, 1D2Fh
sub     ax, 1D26h
mov     ds:1590h, ax
mov     ax, ds
movzx   eax, ax
shl     eax, 4
mov     bx, 98Eh
movzx   ebx, bx
add     eax, ebx
mov     ds:1598h, eax
mov     word ptr ds:1596h, 1
retn
sub_18618 endp


loc_1865C:
mov     si, [bp+1Eh]
mov     ds, word ptr [bp+22h]
mov     word ptr [si], 0
pop     bp
pop     si
pop     ds
retfd
push    ds
push    si
push    bp
mov     bp, sp
mov     si, [bp+12h]
mov     ds, word ptr [bp+16h]
cmp     byte ptr [si], 7
jz      short loc_1865C
cmp     byte ptr [si], 1Fh
jz      short loc_1865C
pop     bp
pop     si
pop     ds
call    loc_18687
db 0Dh

loc_18687:
push    ax
pusha
push    es
push    ds
push    ss
push    0
mov     si, sp
push    ss
pop     ds
mov     bx, [si+1Ah]
mov     al, cs:[bx]
or      al, al
js      short loc_186B3
and     ax, 1Fh
mov     [si+18h], ax
mov     ax, [si+34h]
mov     [si+0Eh], ax
mov     ax, [si+38h]
mov     [si+2], ax
mov     bx, 0Ah
jmp     short loc_186BF

loc_186B3:
and     ax, 1Fh
mov     [si+18h], ax
add     word ptr [si+0Eh], 0Ah
xor     bx, bx

loc_186BF:
les     di, cs:dword_13392
mov     ax, di
cld
mov     cx, 0Dh
rep movsw
add     si, bx
movsd
movsd
movsd
movsd
or      bx, bx
jz      short loc_186FD
mov     si, sp
mov     word ptr [si+38h], es
mov     [si+34h], ax
mov     word ptr [si+2Ch], cs
mov     word ptr [si+28h], 6B31h
sub     ax, ax
mov     [si+36h], ax
mov     [si+2Ah], ax
add     sp, 4
pop     ds
pop     es
popa
add     sp, 4
retfd

loc_186FD:
push    es
pop     ss
mov     sp, ax
sti
mov     bp, sp
cmp     word ptr [bp+18h], 0Dh
jz      short loc_1877D
jmp     cs:dword_1338E
jmp     short loc_18727
push    edx
mov     edx, cs:dword_18916
mov     cx, cs:word_1891A
mov     bl, 21h ; '!'
mov     ax, 205h
int     31h             ; DPMI Services   ax=func xxxxh
                        ; SET PROTECTED MODE INTERRUPT VECTOR
                        ; BL = interrupt number, CX:DX / CX:EDX = selector:offset of handler
                        ; Return: CF set on error
                        ; CF clear if successful
pop     edx

loc_18727:
mov     ax, cs:word_13C4E
mov     ds, ax
assume ds:nothing
dec     byte ptr ds:0A9Eh
jz      short loc_18744
mov     ds:996h, sp
mov     cx, ss
cmp     ax, cx
jz      short loc_18741
mov     sp, ds:0F50h

loc_18741:
call    sub_13C60

loc_18744:
jmp     loc_18DAC

loc_18747:
mov     si, [bp+1Eh]
mov     ds, word ptr [bp+22h]
assume ds:nothing
lodsw
cmp     ax, 5EFFh
jnz     short loc_18778
lodsb
cbw
add     ax, [bp+0Ch]
xchg    ax, si
mov     ds, word ptr [bp+2]
mov     bx, [si+2]
mov     ax, 6
int     31h             ; DPMI Services   ax=func xxxxh
                        ; GET SEGMENT BASE ADDRESS
                        ; BX = selector
                        ; Return: CF set on error
                        ; CF clear if successful, CX:DX = linear base address of segment
jb      short loc_18778
mov     es, cs:word_13C4E
assume es:nothing
mov     bx, es:0A9Ch
mov     [si+2], bx
inc     ax
int     31h             ; DPMI Services   ax=func xxxxh
                        ;
jnb     short loc_187F6

loc_18778:
jmp     cs:dword_1338E

loc_1877D:
lsl     ax, [bp+22h]
sub     ax, [bp+1Eh]
jbe     short loc_18778
cmp     word ptr [bp+1Ah], 0
jnz     short loc_18747
sub     ax, 4
jbe     short loc_18778
mov     cx, [bp+4]
jcxz    short loc_18778
lsl     bx, cx
mov     es, cx
assume es:nothing
mov     si, [bp+1Eh]
mov     ds, word ptr [bp+22h]
cld
lodsw
mov     cx, 2
mov     di, [bp+0Ah]
cmp     bx, di
jbe     short loc_18778
mov     bx, es:[di]
mov     dx, [bp+16h]
cmp     ax, 489h
jz      short loc_187DA
sub     dx, bx
neg     dx
cmp     ax, 429h
jz      short loc_187DA
inc     cx
mov     dx, bx
mov     dl, [si]
cmp     ax, 4C6h
jz      short loc_187DA
or      dl, bl
cmp     ax, 0C80h
jz      short loc_187DA
inc     cx
mov     dx, [si]
cmp     ax, 4C7h
jnz     short loc_18778

loc_187DA:
add     [bp+1Eh], cx
mov     bx, [bp+4]
mov     ax, 0Ah
int     31h             ; DPMI Services   ax=func xxxxh
                        ; CREATE CODE SEGMENT ALIAS DESCRIPTOR
                        ; BX = code segment selector
                        ; Return: CF set on error
                        ; CF clear if successful, AX = new data selector
jb      short loc_18778
mov     es, ax
mov     bx, ax
mov     di, [bp+0Ah]
mov     es:[di], dx
mov     ax, 1
int     31h             ; DPMI Services   ax=func xxxxh
                        ; FREE LDT DESCRIPTOR
                        ; BX = selector to free
                        ; Return: CF set on error
                        ; CF clear if successful

loc_187F6:
mov     es, word ptr [bp+2]
mov     di, [bp+0Eh]
dec     di
dec     di
lea     si, [bp+26h]
push    ss
pop     ds
std
mov     cx, 15h
rep movsw
mov     ax, es
mov     ss, ax
mov     sp, di
add     sp, 6
pop     ds
pop     es
popa
add     sp, 6
iretd
; START OF FUNCTION CHUNK FOR sub_18834

loc_1881A:
push    26h ; '&'
call    sub_1307C
pop     cx
xor     ax, ax
jmp     short loc_1886F
; END OF FUNCTION CHUNK FOR sub_18834



sub_18824 proc near
mov     ax, 4300h
int     2Fh             ; - Multiplex - XMS - INSTALLATION CHECK
                        ; Return: AL = 80h XMS driver installed
                        ; AL <> 80h no driver
cmp     al, 80h
jz      short loc_1882F
xor     ax, ax

loc_1882F:
or      ds:36h, al
retn
sub_18824 endp




sub_18834 proc near

; FUNCTION CHUNK AT 6C4A SIZE 0000000A BYTES

call    sub_18824
or      ax, ax
jnz     short loc_1883C
retn

loc_1883C:
mov     ax, 4310h
int     2Fh             ; - Multiplex - XMS - GET DRIVER ADDRESS
                        ; Return: ES:BX -> driver entry point
mov     ds:0AECh, bx
mov     word ptr ds:0AEEh, es
xor     ah, ah
call    dword ptr ds:0AECh
dec     ah
jle     short loc_1881A
cmp     bx, 204h
jnb     short loc_18860
mov     cs:word_139BA, 40h ; '@'

loc_18860:
mov     ah, 8
call    dword ptr ds:0AECh
sub     ax, cs:word_139BA
jnb     short loc_1886F
xor     ax, ax

loc_1886F:
or      ax, ax
mov     ds:0ECEh, ax
jz      short loc_188D3
cmp     ax, ds:0ECCh
jb      short loc_1887F
mov     ax, ds:0ECCh

loc_1887F:
mov     ds:0ECCh, ax
xchg    ax, dx
mov     ah, 9
call    dword ptr ds:0AECh
or      ax, ax
jz      short loc_188D3
mov     ds:0ADCh, dx
mov     ah, 0Ch
call    dword ptr ds:0AECh
or      ax, ax
jnz     short loc_188A0
call    sub_139BC
jmp     short loc_188D3

loc_188A0:
add     bx, 0Fh
adc     dx, 0
mov     cx, 4

loc_188A9:
shr     dx, 1
rcr     bx, 1
loop    loc_188A9
mov     ds:98h, bx
mov     ds:9Ah, dx
mov     word ptr ds:0AA6h, 3E15h
mov     word ptr ds:0AA4h, 3DE0h
mov     ax, 400h
mul     word ptr ds:0ECCh
mov     ds:0AA8h, ax
mov     ds:0AAAh, dx
jmp     short loc_188D9

loc_188D3:
mov     word ptr ds:0ECCh, 0

loc_188D9:
mov     al, 1
retn
sub_18834 endp

align 8



sub_188E0 proc near
pop     cx
pop     bx
lar     ax, bx
jmp     short $+2

loc_188E7:
push    bx
shr     ax, 8
jmp     cx
sub_188E0 endp ; sp-analysis failed

db 52h, 53h, 49h, 20h, 43h, 4Ch, 49h, 45h
db 4Eh, 54h, 20h, 30h, 2Eh, 39h
byte_188FB db 1
db 18h dup(0)
word_18914 dw 0
dword_18916 dd 0
word_1891A dw 0
call    loc_18687
adc     ax, bp
db      64h
std
adc     al, ch
pusha
std
psubsb  mm3, qword ptr [si-3]
push    cs
call    loc_18687
or      ax, 54E8h
std
or      al, 0E8h
push    ax
std
or      bp, ax
dec     sp
std
or      ch, al
dec     ax
std
or      ax, bp
inc     sp
std
or      al, ch
inc     ax
std
pop     es
call    loc_18687
push    es



sub_1894C proc near
push    si
push    di
mov     ax, 1687h
int     2Fh             ; - Multiplex - MS WINDOWS - Mode Interface - INSTALLATION CHECK
                        ; Return: AX = 0000h if installed, BX = flags
                        ; CL = processor type, DH = DPMI major version
                        ; DL = DPMI minor version
                        ; SI = number of paragraphs
                        ; ES:DI -> DPMI mode-switch entry point
or      ax, ax
mov     ax, 0
jnz     short loc_1896F
mov     cs:word_18914, si
mov     cs:word_18A36, di
mov     cs:seg_18A38, es
mov     al, cl
mov     ds:0C42h, dh

loc_1896F:
pop     di
pop     si
retn
sub_1894C endp



; Attributes: bp-based frame

sub_18972 proc near

var_s0= word ptr  0
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
push    esi
push    edi
push    edx
xor     esi, esi
xor     edi, edi
xor     edx, edx
mov     ax, [bp+arg_0]
mov     bp, [bp+arg_2]
mov     cx, [bp+arg_0]
mov     dx, [bp+arg_2]
mov     si, [bp+arg_4]
mov     di, [bp+arg_6]
mov     bx, [bp+2]
push    ss
pop     es
int     31h             ; DPMI Services   ax=func xxxxh
                        ;
mov     [bp+var_s0], ax
mov     [bp+2], bx
mov     [bp+arg_0], cx
mov     [bp+arg_2], dx
mov     [bp+arg_4], si
mov     [bp+arg_6], di
mov     ax, 0
cmc
rcl     ax, 1
pop     edx
pop     edi
pop     esi
pop     bp
retn
sub_18972 endp

db 16h, 1Fh, 6Ah, 20h, 0E8h, 0A9h, 0B4h
dword_189C4 dd 0
dword_189C8 dd 0
dword_189CC dd 0

loc_189D0:
mov     cs:dword_189C4, esi
xor     esi, esi
mov     cs:dword_189C8, edi
xor     edi, edi
mov     cs:dword_189CC, edx
xor     edx, edx
mov     di, 0C1Eh
mov     cx, 11h
push    ds
pop     es
xor     ax, ax
rep stosw
mov     word ptr ds:0C2Eh, 40h ; '@'
mov     ah, 48h ; 'H'
mov     bx, 200h
int     21h             ; DOS - 2+ - ALLOCATE MEMORY
                        ; BX = number of 16-byte paragraphs desired
jb      short loc_18A1F
mov     ds:0C32h, ax
mov     es, ax
xor     ax, ax
mov     cx, 1000h
mov     di, ax
rep stosw
mov     ah, 48h ; 'H'
mov     bx, cs:word_18914
int     21h             ; DOS - 2+ - ALLOCATE MEMORY
                        ; BX = number of 16-byte paragraphs desired
jnb     short loc_18A22

loc_18A1F:
jmp     loc_18D0B

loc_18A22:
mov     es, ax
call    near ptr sub_190CE
mov     ax, ds:0F50h
add     ax, 2Ah ; '*'
push    cs
pop     ds
assume ds:seg002
mov     word ptr dword_13392, ax
mov     ax, 1
db 9Ah
word_18A36 dw 6DA2h
seg_18A38 dw seg seg002
db 72h, 81h, 0FCh, 36h, 0C7h, 6, 0C2h, 0Ah
db 0DCh, 71h, 36h, 8Ch, 1Eh, 30h, 0Ch, 8Ch
db 16h, 7Eh, 20h, 36h, 8Ch, 6, 28h, 0Ch
db 36h, 8Ch, 6, 0B2h, 9, 26h, 0A1h, 2Ch
db 0, 36h, 0A3h, 2Ah, 0Ch, 36h, 8Ch, 1Eh
db 8, 0, 8Ch, 0Eh, 0C0h, 17h, 8Ch, 16h, 0C4h
db 17h, 83h, 0ECh, 8, 8Ch, 0D3h, 8Bh, 0FCh
db 8Eh, 0C3h, 0B8h, 0Bh, 0, 0CDh, 31h, 26h
db 80h, 65h, 6, 0BFh, 0B8h, 0Ch, 0, 0CDh
db 31h, 8Ch, 0DBh, 8Bh, 0FCh, 8Eh, 0C3h
db 0B8h, 0Bh, 0, 0CDh, 31h, 26h, 80h, 65h
db 6, 0BFh, 0B8h, 0Ch, 0, 0CDh, 31h, 83h
db 0C4h, 8, 0BEh, 1Dh, 6Dh, 0B8h, 0, 0Ah
db 0CDh, 31h, 0B8h, 5, 3, 0CDh, 31h, 89h
db 0Eh, 2Eh, 6Dh, 89h, 1Eh, 30h, 6Dh, 66h
db 89h, 3Eh, 34h, 6Dh, 89h, 36h, 38h, 6Dh
db 0A3h, 32h, 6Dh, 0B8h, 6, 3, 0CDh, 31h
db 73h, 3, 0E9h, 44h, 2, 89h, 0Eh, 3Ah, 6Dh
db 89h, 1Eh, 3Ch, 6Dh, 66h, 89h, 2 dup(3Eh)
db 6Dh, 89h, 36h, 42h, 6Dh, 0B3h, 21h, 0B8h
db 4, 2, 0CDh, 31h, 66h, 89h, 16h, 46h, 6Dh
db 89h, 0Eh, 4Ah, 6Dh, 36h, 89h, 0Eh, 40h
db 0Ch, 16h, 1Fh, 1Eh, 7, 0BFh, 0C0h, 0
db 0Eh, 0E8h, 0B9h, 6, 8Ch, 0Eh, 24h, 0Ch
db 8Ch, 0Eh, 0F8h, 0Ah, 8Ch, 16h, 26h, 0Ch
db 0FBh, 8Ch, 16h, 2Ch, 0, 8Ch, 0Eh, 18h
db 0, 8Ch, 0Eh, 1Ch, 0, 0C7h, 6, 22h, 0
db 44h, 73h, 8Ch, 0Eh, 24h, 0, 8Ch, 16h
db 0Ch, 0, 8Ch, 16h, 3Ch, 0, 8Ch, 16h, 98h
db 9, 8Ch, 16h, 44h, 0, 0B8h, 3, 2, 0B3h
db 11h, 8Ch, 0C9h, 0BAh, 4Ch, 6Dh, 0CDh
db 31h, 83h, 0C2h, 4, 0FEh, 0CBh, 80h, 0FBh
db 6, 73h, 0F4h, 0B3h, 0Dh, 0BAh, 9Bh, 6Ah
db 0CDh, 31h, 0BAh, 0D4h, 71h, 8Ch, 0C9h
db 0B3h, 3, 0B8h, 5, 2, 0CDh, 31h, 0BAh
db 0Bh, 73h, 0B3h, 1, 0CDh, 31h, 0BAh, 0D8h
db 71h, 0B3h, 0, 0CDh, 31h, 0BAh, 60h, 75h
db 0B3h, 23h, 0CDh, 31h, 2Eh, 80h, 3Eh, 2Bh
db 6Dh, 0, 75h, 5, 0B8h, 82h, 16h, 0CDh
db 2Fh, 0B8h, 3, 0, 0CDh, 31h, 0A3h, 46h
db 0Ch, 33h, 0C9h, 41h, 0D1h, 0E8h, 73h
db 0FBh, 89h, 0Eh, 44h, 0Ch, 0B9h, 6, 0
db 33h, 0C0h, 0CDh, 31h, 73h, 3, 0E9h, 76h
db 1, 0A3h, 2Ch, 0Ch, 93h, 0B8h, 8, 0, 0B9h
db 2 dup(0FFh), 8Bh, 0D1h, 0CDh, 31h, 72h
db 0EDh, 3, 1Eh, 46h, 0Ch, 89h, 1Eh, 36h
db 0Ch, 33h, 0C9h, 0CDh, 31h, 72h, 0DFh
db 3, 1Eh, 46h, 0Ch, 89h, 1Eh, 3Ch, 0Ch
db 0CDh, 31h, 72h, 0D3h, 83h, 0ECh, 8, 16h
db 7, 8Bh, 0FCh, 3, 1Eh, 46h, 0Ch, 89h, 1Eh
db 3Ah, 0Ch, 89h, 1Eh, 0F4h, 0Ah, 89h, 1Eh
db 0, 0Ah, 89h, 1Eh, 8, 0Ah, 0B8h, 0Bh, 0
db 0CDh, 31h, 0E8h, 7, 0AFh, 48h, 0ABh, 0A1h
db 10h, 0Ah, 0B9h, 10h, 0, 0F7h, 0E1h, 0ABh
db 92h, 0AAh, 8Bh, 0FCh, 0B8h, 0Ch, 0, 0CDh
db 31h, 8Eh, 0DBh, 8Ch, 16h, 0E0h, 54h, 8Ch
db 0C8h, 0A3h, 63h, 3Eh, 89h, 1Eh, 3, 4
db 0C7h, 6, 1, 4, 0F2h, 54h, 0C6h, 6, 0
db 4, 0EAh, 0BEh, 0A0h, 7, 89h, 5Ch, 2, 89h
db 5Ch, 6, 83h, 0C6h, 8, 83h, 3Ch, 0, 75h
db 0F2h, 0Fh, 2, 0C8h, 0C1h, 0E9h, 8, 0B8h
db 9, 0, 53h, 0CDh, 31h, 8Ch, 0D9h, 0BBh
db 10h, 0, 0B8h, 5, 2, 8Bh, 0D3h, 0C1h, 0E2h
db 2, 81h, 0C2h
db 2 dup(0), 0CDh, 31h, 73h, 3, 0E9h, 0C6h
db 0, 0FEh, 0C3h, 80h, 0FBh, 1Bh, 74h, 0F9h
db 80h, 0FBh, 1Ch, 74h, 0F4h, 80h, 0FBh
db 23h, 74h, 0EFh, 80h, 0FBh, 24h, 74h, 0EAh
db 80h, 0FBh, 2Fh, 74h, 0E5h, 80h, 0FBh
db 16h, 74h, 0E0h, 80h, 0FBh, 2Eh, 76h, 0CBh
db 0BAh, 9Eh, 0Ch, 0B3h, 21h, 0CDh, 31h
db 72h, 0CFh, 0BAh, 62h, 1Ah, 0B3h, 10h
db 0CDh, 31h, 0BAh, 56h, 5, 0B3h, 75h, 0CDh
db 31h, 16h, 1Fh, 0B8h, 0FFh, 1Fh, 0ABh
db 0A1h, 32h, 0Ch, 0B9h, 10h, 0, 0F7h, 0E1h
db 0ABh, 92h, 0AAh, 5Bh, 3, 1Eh, 46h, 0Ch
db 89h, 1Eh, 32h, 0Ch, 89h, 1Eh, 0A2h, 0Ah
db 8Bh, 0FCh, 0B8h, 0Ch, 0, 0CDh, 31h, 3
db 1Eh, 46h, 0Ch, 89h, 1Eh, 9Ch, 0Ah, 0B8h
db 8, 0, 33h, 0C9h, 0BAh, 2 dup(0FFh), 0CDh
db 31h, 40h, 8Ch, 0C9h, 0Fh, 2, 0C9h, 0C1h
db 0E9h, 8, 0CDh, 31h, 83h, 0C4h, 8, 0E8h
db 0, 3, 0B2h, 0, 86h, 16h, 80h, 9, 0BBh
db 40h, 0, 0B4h, 48h, 0CDh, 21h, 0Fh, 83h
db 3, 0, 0EBh, 2Fh, 90h, 0A3h, 4Ah, 0Ch
db 88h, 16h, 80h, 9, 8Eh, 0C0h, 33h, 0FFh
db 0Eh, 0E8h, 50h, 4, 2Eh, 66h, 8Bh, 36h
db 0F4h, 6Dh, 2Eh, 66h, 8Bh, 3Eh, 0F8h, 6Dh
db 2Eh, 66h, 8Bh, 16h, 0FCh, 6Dh, 0C7h, 6
db 0A4h, 0Ah, 7Dh, 55h, 0C7h, 6, 0A6h, 0Ah
db 54h, 55h, 0C3h

loc_18D0B:
push    20h ; ' '
call    sub_13E6D



sub_18D10 proc near
mov     bx, sp
mov     ax, [bx+2]
mov     es, word ptr locret_12802
assume es:nothing
mov     bx, ax
shr     bx, 3
or      byte ptr es:[bx], 80h
xchg    ax, bx
mov     al, byte_12550
cmp     al, 3
jnb     short loc_18D3E
push    ax
mov     byte_12550, 2
mov     es, bx
assume es:nothing
mov     dh, 3
mov     ah, 0FFh
push    bx
int     21h             ; DOS - DOS v??? - OEM FUNCTION
pop     bx
pop     ax
mov     byte_12550, al

loc_18D3E:
cmp     bx, word ptr loc_12809+1
jnz     short loc_18D4C
mov     ax, 0Ah
int     31h             ; DPMI Services   ax=func xxxxh
                        ; CREATE CODE SEGMENT ALIAS DESCRIPTOR
                        ; BX = code segment selector
                        ; Return: CF set on error
                        ; CF clear if successful, AX = new data selector
mov     word ptr loc_127F2, ax

loc_18D4C:
mov     ax, 6
int     31h             ; DPMI Services   ax=func xxxxh
                        ; GET SEGMENT BASE ADDRESS
                        ; BX = selector
                        ; Return: CF set on error
                        ; CF clear if successful, CX:DX = linear base address of segment
xchg    ax, dx
mov     dx, cx
retn
sub_18D10 endp




sub_18D55 proc near
mov     cx, word ptr loc_128BA
mov     bx, word ptr byte_12570+16h
sub     bx, cx
add     bx, seg seg003
sub     bx, seg seg002
mov     word ptr loc_11C28+2, bx
mov     ah, 4Ah ; 'J'
pusha
push    cx
push    cx
mov     ax, sp
push    ss
push    ax
push    ss
push    ax
push    21h ; '!'
push    cs
call    near ptr sub_18F14
add     sp, 1Eh
retn
sub_18D55 endp

db 8Bh, 0DCh, 36h, 8Bh, 5Fh, 2, 0B8h, 6
db 0, 0CDh, 31h, 56h, 57h, 33h, 0F6h, 0Fh
db 3, 0FBh, 83h, 0C7h, 1, 13h, 0F6h, 8Bh
db 0D9h, 8Bh, 0CAh, 0B8h, 2, 7, 0CDh, 31h
db 5Fh, 5Eh, 0C3h, 0E8h, 0E0h, 0F8h, 83h
db 0E8h, 0DCh, 0F8h, 80h

loc_18DAC:
mov     bp, sp
mov     di, [bp+2]
mov     ax, cs:word_13C4E
mov     ds, ax
assume ds:nothing
mov     ss, ax
assume ss:nothing
mov     sp, ds:0F50h
push    di
mov     dx, word ptr cs:byte_12B22+1Dh
mov     cx, word ptr cs:byte_12B22+1Fh
mov     ax, 304h
int     31h             ; DPMI Services   ax=func xxxxh
                        ; FREE REAL MODE CALL-BACK ADDRESS
                        ; CX:DX = real mode call-back address
                        ; Return: CF set on error
                        ; CF clear if successful
push    edx
xor     edx, edx
mov     si, 0F8Ah
mov     bl, 8
mov     ax, 201h

loc_18DDA:
mov     dx, [si]
mov     cx, [si+2]
int     31h             ; DPMI Services   ax=func xxxxh
                        ; SET REAL MODE INTERRUPT VECTOR
                        ; BL = interrupt number, CX:DX = segment:offset of real mode handler
                        ; Return: CF set on error
                        ; CF clear if successful
inc     bl
add     si, 4
cmp     bl, 2Eh ; '.'
jbe     short loc_18DDA
mov     bl, 0

loc_18DED:
mov     ax, 200h
int     31h             ; DPMI Services   ax=func xxxxh
                        ; GET REAL MODE INTERRUPT VECTOR
                        ; BL = interrupt number
                        ; Return: CF clear, CX:DX = segment:offset of real mode interrupt handler
cmp     cx, ds:9B6h
jnz     short loc_18E05
mov     dx, ds:56h
mov     cx, ds:58h
mov     ax, 201h
int     31h             ; DPMI Services   ax=func xxxxh
                        ; SET REAL MODE INTERRUPT VECTOR
                        ; BL = interrupt number, CX:DX = segment:offset of real mode handler
                        ; Return: CF set on error
                        ; CF clear if successful

loc_18E05:
inc     bl
jnz     short loc_18DED
push    ds
pop     es
assume es:nothing
mov     di, 0C0h
push    cs
call    near ptr sub_191E4
mov     es, word ptr ds:0C4Ah
assume es:nothing
xor     di, di
push    cs
call    near ptr sub_19171
pop     edx
pop     ax
mov     ah, 4Ch
int     21h             ; DOS - 2+ - QUIT WITH EXIT CODE (EXIT)
                        ; AL = exit code
cmp     ax, 0BF02h
jz      short locret_18E3A
cmp     ax, 0BFDCh
jz      short loc_18E32
jmp     cs:dword_12E94

loc_18E32:
mov     si, 98h
mov     dx, cs:seg_11BD0

locret_18E3A:
iret
; START OF FUNCTION CHUNK FOR sub_18E40

loc_18E3B:
push    1Fh
call    sub_13E6D
; END OF FUNCTION CHUNK FOR sub_18E40



sub_18E40 proc far

; FUNCTION CHUNK AT 726B SIZE 00000005 BYTES

sub     sp, 54h
mov     bp, sp
mov     ds:0F50h, sp
sub     sp, 80h
call    sub_1490E
call    sub_1553B
push    810h
call    sub_10B12
xchg    ax, cx
jcxz    short loc_18ECD
call    sub_13FFE
add     ax, 800h
and     al, 0FEh
mov     ds:0C48h, ax
cmp     byte ptr ds:0C42h, 0
jnz     short loc_18E7E
mov     ax, 0BF02h
xor     si, si
xor     dx, dx
call    near ptr byte_12AC4
or      si, dx
jnz     short loc_18E3B

loc_18E7E:
mov     ah, 35h ; '5'
mov     al, ds:34h
int     21h             ; DOS - 2+ - GET INTERRUPT VECTOR
                        ; AL = interrupt number
                        ; Return: ES:BX = value of interrupt vector
push    cs
pop     ds
assume ds:seg002
mov     word ptr dword_12E94, bx
mov     word ptr dword_12E94+2, es
mov     dx, 7253h
mov     ah, 25h
int     21h             ; DOS - SET INTERRUPT VECTOR
                        ; AL = interrupt number
                        ; DS:DX = new vector to be used for specified interrupt
push    ss
pop     ds
assume ds:nothing
mov     word ptr ds:0AC2h, 7302h
call    loc_189D0
push    bp
call    sub_166ED
call    sub_14947
mov     es, word ptr [bp+2]
mov     di, [bp+0Eh]
mov     ax, [bp+1Eh]
stosw
mov     ax, [bp+22h]
stosw
mov     ax, [bp+26h]
stosw
mov     bx, [bp+4]
mov     ax, es
mov     ss, ax
assume ss:nothing
lea     sp, [di-6]
mov     ds:0F50h, bp
mov     ds, bx
assume ds:nothing
mov     es, bx
iret

loc_18ECD:
push    0Dh
call    sub_13E6D
call    sub_12F7D
pop     cx
pop     ax
mov     ah, 4Ch
int     21h             ; DOS - 2+ - QUIT WITH EXIT CODE (EXIT)
sub_18E40 endp ; sp-analysis failed ; AL = exit code

db 0E8h, 0A9h, 0F7h, 81h, 90h, 32h dup(0)
db 87h, 0DBh


; Attributes: bp-based frame

sub_18F14 proc far

arg_0= byte ptr  6
arg_2= dword ptr  8
arg_6= dword ptr  0Ch

push    bp
mov     bp, sp
push    si
push    edi
xor     edi, edi
push    ds
push    es
pushf
cli
mov     es, cs:word_13C4E
assume es:nothing
mov     di, es:0C48h
sub     word ptr es:0C48h, 200h
sub     di, 32h ; '2'
push    di
xor     ax, ax
cld
lds     si, [bp+arg_2]
push    si
add     si, 4
mov     cx, 8

loc_18F43:
movsw
stosw
loop    loc_18F43
stosw
pop     si
lodsw
movsw
stosw
xor     ax, ax
stosw
stosw
mov     ds, cs:word_13C4E
assume ds:nothing
mov     al, [bp+arg_0]
mov     si, ax
shl     si, 2
mov     dx, ds:0C2Ch
sub     ax, 8
cmp     ax, 26h ; '&'
ja      short loc_18F78
mov     bx, ax
cmp     byte ptr [bx+10C6h], 0
jz      short loc_18F78
add     si, 0F6Ah
mov     dx, ds

loc_18F78:
mov     ds, dx
movsw
movsw
pop     ax
stosw
mov     ax, seg seg000
stosw
sub     di, 32h ; '2'
xor     bx, bx
mov     ax, 302h
int     31h             ; DPMI Services   ax=func xxxxh
                        ; CALL REAL MODE PROC WITH IRET FRAME
                        ; CX = number of words to copy from protected mode to real mode stack
                        ; ES:DI / ES:EDI = selector:offset of real mode call structure
                        ; Return: CF set on error
                        ; CF clear if successful
mov     ax, 0
jb      short loc_18FB4
mov     ds, cs:word_13C4E
mov     si, ds:0C48h
add     si, 1CEh
les     di, [bp+arg_6]
assume es:nothing
mov     ax, [si+24h]
stosw
mov     ax, [si+22h]
stosw
mov     ax, [si+20h]
mov     cx, 8

loc_18FAF:
movsw
inc     si
inc     si
loop    loc_18FAF

loc_18FB4:
add     word ptr ds:0C48h, 200h
pop     cx
and     cx, 200h
jcxz    short loc_18FC2
sti

loc_18FC2:
pop     es
pop     ds
assume ds:nothing
pop     edi
pop     si
pop     bp
retf
sub_18F14 endp

push    esi
push    edi
xor     esi, esi
xor     edi, edi
push    ds
mov     di, 7310h
mov     es, word ptr ds:0C30h
mov     si, 742Ah
push    cs
pop     ds
assume ds:seg002
mov     ax, 303h
int     31h             ; DPMI Services   ax=func xxxxh
                        ; ALLOCATE REAL MODE CALL-BACK ADDRESS
                        ; DS:SI=selector:offset of procedure to call
                        ; ES:DI=selector:offset of real mode call structure
                        ; Return: CF set on error
                        ; CF clear if ok, CX:DX = segment:offset of real mode call address
mov     ax, 0
jb      short loc_18FF4
mov     di, 0F6Eh
mov     al, 0EAh
stosb
xchg    ax, dx
stosw
xchg    ax, cx
stosw

loc_18FF4:
pop     ds
assume ds:nothing
pop     edi
pop     esi
retn
db 66h, 81h, 0EEh, 86h, 3 dup(0), 67h, 66h
db 89h, 26h, 67h, 8Ch, 56h, 4, 8Ch, 0D8h
db 8Eh, 0D0h, 66h, 8Bh, 0E6h, 83h, 0ECh
db 32h, 8Bh, 0ECh, 67h, 8Bh, 9Eh, 86h, 3 dup(0)
db 2Eh, 8Ah, 7, 2Eh, 8Eh, 1Eh, 7Eh, 20h
db 8Eh, 1Eh, 30h, 0Ch, 0A2h, 0A3h, 74h, 0EBh
db 0, 0FCh, 6, 66h, 57h, 66h, 5Eh, 1Fh, 16h
db 6Ah, 0, 55h, 66h, 5Fh, 7, 66h, 0B9h, 19h
db 3 dup(0), 0F3h, 67h, 0A5h, 66h, 8Bh, 86h
db 0BAh, 0, 66h, 89h, 46h, 2Ah, 8Dh, 86h
db 0C0h, 0, 89h, 46h, 2Eh, 66h, 8Bh, 46h
db 1Ch, 66h, 8Bh, 5Eh, 10h, 66h, 8Bh, 4Eh
db 18h, 66h, 8Bh, 56h, 14h, 66h, 8Bh, 76h
db 4, 66h, 8Bh, 7Eh, 0, 66h, 55h, 66h, 8Bh
db 6Eh, 8, 0CDh, 0, 66h
push    bp
mov     bp, sp
movzx   ebp, word ptr [bp+4]
pop     large dword ptr [bp+8]
mov     [bp+1Ch], eax
mov     [bp+10h], ebx
mov     [bp+18h], ecx
mov     [bp+14h], edx
mov     [bp+4], esi
mov     [bp+0], edi
pushf
pop     ax
and     word ptr [bp+20h], 0FFBEh
and     ax, 41h
or      [bp+20h], ax
pop     eax
mov     ax, ss
mov     ds, ax
mov     si, bp
mov     es, cs:word_13C4E
assume es:nothing
mov     es, word ptr es:0C30h
assume es:nothing
mov     di, 7310h
mov     cx, 19h
cld
rep movsw
xor     edi, edi
mov     di, 7310h
lss     esp, [ebp+32h]
iretd



sub_190CE proc far
mov     ax, 1600h
int     2Fh             ; - Multiplex - MS WINDOWS - ENHANCED WINDOWS INSTALLATION CHECK
                        ; Return: AL = anything else
                        ; AL = Windows major version number >= 3
                        ; AH = Windows minor version number
test    al, 7Fh
jz      short locret_1912A
cmp     al, 3
jnz     short locret_1912A
cmp     ah, 0Ah
jnb     short locret_1912A
mov     ax, 4300h
int     2Fh             ; - Multiplex - XMS - INSTALLATION CHECK
                        ; Return: AL = 80h XMS driver installed
                        ; AL <> 80h no driver
cmp     al, 80h
jnz     short loc_1912B
push    es
push    bp
mov     ax, 4310h
int     2Fh             ; - Multiplex - XMS - GET DRIVER ADDRESS
                        ; Return: ES:BX -> driver entry point
push    es
push    bx
mov     bp, sp
mov     ah, 9
mov     dx, 40h ; '@'
call    dword ptr [bp+0]
dec     ax
jnz     short loc_1912B
push    ax
push    ax
push    dx
push    ds
push    ax
push    ax
push    1
push    ax
mov     si, sp
mov     ah, 0Bh
call    dword ptr [bp+0]
dec     ax
jnz     short loc_1912B
mov     ax, 1681h
int     2Fh             ; - Multiplex - MS WINDOWS -  3+ - BEGIN CRITICAL SECTION
mov     cs:byte_188FB, al
mov     ah, 0Bh
call    dword ptr [bp+0]
mov     ah, 0Ah
call    dword ptr [bp+0]
add     sp, 14h
pop     bp
pop     es

locret_1912A:
retn

loc_1912B:
push    21h ; '!'
call    sub_13E6D
push    ds
mov     ds, cs:word_13C4E
assume ds:nothing
inc     byte ptr ds:0C43h
pop     ds
assume ds:nothing
iret
sub_190CE endp ; sp-analysis failed

mov     dx, cs
and     dx, 7
or      dx, 8
jmp     short loc_19169

loc_19146:
add     bl, bl
lar     ax, dx
jmp     short $+2

loc_1914D:
jnz     loc_1915B
test    ah, 93h
jz      loc_1915B
or      bl, 1

loc_1915B:
add     dx, ds:0C46h
jo      locret_19170
loop    loc_19146
mov     es:[di], bl
inc     di

loc_19169:
xor     bl, bl
mov     cx, 8
jmp     short loc_19146

locret_19170:
retf



sub_19171 proc far
mov     cx, es
jcxz    short locret_191B0
mov     bx, cs
and     bx, 7
or      bx, 8
jmp     short loc_191A8

loc_1917F:
test    dl, 80h
jnz     loc_1919B
lar     ax, bx
jmp     short $+2

loc_1918B:
jnz     loc_1919B
test    ah, 93h
jz      loc_1919B
mov     ax, 1
int     31h             ; DPMI Services   ax=func xxxxh
                        ; FREE LDT DESCRIPTOR
                        ; BX = selector to free
                        ; Return: CF set on error
                        ; CF clear if successful

loc_1919B:
add     dl, dl
add     bx, ds:0C46h
jo      locret_191B0
loop    loc_1917F
inc     di

loc_191A8:
mov     dl, es:[di]
mov     cx, 8
jmp     short loc_1917F

locret_191B0:
retf
sub_19171 endp

mov     ax, 204h
xor     bx, bx

loc_191B6:              ; DPMI Services   ax=func xxxxh
int     31h             ; GET PROTECTED MODE INTERRUPT VECTOR
                        ; BL = interrupt number
                        ; Return: CF set on error
                        ; CF clear if successful, CX:DX / CX:EDX = selector:offset of handler
mov     es:[di], edx
mov     es:[di+4], cx
add     di, 6
inc     bx
cmp     bx, 0FFh
jbe     short loc_191B6
mov     ax, 202h
xor     bl, bl

loc_191CF:              ; DPMI Services   ax=func xxxxh
int     31h             ; GET PROCESSOR EXCEPTION HANDLER VECTOR
                        ; BL = exception number (00h-1Fh)
                        ; Return: CF set on error
                        ; CF clear if successful, CX:DX / CX:EDX = selector:offset of handler
mov     es:[di], edx
mov     es:[di+4], cx
add     di, 6
inc     bl
cmp     bl, 1Fh
jbe     short loc_191CF
retf



sub_191E4 proc far
mov     cx, es
jcxz    short locret_1921A
mov     ax, 205h
xor     bx, bx

loc_191ED:
mov     edx, es:[di]
mov     cx, es:[di+4]
int     31h             ; DPMI Services   ax=func xxxxh
                        ; SET PROTECTED MODE INTERRUPT VECTOR
                        ; BL = interrupt number, CX:DX / CX:EDX = selector:offset of handler
                        ; Return: CF set on error
                        ; CF clear if successful
add     di, 6
inc     bx
cmp     bx, 0FFh
jbe     short loc_191ED
mov     ax, 203h
xor     bl, bl

loc_19206:
mov     edx, es:[di]
mov     cx, es:[di+4]
int     31h             ; DPMI Services   ax=func xxxxh
                        ; SET PROCESSOR EXCEPTION HANDLER VECTOR
                        ; BL = exception number (00h-1Fh), CX:DX / CX:EDX = selector:offset of handler
                        ; Return: CF set on error
                        ; CF clear if successful
add     di, 6
inc     bl
cmp     bl, 1Fh
jbe     short loc_19206

locret_1921A:
retf
sub_191E4 endp




sub_1921B proc near
mov     al, ds:47h
mov     dx, 2CDEh
cmp     byte ptr ds:2Eh, 0Bh
jnz     short loc_1923E
test    al, 80h
jz      short loc_1922F

loc_1922C:
mov     dx, 2CE5h

loc_1922F:
mov     bx, 0F7Dh
mov     byte ptr cs:[bx-3], 0E9h
sub     dx, bx
mov     cs:[bx-2], dx

locret_1923D:
retn

loc_1923E:
test    al, 80h
jz      short locret_1923D
mov     bx, 2CF6h
mov     byte ptr cs:[bx-3], 0E9h
mov     dx, 0F7Fh
sub     dx, bx
mov     cs:[bx-2], dx
jmp     short loc_1922C
sub_1921B endp

byte_19255 db 0



sub_19256 proc near
push    0
pop     ds
assume ds:nothing
push    si
push    di
mov     si, 19Ch
mov     di, [si]
push    di
mov     cx, [si+2]
push    cx
cmp     di, ss:56h
jnz     short loc_1927A
cmp     cx, ss:58h
jnz     short loc_1927A
mov     word ptr [si], 772Bh
mov     word ptr [si+2], cs

loc_1927A:              ;  - LIM EMS
int     67h
pop     word ptr [si+2]
pop     word ptr [si]
pop     di
pop     si
push    ss
pop     ds
assume ds:nothing
retn
sub_19256 endp




sub_19286 proc far
push    si
push    di
call    sub_1853B
mov     ax, 3567h
int     21h             ; DOS - 2+ - GET INTERRUPT VECTOR
                        ; AL = interrupt number
                        ; Return: ES:BX = value of interrupt vector
mov     cx, es
cmp     cx, ds:58h
jz      short loc_19301
cmp     word ptr es:0Bh, 4D4Dh
jnz     short loc_19301
cmp     word ptr es:0Eh, 5858h
jnz     short loc_19301
cmp     byte ptr es:0Ah, 45h ; 'E'
jnz     short loc_19301
cmp     byte ptr es:0Dh, 58h ; 'X'
jnz     short loc_19301
cmp     byte ptr es:11h, 30h ; '0'
jnz     short loc_19301
test    byte ptr ds:47h, 80h
jnz     short loc_192FC
test    byte ptr ds:14h, 2
jnz     short loc_192FC
mov     ax, 0DE00h
int     67h             ;  - LIM EMS Program Interface - INSTALLATION CHECK
                        ; Return: AH = 00h    VCPI is present, BH = major version number
                        ; BL = minor version number, AH nonzero  VCPI not present
or      ah, ah
jz      short loc_192FC
mov     ah, 43h ; 'C'
mov     bx, 1
int     67h             ;  - LIM EMS - GET HANDLE AND ALLOCATE MEMORY
                        ; BX = number of logical pages to allocate
                        ; Return: AH = status
or      ah, ah
jnz     short loc_19301
mov     cs:word_14695, dx
jmp     short loc_19301

loc_192EB:
call    sub_18284
push    ax
call    sub_14697
xor     ax, ax
pop     cx
jcxz    short loc_192F8
dec     ax

loc_192F8:
pop     di
pop     si
retn
iret

loc_192FC:
call    sub_18284
jz      short loc_192EB

loc_19301:
mov     ax, 0DE00h
call    sub_19256
or      ah, ah
jnz     short loc_192EB
mov     ax, 0DE0Ah
int     67h             ;  - LIM EMS Program Interface - GET 8259 INTERRUPT VECTOR MAPPINGS
                        ; Return: AH = 00h successful, BX = first vector used by master 8259 (IRQ0)
                        ; CX = first vector used by slave 8259 (IRQ8)
                        ; AH nonzero: failed
or      ah, ah
jnz     short loc_192EB
mov     ds:50h, bl
mov     ds:51h, cl
mov     byte ptr ds:2Eh, 0Bh
call    sub_14C94
call    sub_153F9
cmp     word ptr ds:0DECh, 602h
jb      short loc_19341
mov     word ptr ds:0DEEh, 4
mov     word ptr ds:0DF0h, 0FC00h
mov     word ptr ds:0DF2h, 801h

loc_19341:
mov     al, ds:47h
and     al, 80h
or      al, ds:0A16h
mov     ah, ds:15h
and     ah, 20h
or      al, ah
mov     cs:byte_19255, al
xor     si, si
xor     dx, dx
mov     ax, 0BF02h
test    byte ptr ds:14h, 10h
jz      short loc_19367
mov     al, 0DCh

loc_19367:
call    near ptr byte_12AC4
or      dx, dx
jz      short loc_193C5
push    ds
pop     es
mov     ds, dx
mov     di, 98h
cmp     dword ptr [si], 40000h
setnbe  byte ptr ss:0DFFh
jbe     short loc_19394
test    byte ptr ss:15h, 10h
jnz     short loc_19394
cmp     byte ptr ss:0A16h, 0
jnz     short loc_193C5

loc_19394:
mov     cx, 0Ch
rep movsw
push    es
pop     ds
mov     eax, ds:98h
shr     eax, 6
mov     ds:0ECAh, ax
mov     eax, ds:9Ch
shr     eax, 6
sub     ax, ds:0ECAh
mov     ds:0ECEh, ax
cmp     dx, ds:0A2h
jnz     short loc_193C2
test    byte ptr ds:47h, 80h
jnz     short loc_19411

loc_193C2:
jmp     loc_19470

loc_193C5:
push    ss
pop     ds
call    sub_196D3
mov     dx, bx
cmp     dx, 4
jb      short loc_193DC
mov     al, cs:byte_19255
mov     ds:0DFFh, al
or      al, al
jnz     short loc_193F3

loc_193DC:
mov     ax, 3000h
cmp     ds:0ECCh, ax
jb      short loc_193E8
mov     ds:0ECCh, ax

loc_193E8:
cmp     dx, 300h
jbe     short loc_193F3
mov     dx, 3000h
jmp     short loc_193F9

loc_193F3:
shl     dx, 4
call    sub_196EF

loc_193F9:
mov     ds:0ECEh, dx
add     dx, 2FFFh
jnb     short loc_1940A
mov     dx, 0EF00h
mov     ds:0ECEh, dx

loc_1940A:
cmp     byte ptr ds:0DFFh, 0
jz      short loc_19419

loc_19411:
mov     dx, 2000h
mov     byte ptr ds:0DFFh, 1

loc_19419:
and     dx, 0F000h
mov     ds:0E00h, dh
push    dx
mov     ax, ds
shl     ax, 4
add     ax, ds:0CDCh
and     ah, 0Fh
neg     ax
add     ah, 10h
push    ax
add     ax, dx
push    ax
call    sub_10B12
call    sub_18173
pop     cx
cmp     ax, 0FFFFh
jnz     short loc_1944A

loc_19445:
push    17h
call    sub_13E6D

loc_1944A:
pop     cx
add     ax, cx
shr     ax, 4
mov     dx, es
add     ax, dx
or      al, al
jz      loc_1945F
push    18h
call    sub_13E6D

loc_1945F:
mov     ds:0AAh, ax
mov     ds:0DF4h, ax
mov     es, ax
xor     di, di
pop     cx
shr     cx, 1
xor     ax, ax
rep stosw

loc_19470:
cmp     byte ptr ds:0DFFh, 0
jz      short loc_19489
or      byte ptr ds:0A16h, 1
test    byte ptr ds:11D2h, 1
jnz     short loc_19489
mov     word ptr ds:0ECCh, 0EF00h

loc_19489:
mov     ax, ds
mov     bx, 10h
mul     bx
add     ds:0D34h, ax
adc     ds:0D36h, dx
add     ds:0D3Ch, ax
adc     ds:0D3Eh, dx
add     ds:0D40h, ax
adc     ds:0D42h, dx
add     ax, 0D74h
adc     dx, 0
mov     ds:91Ah, ax
mov     ds:91Ch, dl
mov     ax, ds:0AAh
inc     ah
mov     es, ax
xor     di, di
mov     si, 940h
mov     ax, 0DE01h
int     67h             ;  - LIM EMS Program Interface - GET PROTECTED MODE INTERFACE
                        ; ES:DI -> 4K page table buffer
                        ; DS:SI -> three descriptor table entries in GDT
                        ; Return: AH = 00h successful, AH = nonzero  failed
or      ah, ah
jz      short loc_194D2

loc_194CA:
call    sub_14697
push    19h
call    sub_13E6D

loc_194D2:
mov     ds:0D5Ah, ebx
cmp     di, 1000h
jnb     short loc_194E0
mov     di, 1000h

loc_194E0:
mov     ds:0ECAh, di
mov     al, ds:0E00h
or      al, al
jz      loc_1956C
xchg    ax, di
cmp     byte ptr ds:0DFFh, 0
jz      short loc_194FB
mov     ax, 1040h
mov     ds:0ECAh, ax

loc_194FB:
mov     bx, 40h ; '@'
mul     bx
mov     ds:0ACh, ax
mov     ds:0AEh, dx
mov     ax, ds:0ECEh
add     ax, ds:0ECAh
cmp     byte ptr ds:0DFFh, 0
jnz     short loc_1951D
cmp     ax, 4000h
jb      short loc_1951D
mov     ax, 4000h

loc_1951D:
mov     ds:0ECEh, ax
test    byte ptr ds:47h, 1
jz      short loc_1952C
mov     ah, 88h
call    near ptr byte_12AC4

loc_1952C:
mov     ds:0A8h, ax
call    sub_19755
mov     cl, ds:0E00h
xor     ch, ch
shr     cx, 3
dec     cx
dec     cx
mov     si, es
mov     ds, si
sub     si, 100h
mov     es, si
assume es:nothing
shr     si, 6
lodsd
xor     di, di
rep movsw
push    ss
pop     ds

loc_19552:
mov     ds:0D38h, eax
mov     ds:0D90h, eax
mov     ax, 1
mov     word ptr ds:0AA4h, 3CD0h
mov     word ptr ds:0AA6h, 3D23h
pop     di
pop     si
retn

loc_1956C:
mov     eax, ds:98h
shr     eax, 6
mov     ds:0ECAh, ax
mov     eax, ds:9Ch
shr     eax, 6
mov     ds:0ECEh, ax
mov     cx, ds:0AAh
mov     si, cx
shr     si, 6
inc     ch
mov     es, cx
assume es:nothing
mov     eax, es:[si]
jmp     short loc_19552
sub_19286 endp ; sp-analysis failed

word_19595 dw 0
dword_19597 dd 0
; START OF FUNCTION CHUNK FOR sub_19801

loc_1959B:
mov     ax, 0BFDEh
mov     bx, 5
call    near ptr byte_12AC4
or      ax, ax
jz      short loc_195C9
mov     es, word ptr ss:0AAh
mov     di, 4
mov     eax, es:[di-4]
mov     cs:dword_19597, eax
rep movsd
push    ss
pop     ds
mov     ax, 0BFDEh
mov     bx, 0Bh
call    near ptr byte_12AC4
retn

loc_195C9:
mov     cs:word_19595, cx
shl     cx, 2
add     cx, di
movzx   ecx, cx
mov     ax, es
movzx   eax, ax
shl     eax, 4
movzx   edi, di
add     edi, eax
add     ecx, eax
push    ecx
push    edi
call    sub_11E60
push    38h ; '8'
pop     es
assume es:nothing
pop     edi
pop     ebx

loc_195F9:
call    far ptr 70h:55B0h
or      ax, ax
jz      short loc_19614

loc_19602:
cmp     edi, ebx
jb      short loc_195F9
jz      short loc_19614
sub     edi, 4
mov     byte ptr es:[edi], 0
jmp     short loc_19602

loc_19614:
push    ax
call    sub_124FC
pop     ax
or      ax, ax
jz      loc_194CA
mov     cx, cs:word_19595
jmp     loc_1959B
; END OF FUNCTION CHUNK FOR sub_19801


; Attributes: bp-based frame

sub_19627 proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
push    di
push    si
call    sub_11E60
movzx   ecx, cs:word_19595
jcxz    short loc_196B1
movzx   esi, word ptr ds:0AAh
push    38h ; '8'
pop     ds
assume ds:nothing
shl     esi, 4
mov     edi, esi
add     edi, 1C00h
mov     edx, cs:dword_19597
xchg    edx, [esi]
add     si, 4
mov     eax, cr3
mov     cr3, eax
lods    dword ptr [esi]
mov     ebx, eax
xchg    eax, [edi]
mov     ds:300000h, ebx
mov     [edi], eax
mov     [esi-8], edx
mov     eax, cr3
mov     cr3, eax
mov     edi, 400004h
push    ds
pop     es
mov     bx, cx
dec     cx
rep movs dword ptr es:[edi], dword ptr [esi]
mov     cx, bx
shl     cx, 0Ah
sub     cx, bx
xor     eax, eax
rep stos dword ptr es:[edi]
push    ss
pop     ds
assume ds:nothing
mov     cx, ds:0DFAh
jcxz    short loc_196B1
mov     esi, 3FF000h
call    sub_19788

loc_196B1:
push    large [bp+arg_0]
push    large [dword ptr ds:98h]
call    far ptr 70h:561Bh
add     sp, 8
push    ax
call    sub_124FC
pop     ax
inc     ax
pop     si
pop     di
mov     cs:word_19595, 0
pop     bp
retn
sub_19627 endp




sub_196D3 proc near
xor     bx, bx
xor     dx, dx
mov     ah, 42h ; 'B'
call    sub_19256
or      bx, bx
jnz     locret_196EE
mov     ax, 0DE03h
call    sub_19256
shr     edx, 2
mov     bx, dx

locret_196EE:
retn
sub_196D3 endp




sub_196EF proc near
push    dx
push    word ptr ds:0ECCh
call    sub_196D3
mov     si, bx
mov     di, dx
call    sub_18834
pop     cx
pop     dx
xchg    cx, ds:0ECCh
or      ax, ax
jz      short locret_1974A
push    dx
push    cx
call    sub_196D3
pop     cx
pop     ax
cmp     di, dx
xchg    ax, dx
jnz     short loc_1974B
cmp     si, bx
jnz     short loc_1974B
add     dx, ds:0ECEh
cmp     byte ptr ds:0DFFh, 0
jnz     loc_19730
cmp     dx, 3000h
jbe     loc_19730
mov     dx, 3000h

loc_19730:
mov     ax, ds:0ECAh
mov     bx, ax
add     ax, cx
and     al, 0FCh
add     bx, 3
and     bl, 0FCh
sub     ax, bx
mov     ds:0ECAh, bx
mov     ds:0DFAh, ax
or      ax, ax

locret_1974A:
retn

loc_1974B:
push    dx
call    sub_139BC
pop     dx
retn
sub_196EF endp

dword_19751 dd 0



sub_19755 proc near
movzx   eax, word ptr ds:0DFAh
shl     eax, 0Ah
mov     ds:0AA8h, eax
jz      short locret_1974A
mov     eax, ds:98h
mov     cs:dword_19751, eax
cmp     byte ptr ds:0DFFh, 0
jnz     short locret_1974A
push    si
push    di
mov     cx, ds:0AAh
inc     ch
mov     es, cx
assume es:nothing
xor     esi, esi
call    sub_19788
pop     di
pop     si
retn
sub_19755 endp




sub_19788 proc near
mov     eax, cs:dword_19751
movzx   edi, word ptr ds:0ECAh
mov     ebx, 1000h
mov     cx, ds:0DFAh
add     cx, di
shl     eax, 4
add     eax, ebx
dec     eax
and     ax, 0F000h
or      ax, 0C07h

loc_197AE:
cmp     di, cx
jnb     short loc_197C0
mov     es:[esi+edi], eax
add     di, 4
add     eax, ebx
jmp     short loc_197AE

loc_197C0:
shl     edi, 6
mov     ds:0ACh, edi
retn
sub_19788 endp

; START OF FUNCTION CHUNK FOR sub_19801

loc_197CA:
mov     cs:word_19595, cx
mov     es, word ptr ds:0AAh
mov     di, 4
mov     eax, es:[di-4]
mov     cs:dword_19597, eax
cmp     byte ptr ds:0E00h, 0
jz      short nullsub_6

loc_197E7:
mov     ax, 0DE04h
int     67h             ;  - LIM EMS Program Interface - ALLOCATE A 4K PAGE
                        ; Return: AH = 00h successful, EDX = physical address of allocated page
                        ; AH nonzero: failed
or      ah, ah
jnz     loc_19445
inc     word ptr ds:0DF6h
or      dx, 807h
xchg    eax, edx
stosd
loop    loc_197E7
; END OF FUNCTION CHUNK FOR sub_19801
; [00000001 BYTES: COLLAPSED FUNCTION nullsub_6. PRESS CTRL-NUMPAD+ TO EXPAND]



sub_19801 proc near

; FUNCTION CHUNK AT 79CB SIZE 0000008C BYTES
; FUNCTION CHUNK AT 7BFA SIZE 00000036 BYTES

cmp     byte ptr ds:0E00h, 0
jz      short nullsub_6
call    sub_1356A
call    sub_11D3C
cmp     byte ptr ds:0DFFh, 0
jz      short loc_1982B
mov     cx, ds:0ECEh
sub     cx, 1000h
shr     cx, 0Ch
inc     cx
test    byte ptr ds:47h, 80h
jz      short loc_197CA
jmp     loc_1959B

loc_1982B:
mov     cx, ds:0DFAh
jcxz    short nullsub_6
cmp     word ptr ds:0ADCh, 0
jz      short nullsub_6
push    si
push    di
movzx   eax, word ptr ds:0ECAh
shl     eax, 0Ah
mov     edx, ds:98h
shl     edx, 4
sub     edx, eax
neg     edx
and     dh, 0Fh
push    eax
or      ax, 0EEEh
push    eax
mov     bx, sp
push    0
push    dx
push    word ptr ds:0ADCh
push    ss
push    bx
push    0
push    0
push    4
mov     si, sp
mov     edi, 1000h
shr     cx, 2

loc_19879:
mov     ah, 0Bh
call    dword ptr ds:0AECh
or      ax, ax
jz      short loc_198C0
add     [bx], edi
add     [si+0Ch], edi
loop    loc_19879
call    sub_11E60
push    38h ; '8'
pop     es
assume es:nothing
mov     bx, sp
mov     ebx, [bx+14h]
mov     eax, ebx
or      ax, 0EEEh
mov     cx, ds:0DFAh
shr     cx, 2

loc_198A5:
cmp     eax, es:[ebx]
jnz     short loc_198BD
add     ebx, edi
add     eax, edi
loop    loc_198A5
call    sub_124FC

loc_198B7:
add     sp, 18h
pop     di
pop     si
retn

loc_198BD:
call    sub_124FC

loc_198C0:
mov     cx, ds:0DFAh
add     ds:0ECAh, cx
mov     ax, ds:0AAh
add     ah, 2
mov     es, ax
assume es:nothing
xor     ax, ax
xor     di, di
shr     cx, 1
rep stosw
call    sub_139BC
jmp     short loc_198B7
sub_19801 endp

align 4
seg002 ends


; Segment type: Pure code
seg003 segment byte public 'CODE' use16
assume cs:seg003
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing
byte_198E0 db 0E8h, 0FDh, 3, 0, 0E8h, 0F9h, 3, 1, 0E8h
db 0F5h, 3, 2, 0E8h, 0F1h, 2 dup(3), 0E8h
db 0EDh, 3, 4, 0E8h, 0E9h, 3, 5, 0E8h, 0E5h
db 3, 6, 0E8h, 0E1h, 3, 7, 0E8h, 0DDh, 3
db 8, 0E8h, 0D9h, 3, 9, 0E8h, 0D5h, 3, 0Ah
db 0E8h, 0D1h, 3, 0Bh, 0E8h, 0CDh, 3, 0Ch
db 0E8h, 0C9h, 3, 0Dh, 0E8h, 0C5h, 3, 0Eh
db 0E8h, 0C1h, 3, 0Fh, 0E8h, 0BDh, 3, 10h
db 0E8h, 0B9h, 3, 11h, 0E8h, 0B5h, 3, 12h
db 0E8h, 0B1h, 3, 13h, 0E8h, 0ADh, 3, 14h
db 0E8h, 0A9h, 3, 15h, 0E8h, 0A5h, 3, 16h
db 0E8h, 0A1h, 3, 17h, 0E8h, 9Dh, 3, 18h
db 0E8h, 99h, 3, 19h, 0E8h, 95h, 3, 1Ah
db 0E8h, 91h, 3, 1Bh, 0E8h, 8Dh, 3, 1Ch
db 0E8h, 89h, 3, 1Dh, 0E8h, 85h, 3, 1Eh
db 0E8h, 81h, 3, 1Fh, 0E8h, 7Dh, 3, 20h
db 0E8h, 79h, 3, 21h, 0E8h, 75h, 3, 22h
db 0E8h, 71h, 3, 23h, 0E8h, 6Dh, 3, 24h
db 0E8h, 69h, 3, 25h, 0E8h, 65h, 3, 26h
db 0E8h, 61h, 3, 27h, 0E8h, 5Dh, 3, 28h
db 0E8h, 59h, 3, 29h, 0E8h, 55h, 3, 2Ah
db 0E8h, 51h, 3, 2Bh, 0E8h, 4Dh, 3, 2Ch
db 0E8h, 49h, 3, 2Dh, 0E8h, 45h, 3, 2Eh
db 0E8h, 41h, 3, 2Fh, 0E8h, 3Dh, 3, 30h
db 0E8h, 39h, 3, 31h, 0E8h, 35h, 3, 32h
db 0E8h, 31h, 3, 33h, 0E8h, 2Dh, 3, 34h
db 0E8h, 29h, 3, 35h, 0E8h, 25h, 3, 36h
db 0E8h, 21h, 3, 37h, 0E8h, 1Dh, 3, 38h
db 0E8h, 19h, 3, 39h, 0E8h, 15h, 3, 3Ah
db 0E8h, 11h, 3, 3Bh, 0E8h, 0Dh, 3, 3Ch
db 0E8h, 9, 3, 3Dh, 0E8h, 5, 3, 3Eh, 0E8h
db 1, 3, 3Fh, 0E8h, 0FDh, 2, 40h, 0E8h, 0F9h
db 2, 41h, 0E8h, 0F5h, 2, 42h, 0E8h, 0F1h
db 2, 43h, 0E8h, 0EDh, 2, 44h, 0E8h, 0E9h
db 2, 45h, 0E8h, 0E5h, 2, 46h, 0E8h, 0E1h
db 2, 47h, 0E8h, 0DDh, 2, 48h, 0E8h, 0D9h
db 2, 49h, 0E8h, 0D5h, 2, 4Ah, 0E8h, 0D1h
db 2, 4Bh, 0E8h, 0CDh, 2, 4Ch, 0E8h, 0C9h
db 2, 4Dh, 0E8h, 0C5h, 2, 4Eh, 0E8h, 0C1h
db 2, 4Fh, 0E8h, 0BDh, 2, 50h, 0E8h, 0B9h
db 2, 51h, 0E8h, 0B5h, 2, 52h, 0E8h, 0B1h
db 2, 53h, 0E8h, 0ADh, 2, 54h, 0E8h, 0A9h
db 2, 55h, 0E8h, 0A5h, 2, 56h, 0E8h, 0A1h
db 2, 57h, 0E8h, 9Dh, 2, 58h, 0E8h, 99h
db 2, 59h, 0E8h, 95h, 2, 5Ah, 0E8h, 91h
db 2, 5Bh, 0E8h, 8Dh, 2, 5Ch, 0E8h, 89h
db 2, 5Dh, 0E8h, 85h, 2, 5Eh, 0E8h, 81h
db 2, 5Fh, 0E8h, 7Dh, 2, 60h, 0E8h, 79h
db 2, 61h, 0E8h, 75h, 2, 62h, 0E8h, 71h
db 2, 63h, 0E8h, 6Dh, 2, 64h, 0E8h, 69h
db 2, 65h, 0E8h, 65h, 2, 66h, 0E8h, 61h
db 2, 67h, 0E8h, 5Dh, 2, 68h, 0E8h, 59h
db 2, 69h, 0E8h, 55h, 2, 6Ah, 0E8h, 51h
db 2, 6Bh, 0E8h, 4Dh, 2, 6Ch, 0E8h, 49h
db 2, 6Dh, 0E8h, 45h, 2, 6Eh, 0E8h, 41h
db 2, 6Fh, 0E8h, 3Dh, 2, 70h, 0E8h, 39h
db 2, 71h, 0E8h, 35h, 2, 72h, 0E8h, 31h
db 2, 73h, 0E8h, 2Dh, 2, 74h, 0E8h, 29h
db 2, 75h, 0E8h, 25h, 2, 76h, 0E8h, 21h
db 2, 77h, 0E8h, 1Dh, 2, 78h, 0E8h, 19h
db 2, 79h, 0E8h, 15h, 2, 7Ah, 0E8h, 11h
db 2, 7Bh, 0E8h, 0Dh, 2, 7Ch, 0E8h, 9, 2
db 7Dh, 0E8h, 5, 2, 7Eh, 0E8h, 1, 2, 7Fh
db 0E8h
std
add     [bx+si-618h], ax
add     [bx+di-0A18h], ax
add     [bp+si-0E18h], ax
add     [bp+di-1218h], ax
add     [si-1618h], ax
add     [di-1A18h], ax
add     [bp-1E18h], ax
add     [bx-2218h], ax
add     [bx+si-2618h], cx
add     [bx+di-2A18h], cx
add     [bp+si-2E18h], cx
add     [bp+di-3218h], cx
add     [si-3618h], cx
add     [di-3A18h], cx
add     [bp-3E18h], cx
add     [bx-4218h], cx
add     [bx+si-4618h], dx
add     [bx+di-4A18h], dx
add     [bp+si-4E18h], dx
add     [bp+di-5218h], dx
add     [si-5618h], dx
add     [di-5A18h], dx
add     [bp-5E18h], dx
add     [bx-6218h], dx
add     [bx+si-6618h], bx
add     [bx+di-6A18h], bx
add     [bp+si-6E18h], bx
add     [bp+di-7218h], bx
add     [si-7618h], bx
add     [di-7A18h], bx
add     [bp-7E18h], bx
add     [bx+7DE8h], bx
add     [bx+si+79E8h], sp
add     [bx+di+75E8h], sp
add     [bp+si+71E8h], sp
add     [bp+di+6DE8h], sp
add     [si+69E8h], sp
add     [di+65E8h], sp
add     [bp+61E8h], sp
add     [bx+5DE8h], sp
add     [bx+si+59E8h], bp
add     [bx+di+55E8h], bp
add     [bp+si+51E8h], bp
add     [bp+di+4DE8h], bp
add     [si+49E8h], bp
add     [di+45E8h], bp
add     [bp+41E8h], bp
add     [bx+3DE8h], bp
add     [bx+si+39E8h], si
add     [bx+di+35E8h], si
add     [bp+si+31E8h], si
add     [bp+di+2DE8h], si
add     [si+29E8h], si
add     [di+25E8h], si
add     [bp+21E8h], si
add     [bx+1DE8h], si
add     [bx+si+19E8h], di
add     [bx+di+15E8h], di
add     [bp+si+11E8h], di
add     [bp+di+0DE8h], di
add     [si+9E8h], di
add     [di+5E8h], di
add     [bp+1E8h], di
add     [bx-218h], di
add     al, al
call    sub_19CE0
shr     ax, 0F5h
add     dl, al
call    sub_19CE0
retn
call    sub_19CE0
db 0C4h, 0E8h, 0E9h, 0, 0C5h, 0E8h, 0E5h
db 0, 0C6h, 0E8h, 0E1h, 0, 0C7h, 0E8h, 0DDh
db 0, 0C8h, 0E8h, 0D9h, 0, 0C9h, 0E8h, 0D5h
db 0, 0CAh, 0E8h, 0D1h, 0, 0CBh, 0E8h, 0CDh
db 0, 0CCh, 0E8h, 0C9h, 0, 0CDh, 0E8h, 0C5h
db 0, 0CEh, 0E8h, 0C1h, 0, 0CFh, 0E8h, 0BDh
db 0, 0D0h, 0E8h, 0B9h, 0, 0D1h, 0E8h, 0B5h
db 0, 0D2h, 0E8h, 0B1h, 0, 0D3h, 0E8h, 0ADh
db 0, 0D4h, 0E8h, 0A9h, 0, 0D5h, 0E8h, 0A5h
db 0, 0D6h, 0E8h, 0A1h, 0, 0D7h, 0E8h, 9Dh
db 0, 0D8h, 0E8h, 99h, 0, 0D9h, 0E8h, 95h
db 0, 0DAh, 0E8h, 91h, 0, 0DBh, 0E8h, 8Dh
db 0, 0DCh, 0E8h, 89h, 0, 0DDh, 0E8h, 85h
db 0, 0DEh, 0E8h, 81h, 0, 0DFh, 0E8h, 7Dh
db 0, 0E0h, 0E8h, 79h, 0, 0E1h, 0E8h, 75h
db 0, 0E2h, 0E8h, 71h, 0, 0E3h, 0E8h, 6Dh
db 0, 0E4h, 0E8h, 69h, 0, 0E5h, 0E8h, 65h
db 0, 0E6h, 0E8h, 61h, 0, 0E7h, 0E8h, 5Dh
db 0, 2 dup(0E8h), 59h, 0, 0E9h, 0E8h, 55h
db 0, 0EAh, 0E8h, 51h, 0, 0EBh, 0E8h, 4Dh
db 0, 0ECh, 0E8h, 49h, 0, 0EDh, 0E8h, 45h
db 0, 0EEh, 0E8h, 41h, 0, 0EFh, 0E8h, 3Dh
db 0, 0F0h, 0E8h, 39h, 0, 0F1h, 0E8h, 35h
db 0, 0F2h, 0E8h, 31h, 0, 0F3h, 0E8h, 2Dh
db 0, 0F4h, 0E8h, 29h, 0, 0F5h, 0E8h, 25h
db 0, 0F6h, 0E8h, 21h, 0, 0F7h, 0E8h, 1Dh
db 0, 0F8h, 0E8h, 19h, 0, 0F9h, 0E8h, 15h
db 0, 0FAh, 0E8h, 11h, 0, 0FBh, 0E8h, 0Dh
db 0, 0FCh, 0E8h, 9, 0, 0FDh, 0E8h, 5, 0
db 0FEh, 0E8h, 1, 0, 0FFh


; Attributes: noreturn

sub_19CE0 proc near
cli
push    bx
mov     bx, 20h ; ' '
push    ds
mov     ds, bx
assume ds:nothing
sub     word ptr ds:996h, 180h
mov     bx, ds:996h
mov     [bx-2Ch], di
mov     [bx-2Ah], si
mov     [bx-22h], dx
mov     [bx-20h], cx
mov     [bx-1Eh], ax
pop     cx
pop     ax
mov     [bx+4], cx
mov     [bx-30h], cx
mov     [bx-24h], ax
mov     word ptr [bx+6], es
mov     word ptr [bx-2Eh], es
mov     word ptr [bx+2], ss
mov     [bx-28h], bp
pop     si
mov     [bx+2Ah], esp
pop     large dword ptr [bx+1Eh]
pop     large dword ptr [bx+22h]
pop     large dword ptr [bx+26h]
mov     cx, [bx+26h]
xor     ah, ah
mov     ds:9CAh, cx
and     ch, 0FEh
mov     [bx-12h], cx
and     ch, 0FDh
mov     al, cs:[si]
mov     [bx-18h], cx
lea     bx, [bx-32h]
mov     dx, 20h ; ' '
mov     ds:9CCh, al
mov     word ptr [bx], 0EF8h
mov     ss, dx
assume ss:nothing
mov     sp, bx
mov     word ptr [bx+1Ch], 0F34h
jmp     far ptr 18h:92Ch
sub_19CE0 endp

db  8Eh
db  5Eh ; ^
db    2
db  66h ; f
db  50h ; P
db  66h ; f
db  53h ; S
db  66h ; f
db  0Fh
db    2
db  5Eh ; ^
db    2
db  66h ; f
db  0Fh
db 0BAh
db 0E3h
db  16h
db  66h ; f
db 0BBh
db    0
db    0
db    0
db    0
db  73h ; s
db    1
db  66h ; f
db  8Bh
db  5Eh ; ^
db  2Ah ; *
db  67h ; g
db  66h ; f
db  8Fh
db  43h ; C
db 0FCh
db  66h ; f
db  8Bh
db  46h ; F
db  1Eh
db  67h ; g
db  66h ; f
db  89h
db    3
db  8Bh
db  46h ; F
db  22h ; "
db  67h ; g
db  89h
db  43h ; C
db    4
db  8Bh
db  46h ; F
db  28h ; (
db  67h ; g
db  89h
db  43h ; C
db  0Ah
db  66h ; f
db  58h ; X
db  3Bh ; ;
db  56h ; V
db    6
db  75h ; u
db  3Bh ; ;
db  8Eh
db 0C2h
db  5Ah ; Z
db  3Bh ; ;
db  56h ; V
db    4
db  75h ; u
db  2Fh ; /
db  67h ; g
db  89h
db  53h ; S
db 0F8h
db  67h ; g
db  8Fh
db  43h ; C
db 0FAh
db  67h ; g
db  66h ; f
db  8Fh
db  43h ; C
db 0FCh
db  67h ; g
db  8Fh
db  43h ; C
db 0F6h
db  5Ah ; Z
db  80h
db 0E6h
db  0Eh
db  67h ; g
db  89h
db  53h ; S
db    8
db  36h ; 6
db  81h
db    6
db  96h
db    9
db  80h
db    1
db  8Eh
db  56h ; V
db    2
db  66h ; f
db  67h ; g
db  8Dh
db  63h ; c
db 0F6h
db  5Ah ; Z
db  1Fh
db  5Dh ; ]
db  66h ; f
db  5Bh ; [
db  66h ; f
db 0CFh
db  33h ; 3
db 0D2h
db 0EBh
db 0CDh
db  33h ; 3
db 0D2h
db 0EBh
db 0C1h
db 0FBh
db  80h
db 0FCh
db    0
db  74h ; t
db  4Bh ; K
db  80h
db 0FCh
db  10h
db  74h ; t
db  46h ; F
db  80h
db 0FCh
db    1
db  74h ; t
db    5
db  80h
db 0FCh
db  11h
db  75h ; u
db  2Dh ; -
db  1Eh
db  50h ; P
db  6Ah ; j
db  38h ; 8
db  1Fh
db 0A0h
db  6Ch ; l
db    4
db  6Ah ; j
db  20h
db  1Fh
db  8Ah
db 0E0h
db  86h
db    6
db 0EDh
db  10h
db 0F6h
db    6
db  14h
db    0
db    4
db  75h ; u
db  0Bh
db  3Ah ; :
db 0E0h
db  75h ; u
db    7
db  58h ; X
db  1Fh
db 0FBh
db  66h ; f
db 0CAh
db    4
db    0
db  58h ; X
db  66h ; f
db  9Ch
db  66h ; f
db  0Eh
db  6Ah ; j
db    0
db  68h ; h
db  41h ; A
db    5
db 0FAh
db 0E8h
db 0C0h
db 0FEh
db  16h
db  74h ; t
db 0E9h
db 0FEh
db  0Eh
db 0EDh
db  10h
db  0Bh
db 0E4h
db 0EBh
db 0E1h
db  1Eh
db  6Ah ; j
db  20h
db  1Fh
db 0FEh
db  0Eh
db 0EDh
db  10h
db  1Fh
db 0EBh
db 0E6h
db  50h ; P
db 0B0h
db    0
db 0E6h
db 0F0h
db 0B0h
db  20h
db 0EBh
db    0
db 0E6h
db 0A0h
db 0EBh
db    0
db 0E6h
db  20h
db  58h ; X
db 0CDh
db    2
db  66h ; f
db 0CFh
db  9Ch
db 0FAh
db  6Ah ; j
db  20h
db  1Fh
db  83h
db 0ECh
db    4
db  55h ; U
db  8Ch
db 0D5h
db  83h
db 0FDh
db  20h
db  74h ; t
db    5
db  83h
db  2Eh ; .
db  52h ; R
db  0Fh
db    8
db  8Bh
db 0ECh
db  53h ; S
db  8Bh
db  1Eh
db  96h
db    9
db  83h
db 0EBh
db  10h
db 0F6h
db  47h ; G
db  0Fh
db    2
db  74h ; t
db    4
db  80h
db  4Eh ; N
db    7
db    2
db  53h ; S
db  8Bh
db  5Fh ; _
db    2
db 0EAh
db    9
db  10h
db  18h
db    0
db  8Bh
db  3Eh ; >
db  9Eh
db    9
db  0Bh
db 0FFh
db  74h ; t
db  0Ah
db  8Bh
db  55h ; U
db  22h ; "
db  8Bh
db  45h ; E
db  1Eh
db  8Bh
db  4Dh ; M
db  26h ; &
db 0C3h
db  8Bh
db  3Eh ; >
db  96h
db    9
db  8Bh
db  55h ; U
db    2
db  8Bh
db  45h ; E
db  0Eh
db  2Dh ; -
db  4Ah ; J
db    0
db  33h ; 3
db 0C9h
db 0C3h
db  5Fh ; _
db  5Eh ; ^
db  5Ah ; Z
db  5Dh ; ]
db  83h
db 0C4h
db  0Ch
db  60h ; `
db 0E8h
db 0D3h
db 0FFh
db  8Ch
db 0D6h
db  8Bh
db 0FCh
db  8Eh
db 0D2h
db  8Bh
db 0E0h
db  56h ; V
db  57h ; W
db  8Bh
db 0F4h
db 0CDh
db  23h ; #
db  6Ah ; j
db  20h
db  1Fh
db  3Bh ; ;
db 0E6h
db  74h ; t
db    5
db  59h ; Y
db  3Bh ; ;
db 0E6h
db  75h ; u
db    7
db  58h ; X
db  17h
db  8Bh
db 0E0h
db  61h ; a
db 0EBh
db  80h
db 0CCh
db 0B8h
db    0
db  4Ch ; L
db 0CDh
db  21h ; !
db 0C6h
db    6
db 0F0h
db  10h
db    0
db  60h ; `
db  8Bh
db 0ECh
db  16h
db  8Dh
db  46h ; F
db  40h ; @
db  50h ; P
db 0E8h
db  9Ch
db 0FFh
db  8Bh
db 0F1h
db  52h ; R
db  50h ; P
db 0FFh
db  1Eh
db 16h, 0, 83h, 0C4h, 8, 0Bh, 0F6h, 74h
db 8, 36h, 8Bh, 4Ch, 4, 36h, 8Bh, 74h, 6
db 8Bh, 0ECh, 2Dh, 1Ch, 0, 0Bh, 0C9h, 74h
db 6, 89h, 4Eh, 32h, 89h, 76h, 34h, 89h
db 46h, 3Ch, 89h, 56h, 3Eh, 0C7h, 46h, 36h
db 57h, 6, 8Ch, 4Eh, 38h, 61h, 5Fh, 5Eh
db 5Ah, 5Dh, 83h, 0C4h, 0Ch, 0CDh, 24h, 60h
db 8Bh, 0ECh, 16h, 8Dh, 46h, 10h, 50h, 0FFh
db 76h, 2Ah, 0FFh, 76h, 28h, 0FFh, 1Eh, 16h
db 0, 83h, 0C4h, 8, 61h, 0E9h, 13h, 0FFh
db 2Eh, 8Eh, 1Eh, 0E0h, 54h, 88h, 26h, 0F0h
db 10h, 9Fh, 86h, 26h, 0F0h, 10h, 83h, 0ECh
db 18h, 0EBh, 0D4h
jpt_1A5D7 dw offset loc_1A194, offset loc_1AB1F, offset loc_1A837 ; jump table for switch statement
dw offset loc_1A5DC, offset loc_1A5DC, offset loc_1A5DC
dw offset loc_1A5DC, offset loc_1A858, offset loc_1A837
dw offset loc_1A837, offset loc_1A7DA, offset loc_1A7FF
dw offset loc_1A87C, offset loc_1A82E, offset loc_1A5DC
dw offset loc_1A5DC, offset loc_1AC7D, offset loc_1AC7D
dw offset loc_1AC65, offset loc_1AC65, offset loc_1AC7D
dw offset loc_1AC7D, offset loc_1AC7D, offset loc_1AC7D
dw offset loc_1AC7D, offset loc_1A5DC, offset loc_1A5DC
dw offset loc_1ABEE, offset loc_1B047, offset loc_1B047
dw offset loc_1A5DC, offset loc_1A5DC, offset loc_1A5DC
dw offset loc_1A5DC, offset loc_1AC7D, offset loc_1AC7D
dw offset loc_1AC7D, offset loc_1AC7D, offset loc_1A9A9
dw offset loc_1A5DC, offset loc_1AC7D, offset loc_1AC7D
dw offset loc_1ACBC, offset loc_1AD18, offset loc_1AD73
dw offset loc_1AD7B, offset loc_1A5DC, offset loc_1A5DC
dw offset loc_1AC11, offset loc_1A5DC, offset loc_1AB74
dw offset loc_1B047, offset loc_1A5DC, offset loc_1B042
dw offset loc_1AAC1, offset loc_1A5DC, offset loc_1A5DC
dw offset loc_1B080, offset loc_1A686, offset loc_1A686
dw offset loc_1A686, offset loc_1A686, offset loc_1A686
dw offset loc_1A5DC, offset loc_1A6E2, offset loc_1A75F
dw offset loc_1A686, offset loc_1A5DC, offset loc_1A6D3
dw offset loc_1B0BC, offset loc_1A5DC, offset loc_1A5DC
dw offset loc_1ABBD, offset loc_1AE06, offset loc_1AE44
dw offset loc_1AE69, offset loc_1AE8C, offset loc_1AB1F
dw offset loc_1A5DC, offset loc_1AC20, offset loc_1AC37
dw offset loc_1A5DC, offset loc_1A5DC, offset loc_1A5DC
dw offset loc_1A5DC, offset loc_1A5DC, offset loc_1A5DC
dw offset loc_1ADD3, offset loc_1A5DC, offset loc_1A5DC
dw offset loc_1A5DC, offset loc_1A68F, offset loc_1A686
dw offset loc_1A5DC, offset loc_1A5DC, offset loc_1B112
dw offset loc_1B246, offset loc_1B25B, offset loc_1A5DC
dw offset loc_1B039, offset loc_1A5DC, offset loc_1A5DC
dw offset loc_1B191, offset loc_1A5DC, offset loc_1A5DC
dw offset loc_1A5DC, offset loc_1E824
dw offset loc_1CA32+1
dw offset loc_1E916
dw offset loc_1E02B
db 0, 69h, 6Eh, 74h, 32h, 31h, 5Fh, 63h
db 61h, 2 dup(6Ch), 5Fh, 31h, 36h, 0, 69h
db 6Eh, 74h, 32h, 31h, 5Fh, 63h, 72h, 65h
db 67h, 5Fh, 31h, 36h, 0, 69h, 6Eh, 74h
db 33h, 31h, 5Fh, 63h, 61h, 2 dup(6Ch), 5Fh
db 31h, 36h, 0, 69h, 6Eh, 74h, 33h, 31h
db 5Fh, 63h, 72h, 65h, 67h, 5Fh, 31h, 36h
db 0, 63h, 70h, 5Fh, 65h, 6Eh, 74h, 72h
db 79h, 0, 62h, 64h, 6Fh, 73h, 5Fh, 34h
db 42h, 5Fh, 66h, 6Ch, 67h, 0, 6Dh, 61h
db 6Bh, 65h, 78h, 65h, 63h, 61h, 62h, 6Ch
db 65h, 0, 47h, 7, 70h, 0, 0DAh, 7, 70h
db 0, 55h, 7, 70h, 0, 46h, 8, 70h, 0, 63h
db 7, 70h, 0, 50h, 8, 70h, 0, 71h, 7, 70h
db 0, 99h, 8, 70h, 0, 94h, 7, 70h, 0, 4
db 1Fh, 70h, 0, 88h, 7, 70h, 0, 82h, 11h
db 20h, 0, 7Fh, 7, 70h, 0, 5Ah, 0Dh, 20h
db 3 dup(0)
push    bp
mov     bp, sp
pusha
push    ds
push    es
les     bx, [bp+6]
mov     ax, es:[bx]
mov     cx, es:[bx+4]
mov     dx, es:[bx+6]
mov     si, es:[bx+8]
mov     di, es:[bx+0Ah]
mov     bx, es:[bx+2]
push    bx
les     bx, [bp+0Eh]
mov     ds, word ptr es:[bx+6]
assume ds:nothing
mov     es, word ptr es:[bx]
pop     bx
pushfd
db      66h
push    cs
push    offset byte_198E0
call    near ptr sub_1A57E

loc_1A0EF:
push    ax
push    es
push    bx
les     bx, [bp+0Ah]
mov     es:[bx], ax
mov     es:[bx+4], cx
mov     es:[bx+6], dx
mov     es:[bx+8], si
mov     es:[bx+0Ah], di
mov     es:[bx+0Ah], di
pushf
pop     word ptr es:[bx+0Ch]
pop     ax
mov     es:[bx+2], ax
les     bx, [bp+0Eh]
mov     es:[bx+6], di
pop     word ptr es:[bx]
pop     ax
pop     es
pop     ds
popa
pop     bp
retf



sub_1A126 proc far
pushfd
db      66h
push    cs
push    offset byte_198E0
call    near ptr sub_1A57E
retf
sub_1A126 endp

push    ds
mov     ds, cs:word_1EDC0
assume ds:nothing
cmp     byte ptr ds:2Eh, 0
pop     ds
assume ds:nothing
jnz     short loc_1A141
int     31h             ; DPMI Services   ax=func xxxxh
                        ;
retf

loc_1A141:
push    bp
mov     bp, sp
pusha
push    ds
push    es
les     bx, [bp+6]
mov     ax, es:[bx]
mov     cx, es:[bx+4]
mov     dx, es:[bx+6]
mov     si, es:[bx+8]
mov     di, es:[bx+0Ah]
mov     bx, es:[bx+2]
push    bx
les     bx, [bp+0Eh]
mov     ds, word ptr es:[bx+6]
mov     es, word ptr es:[bx]
pop     bx
pushfd
db      66h
push    cs
push    offset byte_198E0
call    sub_1DD6E
jmp     loc_1A0EF



sub_1A179 proc far
push    ds
mov     ds, cs:word_1EDC0
assume ds:nothing
cmp     byte ptr ds:2Eh, 0
pop     ds
assume ds:nothing
jnz     short loc_1A18A
int     31h             ; DPMI Services   ax=func xxxxh
                        ;
retf

loc_1A18A:
pushfd
db      66h
push    cs
push    offset byte_198E0
call    sub_1DD6E
retf
sub_1A179 endp

; START OF FUNCTION CHUNK FOR sub_1A57E

loc_1A194:              ; jumptable 0001A5D7 case 0
or      byte ptr [bp+26h], 1
xor     di, di
mov     ds:38h, di
mov     di, [bp+12h]
mov     ax, di
shr     di, 8
cmp     di, 1Ah
ja      short loc_1A1BA
shl     di, 1
call    cs:funcs_1A1AE[di]
; END OF FUNCTION CHUNK FOR sub_1A57E
; START OF FUNCTION CHUNK FOR sub_1A1D2

loc_1A1B3:
and     byte ptr [bp+26h], 0FEh
; END OF FUNCTION CHUNK FOR sub_1A1D2
; START OF FUNCTION CHUNK FOR sub_1A1BD
;   ADDITIONAL PARENT FUNCTION sub_1A1E8
;   ADDITIONAL PARENT FUNCTION sub_1A4AD

loc_1A1B7:
mov     [bp+16h], ax

loc_1A1BA:
jmp     sub_1A5F8
; END OF FUNCTION CHUNK FOR sub_1A1BD



sub_1A1BD proc near

; FUNCTION CHUNK AT 08D7 SIZE 00000006 BYTES

cmp     al, 5
jbe     short loc_1A1C6
mov     ax, 0FFFFh
jmp     short loc_1A1B7

loc_1A1C6:
xchg    al, ds:980h
retn
sub_1A1BD endp




sub_1A1CB proc near
call    sub_1BAA0
mov     [bp+12h], dx
retn
sub_1A1CB endp




sub_1A1D2 proc near

; FUNCTION CHUNK AT 08D3 SIZE 00000004 BYTES

mov     ds:1181h, al
jmp     short loc_1A1B3
sub_1A1D2 endp




sub_1A1D7 proc near
mov     cx, 32C4h

loc_1A1DA:
push    ss
push    bp
call    cx ; sub_1CBA4
pop     cx
pop     cx
jmp     sub_1A5F8
sub_1A1D7 endp




sub_1A1E3 proc near
mov     cx, 34F1h
jmp     short loc_1A1DA
sub_1A1E3 endp




sub_1A1E8 proc near

; FUNCTION CHUNK AT 08D7 SIZE 00000006 BYTES

push    word ptr [bp+10h]
call    sub_1CE75

loc_1A1EE:
pop     cx
or      ax, ax
jz      short loc_1A1B7
retn
sub_1A1E8 endp




sub_1A1F4 proc near
push    word ptr [bp+10h]
call    sub_1CE85
jmp     short loc_1A1EE
sub_1A1F4 endp




sub_1A1FC proc near
mov     ax, [bp+10h]
push    ax
xchg    ax, si
sti
call    sub_1CE95
cli
cmp     si, [bp+6]
jnz     short loc_1A210
mov     word ptr [bp+6], 0

loc_1A210:
sub     si, [bp+4]
jnz     short loc_1A1EE
mov     [bp+4], si
jmp     short loc_1A1EE
sub_1A1FC endp




sub_1A21A proc near
push    word ptr [bp+14h]
push    word ptr [bp+6]
push    word ptr [bp+10h]
call    sub_1CF46
pop     cx
pop     cx
jmp     short loc_1A1EE
sub_1A21A endp




sub_1A22A proc near
mov     bx, [bp-2]
or      bx, bx
jz      short loc_1A23D
mov     ax, [bx+22h]
mov     [bp+6], ax
mov     bx, [bx+26h]
add     bx, 1Eh

loc_1A23D:
mov     [bp+10h], bx
retn
sub_1A22A endp




sub_1A241 proc near
push    word ptr [bp+14h]
xor     ax, ax
mov     al, [bp+16h]
push    ax
push    word ptr [bp+10h]
call    sub_1CFB8
add     sp, 6
mov     [bp+6], ax
or      ax, ax
jz      short loc_1A25E
and     byte ptr [bp+26h], 0FEh

loc_1A25E:
jmp     loc_1A1BA
sub_1A241 endp




sub_1A261 proc near
push    word ptr [bp+14h]
xor     ax, ax
mov     al, [bp+16h]
push    ax
push    word ptr [bp+10h]
call    sub_1CFF8
pop     cx
pop     cx
jmp     loc_1A1EE
sub_1A261 endp




sub_1A275 proc near
cmp     al, 2
ja      short loc_1A25E
xchg    al, ds:1185h
retn
sub_1A275 endp




sub_1A27E proc far
mov     ax, ds:14h
and     ax, 8
jz      short loc_1A25E
mov     ax, [bp+10h]
mov     cx, ax
or      cx, cx
jl      short loc_1A293
inc     cx
mov     ds:0E70h, ax

loc_1A293:
mov     [bx+0Eh], sp
mov     ss, word ptr ds:0C26h
assume ss:nothing
mov     sp, ds:0F50h
cmp     byte ptr ds:2Eh, 0
jz      short loc_1A2DA
sub     sp, 2Ah
mov     [bx+0Ah], sp
push    es
push    ds
push    ss
push    18h
push    word ptr [bx+0Ah]
push    cx
push    bx
jmp     far ptr 18h:10F2h
mov     bx, ds:996h
mov     ss, word ptr [bx+2]
mov     sp, [bx+0Eh]
mov     es, word ptr [bp+6]
mov     di, [bx+8]
mov     si, [bx+0Ah]
push    word ptr [si+4]
mov     cx, 15h
cld
rep movsw
pop     cx
jcxz    short loc_1A32B
retn

loc_1A2DA:
inc     byte ptr ds:1182h
push    word ptr [bx+6]
push    word ptr [bx+8]
push    cx
push    cs
push    offset loc_1A2F1
push    word ptr ds:0C24h
push    4798h
retf
sub_1A27E endp ; sp-analysis failed


loc_1A2F1:
mov     bx, ds:996h
mov     ss, word ptr [bx+2]
mov     sp, [bx+0Eh]
mov     es, word ptr [bp+6]
mov     di, [bp+8]
dec     byte ptr ds:1182h
cmp     word ptr es:[di+4], 0
jz      short loc_1A32B
retn



sub_1A30D proc near
mov     word ptr [bp+12h], ds
mov     word ptr [bp+16h], 98h
mov     ax, ds:11F4h
mov     [bp+10h], ax
mov     ax, ds:11F6h
mov     [bp+14h], ax
mov     word ptr [bp+0Ah], 0C10h
mov     word ptr [bp+8], 41E5h

loc_1A32B:
jmp     sub_1A5F8
sub_1A30D endp




sub_1A32E proc near
push    ss
push    bp
call    sub_1D122
pop     cx
pop     cx
jmp     sub_1A5F8
sub_1A32E endp




sub_1A338 proc far
mov     bx, [bp+10h]
mov     cx, [bp+14h]
push    ss
pop     es
mov     si, [bp+22h]
cmp     byte ptr [bp+16h], 0
mov     ax, [bp+8]
mov     ss, word ptr [bp+0Ah]
xchg    ax, sp
push    bx
push    cx
jnz     short loc_1A360
mov     ah, 49h ; 'I'
push    cs
call    near ptr sub_1A126
mov     es, si
mov     ah, 49h ; 'I'
push    cs
call    near ptr sub_1A126

loc_1A360:
sti
mov     ax, ds:0C28h
mov     ds, ax
mov     es, ax
retf
sub_1A338 endp ; sp-analysis failed

; [00000001 BYTES: COLLAPSED FUNCTION nullsub_5. PRESS CTRL-NUMPAD+ TO EXPAND]



sub_1A36A proc near
mov     ax, [bp+4]
mov     si, [bp+0Ah]
mov     cx, [bp+6]
mov     di, [bp+8]
push    ds
mov     ds, word ptr ds:0C30h
xchg    di, ds:17BEh
mov     [bp+8], di
xchg    cx, ds:17C0h
mov     [bp+6], cx
xchg    si, ds:17C2h
mov     [bp+0Ah], si
xchg    ax, ds:17C4h
mov     [bp+4], ax
pop     ds
retn
sub_1A36A endp




sub_1A399 proc near
mov     bx, [bp+6]
shr     bx, 3
jz      short loc_1A412
mov     es, word ptr ds:0C32h
shr     al, 1
sbb     dl, dl
cbw
mov     al, es:[bx]
mov     cl, [bp+16h]
and     cl, 0C0h
jz      short locret_1A411
and     dl, cl
not     cl
and     cl, al
or      cl, dl
mov     es:[bx], cl
cmp     byte ptr ds:2Eh, 0
jz      short loc_1A3D3
mov     bx, cs:word_1DD5C
test    byte ptr cs:[bx-2], 80h
jz      short locret_1A411

loc_1A3D3:
push    ax
and     al, 0C0h
xor     cx, cx
sub     cl, al
rcr     cl, 1
sub     ch, dl
rcr     ch, 1
xor     cl, ch
jns     short loc_1A410
push    cx
mov     bx, [bp+6]
mov     ax, 6
push    cs
call    near ptr sub_1A179
pop     ax
jb      short loc_1A415
lsl     di, bx
cmp     cx, 10h
jb      short loc_1A410
mov     bx, cx
mov     cx, dx
xor     si, si
shl     al, 1
jb      short loc_1A425

loc_1A404:
cmc
mov     ax, 300h
rcl     ax, 1
push    cs
call    near ptr sub_1A179
jb      short loc_1A415

loc_1A410:
pop     ax

locret_1A411:
retn

loc_1A412:
jmp     sub_1A5F8

loc_1A415:
pop     ax
mov     es, word ptr ds:0C32h
mov     bx, [bp+6]
shr     bx, 3
mov     es:[bx], al
jmp     short loc_1A412

loc_1A425:
push    bp
mov     bp, sp
sub     sp, 30h
push    ax
push    edi
xor     edi, edi
mov     di, sp
lea     di, [di+4]
push    ss
pop     es
mov     ax, 500h
push    cs
call    near ptr sub_1A179
jb      short loc_1A44D
pop     ax
push    ax
shr     ax, 0Ch
add     ax, 50h ; 'P'
cmp     ax, ss:[di+8]

loc_1A44D:
pop     edi
pop     ax
mov     sp, bp
pop     bp
jnb     short loc_1A415
stc
jmp     short loc_1A404
sub_1A399 endp




sub_1A458 proc near
push    1
push    word ptr [bp+10h]
push    word ptr [bp+14h]
call    sub_1D3ED
add     sp, 6
mov     [bp+12h], dx
retn
sub_1A458 endp




sub_1A46A proc near
mov     word ptr [bp+12h], cs
mov     word ptr [bp+14h], cs
mov     word ptr [bp+0Ah], cs
mov     word ptr [bp+10h], 0C09h
mov     ax, 0C04h
mov     word ptr [bp+8], 0BFFh
retn
sub_1A46A endp




sub_1A481 proc near
mov     ax, ds:0C40h
mov     [bp+16h], ax
retn
sub_1A481 endp




sub_1A488 proc near
call    sub_1A8EC
retn
sub_1A488 endp




sub_1A48C proc near
and     byte ptr ds:47h, 0DFh
mov     di, 0DE4h
mov     ax, [bp+10h]
stosw
mov     ax, [bp+14h]
stosw
mov     ax, [bp+8]
stosw
mov     ax, [bp+0Ah]
stosw
xchg    ax, cx
jcxz    short locret_1A4AC
or      byte ptr ds:47h, 20h

locret_1A4AC:
retn
sub_1A48C endp




sub_1A4AD proc near

; FUNCTION CHUNK AT 08D7 SIZE 00000006 BYTES

xor     ax, ax

loc_1A4AF:
jmp     loc_1A1B7
sub_1A4AD endp




sub_1A4B2 proc near
push    ds
cbw
push    ax
call    sub_1E58C
pop     bx
add     bx, bx
mov     bx, [bx+4470h]
test    byte ptr [bx-2], 1
jz      short loc_1A4DB
mov     cx, [bp+10h]
mov     dx, [bp+14h]
xchg    cx, [bx-4]
xchg    dx, [bx-6]
mov     [bp+14h], dx
mov     [bp+10h], cx
or      byte ptr [bx-2], 80h

loc_1A4DB:
pop     ds
jz      short loc_1A4AF
retn
sub_1A4B2 endp

mov     ax, 2765h
jmp     short loc_1A4EC
mov     ax, 2299h
jmp     short loc_1A4EC
mov     ax, 24D9h

loc_1A4EC:
mov     bx, sp
push    ds
mov     ds, cs:word_1EDC0
assume ds:nothing
mov     ds, word ptr ds:0C26h
assume ds:nothing
push    word ptr ss:[bx+0Ah]
push    word ptr ss:[bx+8]
push    word ptr ss:[bx+6]
push    word ptr ss:[bx+4]
call    ax ; sub_1C045
add     sp, 8
pop     ds
retf
align 2
funcs_1A1AE dw offset sub_1A1BD
dw offset sub_1A1CB
dw offset sub_1A1D2
dw offset sub_1A1D7
dw offset sub_1A1E3
dw offset sub_1A1E8
dw offset sub_1A1F4
dw offset sub_1A1FC
dw offset sub_1A21A
dw offset sub_1A22A
dw offset sub_1A241
dw offset sub_1A261
dw offset sub_1A275
dw offset sub_1A27E
dw offset sub_1A30D
dw offset sub_1A32E
dw offset sub_1A338
dw offset sub_1A5F8
dw offset sub_1A36A
dw offset sub_1A399
dw offset sub_1A458
dw offset sub_1A46A
dw offset sub_1A481
dw offset sub_1A488
dw offset sub_1A48C
dw offset sub_1A4AD
dw offset sub_1A4B2


; Attributes: bp-based frame

sub_1A546 proc near

arg_0= word ptr  4
arg_2= byte ptr  6

push    bp
mov     bp, sp
mov     es, [bp+arg_0]
mov     al, [bp+arg_2]
mov     ah, 0FFh
mov     dx, 1301h
push    cs
call    near ptr sub_1A126
cmc
sbb     ax, ax
pop     bp
retn
sub_1A546 endp

; START OF FUNCTION CHUNK FOR sub_1A57E

loc_1A55D:
cmp     ah, 0Ch
jbe     short loc_1A59E
cmp     ah, 59h ; 'Y'
jz      short loc_1A59E
cmp     ah, 0FFh
jz      short loc_1A59E
cmp     byte ptr es:1182h, 0
jnz     short loc_1A59E
mov     di, cx
add     di, 180h
xor     cx, cx
jmp     short loc_1A59E
; END OF FUNCTION CHUNK FOR sub_1A57E



sub_1A57E proc far

; FUNCTION CHUNK AT 08B4 SIZE 0000001F BYTES
; FUNCTION CHUNK AT 0C7D SIZE 00000021 BYTES
; FUNCTION CHUNK AT 0DA6 SIZE 0000002D BYTES
; FUNCTION CHUNK AT 0DF3 SIZE 0000016B BYTES
; FUNCTION CHUNK AT 0F78 SIZE 0000003D BYTES
; FUNCTION CHUNK AT 1051 SIZE 00000182 BYTES
; FUNCTION CHUNK AT 11E1 SIZE 00000037 BYTES
; FUNCTION CHUNK AT 123F SIZE 00000164 BYTES
; FUNCTION CHUNK AT 13DC SIZE 0000015C BYTES
; FUNCTION CHUNK AT 1564 SIZE 0000000C BYTES
; FUNCTION CHUNK AT 1589 SIZE 0000000C BYTES
; FUNCTION CHUNK AT 15AC SIZE 0000011A BYTES
; FUNCTION CHUNK AT 16ED SIZE 0000003B BYTES
; FUNCTION CHUNK AT 173B SIZE 00000040 BYTES
; FUNCTION CHUNK AT 17A0 SIZE 0000023D BYTES
; FUNCTION CHUNK AT 4740 SIZE 00000003 BYTES
; FUNCTION CHUNK AT 474B SIZE 00000021 BYTES
; FUNCTION CHUNK AT 4F44 SIZE 00000018 BYTES
; FUNCTION CHUNK AT 5036 SIZE 00000008 BYTES

sub     sp, 6
pusha
push    es
push    ds
push    ss
mov     bx, ss
mov     ds, bx
mov     dx, cs:word_1EDC0
mov     es, dx
assume es:nothing
mov     cx, es:99Eh
mov     di, es:996h
or      cx, cx
jnz     short loc_1A55D

loc_1A59E:
cli
push    di
sub     di, 180h
mov     bp, sp
mov     si, sp
push    cx
push    word ptr es:0F52h
mov     bx, di
cld
mov     cx, 0Ch
rep movsw
mov     ds, dx
assume ds:nothing
mov     ds:99Eh, bx
mov     ds:996h, bx
mov     word ptr [bx+22h], ss
mov     [bx+26h], bp
inc     ah
cmp     ah, 68h ; 'h'
ja      short loc_1A5DC ; jumptable 0001A5D7 cases 3-6,14,15,25,26,30-33,39,46,47,49,52,55,56,63,67,70,71,78,81-86,88-90,93,94,98,100,101,103-105
xor     al, al
xchg    al, ah
mov     ds:97Eh, ax
shl     ax, 1           ; switch 107 cases
xchg    ax, di
jmp     cs:jpt_1A5D7[di] ; switch jump

loc_1A5DC:              ; jumptable 0001A5D7 cases 3-6,14,15,25,26,30-33,39,46,47,49,52,55,56,63,67,70,71,78,81-86,88-90,93,94,98,100,101,103-105
call    sub_1A653

loc_1A5DF:
mov     ax, ss
mov     es, ax
assume es:nothing
cld
lea     di, [bp+8]
lea     si, [bx+8]
mov     cx, 8
rep movsw

loc_1A5EF:
mov     ax, [bx+26h]
and     ah, 0Eh
mov     [bp+26h], ax
sub_1A57E endp ; sp-analysis failed




sub_1A5F8 proc near
test    word ptr [bp+26h], 200h
jz      short loc_1A600
sti

loc_1A600:
lea     sp, [bp-4]
pop     word ptr ds:0F52h
pop     word ptr ds:99Eh
pop     word ptr ds:996h
inc     sp
inc     sp
pop     ds
assume ds:nothing
pop     es
popa
add     sp, 6
iretd
sub_1A5F8 endp ; sp-analysis failed

; START OF FUNCTION CHUNK FOR sub_1A653

loc_1A619:
mov     byte ptr ds:0C43h, 0
mov     ax, 4CFEh
int     21h             ; DOS - 2+ - QUIT WITH EXIT CODE (EXIT)
                        ; AL = exit code

loc_1A623:
pusha
lea     ax, [bx+4]
push    ds
push    ax
push    ds
push    ax
push    21h ; '!'
call    dword ptr ds:22h
add     sp, 0Ah
mov     bx, ds:99Eh
mov     cx, [bp+26h]
and     ch, 2
and     ah, 0FDh
or      ah, ch
mov     [bx+26h], ax
push    ds
pop     es
popa
cmp     byte ptr ds:0C43h, 0
jnz     short loc_1A619
cld
cli
retn
; END OF FUNCTION CHUNK FOR sub_1A653



sub_1A653 proc near

; FUNCTION CHUNK AT 0D39 SIZE 0000003A BYTES

cmp     byte ptr ds:2Eh, 0
jz      short loc_1A623
cli
pusha
jmp     far ptr 18h:1068h
sub_1A653 endp

mov     bx, ds:99Eh
mov     [bx+26h], ax
mov     ss, word ptr [bx+22h]
mov     sp, [bx+1Eh]
mov     ax, ds:0C30h
mov     es, ax
pop     word ptr es:1064h
mov     ax, ds
mov     es, ax
popa
cld
retn



sub_1A67F proc near
mov     ax, [bp+26h]
mov     [bx+26h], ax
retn
sub_1A67F endp

; START OF FUNCTION CHUNK FOR sub_1A57E

loc_1A686:              ; jumptable 0001A5D7 cases 58-62,66,92
call    sub_1A6B3
call    sub_1A653
jmp     loc_1ADFD

loc_1A68F:              ; jumptable 0001A5D7 case 91
call    sub_1A6B3
pushf
call    sub_1A653
popf
jnb     short loc_1A69C
jmp     loc_1ADFD

loc_1A69C:
mov     es, word ptr [bp+4]
mov     di, [bp+12h]
mov     si, ds:0Ah
mov     cx, ds:0Eh

loc_1A6AA:
lodsb
stosb
or      al, al
loopne  loc_1A6AA
jmp     loc_1ADFD
; END OF FUNCTION CHUNK FOR sub_1A57E



sub_1A6B3 proc near
call    sub_1A8D8
jb      short locret_1A6D2
mov     si, [bp+12h]
mov     di, ds:0Ah
mov     [bx+12h], di
mov     cx, ds:0Eh
push    ds
mov     ds, word ptr [bp+4]

loc_1A6CA:
lodsb
stosb
or      al, al
loopne  loc_1A6CA
pop     ds
clc

locret_1A6D2:
retn
sub_1A6B3 endp

; START OF FUNCTION CHUNK FOR sub_1A57E

loc_1A6D3:              ; jumptable 0001A5D7 case 68
call    sub_1A6B3
call    sub_1A653
mov     ax, [bx+14h]
mov     [bp+14h], ax
jmp     loc_1ADFD

loc_1A6E2:              ; jumptable 0001A5D7 case 64
call    sub_1A8D8
jnb     short loc_1A6EF
call    sub_1A653
mov     ax, [bx+16h]
jmp     short loc_1A759

loc_1A6EF:
mov     dx, [bp+14h]
mov     di, [bp+12h]
mov     ax, ds:0Ah
mov     [bx+12h], ax
mov     es, word ptr [bp+4]

loc_1A6FE:
sti
mov     cx, dx
cmp     cx, ds:0Eh
jbe     short loc_1A70B
mov     cx, ds:0Eh

loc_1A70B:
mov     [bx+14h], cx
mov     ax, [bp+16h]
mov     [bx+16h], ax
push    cx
push    es
call    sub_1A653
pop     es
mov     ax, [bx+16h]
test    byte ptr [bx+26h], 1
jnz     short loc_1A759
mov     si, ds:0Ah
mov     cx, ax
push    di
add     di, cx
pop     di
jnb     short loc_1A742
jz      short loc_1A742
mov     cx, di
push    cx
neg     cx
rep movsb
mov     cx, es
add     cx, 8
mov     es, cx
assume es:nothing
pop     cx
add     cx, ax

loc_1A742:
shr     cx, 1
rep movsw
rcl     cx, 1
rep movsb
sti
pop     cx
sub     dx, ax
jz      short loc_1A754
cmp     ax, cx
jz      short loc_1A6FE

loc_1A754:
mov     ax, [bp+14h]
sub     ax, dx

loc_1A759:
mov     [bp+16h], ax
jmp     loc_1A5EF

loc_1A75F:              ; jumptable 0001A5D7 case 65
call    sub_1A8D8
jnb     short loc_1A76C
call    sub_1A653
mov     ax, [bx+16h]
jmp     short loc_1A7D4

loc_1A76C:
mov     dx, [bp+14h]
mov     si, [bp+12h]

loc_1A772:
sti
mov     di, ds:0Ah
mov     [bx+12h], di
mov     cx, dx
cmp     cx, ds:0Eh
jbe     short loc_1A786
mov     cx, ds:0Eh

loc_1A786:
mov     [bx+14h], cx
mov     ax, [bp+16h]
mov     [bx+16h], ax
push    cx
push    ds
mov     ds, word ptr [bp+4]
cli
mov     ax, cx
push    si
add     si, cx
pop     si
jnb     short loc_1A7B0
jz      short loc_1A7B0
mov     cx, si
push    cx
neg     cx
rep movsb
mov     cx, ds
add     cx, 8
mov     ds, cx
assume ds:nothing
pop     cx
add     cx, ax

loc_1A7B0:
shr     cx, 1
rep movsw
rcl     cx, 1
rep movsb
pop     ds
assume ds:nothing
call    sub_1A653
sti
mov     ax, [bx+16h]
pop     cx
test    byte ptr [bx+26h], 1
jnz     short loc_1A7D4
sub     dx, ax
jz      short loc_1A7CF
cmp     ax, cx
jz      short loc_1A772

loc_1A7CF:
mov     ax, [bp+14h]
sub     ax, dx

loc_1A7D4:
mov     [bp+16h], ax
jmp     loc_1A5EF

loc_1A7DA:              ; jumptable 0001A5D7 case 10
call    sub_1A8D8
jb      short loc_1A7F9
mov     cx, ds:0Eh
dec     cx
mov     di, ds:0Ah
mov     [bx+12h], di
mov     si, [bp+12h]
mov     ds, word ptr [bp+4]

loc_1A7F1:
lodsb
stosb
cmp     al, 24h ; '$'
loopne  loc_1A7F1
push    es
pop     ds
assume ds:nothing

loc_1A7F9:
call    sub_1A653
jmp     loc_1A5EF

loc_1A7FF:              ; jumptable 0001A5D7 case 11
call    sub_1A8D8
jnb     short loc_1A807
jmp     loc_1A5DC       ; jumptable 0001A5D7 cases 3-6,14,15,25,26,30-33,39,46,47,49,52,55,56,63,67,70,71,78,81-86,88-90,93,94,98,100,101,103-105

loc_1A807:
mov     di, ds:0Ah
mov     [bx+12h], di
mov     ds, word ptr [bp+4]
assume ds:nothing
mov     si, [bp+12h]
mov     cl, [si]
xor     ch, ch
inc     cx
inc     cx
push    ds
push    cx
push    si
push    di
rep movsb
push    es
pop     ds
assume ds:nothing
call    sub_1A653
pop     si
pop     di
pop     cx
pop     es
assume es:nothing
rep movsb
jmp     sub_1A5F8

loc_1A82E:              ; jumptable 0001A5D7 case 13
cmp     byte ptr [bp+16h], 0Ah
jz      short loc_1A7FF ; jumptable 0001A5D7 case 11
jmp     loc_1A5DC       ; jumptable 0001A5D7 cases 3-6,14,15,25,26,30-33,39,46,47,49,52,55,56,63,67,70,71,78,81-86,88-90,93,94,98,100,101,103-105

loc_1A837:              ; jumptable 0001A5D7 cases 2,8,9
dec     byte ptr ds:10EDh

loc_1A83B:              ; jumptable 0001A5D7 cases 3-6,14,15,25,26,30-33,39,46,47,49,52,55,56,63,67,70,71,78,81-86,88-90,93,94,98,100,101,103-105
jmp     loc_1A5DC
; END OF FUNCTION CHUNK FOR sub_1A57E



sub_1A83E proc near
test    byte ptr ds:14h, 4
jnz     short locret_1A857
sti
mov     es, word ptr ds:0C2Ch
mov     al, es:46Ch
mov     ah, al
xchg    al, ds:10EDh
sub     al, ah
cli

locret_1A857:
retn
sub_1A83E endp

; START OF FUNCTION CHUNK FOR sub_1A57E

loc_1A858:              ; jumptable 0001A5D7 case 7
cmp     byte ptr [bp+12h], 0FFh
jnz     short loc_1A83B
call    sub_1A67F
call    sub_1A83E
jnz     short loc_1A86D
or      byte ptr [bx+26h], 40h

loc_1A86A:
jmp     loc_1ADFD

loc_1A86D:
call    sub_1A653
test    byte ptr [bx+26h], 40h
jnz     short loc_1A86A
dec     byte ptr ds:10EDh
jmp     short loc_1A86A

loc_1A87C:              ; jumptable 0001A5D7 case 12
call    sub_1A83E
jz      short loc_1A88F
call    sub_1A653
mov     al, [bx+16h]
or      al, al
jz      short loc_1A88F
dec     byte ptr ds:10EDh

loc_1A88F:
mov     [bp+16h], al
jmp     sub_1A5F8
; END OF FUNCTION CHUNK FOR sub_1A57E
; START OF FUNCTION CHUNK FOR sub_1A8A3

loc_1A895:
push    bx
mov     bx, di
mov     ax, 6
push    cs
call    near ptr sub_1A179
xchg    ax, dx
pop     bx
jmp     short loc_1A8C0
; END OF FUNCTION CHUNK FOR sub_1A8A3



sub_1A8A3 proc near

; FUNCTION CHUNK AT 0FB5 SIZE 0000000E BYTES

cmp     byte ptr ds:2Eh, 0
jz      short loc_1A895
push    es
mov     ax, 8
mov     es, ax
assume es:nothing
and     di, 0FFF8h
mov     ax, es:[di+2]
mov     cl, es:[di+4]
mov     ch, es:[di+7]
pop     es
assume es:nothing

loc_1A8C0:
cmp     cx, 10h
jnb     short loc_1A8D3
test    al, 0Fh
jnz     short loc_1A8D3
shr     ax, 4
shl     cl, 4
or      ah, cl
stc
retn

loc_1A8D3:
mov     ax, ds:9B4h
clc
retn
sub_1A8A3 endp




sub_1A8D8 proc near
mov     di, [bp+4]
call    sub_1A8A3
mov     [bx+4], ax
retn
sub_1A8D8 endp




sub_1A8E2 proc near
mov     di, [bp+6]
call    sub_1A8A3
mov     [bx+6], ax
retn
sub_1A8E2 endp




sub_1A8EC proc near
push    bx
xor     bh, bh
mov     bl, [bp+16h]
mov     dl, [bp+12h]
mov     di, bx
shl     bx, 3
lea     ax, [bx-40h]
sar     ax, 1
cmp     ax, 9Ch
nop
jnb     short loc_1A92F
cmp     bx, 108h
jz      short loc_1A92F
mov     [di+10BEh], dl
add     ax, 111Ch
mov     si, ds:9B6h
shr     bx, 1
or      dl, dl
jnz     short loc_1A924
mov     ax, [bx+0F6Ah]
mov     si, [bx+0F6Ch]

loc_1A924:
mov     es, word ptr ds:0C2Ch
mov     es:[bx], ax
mov     es:[bx+2], si

loc_1A92F:
pop     bx
retn
sub_1A8EC endp

; START OF FUNCTION CHUNK FOR sub_1A57E

loc_1A931:
mov     cx, [bp+4]
push    edx
push    eax
movzx   edx, word ptr [bp+12h]
cmp     cx, ds:0C24h
jz      short loc_1A978
cmp     cx, ds:0C3Ah
jz      short loc_1A978
lar     eax, ecx
bt      eax, 16h
jb      short loc_1A978
mov     di, bx
shl     di, 3
cld
mov     es, word ptr ds:0C22h
add     di, 448Eh
push    di
mov     al, 0E8h
stosb
mov     ax, 551Ch
sub     ax, di
stosw
mov     al, 0EAh
stosb
mov     ax, dx
stosw
mov     ax, cx
stosw
mov     cx, cs
pop     dx

loc_1A978:
mov     ax, 205h
push    cs
call    near ptr sub_1A179
pop     eax
pop     edx
mov     cx, bx
shl     bx, 3
cmp     byte ptr ds:0C42h, 0
ja      short loc_1A9FC
sub     cx, 1Bh
cmp     cx, 14h
jnb     short loc_1A9A1
mov     ax, 42C0h
inc     cx
shl     ax, cl
jb      short loc_1A9A1
jmp     short loc_1A9FC

loc_1A9A1:
jmp     loc_1AA58

loc_1A9A4:
jmp     loc_1AA8B

loc_1A9A7:
jmp     short loc_1A931

loc_1A9A9:              ; jumptable 0001A5D7 case 38
push    bx
mov     dx, [bp+12h]
mov     cx, [bp+4]
xor     bh, bh
mov     bl, [bp+16h]
cmp     bl, 0Dh
jz      short loc_1A9A4
mov     di, bx
cmp     byte ptr ds:2Eh, 0
jz      short loc_1A9A7
mov     ax, 205h
movzx   edx, dx
push    cs
call    near ptr sub_1A179
mov     ax, bx
shl     bx, 3
cmp     ax, 10h
jbe     short loc_1A9FC
push    10h
pop     es
assume es:nothing
mov     byte ptr es:[bx+5], 8Eh
cmp     cx, 18h
jz      short loc_1A9FC
cmp     cx, 70h ; 'p'
jz      short loc_1A9FC
push    ds
push    8
pop     ds
assume ds:nothing
mov     si, cx
test    byte ptr [si+6], 40h
pop     ds
assume ds:nothing
jnz     short loc_1A9FC
mov     byte ptr es:[bx+5], 86h

loc_1A9FC:
shr     bx, 1
lea     ax, [bx-20h]
cmp     ax, 9Ch
nop
jnb     short loc_1AA58
cmp     bx, 84h
jz      short loc_1AA58
push    cx
mov     cl, 1
xchg    cl, [di+10BEh]
or      cl, cl
jnz     short loc_1AA2D
mov     si, ax
mov     es, word ptr ds:0C2Ch
assume es:nothing
mov     cx, es:[bx]
mov     [si+0F8Ah], cx
mov     cx, es:[bx+2]
mov     [si+0F8Ch], cx

loc_1AA2D:
pop     cx
add     ax, 111Ch
mov     si, ds:9B6h
cmp     cx, 70h ; 'p'
jz      short loc_1AA40
cmp     cx, ds:0C40h
jnz     short loc_1AA4D

loc_1AA40:
mov     byte ptr [di+10BEh], 0

loc_1AA45:
mov     ax, [bx+0F6Ah]
mov     si, [bx+0F6Ch]

loc_1AA4D:
mov     es, word ptr ds:0C2Ch
mov     es:[bx], ax
mov     es:[bx+2], si

loc_1AA58:
pop     bx
mov     dx, 1301h
mov     cl, [bp+16h]
cmp     cl, dl
jb      short loc_1AA88
cmp     ds:1185h, dl
ja      short loc_1AA88
jb      short loc_1AA7E
mov     ch, cl
mov     ax, ds:4Ah
sub     ch, ah
cmp     ch, 8
jb      short loc_1AA7E
sub     cl, al
cmp     cl, 8
jnb     short loc_1AA88

loc_1AA7E:
mov     es, word ptr [bp+4]
mov     ax, 0FF40h
push    cs
call    near ptr sub_1A126

loc_1AA88:
jmp     sub_1A5F8

loc_1AA8B:
shl     bx, 2
cmp     cx, ds:0C40h
jz      short loc_1AA99
cmp     cx, 70h ; 'p'
jnz     short loc_1AAA0

loc_1AA99:
xor     cx, cx
call    sub_1AAB3
jmp     short loc_1AA45

loc_1AAA0:
call    sub_1AAB3
cmp     byte ptr ds:1181h, 0
jnz     short loc_1AA58
mov     ax, 1130h
mov     si, ds:9B6h
jmp     short loc_1AA4D
; END OF FUNCTION CHUNK FOR sub_1A57E



sub_1AAB3 proc near
push    ds
push    48h ; 'H'
pop     ds
assume ds:nothing
mov     ds:1060h, dx
mov     ds:1062h, cx
pop     ds
assume ds:nothing
retn
sub_1AAB3 endp

; START OF FUNCTION CHUNK FOR sub_1A57E

loc_1AAC1:              ; jumptable 0001A5D7 case 54
push    bx
mov     bl, [bp+16h]
xor     bh, bh
cmp     ds:2Eh, bh
jz      short loc_1AAD2
cmp     bl, 0Dh
jz      short loc_1AAE9

loc_1AAD2:
mov     ax, 204h
push    edx
pop     dx
push    cs
call    near ptr sub_1A179
push    dx
pop     edx

loc_1AADF:
mov     [bp+6], cx
mov     [bp+10h], dx
pop     bx
jmp     sub_1A5F8

loc_1AAE9:
push    10h
shl     bx, 3
pop     es
mov     cx, es:[bx+2]
mov     dx, es:[bx]
jmp     short loc_1AADF
; END OF FUNCTION CHUNK FOR sub_1A57E



sub_1AAF8 proc near
push    bx
mov     bx, ds:0C2Ah
mov     ax, 6
int     31h             ; DPMI Services   ax=func xxxxh
                        ; GET SEGMENT BASE ADDRESS
                        ; BX = selector
                        ; Return: CF set on error
                        ; CF clear if successful, CX:DX = linear base address of segment
mov     bx, 0
jb      short loc_1AB14
mov     ax, 10h
cmp     cx, ax
jnb     short loc_1AB14
xchg    ax, cx
xchg    ax, dx
div     cx
mov     bx, ax

loc_1AB14:
mov     es, word ptr ds:0C28h
mov     es:2Ch, bx
pop     bx
retn
sub_1AAF8 endp

; START OF FUNCTION CHUNK FOR sub_1A57E

loc_1AB1F:              ; jumptable 0001A5D7 cases 1,77
cmp     byte ptr ds:2Eh, 0
jz      short loc_1AB67
mov     ax, ds:0C10h
mov     dx, ds:0C12h

loc_1AB2D:
mov     bx, ax
or      bx, dx
jz      short loc_1AB4C
mov     di, ax
mov     si, dx
push    0
push    dx
push    ax
call    sub_1D8CC
add     sp, 6
push    dx
push    ax
mov     ax, 502h
int     31h             ; DPMI Services   ax=func xxxxh
                        ; FREE MEMORY BLOCK
                        ; SI:DI = handle of memory block
                        ; Return: CF set on error
                        ; CF clear if successful
pop     ax
pop     dx
jmp     short loc_1AB2D

loc_1AB4C:
call    sub_1AAF8
mov     word ptr ds:99Eh, 0
sub     word ptr [bp+1Eh], 2
lea     sp, [bp+4]
pop     ds
pop     es
popa
add     sp, 6
jmp     far ptr 18h:10EEh

loc_1AB67:
mov     ax, [bp+16h]
push    ax
push    ax
push    word ptr ds:0C24h
push    71DCh
retf

loc_1AB74:              ; jumptable 0001A5D7 case 50
push    bx
call    sub_1B726
mov     ax, 204h
mov     bl, 23h ; '#'
push    cs
call    near ptr sub_1A179
cmp     cx, ds:0C24h
jnz     short loc_1AB9C
cmp     dx, 7560h
jnz     short loc_1AB9C
mov     cx, ds:196h
mov     edx, ds:192h
inc     al
push    cs
call    near ptr sub_1A179

loc_1AB9C:
call    sub_1AAF8
mov     bx, ds:0CEAh
mov     ax, 0BF04h
call    near ptr byte_1B3FD
mov     word ptr ds:99Eh, 0
mov     ax, ds:5Ah
pop     bx
mov     [bx+12h], ax
mov     byte ptr [bx+17h], 31h ; '1'
call    sub_1A653

loc_1ABBD:              ; jumptable 0001A5D7 case 72
call    sub_1A8D8
pushf
jb      short loc_1ABC9
mov     ax, ds:0Ah
mov     [bx+0Ah], ax

loc_1ABC9:
call    sub_1A653
popf
jb      short loc_1ABEB
test    byte ptr [bx+26h], 1
jz      short loc_1ABD8
jmp     loc_1ADFD

loc_1ABD8:
mov     es, word ptr [bp+4]
mov     di, [bp+0Ah]
mov     si, ds:0Ah
mov     cx, 40h ; '@'

loc_1ABE5:
lodsb
stosb
or      al, al
loopne  loc_1ABE5

loc_1ABEB:
jmp     loc_1ADFD

loc_1ABEE:              ; jumptable 0001A5D7 case 27
mov     ax, [bp+12h]
mov     ds:9B0h, ax
mov     ax, [bp+4]
mov     ds:9B2h, ax
call    sub_1A8D8
mov     al, 0
jb      short loc_1AC08
mov     word ptr [bx+12h], 1100h
mov     al, 1

loc_1AC08:
mov     ds:1180h, al
call    sub_1A653
jmp     sub_1A5F8

loc_1AC11:              ; jumptable 0001A5D7 case 48
mov     ax, ds:9B0h
mov     [bp+10h], ax
mov     ax, ds:9B2h
mov     [bp+6], ax
jmp     sub_1A5F8

loc_1AC20:              ; jumptable 0001A5D7 case 79
call    sub_1A6B3
push    ds
inc     byte ptr ds:1182h
mov     ah, 1Ah
lds     dx, ds:9B0h
push    cs
call    near ptr sub_1A126
pop     ds
dec     byte ptr ds:1182h

loc_1AC37:              ; jumptable 0001A5D7 case 80
cmp     byte ptr ds:1180h, 0
jz      short loc_1AC4C
push    ds
lds     si, ds:9B0h
mov     di, 1100h
mov     cx, 2Bh ; '+'
rep movsb
pop     ds

loc_1AC4C:
call    sub_1A653
mov     cx, 2Bh ; '+'

loc_1AC52:
cmp     byte ptr ds:1180h, 0
jz      short loc_1AC62
les     di, ds:9B0h
mov     si, 1100h
rep movsb

loc_1AC62:
jmp     loc_1ADFD

loc_1AC65:              ; jumptable 0001A5D7 cases 18,19
call    sub_1AC83
cmp     byte ptr ds:1180h, 0
jz      short loc_1AC62
cmp     byte ptr ds:1100h, 0FFh
mov     cx, 2Ch ; ','
jz      short loc_1AC52
mov     cl, 25h ; '%'
jmp     short loc_1AC52

loc_1AC7D:              ; jumptable 0001A5D7 cases 16,17,20-24,34-37,40,41
call    sub_1AC83
jmp     sub_1A5F8
; END OF FUNCTION CHUNK FOR sub_1A57E



sub_1AC83 proc near
call    sub_1A8D8
pushf
jb      short loc_1ACA0
mov     di, ds:0Ah
mov     si, [bp+12h]
mov     ds, word ptr [bp+4]
mov     cx, 16h
rep movsw
push    es
pop     ds
mov     ax, ds:0Ah
mov     [bx+12h], ax

loc_1ACA0:
call    sub_1A653
popf
jb      short loc_1ACB5
mov     di, [bp+12h]
mov     si, ds:0Ah
mov     es, word ptr [bp+4]
mov     cx, 16h
rep movsw

loc_1ACB5:
mov     ax, [bx+16h]
mov     [bp+16h], ax
retn
sub_1AC83 endp

; START OF FUNCTION CHUNK FOR sub_1A57E

loc_1ACBC:              ; jumptable 0001A5D7 case 42
mov     ax, ds:9B4h
mov     [bx+4], ax
mov     [bx+6], ax
mov     di, ds:0Ah
mov     [bx+8], di
mov     ds, word ptr [bp+6]
mov     si, [bp+8]
mov     cx, 6
rep movsw
add     di, 20h ; ' '
mov     es:[bx+0Ah], di
mov     si, [bp+0Ah]
mov     ds, word ptr [bp+4]
mov     cx, 80h
lsl     ax, [bp+4]
sub     ax, si
inc     ax
jz      short loc_1ACF6
cmp     ax, cx
ja      short loc_1ACF6
mov     cx, ax

loc_1ACF6:
rep movsb
push    es
pop     ds
call    sub_1A653
mov     es, word ptr [bp+6]
mov     di, [bp+8]
mov     si, ds:0Ah
mov     cx, 6
rep movsw
add     si, 20h ; ' '
sub     si, [bx+0Ah]
sub     [bp+0Ah], si
jmp     loc_1ADFD

loc_1AD18:              ; jumptable 0001A5D7 case 43
test    byte ptr ds:15h, 1
jnz     short loc_1AD58
cmp     byte ptr ds:34h, 15h
jnz     short loc_1AD58
cmp     word ptr ds:10FAh, 0
jz      short loc_1AD5B
call    sub_1A67F
push    40h ; '@'
pop     es
assume es:nothing
mov     al, es:6Ch
mov     ah, al
xchg    al, ds:10FFh
xor     al, ah
test    al, 0F0h
jnz     short loc_1AD5B
mov     ax, ds:10FAh
mov     [bp+12h], ax
mov     ax, ds:10FCh
mov     [bp+14h], ax
mov     al, ds:10FEh
mov     [bp+16h], al

loc_1AD55:
jmp     sub_1A5F8

loc_1AD58:              ; jumptable 0001A5D7 cases 3-6,14,15,25,26,30-33,39,46,47,49,52,55,56,63,67,70,71,78,81-86,88-90,93,94,98,100,101,103-105
jmp     loc_1A5DC

loc_1AD5B:
call    sub_1A653
mov     ax, [bx+12h]
mov     ds:10FAh, ax
mov     ax, [bx+14h]
mov     ds:10FCh, ax
mov     al, [bx+16h]
mov     ds:10FEh, al
jmp     loc_1A5DF

loc_1AD73:              ; jumptable 0001A5D7 case 44
mov     word ptr ds:10FAh, 0
jmp     short loc_1AD58

loc_1AD7B:              ; jumptable 0001A5D7 case 45
test    byte ptr ds:15h, 1
jnz     short loc_1AD58
cmp     byte ptr ds:34h, 15h
jnz     short loc_1AD58
call    sub_1A67F
push    40h ; '@'
pop     es
mov     bx, es:6Eh
mov     ax, 16h
mul     bx
mov     cx, 3
div     cx
mov     cx, es:6Ch
shr     cx, 0Dh
add     cx, ax
mov     ax, es:6Ch
sub     ax, cx
sbb     bl, 0
mov     cx, 0CFBh
mul     cx
mov     cx, 0EC54h
div     cx
mov     ch, 3Ch ; '<'
div     ch
xchg    ah, bl
mov     [bp+14h], ax
xchg    ax, dx
xor     dx, dx
mov     cx, 25Dh
div     cx
mov     ah, bl
mov     [bp+12h], ax
jmp     short loc_1AD55

loc_1ADD3:              ; jumptable 0001A5D7 case 87
call    sub_1A6B3
call    sub_1A8E2
jb      short loc_1ADFA
mov     di, ds:0Ah
add     di, 100h
mov     [bx+8], di
mov     cx, ds:0Eh
mov     ds, word ptr [bp+6]
mov     si, [bp+8]
dec     ch

loc_1ADF2:
lodsb
stosb
or      al, al
loopne  loc_1ADF2
push    es
pop     ds
assume ds:nothing

loc_1ADFA:
call    sub_1A653

loc_1ADFD:
mov     ax, [bx+16h]
mov     [bp+16h], ax
jmp     loc_1A5EF

loc_1AE06:              ; jumptable 0001A5D7 case 73
or      byte ptr [bp+26h], 1
push    0
push    ss
push    bp
sti
call    sub_1C5D9
pop     cx

loc_1AE13:
pop     cx
pop     cx
jmp     sub_1A5F8
; END OF FUNCTION CHUNK FOR sub_1A57E


; Attributes: bp-based frame

sub_1AE18 proc near

arg_0= word ptr  4
arg_C= word ptr  10h
arg_12= word ptr  16h

push    bp
mov     bp, sp
mov     bp, [bp+arg_0]
mov     bx, ds:996h
mov     byte ptr [bx+17h], 48h ; 'H'
call    sub_1A653

loc_1AE29:
xor     dx, dx
mov     ax, [bx+10h]
mov     [bp+arg_C], ax
mov     ds:11FAh, ax
mov     ax, [bx+16h]
mov     [bp+arg_12], ax
test    byte ptr [bx+26h], 1
jz      short loc_1AE42
xor     ax, ax

loc_1AE42:
pop     bp
retn
sub_1AE18 endp

; START OF FUNCTION CHUNK FOR sub_1A57E

loc_1AE44:              ; jumptable 0001A5D7 case 74
or      byte ptr [bp+26h], 1
push    ss
push    bp
sti
call    sub_1CA72
jmp     short loc_1AE13
; END OF FUNCTION CHUNK FOR sub_1A57E


; Attributes: bp-based frame

sub_1AE50 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     bp, [bp+arg_0]
mov     bx, ds:996h
mov     byte ptr [bx+17h], 49h ; 'I'
call    sub_1A653
mov     al, [bx+26h]
and     ax, 1
pop     bp
retn
sub_1AE50 endp

; START OF FUNCTION CHUNK FOR sub_1A57E

loc_1AE69:              ; jumptable 0001A5D7 case 75
or      byte ptr [bp+26h], 1
push    ss
push    bp
sti
call    sub_1C809
jmp     short loc_1AE13
; END OF FUNCTION CHUNK FOR sub_1A57E


; Attributes: bp-based frame

sub_1AE75 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     bp, [bp+arg_0]
mov     bx, ds:996h
push    di
call    sub_1A8E2
pop     di
jnb     short loc_1AE8B
call    sub_1A653
jmp     short loc_1AE29

loc_1AE8B:              ; Trap to Debugger
int     3
sub_1AE75 endp

; START OF FUNCTION CHUNK FOR sub_1A57E

loc_1AE8C:              ; jumptable 0001A5D7 case 76
cmp     byte ptr [bp+16h], 0
jz      short loc_1AE9E
mov     word ptr [bp+16h], 1
or      byte ptr [bp+26h], 1
jmp     sub_1A5F8

loc_1AE9E:
mov     di, ds:0Ah
push    di
xor     ax, ax
mov     cx, ds:0Eh
shr     cx, 1
rep stosw
call    sub_1A6B3
pop     di
add     di, 80h
mov     [bx+10h], di
mov     si, [bp+10h]
mov     ds, word ptr [bp+6]
assume ds:nothing
mov     cx, 7
rep movsw
mov     bx, es:0Ah
lea     di, [bx+90h]
lds     si, es:[bx+86h]
mov     cx, ds
inc     cx
loop    loc_1AEDA
push    es
pop     ds
assume ds:nothing
mov     si, di

loc_1AEDA:
mov     cx, 8
rep movsw
lds     si, es:[bx+8Ah]
assume ds:nothing
mov     cx, ds
inc     cx
loop    loc_1AEED
push    es
pop     ds
assume ds:nothing
mov     si, di

loc_1AEED:
mov     cx, 8
rep movsw
push    di
lds     si, es:[bx+82h]
assume ds:nothing
mov     dx, 80h
mov     cx, ds
lsl     cx, cx
sub     cx, si
cmp     cx, dx
jb      short loc_1AF08
mov     cx, dx

loc_1AF08:
rep movsb
pop     di
add     di, 80h
xor     ax, ax
xchg    ax, es:[bx+80h]
cmp     ax, 30h ; '0'
jbe     short loc_1AF47
mov     ds, ax
xor     si, si
lsl     cx, ax
mov     dx, es:0Eh
sub     dx, 130h
cmp     cx, dx
jb      short loc_1AF31
mov     cx, dx

loc_1AF31:
shr     cx, 1
rep movsw
mov     ax, bx
shr     ax, 4
add     ax, es:9B4h
add     ax, 13h
mov     es:[bx+80h], ax

loc_1AF47:
push    es
pop     ds
assume ds:nothing
mov     dx, ds:9B4h
lea     di, [bx+82h]
lea     ax, [bx+0B0h]
stosw
mov     ax, dx
stosw
lea     ax, [bx+90h]
stosw
mov     ax, dx
stosw
lea     ax, [bx+0A0h]
stosw
mov     ax, dx
stosw
inc     byte ptr ds:1182h
cmp     byte ptr ds:2Eh, 0
jnz     short loc_1AFCD
push    ax
push    es
mov     dl, 0
xchg    dl, ds:980h
mov     bx, 0ADh
mov     ah, 48h
int     21h             ; DOS - 2+ - ALLOCATE MEMORY
                        ; BX = number of 16-byte paragraphs desired
jnb     short loc_1AF8F
dec     byte ptr ds:1182h
mov     ax, 0FFFFh
jmp     sub_1A5F8

loc_1AF8F:
mov     ds:1183h, ax
mov     ds:980h, dl
mov     es, ax
assume es:nothing
xor     di, di
push    cs
push    offset loc_1AFA6
push    word ptr ds:0C24h
push    756Ch
retf
; END OF FUNCTION CHUNK FOR sub_1A57E

loc_1AFA6:
mov     di, 400h
push    cs
push    offset loc_1AFB5
push    word ptr ds:0C24h
push    75E1h
retf

loc_1AFB5:
pop     es
assume es:nothing
push    ds
mov     ds, word ptr ds:0C30h
assume ds:nothing
mov     edx, ds:6D46h
mov     cx, ds:6D4Ah
mov     bl, 21h ; '!'
mov     ax, 205h
int     31h             ; DPMI Services   ax=func xxxxh
                        ; SET PROTECTED MODE INTERRUPT VECTOR
                        ; BL = interrupt number, CX:DX / CX:EDX = selector:offset of handler
                        ; Return: CF set on error
                        ; CF clear if successful
pop     ds
pop     ax
; START OF FUNCTION CHUNK FOR sub_1A57E

loc_1AFCD:
mov     bx, ds:996h
mov     [bx+6], ax
call    sub_1AAF8
mov     ax, ds:36h
push    ax
xchg    al, ah
mov     ah, 80h
mov     ds:35h, ax
call    sub_1A653
pop     ax
mov     ah, ds:35h
mov     ds:36h, ax
cmp     byte ptr ds:2Eh, 0
jnz     short loc_1B01B
push    bx
mov     es, word ptr ds:1183h
mov     di, 400h
push    cs
push    offset loc_1B008
push    word ptr ds:0C24h
push    7614h
retf
; END OF FUNCTION CHUNK FOR sub_1A57E

loc_1B008:
xor     di, di
push    cs
push    offset loc_1B016
push    word ptr ds:0C24h
push    75A1h
retf

loc_1B016:
mov     ah, 49h
int     21h             ; DOS - 2+ - FREE MEMORY
                        ; ES = segment address of area to be freed
pop     bx
; START OF FUNCTION CHUNK FOR sub_1A57E

loc_1B01B:
push    ds
mov     ah, 1Ah
lds     dx, ds:9B0h
push    cs
call    near ptr sub_1A126
pop     ds
dec     byte ptr ds:1182h
mov     es, word ptr ds:0C28h
mov     ax, ds:0C2Ah
mov     es:2Ch, ax
jmp     loc_1ADFD

loc_1B039:              ; jumptable 0001A5D7 case 99
mov     ax, ds:0C28h
mov     [bp+10h], ax
jmp     sub_1A5F8

loc_1B042:              ; jumptable 0001A5D7 case 53
mov     si, 6
jmp     short loc_1B04A

loc_1B047:              ; jumptable 0001A5D7 cases 28,29,51
mov     si, 4

loc_1B04A:
call    sub_1A653
mov     di, ds:0C3Ch
mov     [bp+si], di
mov     ax, [bx+si]
call    sub_1B05B
jmp     loc_1A5DF
; END OF FUNCTION CHUNK FOR sub_1A57E



sub_1B05B proc near
mov     cx, 10h
mul     cx
xchg    ax, dx
xchg    ax, cx
xchg    bx, di
mov     ax, 7
push    cs
call    near ptr sub_1A179
xchg    bx, di
retn
sub_1B05B endp




sub_1B06E proc near
mov     ax, 19DDh
xchg    ax, [si+12h]
mov     ds:10F6h, ax
mov     ax, cs
xchg    ax, [si+14h]
mov     ds:10F8h, ax
retn
sub_1B06E endp

; START OF FUNCTION CHUNK FOR sub_1A57E

loc_1B080:              ; jumptable 0001A5D7 case 57
cmp     word ptr [bp+12h], 0FFFFh
jz      short loc_1B0CD
mov     di, ds:0Ah
push    di
mov     [bx+12h], di
push    ds
mov     ds, word ptr [bp+4]
mov     si, [bp+12h]
mov     cx, 11h
rep movsw
pop     ds
mov     ax, ds:9B4h
mov     [bx+4], ax
call    sub_1A653
mov     es, word ptr [bp+4]
pop     si
call    sub_1B06E
mov     di, [bp+12h]
mov     cx, 11h
rep movsw
mov     ax, [bx+10h]
mov     [bp+10h], ax
jmp     loc_1ADFD

loc_1B0BC:              ; jumptable 0001A5D7 case 69
mov     al, [bp+16h]
cmp     al, 0Dh
jz      short loc_1B110
cmp     al, 0Ch
jz      short loc_1B110
sub     al, 2
cmp     al, 3
jb      short loc_1B0D0

loc_1B0CD:              ; jumptable 0001A5D7 cases 3-6,14,15,25,26,30-33,39,46,47,49,52,55,56,63,67,70,71,78,81-86,88-90,93,94,98,100,101,103-105
jmp     loc_1A5DC

loc_1B0D0:
call    sub_1A8D8
jb      short loc_1B0CD
mov     cx, [bp+14h]
cmp     cx, ds:0Eh
ja      short loc_1B104
mov     di, ds:0Ah
mov     [bx+12h], di
mov     si, [bp+12h]
push    ds
mov     ds, word ptr [bp+4]
rep movsb
pop     ds
call    sub_1A653
mov     cx, [bp+14h]
mov     es, word ptr [bp+4]
mov     di, [bp+12h]
mov     si, ds:0Ah
rep movsb
jmp     loc_1ADFD

loc_1B104:
mov     word ptr [bp+16h], 8
or      byte ptr [bp+26h], 1
jmp     sub_1A5F8

loc_1B110:
jmp     short loc_1B104

loc_1B112:              ; jumptable 0001A5D7 case 95
mov     al, [bp+16h]
or      al, al
jnz     short loc_1B14E
mov     si, [bp+12h]
mov     di, ds:0Ah
mov     [bx+12h], di
mov     ds, word ptr [bp+4]
mov     cx, 8
rep movsw
push    es
pop     ds
mov     ax, ds:9B4h
mov     [bx+4], ax
call    sub_1A653
mov     ax, [bx+14h]
mov     [bp+14h], ax
mov     es, word ptr [bp+4]
mov     di, [bp+12h]
mov     si, ds:0Ah
mov     cx, 8
rep movsw
jmp     loc_1ADFD

loc_1B14E:
cmp     al, 2
jnz     short loc_1B16C
mov     di, ds:0Ah
mov     [bx+0Ah], di
mov     si, [bp+0Ah]
mov     ds, word ptr [bp+4]
mov     cx, [bp+14h]
rep movsb
push    es
pop     ds
call    sub_1A653
jmp     loc_1ADFD

loc_1B16C:
cmp     al, 3
jnz     short loc_1B1D8
mov     si, ds:0Ah
mov     [bx+8], si
mov     ax, ds:9B4h
mov     [bx+6], ax
call    sub_1A653
mov     cx, [bx+14h]
mov     [bp+14h], cx
mov     di, [bp+8]
mov     es, word ptr [bp+6]
rep movsb
jmp     loc_1ADFD

loc_1B191:              ; jumptable 0001A5D7 case 102
mov     cl, [bp+16h]
cmp     cl, 20h ; ' '
jnb     short loc_1B207
cmp     cl, 1
jz      short loc_1B1DB
mov     ax, 2F00h
shl     ax, cl
jns     short loc_1B1D8
mov     ax, ds:0Ah
mov     [bx+8], ax
mov     ax, ds:9B4h
mov     [bx+6], ax
call    sub_1A653
mov     cx, [bx+14h]
mov     [bp+14h], cx
mov     di, [bp+8]
mov     es, word ptr [bp+6]
mov     si, ds:0Ah
rep movsb
mov     si, [bp+8]
mov     ax, ds:0C3Ch
mov     di, ax
xchg    ax, es:[si+3]
call    sub_1B05B
jmp     loc_1ADFD

loc_1B1D8:              ; jumptable 0001A5D7 cases 3-6,14,15,25,26,30-33,39,46,47,49,52,55,56,63,67,70,71,78,81-86,88-90,93,94,98,100,101,103-105
jmp     loc_1A5DC

loc_1B1DB:
mov     si, ds:0Ah
mov     [bx+8], si
mov     ax, ds:9B4h
mov     [bx+6], ax
call    sub_1A653
mov     cx, [bx+14h]
cmp     cx, 1Dh
jb      short loc_1B1FC
add     si, 7
call    sub_1B06E
sub     si, 7

loc_1B1FC:
mov     di, [bp+8]
mov     es, word ptr [bp+6]
rep movsb
jmp     loc_1ADFD

loc_1B207:
sub     cl, 20h ; ' '
jz      short loc_1B1D8
dec     cl
jnz     short loc_1B23F
mov     cx, [bp+14h]
mov     si, [bp+12h]
mov     di, ds:0Ah
mov     [bx+8], di
mov     ax, ds:9B4h
mov     [bx+4], ax
push    ds
mov     ds, word ptr [bp+4]
rep movsb
pop     ds
call    sub_1A653
mov     cx, [bp+14h]
mov     si, ds:0Ah
mov     di, [bp+12h]
mov     es, word ptr [bp+4]
rep movsb
jmp     loc_1ADFD

loc_1B23F:
dec     cl
jnz     short loc_1B1D8
jmp     loc_1A68F       ; jumptable 0001A5D7 case 91

loc_1B246:              ; jumptable 0001A5D7 case 96
mov     al, [bp+16h]
sub     al, 2
cmp     al, 2
ja      short loc_1B1D8
mov     cx, 80h
jnz     short loc_1B256
xor     cx, cx

loc_1B256:
push    cx
push    10h
jmp     short loc_1B25F

loc_1B25B:              ; jumptable 0001A5D7 case 97
push    43h ; 'C'
push    43h ; 'C'

loc_1B25F:
mov     di, ds:0Ah
mov     [bx+0Ah], di
mov     ds, word ptr [bp+4]
mov     si, [bp+0Ah]
pop     cx
push    cx
jcxz    short loc_1B272
rep movsb

loc_1B272:
mov     es:[bx+8], di
mov     ds, word ptr [bp+6]
mov     si, [bp+8]
pop     dx
pop     cx
push    cx
push    dx
jcxz    short loc_1B284
rep movsb

loc_1B284:
push    es
pop     ds
mov     ax, ds:9B4h
mov     [bx+6], ax
mov     [bx+4], ax
call    sub_1A653
mov     si, ds:0Ah
mov     es, word ptr [bp+4]
mov     di, [bp+0Ah]
pop     cx
push    cx
jcxz    short loc_1B2A2
rep movsb

loc_1B2A2:
mov     es, word ptr [bp+6]
mov     di, [bp+8]
pop     dx
pop     cx
jcxz    short loc_1B2AE
rep movsb

loc_1B2AE:
mov     ax, [bx+10h]
mov     [bp+10h], ax
mov     ax, [bx+14h]
mov     [bp+14h], ax
jmp     loc_1ADFD
; END OF FUNCTION CHUNK FOR sub_1A57E
pusha
push    es
push    ds
mov     bp, sp
mov     ds, cs:word_1EDC0
assume ds:nothing
push    word ptr ds:0C2Ch
pop     es
mov     ax, ds:10F8h
xchg    ax, es:82h
push    ax
mov     ax, ds:10F6h
xchg    ax, es:80h
push    ax
push    es
push    ss
push    bp
push    ss
push    bp
push    20h ; ' '
call    dword ptr ds:22h
add     sp, 0Ah
pop     es
pop     word ptr es:80h
pop     word ptr es:82h
pop     ds
assume ds:nothing
pop     es
popa
retf
push    ax
mov     ax, ds:0Eh
cmp     cx, ax
jbe     short loc_1B305
mov     cx, ax

loc_1B305:
pop     ax
push    ds
push    es
mov     di, ds:0Ah
push    ds
pop     es
pop     ds
pusha
cld
rep movsb
popa
pop     ds
retn
pusha
mov     ax, ds:0Eh
cmp     cx, ax
jbe     short loc_1B320
mov     cx, ax

loc_1B320:
mov     di, si
mov     si, ds:0Ah
cld
rep movsb
popa
retn
pusha
mov     ax, ds:9B4h
push    ax
push    ax
mov     ax, sp
push    ss
push    ax
push    ss
push    ax
push    10h
call    dword ptr ds:22h
add     sp, 0Eh
popa
retn
db 80h, 0FCh, 13h, 74h, 0Eh, 80h, 0FCh, 10h
db 74h, 2Fh, 80h, 0FCh, 1Ch, 74h, 4Ah, 0E8h
db 8Ch, 0E9h, 10h, 3Ch, 4, 73h, 0F8h, 60h
db 6, 1Eh, 2Eh, 8Eh, 1Eh, 0E0h, 54h, 8Bh
db 0F5h, 8Bh, 0ECh, 3Ch, 2, 72h, 2, 0D1h
db 0E1h, 8Eh, 46h, 2, 0E8h, 8Ah, 0FFh, 8Bh
db 0EFh, 0E8h, 0B5h, 0FFh, 1Fh, 7, 61h, 66h
db 0CFh, 3Ch, 2, 74h, 2, 0EBh, 0D0h, 60h
db 6, 1Eh, 2Eh, 8Eh, 1Eh, 0E0h, 54h, 8Bh
db 0F2h, 0B9h, 11h, 0, 0E8h, 6Ah, 0FFh, 8Bh
db 0D7h, 0E8h, 95h, 0FFh, 1Fh, 7, 61h, 66h
db 0CFh, 3Ch, 0, 74h, 0B2h, 60h, 6, 1Eh
db 33h, 0D2h, 2 dup(52h), 8Bh, 0ECh, 2Eh
db 8Eh, 1Eh, 0E0h, 54h, 32h, 0C0h, 0CDh
db 10h, 8Bh, 0CBh, 0C1h, 0E1h, 6, 8Bh, 46h
db 16h, 3Ch, 1, 74h, 24h, 0FFh, 76h, 6, 7
db 8Bh, 76h, 10h, 0E8h, 34h, 0FFh, 8Bh, 46h
db 16h, 8Bh, 4Eh, 14h, 8Bh, 1Eh, 0Ah, 0
db 1Eh, 7, 0E8h, 55h, 0FFh, 89h, 46h, 16h
db 83h, 0C4h, 4, 1Fh, 7, 61h, 66h, 0CFh
db 51h, 8Bh, 4Eh, 14h, 1Eh, 7, 8Bh, 1Eh
db 0Ah, 0, 0E8h, 3Dh, 0FFh, 59h, 50h, 0FFh
db 76h, 6, 7, 8Bh, 76h, 10h, 0E8h, 1Ch, 0FFh
db 58h, 0EBh, 0D9h
byte_1B3FD db 0CDh
byte_1B3FE db 15h
retn
cmp     byte ptr ds:34h, 15h
jnz     short loc_1B40E
mov     ah, 88h
int     15h             ; Get Extended Memory Size
                        ; Return: CF clear on success
                        ; AX = size of memory above 1M in K
add     ax, 400h

loc_1B40E:
mov     bx, ds:98h
mov     dx, ds:9Ah
shr     bx, 6
shl     dx, 0Ah
or      bx, dx
cmp     ax, bx
jz      short loc_1B42F
mov     ax, bx
cmp     byte ptr ds:34h, 15h
jnz     short loc_1B42F

loc_1B42B:
xor     ax, ax
cwd
retn

loc_1B42F:
mov     ds:0ECEh, ax
push    si
push    di
mov     bx, 60h ; '`'
push    8
pop     es
assume es:nothing
xor     ax, ax
mov     es:[bx+2], ax
mov     byte ptr es:[bx+4], 10h
mov     es:[bx+7], al
mov     es, bx
assume es:nothing
mov     cx, 5
mov     si, 0EEEh
mov     di, 3
repe cmpsb
mov     ax, ds:0ECAh
mov     bx, es:[bx+1Eh]
jnz     short loc_1B464
cmp     bx, ax
jl      short loc_1B464
xchg    ax, bx

loc_1B464:
sub     ax, ds:0ECEh
neg     ax
jl      short loc_1B42B
mov     bx, 400h
mul     bx
pop     di
pop     si
retn
mov     bx, sp
mov     ax, 400h
mul     word ptr ds:0ECEh
sub     ax, ss:[bx+2]
sbb     dx, ss:[bx+4]
retn
db 0E8h, 7Dh, 1, 9 dup(0), 0E8h, 71h, 1
db 9 dup(0), 0E8h, 65h, 1, 9 dup(0), 0E8h
db 59h, 1, 9 dup(0), 0E8h, 4Dh, 1, 9 dup(0)
db 0E8h, 41h, 1, 9 dup(0), 0E8h, 35h, 1
db 9 dup(0), 0E8h, 29h, 1, 9 dup(0), 0E8h
db 1Dh, 1, 9 dup(0), 0E8h, 11h, 1, 9 dup(0)
db 0E8h, 5, 1, 9 dup(0), 0E8h, 0F9h, 0Ah dup(0)
db 0E8h, 0EDh, 0Ah dup(0), 0E8h, 0E1h, 0Ah dup(0)
db 0E8h, 0D5h, 0Ah dup(0), 0E8h, 0C9h, 0Ah dup(0)
db 0E8h, 0BDh, 0Ah dup(0), 0E8h, 0B1h, 0Ah dup(0)
db 0E8h, 0A5h, 0Ah dup(0), 0E8h, 99h, 0Ah dup(0)
db 0E8h, 8Dh, 0Ah dup(0), 0E8h, 81h, 0Ah dup(0)
db 0E8h, 75h, 0Ah dup(0), 0E8h, 69h, 0Ah dup(0)
db 0E8h, 5Dh, 0Ah dup(0), 0E8h, 51h, 0Ah dup(0)
db 0E8h, 45h, 0Ah dup(0), 0E8h, 39h, 0Ah dup(0)
db 0E8h, 2Dh, 0Ah dup(0), 0E8h, 21h, 0Ah dup(0)
db 0E8h, 15h, 0Ah dup(0), 0E8h, 9, 0Ah dup(0)


; Attributes: bp-based frame

sub_1B606 proc far

var_s0= word ptr  0

push    bp
mov     bp, sp
push    word ptr [bp+2]
mov     bp, [bp+var_s0]
sub     sp, 0Ah
pushad
push    gs
push    fs
push    ds
push    es
mov     cx, 20h ; ' '
mov     ds, cx
assume ds:nothing
mov     di, sp
mov     ax, ss
mov     fs, ax
mov     bx, fs:[di+32h]
mov     al, cs:[bx]
cmp     al, 0Eh
jnz     short loc_1B655
mov     bx, 0Eh
mov     edx, fs:[di+34h]
mov     ax, 1
lss     esp, ds:157Ch
call    large [fword ptr ds:1572h]
mov     bx, 68h ; 'h'
lldt    bx
mov     bx, fs
mov     ss, bx
mov     sp, di
jmp     loc_1B719

loc_1B655:
mov     ds:0A8Fh, esp
mov     word ptr ds:0A93h, ss
mov     dx, ds:4Ah
cmp     al, ds:1592h
jb      short loc_1B66E
cmp     al, ds:1593h
jbe     short loc_1B67E

loc_1B66E:
cmp     al, ds:1594h
jb      short loc_1B6D2
cmp     al, ds:1595h
ja      short loc_1B6D2
mov     dx, ds:4Ch

loc_1B67E:
mov     cx, 7
and     cx, ax
mov     al, 0Bh
out     dx, al
jmp     short $+2

loc_1B688:
in      al, dx
bt      ax, cx
jb      short loc_1B6B8
mov     eax, cs:[bx+1]
mov     fs:[di+28h], eax
mov     word ptr fs:[di+2Ch], offset byte_1B6B3
mov     word ptr fs:[di+2Eh], cs
mov     ax, fs:[di+42h]
mov     fs:[di+30h], ax
pop     es
assume es:nothing
pop     ds
assume ds:nothing
pop     fs
pop     gs
popad
retf
byte_1B6B3 db 83h, 0C4h, 6, 66h, 0CFh

loc_1B6B8:
cmp     dx, ds:4Ch
jnz     short loc_1B6D2
cmp     cx, 5
jnz     short loc_1B6D2
pop     es
pop     ds
pop     fs
pop     gs
popad
add     sp, 10h
int     75h             ; IRQ13 - AT/XT286/PS50+ - 80287 ERROR
iretd

loc_1B6D2:
mov     ax, ds
cmp     ax, ds:0A93h
jnz     short loc_1B6E6
lss     esp, ds:0A8Fh
cmp     sp, ds:0CDAh
jnb     short loc_1B6F0

loc_1B6E6:
mov     ss, ax
mov     sp, ds:996h
sub     sp, 180h

loc_1B6F0:
push    large [dword ptr ds:0A8Fh]
push    word ptr ds:0A93h
push    word ptr ds:996h
mov     ds:996h, sp
sub     sp, 10h
mov     bl, cs:[bx]
xor     bh, bh
mov     edx, fs:[di+34h]
jmp     far ptr 18h:177Fh
lss     esp, ds:0A8Fh

loc_1B719:
pop     es
pop     ds
pop     fs
pop     gs
popad
add     sp, 10h
iretd
sub_1B606 endp ; sp-analysis failed




sub_1B726 proc near
pusha
push    ds
push    es
cmp     byte ptr ds:2Fh, 3
jb      short loc_1B760
mov     ah, 0FFh
mov     dh, 4Fh ; 'O'
xor     cx, cx
int     21h             ; DOS - DOS v??? - OEM FUNCTION
jcxz    short loc_1B760
movzx   eax, ax
shl     edx, 10h
or      eax, edx
mov     bx, ds:1596h
shl     bx, 2
add     bx, 1598h

loc_1B750:
mov     [bx], eax
add     eax, 4
add     bx, 4
inc     word ptr ds:1596h
loop    loc_1B750

loc_1B760:
pop     es
pop     ds
popa
retn
sub_1B726 endp

db 8Ah, 0, 8Dh, 0, 6Bh, 1, 6Fh, 1, 7Bh, 1
db 8Bh, 1, 0ECh, 0Bh, 2Ch, 22h, 43h, 22h
db 0CCh, 22h, 13h, 21h, 1Eh, 21h, 2Ah, 21h
db 32h, 21h, 40h, 21h, 4Dh, 21h, 53h, 21h
db 5Eh, 21h, 5Eh, 21h, 7Bh, 21h, 0BCh, 1Eh
db 0BCh, 1Eh, 0FEh, 1Eh, 0BCh, 1Eh, 0A1h
db 51h, 0A1h, 51h, 0A1h, 51h, 0FEh, 1Eh
db 61h, 0E9h, 0A5h, 24h, 60h, 6, 0B8h, 18h
db 0, 8Eh, 0C0h, 26h, 39h, 6, 0C0h, 17h
db 75h, 2 dup(7), 61h, 0EAh, 0C6h, 17h, 18h
db 0, 1Eh, 16h, 6Ah, 0, 16h, 1Fh, 26h, 0C4h
db 3Eh, 0C2h, 17h, 8Bh, 0F4h, 8Bh, 0EFh
db 0FCh, 0B9h, 0Ch, 0, 0F3h, 0A5h, 0B8h
db 0Dh, 0, 0ABh, 0B9h, 8, 0, 0F3h, 0A5h
db 6, 17h, 8Bh, 0E5h, 6Ah, 18h, 1Fh, 0FFh
db 2Eh, 0BEh, 17h, 61h, 0EAh, 0CAh, 17h
db 18h, 0


; Attributes: bp-based frame

sub_1B7E4 proc far

arg_0= dword ptr  6

push    bp
mov     bp, sp
push    ds
push    20h ; ' '
pop     ds
assume ds:nothing
cld
mov     di, ds:0A9Ch
push    8
pop     es
assume es:nothing
lds     si, [bp+arg_0]
assume ds:nothing
push    word ptr [si+2]
mov     [si+2], di
pop     si
and     si, 0FFF8h
movs    word ptr es:[di], word ptr es:[si]
movs    word ptr es:[di], word ptr es:[si]
lods    word ptr es:[si]
mov     ah, 9Bh
stosw
movs    word ptr es:[di], word ptr es:[si]
pop     ds
pop     bp
retf
sub_1B7E4 endp

db 0ACh, 98h, 3, 46h, 8, 16h, 50h, 0Eh, 0E8h
db 0CBh, 0FFh, 83h, 0C4h, 4, 0EBh, 3Ch, 33h
db 0DBh, 6Ah, 20h, 1Fh, 80h, 3Eh, 81h, 11h
db 0, 74h, 1, 43h, 6Ah, 18h, 1Fh, 83h, 3Eh
db 62h, 10h, 0, 74h, 2, 2 dup(43h), 0D1h
db 0E3h, 1Fh, 7, 2Eh, 0FFh, 0A7h, 0ACh, 1Eh
db 6Ah, 20h, 1Fh, 81h, 7Eh, 1Ch, 80h, 0
db 72h, 0Bh, 0A1h, 38h, 0, 33h, 46h, 14h
db 25h, 0F8h, 0FFh, 75h, 1Eh, 0C7h, 46h
db 24h, 2 dup(0), 0E9h, 5Fh, 1, 8Bh, 76h
db 18h, 8Eh, 5Eh, 1Ch, 0ADh, 3Ch, 7, 74h
db 0D8h, 3Ch, 1Fh, 74h, 0D4h, 3Dh, 0FFh
db 5Eh, 75h, 2, 0EBh, 9Bh, 0EBh, 7Dh, 90h
db 60h, 6, 1Eh, 0B8h, 20h, 0, 8Eh, 0D8h
db 8Bh, 0ECh, 80h, 3Eh, 50h, 0, 8, 75h, 15h
db 0F6h, 6, 82h, 15h, 1, 75h, 0Eh, 0B0h
db 0Bh, 8Bh, 16h, 4Ah, 0, 0EEh, 0EBh, 0
db 0ECh, 0A8h, 20h, 75h, 82h, 0FCh, 81h
db 7Eh, 1Ch, 0, 0C0h, 72h, 3, 0E9h, 0B6h
db 0, 0Fh, 3, 46h, 1Ch, 2Bh, 46h, 18h, 76h
db 42h, 83h, 7Eh, 14h, 0, 75h, 0A7h, 2Dh
db 4, 0, 76h, 37h, 0B0h, 93h, 0E8h, 0A1h
db 1, 50h, 3Ch, 9Bh, 75h, 29h, 8Bh, 76h
db 18h, 8Eh, 5Eh, 1Ch, 0ADh, 83h, 7Eh, 2 dup(0)
db 75h, 3, 0E9h, 0A9h, 0, 3Dh, 0C7h, 4, 74h
db 1Eh, 3Dh, 29h, 4, 74h, 43h, 3Dh, 0C6h
db 4, 74h, 5Fh, 3Dh, 80h, 0Ch, 74h, 49h
db 3Dh, 89h, 4, 74h, 67h, 58h, 0E8h, 6Fh
db 1, 0BBh, 4, 0, 0E9h, 28h, 0FFh, 8Bh, 14h
db 81h, 0FAh, 89h, 0C0h, 75h, 0EEh, 0B9h
db 4, 0, 6Ah, 8, 1Fh, 8Bh, 76h, 0, 83h, 0E6h
db 0F8h, 0B0h, 93h, 86h, 44h, 5, 8Eh, 0C6h
db 8Bh, 7Eh, 6, 26h, 89h, 15h, 88h, 44h
db 5, 1, 4Eh, 18h, 0E9h, 96h, 0, 8Eh, 5Eh
db 0, 8Bh, 76h, 6, 8Bh, 14h, 2Bh, 56h, 12h
db 0B9h, 2, 0, 0EBh, 0D1h, 8Ah, 0Ch, 8Eh
db 5Eh, 0, 8Bh, 76h, 6, 8Bh, 14h, 0Ah, 0D1h
db 0B9h, 3, 0, 0EBh, 0C0h, 8Ah, 0Ch, 8Bh
db 7Eh, 6, 8Eh, 46h, 0, 26h, 8Bh, 15h, 8Ah
db 0D1h, 0B9h, 3, 0, 0EBh, 0AEh, 8Bh, 56h
db 12h, 0B9h, 2, 0, 0EBh, 0A6h, 33h, 0C0h
db 33h, 0C9h, 39h, 4Eh, 0, 75h, 6, 0C7h
db 46h, 0, 38h, 0, 40h, 39h, 4Eh, 2, 75h
db 6, 0C7h, 46h, 2, 38h, 0, 40h, 0Bh, 0C0h
db 75h, 41h, 0E9h, 29h, 0FFh, 3Dh, 8Eh, 1Eh
db 74h, 3, 0E9h, 68h, 0FFh, 83h, 7Eh, 18h
db 2Bh, 75h, 15h, 33h, 0DBh, 2Eh, 8Bh, 0BFh
db 84h, 1Eh, 0C7h, 5, 0CDh, 0FEh, 88h, 5Dh
db 2, 2 dup(43h), 83h, 0FBh, 14h, 72h, 0EDh
db 6Ah, 10h, 1Fh, 0C7h, 6, 0F0h, 7, 0F3h
db 20h, 8Ch, 0Eh, 0F2h, 7, 0A1h, 0F2h, 1
db 89h, 46h, 0, 83h, 46h, 18h, 4, 58h, 0E8h
db 0A5h, 0, 1Fh, 7, 61h, 83h, 0C4h, 4, 66h
db 0CFh, 58h, 0E8h, 99h, 0, 7, 1Fh, 61h
db 83h, 0C4h, 4, 0EAh, 0CFh, 17h, 18h, 0
db 50h, 60h, 6, 1Eh, 8Bh, 0ECh, 0B0h, 93h
db 0E8h, 83h, 0, 50h, 8Bh, 76h, 18h, 8Eh
db 5Eh, 1Ch, 8Ah, 1Ch, 32h, 0FFh, 80h, 0FBh
db 14h, 73h, 0D6h, 2Eh, 0FFh, 0A7h, 98h
db 1Eh, 8Bh, 46h, 0Ch, 89h, 5, 83h, 46h
db 18h, 1, 0EBh, 0BAh, 8Bh, 46h, 2, 89h
db 45h, 2, 83h, 46h, 18h, 2, 0EBh, 0AEh
db 8Bh, 46h, 12h, 0A3h, 65h, 1, 0EBh, 0F2h
db 0D9h, 3Eh, 65h, 1, 0EBh, 0, 0EBh, 0, 83h
db 46h, 18h, 3, 0EBh, 98h, 8Bh, 44h, 3, 21h
db 6, 65h, 1, 83h, 46h, 18h, 5, 0EBh, 8Bh
db 0DDh, 3Eh, 65h, 1, 0EBh, 0E3h, 6Ah, 10h
db 1Fh, 0A1h, 0F2h, 1, 89h, 46h, 4, 0EBh
db 0C6h, 0BFh, 0F9h, 21h, 80h, 0FBh, 0Eh
db 74h, 3, 0BFh, 0FDh, 21h, 8Bh, 46h, 0Ch
db 89h, 5, 8Bh, 46h, 2, 89h, 45h, 2, 83h
db 46h, 18h, 6, 0E9h, 5Dh, 0FFh, 0DDh, 3Eh
db 0F7h, 21h, 0EBh, 0B5h, 6Ah, 8, 1Fh, 8Bh
db 76h, 1Ch, 86h, 44h, 5, 0C3h, 0


; Attributes: bp-based frame

sub_1BA6C proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
mov     ax, ds:98h
mov     dx, ds:9Ah
cmp     [bp+arg_2], dx
jb      short loc_1BA9A
ja      short loc_1BA82
cmp     [bp+arg_0], ax
jb      short loc_1BA9A

loc_1BA82:
mov     ax, ds:9Ch
mov     dx, ds:9Eh
cmp     [bp+arg_2], dx
ja      short loc_1BA9A
jb      short loc_1BA95
cmp     [bp+arg_0], ax
ja      short loc_1BA9A

loc_1BA95:
mov     ax, 1
jmp     short locret_1BA9C

loc_1BA9A:
sub     ax, ax

locret_1BA9C:
leave
retn    4
sub_1BA6C endp



; Attributes: bp-based frame

sub_1BAA0 proc near

var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2

enter   0Ch, 0
push    si
sub     ax, ax
mov     [bp+var_A], ax
mov     [bp+var_C], ax
sub     si, si
cli
sub     ax, ax
mov     ds:11FCh, ax
mov     ds:11FAh, ax
mov     ax, ds:98h
mov     dx, ds:9Ah
mov     [bp+var_4], ax
mov     [bp+var_2], dx
cmp     dx, ds:9Eh
ja      short loc_1BB36
jb      short loc_1BAD3
cmp     ax, ds:9Ch
jnb     short loc_1BB36

loc_1BAD3:
mov     ax, [bp+var_2]
or      ax, [bp+var_4]
jz      short loc_1BB36
push    4
push    [bp+var_2]
push    [bp+var_4]
call    sub_1D8CC
add     sp, 6
mov     [bp+var_8], ax
mov     [bp+var_6], dx
add     [bp+var_C], ax
adc     [bp+var_A], dx
cmp     dx, ds:11FCh
jb      short loc_1BB0A
ja      short loc_1BB03
cmp     ax, ds:11FAh
jbe     short loc_1BB0A

loc_1BB03:
mov     ds:11FAh, ax
mov     ds:11FCh, dx

loc_1BB0A:
dec     si
jz      short loc_1BB1A
push    [bp+var_2]
push    [bp+var_4]
call    sub_1BA6C
or      ax, ax
jnz     short loc_1BB20

loc_1BB1A:
push    1Ch
call    sub_1D740
pop     bx

loc_1BB20:
push    0
push    [bp+var_2]
push    [bp+var_4]
call    sub_1D8CC
add     sp, 6
mov     [bp+var_4], ax
mov     [bp+var_2], dx
jmp     short loc_1BAD3

loc_1BB36:
sti
mov     ax, [bp+var_C]
mov     dx, [bp+var_A]
pop     si
leave
retn
sub_1BAA0 endp



; Attributes: bp-based frame

sub_1BB40 proc near

var_4= dword ptr -4
arg_0= word ptr  4
arg_2= word ptr  6

enter   4, 0
cmp     word ptr ds:0A2h, 0
jz      short locret_1BB77
mov     ax, ds:0A0h
mov     word ptr [bp+var_4], ax
mov     word ptr [bp+var_4+2], 60h ; '`'
push    92h
push    0FFFFh
push    0
push    word ptr ds:0A2h
push    60h ; '`'
call    sub_1D80F
mov     ax, [bp+arg_0]
mov     dx, [bp+arg_2]
les     bx, [bp+var_4]
assume es:nothing
add     es:[bx+0Ch], ax
adc     es:[bx+0Eh], dx

locret_1BB77:
leave
retn
sub_1BB40 endp



; Attributes: bp-based frame

sub_1BB79 proc near

var_14= word ptr -14h
var_12= word ptr -12h
var_10= word ptr -10h
var_E= word ptr -0Eh
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

enter   16h, 0

loc_1BB7D:
sub     ax, ax
mov     ds:11FCh, ax
mov     ds:11FAh, ax
mov     [bp+var_14], ax

loc_1BB88:
cli
mov     ax, ds:98h
mov     dx, ds:9Ah
mov     [bp+var_8], ax
mov     [bp+var_6], dx
cmp     dx, ds:9Eh
ja      short loc_1BBB2
jb      short loc_1BBA4
cmp     ax, ds:9Ch
jnb     short loc_1BBB2

loc_1BBA4:
cmp     [bp+arg_2], 0
jg      short loc_1BBB7
jl      short loc_1BBB2
cmp     [bp+arg_0], 0
jnz     short loc_1BBB7

loc_1BBB2:
sub     ax, ax
cwd
leave
retn

loc_1BBB7:
push    0
push    [bp+var_6]
push    [bp+var_8]
call    sub_1D8CC
add     sp, 6
mov     [bp+var_4], ax
mov     [bp+var_2], dx

loc_1BBCB:
mov     ax, [bp+var_2]
or      ax, [bp+var_4]
jnz     short loc_1BBD6
jmp     loc_1BD3E

loc_1BBD6:
push    4
push    [bp+var_2]
push    [bp+var_4]
call    sub_1D8CC
add     sp, 6
mov     [bp+var_12], ax
mov     [bp+var_10], dx
cmp     dx, [bp+arg_2]
jge     short loc_1BBF2
jmp     loc_1BCD0

loc_1BBF2:
jg      short loc_1BBFC
cmp     ax, [bp+arg_0]
jnb     short loc_1BBFC
jmp     loc_1BCD0

loc_1BBFC:
cmp     byte ptr ds:2Eh, 0Bh
jnz     short loc_1BC36
call    sub_1EFBC
or      ax, ax
jnz     short loc_1BC36
mov     ax, [bp+arg_0]
mov     dx, [bp+arg_2]
add     ax, [bp+var_4]
adc     dx, [bp+var_2]
push    dx
push    ax
push    [bp+var_2]
push    [bp+var_4]
call    near ptr sub_1EEF8
add     sp, 8
mov     [bp+var_E], ax
or      ax, ax
jle     short loc_1BC2F
sti
jmp     loc_1BB7D

loc_1BC2F:
or      ax, ax
jge     short loc_1BC36
jmp     loc_1BD3E

loc_1BC36:
mov     ax, [bp+var_12]
mov     dx, [bp+var_10]
cmp     [bp+arg_0], ax
jnz     short loc_1BC46
cmp     [bp+arg_2], dx
jz      short loc_1BC7A

loc_1BC46:
sub     ax, [bp+arg_0]
sbb     dx, [bp+arg_2]
push    dx
push    ax
push    4
mov     ax, [bp+arg_0]
mov     dx, [bp+arg_2]
add     ax, [bp+var_4]
adc     dx, [bp+var_2]
push    dx
push    ax
push    0
push    [bp+var_6]
push    [bp+var_8]
call    sub_1D8E2
add     sp, 0Ah
mov     [bp+var_8], ax
mov     [bp+var_6], dx
push    dx
push    ax
call    sub_1D8E2
add     sp, 0Ah

loc_1BC7A:
push    0
push    [bp+var_2]
push    [bp+var_4]
call    sub_1D8CC
add     sp, 6
push    dx
push    ax
push    0
push    [bp+var_6]
push    [bp+var_8]
call    sub_1D8E2
add     sp, 0Ah
mov     [bp+var_8], ax
mov     [bp+var_6], dx
or      dx, ax
jz      short loc_1BCB3
push    [bp+var_6]
push    ax
call    sub_1BA6C
or      ax, ax
jnz     short loc_1BCB3
push    1Dh
call    sub_1D740
pop     bx

loc_1BCB3:
mov     ax, [bp+arg_0]
mov     dx, [bp+arg_2]
neg     ax
adc     dx, 0
neg     dx
push    dx
push    ax
call    sub_1BB40
pop     bx
pop     bx
sti
mov     ax, [bp+var_4]
mov     dx, [bp+var_2]
leave
retn

loc_1BCD0:
mov     ax, ds:11FAh
mov     dx, ds:11FCh
cmp     [bp+var_10], dx
jb      short loc_1BCF0
ja      short loc_1BCE3
cmp     [bp+var_12], ax
jbe     short loc_1BCF0

loc_1BCE3:
mov     ax, [bp+var_12]
mov     dx, [bp+var_10]
mov     ds:11FAh, ax
mov     ds:11FCh, dx

loc_1BCF0:
push    0
mov     ax, [bp+var_4]
mov     dx, [bp+var_2]
mov     [bp+var_8], ax
mov     [bp+var_6], dx
push    dx
push    ax
call    sub_1D8CC
add     sp, 6
mov     [bp+var_4], ax
mov     [bp+var_2], dx
or      dx, ax
jnz     short loc_1BD13
jmp     loc_1BBCB

loc_1BD13:
mov     ax, [bp+var_8]
mov     dx, [bp+var_6]
cmp     [bp+var_2], dx
jb      short loc_1BD35
ja      short loc_1BD25
cmp     [bp+var_4], ax
jb      short loc_1BD35

loc_1BD25:
push    [bp+var_2]
push    [bp+var_4]
call    sub_1BA6C
or      ax, ax
jz      short loc_1BD35
jmp     loc_1BBCB

loc_1BD35:
push    1Dh
call    sub_1D740
pop     bx
jmp     loc_1BBCB

loc_1BD3E:
sti
cmp     word ptr ds:1206h, 0
jnz     short loc_1BD49
jmp     loc_1BBB2

loc_1BD49:
mov     ax, [bp+var_14]
inc     [bp+var_14]
or      ax, ax
jz      short loc_1BD56
jmp     loc_1BBB2

loc_1BD56:
mov     ax, ds:1206h
shr     ax, 6
mov     dx, ax
mov     ax, ds:1206h
shl     ax, 0Ah
mov     bx, dx
cwd
or      dx, bx
mov     [bp+var_12], ax
mov     [bp+var_10], dx
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1D952
pop     bx
pop     bx
cmp     dx, [bp+var_10]
jl      short loc_1BD8C
jg      short loc_1BD86
cmp     ax, [bp+var_12]
jbe     short loc_1BD8C

loc_1BD86:
mov     [bp+var_12], ax
mov     [bp+var_10], dx

loc_1BD8C:
push    1
mov     ax, ds:0AA8h
mov     dx, ds:0AAAh
add     ax, [bp+var_12]
adc     dx, [bp+var_10]
push    dx
push    ax
call    sub_1D3ED
add     sp, 6
or      dx, ax
jz      short loc_1BDAA
jmp     loc_1BB88

loc_1BDAA:
jmp     loc_1BBB2
sub_1BB79 endp ; sp-analysis failed



; Attributes: bp-based frame

sub_1BDAD proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     ax, [bp+arg_0]
int     15h
leave
retn    2
sub_1BDAD endp



; Attributes: bp-based frame

sub_1BDB9 proc near

var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

enter   0Ch, 0
push    di
push    si
mov     ax, [bp+arg_0]
mov     dx, [bp+arg_2]
cmp     ds:9Ah, dx
jbe     short loc_1BDCE
jmp     loc_1C041

loc_1BDCE:
jb      short loc_1BDD6
cmp     ds:98h, ax
ja      short loc_1BDE2

loc_1BDD6:
add     ax, [bp+arg_4]
adc     dx, [bp+arg_6]
cmp     dx, ds:9Eh
jbe     short loc_1BDE5

loc_1BDE2:
jmp     loc_1C041

loc_1BDE5:
jb      short loc_1BDED
cmp     ax, ds:9Ch
ja      short loc_1BDF5

loc_1BDED:
mov     ax, [bp+arg_6]
or      ax, [bp+arg_4]
jnz     short loc_1BDF8

loc_1BDF5:
jmp     loc_1C041

loc_1BDF8:
test    byte ptr ds:47h, 80h
jz      short loc_1BE05
push    111Ch
call    sub_1BDAD

loc_1BE05:
cli
push    0
mov     ax, ds:98h
mov     dx, ds:9Ah
mov     [bp+var_8], ax
mov     [bp+var_6], dx

loc_1BE15:
push    dx
push    ax
call    sub_1D8CC
add     sp, 6
mov     [bp+var_4], ax
mov     [bp+var_2], dx
mov     ax, [bp+arg_0]
mov     dx, [bp+arg_2]
cmp     [bp+var_2], dx
ja      short loc_1BE4D
jb      short loc_1BE35
cmp     [bp+var_4], ax
jnb     short loc_1BE4D

loc_1BE35:
mov     ax, [bp+var_2]
or      ax, [bp+var_4]
jz      short loc_1BE4D
mov     ax, [bp+var_4]
mov     dx, [bp+var_2]
mov     [bp+var_8], ax
mov     [bp+var_6], dx
push    0
jmp     short loc_1BE15

loc_1BE4D:
mov     ax, [bp+arg_0]
mov     dx, [bp+arg_2]
cmp     [bp+var_4], ax
jnz     short loc_1BE60
cmp     [bp+var_2], dx
jnz     short loc_1BE60
jmp     loc_1C034

loc_1BE60:
mov     ax, [bp+var_2]
or      ax, [bp+var_4]
jz      short loc_1BE86
mov     ax, [bp+arg_4]
mov     dx, [bp+arg_6]
add     ax, [bp+arg_0]
adc     dx, [bp+arg_2]
cmp     dx, [bp+var_2]
jb      short loc_1BE86
jbe     short loc_1BE7E
jmp     loc_1C034

loc_1BE7E:
cmp     ax, [bp+var_4]
jbe     short loc_1BE86
jmp     loc_1C034

loc_1BE86:
push    4
push    [bp+var_6]
push    [bp+var_8]
call    sub_1D8CC
add     sp, 6
add     ax, [bp+var_8]
adc     dx, [bp+var_6]
cmp     dx, [bp+arg_2]
jb      short loc_1BEA9
ja      short loc_1BEA6
cmp     ax, [bp+arg_0]
jbe     short loc_1BEA9

loc_1BEA6:
jmp     loc_1C034

loc_1BEA9:
push    [bp+arg_2]
push    [bp+arg_0]
push    0
push    [bp+var_6]
push    [bp+var_8]
call    sub_1D8E2
add     sp, 0Ah
push    [bp+var_2]
push    [bp+var_4]
push    0
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1D8E2
add     sp, 0Ah
mov     ax, [bp+arg_4]
mov     dx, [bp+arg_6]
mov     [bp+var_C], ax
mov     [bp+var_A], dx
push    4
push    [bp+var_6]
push    [bp+var_8]
call    sub_1D8CC
add     sp, 6
add     ax, [bp+var_8]
adc     dx, [bp+var_6]
cmp     ax, [bp+arg_0]
jnz     short loc_1BF47
cmp     dx, [bp+arg_2]
jnz     short loc_1BF47
push    4
push    [bp+var_6]
push    [bp+var_8]
call    sub_1D8CC
add     sp, 6
add     ax, [bp+var_C]
adc     dx, [bp+var_A]
mov     [bp+var_C], ax
mov     [bp+var_A], dx
push    dx
push    ax
push    4
push    [bp+var_6]
push    [bp+var_8]
call    sub_1D8E2
add     sp, 0Ah
push    [bp+var_2]
push    [bp+var_4]
push    0
push    [bp+var_6]
push    [bp+var_8]
call    sub_1D8E2
add     sp, 0Ah
mov     ax, [bp+var_8]
mov     dx, [bp+var_6]
mov     [bp+arg_0], ax
mov     [bp+arg_2], dx
jmp     short loc_1BF5B

loc_1BF47:
push    [bp+arg_6]
push    [bp+arg_4]
push    4
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1D8E2
add     sp, 0Ah

loc_1BF5B:
push    4
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1D8CC
add     sp, 6
add     ax, [bp+arg_0]
adc     dx, [bp+arg_2]
cmp     ax, [bp+var_4]
jnz     short loc_1BFCD
cmp     dx, [bp+var_2]
jnz     short loc_1BFCD
push    4
push    dx
push    ax
call    sub_1D8CC
add     sp, 6
push    4
push    [bp+arg_2]
push    [bp+arg_0]
mov     si, ax
mov     di, dx
call    sub_1D8CC
add     sp, 6
add     si, ax
adc     di, dx
mov     [bp+var_C], si
mov     [bp+var_A], di
push    di
push    si
push    4
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1D8E2
add     sp, 0Ah
push    0
push    [bp+var_2]
push    [bp+var_4]
call    sub_1D8CC
add     sp, 6
push    dx
push    ax
push    0
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1D8E2
add     sp, 0Ah

loc_1BFCD:
push    [bp+arg_6]
push    [bp+arg_4]
call    sub_1BB40
pop     bx
pop     bx
sti
cmp     byte ptr ds:2Eh, 0Bh
jnz     short loc_1C034
mov     ah, ds:15h
and     ax, 4000h
cmp     ax, 1
sbb     ax, ax
inc     ax
mov     cl, ds:47h
and     cl, 80h
cmp     cl, 1
sbb     cx, cx
inc     cx
xor     ax, cx
jz      short loc_1C034
cmp     byte ptr ds:9F8h, 1
sbb     ax, ax
and     ah, 7
add     ah, 0F0h
push    ax
mov     ax, [bp+var_C]
mov     dx, [bp+var_A]
add     ax, [bp+arg_0]
adc     dx, [bp+arg_2]
sub     ax, 1
sbb     dx, 0
push    dx
push    ax
mov     ax, [bp+arg_0]
mov     dx, [bp+arg_2]
add     ax, 1
adc     dx, 0
push    dx
push    ax
call    sub_1EFB4
add     sp, 0Ah

loc_1C034:
test    byte ptr ds:47h, 80h
jz      short loc_1C041
push    111Bh
call    sub_1BDAD

loc_1C041:
pop     si
pop     di
leave
retn
sub_1BDB9 endp



; Attributes: bp-based frame

sub_1C045 proc near

var_12= word ptr -12h
var_10= word ptr -10h
var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah
arg_8= word ptr  0Ch
arg_A= word ptr  0Eh

enter   12h, 0
mov     ax, [bp+arg_4]
mov     dx, [bp+arg_6]
add     ax, [bp+arg_0]
adc     dx, [bp+arg_2]
mov     [bp+var_C], ax
mov     [bp+var_A], dx
mov     ax, [bp+arg_4]
mov     dx, [bp+arg_6]
sub     [bp+arg_8], ax
sbb     [bp+arg_A], dx

loc_1C067:
cli
mov     ax, ds:98h
mov     dx, ds:9Ah

loc_1C06F:
mov     [bp+var_4], ax
mov     [bp+var_2], dx
push    0
push    dx
push    ax
call    sub_1D8CC
add     sp, 6
mov     [bp+var_8], ax
mov     [bp+var_6], dx
or      dx, ax
jnz     short loc_1C08C
jmp     loc_1C164

loc_1C08C:
mov     ax, [bp+var_C]
mov     dx, [bp+var_A]
cmp     [bp+var_8], ax
jz      short loc_1C09A
jmp     loc_1C15B

loc_1C09A:
cmp     [bp+var_6], dx
jz      short loc_1C0A2
jmp     loc_1C15B

loc_1C0A2:
push    4
push    [bp+var_6]
push    [bp+var_8]
call    sub_1D8CC
add     sp, 6
mov     [bp+var_12], ax
mov     [bp+var_10], dx
cmp     dx, [bp+arg_A]
ja      short loc_1C0C5
jb      short loc_1C0C2
cmp     ax, [bp+arg_8]
jnb     short loc_1C0C5

loc_1C0C2:
jmp     loc_1C164

loc_1C0C5:
cmp     byte ptr ds:2Eh, 0Bh
jnz     short loc_1C0F5
mov     ax, [bp+var_8]
mov     dx, [bp+var_6]
add     ax, [bp+arg_8]
adc     dx, [bp+arg_A]
push    dx
push    ax
push    [bp+var_6]
push    [bp+var_8]
call    near ptr sub_1EEF8
add     sp, 8
mov     [bp+var_E], ax
or      ax, ax
jl      short loc_1C164
or      ax, ax
jle     short loc_1C0F5
sti
jmp     loc_1C067

loc_1C0F5:
push    0
push    [bp+var_6]
push    [bp+var_8]
call    sub_1D8CC
add     sp, 6
push    dx
push    ax
push    0
push    [bp+var_2]
push    [bp+var_4]
call    sub_1D8E2
add     sp, 0Ah
mov     ax, [bp+var_12]
mov     dx, [bp+var_10]
neg     ax
adc     dx, 0
neg     dx
push    dx
push    ax
call    sub_1BB40
pop     bx
pop     bx
mov     ax, [bp+var_12]
mov     dx, [bp+var_10]
cmp     [bp+arg_8], ax
jnz     short loc_1C137
cmp     [bp+arg_A], dx
jz      short loc_1C155

loc_1C137:
sub     ax, [bp+arg_8]
sbb     dx, [bp+arg_A]
push    dx
push    ax
mov     ax, [bp+arg_8]
mov     dx, [bp+arg_A]
add     ax, [bp+var_C]
adc     dx, [bp+var_A]
push    dx
push    ax
call    sub_1BDB9
add     sp, 8
jmp     short loc_1C156

loc_1C155:
sti

loc_1C156:
mov     ax, 1
leave
retn

loc_1C15B:
mov     ax, [bp+var_8]
mov     dx, [bp+var_6]
jmp     loc_1C06F

loc_1C164:
sti
sub     ax, ax
leave
retn
sub_1C045 endp ; sp-analysis failed



; Attributes: bp-based frame

sub_1C169 proc near

var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

enter   8, 0
add     [bp+arg_0], 0FFh
adc     [bp+arg_2], 0
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1BB79
pop     bx
pop     bx
mov     [bp+var_8], ax
mov     [bp+var_6], dx
or      dx, ax
jnz     short loc_1C190
sub     ax, ax
cwd
leave
retn

loc_1C190:
mov     dx, [bp+var_6]
add     ax, 0FFh
adc     dx, 0
sub     al, al
mov     [bp+var_4], ax
mov     [bp+var_2], dx
sub     ax, [bp+var_8]
sbb     dx, [bp+var_6]
push    dx
push    ax
push    [bp+var_6]
push    [bp+var_8]
call    sub_1BDB9
add     sp, 8
mov     al, byte ptr [bp+var_8]
add     al, byte ptr [bp+arg_0]
sub     ah, ah
push    0
push    ax
mov     ax, [bp+arg_0]
mov     dx, [bp+arg_2]
sub     al, al
mov     cx, [bp+var_4]
mov     bx, [bp+var_2]
add     ax, cx
adc     dx, bx
push    dx
push    ax
call    sub_1BDB9
mov     ax, [bp+var_4]
mov     dx, [bp+var_2]
leave
retn
sub_1C169 endp



; Attributes: bp-based frame

sub_1C1DF proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

enter   4, 0
push    0
push    1
call    sub_1BB79
pop     bx
pop     bx
mov     [bp+var_4], ax
mov     [bp+var_2], dx
or      dx, ax
jnz     short loc_1C1FA
sub     ax, ax
jmp     short locret_1C25E

loc_1C1FA:
cli
push    [bp+arg_6]
push    [bp+arg_4]
push    8
push    [bp+var_2]
push    [bp+var_4]
call    sub_1D8E2
add     sp, 0Ah
push    [bp+arg_2]
push    [bp+arg_0]
push    0Ch
push    [bp+var_2]
push    [bp+var_4]
call    sub_1D8E2
add     sp, 0Ah
push    0DEADh
push    0DEADh
push    4
push    [bp+var_2]
push    [bp+var_4]
call    sub_1D8E2
add     sp, 0Ah
push    word ptr ds:0C12h
push    word ptr ds:0C10h
push    0
push    [bp+var_2]
push    [bp+var_4]
call    sub_1D8E2
add     sp, 0Ah
mov     ax, [bp+var_4]
mov     dx, [bp+var_2]
mov     ds:0C10h, ax
mov     ds:0C12h, dx
sti
mov     ax, 1

locret_1C25E:
leave
retn    8
sub_1C1DF endp



; Attributes: bp-based frame

sub_1C262 proc near

var_8= word ptr -8
var_6= word ptr -6
arg_0= word ptr  4
arg_2= word ptr  6

enter   0Ch, 0
sub     ax, ax
mov     [bp+var_6], ax
mov     [bp+var_8], ax
cmp     [bp+arg_2], ax
jl      short loc_1C2CE
jg      short loc_1C27A
cmp     [bp+arg_0], ax
jz      short loc_1C2CE

loc_1C27A:
mov     ax, [bp+arg_0]
mov     dx, [bp+arg_2]
add     ax, 0FFFh
adc     dx, 0
push    dx
push    ax
call    sub_1D937
pop     bx
pop     bx
sub     al, al
mov     [bp+arg_0], ax
mov     [bp+arg_2], dx
push    dx
push    ax
call    sub_1C169
pop     bx
pop     bx
mov     [bp+var_8], ax
mov     [bp+var_6], dx
or      dx, ax
jz      short loc_1C2CE
push    [bp+var_6]
push    ax
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1C1DF
or      ax, ax
jnz     short loc_1C2CE
push    [bp+arg_2]
push    [bp+arg_0]
push    [bp+var_6]
push    [bp+var_8]
call    sub_1BDB9
sub     ax, ax
mov     [bp+var_6], ax
mov     [bp+var_8], ax

loc_1C2CE:
mov     ax, [bp+var_8]
mov     dx, [bp+var_6]
leave
retn
sub_1C262 endp



; Attributes: bp-based frame

sub_1C2D6 proc near

var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

enter   0Ah, 0
push    0
push    word ptr ds:9B4h
call    sub_1D952
pop     bx
pop     bx
add     ax, 0C10h
adc     dx, 0
mov     [bp+var_4], ax
mov     [bp+var_2], dx
and     ax, 0Fh
mov     [bp+var_A], ax
cli
push    [bp+var_2]
push    [bp+var_4]
call    sub_1D937
pop     bx
pop     bx
mov     [bp+var_4], ax
mov     [bp+var_2], dx

loc_1C309:
push    [bp+var_A]
push    [bp+var_2]
push    [bp+var_4]
call    sub_1D8CC
add     sp, 6
mov     [bp+var_8], ax
mov     [bp+var_6], dx
push    dx
push    ax
call    sub_1BA6C
or      ax, ax
jz      short loc_1C33E
push    4
push    [bp+var_6]
push    [bp+var_8]
call    sub_1D8CC
add     sp, 6
cmp     ax, 0DEADh
jnz     short loc_1C33E
cmp     dx, ax
jz      short loc_1C343

loc_1C33E:
sti
sub     ax, ax
jmp     short locret_1C3A6

loc_1C343:
mov     ax, [bp+arg_0]
mov     dx, [bp+arg_2]
cmp     [bp+var_8], ax
jnz     short loc_1C353
cmp     [bp+var_6], dx
jz      short loc_1C366

loc_1C353:
mov     ax, [bp+var_8]
mov     dx, [bp+var_6]
mov     [bp+var_4], ax
mov     [bp+var_2], dx
mov     [bp+var_A], 0
jmp     short loc_1C309

loc_1C366:
push    0BAD0h
push    0BAD0h
push    4
push    dx
push    ax
call    sub_1D8E2
add     sp, 0Ah
push    0
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1D8CC
add     sp, 6
push    dx
push    ax
push    [bp+var_A]
push    [bp+var_2]
push    [bp+var_4]
call    sub_1D8E2
add     sp, 0Ah
sti
push    0
push    1
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1BDB9
mov     ax, 1

locret_1C3A6:
leave
retn    4
sub_1C2D6 endp



; Attributes: bp-based frame

sub_1C3AA proc near

var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

enter   8, 0
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1BA6C
or      ax, ax
jnz     short loc_1C3BF

loc_1C3BB:
sub     ax, ax
leave
retn

loc_1C3BF:
push    8
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1D8CC
add     sp, 6
mov     [bp+var_4], ax
mov     [bp+var_2], dx
push    0Ch
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1D8CC
add     sp, 6
mov     [bp+var_8], ax
mov     [bp+var_6], dx
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1C2D6
or      ax, ax
jz      short loc_1C3BB
push    [bp+var_6]
push    [bp+var_8]
push    [bp+var_2]
push    [bp+var_4]
call    sub_1BDB9
mov     ax, 1
leave
retn
sub_1C3AA endp



; Attributes: bp-based frame

sub_1C408 proc near

var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

enter   0Ch, 0
push    di
push    si
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1BA6C
or      ax, ax
jz      short loc_1C440
push    4
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1D8CC
add     sp, 6
cmp     ax, 0DEADh
jnz     short loc_1C440
cmp     dx, ax
jnz     short loc_1C440
cmp     [bp+arg_6], 0
jg      short loc_1C446
jl      short loc_1C440
cmp     [bp+arg_4], 0
jnz     short loc_1C446

loc_1C440:
sub     ax, ax
cwd
jmp     loc_1C5A9

loc_1C446:
push    0Ch
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1D8CC
add     sp, 6
mov     [bp+var_8], ax
mov     [bp+var_6], dx
push    8
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1D8CC
add     sp, 6
mov     [bp+var_4], ax
mov     [bp+var_2], dx
mov     [bp+var_C], ax
mov     [bp+var_A], dx
mov     cx, [bp+arg_4]
mov     bx, [bp+arg_6]
add     cx, 0FFFh
adc     bx, 0
and     cx, 0F000h
push    bx
push    cx
call    sub_1D937
pop     bx
pop     bx
mov     [bp+arg_4], ax
mov     [bp+arg_6], dx
cmp     ax, [bp+var_8]
jnz     short loc_1C4A5
cmp     dx, [bp+var_6]
jnz     short loc_1C4A5

loc_1C49C:
mov     ax, [bp+var_4]
mov     dx, [bp+var_2]
jmp     loc_1C5A9

loc_1C4A5:
cmp     [bp+var_6], dx
jl      short loc_1C4E2
jg      short loc_1C4B1
cmp     [bp+var_8], ax
jbe     short loc_1C4E2

loc_1C4B1:
mov     cx, [bp+var_8]
mov     bx, [bp+var_6]
sub     cx, ax
sbb     bx, dx
push    bx
push    cx
add     ax, [bp+var_4]
adc     dx, [bp+var_2]
push    dx
push    ax
call    sub_1BDB9
add     sp, 8
push    [bp+arg_6]
push    [bp+arg_4]
push    0Ch
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1D8E2
add     sp, 0Ah
jmp     loc_1C5A3

loc_1C4E2:
push    dx
push    ax
push    [bp+var_6]
push    [bp+var_8]
push    [bp+var_2]
push    [bp+var_4]
call    sub_1C045
add     sp, 0Ch
or      ax, ax
jz      short loc_1C510
push    [bp+arg_6]
push    [bp+arg_4]
push    0Ch
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1D8E2
add     sp, 0Ah
jmp     short loc_1C49C

loc_1C510:
push    [bp+arg_6]
push    [bp+arg_4]
call    sub_1C169
pop     bx
pop     bx
mov     [bp+var_C], ax
mov     [bp+var_A], dx
or      dx, ax
jnz     short loc_1C528
jmp     loc_1C440

loc_1C528:
push    92h
push    0FFFFh
push    [bp+var_2]
push    [bp+var_4]
push    word ptr ds:0C14h
call    sub_1D80F
add     sp, 0Ah
push    92h
push    0FFFFh
push    [bp+var_A]
push    [bp+var_C]
push    60h ; '`'
call    sub_1D80F
add     sp, 0Ah
push    si
push    di
push    ds
push    60h ; '`'
pop     es
assume es:nothing
mov     ds, word ptr ds:0C14h
mov     cx, [bp+var_8]
shl     cx, 3
xor     di, di
xor     si, si
rep movsw
pop     ds
pop     di
pop     si
push    [bp+var_A]
push    [bp+var_C]
push    8
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1D8E2
add     sp, 0Ah
push    [bp+arg_6]
push    [bp+arg_4]
push    0Ch
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1D8E2
add     sp, 0Ah
push    [bp+var_6]
push    [bp+var_8]
push    [bp+var_2]
push    [bp+var_4]
call    sub_1BDB9
add     sp, 8

loc_1C5A3:
mov     ax, [bp+var_C]
mov     dx, [bp+var_A]

loc_1C5A9:
pop     si
pop     di
leave
retn
sub_1C408 endp



; Attributes: bp-based frame

sub_1C5AD proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
cmp     byte ptr ds:2Eh, 0
jz      short loc_1C5D0
mov     ax, [bp+arg_0]
cmp     ds:97Ch, ax
jbe     short loc_1C5D0
and     al, 0F8h
mov     bx, ax
mov     cx, 8
mov     es, cx
assume es:nothing
cmp     byte ptr es:[bx+5], 0
jz      short loc_1C5D4

loc_1C5D0:
sub     ax, ax
leave
retn

loc_1C5D4:
mov     ax, [bp+arg_0]
leave
retn
sub_1C5AD endp



; Attributes: bp-based frame

sub_1C5D9 proc near

var_14= word ptr -14h
var_12= word ptr -12h
var_10= word ptr -10h
var_E= word ptr -0Eh
var_C= byte ptr -0Ch
var_B= byte ptr -0Bh
var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= dword ptr  4
arg_4= word ptr  8

enter   16h, 0
push    di
push    si
mov     word ptr ds:38h, 0
les     bx, [bp+arg_0]
assume es:nothing
mov     word ptr es:[bx+16h], 18h
or      byte ptr es:[bx+26h], 1
mov     di, es:[bx+10h]
or      di, di
jnz     short loc_1C5FC
inc     di

loc_1C5FC:
mov     ax, di
shr     ax, 0Ch
mov     [bp+var_6], ax
test    di, 0FFFh
jz      short loc_1C60E
inc     ax
mov     [bp+var_6], ax

loc_1C60E:
mov     [bp+var_2], 92h
mov     al, ds:980h
cbw
dec     ax
jz      short loc_1C668
dec     ax
jz      short loc_1C67A
dec     ax
jz      short loc_1C659
dec     ax
jnz     short loc_1C626
jmp     loc_1C6B9

loc_1C626:
dec     ax
jz      short loc_1C683
push    0
push    di
call    sub_1BB79
pop     bx
pop     bx
mov     [bp+var_A], ax
mov     [bp+var_8], dx
or      dx, ax
jz      short loc_1C659

loc_1C63B:
mov     ax, [bp+var_8]
or      ax, [bp+var_A]
jz      short loc_1C646
jmp     loc_1C6E9

loc_1C646:
les     bx, [bp+arg_0]
mov     word ptr es:[bx+16h], 8
mov     ax, ds:11FAh
mov     es:[bx+10h], ax
jmp     loc_1C805

loc_1C659:
push    word ptr [bp+arg_0]
call    sub_1AE18

loc_1C65F:
pop     bx
mov     [bp+var_A], ax
mov     [bp+var_8], dx
jmp     short loc_1C63B

loc_1C668:
push    bx
call    sub_1AE18
pop     bx
mov     [bp+var_A], ax
mov     [bp+var_8], dx
mov     ax, dx
or      ax, [bp+var_A]
jnz     short loc_1C63B

loc_1C67A:
push    0
push    di
call    sub_1BB79
pop     bx
jmp     short loc_1C65F

loc_1C683:
cmp     [bp+var_6], 1
jnz     short loc_1C6BF
lea     ax, [di+7]
mov     bx, word ptr [bp+arg_0]
mov     es:[bx+10h], ax
mov     bx, ds:996h
mov     [bx+10h], ax
push    word ptr [bp+arg_0]
call    sub_1AE18
pop     bx
mov     si, ax
lea     ax, [si+7]
and     al, 0F8h
sub     dx, dx
mov     [bp+var_A], ax
mov     [bp+var_8], dx
push    si
push    ax
call    sub_1D259
pop     bx
pop     bx
jmp     short loc_1C63B

loc_1C6B9:
cmp     [bp+var_6], 1
jz      short loc_1C6C2

loc_1C6BF:
jmp     loc_1C805

loc_1C6C2:
cmp     di, 7
jnb     short loc_1C6D5
mov     ax, 7
mov     es:[bx+10h], ax
mov     bx, ds:996h
mov     [bx+10h], ax

loc_1C6D5:
push    word ptr [bp+arg_0]
call    sub_1AE18
pop     bx
mov     [bp+var_A], ax
mov     [bp+var_8], dx
or      byte ptr [bp+var_2], 60h
jmp     loc_1C63B

loc_1C6E9:
mov     si, [bp+arg_4]
or      si, si
jnz     short loc_1C740
cmp     byte ptr ds:980h, 4
jl      short loc_1C6FF
push    [bp+var_A]
call    sub_1C5AD
jmp     short loc_1C705

loc_1C6FF:
push    [bp+var_6]
call    sub_1DA6A

loc_1C705:
pop     bx
mov     si, ax
or      si, si
jnz     short loc_1C740
test    [bp+var_8], 0FFFFh
jz      short loc_1C723
push    si
push    di
push    [bp+var_8]
push    [bp+var_A]
call    sub_1BDB9
add     sp, 8
jmp     short loc_1C734

loc_1C723:
mov     ax, [bp+var_A]
mov     bx, ds:996h
mov     [bx+6], ax
push    word ptr [bp+arg_0]
call    sub_1AE50
pop     bx

loc_1C734:
les     bx, [bp+arg_0]
mov     word ptr es:[bx+16h], 1Fh
jmp     loc_1C805

loc_1C740:
mov     [bp+arg_4], si
les     bx, [bp+arg_0]
mov     es:[bx+16h], si
and     byte ptr es:[bx+26h], 0FEh

loc_1C74F:
cmp     di, 1000h
jb      short loc_1C759
sub     si, si
jmp     short loc_1C75E

loc_1C759:
mov     si, di
shl     si, 4

loc_1C75E:
dec     si
mov     [bp+var_10], si
mov     al, byte ptr [bp+var_2]
mov     [bp+var_C], al
mov     [bp+var_B], 0
mov     [bp+var_E], 0
mov     ax, [bp+var_A]
shl     ax, 4
mov     [bp+var_14], ax
mov     ax, [bp+var_8]
shl     ax, 4
mov     cx, [bp+var_A]
shr     cx, 0Ch
add     ax, cx
mov     [bp+var_12], ax
lea     ax, [bp+var_14]
push    ax
push    [bp+arg_4]
call    sub_1D9A3
pop     bx
pop     bx
or      ax, ax
jnz     short loc_1C7A2
push    101h
call    sub_1D740
pop     bx

loc_1C7A2:
mov     al, ds:14h
and     ax, 60h
mov     [bp+var_4], ax
or      ax, ax
jz      short loc_1C7C7
and     ax, 20h
cmp     ax, 1
sbb     ax, ax
push    ax
lea     ax, [si+1]
push    ax
push    0
push    [bp+arg_4]
call    sub_1D84E
add     sp, 8

loc_1C7C7:
add     [bp+var_A], 1000h
adc     [bp+var_8], 0
mov     bx, [bp+arg_4]
shr     bx, 3
add     bx, ds:0AA0h
mov     es, word ptr ds:0AA2h
mov     byte ptr es:[bx], 3
add     [bp+arg_4], 8
push    si
call    sub_1D872
pop     bx
sub     di, ax
jz      short loc_1C7F2
jmp     loc_1C74F

loc_1C7F2:
mov     bx, [bp+arg_4]
shr     bx, 3
add     bx, ds:0AA0h
mov     es, word ptr ds:0AA2h
and     byte ptr es:[bx-1], 0FDh

loc_1C805:
pop     si
pop     di
leave
retn
sub_1C5D9 endp



; Attributes: bp-based frame

sub_1C809 proc near

var_1A= word ptr -1Ah
var_18= word ptr -18h
var_16= word ptr -16h
var_14= word ptr -14h
var_10= byte ptr -10h
var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= word ptr -8
var_6= byte ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= dword ptr  4

enter   1Ah, 0
push    di
push    si
mov     word ptr ds:38h, 0
mov     [bp+var_6], 0
les     bx, [bp+arg_0]
mov     word ptr es:[bx+16h], 1
mov     di, es:[bx+10h]
cmp     di, 1000h
ja      short loc_1C851
or      di, di
jz      short loc_1C851
mov     ax, es:[bx+6]
mov     [bp+var_2], ax
cmp     ax, ds:97Ch
jnb     short loc_1C851
lea     cx, [bp+var_18]
push    cx
push    ax
call    sub_1DA09
pop     bx
pop     bx
or      ax, ax
jz      short loc_1C851
test    [bp+var_10], 10h
jnz     short loc_1C854

loc_1C851:
jmp     loc_1CA6E

loc_1C854:
push    [bp+var_14]
call    sub_1D872
pop     bx
mov     si, ax
push    [bp+var_16]
push    [bp+var_18]
call    sub_1D937
pop     bx
pop     bx
mov     [bp+var_E], ax
mov     [bp+var_C], dx
mov     [bp+var_A], ax
mov     [bp+var_8], dx
or      dx, ax
jz      short loc_1C88F
mov     bx, [bp+var_2]
shr     bx, 3
add     bx, ds:0AA0h
mov     es, word ptr ds:0AA2h
test    byte ptr es:[bx], 1
jnz     short loc_1C88F
jmp     loc_1CA6E

loc_1C88F:
les     bx, [bp+arg_0]
mov     word ptr es:[bx+16h], 8
mov     word ptr es:[bx+10h], 0
mov     ax, [bp+var_8]
or      ax, [bp+var_A]
jnz     short loc_1C8AD
cmp     byte ptr ds:980h, 3
jl      short loc_1C8B6

loc_1C8AD:
cmp     [bp+var_16], 10h
jnb     short loc_1C8B6
jmp     loc_1C999

loc_1C8B6:
cmp     di, si
jnz     short loc_1C8D8
cmp     byte ptr ds:980h, 3
jl      short loc_1C8D8
push    word ptr [bp+arg_0]
call    sub_1AE18
pop     bx
mov     [bp+var_A], ax
mov     [bp+var_8], dx
mov     ax, dx
or      ax, [bp+var_A]
jnz     short loc_1C94E
jmp     loc_1CA6E

loc_1C8D8:
cmp     di, si
jnb     short loc_1C8F7
mov     ax, si
sub     dx, dx
sub     cx, cx
sub     ax, di
sbb     dx, cx
push    dx
push    ax
mov     ax, di
mov     dx, cx
add     ax, [bp+var_E]
adc     dx, [bp+var_C]
push    dx
push    ax
jmp     loc_1C979

loc_1C8F7:
cmp     di, si
ja      short loc_1C8FE
jmp     loc_1C9BA

loc_1C8FE:
push    0
push    di
push    0
push    si
push    [bp+var_C]
push    [bp+var_E]
call    sub_1C045
add     sp, 0Ch
or      ax, ax
jz      short loc_1C917
jmp     loc_1C9BA

loc_1C917:
push    0
push    di
call    sub_1BB79
pop     bx
pop     bx
mov     [bp+var_A], ax
mov     [bp+var_8], dx
or      dx, ax
jnz     short loc_1C94E
cmp     byte ptr ds:980h, 2
jz      short loc_1C94B
mov     bx, ds:996h
mov     [bx+10h], di
push    word ptr [bp+arg_0]
call    sub_1AE18
pop     bx
mov     [bp+var_A], ax
mov     [bp+var_8], dx
mov     ax, dx
or      ax, [bp+var_A]
jnz     short loc_1C94E

loc_1C94B:
jmp     loc_1CA6E

loc_1C94E:
or      si, si
jz      short loc_1C9BA
push    0
call    nullsub_5
pop     bx
inc     [bp+var_6]
push    [bp+var_2]
push    [bp+var_8]
push    [bp+var_A]
call    sub_1D745
add     sp, 6
cmp     [bp+var_16], 10h
jb      short loc_1C981
push    0
push    si
push    [bp+var_C]
push    [bp+var_E]

loc_1C979:
call    sub_1BDB9
add     sp, 8
jmp     short loc_1C9BA

loc_1C981:
mov     bx, ds:996h
mov     word ptr [bx+16h], 4900h
mov     ax, [bp+var_E]
mov     [bx+6], ax
push    word ptr [bp+arg_0]
call    sub_1AE50
pop     bx
jmp     short loc_1C9BA

loc_1C999:
push    word ptr [bp+arg_0]
call    sub_1AE75
pop     bx
mov     [bp+var_A], ax
mov     [bp+var_8], dx
mov     ax, dx
or      ax, [bp+var_A]
jnz     short loc_1C9BA
cmp     byte ptr ds:980h, 3
jl      short loc_1C9B7
jmp     loc_1CA6E

loc_1C9B7:
jmp     loc_1C917

loc_1C9BA:
mov     ax, di
shl     ax, 4
dec     ax
mov     [bp+var_14], ax
mov     ax, [bp+var_18]
mov     dx, [bp+var_16]
mov     [bp+var_E], ax
mov     [bp+var_C], dx
mov     ax, [bp+var_A]
shl     ax, 4
mov     [bp+var_18], ax
mov     ax, [bp+var_8]
shl     ax, 4
mov     cx, [bp+var_A]
shr     cx, 0Ch
add     ax, cx
mov     [bp+var_16], ax
lea     ax, [bp+var_18]
push    ax
push    [bp+var_2]
call    sub_1D9A3
pop     bx
pop     bx
mov     bx, [bp+var_2]
shr     bx, 3
add     bx, ds:0AA0h
mov     es, word ptr ds:0AA2h
or      byte ptr es:[bx], 1
push    [bp+var_16]
push    [bp+var_18]
mov     ax, si
shl     ax, 4
mov     cx, ax
dec     ax
push    ax
push    [bp+var_C]
push    [bp+var_E]
push    [bp+var_2]
mov     [bp+var_1A], cx
call    sub_1D300
add     sp, 0Ch
cmp     di, si
jbe     short loc_1CA56
mov     al, ds:14h
and     ax, 60h

loc_1CA32:
mov     [bp+var_4], ax
or      ax, ax
jz      short loc_1CA56
and     ax, 20h
cmp     ax, 1
sbb     ax, ax
push    ax
mov     ax, di
sub     ax, si
shl     ax, 4
push    ax
push    [bp+var_1A]
push    [bp+var_2]
call    sub_1D84E
add     sp, 8

loc_1CA56:
les     bx, [bp+arg_0]
and     byte ptr es:[bx+26h], 0FEh
mov     es:[bx+10h], di
cmp     [bp+var_6], 0
jz      short loc_1CA6E
push    1
call    nullsub_5
pop     bx

loc_1CA6E:
pop     si
pop     di
leave
retn
sub_1C809 endp



; Attributes: bp-based frame

sub_1CA72 proc near

var_10= word ptr -10h
var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_8= byte ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= dword ptr  4

enter   10h, 0
push    si
mov     [bp+var_4], 0
les     bx, [bp+arg_0]
mov     word ptr es:[bx+16h], 1
mov     ax, es:[bx+6]
mov     ds:38h, ax
mov     [bp+var_2], ax

loc_1CA8F:
lea     ax, [bp+var_10]
push    ax
push    [bp+var_2]
call    sub_1DA09
pop     bx
pop     bx
test    [bp+var_8], 10h
jz      short loc_1CABC
mov     ax, [bp+var_2]
les     bx, [bp+arg_0]
cmp     es:[bx+2], ax
jz      short loc_1CABC
mov     bx, ax
shr     bx, 3
les     si, ds:0AA0h
test    byte ptr es:[bx+si], 1
jnz     short loc_1CABF

loc_1CABC:
jmp     loc_1CBA1

loc_1CABF:
cmp     [bp+var_E], 10h
ja      short loc_1CAC7
jb      short loc_1CB28

loc_1CAC7:
push    [bp+var_C]
call    sub_1D872
pop     bx
push    0
push    ax
push    [bp+var_E]
push    [bp+var_10]
call    sub_1D937
pop     bx
pop     bx
push    dx
push    ax
call    sub_1BDB9
add     sp, 8

loc_1CAE4:
mov     bx, [bp+var_2]
shr     bx, 3
les     si, ds:0AA0h
mov     al, es:[bx+si]
cbw
mov     [bp+var_6], ax
push    [bp+var_2]
call    sub_1DA7C
pop     bx
test    byte ptr [bp+var_6], 10h
jz      short loc_1CB1B
test    byte ptr ds:15h, 4
jnz     short loc_1CB1B
push    [bp+var_C]
push    [bp+var_E]
push    [bp+var_10]
push    [bp+var_2]
call    sub_1D394
add     sp, 8

loc_1CB1B:
test    byte ptr [bp+var_6], 2
jz      short loc_1CB76
add     [bp+var_2], 8
jmp     loc_1CA8F

loc_1CB28:
push    [bp+var_E]
push    [bp+var_10]
call    sub_1D937
pop     bx
pop     bx
mov     bx, ds:996h
mov     [bx+6], ax
mov     ax, [bp+var_4]
mov     bx, ds:996h
cmp     [bx+6], ax
jz      short loc_1CB62
push    word ptr [bp+arg_0]
call    sub_1AE50
pop     bx
or      ax, ax
jz      short loc_1CB62
mov     bx, ds:996h
mov     ax, [bx+16h]
les     bx, [bp+arg_0]
mov     es:[bx+16h], ax
pop     si
leave
retn

loc_1CB62:
push    [bp+var_C]
call    sub_1D872
pop     bx
mov     bx, ds:996h
add     ax, [bx+6]
mov     [bp+var_4], ax
jmp     loc_1CAE4

loc_1CB76:
les     bx, [bp+arg_0]
and     byte ptr es:[bx+26h], 0FEh
mov     ax, es:[bx+6]
mov     es:[bx+16h], ax
mov     word ptr es:[bx+6], 0
mov     ax, ds:38h
cmp     es:[bx+4], ax
jnz     short loc_1CB9B
mov     word ptr es:[bx+4], 0

loc_1CB9B:
push    1
call    nullsub_5
pop     bx

loc_1CBA1:
pop     si
leave
retn
sub_1CA72 endp



; Attributes: bp-based frame

sub_1CBA4 proc near

var_1A= word ptr -1Ah
var_18= word ptr -18h
var_16= word ptr -16h
var_12= byte ptr -12h
var_10= word ptr -10h
var_E= word ptr -0Eh
var_8= byte ptr -8
var_6= word ptr -6
var_4= byte ptr -4
var_2= word ptr -2
arg_0= dword ptr  4

enter   1Ah, 0
push    di
push    si
mov     [bp+var_4], 0
les     bx, [bp+arg_0]
mov     di, es:[bx+6]
lea     ax, [bp+var_1A]
push    ax
push    word ptr es:[bx+6]
call    sub_1DA09
pop     bx
pop     bx
mov     al, [bp+var_12]
sub     ah, ah
mov     [bp+var_2], ax
mov     bx, di
shr     bx, 3
add     bx, ds:0AA0h
mov     es, word ptr ds:0AA2h
mov     al, es:[bx]
cbw
mov     [bp+var_6], ax
test    al, 1
jnz     short loc_1CBEE
mov     ax, ds:0C24h
les     bx, [bp+arg_0]
cmp     es:[bx+22h], ax
jnz     short loc_1CC05

loc_1CBEE:
mov     al, byte ptr [bp+var_2]
and     ax, 18h
cmp     ax, 10h
jz      short loc_1CC1F
cmp     ax, 18h
jnz     short loc_1CC05
cmp     byte ptr ds:980h, 4
jl      short loc_1CC1F

loc_1CC05:
cmp     [bp+var_4], 0
jz      short loc_1CC0E
jmp     loc_1CDCD       ; jumptable 0001CC40 cases 0,2
                        ; jumptable 0001CC7C cases 1,3

loc_1CC0E:
les     bx, [bp+arg_0]
mov     word ptr es:[bx+6], 0
or      byte ptr es:[bx+26h], 1
jmp     loc_1CDCD       ; jumptable 0001CC40 cases 0,2
                        ; jumptable 0001CC7C cases 1,3

loc_1CC1F:
les     bx, [bp+arg_0]
and     byte ptr es:[bx+26h], 0FEh
cmp     [bp+var_18], 10h
jb      short loc_1CC51
mov     al, ds:980h
cbw
jmp     short loc_1CC38

loc_1CC33:              ; jumptable 0001CC40 case 1
inc     [bp+var_4]
jmp     short def_1CC40 ; jumptable 0001CC40 default case, cases 3-5
                        ; jumptable 0001CC7C default case, case 2

loc_1CC38:              ; switch 6 cases
cmp     ax, 5
ja      short def_1CC40 ; jumptable 0001CC40 default case, cases 3-5
                        ; jumptable 0001CC7C default case, case 2
shl     ax, 1
xchg    ax, bx
jmp     cs:jpt_1CC40[bx] ; switch jump
jpt_1CC40 dw offset loc_1CDCD ; jump table for switch statement
dw offset loc_1CC33
dw offset loc_1CDCD
dw offset def_1CC40
dw offset def_1CC40
dw offset def_1CC40

loc_1CC51:
mov     al, ds:980h
cbw
jmp     short loc_1CC74

loc_1CC57:              ; jumptable 0001CC7C case 0
inc     [bp+var_4]
jmp     short def_1CC40 ; jumptable 0001CC40 default case, cases 3-5
                        ; jumptable 0001CC7C default case, case 2

loc_1CC5C:              ; jumptable 0001CC7C case 5
test    di, 3
jnz     short def_1CC40 ; jumptable 0001CC40 default case, cases 3-5
                        ; jumptable 0001CC7C default case, case 2

loc_1CC62:              ; jumptable 0001CC7C case 4
push    [bp+var_18]
push    [bp+var_1A]
call    sub_1D937
pop     bx
pop     bx
cmp     ax, di
jnz     short def_1CC40 ; jumptable 0001CC40 default case, cases 3-5
                        ; jumptable 0001CC7C default case, case 2
jmp     loc_1CDCD       ; jumptable 0001CC40 cases 0,2
                        ; jumptable 0001CC7C cases 1,3

loc_1CC74:              ; switch 6 cases
cmp     ax, 5
ja      short def_1CC40 ; jumptable 0001CC40 default case, cases 3-5
                        ; jumptable 0001CC7C default case, case 2
shl     ax, 1
xchg    ax, bx
jmp     cs:jpt_1CC7C[bx] ; switch jump
jpt_1CC7C dw offset loc_1CC57 ; jump table for switch statement
dw offset loc_1CDCD
dw offset def_1CC40
dw offset loc_1CDCD
dw offset loc_1CC62
dw offset loc_1CC5C

def_1CC40:              ; jumptable 0001CC40 default case, cases 3-5
push    [bp+var_16]     ; jumptable 0001CC7C default case, case 2
call    sub_1D872
pop     bx
les     bx, [bp+arg_0]
mov     es:[bx+10h], ax
mov     bx, ds:996h
mov     [bx+10h], ax
mov     ax, 4800h
les     bx, [bp+arg_0]
mov     es:[bx+16h], ax
mov     bx, ds:996h
mov     [bx+16h], ax
push    0
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_1C5D9
add     sp, 6
les     bx, [bp+arg_0]
test    byte ptr es:[bx+26h], 1
jz      short loc_1CCCE
jmp     loc_1CC05

loc_1CCCE:
mov     si, es:[bx+16h]
test    byte ptr [bp+var_6], 0C0h
jz      short loc_1CCF6
push    [bp+var_6]
push    si
call    sub_1A546
pop     bx
pop     bx
or      ax, ax
jnz     short loc_1CCF6
les     bx, [bp+arg_0]
mov     es:[bx+6], si
push    es
push    bx
call    sub_1CA72
pop     bx
pop     bx
jmp     loc_1CC05

loc_1CCF6:
push    0
call    nullsub_5
pop     bx
lea     ax, [bp+var_10]
push    ax
push    si
call    sub_1DA09
pop     bx
pop     bx
cmp     byte ptr ds:980h, 4
jnz     short loc_1CD11
or      byte ptr [bp+var_2], 60h

loc_1CD11:
push    di
call    sub_1CE75
pop     bx
les     bx, [bp+arg_0]
mov     es:[bx+6], ax
mov     al, byte ptr [bp+var_6]
mov     bx, di
shr     bx, 3
add     bx, ds:0AA0h
mov     es, word ptr ds:0AA2h
mov     es:[bx], al
push    di
push    [bp+var_E]
push    [bp+var_10]
call    sub_1D937
pop     bx
pop     bx
push    dx
push    ax
call    sub_1D745
add     sp, 6
cmp     byte ptr ds:980h, 4
jl      short loc_1CD69
mov     al, byte ptr [bp+var_6]
and     al, 10h
mov     bx, si
shr     bx, 3
add     bx, ds:0AA0h
mov     es, word ptr ds:0AA2h
or      es:[bx], al
push    di
call    sub_1DA7C
pop     bx
mov     di, si
jmp     short loc_1CD6E

loc_1CD69:
push    si
call    sub_1DA7C
pop     bx

loc_1CD6E:
mov     al, byte ptr [bp+var_2]
mov     [bp+var_8], al
lea     ax, [bp+var_10]
push    ax
push    di
call    sub_1D9A3
pop     bx
pop     bx
or      ax, ax
jnz     short loc_1CD89
push    102h
call    sub_1D740
pop     bx

loc_1CD89:
les     bx, [bp+arg_0]
mov     bx, es:[bx+6]
shr     bx, 3
add     bx, ds:0AA0h
mov     es, word ptr ds:0AA2h
mov     byte ptr es:[bx], 1
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_1CA72
pop     bx
pop     bx
push    [bp+var_E]
push    [bp+var_10]
push    [bp+var_16]
push    [bp+var_18]
push    [bp+var_1A]
push    di
call    sub_1D300
add     sp, 0Ch
push    1
call    nullsub_5
pop     bx
les     bx, [bp+arg_0]
mov     es:[bx+6], di

loc_1CDCD:              ; jumptable 0001CC40 cases 0,2
pop     si              ; jumptable 0001CC7C cases 1,3
pop     di
leave
retn
sub_1CBA4 endp

enter   0Ah, 0
push    si
les     bx, [bp+4]
mov     si, es:[bx+10h]
push    si
call    sub_1C5AD
pop     bx
or      ax, ax
jz      short loc_1CE24
les     bx, [bp+4]
mov     ax, es:[bx+14h]
dec     ax
mov     [bp-6], ax
mov     ax, si
shl     ax, 4
mov     [bp-0Ah], ax
mov     ax, si
shr     ax, 0Ch
mov     [bp-8], ax
mov     byte ptr [bp-2], 0F2h
mov     byte ptr [bp-1], 0
mov     word ptr [bp-4], 0
lea     ax, [bp-0Ah]
push    ax
push    si
call    sub_1D9A3
pop     bx
pop     bx
les     bx, [bp+4]
and     byte ptr es:[bx+26h], 0FEh
mov     es:[bx+6], si

loc_1CE24:
pop     si
leave
retn


; Attributes: bp-based frame

sub_1CE27 proc near

var_A= byte ptr -0Ah
var_2= byte ptr -2
arg_0= word ptr  4
arg_2= byte ptr  6

enter   0Ah, 0
push    di
push    si
sub     si, si
lea     ax, [bp+var_A]
push    ax
push    [bp+arg_0]
call    sub_1DA09
pop     bx
pop     bx
or      ax, ax
jz      short loc_1CE6F
test    [bp+var_2], 7Fh
jz      short loc_1CE6F
push    1
call    sub_1DA6A
pop     bx
mov     si, ax
or      si, si
jz      short loc_1CE6F
mov     al, [bp+arg_2]
mov     [bp+var_2], al
lea     ax, [bp+var_A]
push    ax
push    si
call    sub_1D9A3
pop     bx
pop     bx
mov     bx, [bp+arg_0]
shr     bx, 3
les     di, ds:0AA0h
or      byte ptr es:[bx+di], 10h

loc_1CE6F:
mov     ax, si
pop     si
pop     di
leave
retn
sub_1CE27 endp



; Attributes: bp-based frame

sub_1CE75 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    92h
push    [bp+arg_0]
call    sub_1CE27
pop     bx
pop     bx
leave
retn
sub_1CE75 endp



; Attributes: bp-based frame

sub_1CE85 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    9Ah
push    [bp+arg_0]
call    sub_1CE27
pop     bx
pop     bx
leave
retn
sub_1CE85 endp



; Attributes: bp-based frame

sub_1CE95 proc near

var_16= word ptr -16h
var_14= word ptr -14h
var_E= byte ptr -0Eh
var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
arg_0= word ptr  4

enter   16h, 0
push    di
push    si
cmp     [bp+arg_0], 80h
jb      short loc_1CEB8
lea     ax, [bp+var_16]
push    ax
push    [bp+arg_0]
call    sub_1DA09
pop     bx
pop     bx
or      ax, ax
jz      short loc_1CEB8
test    [bp+var_E], 10h
jnz     short loc_1CEBB

loc_1CEB8:
jmp     loc_1CF40

loc_1CEBB:
mov     ax, [bp+arg_0]
mov     ds:38h, ax
mov     bx, ax
shr     bx, 3
les     di, ds:0AA0h
test    byte ptr es:[bx+di], 1
jz      short loc_1CF2E
cmp     byte ptr ds:2Eh, 0
jz      short loc_1CF2E
mov     ax, [bp+var_16]
mov     dx, [bp+var_14]
mov     [bp+var_C], ax
mov     [bp+var_A], dx
mov     [bp+var_8], 0
mov     [bp+var_6], 8
mov     ax, ds:97Ch
shr     ax, 3
mov     [bp+var_4], ax
mov     si, 10h
jmp     short loc_1CF29

loc_1CEFB:
mov     ax, [bp+var_C]
mov     bx, si
shl     bx, 3
add     bx, [bp+var_8]
mov     es, [bp+var_6]
cmp     es:[bx+2], ax
jnz     short loc_1CF28
mov     al, es:[bx+4]
sub     ah, ah
cmp     ax, [bp+var_A]
jnz     short loc_1CF28
cmp     es:[bx+5], ah
jz      short loc_1CF28
les     bx, ds:0AA0h
or      byte ptr es:[bx+si], 1

loc_1CF28:
inc     si

loc_1CF29:
cmp     [bp+var_4], si
ja      short loc_1CEFB

loc_1CF2E:
push    [bp+arg_0]
call    sub_1DA7C
pop     bx
push    1
call    nullsub_5
pop     bx
mov     ax, 1
jmp     short loc_1CF42

loc_1CF40:
sub     ax, ax

loc_1CF42:
pop     si
pop     di
leave
retn
sub_1CE95 endp



; Attributes: bp-based frame

sub_1CF46 proc near

var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_2= byte ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

enter   0Ch, 0
lea     ax, [bp+var_A]
push    ax
push    [bp+arg_2]
call    sub_1DA09
pop     bx
pop     bx
mov     al, [bp+var_2]
and     al, 18h
cmp     al, 10h
jnz     short loc_1CF79
mov     ax, [bp+arg_0]
cmp     [bp+var_6], ax
jb      short loc_1CF79
push    92h
push    [bp+arg_2]
call    sub_1CE27
pop     bx
pop     bx
mov     [bp+arg_2], ax
or      ax, ax
jnz     short loc_1CF7D

loc_1CF79:
sub     ax, ax
leave
retn

loc_1CF7D:
lea     ax, [bp+var_A]
push    ax
push    [bp+arg_2]
call    sub_1DA09
pop     bx
pop     bx
dec     [bp+arg_4]
mov     ax, [bp+arg_4]
mov     cx, [bp+arg_0]
sub     [bp+var_6], cx
cmp     [bp+var_6], ax
jbe     short loc_1CF9D
mov     [bp+var_6], ax

loc_1CF9D:
mov     ax, cx
sub     dx, dx
add     [bp+var_A], ax
adc     [bp+var_8], dx
lea     ax, [bp+var_A]
push    ax
push    [bp+arg_2]
call    sub_1D9A3
pop     bx
pop     bx
mov     ax, [bp+arg_2]
leave
retn
sub_1CF46 endp



; Attributes: bp-based frame

sub_1CFB8 proc near

var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= byte ptr -2
var_1= byte ptr -1
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

enter   0Ah, 0
push    si
push    1
call    sub_1DA6A
pop     bx
mov     si, ax
or      si, si
jz      short loc_1CFF3
mov     ax, [bp+arg_4]
dec     ax
mov     [bp+var_6], ax
mov     ax, [bp+arg_0]
mov     dx, [bp+arg_2]
mov     [bp+var_A], ax
mov     [bp+var_8], dx
mov     [bp+var_2], 92h
mov     [bp+var_4], 0
mov     [bp+var_1], 0
lea     ax, [bp+var_A]
push    ax
push    si
call    sub_1D9A3
pop     bx
pop     bx

loc_1CFF3:
mov     ax, si
pop     si
leave
retn
sub_1CFB8 endp



; Attributes: bp-based frame

sub_1CFF8 proc near

var_34= word ptr -34h
var_32= word ptr -32h
var_30= word ptr -30h
var_2E= word ptr -2Eh
var_2C= word ptr -2Ch
var_2A= byte ptr -2Ah
var_28= word ptr -28h
var_24= word ptr -24h
var_1A= word ptr -1Ah
var_4= word ptr -4
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

enter   34h, 0
push    si
cmp     [bp+arg_4], 0
jz      short loc_1D027
lea     ax, [bp+var_30]
push    ax
push    [bp+arg_4]
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1D96D
add     sp, 8
mov     [bp+var_2E], ax
mov     ax, [bp+arg_4]
dec     ax
push    ax
call    sub_1D872
pop     bx
mov     [bp+arg_4], ax
jmp     short loc_1D038

loc_1D027:
mov     ax, [bp+arg_2]
mov     [bp+var_2E], ax
mov     ax, [bp+arg_0]
mov     [bp+var_30], ax
mov     [bp+arg_4], 1000h

loc_1D038:
cmp     [bp+var_30], 0
jz      short loc_1D041
inc     [bp+var_2E]

loc_1D041:
cmp     byte ptr ds:980h, 4
jge     short loc_1D05C
cmp     [bp+var_2E], 0
jz      short loc_1D05C
push    [bp+var_2E]
call    sub_1DA6A
pop     bx
mov     [bp+var_2C], ax
or      ax, ax
jnz     short loc_1D061

loc_1D05C:
sub     ax, ax
pop     si
leave
retn

loc_1D061:
mov     [bp+var_32], 0
mov     [bp+var_4], 0

loc_1D06B:
mov     ax, [bp+arg_4]
mov     [bp+var_1A], ax
mov     ax, [bp+var_32]
sub     ax, [bp+var_2E]
cmp     ax, 0FFFFh
jnz     short loc_1D08E
cmp     [bp+var_30], 0
jz      short loc_1D08E
mov     ax, [bp+var_30]
dec     ax
push    ax
call    sub_1D872
pop     bx
mov     [bp+var_1A], ax

loc_1D08E:
mov     ax, [bp+var_1A]
mov     bx, ds:996h
mov     [bx+10h], ax
mov     ax, [bp+var_32]
shl     ax, 3
add     ax, [bp+var_2C]
push    ax
lea     ax, [bp+var_2A]
push    ss
push    ax
call    sub_1C5D9
add     sp, 6
test    byte ptr [bp+var_4], 1
jz      short loc_1D0EB
mov     [bp+var_28], 0
mov     ax, [bp+var_2C]
mov     [bp+var_24], ax
cmp     [bp+var_32], 0
jz      short loc_1D0CE
lea     ax, [bp+var_2A]
push    ss
push    ax
call    sub_1CA72
pop     bx

loc_1D0CD:
pop     bx

loc_1D0CE:
mov     ax, [bp+var_2E]
cmp     [bp+var_32], ax
jnb     short loc_1D05C
mov     ax, [bp+var_32]
mov     [bp+var_34], ax
inc     [bp+var_32]
shl     ax, 3
add     ax, [bp+var_2C]
push    ax
call    sub_1DA7C
jmp     short loc_1D0CD

loc_1D0EB:
mov     ax, [bp+var_2E]
inc     [bp+var_32]
cmp     [bp+var_32], ax
jnz     short loc_1D0FC
mov     ax, [bp+var_2C]
pop     si
leave
retn

loc_1D0FC:
mov     si, [bp+var_32]
mov     bx, [bp+var_2C]
shr     bx, 3
add     bx, ds:0AA0h
mov     es, word ptr ds:0AA2h
lea     ax, [bx-1]
mov     cx, bx
mov     bx, ax
mov     al, es:[bx+si]
or      al, 2
mov     bx, cx
mov     es:[bx+si-1], al
jmp     loc_1D06B
sub_1CFF8 endp



; Attributes: bp-based frame

sub_1D122 proc near

var_22= word ptr -22h
var_20= word ptr -20h
var_1E= word ptr -1Eh
var_1C= word ptr -1Ch
var_1A= word ptr -1Ah
var_18= byte ptr -18h
var_16= word ptr -16h
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= dword ptr  4

enter   22h, 0
push    di
push    si
mov     [bp+var_1C], 0
mov     [bp+var_1A], 8
mov     bx, 8
mov     es, bx
assume es:nothing
mov     ax, es:[bx]
shr     ax, 3
mov     [bp+var_22], ax
mov     [bp+var_20], ax
jmp     loc_1D1CA

loc_1D146:
les     bx, ds:0AA0h
assume es:nothing
mov     si, [bp+var_22]
mov     al, es:[bx+si]
and     al, 81h
dec     al
jnz     short loc_1D1CA
shl     si, 3
add     si, [bp+var_1C]
mov     es, [bp+var_1A]
mov     ax, es:[si+2]
mov     dx, es:[si+4]
sub     dh, dh
push    dx
push    ax
mov     di, es
call    sub_1D937
pop     bx
pop     bx
mov     [bp+var_4], ax
mov     [bp+var_2], dx
test    dl, 0Fh
jz      short loc_1D197
mov     es, di
push    word ptr es:[si]
call    sub_1D872
pop     bx
push    0
push    ax
push    [bp+var_2]
push    [bp+var_4]
call    sub_1BDB9
add     sp, 8
jmp     short loc_1D1AF

loc_1D197:
mov     [bp+var_6], 4900h
mov     [bp+var_16], ax
lea     ax, [bp+var_18]
push    ss
push    ax
push    ss
push    ax
push    21h ; '!'
call    dword ptr ds:22h
add     sp, 0Ah

loc_1D1AF:
mov     bx, [bp+var_22]
shl     bx, 3
add     bx, [bp+var_1C]
mov     es, [bp+var_1A]
mov     al, es:[bx+5]
sub     ah, ah
mov     es:[bx+6], ax
mov     byte ptr es:[bx+5], 80h

loc_1D1CA:
dec     [bp+var_22]
cmp     [bp+var_22], 10h
jl      short loc_1D1D6
jmp     loc_1D146

loc_1D1D6:
les     bx, [bp+arg_0]
mov     al, es:[bx+16h]
sub     ah, ah
mov     [bp+var_1E], ax
push    word ptr es:[bx+2]
push    word ptr es:[bx+10h]
push    word ptr es:[bx+2]
push    word ptr es:[bx+14h]
push    word ptr es:[bx+0Ah]
call    sub_1D781
add     sp, 0Ah
les     bx, [bp+arg_0]
mov     es:[bx+16h], ax
mov     ax, [bp+var_20]
mov     [bp+var_22], ax
jmp     short loc_1D24C

loc_1D20B:
les     bx, ds:0AA0h
mov     si, [bp+var_22]
mov     al, es:[bx+si]
and     al, 81h
dec     al
jnz     short loc_1D24C
shl     si, 3
add     si, [bp+var_1C]
mov     es, [bp+var_1A]
mov     byte ptr es:[si+5], 92h
mov     ax, es:[si+6]
mov     [bp+var_20], ax
mov     word ptr es:[si+6], 0
push    es
push    si
push    [bp+var_1E]
mov     di, es
call    sub_1D7B1
add     sp, 6
mov     al, byte ptr [bp+var_20]
mov     es, di
mov     es:[si+5], al

loc_1D24C:
dec     [bp+var_22]
cmp     [bp+var_22], 10h
jge     short loc_1D20B
pop     si
pop     di
leave
retn
sub_1D122 endp



; Attributes: bp-based frame

sub_1D259 proc near

var_12= word ptr -12h
var_10= word ptr -10h
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

enter   14h, 0
push    di
push    si
mov     ax, [bp+arg_2]
dec     [bp+arg_2]
cmp     ax, [bp+arg_0]
jnz     short loc_1D26D
jmp     loc_1D2FC

loc_1D26D:
lea     ax, [bp+var_12]
push    ax
mov     cx, ds:0C36h
mov     [bp+var_2], cx
push    cx
call    sub_1DA09
pop     bx
pop     bx
mov     ax, [bp+arg_2]
shr     ax, 0Ch
mov     cx, [bp+arg_2]
shl     cx, 4
mov     [bp+var_12], cx
mov     [bp+var_10], ax
lea     ax, [bp+var_12]
push    ax
push    [bp+var_2]
call    sub_1D9A3
pop     bx
pop     bx
mov     ax, [bp+var_2]
sub     bx, bx
mov     es, ax
mov     [bp+var_8], bx
mov     [bp+var_6], es
cmp     byte ptr es:[bx], 4Dh ; 'M'
jz      short loc_1D2B5
cmp     byte ptr es:[bx], 5Ah ; 'Z'
jnz     short loc_1D2FC

loc_1D2B5:
mov     ax, [bp+arg_0]
sub     ax, [bp+arg_2]
dec     ax
mov     [bp+var_4], ax
shl     ax, 4
add     ax, [bp+var_8]
mov     dx, es
mov     cx, [bp+var_8]
mov     bx, es
push    cx
push    ds
mov     di, ax
mov     si, cx
mov     ds, dx
mov     cx, 8
rep movsw
pop     ds
pop     cx
mov     es, bx
mov     si, cx
mov     byte ptr es:[si], 4Dh ; 'M'
mov     di, [bp+var_4]
dec     di
mov     es:[si+3], di
mov     word ptr es:[si+1], 0
mov     es, dx
mov     si, ax
mov     ax, [bp+var_4]
sub     es:[si+3], ax

loc_1D2FC:
pop     si
pop     di
leave
retn
sub_1D259 endp



; Attributes: bp-based frame

sub_1D300 proc near

var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_4= byte ptr -4
var_2= byte ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah
arg_8= word ptr  0Ch
arg_A= word ptr  0Eh

enter   0Ch, 0
push    di
push    si
mov     bx, [bp+arg_0]
shr     bx, 3
les     di, ds:0AA0h
test    byte ptr es:[bx+di], 10h
jz      short loc_1D390
mov     si, ds:97Ch
mov     ax, si
xor     al, byte ptr [bp+arg_0]
and     ax, 7
xor     si, ax
mov     [bp+var_2], 0
jmp     short loc_1D373

loc_1D32A:
lea     ax, [bp+var_C]
push    ax
push    si
call    sub_1DA09
pop     bx
pop     bx
or      ax, ax
jz      short loc_1D373
test    [bp+var_4], 10h
jz      short loc_1D373
mov     ax, [bp+var_C]
mov     dx, [bp+var_A]
sub     ax, [bp+arg_2]
sbb     dx, [bp+arg_4]
mov     cx, [bp+arg_6]
sub     bx, bx
cmp     dx, bx
ja      short loc_1D373
jb      short loc_1D359
cmp     ax, cx
ja      short loc_1D373

loc_1D359:
add     ax, [bp+arg_8]
adc     dx, [bp+arg_A]
mov     [bp+var_C], ax
mov     [bp+var_A], dx
lea     ax, [bp+var_C]
push    ax
push    si
call    sub_1D9A3
pop     bx
pop     bx
mov     [bp+var_2], 1

loc_1D373:
sub     si, 8
cmp     si, 80h
jnb     short loc_1D32A
cmp     [bp+var_2], 0
jnz     short loc_1D390
mov     bx, [bp+arg_0]
shr     bx, 3
les     di, ds:0AA0h
and     byte ptr es:[bx+di], 0EFh

loc_1D390:
pop     si
pop     di
leave
retn
sub_1D300 endp



; Attributes: bp-based frame

sub_1D394 proc near

var_A= word ptr -0Ah
var_8= word ptr -8
var_2= byte ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

enter   0Ah, 0
push    si
mov     si, [bp+arg_0]
xor     si, ds:97Ch
and     si, 7
xor     si, ds:97Ch
jmp     short loc_1D3DD

loc_1D3A9:
lea     ax, [bp+var_A]
push    ax
push    si
call    sub_1DA09
pop     bx
pop     bx
or      ax, ax
jz      short loc_1D3DD
test    [bp+var_2], 10h
jz      short loc_1D3DD
mov     ax, [bp+var_A]
mov     dx, [bp+var_8]
sub     ax, [bp+arg_2]
sbb     dx, [bp+arg_4]
mov     cx, [bp+arg_6]
sub     bx, bx
cmp     dx, bx
ja      short loc_1D3DD
jb      short loc_1D3D8
cmp     ax, cx
ja      short loc_1D3DD

loc_1D3D8:
push    si
call    sub_1DA7C
pop     bx

loc_1D3DD:
sub     si, 8
cmp     si, 80h
jnb     short loc_1D3A9
pop     si
leave
retn
sub_1D394 endp

sub     ax, ax
cwd
retn


; Attributes: bp-based frame

sub_1D3ED proc near

var_14= word ptr -14h
var_12= word ptr -12h
var_10= word ptr -10h
var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

enter   14h, 0
cmp     byte ptr ds:2Eh, 0
jz      short loc_1D433
cmp     byte ptr ds:0A16h, 0
jnz     short loc_1D433
mov     ax, ds:9Ch
mov     dx, ds:9Eh
mov     [bp+var_4], ax
mov     [bp+var_2], dx
cmp     byte ptr ds:2Eh, 0Bh
jnz     short loc_1D41C

loc_1D413:
mov     ax, ds:0AA8h
mov     dx, ds:0AAAh
leave
retn

loc_1D41C:
mov     ax, [bp+var_4]
mov     dx, [bp+var_2]
sub     ax, ds:98h
sbb     dx, ds:9Ah
push    dx
push    ax
call    sub_1D952
pop     bx
pop     bx
leave
retn

loc_1D433:
mov     [bp+var_14], 3

loc_1D438:
mov     ax, [bp+arg_0]
mov     dx, [bp+arg_2]
sub     ax, ds:0AA8h
sbb     dx, ds:0AAAh
add     ax, 0FFFh
adc     dx, 0
and     ax, 0F000h
mov     [bp+var_C], ax
mov     [bp+var_A], dx
mov     [bp+var_E], 3

loc_1D45A:
call    word ptr ds:0AA4h
mov     [bp+var_8], ax
mov     [bp+var_6], dx
cmp     dx, [bp+var_A]
jg      short loc_1D47C
jl      short loc_1D470
cmp     ax, [bp+var_C]
jnb     short loc_1D47C

loc_1D470:
cmp     [bp+arg_4], 0
jnz     short loc_1D413
mov     [bp+var_C], ax
mov     [bp+var_A], dx

loc_1D47C:
cmp     [bp+var_A], 0
jg      short loc_1D48A
jl      short loc_1D413
cmp     [bp+var_C], 0
jz      short loc_1D413

loc_1D48A:
push    [bp+var_A]
push    [bp+var_C]
call    word ptr ds:0AA6h
pop     bx
pop     bx
mov     [bp+var_4], ax
mov     [bp+var_2], dx
or      dx, ax
jnz     short loc_1D4B6
cmp     [bp+arg_4], 0
jz      short loc_1D4AE
dec     [bp+var_E]
jns     short loc_1D4AE
jmp     loc_1D413

loc_1D4AE:
sar     [bp+var_A], 1
rcr     [bp+var_C], 1
jmp     short loc_1D45A

loc_1D4B6:
push    [bp+var_2]
push    ax
call    sub_1D937
pop     bx
pop     bx
mov     [bp+var_12], ax
mov     [bp+var_10], dx
cli
mov     ax, [bp+var_12]
mov     dx, [bp+var_10]
cmp     ds:9Ah, dx
ja      short loc_1D4E3
jb      short loc_1D4DA
cmp     ds:98h, ax
ja      short loc_1D4E3

loc_1D4DA:
mov     ax, ds:9Ah
or      ax, ds:98h
jnz     short loc_1D52F

loc_1D4E3:
mov     ax, ds:98h
mov     dx, ds:9Ah
mov     [bp+var_8], ax
mov     [bp+var_6], dx
mov     ax, [bp+var_12]
mov     dx, [bp+var_10]
mov     ds:98h, ax
mov     ds:9Ah, dx
push    [bp+var_6]
push    [bp+var_8]
push    0
push    dx
push    ax
call    sub_1D8E2
add     sp, 0Ah
push    0
push    0
push    4
push    [bp+var_10]
push    [bp+var_12]
call    sub_1D8E2
add     sp, 0Ah
add     [bp+var_12], 1
adc     [bp+var_10], 0
sub     [bp+var_C], 10h
sbb     [bp+var_A], 0

loc_1D52F:
push    [bp+var_A]
push    [bp+var_C]
call    sub_1D937
pop     bx
pop     bx
add     ax, [bp+var_12]
adc     dx, [bp+var_10]
mov     [bp+var_4], ax
mov     [bp+var_2], dx
cmp     ds:9Eh, dx
ja      short loc_1D55B
jb      short loc_1D554
cmp     ds:9Ch, ax
jnb     short loc_1D55B

loc_1D554:
mov     ds:9Ch, ax
mov     ds:9Eh, dx

loc_1D55B:
push    [bp+var_A]
push    [bp+var_C]
call    sub_1D937
pop     bx
pop     bx
push    dx
push    ax
push    [bp+var_10]
push    [bp+var_12]
call    sub_1BDB9
add     sp, 8
cmp     byte ptr ds:2Eh, 0
jnz     short loc_1D58C
push    word ptr ds:1204h
push    word ptr ds:1202h
push    [bp+var_10]
push    [bp+var_12]
call    sub_1C1DF

loc_1D58C:
cmp     byte ptr ds:2Eh, 0Bh
jz      short loc_1D5A1
mov     ax, [bp+var_C]
mov     dx, [bp+var_A]
add     ds:0AA8h, ax
adc     ds:0AAAh, dx

loc_1D5A1:
dec     [bp+var_14]
cmp     [bp+var_14], 0
jg      short loc_1D5AD
jmp     loc_1D413

loc_1D5AD:
jmp     loc_1D438
sub_1D3ED endp

enter   4, 0
push    si
call    sub_1EFBC
or      ax, ax
jz      short loc_1D5C2
sub     ax, ax
cwd
pop     si
leave
retn

loc_1D5C2:
cmp     word ptr ds:0ADCh, 0
jz      short loc_1D5D9
call    sub_1D6C0
mov     [bp-2], dx
or      dx, ax
jz      short loc_1D5D9
mov     dx, [bp-2]
pop     si
leave
retn

loc_1D5D9:
push    word ptr ds:0AEh
push    word ptr ds:0ACh
call    sub_1D952
pop     bx
pop     bx
mov     cx, ds:0ECEh
shr     cx, 6
mov     bx, ax
mov     si, dx
mov     dx, cx
mov     cx, ds:0ECEh
shl     cx, 0Ah
mov     ax, cx
sub     ax, bx
sbb     dx, si
pop     si
leave
retn
enter   8, 0
mov     ax, ds:0ACh
mov     dx, ds:0AEh
mov     [bp-4], ax
mov     [bp-2], dx
test    byte ptr ds:47h, 80h
jnz     short loc_1D622
test    byte ptr ds:15h, 40h
jz      short loc_1D627

loc_1D622:
sub     ax, ax
cwd
leave
retn

loc_1D627:
cmp     word ptr ds:0ADCh, 0
jz      short loc_1D652
push    word ptr [bp+6]
push    word ptr [bp+4]
call    loc_1D6F5
pop     bx
pop     bx
mov     [bp-6], dx
or      dx, ax
jz      short loc_1D652
push    word ptr [bp+6]
push    word ptr [bp+4]
push    word ptr [bp-6]
push    ax
call    sub_1EFC3
add     sp, 8
leave
retn

loc_1D652:
mov     ax, [bp+4]
mov     dx, [bp+6]
add     ax, 3FFFh
adc     dx, 0
push    dx
push    ax
call    sub_1D937
pop     bx
pop     bx
add     ax, [bp-4]
adc     dx, [bp-2]
and     ax, 0FC00h
mov     ds:9Ch, ax
mov     ds:9Eh, dx
sub     ax, 1
sbb     dx, 0
push    dx
push    ax
push    word ptr [bp-2]
push    word ptr [bp-4]
call    near ptr sub_1EEF8
add     sp, 8
mov     ax, ds:0ACh
mov     dx, ds:0AEh
cmp     [bp-2], dx
ja      short loc_1D6B0
jb      short loc_1D69C
cmp     [bp-4], ax
jnb     short loc_1D6B0

loc_1D69C:
mov     ds:9Ch, ax
mov     ds:9Eh, dx
push    word ptr [bp-2]
push    word ptr [bp-4]
call    sub_1D952
pop     bx
pop     bx
leave
retn

loc_1D6B0:
mov     ax, [bp-4]
mov     dx, [bp-2]
mov     ds:9Ch, ax
mov     ds:9Eh, dx
jmp     loc_1D622



sub_1D6C0 proc near
push    si
xor     ax, ax
test    byte ptr ds:1582h, 1
jnz     short loc_1D719
cmp     byte ptr ds:2Eh, 0Bh
jnz     short loc_1D6D7
call    sub_1F075
mov     ds:0AF0h, ax

loc_1D6D7:
xor     dx, dx

loc_1D6D9:
mov     ax, sp
mov     bx, ss
sub     word ptr ds:996h, 180h
push    20h ; ' '
pop     ss
assume ss:nothing
mov     sp, ds:996h
sub     sp, 10h
push    bx
push    ax
push    dx
jmp     far ptr 18h:1E17h

loc_1D6F5:
push    si
mov     si, 0ADAh
xor     ax, ax

loc_1D6FB:
inc     si
inc     si
cmp     si, 0AECh
jnb     short loc_1D719
cmp     [si], ax
jnz     short loc_1D6FB
push    bp
mov     bp, sp
mov     dx, [bp+8]
mov     ax, [bp+6]
pop     bp
mov     cx, 400h
div     cx
xchg    ax, dx
jmp     short loc_1D6D9

loc_1D719:
cwd
pop     si
retn
sub_1D6C0 endp

pop     ax
pop     dx
add     word ptr ds:996h, 180h
pop     bx
pop     ss
assume ss:nothing
mov     sp, bx
pop     si
retn
mov     bx, ds:0AFAh
mov     cx, [bx]
dec     bx
dec     bx
mov     ds:0AFAh, bx
cmp     bx, 0AFAh
jmp     dword ptr ds:0AF6h
jmp     cx


; Attributes: noreturn

sub_1D740 proc near
jmp     far ptr 18h:229Dh
sub_1D740 endp



; Attributes: bp-based frame

sub_1D745 proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
push    si
push    di
push    ds
call    sub_1D8FD
xor     si, si
xor     di, di
lsl     cx, bx
jcxz    short loc_1D77C
push    ds
pop     es
push    bx
pop     ds
add     cx, 1
rcr     cx, 1
cld
rep movsw
jnb     short loc_1D766
movsb

loc_1D766:
mov     bx, ss
cmp     bx, [bp+arg_4]
jnz     short loc_1D77C
mov     cx, [bp+arg_2]
mov     dx, [bp+arg_0]
mov     ax, 6
push    cs
call    near ptr sub_1A179
push    ss
pop     ss

loc_1D77C:
pop     ds
pop     di
pop     si
pop     bp
retn
sub_1D745 endp



; Attributes: bp-based frame

sub_1D781 proc near

arg_0= word ptr  4
arg_2= dword ptr  6
arg_6= word ptr  0Ah
arg_8= word ptr  0Ch

push    bp
mov     bp, sp
mov     cx, 6

loc_1D787:
push    0
loop    loc_1D787
push    [bp+arg_8]
push    [bp+arg_6]
push    [bp+arg_0]
mov     bx, sp
push    ss
pop     es
lds     dx, [bp+arg_2]
mov     ax, 4B00h
int     21h             ; DOS - 2+ - LOAD OR EXECUTE (EXEC)
                        ; DS:DX -> ASCIZ filename
                        ; ES:BX -> parameter block
                        ; AL = subfunc: load & execute program
leave
push    20h ; ' '
pop     ds
assume ds:nothing
cld
jnb     short loc_1D7AA
neg     ax
retn

loc_1D7AA:
mov     ah, 4Dh
int     21h             ; DOS - 2+ - GET EXIT CODE OF SUBPROGRAM (WAIT)
xor     ah, ah
retn
sub_1D781 endp ; sp-analysis failed



; Attributes: bp-based frame

sub_1D7B1 proc near

arg_0= word ptr  4
arg_2= dword ptr  6

push    bp
mov     bp, sp
lds     bx, [bp+arg_2]
assume ds:nothing
push    word ptr [bx]
call    sub_1D872
xchg    ax, bx
mov     ah, 48h
int     21h             ; DOS - 2+ - ALLOCATE MEMORY
                        ; BX = number of 16-byte paragraphs desired
jb      short loc_1D80A
xchg    ax, bx
mov     ax, [bx+2]
mov     cl, [bx+4]
mov     byte ptr [bx+5], 0
push    50h ; 'P'
pop     es
assume es:nothing
shr     bx, 3
mov     byte ptr es:[bx], 0
mov     bx, word ptr [bp+arg_2]
mov     [bx+2], ax
mov     [bx+4], cl
mov     cx, [bx]
push    bx
pop     ds
xor     dx, dx
mov     bx, [bp+arg_0]
inc     cx
jz      short loc_1D7EF
jns     short loc_1D7FF

loc_1D7EF:
push    cx
mov     cx, 8000h
mov     ah, 3Fh
int     21h             ; DOS - 2+ - READ FROM FILE WITH HANDLE
                        ; BX = file handle, CX = number of bytes to read
                        ; DS:DX -> buffer
jb      short loc_1D80A
mov     dh, 80h
pop     cx
sub     ch, 80h

loc_1D7FF:
mov     ah, 3Fh
int     21h             ; DOS - 2+ - READ FROM FILE WITH HANDLE
                        ; BX = file handle, CX = number of bytes to read
                        ; DS:DX -> buffer
push    20h ; ' '
pop     ds
assume ds:nothing
jb      short loc_1D80A
leave
retn

loc_1D80A:
mov     ax, 4CFFh
int     21h             ; DOS - 2+ - QUIT WITH EXIT CODE (EXIT)
sub_1D7B1 endp ; sp-analysis failed ; AL = exit code



; Attributes: bp-based frame

sub_1D80F proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah
arg_8= byte ptr  0Ch

push    bp
mov     bp, sp
push    8
pop     ds
assume ds:nothing
pushf
cli
mov     bx, [bp+arg_0]
and     bl, 0F8h
mov     ax, [bp+arg_6]
mov     [bx], ax
mov     al, [bp+arg_8]
mov     [bx+5], al
mov     ax, [bp+arg_2]
mov     dx, [bp+arg_4]
mov     cx, 4

loc_1D831:
shl     ax, 1
rcl     dx, 1
loop    loc_1D831
mov     [bx+2], ax
mov     [bx+4], dl
mov     [bx+7], dh
pop     dx
pop     bp
pop     ax
mov     cx, ss
mov     ss, cx
push    20h ; ' '
pop     ds
assume ds:nothing
push    dx
popf
jmp     ax
sub_1D80F endp ; sp-analysis failed



; Attributes: bp-based frame

sub_1D84E proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= byte ptr  0Ah

push    bp
mov     bp, sp
push    es
push    di
mov     es, [bp+arg_0]
assume es:nothing
mov     di, [bp+arg_2]
mov     cx, [bp+arg_4]
mov     al, [bp+arg_6]
mov     ah, al
cld
sub     cx, 1
inc     cx
rcr     cx, 1
rep stosw
rcl     cx, 1
rep stosb
pop     di
pop     es
pop     bp
retn
sub_1D84E endp




sub_1D872 proc near
mov     bx, sp
mov     ax, ss:[bx+2]
add     ax, 10h
rcr     ax, 1
mov     cl, 3
shr     ax, cl
retn
sub_1D872 endp

; START OF FUNCTION CHUNK FOR sub_1D8CC

loc_1D882:
push    ebx
mov     ebx, [bp+arg_0]
push    esi
shl     ebx, 4
movzx   esi, [bp+arg_4]
mov     es, word ptr ds:0C2Ch
mov     ax, es:[ebx+esi]
mov     dx, es:[ebx+esi+2]
pop     esi
pop     ebx
pop     bp
retn
; END OF FUNCTION CHUNK FOR sub_1D8CC
; START OF FUNCTION CHUNK FOR sub_1D8E2

loc_1D8A8:
push    edi
mov     edi, [bp+arg_0]
push    esi
shl     edi, 4
movzx   esi, bp
add     di, [bp+arg_4]
add     si, 0Ah
mov     es, word ptr ds:0C2Ch
movs    dword ptr es:[edi], dword ptr ss:[esi]
pop     esi
pop     edi
pop     bp
retn
; END OF FUNCTION CHUNK FOR sub_1D8E2


; Attributes: bp-based frame

sub_1D8CC proc near

arg_0= dword ptr  4
arg_4= word ptr  8

; FUNCTION CHUNK AT 3FA2 SIZE 00000026 BYTES

push    bp
mov     bp, sp
cmp     byte ptr ds:2Fh, 3
jnb     short loc_1D882
push    ds
call    sub_1D8FD
mov     ax, [bx]
mov     dx, [bx+2]

loc_1D8DF:
pop     ds
assume ds:nothing
pop     bp
retn
sub_1D8CC endp



; Attributes: bp-based frame

sub_1D8E2 proc near

arg_0= dword ptr  4
arg_4= word ptr  8
arg_6= word ptr  0Ah
arg_8= word ptr  0Ch

; FUNCTION CHUNK AT 3FC8 SIZE 00000024 BYTES

push    bp
mov     bp, sp
cmp     byte ptr ds:2Fh, 3
jnb     short loc_1D8A8
push    ds
call    sub_1D8FD
mov     ax, [bp+arg_6]
mov     dx, [bp+arg_8]
mov     [bx], ax
mov     [bx+2], dx
jmp     short loc_1D8DF
sub_1D8E2 endp




sub_1D8FD proc near
mov     dx, [bp+4]
mov     cx, [bp+6]
shl     dx, 1
rcl     cx, 1
shl     dx, 1
rcl     cx, 1
shl     dx, 1
rcl     cx, 1
shl     dx, 1
rcl     cx, 1
mov     bx, ds:0C36h
test    bl, 3
jnz     short loc_1D92E
push    8
pop     ds
assume ds:nothing
mov     [bx+2], dx
mov     [bx+4], cl
mov     [bx+7], ch

loc_1D928:
mov     ds, bx
assume ds:nothing
mov     bx, [bp+8]
retn

loc_1D92E:
mov     ax, 7
push    cs
call    near ptr sub_1A179
jmp     short loc_1D928
sub_1D8FD endp




sub_1D937 proc near
mov     bx, sp
mov     ax, ss:[bx+2]
mov     dx, ss:[bx+4]
shr     dx, 1
rcr     ax, 1
shr     dx, 1
rcr     ax, 1
shr     dx, 1
rcr     ax, 1
shr     dx, 1
rcr     ax, 1
retn
sub_1D937 endp




sub_1D952 proc near
mov     bx, sp
mov     ax, ss:[bx+2]
mov     dx, ss:[bx+4]
shl     ax, 1
rcl     dx, 1
shl     ax, 1
rcl     dx, 1
shl     ax, 1
rcl     dx, 1
shl     ax, 1
rcl     dx, 1
retn
sub_1D952 endp



; Attributes: bp-based frame

sub_1D96D proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
mov     ax, [bp+arg_0]
mov     dx, [bp+arg_2]
div     [bp+arg_4]
mov     bx, [bp+arg_6]
mov     ss:[bx], dx
pop     bp
retn
sub_1D96D endp




sub_1D981 proc near
cli
mov     ax, [bp+4]
stosw
mov     ax, [bp+0]
stosw
mov     al, [bp+2]
mov     ah, [bp+8]
stosw
mov     al, [bp+9]
and     al, 0F0h
mov     ah, [bp+6]
and     ah, 0Fh
or      al, ah
mov     ah, [bp+3]
stosw
retn
sub_1D981 endp




sub_1D9A3 proc near
mov     bx, sp
push    bp
push    edi
mov     bp, ss:[bx+4]
mov     bx, ss:[bx+2]
cmp     byte ptr ds:2Eh, 0
jz      short loc_1D9CB
and     bl, 0F8h
mov     di, bx
push    8
pop     es
assume es:nothing
call    sub_1D981
pop     edi
pop     bp
pop     ax
push    ss
pop     ss
sti
jmp     ax

loc_1D9CB:
push    ds
pop     es
assume es:nothing
xor     edi, edi
mov     di, 8C0h
push    di
call    sub_1D981
pop     di
mov     cx, ds
test    byte ptr [bp+8], 8
jz      short loc_1D9E2
mov     cx, cs

loc_1D9E2:
lar     ax, cx
and     ah, 0FEh
mov     es:[di+5], ah
pop     edx
pop     bp
pop     cx
mov     ax, 0Ch
push    cs
call    near ptr sub_1A179
push    ss
pop     ss
mov     edi, edx
cmc
mov     ax, 0
rcl     ax, 1
sti
jmp     cx
sub_1D9A3 endp ; sp-analysis failed

; START OF FUNCTION CHUNK FOR sub_1DA09

loc_1DA05:
pop     si
xor     ax, ax
retn
; END OF FUNCTION CHUNK FOR sub_1DA09



sub_1DA09 proc near

; FUNCTION CHUNK AT 4125 SIZE 00000004 BYTES

mov     bx, sp
push    si
mov     si, ss:[bx+2]
cmp     si, ds:97Ch
jnb     short loc_1DA05
push    ds
push    bp
mov     bp, ss:[bx+4]
cmp     byte ptr ds:2Eh, 0
jz      short loc_1DA4B
push    8
pop     ds
assume ds:nothing
and     si, 0FFF8h

loc_1DA29:
lodsw
mov     [bp+4], ax
lodsw
mov     [bp+0], ax
lodsw
mov     [bp+2], al
mov     [bp+8], ah
lodsw
and     al, 0F0h
mov     [bp+9], al
mov     [bp+3], ah
mov     word ptr [bp+6], 0
inc     ax

loc_1DA47:
pop     bp
pop     ds
assume ds:nothing
pop     si
retn

loc_1DA4B:
push    ds
pop     es
push    edi
xor     edi, edi
mov     di, 8C0h
mov     si, di
mov     bx, ss:[bx+2]
mov     ax, 0Bh
push    cs
call    near ptr sub_1A179
pop     edi
jnb     short loc_1DA29
xor     ax, ax
jmp     short loc_1DA47
sub_1DA09 endp




sub_1DA6A proc near
xor     ax, ax
mov     bx, sp
mov     cx, ss:[bx+2]
push    cs
call    near ptr sub_1A179

loc_1DA76:
cmc
sbb     bx, bx
and     ax, bx
retn
sub_1DA6A endp




sub_1DA7C proc near
mov     bx, sp
mov     bx, ss:[bx+2]
mov     ax, 1
push    cs
call    near ptr sub_1A179
jmp     short loc_1DA76
sub_1DA7C endp

align 2



sub_1DA8C proc near
mov     di, ss
lar     edi, edi
bt      edi, 16h
pop     di
push    large [dword ptr ds:0C18h]
push    word ptr ds:0C1Ch
mov     ds:0C18h, esp
jb      short loc_1DAAE
mov     word ptr ds:0C1Ah, 0

loc_1DAAE:
mov     word ptr ds:0C1Ch, ss
sub     word ptr ds:996h, 180h
push    ds
pop     ss
movzx   esp, word ptr ds:996h
sub     sp, 10h
jmp     di
sub_1DA8C endp

db 4 dup(0), 70h, 0, 0EAh, 0F9h, 41h, 70h
db 2 dup(0), 51h, 0B9h, 0, 1, 0E8h, 80h
db 10h, 59h, 66h, 0EAh, 4 dup(0), 70h, 5 dup(0)
db 70h, 0, 0EAh, 15h, 42h, 70h, 2 dup(0)
db 51h, 0B9h, 1, 2, 0E8h, 64h, 10h, 59h
db 66h, 0EAh, 4, 3 dup(0), 70h, 5 dup(0)
db 70h, 0, 0EAh, 31h, 42h, 70h, 2 dup(0)
db 51h, 0B9h, 2, 4, 0E8h, 48h, 10h, 59h
db 66h, 0EAh, 8, 3 dup(0), 70h, 5 dup(0)
db 70h, 0, 0EAh, 4Dh, 42h, 70h, 2 dup(0)
db 51h, 0B9h, 3, 8, 0E8h, 2Ch, 10h, 59h
db 66h, 0EAh, 0Ch, 3 dup(0), 70h, 5 dup(0)
db 70h, 0, 0EAh, 69h, 42h, 70h, 2 dup(0)
db 51h, 0B9h, 4, 10h, 0E8h, 2 dup(10h), 59h
db 66h, 0EAh, 10h, 3 dup(0), 70h, 5 dup(0)
db 70h, 0, 0EAh, 50h, 0Ch, 18h, 2 dup(0)
db 51h, 0B9h, 5, 20h, 0E8h, 6Fh, 0Fh, 59h
db 66h, 0EAh, 14h, 3 dup(0), 70h, 5 dup(0)
db 70h, 0, 0EAh, 0A1h, 42h, 70h, 2 dup(0)
db 51h, 0B9h, 6, 40h, 0E8h, 0D8h, 0Fh, 59h
db 66h, 0EAh, 18h, 3 dup(0), 70h, 5 dup(0)
db 70h, 0, 0EAh, 0BDh, 42h, 70h, 2 dup(0)
db 51h, 0B9h, 7, 80h, 0E8h, 0BCh, 0Fh, 59h
db 66h, 0EAh, 1Ch, 3 dup(0), 70h, 5 dup(0)
db 70h, 0, 0EAh, 5Ch, 0Ch, 18h, 2 dup(0)
db 51h, 0B9h, 8, 1, 0E8h, 0A0h, 0Fh, 59h
db 66h, 0EAh, 20h, 3 dup(0), 70h, 5 dup(0)
db 70h, 0, 0EAh, 60h, 0Ch, 18h, 2 dup(0)
db 51h, 0B9h, 9, 2, 0E8h, 84h, 0Fh, 59h
db 66h, 0EAh, 24h, 3 dup(0), 70h, 5 dup(0)
db 70h, 0, 0EAh, 64h, 0Ch, 18h, 2 dup(0)
db 51h, 0B9h, 0Ah, 4, 0E8h, 68h, 0Fh, 59h
db 66h, 0EAh, 28h, 3 dup(0), 70h, 5 dup(0)
db 70h, 0, 0EAh, 68h, 0Ch, 18h, 2 dup(0)
db 51h, 0B9h, 0Bh, 8, 0E8h, 4Ch, 0Fh, 59h
db 66h, 0EAh, 2Ch, 3 dup(0), 70h, 5 dup(0)
db 70h, 0, 0EAh, 6Ch, 0Ch, 18h, 2 dup(0)
db 51h, 0B9h, 0Ch, 10h, 0E8h, 30h, 0Fh, 59h
db 66h, 0EAh, 30h, 3 dup(0), 70h, 5 dup(0)
db 70h, 0, 0EAh, 0C0h, 1Eh, 70h, 2 dup(0)
db 51h, 0B9h, 0Dh, 20h, 0E8h, 14h, 0Fh, 59h
db 66h, 0EAh, 34h, 3 dup(0), 70h, 5 dup(0)
db 70h, 0, 0EAh, 0CAh, 2Ch, 18h, 2 dup(0)
db 51h, 0B9h, 0Eh, 40h, 0E8h, 0F8h, 0Eh
db 59h, 66h, 0EAh, 38h, 3 dup(0), 70h, 5 dup(0)
db 70h, 0, 0EAh, 9Dh, 43h, 70h, 2 dup(0)
db 51h, 0B9h, 0Fh, 80h, 0E8h, 0BEh, 0Eh
db 59h, 66h, 0EAh, 3Ch, 3 dup(0), 70h, 5 dup(0)
db 70h, 0, 0EAh, 0B9h, 43h, 70h, 2 dup(0)
db 51h, 0B9h, 10h, 1, 0E8h, 0C0h, 0Eh, 59h
db 66h, 0EAh, 40h, 3 dup(0), 70h, 0, 21h
db 20h, 31h, 32h, 18h, 0, 4, 0, 20h, 21h
db 20h, 32h, 70h, 0, 86h, 53h, 1, 2 dup(21h)
db 2 dup(1), 2 dup(9), 31h, 20h, 0, 0Dh
db 41h, 45h, 0F8h, 45h, 49h, 46h, 95h, 46h
db 9Eh, 46h, 0AEh, 46h, 0BEh, 46h, 0D7h
db 46h, 0F2h, 46h, 43h, 47h, 6Ch, 47h, 8Bh
db 47h, 9Ch, 47h, 0, 3, 2Bh, 49h, 72h, 49h
db 87h, 49h, 0ECh, 44h, 70h, 0, 1, 6, 0BEh
db 47h, 0D9h, 47h, 0F4h, 47h, 22h, 48h, 62h
db 48h, 0ABh, 48h, 0ECh, 44h, 70h, 0, 1
db 7, 0EEh, 4Bh, 6, 4Ch, 14h, 4Ch, 0F4h
db 4Dh, 50h, 4Eh, 5Eh, 4Fh, 84h, 4Fh, 0ECh
db 44h, 70h, 0, 2 dup(1), 0C1h, 4Fh, 0ECh
db 44h, 70h, 0, 1, 4, 0A1h, 49h, 77h, 4Ah
db 0C8h, 4Ah, 0FBh, 4Ah, 0ECh, 44h, 70h
db 0, 1, 4, 0FFh, 44h, 0FFh, 44h, 0FFh, 44h
db 0FFh, 44h, 0ECh, 44h, 70h, 0, 1, 0, 0ECh
db 44h, 70h, 0, 1, 2, 0EBh, 4Fh, 1, 51h
db 0, 3, 78h, 51h, 90h, 51h, 9Bh, 51h, 0ECh
db 44h, 70h, 0, 1, 0, 0ECh, 44h, 70h, 0
db 1, 5 dup(0), 0DCh, 43h, 0F8h, 43h, 4
db 44h, 16h, 44h, 2Ah, 44h, 32h, 44h
word_1DD5C dw 4440h
db 4Eh, 44h, 54h, 44h, 5Ah, 44h, 66h, 44h
db 70h, 44h, 70h, 44h, 6Ch, 44h, 6Eh, 44h



sub_1DD6E proc near
pushad
push    es
push    ds
mov     bx, ss
mov     ebp, esp
lar     ebx, ebx
bt      ebx, 16h
jb      short loc_1DD88
movzx   ebp, sp
xchg    bx, bx

loc_1DD88:
mov     bx, [ebp+28h]
cmp     bx, 71h ; 'q'
jb      short loc_1DD9C
lar     ebx, ebx
bt      ebx, 16h
xchg    bx, bx

loc_1DD9C:
sbb     bx, bx
push    bx
push    0FFFFh
and     esi, [ebp-4]
and     edi, [ebp-4]
cmp     ah, 0Fh
jnb     short loc_1DDDA
and     byte ptr [ebp+2Ch], 0FEh
xor     bx, bx
mov     bl, ah
shl     bx, 1
mov     si, cs:[bx+4470h]
xor     ah, ah
mov     bx, ax
mov     ax, cs:[si-2]
test    al, al
js      short loc_1DDD6
cmp     bl, ah
jnb     short loc_1DDDA
shl     bx, 1
cld
jmp     word ptr cs:[bx+si]

loc_1DDD6:
jmp     dword ptr cs:[si-6]

loc_1DDDA:
or      byte ptr [ebp+2Ch], 1

loc_1DDDF:
mov     esp, ebp
pop     ds
pop     es
popad
iretd
sub_1DD6E endp




sub_1DDE8 proc near
movzx   ebx, word ptr [ebp+14h]

loc_1DDEE:
mov     ax, 8
mov     ds, ax
assume ds:nothing
cmp     bx, ds:8
jnb     short loc_1DDDA
and     bx, 0FFF8h
jz      short loc_1DDDA
xor     cx, cx
mov     cl, [bx+5]
test    cl, 80h
jz      short loc_1DE1D
push    es
push    50h ; 'P'
pop     es
assume es:nothing
push    si
mov     si, bx
shr     si, 3
mov     al, es:[si]
pop     si
pop     es
assume es:nothing
and     al, 0F0h
cmp     al, 0F0h
jz      short loc_1DE1F

loc_1DE1D:
clc
retn

loc_1DE1F:
stc
retn
sub_1DDE8 endp

mov     si, [ebp+1Ch]
or      si, si
jle     short loc_1DDDA
push    44FFh



sub_1DE2C proc near
push    20h ; ' '
pop     es
assume es:nothing
push    8
pop     ds

loc_1DE32:
mov     cx, ds:8
mov     bx, ds:2
shl     bx, 3
test    byte ptr es:14h, 80h
jz      short loc_1DE4A
mov     bx, es:0C0Eh

loc_1DE4A:
add     bx, 5
sub     cx, bx
jbe     short loc_1DEB5
shr     cx, 3
xor     ax, ax

loc_1DE56:
xor     dx, dx

loc_1DE58:
add     bx, 8
cmp     [bx], al
loopne  loc_1DE58
jcxz    short loc_1DEAD

loc_1DE61:
inc     dx
cmp     dx, si
jz      short loc_1DE71
add     bx, 8
cmp     [bx], al
loope   loc_1DE61
jcxz    short loc_1DEAD
jmp     short loc_1DE56

loc_1DE71:
and     bl, 0F8h
mov     es:0C0Eh, bx
mov     ah, 93h
xchg    ax, [bx+4]
test    ah, ah
jnz     short loc_1DE99
xor     al, al
mov     [bx], ax
mov     [bx+2], ax
mov     [bx+6], ax
dec     dx
jz      short loc_1DE94
sub     bx, 8
jmp     short loc_1DE71

loc_1DE94:
mov     [ebp+20h], bx
retn

loc_1DE99:
mov     [bx+4], ax
add     bx, 8
cmp     dx, si
jz      short loc_1DEA8
inc     dx
xor     ax, ax
jmp     short loc_1DE99

loc_1DEA8:
add     bx, 5
jmp     short loc_1DE56

loc_1DEAD:
test    byte ptr es:14h, 80h
jz      short loc_1DEC8

loc_1DEB5:
mov     ax, 78h ; 'x'
xchg    ax, es:0C0Eh
cmp     ax, 80h
jb      short loc_1DEC5
jmp     loc_1DE32

loc_1DEC5:
jmp     loc_1DDDA

loc_1DEC8:
cmp     word ptr ds:2, 10h
jbe     short loc_1DEC5
mov     word ptr ds:2, 10h
jmp     loc_1DE32
sub_1DE2C endp

call    sub_1DDE8
jb      short loc_1DEC5
jcxz    short loc_1DEC5
cmp     bx, 80h
jb      short loc_1DEC5
xor     ax, ax
mov     [bx+5], al
push    50h ; 'P'
pop     ds
assume ds:nothing
shr     bx, 3
mov     [bx], al
mov     cx, ds
shr     cx, 3
xor     cx, bx
jnz     loc_1DEFF
mov     ds, cx
assume ds:nothing

loc_1DEFF:
mov     cx, es
shr     cx, 3
xor     cx, bx
jnz     loc_1DF0C
mov     es, cx
assume es:nothing

loc_1DF0C:
mov     cx, fs
shr     cx, 3
xor     cx, bx
jnz     loc_1DF19
mov     fs, cx

loc_1DF19:
mov     cx, gs
shr     cx, 3
xor     cx, bx
jnz     loc_1DF26
mov     gs, cx

loc_1DF26:
jmp     loc_1DDDF
db 0B8h, 50h, 0, 8Eh, 0C0h, 0Fh, 3, 0C8h
db 33h, 0FFh, 6Ah, 8, 1Fh, 67h, 8Bh, 45h
db 14h, 0BAh, 10h, 0, 0F7h, 0E2h, 93h, 0B0h
db 0F0h, 0F2h, 0AEh, 75h, 17h, 8Bh, 0F7h
db 4Eh, 0C1h, 0E6h, 3, 39h, 5Ch, 2, 75h
db 0F1h, 38h, 54h, 4, 75h, 0ECh, 67h, 89h
db 75h, 20h, 0E9h, 82h, 0FEh, 52h, 53h, 0BEh
db 1, 0, 0E8h, 0C7h, 0FEh, 0C7h, 7, 2 dup(0FFh)
db 8Fh, 47h, 2, 5Ah, 88h, 57h, 4, 0B0h, 0F0h
db 0E9h, 75h, 0FFh, 67h, 0C7h, 45h, 20h
db 8, 0, 0E9h, 61h, 0FEh, 67h, 8Bh, 5Dh
db 14h, 6Ah, 50h, 1Fh, 0C1h, 0EBh, 3, 80h
db 0Fh, 80h, 0E9h, 51h, 0FEh, 67h, 8Bh, 5Dh
db 14h, 6Ah, 50h, 1Fh, 0C1h, 0EBh, 3, 80h
db 27h, 7Fh, 0E9h, 41h, 0FEh, 0E8h, 47h
db 0FEh, 0E3h, 7Dh, 8Bh, 47h, 2, 67h, 89h
db 45h, 18h, 8Ah, 47h, 4, 8Ah, 67h, 7, 67h
db 89h, 45h, 1Ch, 0E9h, 28h, 0FEh, 0E8h
db 2Eh, 0FEh, 72h, 64h, 0E3h, 62h, 67h, 8Bh
db 45h, 18h, 89h, 47h, 2, 67h, 8Bh, 45h
db 1Ch, 88h, 47h, 4, 88h, 67h, 7, 0E9h, 0Dh
db 0FEh, 0E8h, 13h, 0FEh, 0Fh, 82h, 47h
db 0, 0E3h, 45h, 6Ah, 20h, 7, 26h, 80h, 3Eh
db 2Fh, 0, 3, 72h, 31h, 66h, 50h, 67h, 8Bh
db 45h, 1Ch, 8Bh, 0C8h, 66h, 0C1h, 0E0h
db 10h, 67h, 8Bh, 45h, 18h, 8Ah, 57h, 6
db 80h, 0E2h, 70h, 0F7h, 0C1h, 0F0h, 0FFh
db 74h, 7, 66h, 0C1h, 0E8h, 0Ch, 80h, 0CAh
db 80h, 89h, 7, 66h, 0C1h, 0E8h, 10h, 0Ah
db 0C2h, 88h, 47h, 6, 0E9h, 0C8h, 0FDh, 67h
db 8Bh, 45h, 18h, 89h, 7, 0E9h, 0BFh, 0FDh
; START OF FUNCTION CHUNK FOR sub_1A57E

loc_1E020:
jmp     loc_1DDDA
; END OF FUNCTION CHUNK FOR sub_1A57E
db 8Bh, 0C1h, 0A8h, 80h, 75h, 3, 25h, 10h
; START OF FUNCTION CHUNK FOR sub_1A57E

loc_1E02B:
add     [di], ah
adc     [bx], ch
cmp     ax, 10h
jnz     short loc_1E020
push    cx
call    sub_1DDE8
pop     cx
jb      short loc_1E020
mov     ax, [bx+5]
and     ax, 0F00h
and     ch, 0F0h
or      ax, cx
mov     [bx+5], ax
jmp     loc_1DDDF
; END OF FUNCTION CHUNK FOR sub_1A57E
call    sub_1DDE8
jcxz    short loc_1E020
mov     si, 1
push    bx
call    sub_1DE2C
pop     si
mov     di, bx
push    ds
pop     es
movsw
movsw
lodsw
and     ah, 0E0h
or      ah, 12h
stosw
movsw
jmp     loc_1DDDF
call    sub_1DDE8
jcxz    short loc_1E020
mov     esi, ebx

loc_1E073:
movs    dword ptr es:[edi], dword ptr [esi]
movs    dword ptr es:[edi], dword ptr [esi]
jmp     loc_1DDDF
call    sub_1DDE8
jb      short loc_1E020
jcxz    short loc_1E020
mov     esi, edi
mov     edi, ebx
push    es
push    ds
pop     es
pop     ds
test    byte ptr [esi+5], 10h
jnz     short loc_1E073
test    byte ptr [esi+5], 7Fh
jz      short loc_1E073
jmp     loc_1DDDA
push    38h ; '8'
pop     ds
assume ds:nothing
mov     si, [ebp+14h]
and     si, 0FFh
shl     si, 2
lodsw
mov     [ebp+18h], ax
lodsw
mov     [ebp+1Ch], ax
jmp     loc_1DDDF
push    38h ; '8'
pop     es
assume es:nothing
mov     di, [ebp+14h]
and     di, 0FFh
shl     di, 2
mov     ax, [ebp+18h]
stosw
mov     ax, [ebp+1Ch]
stosw
jmp     loc_1DDDF
cmp     byte ptr [ebp+14h], 10h
ja      short loc_1E0FF
call    sub_1E58C
call    sub_1E67C
mov     bl, [ebp+14h]
xor     bh, bh
imul    bx, 1Ch
mov     eax, [bx+41E5h]
mov     [ebp+18h], eax
mov     ax, [bx+41E9h]
mov     [ebp+1Ch], ax
jmp     loc_1DDDF

loc_1E0FF:
jmp     loc_1DDDA
mov     bl, [ebp+14h]
cmp     bl, 10h
ja      short loc_1E0FF
push    20h ; ' '
pop     ds
assume ds:nothing
xor     bh, bh
push    bx
push    0
call    sub_1E58C
call    sub_1E67C

loc_1E119:
pop     bx
pop     di
imul    di, 1Ch
mov     eax, [ebp+18h]
mov     [bx+di+41E5h], eax
mov     ax, [ebp+1Ch]
mov     [bx+di+41E9h], ax
lar     eax, eax
bt      eax, 16h
sbb     cx, cx
and     [bx+di+41E7h], cx
jmp     loc_1DDDF
mov     al, [ebp+14h]
xor     ah, ah
mov     si, ax
cmp     al, 10h
jbe     short loc_1E168
push    10h
pop     ds
assume ds:nothing
shl     si, 3
lodsw
mov     [ebp+18h], ax
mov     ax, [si+4]
mov     [ebp+1Ah], ax
lodsw
mov     [ebp+1Ch], ax
jmp     loc_1DDDF

loc_1E168:
call    sub_1E58C
imul    si, 1Ch
mov     eax, [si+41FBh]
mov     [ebp+18h], eax
mov     ax, [si+41FFh]
mov     [ebp+1Ch], ax
jmp     loc_1DDDF

loc_1E183:
push    di
push    16h
call    sub_1E58C
jmp     short loc_1E119
mov     al, [ebp+14h]
xor     ah, ah
mov     di, ax
cmp     al, 10h
jbe     short loc_1E183
push    10h
pop     es
assume es:nothing
shl     di, 3
mov     ax, [ebp+18h]
stosw
mov     ax, [ebp+1Ch]
stosw
lar     eax, eax
bt      eax, 16h
sbb     cx, cx
and     cx, [ebp+1Ah]
mov     es:[di+2], cx
jmp     loc_1DDDF



sub_1E1BD proc near
inc     byte ptr ds:1182h
push    edi
call    sub_1DA8C
pushfd
db      66h
push    cs
push    offset byte_198E0
call    near ptr sub_1A57E
lss     esp, ds:0C18h
pushf
add     word ptr ds:996h, 180h
popf
pop     word ptr ds:0C1Ch
pop     large [dword ptr ds:0C18h]
pop     edi
dec     byte ptr ds:1182h
retn
sub_1E1BD endp




sub_1E1ED proc near
push    20h ; ' '
pop     ds
assume ds:nothing
mov     cl, 3
xchg    cl, ds:980h
mov     bx, [ebp+14h]
call    sub_1E1BD
mov     ds:980h, cl
mov     [ebp+14h], bx
jb      short loc_1E208
retn

loc_1E208:
jmp     loc_1DDDA
sub_1E1ED endp

mov     ah, 48h ; 'H'
call    sub_1E1ED
mov     [ebp+18h], ax
xchg    ax, bx
push    8
pop     ds
assume ds:nothing
mov     dl, [bx+4]
mov     ax, [bx+2]
mov     dh, 0
mov     cx, 10h
div     cx
mov     [ebp+20h], ax
push    50h ; 'P'
pop     ds
assume ds:nothing
shr     bx, 3

loc_1E22F:
or      byte ptr [bx], 0F0h
inc     bx
test    byte ptr [bx-1], 2
jnz     short loc_1E22F
jmp     loc_1DDDF



sub_1E23C proc near
mov     bx, [ebp+18h]
call    loc_1DDEE
jnb     short loc_1E208
push    50h ; 'P'
pop     ds
mov     es, word ptr [ebp+18h]
assume es:nothing
mov     bx, es
shr     bx, 3
retn
sub_1E23C endp

call    sub_1E23C

loc_1E255:
and     byte ptr [bx], 0Fh
inc     bx
test    byte ptr [bx-1], 2
jnz     short loc_1E255
mov     ah, 49h ; 'I'
call    sub_1E1ED
jmp     loc_1DDDF
call    sub_1E23C
test    byte ptr [bx], 2
jnz     short loc_1E208
mov     bx, [ebp+14h]
cmp     bx, 1000h
ja      short loc_1E208
mov     ah, 4Ah ; 'J'
call    sub_1E1ED
jmp     loc_1DDDF
push    20h ; ' '
pop     ds
assume ds:nothing
push    edi
call    sub_1DA8C
call    sub_1BAA0
lss     esp, ds:0C18h
add     word ptr ds:996h, 180h
pop     word ptr ds:0C1Ch
pop     large [dword ptr ds:0C18h]
pop     edi
mov     bl, ah
mov     bh, dl
mov     cl, dh
mov     ch, 0
push    cx
push    bx
mov     dx, ds:11FCh
mov     ax, ds:11FAh
mov     bl, ah
mov     bh, dl
mov     cl, dh
call    sub_1E34D
mov     es, word ptr [ebp+2]
stos    word ptr es:[edi]
mov     ax, dx
stos    word ptr es:[edi]
mov     ax, bx
stos    word ptr es:[edi]
mov     ax, cx
stos    word ptr es:[edi]
mov     ax, bx
stos    word ptr es:[edi]
mov     ax, cx
stos    word ptr es:[edi]
mov     ax, ds:9Dh
sub     ax, ds:99h
mov     dl, ds:9Fh
sbb     dl, ds:9Bh
mov     dh, 0
stos    word ptr es:[edi]
mov     ax, dx
stos    word ptr es:[edi]
mov     ax, bx
stos    word ptr es:[edi]
pop     bx
pop     cx
mov     ax, cx
stos    word ptr es:[edi]
mov     ax, bx
stos    word ptr es:[edi]
mov     ax, cx
stos    word ptr es:[edi]
mov     ax, ds:9Dh
sub     ax, ds:99h
mov     dl, ds:9Fh
sbb     dl, ds:9Bh
mov     dh, 0
stos    word ptr es:[edi]
mov     ax, dx
stos    word ptr es:[edi]
mov     ax, bx
stos    word ptr es:[edi]
mov     ax, cx
stos    word ptr es:[edi]
mov     ax, 0FFFFh
mov     ecx, 8
rep stos word ptr es:[edi]
jmp     loc_1DDDF



sub_1E32E proc near
push    8
pop     es
assume es:nothing
mov     bx, 60h ; '`'
mov     es:[bx+2], ax
mov     es:[bx+4], dl
mov     es:[bx+7], dh
mov     es, bx
assume es:nothing
retn
sub_1E32E endp

mov     cx, 4

loc_1E346:
shr     dx, 1
rcr     ax, 1
loop    loc_1E346
retn



sub_1E34D proc near
mov     cx, 4

loc_1E350:
shl     ax, 1
rcl     dx, 1
loop    loc_1E350
retn
sub_1E34D endp

push    20h ; ' '
pop     ds
mov     dx, [ebp+14h]
mov     ax, [ebp+1Ch]
push    edi
call    sub_1DA8C
push    dx
push    ax
call    sub_1C262
lss     esp, ds:0C18h
add     word ptr ds:996h, 180h
pop     word ptr ds:0C1Ch
pop     large [dword ptr ds:0C18h]
pop     edi
mov     cx, dx
or      cx, ax
jz      short loc_1E3A5
call    sub_1E34D
mov     [ebp+14h], dx
mov     [ebp+1Ch], ax
mov     ax, ds:0C10h
mov     [ebp+4], ax
mov     ax, ds:0C12h
mov     [ebp+8], ax
jmp     loc_1DDDF

loc_1E3A5:
jmp     loc_1DDDA
push    20h ; ' '
pop     ds
mov     dx, [ebp+8]
mov     ax, [ebp+4]
push    edi
call    sub_1DA8C
push    dx
push    ax
call    sub_1C3AA
lss     esp, ds:0C18h
add     word ptr ds:996h, 180h
pop     word ptr ds:0C1Ch
pop     large [dword ptr ds:0C18h]
pop     edi
or      ax, ax
jz      short loc_1E3A5
jmp     loc_1DDDF
push    20h ; ' '
pop     ds
mov     si, [ebp+8]
mov     cx, [ebp+4]
mov     dx, [ebp+14h]
mov     ax, [ebp+1Ch]
push    edi
call    sub_1DA8C
push    dx
push    ax
push    si
push    cx
call    sub_1C408
lss     esp, ds:0C18h
add     word ptr ds:996h, 180h
pop     word ptr ds:0C1Ch
pop     large [dword ptr ds:0C18h]
pop     edi
mov     cx, ax
or      cx, dx
jz      short loc_1E3A5
call    sub_1E34D
mov     [ebp+14h], dx
mov     [ebp+1Ch], ax
jmp     loc_1DDDF
align 2



sub_1E426 proc near
mov     cx, 20h ; ' '
mov     ds, cx
mov     ax, ds:996h
mov     bx, ax
sub     bx, 156h
mov     [bx], ax
mov     ds:996h, bx
mov     word ptr [bx+2], ss
mov     [bx+0Ch], ebp
mov     word ptr [bx+6], es
mov     [bx+8], edi
mov     word ptr [bx+22h], 0FFFFh
mov     cx, es:[edi+30h]
mov     esi, edi
jcxz    short loc_1E46F
push    cx
mov     ax, 10h
mul     cx
movzx   edi, word ptr es:[edi+2Eh]
push    bx
call    sub_1E32E
pop     bx
pop     dx
jmp     short loc_1E47B

loc_1E46C:
jmp     loc_1DDDA

loc_1E46F:
sub     bx, 10h
movzx   edi, bx
push    ds
pop     es
assume es:nothing
mov     dx, seg seg000

loc_1E47B:
movzx   ecx, word ptr [ebp+1Ch]
add     cx, cx
cmp     cx, 40h ; '@'
ja      short loc_1E46C
sub     bx, cx
jcxz    short loc_1E4A1
push    esi
std
lea     esi, [ebp+2Fh]
add     esi, ecx
dec     di
rep movs byte ptr es:[edi], byte ptr ss:[esi]
db      67h
inc     di
cld
pop     esi

loc_1E4A1:
lea     di, [di-32h]
retn
sub_1E426 endp




sub_1E4A5 proc near
mov     ds, word ptr [ebp+2]
assume ds:nothing
mov     ax, [esi+2Ch]
mov     es:[di+28h], ax
mov     ax, [esi+2Ah]
mov     es:[di+26h], ax
mov     cx, 90CFh

loc_1E4BC:
pop     bp
push    20h ; ' '
pop     ss
assume ss:nothing
lea     sp, [bx-32h]
push    dx
push    di
mov     dx, [esi+20h]
and     dh, 0FEh
jmp     bp
sub_1E4A5 endp

call    sub_1E426
add     bx, 0Ch
add     di, 0Ch
mov     cl, 0CDh
mov     ch, [ebp+14h]
mov     ds, word ptr [ebp+2]
push    4C33h
jmp     short loc_1E4BC
call    sub_1E426
add     bx, 2
add     di, 2
push    4C1Eh
jmp     short sub_1E4A5
db 0E8h, 2Fh, 0FFh, 0E8h, 0ABh, 0FFh, 26h
db 89h, 55h, 30h, 80h, 0E6h, 0FDh, 26h, 89h
db 55h, 2Ah, 26h, 0C7h, 45h, 2Ch, 0ADh, 1Fh
db 36h, 0A1h, 0B6h, 9, 26h, 89h, 45h, 2Eh
db 26h, 89h, 55h, 24h, 67h, 8Bh, 46h, 24h
db 0ABh, 67h, 8Bh, 46h, 22h, 0ABh, 91h, 66h
db 0B9h, 8, 3 dup(0), 66h, 0Fh, 0B7h, 0FFh
db 0F3h, 67h, 66h, 0A5h, 67h, 91h, 16h, 1Fh
db 8Bh, 2Eh, 96h, 9, 0EAh, 96h, 1Fh, 18h
db 0, 8Bh, 2Eh, 96h, 9, 8Eh, 5Eh, 6, 66h
db 8Bh, 7Eh, 8, 67h, 89h, 47h, 20h, 67h
db 8Fh, 47h, 24h, 67h, 8Fh, 47h, 22h, 67h
db 66h, 8Fh, 7, 67h, 66h, 8Fh, 47h, 4, 67h
db 66h, 8Fh, 47h, 8, 66h, 83h, 0C4h, 4, 67h
db 66h, 8Fh, 47h, 10h, 67h, 66h, 8Fh, 47h
db 14h, 67h, 66h, 8Fh, 47h, 18h, 67h, 66h
db 8Fh, 47h, 1Ch, 26h, 8Fh, 6, 96h, 9, 66h
db 8Bh, 46h, 0Ch, 17h, 66h, 94h, 66h, 8Bh
db 0ECh, 0E9h, 53h, 0F8h



sub_1E58C proc near
push    20h ; ' '
pop     ds
assume ds:nothing
push    word ptr ds:0C14h
push    8
pop     ds
assume ds:nothing
mov     bx, cs
mov     cx, [bx+2]
mov     al, [bx+4]
mov     ah, [bx+7]
pop     bx
add     bx, 8
mov     [bx+2], cx
mov     [bx+4], al
mov     [bx+7], ah
mov     word ptr [bx], 0FFFFh
mov     byte ptr [bx+5], 92h
mov     ds, bx
assume ds:nothing
retn
sub_1E58C endp

db 90h
byte_1E5BA db 0C2h dup(0)



sub_1E67C proc near
cmp     word ptr ds:4CDAh, 0
jnz     short locret_1E6D0
push    ds
push    20h ; ' '
pop     ds
assume ds:nothing
mov     cl, 0
xchg    cl, ds:980h
mov     ah, 48h ; 'H'
mov     bx, 400h
call    sub_1E1BD
mov     ds:980h, cl
push    ds
pop     es
pop     ds
assume ds:nothing
jb      short loc_1E6D1
mov     si, ax
mov     di, es:0C14h
add     di, 10h
mov     ds:4CDAh, di
push    8
pop     es
assume es:nothing
mov     cx, 4
rep movs word ptr es:[di], word ptr es:[si]
or      byte ptr es:[di-2], 40h
mov     cl, 8
sub     si, cx
rep movs byte ptr es:[di], byte ptr es:[si]
mov     es:[si-3], cl
push    50h ; 'P'
pop     es
assume es:nothing
shr     di, 3
mov     byte ptr es:[di-1], 0E1h

locret_1E6D0:
retn

loc_1E6D1:
jmp     loc_1DDDA
sub_1E67C endp

call    sub_1E58C
call    sub_1E67C
mov     bx, 4CD0h

loc_1E6DD:
add     bx, 0Ch
cmp     bx, 4D9Ch
jnb     short loc_1E6D1
cmp     word ptr [bx+4], 0
jnz     short loc_1E6DD
mov     eax, [ebp+8]
mov     [bx], eax
mov     ax, [ebp+0]
mov     [bx+4], ax
mov     eax, [ebp+4]
and     eax, [ebp-4]
mov     [bx+6], eax
mov     ax, [ebp+2]
mov     [bx+0Ah], ax
sub     bx, 4CDCh
xchg    ax, bx
mov     cl, 0Ch
div     cl
shl     ax, 2
add     ax, 1F50h
mov     [ebp+18h], ax
push    20h ; ' '
pop     ds
assume ds:nothing
mov     ax, ds:9B6h
mov     [ebp+1Ch], ax
jmp     loc_1DDDF
push    20h ; ' '
pop     ds
cmp     cx, ds:9B6h
jnz     short loc_1E752
sub     dx, 1F50h
cmp     dx, 3Dh ; '='
jnb     short loc_1E752
call    sub_1E58C
mov     bx, dx
add     bx, bx
mov     word ptr [bx+4CE0h], 0
jmp     loc_1DDDF

loc_1E752:
jmp     loc_1DDDA
call    sub_1E58C
pop     bx
xor     bh, bh
mov     dx, bx
imul    bx, 0Ch
shl     dx, 3
les     edi, [bx+4CE2h]
assume es:nothing
pop     bp
inc     bp
inc     bp
mov     es:[edi+2Eh], bp
pop     ax
mov     es:[edi+30h], ax
pop     word ptr es:[edi+20h]
pop     word ptr es:[edi+24h]
pop     word ptr es:[edi+22h]
movzx   esi, sp
mov     ecx, 8
rep movs dword ptr es:[edi], dword ptr ss:[esi]
lea     edi, [edi-20h]
mov     si, ds
add     si, dx
add     si, 18h
mov     cx, 10h
mul     cx
push    8
pop     ds
assume ds:nothing
mov     [si+2], ax
mov     [si+4], dl
mov     [si+7], dh
push    20h ; ' '
pop     ds
assume ds:nothing
add     word ptr ds:0C16h, 400h
mov     ss, word ptr cs:byte_1E5BA
assume ss:nothing
movzx   esp, word ptr ds:0C16h
mov     ds, si
assume ds:nothing
movzx   esi, bp
pushfd
db      66h
push    cs
push    offset byte_198E0
push    4EFAh
jmp     large fword ptr cs:[bx+4CDCh]
cli
mov     bx, 20h ; ' '
mov     ss, bx
assume ss:nothing
mov     sp, ss:996h
sub     sp, 180h
sub     word ptr ss:0C16h, 400h
push    es
pop     ds
push    large dword ptr [edi+1Ch]
push    large dword ptr [edi+18h]
push    large dword ptr [edi+14h]
push    large dword ptr [edi+10h]
sub     esp, 4
push    large dword ptr [edi+8]
push    large dword ptr [edi+4]
push    large dword ptr [edi]
push    word ptr [edi+22h]
push    word ptr [edi+24h]
push    word ptr [edi+20h]
; START OF FUNCTION CHUNK FOR sub_1A57E

loc_1E824:              ; jumptable 0001A5D7 case 106
push    word ptr [edi+2Ch]
push    word ptr [edi+2Ah]
mov     si, [di+2Eh]
mov     di, [di+30h]
sub     si, 6
mov     ds, bx
assume ds:nothing
jmp     far ptr 18h:2016h
; END OF FUNCTION CHUNK FOR sub_1A57E
retfd
mov     word ptr [ebp+20h], 0
push    20h ; ' '
pop     ds
mov     ax, ds:9B6h
mov     [ebp+14h], ax
mov     word ptr [ebp+1Ch], 203Ch
mov     word ptr [ebp+8], cs
mov     dword ptr [ebp+4], 4F5Ch
jmp     loc_1DDDF
push    20h ; ' '
pop     ds
mov     ax, ds:9B6h
mov     [ebp+14h], ax
mov     word ptr [ebp+1Ch], 203Dh
mov     word ptr [ebp+8], cs
mov     dword ptr [ebp+4], 4FA4h
jmp     loc_1DDDF
db 9Ch, 0FAh, 6Ah, 48h, 1Fh, 8Fh, 6, 94h
db 1Fh, 6Ah, 20h, 17h, 36h, 8Bh, 26h, 96h
db 9, 81h, 0ECh, 80h, 0, 16h, 1Fh, 60h, 0EAh
db 68h, 20h, 18h, 0, 6Ah, 20h, 1Fh, 67h
db 0C7h, 45h, 20h, 5Ah, 0, 0B9h, 1, 0, 0A1h
db 2Eh, 0, 3Ch, 0Bh, 74h, 3, 80h, 0C9h, 2
db 67h, 89h, 4Dh, 14h, 67h, 88h, 65h, 1Ch
db 0A1h, 50h, 0, 86h, 0E0h, 67h, 89h, 45h
db 18h, 0E9h, 14h, 0F5h, 6Ah, 20h, 1Fh, 80h
db 3Eh, 2Eh, 0, 0Bh, 75h, 0F3h, 0BBh, 0FFh
db 0Fh, 66h, 33h, 0C9h, 67h, 8Bh, 45h, 4
db 3, 0C3h, 67h, 8Bh, 55h, 8, 13h, 0D1h
db 0F6h, 0C6h, 0FCh, 0Fh, 85h, 0F0h, 0, 43h
db 0F7h, 0F3h, 67h, 89h, 45h, 10h, 6Ah, 38h
db 7, 92h, 0C1h, 0EAh, 0Ah, 83h, 0C2h, 2
db 66h, 0Fh, 0B7h, 3Eh, 0AAh, 0, 66h, 0C1h
db 0E7h, 4, 66h, 33h, 0C0h, 81h, 0C7h, 0
db 1, 8Bh, 0CBh, 2Bh, 0CFh, 80h, 0E5h
; START OF FUNCTION CHUNK FOR sub_1A57E

loc_1E916:
xadd    cx, bp
add     ch, [bp+di]
retf    860Fh
; END OF FUNCTION CHUNK FOR sub_1A57E
db 0BEh, 0, 0F2h, 67h, 66h, 0AFh, 8Bh, 0CAh
db 0F3h, 67h, 66h, 0AFh, 75h, 0E4h, 0C1h
db 0E2h, 2, 2Bh, 0FAh, 66h, 57h, 67h, 8Bh
db 4Dh, 10h, 0C1h, 0E1h, 2, 33h, 0DBh, 0B8h
db 1, 5, 0CDh, 31h, 56h, 57h, 66h, 58h, 66h
db 5Fh, 0Fh, 82h, 93h, 0, 66h, 0C1h, 0E0h
db 4, 26h, 67h, 66h, 89h, 47h, 0FCh, 66h
db 57h, 8Bh, 0FBh, 66h, 0C1h, 0E7h, 10h
db 8Bh, 0F9h, 66h, 57h, 67h, 8Bh, 45h, 14h
db 66h, 0C1h, 0E0h, 10h, 67h, 8Bh, 45h, 1Ch
db 80h, 0E4h, 0F0h, 0B0h, 1Fh, 67h, 8Bh
db 4Dh, 10h, 8Bh, 0D1h, 67h, 66h, 0ABh, 67h
db 66h, 5, 0, 10h, 2 dup(0), 0E2h, 0F4h
db 8Bh, 0CAh, 0F7h, 0D9h, 80h, 0E5h, 3, 33h
db 0C0h, 0F3h, 67h, 66h, 0ABh, 66h, 0B8h
db 0, 0F0h, 3Fh, 0, 66h, 5Eh, 66h, 0C1h
db 0EEh, 0Ah, 66h, 81h, 3Eh, 98h, 3 dup(0)
db 4, 0, 77h, 0Ch, 66h, 0Fh, 0B7h, 6, 0AAh
db 0, 0FEh, 0C4h, 66h, 0C1h, 0E0h, 4, 66h
db 3, 0F0h, 66h, 5Fh, 8Bh, 0CAh, 81h, 0C1h
db 0FFh, 3, 0C1h, 0E9h, 0Ah, 8Bh, 0C7h, 0F3h
db 67h, 66h, 26h, 0A5h, 0C1h, 0E0h, 4, 67h
db 89h, 45h, 14h, 67h, 81h, 65h, 1Ch, 0FFh
db 0Fh, 0F8h, 0Fh, 82h, 0FFh, 0F3h, 0E9h
db 1, 0F4h, 0F9h, 0EBh, 0F6h, 6Ah, 20h, 1Fh
db 80h, 3Eh, 2Eh, 0, 0Bh, 75h, 2 dup(67h)
db 66h, 0Fh, 0B7h, 45h, 14h, 3Dh, 0, 10h
db 72h, 5Fh, 0A8h, 3Fh, 75h, 5Bh, 67h, 0F6h
db 45h, 1Dh, 0F0h, 75h, 54h, 66h, 0Fh, 0B7h
db 3Eh, 0AAh, 0, 66h, 0C1h, 0E7h, 4, 0C1h
db 0E8h, 4, 67h, 66h, 8Dh, 7Ch, 38h, 0FCh
db 6Ah, 38h, 7, 26h, 67h, 66h, 8Bh, 7, 0A8h
db 0Fh, 75h, 35h, 26h, 67h, 66h, 81h, 78h
db 4, 0ADh, 0DEh, 0ADh, 0DEh, 75h, 29h, 26h
db 67h, 66h, 0Fh, 0B7h, 48h, 0Ch, 66h, 0C1h
db 0E8h, 4, 66h, 50h, 81h, 0C1h, 0, 2, 0C1h
db 0E9h, 8, 66h, 33h, 0C0h, 0F3h, 67h, 66h
db 0ABh, 5Fh, 5Eh, 0B8h, 2, 5, 0CDh, 31h
db 0Fh, 82h, 88h, 0F3h, 0E9h, 8Ah, 0F3h
db 0F9h, 0EBh, 0F6h, 67h, 8Ah, 45h, 2Dh
db 8Ah, 0E0h, 80h, 0E4h, 0FDh, 67h, 88h
db 65h, 2Dh, 0D0h, 0E8h, 24h, 1, 67h, 88h
db 45h, 20h, 0E9h, 6Fh, 0F3h, 67h, 8Ah, 45h
db 2Dh, 8Ah, 0E0h, 80h, 0CCh, 2, 0EBh, 0E6h
db 67h, 8Ah, 45h, 2Dh, 0EBh, 0E4h, 61h, 2Eh
db 83h, 3Eh, 0DAh, 4Ch, 0, 74h, 3, 0E9h
db 0B0h, 0F1h, 0E9h, 10h, 0CDh, 83h, 0C4h
db 8, 0E8h, 80h, 1, 0C3h, 83h, 0C4h, 8, 0E8h
db 79h, 1, 0C2h, 4, 0, 0CDh, 2, 66h, 0CFh
db 66h, 53h, 1Eh, 8Ch, 0D3h, 66h, 0Fh, 2
db 0DBh, 66h, 0C1h, 0EBh, 17h, 73h, 1, 66h
db 8Bh, 0DCh, 36h, 67h, 66h, 0C5h, 5Bh, 0Ah
db 67h, 8Ah, 1Bh, 80h, 0FBh, 9Bh, 74h, 6
db 80h, 0E3h, 0F8h, 80h, 0FBh, 0D8h, 1Fh
db 66h, 5Bh, 74h, 1, 0C3h, 0E9h, 85h, 0
db 66h, 53h, 8Ch, 0D3h, 66h, 0Fh, 2, 0DBh
db 66h, 0C1h, 0EBh, 17h, 73h, 1, 66h, 8Bh
db 0DCh, 1Eh, 36h, 67h, 66h, 0C5h, 5Bh, 8
db 67h, 80h, 3Bh, 62h, 1Fh, 66h, 5Bh, 74h
db 64h, 0C3h, 8Bh, 16h, 4Ch, 0, 0EBh, 29h
db 1Fh, 5Ah, 58h, 0C3h, 90h, 0F6h, 0C1h
db 0C0h, 74h, 53h, 50h, 8Ah, 0C1h, 52h, 24h
db 1Fh, 0BAh, 18h, 0, 1Eh, 8Eh, 0DAh, 3Ah
db 6, 8, 0, 74h, 0E4h, 0B8h, 20h, 0, 8Eh
db 0D8h, 84h, 0C9h, 78h, 0D5h, 8Bh, 16h
db 4Ah, 0, 0F6h, 6, 82h, 15h, 1, 75h, 0D0h
db 0B0h, 0Bh, 0EEh, 1Fh, 0EBh, 0, 0EBh, 0
db 0ECh, 5Ah, 84h, 0C5h, 58h, 74h, 1Eh, 0C3h
db 81h, 2Eh, 16h, 0Ch, 0, 4, 67h, 83h, 45h
db 24h, 0F3h, 2Eh, 0F6h, 44h, 0FBh, 20h
db 7, 1Fh, 66h, 61h, 74h, 3, 0C2h, 6, 0
db 0C2h, 2, 0, 90h, 0F6h, 0C1h, 20h, 74h
db 2, 66h, 50h, 66h, 60h, 1Eh, 8Ch, 0D3h
db 6, 66h, 0Fh, 2, 0C3h, 66h, 8Bh, 0ECh
db 66h, 0Fh, 0BAh, 0E0h, 16h, 72h, 4, 66h
db 0Fh, 0B7h, 0ECh, 67h, 8Bh, 55h, 26h, 66h
db 83h, 0E1h, 20h, 74h, 13h, 67h, 66h, 87h
db 45h, 24h, 67h, 66h, 87h, 45h, 28h, 67h
db 66h, 87h, 45h, 24h, 67h, 8Bh, 55h, 26h
db 67h, 89h, 55h, 1Ch, 0FCh, 2Eh, 8Bh, 0Eh
db 0DAh, 4Ch, 67h, 8Bh, 75h, 24h, 0E3h, 9Dh
db 8Eh, 0C1h, 6Ah, 20h, 1Fh, 81h, 6, 16h
db 0Ch, 0, 4, 66h, 0Fh, 0B7h, 3Eh, 16h, 0Ch
db 81h, 0FFh, 0, 40h, 77h, 80h, 83h, 0EFh
db 2Eh, 8Dh, 44h, 0F3h, 26h, 89h, 45h, 2Ah
db 26h, 89h, 45h, 28h, 66h, 0Fh, 0B7h, 0C7h
db 67h, 87h, 45h, 4, 0ABh, 46h, 67h, 89h
db 75h, 24h, 83h, 0C6h, 0ECh, 0B9h, 4, 0
db 0F3h, 2Eh, 0A5h, 0B8h, 2Dh, 53h, 66h
db 0ABh, 8Ch, 0C8h, 66h, 0ABh, 0B1h, 4, 67h
db 66h, 8Dh, 75h, 28h, 0F3h, 67h, 66h, 36h
db 0A5h, 67h, 66h, 96h, 66h, 0ABh, 8Ch, 0D0h
db 0ABh, 7, 1Fh, 66h, 61h, 2Eh, 8Eh, 16h
db 0DAh, 4Ch, 66h, 0Fh, 0B7h, 0E7h, 5Fh
db 66h, 0CBh, 0E8h, 6, 0, 66h, 83h, 0C4h
db 6, 66h, 0CFh, 0FAh, 0FCh, 66h, 60h, 6
db 8Bh, 0ECh, 66h, 0C4h, 7Eh, 34h, 66h, 83h
db 0EFh, 18h, 66h, 8Bh, 0C7h, 66h, 87h, 46h
db 2, 67h, 66h, 0ABh, 67h, 90h, 8Bh, 46h
db 3Ch, 8Bh, 46h, 3Ah, 66h, 8Dh, 76h, 22h
db 66h, 0B9h, 4, 3 dup(0), 67h, 36h, 0A5h
db 67h, 0ABh, 0F3h, 67h, 66h, 36h, 0A5h
db 6Ah, 20h, 7, 26h, 81h, 2Eh, 16h, 0Ch
db 0, 4, 7, 66h, 61h, 83h, 0C4h, 16h, 17h
db 66h, 8Bh, 0E7h, 66h, 5Fh, 0C3h, 66h, 43h
db 0EBh, 1Ah, 50h, 66h, 53h, 1Eh, 66h, 55h
db 8Ch, 0D5h, 66h, 0Fh, 2, 0EDh, 66h, 0C1h
db 0EDh, 17h, 73h, 1, 66h, 8Bh, 0ECh, 67h
db 66h, 0C5h, 5Dh, 0Ch, 67h, 8Bh, 3, 3Ch
db 26h, 74h, 0DBh, 3Ch, 36h, 74h, 0D7h, 3Ch
db 2Eh, 74h, 0D3h, 3Ch, 3Eh, 74h, 0CFh, 3Ch
db 64h, 72h, 4, 3Ch, 67h, 76h, 0C7h, 3Dh
db 0DBh, 0E3h, 74h, 25h, 3Dh, 0DFh, 0E0h
db 74h, 20h, 0Ch, 4, 3Ch, 0DDh, 75h, 2Bh
db 8Ah, 0C4h, 80h, 0E4h, 38h, 80h, 0FCh
db 38h, 75h, 21h, 3Ch, 3Eh, 74h, 8, 24h
db 0C0h, 74h, 8, 7Ah, 6, 79h, 2, 66h, 43h
db 66h, 43h, 66h, 43h, 66h, 43h, 67h, 66h
db 89h, 5Dh, 0Ch, 66h, 5Dh, 1Fh, 66h, 5Bh
db 58h, 66h, 0CFh, 66h, 5Dh, 1Fh, 66h, 5Bh
db 58h, 0EAh, 6Dh, 20h, 18h, 0, 56h, 57h
db 1Eh, 0B8h, 6, 0, 8Ch, 0CBh, 0CDh, 31h
db 40h, 0BBh, 60h, 0, 0CDh, 31h, 0A1h, 50h
db 0, 8Eh, 0DBh, 93h, 0BEh, 0C1h, 43h, 0BFh
db 0E5h, 41h, 33h, 0C9h, 0ACh, 92h, 8Ah
db 0F2h, 80h, 0E2h, 20h, 0B8h, 0B7h, 51h
db 75h, 3, 0B8h, 0B0h, 51h, 89h, 5, 0C7h
db 45h, 2, 2 dup(0), 8Ch, 4Dh, 4, 0B4h, 40h
db 8Ah, 0C1h, 2Ah, 0C3h, 3Ch, 8, 72h, 8
db 8Ah, 0C1h, 2Ah
db 0C7h, 0D0h, 0E4h, 75h, 0F4h, 0Ah, 0D4h
db 0Ah, 0D1h, 88h, 55h, 0Eh, 80h, 0F9h, 8
db 72h, 17h, 80h, 0F9h, 0Fh, 74h, 12h, 84h
db 0E4h, 0B8h, 20h, 52h, 75h, 3, 0B8h, 78h
db 52h, 2Bh, 0C7h, 2Dh, 13h, 0, 89h, 45h
db 11h, 6Bh, 0C1h, 4, 0F6h, 0C6h, 1, 0Fh
db 85h, 14h, 0, 0F6h, 0C6h, 2, 0Fh, 84h
db 5, 0, 0ADh, 92h, 0ADh, 0EBh, 0Dh, 5, 3Ch
db 0Ch, 0BAh, 18h, 0, 0EBh, 2 dup(5), 2 dup(0)
db 8Ch, 0CAh, 89h, 45h, 16h, 0C7h, 45h, 18h
db 2 dup(0), 89h, 55h, 1Ah, 41h, 83h, 0C7h
db 1Ch, 83h, 0F9h, 10h, 0Fh, 86h, 79h, 0FFh
db 1Eh, 7, 1Fh, 0F6h, 6, 47h, 0, 1, 74h
db 17h, 0BFh, 0ACh, 43h, 0B8h, 0C0h, 51h
db 0ABh, 0B8h, 70h, 0, 0ABh, 0BFh, 0B6h
db 43h, 0B8h, 0Ch, 0Eh, 0ABh, 0B8h, 62h
db 1Ah, 0EBh, 8, 80h, 0FFh, 10h, 75h, 0Dh
db 0B8h, 50h, 7Dh, 0BFh, 0BBh, 43h, 0ABh
db 2 dup(47h), 0B8h, 70h, 0, 0ABh, 5Fh, 5Eh
db 0EAh, 79h, 20h, 18h, 0
word_1EDC0 dw 20h
call    sub_1D3ED
add     sp, 6
pop     cx
sub     sp, 4
push    word ptr ds:0C24h
push    cx
retf
db 6, 1Eh, 60h, 6Ah, 0, 6Ah, 0, 8Bh, 0ECh
db 16h, 55h, 16h, 55h, 8Bh, 5Eh, 18h, 2Eh
db 8Ah, 7, 32h, 0E4h, 50h, 2Eh, 8Eh, 1Eh
db 0E0h, 54h, 0FFh, 1Eh, 22h, 0, 83h, 0C4h
db 0Eh, 89h, 46h, 20h, 61h, 1Fh, 7, 2 dup(44h)
db 66h, 0CFh, 9Ch, 83h, 0ECh, 8, 55h, 53h
db 50h, 1Eh, 8Bh, 0ECh, 8Bh, 5Eh, 12h, 8Bh
db 46h, 10h, 89h, 46h, 12h, 89h, 46h, 0Ch
db 8Ch, 4Eh, 10h, 0C7h, 46h, 0Eh, 52h, 55h
db 2Eh, 8Eh, 1Eh, 0E0h, 54h, 8Bh, 47h, 3
db 89h, 46h, 0Ah, 8Bh, 47h, 1, 89h, 46h
db 8, 1Fh, 58h, 5Bh, 5Dh, 0CFh, 66h, 0CFh
push    bp
mov     bp, sp
mov     bx, [bp+6]
mov     cx, [bp+4]
pop     bp
mov     ax, 501h
push    esi
push    edi
int     31h             ; DPMI Services   ax=func xxxxh
                        ; ALLOCATE MEMORY BLOCK
                        ; BX:CX = size in bytes
                        ; Return: CF set on error
                        ; CF clear if successful
mov     ds:1202h, di
mov     ds:1204h, si
pop     edi
pop     esi
jb      short loc_1EE59
mov     dx, bx
xchg    ax, cx
retn

loc_1EE59:
xor     ax, ax
cwd
retn
push    edi
xor     edi, edi
sub     sp, 30h
mov     di, sp
push    ss
pop     es
assume es:nothing
mov     ax, 500h
int     31h             ; DPMI Services   ax=func xxxxh
                        ; GET FREE MEMORY INFORMATION
                        ; ES:DI / ES:EDI -> buffer for memory information
                        ; Return: CF clear
mov     cx, ss:[di+8]
mov     ax, ss:[di]
mov     dx, ss:[di+2]
add     sp, 30h
pop     edi
jb      short loc_1EE59
mov     ds:11DEh, cx
retn
align 10h



sub_1EE90 proc far
push    cx
mov     cx, ds:0DEEh
dec     cx
jnz     short loc_1EEDB
mov     ax, 0DE04h

loc_1EE9B:
call    large [fword ptr ds:0D5Ah]
cli
or      ah, ah
mov     ax, 0
jnz     short loc_1EED9

loc_1EEA8:
cmp     edi, ebx
jnb     short loc_1EED9
test    byte ptr es:[edi+1], 8
jz      short loc_1EEBB
add     edi, 4
jmp     short loc_1EEA8

loc_1EEBB:
xchg    eax, edx
mov     edx, 1000h
or      ax, 807h

loc_1EEC6:
stos    dword ptr es:[edi]
db      67h
add     eax, edx
inc     word ptr ds:0DF6h
add     ds:0AA8h, edx
dec     cx
jns     short loc_1EEC6

loc_1EED9:
pop     cx
retf

loc_1EEDB:
mov     ax, 0DF00h
jmp     short loc_1EE9B
sub_1EE90 endp

; START OF FUNCTION CHUNK FOR sub_1EEF8

loc_1EEE0:
test    byte ptr ds:1582h, 1
jnz     loc_1EF71
push    cs
call    near ptr sub_1EE90
or      ax, ax
jz      loc_1EF6E
pop     ax
inc     ax
push    ax
jmp     short loc_1EF5B
; END OF FUNCTION CHUNK FOR sub_1EEF8



sub_1EEF8 proc far

; FUNCTION CHUNK AT 5600 SIZE 00000018 BYTES

pop     ax
push    cs
push    ax
push    bp
mov     bp, sp
pushad
push    fs
push    gs
push    0
call    far ptr 18h:2AD7h
mov     edi, [bp+6]
shr     edi, 6
add     edi, esi
mov     ecx, [bp+0Ah]
shr     ecx, 6
add     ecx, esi
mov     ebx, ds:9Ch
movsx   eax, word ptr ds:0DF0h
not     eax
add     ebx, eax
and     bx, ds:0DF0h
shr     ebx, 6
add     ebx, esi
cmp     ecx, ebx
jnb     short loc_1EF71
mov     ax, 0FFFCh
and     di, ax
and     cx, ax

loc_1EF49:
mov     ax, es:[edi]
and     ax, ds:0DF2h
cmp     ax, ds:0DF2h
jnz     short loc_1EEE0
add     edi, 4

loc_1EF5B:
cmp     edi, ecx
jbe     short loc_1EF49
call    sub_1EF76

loc_1EF63:
pop     word ptr [bp-4]
pop     gs
pop     fs
popad
pop     bp
retf

loc_1EF6E:
call    sub_1EF76

loc_1EF71:
pop     ax
push    0FFFFh
jmp     short loc_1EF63
sub_1EEF8 endp




sub_1EF76 proc near
sub     edi, esi
shl     edi, 6
movzx   eax, word ptr ds:0A2h
shl     eax, 4
movzx   ebx, word ptr ds:0A0h
lea     ebx, [eax+ebx+14h]
mov     esi, es:[ebx]
mov     eax, ds:0ACh
cmp     eax, esi
ja      short loc_1EFA3
xchg    eax, esi

loc_1EFA3:
cmp     eax, edi
ja      short loc_1EFAA
xchg    eax, edi

loc_1EFAA:
mov     es:[ebx], eax
mov     ds:0ACh, eax
retn
sub_1EF76 endp



; Attributes: noreturn

sub_1EFB4 proc near
pop     ax
push    cs
push    ax
jmp     far ptr 18h:2B33h
sub_1EFB4 endp




sub_1EFBC proc near
mov     al, ds:1582h
and     al, 1
cbw
retn
sub_1EFBC endp




sub_1EFC3 proc near
pushad
mov     bp, sp
push    38h ; '8'
pop     es
assume es:nothing
movzx   ebx, word ptr ds:0AAh
shl     ebx, 4
mov     esi, 3FF000h
cmp     byte ptr ds:0DFFh, 0
jnz     short loc_1EFEB
mov     esi, ebx
add     esi, 1000h

loc_1EFEB:
mov     edi, ds:0ACh
inc     edi
shr     edi, 6
mov     ecx, [bp+26h]
shr     ecx, 0Ah
add     cx, di
mov     eax, [bp+22h]
add     eax, 1000h
dec     eax
and     ax, 0F000h
or      ax, 0C07h

loc_1F012:
cmp     di, cx
jnb     short loc_1F05B
mov     edx, edi
shr     edx, 0Ch
test    byte ptr es:[ebx+edx*4], 1
jnz     short loc_1F041
sub     cx, 4
mov     es:[ebx+edx*4], eax
cmp     byte ptr ds:0DFFh, 0
jz      short loc_1F053
mov     es:[esi+edx*4+0FFCh], eax
jmp     short loc_1F053

loc_1F041:
mov     es:[esi+edi], eax
add     di, 4
add     dword ptr ds:0AA8h, 1000h

loc_1F053:
add     eax, 1000h
jmp     short loc_1F012

loc_1F05B:
shl     edi, 6
xchg    edi, ds:0ACh
shl     edi, 4
mov     [bp+1Ch], di
shr     edi, 10h
mov     [bp+14h], di
popad
retn
sub_1EFC3 endp




sub_1F075 proc near
xor     cx, cx
mov     ch, ds:0E00h
jcxz    short loc_1F094
cmp     ds:0DFFh, cl
jz      short loc_1F086
mov     cx, 0FFF8h

loc_1F086:
push    eax
mov     eax, ds:0ACh
shr     eax, 6
sub     cx, ax
pop     eax

loc_1F094:
xchg    ax, cx
retn
sub_1F075 endp

align 10h
call    sub_19CE0
db 67h
seg003 ends


; Segment type: Zero-length
seg004 segment byte public '' use16
seg004 ends


end start
