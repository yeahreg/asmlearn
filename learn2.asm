.686p
.mmx
.model large


; Segment type: Pure code
seg000 segment byte public 'CODE' use16
assume cs:seg000
assume es:nothing, ss:seg092, ds:nothing, fs:nothing, gs:nothing


; Attributes: noreturn

public start
start proc near
mov     dx, seg seg091
mov     es, dx
assume es:seg091
mov     di, sp
mov     es:word_4B8CE, ds
mov     bx, ss
add     bx, 1F4h
mov     es:word_4B8B4, bx
mov     es:word_4B8BC, bx
mov     ax, bx
mov     cx, ds:2
mov     es:word_4B8B8, cx
mov     es:word_4B8C0, cx
sub     cx, ax
shr     cx, 1
add     cx, bx
mov     es:word_4B8C4, cx
mov     es:word_4B8C8, cx
mov     es:word_4B8CA, ds
mov     cx, ds:2Ch
mov     es:word_4B8CC, cx
mov     ch, 0
mov     si, 81h
mov     cl, ds:80h
mov     ax, cx
sub     di, cx
dec     di
and     di, 0FFFEh
mov     sp, di
push    ss
pop     es
assume es:seg092
cld
rep movsb
mov     bp, di
mov     ds, dx
assume ds:seg091
mov     es, dx
assume es:seg091
push    ax
xor     ax, ax
mov     cx, 0C204h
mov     di, 822Eh
sub     cx, di
rep stosb
pop     cx
mov     bx, 1
push    ax
push    ax
mov     [bp+0], al
jcxz    short loc_100A1

loc_10080:
dec     bp
cmp     byte ptr [bp+0], 20h ; ' '
jz      short loc_10091
cmp     byte ptr [bp+0], 9
jz      short loc_10091
mov     ah, 1
jmp     short loc_1009F

loc_10091:
or      ah, ah
mov     [bp+0], al
jz      short loc_1009F
inc     bp
push    ss
push    bp
dec     bp
inc     bx
xor     ax, ax

loc_1009F:
loop    loc_10080

loc_100A1:
or      ah, ah
jz      short loc_100A8
inc     bx
push    ss
push    bp

loc_100A8:
push    ss
push    bp
push    bx
mov     ah, 30h
int     21h             ; DOS - GET DOS VERSION
                        ; Return: AL = major version number (00h for DOS 1.x)
pop     bx
cmp     al, 3
jb      short loc_100CE
pop     ax
pop     ax
mov     es, word_4B8CC
assume es:nothing
xor     ax, ax
mov     di, ax
mov     cx, ax
dec     cx

loc_100C1:
repne scasb
inc     di
cmp     es:[di-1], al
jnz     short loc_100C1
inc     di
inc     di
push    es
push    di

loc_100CE:
mov     ax, sp
push    ss
push    ax
push    bx
mov     ax, ss
mov     bx, ds
sub     ax, bx
mov     cl, 4
shl     ax, cl
mov     bx, ds
cli
mov     ss, bx
assume ss:seg091
add     sp, ax
sti
call    sub_1D6CF
push    ax
push    ax
push    ax
start endp ; sp-analysis failed



; Attributes: noreturn bp-based frame

sub_100ED proc near

arg_2= byte ptr  4

mov     bp, sp
mov     al, [bp+arg_2]
mov     ah, 4Ch
int     21h             ; DOS - 2+ - QUIT WITH EXIT CODE (EXIT)
sub_100ED endp          ; AL = exit code

sti
push    bx
push    bp
mov     bp, sp
push    es
mov     bx, [bp+4]
xchg    bx, [bp+6]
xchg    bx, [bp+8]
xchg    bx, [bp+2]
mov     [bp+4], bx
les     bx, [bp+6]
inc     word ptr [bp+6]
mov     bl, es:[bx]
mov     bh, 0
shl     bx, 1
neg     bx
mov     bx, cs:[bx+224h]
xchg    bx, [bp+4]
pop     es
pop     bp
popf
retn
db 100h dup(90h)


; Attributes: bp-based frame

sub_10226 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    bx
push    cx
push    dx
push    si
push    di
push    ds
push    es
int     11h             ; EQUIPMENT DETERMINATION
                        ; Return: AX = equipment flag bits
and     ax, 0C1h
cmp     ax, 1
jnz     short loc_10280
mov     ax, [bp+arg_0]
or      al, al
jz      short loc_10280
cmp     ah, 3Ah ; ':'
jz      short loc_1024F
mov     ah, 19h
call    sub_10BD7
jmp     short loc_10253

loc_1024F:
and     al, 0DFh
sub     al, 41h ; 'A'

loc_10253:
cmp     al, 1
ja      short loc_10280
xor     si, si
mov     es, si
assume es:nothing
mov     ah, es:504h
cmp     ah, al
jz      short loc_10280
push    es
push    ax
push    ax
mov     ax, seg seg091
mov     ds, ax
call    sub_16A32
or      ax, ax
pop     ax
pop     es
assume es:nothing
jz      short loc_1027D
mov     es:504h, al
jmp     short loc_10280

loc_1027D:
stc
jmp     short loc_10281

loc_10280:
clc

loc_10281:
pop     es
pop     ds
assume ds:nothing
pop     di
pop     si
pop     dx
pop     cx
pop     bx
pop     bp
retn    2
sub_10226 endp




sub_1028C proc near
mov     ax, 4400h
call    sub_10BD7
test    dl, 80h
jnz     short loc_102A7
and     dl, 3Fh
add     dl, 41h ; 'A'
mov     dh, 3Ah ; ':'
push    dx
call    sub_10226
jmp     short locret_102A8

loc_102A7:
clc

locret_102A8:
retn
sub_1028C endp




sub_102A9 proc near
call    sub_10BD7
jb      short locret_102DC
push    ax
push    bx
push    dx
mov     bx, ax
mov     ax, 4400h
call    sub_10BD7
test    dl, 80h
jz      short loc_102D8
test    dx, 0Bh
jz      short loc_102D8
mov     ah, 3Eh ; '>'
call    sub_10BD7
pop     dx
pop     bx
pop     ax
mov     ax, 5
stc
jmp     short locret_102DC

loc_102D8:
pop     dx
pop     bx
pop     ax
clc

locret_102DC:
retn
sub_102A9 endp




sub_102DD proc near
mov     ah, 3Eh ; '>'
call    sub_10BD7
retn
sub_102DD endp



; Attributes: bp-based frame

sub_102E5 proc near

arg_0= dword ptr  4
arg_4= dword ptr  8
arg_8= word ptr  0Ch
arg_A= dword ptr  0Eh

push    bp
mov     bp, sp
push    si
push    di
push    ds
push    ds
lds     bx, [bp+arg_A]
push    word ptr [bx]
call    sub_10226
jb      short loc_10301
mov     dx, bx
mov     ax, 3D00h
call    sub_102A9
pop     ds
jnb     short loc_10306

loc_10301:
mov     ax, 1
jmp     short loc_1032B

loc_10306:
mov     bx, ax
mov     cx, [bp+arg_8]
push    ds
lds     dx, [bp+arg_0]
mov     ah, 3Fh ; '?'
call    sub_1F059
pop     ds
jnb     short loc_10321
call    sub_102DD
mov     ax, 2
jmp     short loc_1032B

loc_10321:
lds     di, [bp+arg_4]
mov     [di], ax
call    sub_102DD
xor     ax, ax

loc_1032B:
pop     ds
pop     di
pop     si
pop     bp
retn    0Eh
sub_102E5 endp ; sp-analysis failed



; Attributes: bp-based frame

sub_10332 proc near

arg_0= dword ptr  4
arg_4= word ptr  8
arg_6= dword ptr  0Ah

push    bp
mov     bp, sp
push    si
push    di
push    ds
push    ds
lds     bx, [bp+arg_6]
push    word ptr [bx]
call    sub_10226
jb      short loc_1034F
mov     dx, bx
xor     cx, cx
mov     ah, 3Ch ; '<'
call    sub_102A9
pop     ds
jnb     short loc_10354

loc_1034F:
mov     ax, 1
jmp     short loc_1038D

loc_10354:
mov     bx, ax
mov     cx, [bp+arg_4]
lds     dx, [bp+arg_0]
mov     ah, 40h ; '@'
call    sub_1F059
jb      short loc_10379
sub     cx, ax
jz      short loc_10381
dec     cx
jnz     short loc_10379
mov     ax, 4400h
call    sub_10BD7
test    dl, 80h
jnz     short loc_10381

loc_10379:
call    sub_102DD
mov     ax, 2
jmp     short loc_1038D

loc_10381:
call    sub_102DD
jnb     short loc_1038B
mov     ax, 3
jmp     short loc_1038D

loc_1038B:
xor     ax, ax

loc_1038D:
pop     ds
pop     di
pop     si
pop     bp
retn    0Ah
sub_10332 endp ; sp-analysis failed



; Attributes: bp-based frame

sub_10394 proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
push    si
push    di
push    ds
lds     bx, [bp+arg_0]
push    word ptr [bx]
call    sub_10226
jb      short loc_103AF
mov     dx, bx
mov     ah, 41h ; 'A'
call    sub_10BD7
jnb     short loc_103B4

loc_103AF:
mov     ax, 1
jmp     short loc_103B6

loc_103B4:
xor     ax, ax

loc_103B6:
pop     ds
pop     di
pop     si
pop     bp
retn    4
sub_10394 endp



; Attributes: bp-based frame

sub_103BD proc near

arg_0= dword ptr  4
arg_4= dword ptr  8

push    bp
mov     bp, sp
push    si
push    di
push    ds
lds     dx, [bp+arg_0]
les     di, [bp+arg_4]
push    word ptr es:[di]
call    sub_10226
jb      short loc_103DA
mov     ah, 56h ; 'V'
call    sub_10BD7
jnb     short loc_103DF

loc_103DA:
mov     ax, 1
jmp     short loc_103E1

loc_103DF:
xor     ax, ax

loc_103E1:
pop     ds
pop     di
pop     si
pop     bp
retn    8
sub_103BD endp



; Attributes: bp-based frame

sub_103E8 proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
push    si
push    di
push    ds
lds     bx, [bp+arg_0]
push    word ptr [bx]
call    sub_10226
jb      short loc_10404
mov     dx, bx
mov     ax, 4300h
call    sub_10BD7
jnb     short loc_10408

loc_10404:
xor     ax, ax
jmp     short loc_1040A

loc_10408:
mov     ax, cx

loc_1040A:
pop     ds
pop     di
pop     si
pop     bp
retn    4
sub_103E8 endp



; Attributes: bp-based frame

sub_10411 proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
push    si
push    di
push    ds
mov     ah, 2Fh ; '/'
call    sub_10BD7
mov     ax, bx
push    ds
lds     bx, [bp+arg_0]
mov     [bx], ax
mov     word ptr [bx+2], es
pop     ds
pop     ds
pop     di
pop     si
pop     bp
retn    4
sub_10411 endp



; Attributes: bp-based frame

sub_10431 proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
push    si
push    di
push    ds
push    ds
lds     dx, [bp+arg_0]
mov     ah, 1Ah
call    sub_10BD7
pop     ds
pop     ds
pop     di
pop     si
pop     bp
retn    4
sub_10431 endp



; Attributes: bp-based frame

sub_1044A proc near

arg_0= byte ptr  4

push    bp
mov     bp, sp
push    si
push    di
push    ds
mov     dl, [bp+arg_0]
cmp     dl, 61h ; 'a'
jb      short loc_1045B
sub     dl, 20h ; ' '

loc_1045B:
mov     dh, 3Ah ; ':'
cmp     dl, 41h ; 'A'
jb      short loc_10486
mov     ah, 1Ch
push    dx
sub     dl, 40h ; '@'
call    sub_10BD7
pop     dx
cmp     al, 0FFh
jz      short loc_10486
push    dx
call    sub_10226
jb      short loc_10486
sub     dl, 41h ; 'A'
mov     ah, 0Eh
call    sub_10BD7
xor     ax, ax
jmp     short loc_10489

loc_10486:
mov     ax, 0FFF1h

loc_10489:
pop     ds
pop     di
pop     si
pop     bp
retn    2
sub_1044A endp




sub_10490 proc near
push    si
push    di
push    ds
mov     ah, 19h
call    sub_10BD7
add     al, 41h ; 'A'
pop     ds
pop     di
pop     si
retn
sub_10490 endp




sub_104A0 proc near
push    di
push    ds
pop     es
mov     di, ax
cld
xor     al, al
mov     cx, 0FFFFh
repne scasb
dec     di
mov     ax, di
pop     di
retn
sub_104A0 endp




sub_104B2 proc near
cmp     al, 5Ch ; '\'
jz      short locret_104B8
cmp     al, 2Fh ; '/'

locret_104B8:
retn
sub_104B2 endp



; Attributes: bp-based frame

sub_104B9 proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
push    si
push    di
push    ds
lds     ax, [bp+arg_0]
push    ax
call    sub_104A0
pop     dx
dec     ax
mov     di, ax
cmp     di, dx
jbe     short loc_104DB
mov     al, [di]
call    sub_104B2
jnz     short loc_104DB
cmp     byte ptr [di-1], 3Ah ; ':'
jnz     short loc_104DC

loc_104DB:
inc     di

loc_104DC:
mov     cl, [di]
mov     byte ptr [di], 0
mov     bx, dx
push    word ptr [bx]
call    sub_10226
mov     ax, 1
jb      short loc_104FA
mov     ah, 3Bh ; ';'
call    sub_10BD7
jb      short loc_104FA
xor     ax, ax
jmp     short loc_104FC

loc_104FA:
neg     ax

loc_104FC:
mov     [di], cl
pop     ds
pop     di
pop     si
pop     bp
retn    4
sub_104B9 endp



; Attributes: bp-based frame

sub_10505 proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
push    si
push    di
push    ds
lds     bx, [bp+arg_0]

loc_1050E:
mov     al, [bx]
or      al, al
jz      short loc_1052D
call    sub_104B2
jnz     short loc_1051E
mov     al, ds:226Eh
jmp     short loc_10528

loc_1051E:
cmp     al, 61h ; 'a'
jb      short loc_1052A
cmp     al, 7Ah ; 'z'
ja      short loc_1052A
sub     al, 20h ; ' '

loc_10528:
mov     [bx], al

loc_1052A:
inc     bx
jmp     short loc_1050E

loc_1052D:
pop     ds
pop     di
pop     si
pop     bp
retn    4
sub_10505 endp



; Attributes: bp-based frame

sub_10534 proc near

arg_0= dword ptr  4
arg_4= byte ptr  8

push    bp
mov     bp, sp
push    si
push    di
push    ds
les     di, [bp+arg_0]
mov     byte ptr es:[di], 0
mov     al, [bp+arg_4]
or      al, al
jnz     short loc_10551
mov     ah, 19h
call    sub_10BD7
add     al, 41h ; 'A'

loc_10551:
mov     dl, al
mov     ah, 3Ah ; ':'
push    ax
call    sub_10226
mov     ax, 1
jb      short loc_105B2
lea     si, ds:8BA8h
cmp     dl, ds:8BE8h
jz      short loc_1057A
mov     ds:8BE8h, dl
push    dx
sub     dl, 40h ; '@'
mov     ah, 47h ; 'G'
call    sub_10BD7
pop     dx
jb      short loc_105B2

loc_1057A:
add     di, 3
push    di
cld

loc_1057F:
lodsb
stosb
or      al, al
jz      short loc_10587
jmp     short loc_1057F

loc_10587:
pop     di
sub     di, 3
mov     [di], dl
mov     word ptr [di+1], 5C3Ah
push    ds
push    di
call    sub_10505
mov     ax, di
call    sub_104A0
mov     di, ax
mov     al, [di-1]
call    sub_104B2
mov     ax, 0
jz      short loc_105B4
mov     al, ds:226Eh
mov     ah, 0
mov     [di], ax
jmp     short loc_105B4

loc_105B2:
neg     ax

loc_105B4:
pop     ds
pop     di
pop     si
pop     bp
retn    6
sub_10534 endp



; Attributes: bp-based frame

sub_105BB proc near

arg_0= word ptr  4
arg_2= byte ptr  6
arg_4= dword ptr  8

push    bp
mov     bp, sp
push    si
push    di
push    ds
lds     bx, [bp+arg_4]
mov     ah, [bp+arg_2]
or      ah, ah
jnz     short loc_105D5
push    word ptr [bx]
call    sub_10226
mov     ax, 1
jb      short loc_105E8

loc_105D5:
mov     dx, bx
mov     cx, [bp+arg_0]
add     ah, 4Eh ; 'N'
call    sub_10BD7
jb      short loc_105E8
xor     ax, ax
jmp     short loc_105EA

loc_105E8:
neg     ax

loc_105EA:
pop     ds
pop     di
pop     si
pop     bp
retn    8
sub_105BB endp



; Attributes: bp-based frame

sub_105F1 proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
push    si
push    di
push    ds
xor     ax, ax
mov     ds:378h, ax
mov     ds:37Ah, ax
lds     bx, [bp+arg_0]
push    word ptr [bx]
call    sub_10226
jb      short loc_10649
mov     dx, bx
mov     ax, 3D00h
call    sub_102A9
jb      short loc_10649
mov     bx, ax
mov     ax, 4400h
call    sub_10BD7
test    dl, 80h
jz      short loc_10627
call    sub_102DD
jmp     short loc_10649

loc_10627:
mov     ax, seg seg091
mov     ds, ax
assume ds:seg091
mov     ax, 4202h
xor     cx, cx
xor     dx, dx
call    sub_10BD7
jb      short loc_10641
mov     word_4BC28, ax
mov     word_4BC2A, dx

loc_10641:
call    sub_102DD
mov     ax, 1
jmp     short loc_1064B

loc_10649:
xor     ax, ax

loc_1064B:
pop     ds
assume ds:nothing
pop     di
pop     si
pop     bp
retn    4
sub_105F1 endp




sub_10652 proc near
sub     sp, 44h
push    bp
mov     bp, sp
push    si
push    di
push    ds
lds     bx, [bp+48h]
push    word ptr [bx]
call    sub_10226
jb      short loc_106DA
mov     ax, [bx]
cmp     ah, 3Ah ; ':'
jz      short loc_10677
mov     ah, 19h
call    sub_10BD7
add     al, 41h ; 'A'
mov     ah, 3Ah ; ':'

loc_10677:
push    ss
pop     ds
assume ds:seg091
mov     [bp+2], ax
mov     byte ptr [bp+4], 5Ch ; '\'
lea     si, [bp+5]
mov     dl, al
sub     dl, 40h ; '@'
mov     ah, 47h ; 'G'
call    sub_10BD7
jb      short loc_106DA
lds     dx, [bp+48h]
assume ds:nothing
mov     ax, dx
call    sub_104A0
dec     ax
mov     bx, ax
cmp     byte ptr [bx], 3Ah ; ':'
jz      short loc_106D5
mov     al, [bx]
call    sub_104B2
jnz     short loc_106B2
cmp     bx, dx
jz      short loc_106D5
cmp     byte ptr [bx-1], 3Ah ; ':'
jz      short loc_106D5

loc_106B2:
push    word ptr [bx]
mov     al, [bx]
call    sub_104B2
jnz     short loc_106BE
mov     byte ptr [bx], 0

loc_106BE:
mov     ah, 3Bh ; ';'
call    sub_10BD7
pop     word ptr [bx]
jb      short loc_106DA
push    ss
pop     ds
assume ds:seg091
lea     dx, [bp+2]
mov     ah, 3Bh ; ';'
call    sub_10BD7

loc_106D5:
mov     ax, 1
jmp     short loc_106DC

loc_106DA:
xor     ax, ax

loc_106DC:
pop     ds
assume ds:nothing
pop     di
pop     si
pop     bp
add     sp, 44h
retn    4
sub_10652 endp



; Attributes: bp-based frame

sub_106E6 proc near

arg_0= byte ptr  4
arg_2= dword ptr  6

push    bp
mov     bp, sp
push    si
push    di
push    ds
lds     bx, [bp+arg_2]
push    word ptr [bx]
call    sub_10226
mov     ax, 1
jb      short loc_1071F
mov     dx, bx
mov     al, [bp+arg_0]
cmp     al, 3
jz      short loc_1070E
mov     ah, 3Dh ; '='
call    sub_102A9
jnb     short loc_10721
cmp     ax, 2
jnz     short loc_1071F

loc_1070E:
cmp     [bp+arg_0], 0
jz      short loc_1071F
xor     cx, cx
mov     ah, 3Ch ; '<'
call    sub_10BD7
jnb     short loc_10721

loc_1071F:
neg     ax

loc_10721:
pop     ds
pop     di
pop     si
pop     bp
retn    6
sub_106E6 endp



; Attributes: bp-based frame

sub_10728 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
push    ds
mov     bx, [bp+arg_0]
call    sub_1028C
jb      short loc_10739
call    sub_102DD

loc_10739:
pop     ds
pop     di
pop     si
pop     bp
retn    2
sub_10728 endp



; Attributes: bp-based frame

sub_10740 proc near

arg_0= word ptr  4
arg_2= dword ptr  6
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
push    si
push    di
push    ds
mov     bx, [bp+arg_6]
call    sub_1028C
mov     ax, 0FFFBh
jb      short loc_10762
mov     cx, [bp+arg_0]
lds     dx, [bp+arg_2]
mov     ah, 3Fh ; '?'
call    sub_1F059
jnb     short loc_10762
neg     ax

loc_10762:
pop     ds
pop     di
pop     si
pop     bp
retn    8
sub_10740 endp



; Attributes: bp-based frame

sub_10769 proc near

arg_0= word ptr  4
arg_2= dword ptr  6
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
push    si
push    di
push    ds
mov     bx, [bp+arg_6]
call    sub_1028C
mov     ax, 0FFFBh
jb      short loc_1078B
mov     cx, [bp+arg_0]
lds     dx, [bp+arg_2]
mov     ah, 40h ; '@'
call    sub_1F059
jnb     short loc_1078B
neg     ax

loc_1078B:
pop     ds
pop     di
pop     si
pop     bp
retn    8
sub_10769 endp



; Attributes: bp-based frame

sub_10792 proc near

arg_0= byte ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
push    si
push    di
push    ds
mov     bx, [bp+arg_6]
call    sub_1028C
jb      short loc_107B0
mov     dx, [bp+arg_2]
mov     cx, [bp+arg_4]
mov     al, [bp+arg_0]
mov     ah, 42h ; 'B'
call    sub_10BD7

loc_107B0:
pop     ds
pop     di
pop     si
pop     bp
retn    8
sub_10792 endp




sub_107B7 proc near
mov     ah, 0
mov     al, ds:37Ch
retn
sub_107B7 endp




sub_107BD proc near
int     28h             ; DOS 2+ internal - KEYBOARD BUSY LOOP
mov     ah, 2
int     16h             ; KEYBOARD - GET SHIFT STATUS
                        ; AL = shift status bits
xor     ah, ah
and     al, 7Fh
test    al, 3
jz      short locret_107CD
or      al, 3

locret_107CD:
retn
sub_107BD endp




sub_107CE proc near
mov     ah, 2
int     16h             ; KEYBOARD - GET SHIFT STATUS
                        ; AL = shift status bits
retn
sub_107CE endp




sub_107D3 proc near
int     28h             ; DOS 2+ internal - KEYBOARD BUSY LOOP
mov     ah, 1
int     16h             ; KEYBOARD - CHECK BUFFER, DO NOT CLEAR
                        ; Return: ZF clear if character in buffer
                        ; AH = scan code, AL = character
                        ; ZF set if no character in buffer
jz      short loc_107E4
or      ax, ax
jnz     short locret_107E6
mov     ax, 0FFFFh
jmp     short locret_107E6

loc_107E4:
xor     ax, ax

locret_107E6:
retn
sub_107D3 endp




sub_107E7 proc near
push    ds
mov     ax, seg seg091
mov     ds, ax
assume ds:seg091
call    sub_107D3
or      ax, ax
jz      short loc_107FC
mov     byte_4BC31, 0
jmp     loc_108CB

loc_107FC:
call    sub_107BD
xor     al, byte_4BC2C
jnz     short loc_1080D
mov     byte_4BC31, 0
jmp     loc_108CB

loc_1080D:
test    al, 10h
jz      short loc_1081C
mov     ax, 4600h
mov     byte_4BC31, 10h
jmp     loc_108CB

loc_1081C:
test    al, 20h
jz      short loc_1082B
mov     ax, 4500h
mov     byte_4BC31, 20h ; ' '
jmp     loc_108CB

loc_1082B:
test    al, 40h
jz      short loc_1083A
mov     ax, 3A00h
mov     byte_4BC31, 40h ; '@'
jmp     loc_108CB

loc_1083A:
test    al, 8
jz      short loc_10868
test    byte_4BC2C, 8
jnz     short loc_1085E
cmp     byte_4BC31, 8
jz      short loc_10856
call    sub_108CD
mov     word_4BC2D, ax
mov     word_4BC2F, dx

loc_10856:
call    sub_108DB
mov     ax, 0
jb      short loc_10861

loc_1085E:
mov     ax, 3800h

loc_10861:
mov     byte_4BC31, 8
jmp     short loc_108CB

loc_10868:
test    al, 4
jz      short loc_10896
test    byte_4BC2C, 4
jnz     short loc_1088C
cmp     byte_4BC31, 4
jz      short loc_10884
call    sub_108CD
mov     word_4BC2D, ax
mov     word_4BC2F, dx

loc_10884:
call    sub_108DB
mov     ax, 0
jb      short loc_1088F

loc_1088C:
mov     ax, 1D00h

loc_1088F:
mov     byte_4BC31, 4
jmp     short loc_108CB

loc_10896:
test    al, 3
jz      short loc_108C5
test    byte_4BC2C, 3
jnz     short loc_108BA
cmp     byte_4BC31, 3
jz      short loc_108B2
call    sub_108CD
mov     word_4BC2D, ax
mov     word_4BC2F, dx

loc_108B2:
call    sub_108DB
mov     ax, 0
jb      short loc_108BD

loc_108BA:
mov     ax, 2A00h

loc_108BD:
mov     byte_4BC31, 3
jmp     short loc_108CB
db 90h

loc_108C5:
xor     byte_4BC2C, al
xor     ax, ax

loc_108CB:
pop     ds
assume ds:nothing
retn
sub_107E7 endp




sub_108CD proc near
push    ds
xor     ax, ax
mov     ds, ax
assume ds:nothing
mov     ax, ds:46Ch
mov     dx, ds:46Eh
pop     ds
assume ds:nothing
retn
sub_108CD endp




sub_108DB proc near
call    sub_108CD
cmp     dx, ds:37Fh
jnb     short loc_108EC
mov     ds:37Dh, ax
mov     ds:37Fh, dx
retn

loc_108EC:
sub     ax, ds:37Dh
sbb     dx, ds:37Fh
sub     ax, 12h
sbb     dx, 0
retn
sub_108DB endp




sub_108FB proc near
push    ds
mov     ax, seg seg091
mov     ds, ax
assume ds:seg091

loc_10901:
call    sub_107E7
or      ax, ax
jz      short loc_10901
pop     ds
assume ds:nothing
retn
sub_108FB endp




sub_1090A proc near
call    sub_108FB
mov     dl, ds:381h
xor     ds:37Ch, dl
mov     byte ptr ds:381h, 0
cmp     ax, 2A00h
jz      short locret_10943
cmp     ax, 1D00h
jz      short locret_10943
cmp     ax, 3800h
jz      short locret_10943
cmp     ax, 4500h
jz      short locret_10943
cmp     ax, 3A00h
jz      short locret_10943
cmp     ax, 4600h
jz      short locret_10943
xor     ah, ah
int     16h             ; KEYBOARD - READ CHAR FROM BUFFER, WAIT IF EMPTY
                        ; Return: AH = scan code, AL = character
or      ax, ax
jnz     short locret_10943
mov     ax, 0FFFFh

locret_10943:
retn
sub_1090A endp




sub_10944 proc near
int     28h             ; DOS 2+ internal - KEYBOARD BUSY LOOP
mov     ah, 1
int     16h             ; KEYBOARD - CHECK BUFFER, DO NOT CLEAR
                        ; Return: ZF clear if character in buffer
                        ; AH = scan code, AL = character
                        ; ZF set if no character in buffer
jz      short locret_10952
xor     ah, ah
int     16h             ; KEYBOARD - READ CHAR FROM BUFFER, WAIT IF EMPTY
                        ; Return: AH = scan code, AL = character
jmp     short sub_10944

locret_10952:
retn
sub_10944 endp



; Attributes: bp-based frame

sub_10953 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
push    ax
push    bx
push    dx
push    es
test    word ptr [si], 3
jz      short loc_10990
mov     dx, [si+6Bh]
add     dx, 4
test    byte ptr [si+9Ah], 40h
jz      short loc_10981
mov     al, 14h
out     dx, al
jmp     short $+2

loc_10976:
mov     al, 1
mov     dl, 0DEh
out     dx, al
jmp     short $+2

loc_1097D:
mov     al, 14h
jmp     short loc_10989

loc_10981:
mov     al, [si+6Dh]
and     al, 0F7h
out     dx, al
jmp     short $+2

loc_10989:
les     bx, ds:227Ch
mov     es:[bx], al

loc_10990:
pop     es
pop     dx
pop     bx
pop     ax
pop     si
pop     bp
retn    2
sub_10953 endp



; Attributes: bp-based frame

sub_10999 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
push    ax
push    bx
push    dx
push    es
test    word ptr [si], 3
jz      short loc_109CF
mov     dx, [si+6Bh]
add     dx, 4
test    byte ptr [si+9Ah], 40h
jz      short loc_109C0
mov     al, 1
mov     dl, 0DEh
out     dx, al
jmp     short $+2

loc_109BE:
mov     dl, 0D8h

loc_109C0:
mov     al, [si+6Dh]
or      al, 8
out     dx, al
jmp     short $+2

loc_109C8:
les     bx, ds:227Ch
mov     es:[bx], al

loc_109CF:
pop     es
pop     dx
pop     bx
pop     ax
pop     si
pop     bp
retn    2
sub_10999 endp




sub_109D8 proc near
out     dx, al
jmp     short $+2

loc_109DB:
xchg    ah, al
inc     dx
out     dx, al
jmp     short $+2

loc_109E1:
xchg    ah, al
dec     dx
retn
sub_109D8 endp




sub_109E5 proc near
xor     bx, bx
test    byte ptr ds:91D2h, 2
jz      short loc_109EF
inc     bx

loc_109EF:
push    ds
mov     ax, 0A000h
mov     ds, ax
assume ds:nothing
mov     cx, 1000h
cld

loc_109F9:
movsb
or      bx, bx
jz      short loc_109FF
lodsb

loc_109FF:
loop    loc_109F9
pop     ds
assume ds:nothing
retn
sub_109E5 endp




sub_10A03 proc near
push    si
push    di
mov     dx, 3CEh
mov     ax, 204h
call    sub_109D8
test    byte ptr ds:91D2h, 2
jnz     short loc_10A1B
mov     ax, 5
call    sub_109D8

loc_10A1B:
or      byte ptr ds:91D2h, 4
les     di, ds:228Ch
xor     si, si
call    sub_109E5
test    byte ptr ds:91D2h, 2
jz      short loc_10A33
mov     si, 4000h

loc_10A33:
call    sub_109E5
pop     di
pop     si
retn
sub_10A03 endp




sub_10A39 proc near
push    ds
push    es
xor     bx, bx
test    byte ptr ds:91D2h, 2
jz      short loc_10A45
inc     bx

loc_10A45:
push    es
mov     ax, 0A000h
mov     es, ax
assume es:nothing
mov     cx, 1000h
pop     ds
cld

loc_10A50:
movsb
or      bx, bx
jz      short loc_10A56
stosb

loc_10A56:
loop    loc_10A50
pop     es
assume es:nothing
pop     ds
retn
sub_10A39 endp




sub_10A5B proc near
push    si
push    di
mov     dx, 3C4h
mov     ax, 402h
call    sub_109D8
xor     di, di
les     si, ds:228Ch
call    sub_10A39
test    byte ptr ds:91D2h, 2
jz      short loc_10A79
mov     di, 4000h

loc_10A79:
call    sub_10A39
mov     ax, 0F02h
call    sub_109D8
pop     di
pop     si
retn
sub_10A5B endp



; Attributes: bp-based frame

sub_10A85 proc near

arg_0= byte ptr  4

push    bp
mov     bp, sp
mov     al, [bp+arg_0]
mov     ah, 0
call    sub_10BFC
les     bx, ds:2280h
and     byte ptr es:[bx], 7Fh
pop     bp
retn    2
sub_10A85 endp



; Attributes: bp-based frame

sub_10A9C proc near

arg_0= byte ptr  4

push    bp
mov     bp, sp
mov     bl, [bp+arg_0]
mov     ax, 6F05h
call    sub_10BFC
les     bx, ds:2280h
and     byte ptr es:[bx], 7Fh
pop     bp
retn    2
sub_10A9C endp



; Attributes: bp-based frame

sub_10AB4 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
mov     cl, [si+9Ah]
mov     ax, [si]
and     byte ptr [si+9Ah], 7Fh
test    ax, 200h
jz      short loc_10AD2
push    cx
call    sub_10A9C
jmp     loc_10B60

loc_10AD2:
test    ax, 1Ch
jnz     short loc_10ADE
test    byte ptr [si+0A1h], 4
jz      short loc_10AE5

loc_10ADE:
push    cx
call    sub_10A85
jmp     short loc_10B60
db 90h

loc_10AE5:
test    word ptr [si+4], 1Ch
jz      short loc_10AF4
les     bx, ds:2280h
or      byte ptr es:[bx], 8

loc_10AF4:
mov     dx, [si+6Bh]
mov     al, cl
and     al, 7Fh
test    cl, 80h
jnz     short loc_10B08
mov     ah, 0
call    sub_10BFC
jmp     short loc_10B60
align 2

loc_10B08:
mov     cx, [si]
test    cx, 40h
jz      short loc_10B1D
cmp     al, 0Fh
jnz     short loc_10B1D
mov     bx, 382h
mov     ax, ds
mov     es, ax
jmp     short loc_10B39

loc_10B1D:
les     bx, ds:2270h
les     bx, es:[bx]
cmp     al, 2
jb      short loc_10B39
add     bx, 10h
cmp     al, 4
jb      short loc_10B39
add     bx, 10h
cmp     al, 7
jnz     short loc_10B39
add     bx, 10h

loc_10B39:
test    cx, 40h
jz      short loc_10B44
mov     cx, 0Ch
jmp     short loc_10B47

loc_10B44:
mov     cx, 10h

loc_10B47:
cli
push    [bp+arg_2]
call    sub_10953
mov     al, 0

loc_10B50:
mov     ah, es:[bx]
inc     bx
call    sub_109D8
inc     al
loop    loc_10B50
push    si
call    sub_10999
sti

loc_10B60:
pop     si
pop     bp
retn    4
sub_10AB4 endp



; Attributes: bp-based frame

sub_10B65 proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
push    si
push    di
mov     cx, 10h
les     di, [bp+arg_0]
cld

loc_10B71:
mov     dx, 3DAh
in      al, dx          ; Video status bits:
                        ; 0: retrace.  1=display is in vert or horiz retrace.
                        ; 1: 1=light pen is triggered; 0=armed
                        ; 2: 1=light pen switch is open; 0=closed
                        ; 3: 1=vertical sync pulse is occurring.
mov     dl, 0C0h
mov     al, cl
dec     al
out     dx, al          ; EGA: palette register: select colors for attribute AL:
                        ; 0: RED
                        ; 1: GREEN
                        ; 2: BLUE
                        ; 3: blue
                        ; 4: green
                        ; 5: red
jmp     short $+2

loc_10B7E:
inc     dx
in      al, dx
jmp     short $+2

loc_10B82:
stosb
loop    loc_10B71
mov     dl, 0DAh
in      al, dx          ; Video status bits:
                        ; 0: retrace.  1=display is in vert or horiz retrace.
                        ; 1: 1=light pen is triggered; 0=armed
                        ; 2: 1=light pen switch is open; 0=closed
                        ; 3: 1=vertical sync pulse is occurring.
mov     dl, 0C0h
mov     al, 11h
out     dx, al          ; EGA: select overscan (border) color.
                        ; Same rgbRGB as palette regs
jmp     short $+2

loc_10B8F:
inc     dx
in      al, dx
jmp     short $+2

loc_10B93:
stosb
mov     dl, 0DAh
in      al, dx          ; Video status bits:
                        ; 0: retrace.  1=display is in vert or horiz retrace.
                        ; 1: 1=light pen is triggered; 0=armed
                        ; 2: 1=light pen switch is open; 0=closed
                        ; 3: 1=vertical sync pulse is occurring.
mov     dl, 0C0h
mov     al, 20h ; ' '
out     dx, al          ; EGA: palette register: select colors for attribute AL:
                        ; 0: RED
                        ; 1: GREEN
                        ; 2: BLUE
                        ; 3: blue
                        ; 4: green
                        ; 5: red
jmp     short $+2

loc_10B9E:
pop     di
pop     si
pop     bp
retn    4
sub_10B65 endp



; Attributes: bp-based frame

sub_10BA4 proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
mov     cx, 10h
les     bx, [bp+arg_0]
mov     dx, 3DAh
in      al, dx          ; Video status bits:
                        ; 0: retrace.  1=display is in vert or horiz retrace.
                        ; 1: 1=light pen is triggered; 0=armed
                        ; 2: 1=light pen switch is open; 0=closed
                        ; 3: 1=vertical sync pulse is occurring.
mov     dl, 0C0h

loc_10BB3:
mov     al, cl
dec     al
out     dx, al          ; EGA: palette register: select colors for attribute AL:
                        ; 0: RED
                        ; 1: GREEN
                        ; 2: BLUE
                        ; 3: blue
                        ; 4: green
                        ; 5: red
jmp     short $+2

loc_10BBA:
mov     al, es:[bx]
inc     bx
out     dx, al          ; EGA: palette register: select colors for attribute AL:
                        ; 0: RED
                        ; 1: GREEN
                        ; 2: BLUE
                        ; 3: blue
                        ; 4: green
                        ; 5: red
jmp     short $+2

loc_10BC1:
loop    loc_10BB3
mov     al, 11h
out     dx, al          ; EGA: select overscan (border) color.
                        ; Same rgbRGB as palette regs
jmp     short $+2

loc_10BC8:
mov     al, es:[bx]
out     dx, al          ; EGA: palette register: select colors for attribute AL:
                        ; 0: RED
                        ; 1: GREEN
                        ; 2: BLUE
                        ; 3: blue
                        ; 4: green
                        ; 5: red
jmp     short $+2

loc_10BCE:
mov     al, 20h ; ' '
out     dx, al          ; EGA: palette register: select colors for attribute AL:
                        ; 0: RED
                        ; 1: GREEN
                        ; 2: BLUE
                        ; 3: blue
                        ; 4: green
                        ; 5: red
jmp     short $+2

loc_10BD3:
pop     bp
retn    4
sub_10BA4 endp




sub_10BD7 proc far
push    si
push    di
push    ax
push    ds
mov     ax, seg seg091
mov     ds, ax
assume ds:seg091
mov     word_53B0A, 1
pop     ds
assume ds:nothing
pop     ax
int     21h             ; DOS -
push    ax
push    ds
mov     ax, seg seg091
mov     ds, ax
assume ds:seg091
mov     word_53B0A, 0
pop     ds
assume ds:nothing
pop     ax
pop     di
pop     si
retf
sub_10BD7 endp




sub_10BFC proc near
push    si
push    di
mov     ds:822Eh, bp
int     10h             ; - VIDEO -
mov     bp, ds:822Eh
pop     di
pop     si
retn
sub_10BFC endp

align 2
db 24h, 2Ah, 24h, 2Ah, 24h, 2Ah, 1Ch, 9
db 0, 1, 44h, 45h, 42h, 55h, 47h, 0
seg_10C1C dw seg seg091
byte_10C1E db 4, 5 dup(0), 0EEh, 18h, 0Ch, 5 dup(0)
db 0F7h, 18h, 24h, 5 dup(0), 4Ch, 19h, 40h
db 5 dup(0), 9Ah, 1Bh, 4Ch, 5 dup(0), 8Dh
db 1Bh
word_10C46 dw 5
dword_10C48 dd 0
dword_10C4C dd 0
word_10C50 dw 0
word_10C52 dw 0
byte_10C54 db 0
byte_10C55 db 9 dup(0)


; Attributes: bp-based frame

sub_10C5E proc far

arg_0= word ptr  6
arg_2= dword ptr  8
arg_6= word ptr  0Ch

push    bp
mov     bp, sp
push    si
push    di
cld
mov     ax, cs:seg_10C1C
mov     ds, ax
assume ds:seg091
mov     es, ax
assume es:seg091
mov     word_4C282, ss
mov     word_4C280, sp
mov     word_4C27E, bp
push    word_4BE52
push    word_4BE50
push    ds
mov     ax, 9CAh
push    ax
call    sub_3F3F4
mov     word_4C262, ax
mov     word_4C264, dx
or      ax, dx
jnz     short loc_10CA5
call    sub_11452
mov     [bp+arg_0], 2

loc_10C9D:
call    sub_13450
jmp     short loc_10D02
db 90h

loc_10CA5:
call    sub_11434
call    sub_11452

loc_10CAB:
mov     ax, ds
mov     es, ax
mov     di, 38Eh
mov     cx, 100h
mov     ax, ds
mov     bx, 48Eh
mov     dx, 100h
call    sub_10E3A
cmp     [bp+arg_0], 2
jz      short loc_10C9D
mov     ax, word ptr dword_4C266
add     ax, word_4C26A
mov     word_4C26C, ax
les     bx, dword_4C266
assume es:nothing
mov     cx, word_4C26A
mov     si, word_4BE50
mov     ax, [bp+arg_0]
call    sub_10E72
jnb     short loc_10CF4

loc_10CE4:
mov     sp, word_4C280
mov     bp, word_4C27E
xor     ax, ax
mov     dx, 0FFFFh
jmp     loc_10E1B

loc_10CF4:
mov     di, word_4C26C
mov     es, word ptr dword_4C266+2
assume es:nothing
mov     al, 6
nop
call    near ptr sub_110C9

loc_10D02:
cmp     word_4C274, 0
jz      short loc_10D19
les     di, dword_4C266
assume es:nothing
cmp     byte ptr es:[di], 0CCh
jz      short loc_10D19
call    sub_1168A
call    sub_10E21

loc_10D19:
mov     cs:word_10C52, 0
mov     cs:byte_10C54, 0
mov     cs:byte_11BA7, 0
nop
mov     ax, word_4BE50
mov     word_4C28C, ax
mov     ax, word_4BE52
mov     word_4C28E, ax
call    sub_117B6
call    near ptr sub_118B2
call    sub_117E5
mov     ax, word_4BE50
mov     dx, word_4BE52
mov     cx, [bp+arg_6]
jcxz    short loc_10D68
les     di, [bp+arg_2]

loc_10D51:
cmp     byte ptr es:[di+5], 0
jz      short loc_10D63
cmp     ax, es:[di]
jnz     short loc_10D63
cmp     dx, es:[di+2]
jz      short loc_10DDD

loc_10D63:
add     di, 6
loop    loc_10D51

loc_10D68:
call    sub_111AD
jnb     short loc_10DD8
mov     cx, 1
mov     ax, word_4BE50
cmp     ax, word_4C28C
jnz     short loc_10D93
mov     ax, word_4BE52
cmp     ax, word_4C28E
jnz     short loc_10D93
mov     word_4C28C, 0FFFFh
inc     word_4BE50
dec     cx
cmp     [bp+arg_0], 2
jz      short loc_10DDA

loc_10D93:
mov     word_4C28C, 0FFFFh
push    cx
push    word_4BE52
push    word_4BE50
push    ds
mov     ax, 9CAh
push    ax
call    sub_3F3F4
pop     cx
mov     bx, ax
or      bx, dx
jz      short loc_10DD1
push    cx
mov     word_4C262, ax
mov     word_4C264, dx
call    sub_11434
pop     cx
mov     ax, word ptr dword_4C266
cmp     ax, word_4BE50
jnz     short loc_10DD1
mov     ax, word ptr dword_4C266+2
cmp     ax, word_4BE52
jz      short loc_10E0E

loc_10DD1:
add     word_4BE50, cx
jmp     loc_10D19

loc_10DD8:
jnz     short loc_10DEF

loc_10DDA:
jmp     loc_10D19

loc_10DDD:
push    word_4BE52
push    word_4BE50
push    ds
mov     ax, 9CAh
push    ax
call    sub_3F3F4

loc_10DEF:
mov     word_4C262, ax
mov     word_4C264, dx
call    sub_11434
mov     ax, word ptr dword_4C266
cmp     ax, word_4BE50
jnz     short loc_10E0B
mov     ax, word ptr dword_4C266+2
cmp     ax, word_4BE52
jz      short loc_10E0E

loc_10E0B:
jmp     loc_10CAB

loc_10E0E:
call    sub_114D3
call    sub_11152

loc_10E14:
mov     ax, word_4C262
mov     dx, word_4C264

loc_10E1B:
pop     di
pop     si
pop     bp
retf    8
sub_10C5E endp ; sp-analysis failed




sub_10E21 proc near
les     di, dword_4C266
mov     al, es:[di]
mov     byte ptr es:[di], 0CCh
les     di, dword_4C276
stosb
mov     word_4C274, 0
retn
sub_10E21 endp

byte_10E38 db 0
byte_10E39 db 0



sub_10E3A proc near
mov     word_4C298, ax
mov     word_4C296, bx
mov     word_4C29A, bx
mov     word_4C29E, 0
add     bx, dx
mov     word_4C29C, bx
mov     word_4C290, di
mov     word_4C292, es
mov     ax, cx
shl     ax, 1
shl     ax, 1
shl     ax, 1
mov     word_4C294, ax
shr     cx, 1
xor     ax, ax
rep stosw
mov     word_4C2C4, ax
mov     cs:byte_10E38, al
retn
sub_10E3A endp




sub_10E72 proc near

; FUNCTION CHUNK AT 1042 SIZE 00000003 BYTES

cmp     cx, word_4C294
jbe     short loc_10E7B
jmp     loc_10FAC

loc_10E7B:
mov     word_4C2AA, ax
mov     word_4C2A2, bx
mov     word_4C2A4, es
add     cx, bx
mov     word_4C2A6, cx
mov     word_4C2C2, 0
mov     cs:byte_10E39, 0FFh

loc_10E98:
mov     ax, word_4C29C
mov     word_4C2A0, ax

loc_10E9E:
mov     word_4C2A8, si
call    sub_11087
mov     word_4C2B0, bx
mov     word_4C2B2, dx
mov     word_4C2B4, cx

loc_10EB1:
mov     si, word_4C2B0
mov     es, word_4C292
mov     ax, word_4C2B2
test    es:[si], ax
jnz     short loc_10F2D
mov     di, word_4C2A8
mov     es, word_4C2A4
call    sub_114FA
mov     word_4C2B8, cx
mov     word ptr dword_4C2BA, di
mov     word ptr dword_4C2BA+2, es
mov     word_4C2B6, ax
mov     si, word_4C2B0
mov     es, word_4C292
mov     ax, word_4C2B2
mov     dx, word_4C2B4

loc_10EEA:
or      es:[si], ax
shl     ax, 1
dec     dx
jnz     short loc_10F00
mov     ax, 1
mov     dx, 10h
add     si, 2
add     word_4C2B0, 2

loc_10F00:
loop    loc_10EEA
mov     word_4C2B2, ax
mov     word_4C2B4, dx
mov     ax, word_4C2B6
cmp     ax, 5
jz      short loc_10F4E
mov     word_4C2C2, 0
and     ax, ax
jnz     short loc_10F4E

loc_10F1B:
mov     ax, word_4C2B8
add     word_4C2A8, ax
mov     ax, word_4C2A8
cmp     ax, word_4C2A6
jnb     short loc_10F2D
jmp     short loc_10EB1

loc_10F2D:
mov     si, word_4C2A0
cmp     si, word_4C29C
jz      short loc_10F4C
mov     es, word_4C292
mov     si, es:[si]
add     word_4C2A0, 2
mov     word_4C2C2, 0
jmp     loc_10E9E

loc_10F4C:
clc
retn

loc_10F4E:
mov     bx, ax
and     bx, 7Fh
shl     bx, 1
jmp     word ptr [bx+0A14h]
mov     al, 5
call    sub_110C1
jmp     short loc_10F1B
test    ax, 80h
jz      short loc_10FB1

loc_10F65:
mov     al, 8
call    sub_110C1
jmp     short loc_10F2D

loc_10F6C:
cmp     word_4C2B6, 3
jz      short loc_10F7A

loc_10F73:
mov     si, word ptr dword_4C2BA
jmp     loc_10E9E

loc_10F7A:
mov     si, word ptr dword_4C2BA
call    sub_11087
mov     es, word_4C292
test    es:[bx], dx
jnz     short loc_10FA9
mov     bx, word_4C2B0
mov     ax, word_4C2B2
and     ax, es:[bx]
jnz     short loc_10F73
sub     word_4C2A0, 2
mov     di, word_4C2A0
cmp     di, word_4C29A
jb      short loc_10FAC
mov     ax, word ptr dword_4C2BA
stosw

loc_10FA9:
jmp     loc_10F1B

loc_10FAC:
call    sub_11152
stc
retn

loc_10FB1:
mov     ax, word ptr dword_4C2BA+2
cmp     ax, word_4C2A4
jnz     short loc_10FCB
mov     ax, word ptr dword_4C2BA
cmp     ax, word_4C2A2
jb      short loc_10FCB
jz      short loc_10FF4
cmp     ax, word_4C2A6
jb      short loc_10F6C

loc_10FCB:
push    word ptr dword_4C2BA+2
push    word ptr dword_4C2BA
push    ds
mov     ax, 0A0Eh
push    ax
call    sub_3F3F4
or      ax, dx
jz      short loc_10F65
mov     al, 6
les     di, dword_4C2BA
call    near ptr sub_110C9
cmp     word_4C2B6, 3
jz      short loc_11042
jmp     loc_10F2D

loc_10FF4:
mov     al, 9
les     di, dword_4C2BA
call    near ptr sub_110C9
mov     cs:byte_10E38, 1
mov     ax, word_4BE50
cmp     ax, word ptr dword_4C266
jnz     short loc_1101A
mov     ax, word_4BE52
cmp     ax, word ptr dword_4C266+2
jnz     short loc_1101A
dec     cs:byte_10E38

loc_1101A:
jmp     loc_10F6C
sub_10E72 endp ; sp-analysis failed

cmp     word_4C2C2, 0
jnz     short loc_1102F
mov     word_4C2C2, 1
mov     al, 4
call    sub_110C1

loc_1102F:
jmp     loc_10F1B
cmp     word ptr [bp+6], 0
jnz     short loc_11067
test    ax, 80h
jz      short loc_11045
mov     al, 7
call    sub_110C1
; START OF FUNCTION CHUNK FOR sub_10E72

loc_11042:
jmp     loc_10F1B
; END OF FUNCTION CHUNK FOR sub_10E72

loc_11045:
push    word ptr dword_4C2BA+2
push    word ptr dword_4C2BA
push    ds
mov     ax, 0A0Eh
push    ax
call    sub_3F3F4
or      ax, dx
jz      short loc_11067
mov     al, 6
les     di, dword_4C2BE
call    near ptr sub_110C9
jmp     loc_10F1B

loc_11067:
mov     al, 3
call    sub_110C1
jmp     loc_10F1B
mov     al, 0
call    sub_110C1
jmp     loc_10F1B
mov     al, 1
call    sub_110C1
jmp     loc_10F1B
mov     al, 2
call    sub_110C1
jmp     loc_10F1B



sub_11087 proc near
sub     si, word_4C2A2
mov     bx, si
mov     cl, 4
shr     bx, cl
shl     bx, 1
add     bx, word_4C290
and     si, 0Fh
shl     si, 1
shl     si, 1
mov     dx, [si+0A26h]
mov     cx, [si+0A28h]
retn
sub_11087 endp

cmp     word ptr es:0, 3FCDh
jnz     short loc_110BD
cmp     word ptr es:10h, 0
jz      short loc_110BF
mov     es, word ptr es:10h

loc_110BD:
clc
retn

loc_110BF:
stc
retn



sub_110C1 proc near
mov     di, word_4C2A8
mov     es, word_4C2A4
sub_110C1 endp




sub_110C9 proc far
cmp     byte ptr es:[di], 0CCh
jz      short loc_11117
cmp     al, 9
jnz     short loc_110E8
cmp     word_4C274, 0
jz      short loc_110E8
cmp     di, word ptr dword_4C266
jnz     short loc_110E8
mov     dx, es
cmp     dx, word ptr dword_4C266+2
jz      short locret_11116

loc_110E8:
mov     bx, word_4C29A
lea     dx, [bx+6]
cmp     dx, word_4C2A0
ja      short loc_11149
push    ds
mov     ds, word_4C298
assume ds:nothing
mov     [bx], di
mov     word ptr [bx+2], es
mov     [bx+5], al
mov     al, es:[di]
mov     [bx+4], al
mov     byte ptr es:[di], 0CCh
pop     ds
add     word ptr ds:9EAh, 6
inc     word ptr ds:9EEh

locret_11116:
retn

loc_11117:
cmp     al, 9
jnz     short locret_11116
mov     cx, ds:9EEh
jcxz    short locret_11116
push    ds
lds     si, ds:9E6h
mov     dx, es

loc_11128:
cmp     di, [si]
jnz     short loc_11142
cmp     dx, [si+2]
jnz     short loc_11142
mov     al, [si+5]
mov     byte ptr [si+5], 9
pop     ds
cmp     al, 9
jz      short locret_11116
mov     cs:byte_10E39, al
retn

loc_11142:
add     si, 6
loop    loc_11128
pop     ds
retn

loc_11149:
call    sub_11152
call    sub_114D3
jmp     loc_10CE4
sub_110C9 endp




sub_11152 proc near
mov     cx, ds:9EEh
jcxz    short locret_1117D
push    ds
lds     si, ds:9E6h

loc_1115D:
les     di, [si]
cmp     byte ptr es:[di], 0CCh
jnz     short loc_1116B
mov     al, [si+4]
mov     es:[di], al

loc_1116B:
add     si, 6
loop    loc_1115D
pop     ds
mov     ax, ds:9E6h
mov     ds:9EAh, ax
mov     word ptr ds:9EEh, 0

locret_1117D:
retn
sub_11152 endp




sub_1117E proc near
mov     si, ds:9FCh
mov     es, word ptr ds:9E8h
les     di, es:[si]
cmp     byte ptr es:[di], 0CCh
jnz     short locret_111AC
mov     al, [si+4]
mov     es:[di], al
call    sub_1168A
mov     si, ds:9FCh
mov     es, word ptr ds:9E8h
les     di, [si]
mov     al, es:[di]
mov     [si+4], al
mov     byte ptr es:[di], 0CCh

locret_111AC:
retn
sub_1117E endp




sub_111AD proc near
mov     cx, ds:9EEh
jcxz    short loc_111CA
mov     di, ds:9E6h
mov     es, word ptr ds:9E8h
mov     ax, ds:5A0h
mov     dx, ds:5A2h

loc_111C2:
scasw
jz      short loc_111CC

loc_111C5:
add     di, 4
loop    loc_111C2

loc_111CA:
stc
retn

loc_111CC:
cmp     dx, es:[di]
jnz     short loc_111C5
sub     di, 2
mov     ds:9FCh, di
mov     al, es:[di+5]
cbw
mov     ds:9FEh, ax
mov     bx, ax
cmp     al, 9
jz      short loc_111FE
cmp     al, 7
jz      short loc_111FE
cmp     al, 8
jz      short loc_111FE
push    ds
lds     si, es:[di]
cmp     byte ptr [si], 0CCh
jnz     short loc_111FD
mov     al, es:[di+4]
mov     [si], al

loc_111FD:
pop     ds

loc_111FE:
shl     bx, 1
jmp     word ptr [bx+0A66h]
sub_111AD endp

inc     cs:byte_10E38
mov     al, cs:byte_10E39
cmp     al, 0FFh
jnz     short loc_1121F
cmp     cs:byte_10E38, 2
jz      short loc_1128C
call    sub_1117E
xor     al, al
retn

loc_1121F:
cbw
mov     bx, ax
push    word ptr ds:5A0h
call    loc_111FE
pop     bx
push    ax
push    dx
pushf
cmp     bx, ds:5A0h
jnz     short loc_1123C
call    sub_1117E
mov     cs:byte_10E39, 0FFh

loc_1123C:
popf
pop     dx
pop     ax
mov     cs:byte_10E38, 1
retn
call    sub_1117E
mov     si, ds:5A2h
cmp     si, ds:9F4h
jnz     short loc_1128C
mov     si, ds:5A0h
cmp     si, ds:9F2h
jb      short loc_1128C
cmp     si, ds:9F6h
jnb     short loc_1128C
call    sub_11087
mov     es, word ptr ds:9E2h
test    es:[bx], dx
jnz     short loc_11276
mov     si, ds:5A0h
call    loc_10E98

loc_11276:
xor     al, al
retn
call    sub_1117E
jmp     short loc_1128C
call    sub_1168A
cmp     word ptr [bp+6], 1
jnz     short loc_1128C
mov     word ptr [bp+6], 0

loc_1128C:
push    word ptr ds:5A2h
push    word ptr ds:5A0h
push    ds
mov     ax, 0A0Eh
push    ax
call    sub_3F3F4
cmp     word ptr ds:9FEh, 7
jnz     short loc_112AB
mov     bx, ax
or      bx, dx
jz      short loc_11303

loc_112AB:
push    ax
push    dx
call    sub_11152
pop     dx
pop     ax
mov     bx, ax
or      bx, dx
jnz     short locret_112C1
call    sub_13450
xor     ax, ax
xor     dx, dx

locret_112C1:
retn
mov     ax, ds:59Ch

loc_112C5:
push    ax
mov     di, ds:9FCh
push    ds
mov     ds, word ptr ds:9E8h
les     si, [di]
cmp     byte ptr es:[si], 0CCh
jnz     short loc_112DD
mov     al, [di+4]
mov     es:[si], al

loc_112DD:
pop     ds
pop     ax
cmp     ax, 50h ; 'P'
jb      short loc_11303
cmp     ax, 0A000h
jb      short loc_112EE
cmp     ax, 0C000h
jb      short loc_11303

loc_112EE:
xor     al, al
retn
mov     ax, ds:59Ch
cmp     ax, 0A000h
jnb     short loc_112C5
cmp     ax, 50h ; 'P'
jb      short loc_112C5
mov     ax, ds:59Eh
jmp     short loc_112C5

loc_11303:
cmp     word ptr ds:0A14h, 0
jnz     short loc_11338
call    sub_13450
mov     word ptr ds:0A14h, 1
mov     cx, ds:9EEh
push    ds
lds     si, ds:9E6h

loc_1131E:
cmp     byte ptr [si+5], 4
ja      short loc_11332
les     di, [si]
cmp     byte ptr es:[di], 0CCh
jnz     short loc_11332
mov     al, [si+4]
mov     es:[di], al

loc_11332:
add     si, 6
loop    loc_1131E
pop     ds

loc_11338:
xor     al, al
retn



sub_1133B proc near
mov     cx, ds:9EEh
jcxz    short locret_1135A
push    ds
lds     si, ds:9E6h

loc_11346:
les     di, [si]
cmp     byte ptr es:[di], 0CCh
jnz     short loc_11354
mov     al, [si+4]
mov     es:[di], al

loc_11354:
add     si, 6
loop    loc_11346
pop     ds

locret_1135A:
retn
sub_1133B endp



; Attributes: bp-based frame

sub_1135B proc far

arg_0= word ptr  6

push    bp
mov     bp, sp
push    si
push    di
mov     dx, [bp+arg_0]
cli
mov     ss, word ptr ds:9D2h
assume ss:nothing
mov     sp, ds:9D0h
sti
mov     bp, ds:9CEh
mov     ds, cs:seg_10C1C
assume ds:seg091
push    dx
call    sub_11875
call    sub_11804
call    sub_114D3
call    sub_11152
xor     ax, ax
pop     dx
xor     dh, dh
cmp     cs:byte_10C54, 0
jz      short loc_11393
mov     dx, ax
dec     ax

loc_11393:
jmp     loc_10E1B
sub_1135B endp



; Attributes: bp-based frame

sub_11396 proc far

arg_0= word ptr  6

push    bp
mov     bp, sp
push    si
push    di
push    ds
mov     ds, cs:seg_10C1C
mov     ax, [bp+arg_0]
mov     ax, word_4BE4C
mov     word_4BE5E, ax
or      word_4BE54, 200h
mov     es, ax
assume es:nothing
mov     es, word ptr es:16h
assume es:nothing
les     si, es:2Eh
mov     word_4C284, si
mov     word_4C286, es
mov     es, cs:seg_10C1C
assume es:seg091
xor     ax, ax
mov     ds, ax
assume ds:nothing
xor     si, si
mov     di, 5B2h
mov     cx, 200h
rep movsw
mov     ax, seg seg091
mov     ds, ax
assume ds:seg091
mov     di, word_4B9A4
shl     di, 1
shl     di, 1
mov     ax, seg seg091
mov     ds, ax
mov     si, 8C48h
add     di, 5B2h
movsw
movsw
mov     si, 825Fh
mov     di, 61Eh
lodsw
stosw
mov     word ptr cs:dword_10C48, ax
lodsw
stosw
mov     word ptr cs:dword_10C48+2, ax
mov     si, 8256h
mov     di, 63Eh
movsw
movsw
mov     si, 8C4Ch
mov     di, 642h
movsw
movsw
mov     di, 636h
mov     ax, es:[di]
mov     word ptr cs:dword_10C4C, ax
mov     ax, es:[di+2]
mov     word ptr cs:dword_10C4C+2, ax
mov     ax, 1BA8h
stosw
mov     ax, cs
stosw
pop     ds
assume ds:nothing
pop     di
pop     si
pop     bp
retf    2
sub_11396 endp




sub_11434 proc near
push    word ptr ds:9B4h
push    word ptr ds:9B2h
push    ds
mov     ax, 9B6h
push    ax
push    ds
mov     ax, 9BAh
push    ax
call    sub_3F201
or      ax, ax
retn
sub_11434 endp

dword_1144E dd 0



sub_11452 proc near
mov     word ptr ds:9C4h, 0
mov     cx, [bp+0Ch]
jcxz    short locret_114D2
les     bx, [bp+8]
assume es:nothing

loc_11460:
push    cx
push    bx
push    es
mov     ax, es:[bx]
mov     word ptr cs:dword_1144E, ax
mov     ax, es:[bx+2]
mov     word ptr cs:dword_1144E+2, ax
mov     ax, word ptr cs:dword_1144E
cmp     ax, ds:5A0h
jnz     short loc_114B2
mov     ax, word ptr cs:dword_1144E+2
cmp     ax, ds:5A2h
jnz     short loc_114B2
xor     al, al
cmp     word ptr [bp+6], 2
jnz     short loc_114C2
cmp     word ptr ds:9C4h, 0
jnz     short loc_114C2
pop     es
pop     bx
push    bx
push    es
mov     word ptr ds:9C4h, 1
lea     ax, [bx+4]
mov     ds:9C6h, ax
mov     word ptr ds:9C8h, es
les     di, cs:dword_1144E
jmp     short loc_114BE
jmp     short locret_114D2

loc_114B2:
les     di, cs:dword_1144E
mov     ah, es:[di]
mov     byte ptr es:[di], 0CCh

loc_114BE:
mov     al, 1
mov     dx, es

loc_114C2:
pop     es
pop     bx
mov     es:[bx+5], al
mov     es:[bx+4], ah
pop     cx
add     bx, 6
loop    loc_11460

locret_114D2:
retn
sub_11452 endp




sub_114D3 proc near
mov     cx, [bp+0Ch]
jcxz    short locret_114F9
push    ds
lds     si, [bp+8]

loc_114DC:
cmp     byte ptr [si+5], 0
jz      short loc_114F3
mov     di, [si]
mov     es, word ptr [si+2]
cmp     byte ptr es:[di], 0CCh
jnz     short loc_114F3
mov     al, [si+4]
mov     es:[di], al

loc_114F3:
add     si, 6
loop    loc_114DC
pop     ds

locret_114F9:
retn
sub_114D3 endp




sub_114FA proc near
xor     dx, dx
mov     ds:0C48h, dx

loc_11500:
mov     bx, es:[di]
mov     si, 0A7Ah
mov     cx, 4Dh ; 'M'

loc_11509:
lodsw
and     ax, bx
cmp     ax, [si]
jz      short loc_1151B
add     si, 4
loop    loc_11509
mov     cx, 1
xor     ax, ax
retn

loc_1151B:
mov     cl, [si+2]
xor     ch, ch
mov     al, [si+3]
xor     ah, ah
and     cl, cl
jle     short loc_1152C
add     cx, dx
retn

loc_1152C:
jz      short loc_11563
dec     ch
mov     si, cx
neg     si
add     si, 153Bh
jmp     word ptr cs:[si]
db 63h, 15h, 85h, 15h, 96h, 15h, 0A3h, 15h
db 2Bh, 15h, 2Bh, 15h, 0D9h, 15h, 0D8h, 15h
db 37h, 16h, 42h, 16h, 4Dh, 16h, 0D1h, 15h
db 0CBh, 15h, 0C2h, 15h, 0BFh, 15h, 58h
db 16h, 5Fh, 16h, 78h, 16h, 0ADh, 15h, 64h
db 16h

loc_11563:
mov     al, es:[di]
inc     di
inc     dx
cmp     al, 26h ; '&'
jz      short loc_1157C
cmp     al, 2Eh ; '.'
jz      short loc_11574
cmp     al, 26h ; '&'
jnz     short loc_11500

loc_11574:
mov     word ptr ds:0C48h, 0FFFFh
jmp     short loc_11500

loc_1157C:
mov     word ptr ds:0C48h, 7
jmp     loc_11500
sub_114FA endp

mov     bx, ax
mov     al, es:[di+1]
cbw
xchg    ax, bx
lea     di, [bx+di+2]
mov     cx, 2
add     cx, dx
retn
mov     bx, es:[di+1]
lea     di, [bx+di+3]
mov     cx, 3
add     cx, dx
retn
les     di, es:[di+1]
mov     cx, 5
add     cx, dx
retn
inc     di
inc     dx
mov     bl, es:[di+1]
and     bl, 0F0h
cmp     bl, 20h ; ' '
jnz     short loc_115BF
inc     dx
add     cx, dx
retn

loc_115BF:
inc     di
jmp     short loc_115D8
test    byte ptr es:[di], 2
jnz     short loc_115D8
inc     dx
jmp     short loc_115D8
test    byte ptr es:[di], 2
jnz     short loc_115D8
inc     dx
test    byte ptr es:[di], 1
jz      short loc_115D9

loc_115D8:
inc     dx

loc_115D9:
and     ax, ax
jnz     short loc_11611
mov     cx, ds:0C48h
and     cx, cx
jl      short loc_11611
mov     bl, es:[di+1]
cmp     bl, 0C0h
jnb     short loc_11611
jcxz    short loc_115F4
or      ax, cx
jmp     short loc_11611

loc_115F4:
and     bl, 0C7h
cmp     bl, 6
jz      short loc_11611
and     bl, 7
cmp     bl, 2
jz      short loc_11611
cmp     bl, 3
jz      short loc_11611
cmp     bl, 6
jz      short loc_11611
or      ax, 6

loc_11611:
mov     bl, es:[di+1]
and     bl, 0C7h
mov     cx, 2
cmp     bl, 0C0h
jnb     short loc_11634
mov     cx, 4
cmp     bl, 80h
jnb     short loc_11634
cmp     bl, 6
jz      short loc_11634
dec     cx
cmp     bl, 40h ; '@'
jnb     short loc_11634
dec     cx

loc_11634:
add     cx, dx
retn
mov     cx, 2
test    byte ptr es:[di], 1
jz      short locret_11641
inc     cx

locret_11641:
retn
mov     cx, 2
test    byte ptr es:[di], 2
jnz     short locret_1164C
inc     cx

locret_1164C:
retn
mov     cx, 2
test    byte ptr es:[di], 8
jz      short locret_11657
inc     cx

locret_11657:
retn

loc_11658:
mov     ax, 7
mov     cx, dx
inc     cx
retn
mov     cx, 1
jmp     short loc_11667
mov     cx, 3

loc_11667:
mov     ax, ds:0C48h
cmp     ax, 7
jz      short loc_11658
inc     ax
jz      short loc_11675
mov     ax, 6

loc_11675:
add     cx, dx
retn
mov     ax, ds:0C48h
cmp     ax, 7
jz      short loc_11658
inc     ax
jz      short loc_11658
mov     ax, 8
mov     cx, dx
inc     cx
retn



sub_1168A proc near
les     di, ds:5A0h
cmp     byte ptr es:[di], 0CDh
jz      short loc_1169E

loc_11694:
call    sub_11BF5
call    sub_116D3
call    sub_11C16
retn

loc_1169E:
cmp     byte ptr es:[di+1], 34h ; '4'
jb      short loc_11694
cmp     byte ptr es:[di+1], 3Eh ; '>'
ja      short loc_11694
call    sub_114FA
les     di, ds:5A0h
add     di, cx
push    word ptr es:[di]
push    es
push    di
mov     byte ptr es:[di], 0CCh
call    sub_13450
call    sub_117B6
call    near ptr sub_118B2
call    sub_117E5
pop     di
pop     es
pop     ax
mov     es:[di], al
retn
sub_1168A endp




sub_116D3 proc near
les     di, ds:5A0h
mov     al, es:[di]
cmp     al, 0CCh
jz      short loc_1170F
cmp     al, 0CFh
jz      short loc_11714
cmp     al, 9Ch
jz      short loc_11738
cmp     al, 9Dh
jz      short loc_11750
cmp     al, 0CDh
jz      short loc_1170D
or      word ptr ds:5A4h, 100h
push    cs:word_10C50
mov     cs:word_10C50, 1
call    near ptr sub_118B2
pop     cs:word_10C50
inc     word ptr ds:5A0h
retn

loc_1170D:
jmp     short loc_1176B

loc_1170F:
inc     word ptr ds:5A0h
retn

loc_11714:
mov     es, word ptr ds:5A8h
mov     bx, ds:5A6h
mov     ax, es:[bx]
mov     cx, es:[bx+2]
mov     dx, es:[bx+4]
mov     ds:5A0h, ax
mov     ds:5A2h, cx
mov     ds:5A4h, dx
add     word ptr ds:5A6h, 6
retn

loc_11738:
sub     word ptr ds:5A6h, 2
mov     bx, ds:5A6h
mov     es, word ptr ds:5A8h
mov     ax, ds:5A4h
mov     es:[bx], ax
inc     word ptr ds:5A0h
retn

loc_11750:
mov     bx, ds:5A6h
mov     es, word ptr ds:5A8h
mov     ax, es:[bx]
and     ax, 0FEFFh
mov     ds:5A4h, ax
add     word ptr ds:5A6h, 2
inc     word ptr ds:5A0h
retn

loc_1176B:
mov     bl, es:[di+1]
xor     bh, bh
shl     bx, 1
shl     bx, 1
add     word ptr ds:5A0h, 2
sub     word ptr ds:5A6h, 6
mov     di, ds:5A6h
mov     es, word ptr ds:5A8h
mov     ax, ds:5A0h
stosw
mov     ax, ds:5A2h
stosw
mov     ax, ds:5A4h
stosw
push    ds
add     bx, 5B2h
test    cs:byte_10C54, 80h
jz      short loc_117A8
xor     ax, ax
mov     ds, ax
assume ds:nothing
sub     bx, 5B2h

loc_117A8:
mov     ax, [bx]
mov     dx, [bx+2]
pop     ds
assume ds:nothing
mov     ds:5A0h, ax
mov     ds:5A2h, dx
retn
sub_116D3 endp




sub_117B6 proc near
mov     ah, 51h
int     21h             ; DOS - 2+ internal - GET PSP SEGMENT
                        ; Return: BX = current PSP segment
mov     ds:5B0h, bx
mov     es, bx
mov     ax, ds:9D4h
mov     es:2Eh, ax
mov     ax, ds:9D6h
mov     es:30h, ax
mov     bx, ds:5AEh
mov     ah, 50h
int     21h             ; DOS - 2+ internal - SET PSP SEGMENT
                        ; BX = segment address of new PSP
cli
call    sub_11804
call    sub_1184C
mov     cs:word_10C50, 3
retn
sub_117B6 endp




sub_117E5 proc near
call    sub_11875
call    sub_11804
mov     cs:word_10C50, 0
sti
mov     ah, 51h
int     21h             ; DOS - 2+ internal - GET PSP SEGMENT
                        ; Return: BX = current PSP segment
mov     ds:5AEh, bx
mov     bx, ds:5B0h
mov     ah, 50h
int     21h             ; DOS - 2+ internal - SET PSP SEGMENT
                        ; BX = segment address of new PSP
retn
sub_117E5 endp



; Attributes: fuzzy-sp

sub_11804 proc near
xor     ax, ax
mov     bx, sp
sub     sp, 401h
and     sp, 0FFFEh
mov     ds, ax
assume ds:nothing
mov     si, ax
push    ss
pop     es
mov     di, sp
mov     cx, 200h
rep movsw
nop
mov     ds, cs:seg_10C1C
assume ds:seg091
mov     si, 5B2h
mov     es, ax
assume es:nothing
mov     di, ax
mov     cx, 200h
rep movsw
mov     si, sp
push    ss
pop     ds
assume ds:nothing
mov     di, 5B2h
mov     es, cs:seg_10C1C
assume es:seg091
mov     cx, 200h
rep movsw
mov     ds, cs:seg_10C1C
assume ds:seg091
mov     es, cs:seg_10C1C
mov     sp, bx
retn
sub_11804 endp




sub_1184C proc near
push    ds
push    cs
pop     ds
assume ds:seg000
xor     ax, ax
mov     es, ax
assume es:nothing
mov     si, 0C1Eh
mov     cx, cs:word_10C46

loc_1185B:
lodsw
mov     di, ax
mov     ax, es:[di]
mov     [si], ax
mov     ax, es:[di+2]
mov     [si+2], ax
add     si, 4
movsw
mov     ax, cs
stosw
loop    loc_1185B
pop     ds
assume ds:nothing
retn
sub_1184C endp




sub_11875 proc near
mov     bx, ds:5AEh
push    ds
mov     dx, cs
mov     ds, dx
assume ds:seg000
xor     ax, ax
mov     es, ax
mov     si, 0C1Eh
mov     cx, cs:word_10C46

loc_1188A:
lodsw
mov     di, ax
cmp     dx, es:[di+2]
jnz     short loc_118A3
mov     ax, [si+4]
cmp     ax, es:[di]
jnz     short loc_118A3

loc_1189B:
movsw
movsw
inc     si
inc     si
loop    loc_1188A
pop     ds
assume ds:nothing
retn

loc_118A3:
cmp     es:[di+2], bx
jb      short loc_1189B
mov     ds, dx
add     si, 6
loop    loc_1188A
pop     ds
retn
sub_11875 endp




sub_118B2 proc far
mov     ds:0C4Ah, sp
mov     word ptr ds:0C4Ch, ss
mov     ds:0C4Eh, bp
mov     bx, 58Eh
mov     ax, [bx]
mov     cx, [bx+4]
mov     dx, [bx+6]
mov     si, [bx+0Ah]
mov     di, [bx+0Ch]
mov     bp, [bx+8]
mov     es, word ptr [bx+10h]
assume es:nothing
cli
mov     ss, word ptr [bx+1Ah]
mov     sp, [bx+18h]
sti
push    word ptr [bx+16h]
push    word ptr [bx+14h]
push    word ptr [bx+12h]
mov     bx, [bx+2]
mov     ds, word ptr ds:59Ch
iret
sub_118B2 endp

cmp     cs:word_10C50, 1
jz      short loc_11900
iret
cmp     cs:word_10C50, 3
jz      short loc_11900
iret

loc_11900:
push    ds
push    bx
mov     ds, cs:seg_10C1C
assume ds:seg091
mov     bx, 58Eh
mov     [bx], ax
pop     word ptr [bx+2]
mov     [bx+4], cx
mov     [bx+6], dx
mov     [bx+0Ah], si
mov     [bx+0Ch], di
mov     [bx+8], bp
pop     word ptr [bx+0Eh]
mov     word ptr [bx+10h], es
pop     word ptr [bx+12h]
pop     word ptr [bx+14h]
pop     word ptr [bx+16h]
mov     word ptr [bx+1Ah], ss
mov     [bx+18h], sp
cli
mov     ss, word_4C4FC
assume ss:nothing
mov     sp, word_4C4FA
sti
mov     bp, word_4C4FE
and     word ptr [bx+16h], 0FEFFh
dec     word_4BE50
cld
retn
push    ds
push    di
xor     di, di
mov     ds, di
assume ds:nothing
mov     di, 6Ch ; 'l'
push    word ptr [di]
push    word ptr [di+2]
cli
mov     word ptr [di], 1996h
mov     word ptr [di+2], cs
pushf
call    dword ptr cs:byte_10C1E+12h
cli
pop     word ptr [di+2]
pop     word ptr [di]
cmp     cs:byte_10C55, 0
jz      short loc_1198B
and     byte ptr ds:471h, 7Fh
mov     cs:byte_10C55, 0
push    ax
push    bx
push    si
xor     ah, ah
int     16h             ; KEYBOARD - READ CHAR FROM BUFFER, WAIT IF EMPTY
                        ; Return: AH = scan code, AL = character
pop     si
pop     bx
pop     ax

loc_1198B:
pop     di
pop     ds
assume ds:nothing
test    cs:byte_10C54, 1
jnz     short loc_119C9

locret_11995:
iret
or      cs:byte_10C54, 1
test    cs:byte_10C54, 82h
jnz     short loc_119BE
mov     cs:byte_10C55, 1
push    ds
mov     ds, cs:seg_10C1C
assume ds:seg091
mov     word_4C262, 1
mov     word_4C264, 0
pop     ds
assume ds:nothing
iret

loc_119BE:
or      cs:byte_10C54, 80h
jmp     cs:dword_10C48

loc_119C9:
or      cs:byte_10C54, 2
cmp     cs:word_10C52, 0
jnz     short locret_11995
push    ds
push    bx
test    cs:byte_10C54, 80h
jnz     short loc_119F7
mov     bx, seg seg091
mov     ds, bx
assume ds:seg091
cmp     byte_54340, 0
jz      short loc_119F7
mov     cs:byte_10C54, 82h
pop     bx
pop     ds
assume ds:nothing
jmp     short locret_11995

loc_119F7:
mov     ds, cs:seg_10C1C
assume ds:seg091
mov     bx, 58Eh
mov     [bx], ax
pop     word ptr [bx+2]
mov     [bx+4], cx
mov     [bx+6], dx
mov     [bx+0Ah], si
mov     [bx+0Ch], di
mov     [bx+8], bp
pop     word ptr [bx+0Eh]
mov     word ptr [bx+10h], es
pop     word ptr [bx+12h]
pop     word ptr [bx+14h]
pop     word ptr [bx+16h]
mov     word ptr [bx+1Ah], ss
mov     [bx+18h], sp
cli
mov     ss, word_4C282
assume ss:nothing
mov     sp, word_4C280
sti
mov     bp, word_4C27E
test    cs:byte_10C54, 80h
jnz     short loc_11AA0
mov     cs:byte_10C54, 82h
sti
call    sub_114D3
call    sub_1133B
mov     word_4C262, 1
mov     word_4C264, 0

loc_11A57:
push    word_4BE52
call    sub_3F541
or      ax, ax
jnz     short loc_11A76
mov     ax, word_4BE52

loc_11A67:
push    ax
call    sub_11AE6
pop     ax
jnz     short loc_11AA0
cmp     ax, word_4BE52
jz      short loc_11A67
jmp     short loc_11A57

loc_11A76:
push    word_4BE52
push    word_4BE50
push    ds
mov     ax, 9CAh
push    ax
call    sub_3F3F4
mov     bx, ax
or      bx, dx
jnz     short loc_11AAC

loc_11A8E:
mov     ax, word_4BE52
push    ax
call    sub_11AE6
pop     ax
jnz     short loc_11AA0
cmp     ax, word_4BE52
jz      short loc_11A76
jmp     short loc_11A57

loc_11AA0:
neg     word_4C264
mov     cs:byte_10C54, 0
jmp     short loc_11AC8

loc_11AAC:
mov     word_4C262, ax
mov     word_4C264, dx
call    sub_11434
mov     ax, word ptr dword_4C266
cmp     ax, word_4BE50
jnz     short loc_11A8E
mov     ax, word ptr dword_4C266+2
cmp     ax, word_4BE52
jnz     short loc_11A8E

loc_11AC8:
mov     ah, 51h
int     21h             ; DOS - 2+ internal - GET PSP SEGMENT
                        ; Return: BX = current PSP segment
mov     word_4BE5E, bx
mov     bx, word_4BE60
mov     ah, 50h
int     21h             ; DOS - 2+ internal - SET PSP SEGMENT
                        ; BX = segment address of new PSP
call    sub_11875
call    sub_11804
sti
neg     word_4C262
jmp     loc_10E14



sub_11AE6 proc near
mov     di, word_4BE50
mov     es, word_4BE52
assume es:nothing
cmp     word ptr es:[di], 21CDh
jz      short loc_11B44
cmp     word ptr es:[di], 13CDh
jz      short loc_11B44
cmp     word ptr es:[di], 10CDh
jz      short loc_11B44
push    cs:word_10C50
mov     cs:word_10C50, 1
call    sub_116D3
pop     cs:word_10C50
cmp     word_4BE50, 194Ch
jz      short loc_11B26

loc_11B1F:
test    cs:byte_10C54, 1
retn

loc_11B26:
mov     bx, cs
cmp     bx, word_4BE52
jnz     short loc_11B1F
push    cs:word_10C50
mov     cs:word_10C50, 1
call    near ptr sub_118B2
pop     cs:word_10C50
jmp     short loc_11B1F

loc_11B44:
mov     cs:word_10C52, 1
inc     di
inc     di
mov     al, es:[di]
mov     byte ptr es:[di], 0CCh
push    ax

loc_11B55:
push    es
push    di
push    cs:word_10C50
mov     cs:word_10C50, 3
call    near ptr sub_118B2
pop     cs:word_10C50
pop     di
pop     es
assume es:nothing
mov     dx, es
cmp     dx, word_4BE52
jnz     short loc_11B55
cmp     di, word_4BE50
jnz     short loc_11B55
pop     ax
mov     es:[di], al
mov     cs:word_10C52, 0
test    cs:byte_10C54, 1
retn
sub_11AE6 endp

inc     cs:word_10C52
pushf
call    dword ptr cs:byte_10C1E+22h
jmp     short loc_11BC1
inc     cs:word_10C52
pushf
call    dword ptr cs:byte_10C1E+1Ah
jmp     short loc_11BC1
byte_11BA7 db 0
cmp     cs:byte_11BA7, 0
jnz     short loc_11BD9
inc     cs:word_10C52
cmp     ah, 4Bh ; 'K'
jz      short loc_11BDE
clc
pushf
call    cs:dword_10C4C

loc_11BC1:
push    bp
mov     bp, sp
push    ax
lahf
mov     [bp+6], ah
pop     ax
pop     bp
dec     cs:word_10C52
test    cs:byte_10C54, 1
jnz     short loc_11BF2
iret

loc_11BD9:
jmp     cs:dword_10C4C

loc_11BDE:
inc     cs:byte_11BA7
pushf
call    cs:dword_10C4C
pushf
dec     cs:byte_11BA7
popf
jmp     short loc_11BC1

loc_11BF2:
jmp     loc_119C9



sub_11BF5 proc near
mov     si, 4
mov     di, 0C20h
mov     ax, 18EEh
push    ds
xor     bx, bx
mov     ds, bx
assume ds:nothing
push    cs
pop     es
assume es:seg000
movsw
movsw
pop     ds
assume ds:nothing
mov     es, bx
assume es:nothing
lea     di, [si-4]
cli
stosw
mov     ax, cs
stosw
sti
push    ds
pop     es
assume es:nothing
retn
sub_11BF5 endp




sub_11C16 proc near
mov     di, 4
mov     si, 0C20h
mov     ax, 18EEh
push    ds
xor     bx, bx
mov     es, bx
assume es:nothing
cmp     ax, es:[di]
jnz     short loc_11C2F
push    cs
pop     ds
assume ds:seg000
cli
movsw
movsw
sti

loc_11C2F:
pop     ds
assume ds:nothing
push    ds
pop     es
assume es:nothing
retn
sub_11C16 endp




sub_11C33 proc near
mov     word ptr ds:824Eh, 0FFFFh
mov     word ptr ds:824Ch, 0FFFFh
retn
sub_11C33 endp




sub_11C40 proc near
mov     dx, ds:824Eh
mov     ax, ds:824Ch
retn
sub_11C40 endp



; Attributes: bp-based frame

sub_11C48 proc far

arg_0= word ptr  6
arg_2= word ptr  8

push    bp
mov     bp, sp
push    ds
mov     ax, 9877h
push    ax
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_19911
pop     bp
retf    4
sub_11C48 endp



; Attributes: bp-based frame

sub_11C5D proc near

var_30= word ptr -30h
var_2E= word ptr -2Eh
var_2C= byte ptr -2Ch
var_16= word ptr -16h
var_14= word ptr -14h
var_12= word ptr -12h
var_10= word ptr -10h
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 30h
push    si
push    ss
lea     ax, [bp+var_30]
push    ax
call    sub_10411
push    ss
lea     ax, [bp+var_2C]
push    ax
call    sub_10431
push    [bp+arg_2]
push    [bp+arg_0]
mov     al, 0
push    ax
xor     ax, ax
push    ax
call    sub_105BB
mov     si, ax
push    [bp+var_2E]
push    [bp+var_30]
call    sub_10431
or      si, si
jz      short loc_11C99
mov     dx, 0FFFFh
mov     ax, dx
jmp     short loc_11CBA

loc_11C99:
mov     ax, [bp+var_12]
or      ax, [bp+var_10]
jz      short loc_11CB5
mov     ax, [bp+var_14]
xor     dx, dx
mov     dx, ax
xor     ax, ax
mov     bx, [bp+var_16]
xor     cx, cx
add     ax, bx
adc     dx, cx
jmp     short loc_11CBA

loc_11CB5:
mov     dx, 0FFFFh
mov     ax, dx

loc_11CBA:
pop     si
mov     sp, bp
pop     bp
retn    4
sub_11C5D endp



; Attributes: bp-based frame

sub_11CC1 proc far

arg_0= word ptr  6
arg_2= word ptr  8

push    bp
mov     bp, sp
push    [bp+arg_2]
push    [bp+arg_0]
push    cs
call    near ptr sub_11C48
or      ax, ax
jz      short loc_11CD7
call    sub_11C40
jmp     short loc_11CE0

loc_11CD7:
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_11C5D

loc_11CE0:
pop     bp
retf    4
sub_11CC1 endp



; Attributes: bp-based frame

sub_11CE4 proc near

var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
mov     di, [bp+arg_2]
mov     ax, [bp+arg_0]
and     ax, 0FFFFh
mov     [bp+var_2], ax
push    ds
push    [bp+arg_4]
mov     ax, 2
push    ax
call    sub_106E6
mov     si, ax
mov     ax, si
or      ax, ax
jle     short loc_11D1E
mov     cx, [bp+var_2]
mov     dx, di
mov     ax, 5701h
mov     bx, si
call    sub_10BD7
push    si
call    sub_10728

loc_11D1E:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    6
sub_11CE4 endp



; Attributes: bp-based frame

sub_11D26 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    ds
push    [bp+arg_0]
call    sub_11C5D
mov     ds:824Eh, dx
mov     ds:824Ch, ax
pop     bp
retn    2
sub_11D26 endp



; Attributes: bp-based frame

sub_11D3B proc near

var_C= byte ptr -0Ch
var_B= byte ptr -0Bh
var_9= byte ptr -9
var_8= word ptr -8
var_6= byte ptr -6
var_5= byte ptr -5
var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 0Ch
push    ss
lea     ax, [bp+var_8]
push    ax
call    sub_46805
push    ss
lea     ax, [bp+var_C]
push    ax
call    sub_4681A
mov     ax, [bp+var_8]
add     ax, 0F844h
and     word ptr [bp-1], 0FF01h
and     ax, 7Fh
shl     ax, 1
or      [bp-1], ax
mov     al, [bp+var_5]
cbw
and     [bp+var_2], 0FE1Fh
and     ax, 0Fh
mov     cx, 5
shl     ax, cl
or      [bp+var_2], ax
mov     al, [bp+var_6]
cbw
and     [bp+var_2], 0FFE0h
and     ax, 1Fh
or      [bp+var_2], ax
mov     al, [bp+var_B]
mov     ah, 0
and     word ptr [bp-3], 0FF07h
and     ax, 1Fh
shl     ax, 1
shl     ax, 1
shl     ax, 1
or      [bp-3], ax
mov     al, [bp+var_C]
mov     ah, 0
and     [bp+var_4], 0F81Fh
and     ax, 3Fh
mov     cx, 5
shl     ax, cl
or      [bp+var_4], ax
mov     al, [bp+var_9]
shr     al, 1
mov     ah, 0
and     [bp+var_4], 0FFE0h
and     ax, 1Fh
or      [bp+var_4], ax
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]
mov     ds:824Eh, dx
mov     ds:824Ch, ax
mov     sp, bp
pop     bp
retn
sub_11D3B endp



; Attributes: bp-based frame

sub_11DD9 proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 4
push    si
mov     si, [bp+arg_2]
mov     bx, [bp+arg_0]
mov     word ptr [bx], 1
jmp     short loc_11DED

loc_11DEC:
inc     si

loc_11DED:
cmp     byte ptr [si], 20h ; ' '
jz      short loc_11DEC
cmp     byte ptr [si], 9
jz      short loc_11DEC
mov     [bp+var_2], 0
mov     [bp+var_4], 0
jmp     short loc_11E4F

loc_11E03:
cmp     [bp+var_2], 1999h
ja      short loc_11E59
jnz     short loc_11E13
cmp     [bp+var_4], 9999h
ja      short loc_11E59

loc_11E13:
cmp     [bp+var_2], 1999h
jnz     short loc_11E26
cmp     [bp+var_4], 9999h
jnz     short loc_11E26
cmp     byte ptr [si], 35h ; '5'
jg      short loc_11E59

loc_11E26:
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]
xor     cx, cx
mov     bx, 0Ah
call    sub_46A18
push    dx
push    ax
mov     al, [si]
cbw
cwd
pop     bx
pop     cx
add     bx, ax
adc     cx, dx
add     bx, 0FFD0h
adc     cx, 0FFFFh
mov     [bp+var_2], cx
mov     [bp+var_4], bx
inc     si

loc_11E4F:
cmp     byte ptr [si], 30h ; '0'
jl      short loc_11E59
cmp     byte ptr [si], 39h ; '9'
jle     short loc_11E03

loc_11E59:
cmp     byte ptr [si], 0
jz      short loc_11E65
mov     bx, [bp+arg_0]
mov     word ptr [bx], 0

loc_11E65:
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]
pop     si
mov     sp, bp
pop     bp
retn    4
sub_11DD9 endp



; Attributes: bp-based frame

sub_11E72 proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 4
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_11DD9
mov     [bp+var_2], dx
mov     [bp+var_4], ax
or      dx, dx
jb      short loc_11E99
ja      short loc_11E92
cmp     ax, 0FFFFh
jbe     short loc_11E99

loc_11E92:
mov     bx, [bp+arg_0]
mov     word ptr [bx], 0

loc_11E99:
mov     ax, [bp+var_4]
mov     sp, bp
pop     bp
retn    4
sub_11E72 endp



; Attributes: bp-based frame

sub_11EA2 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, ds:1F85h

loc_11EAA:
test    word ptr [si], 0FF00h
jnz     short loc_11EBC
mov     ax, [bp+arg_0]
and     ax, 0FFh
cmp     ax, [si]
jz      short loc_11ECB
jmp     short loc_11EC3

loc_11EBC:
mov     ax, [si]
cmp     ax, [bp+arg_0]
jz      short loc_11ECB

loc_11EC3:
add     si, 3
cmp     word ptr [si], 0
jnz     short loc_11EAA

loc_11ECB:
mov     al, [si+2]
cbw
pop     si
pop     bp
retn    2
sub_11EA2 endp



; Attributes: bp-based frame

sub_11ED4 proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
push    [bp+arg_4]
push    ds
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_10740
cmp     ax, [bp+arg_0]
jz      short loc_11F0A
mov     ax, 145Ch
push    ax
push    word ptr ds:8250h
call    sub_19065
push    ds
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
mov     ax, 1
push    ax
call    sub_4698B

loc_11F0A:
pop     bp
retn    6
sub_11ED4 endp ; sp-analysis failed



; Attributes: bp-based frame

sub_11F0E proc near

var_54= byte ptr -54h
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 54h
push    si
mov     si, [bp+arg_2]
push    si
lea     ax, [bp+var_54]
push    ax
push    [bp+arg_0]
call    sub_19448
inc     ax
push    ax
call    sub_11ED4
lea     ax, [bp+var_54]
push    ax
push    [bp+arg_0]
call    sub_19497
or      ax, ax
jnz     short loc_11F74
push    si
lea     ax, [bp+var_54]
push    ax
mov     ax, 7
push    ax
call    sub_11ED4
lea     ax, [bp+var_54]
push    ax
mov     ax, 0ABh
push    ax
call    sub_19497
or      ax, ax
jnz     short loc_11F74
push    si
lea     ax, [bp+var_2]
push    ax
mov     ax, 2
push    ax
call    sub_11ED4
mov     ax, [bp+var_2]
and     ax, 0FF00h
mov     dx, ds:1B3Eh
and     dx, 0FF00h
cmp     ax, dx
jnz     short loc_11F74
mov     ax, 1
jmp     short loc_11F81

loc_11F74:
mov     ax, 1477h
push    ax
push    word ptr ds:8250h
call    sub_19065
xor     ax, ax

loc_11F81:
pop     si
mov     sp, bp
pop     bp
retn    4
sub_11F0E endp



; Attributes: bp-based frame

sub_11F88 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
jmp     short loc_11FA2

loc_11F91:
mov     ax, [si]
and     ax, 7FFFh
cmp     ax, [bp+arg_2]
jnz     short loc_11F9F
mov     ax, si
jmp     short loc_11FA9

loc_11F9F:
add     si, 6

loc_11FA2:
cmp     word ptr [si], 0FFFFh
jnz     short loc_11F91
xor     ax, ax

loc_11FA9:
pop     si
pop     bp
retn    4
sub_11F88 endp



; Attributes: bp-based frame

sub_11FAE proc near

var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
sub     sp, 0Ah
push    si
push    di
mov     [bp+var_4], 0
mov     ax, [bp+arg_4]
mov     ds:8250h, ax
push    ds
inc     word ptr ds:1DE8h
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jz      short loc_11FDE
jmp     loc_1209F

loc_11FDE:
push    ds
push    [bp+arg_4]
xor     ax, ax
push    ax
call    sub_106E6
mov     di, ax
or      di, di
jge     short loc_11FFB
mov     ax, 0E30h
push    ax
push    [bp+arg_4]
call    sub_19065
jmp     loc_120A3

loc_11FFB:
push    di
push    [bp+arg_0]
call    sub_11F0E
or      ax, ax
jnz     short loc_12009
jmp     loc_1209B

loc_12009:
push    ds
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jz      short loc_12022
jmp     loc_1209F

loc_12022:
push    di
lea     ax, [bp+var_A]
push    ax
mov     ax, 4
push    ax
call    sub_11ED4
cmp     [bp+var_A], 0FFFFh
jz      short loc_12096
push    [bp+var_A]
push    [bp+arg_2]
call    sub_11F88
mov     si, ax
mov     ax, si
or      ax, ax
jz      short loc_12085
push    ds
mov     ax, [si+4]
mov     [bp+var_2], ax
push    ax
mov     ax, [si+2]
mov     [bp+var_6], ax
push    ax
mov     al, 0
push    ax
call    sub_46C10
mov     ax, [bp+var_8]
cmp     ax, [bp+var_6]
jnb     short loc_12067
mov     [bp+var_6], ax

loc_12067:
push    di
push    [bp+var_2]
push    [bp+var_6]
call    sub_11ED4
push    di
mov     ax, [bp+var_8]
sub     ax, [bp+var_6]
xor     dx, dx
push    dx
push    ax
mov     ax, 1
push    ax
call    sub_10792
jmp     short loc_12022

loc_12085:
push    di
mov     ax, [bp+var_8]
xor     dx, dx
push    dx
push    ax
mov     ax, 1
push    ax
call    sub_10792
jmp     short loc_12022

loc_12096:
mov     [bp+var_4], 1

loc_1209B:
push    di
call    sub_10728

loc_1209F:
dec     word ptr ds:1DE8h

loc_120A3:
mov     ax, [bp+var_4]
pop     di
pop     si
mov     sp, bp
pop     bp
retn    6
sub_11FAE endp



; Attributes: bp-based frame

sub_120AE proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    si
push    di
xor     si, si
push    [bp+arg_0]
call    sub_19448
mov     di, ax
inc     di
push    [bp+arg_2]
push    ds
push    [bp+arg_0]
push    di
call    sub_10769
cmp     ax, di
jnz     short loc_120F5
push    [bp+arg_2]
push    ds
mov     ax, 0ABh
push    ax
mov     ax, 7
push    ax
call    sub_10769
cmp     ax, 7
jnz     short loc_120F5
push    [bp+arg_2]
push    ds
mov     ax, 1B3Eh
push    ax
mov     ax, 2
push    ax
call    sub_10769
cmp     ax, 2
jz      short loc_120F8

loc_120F5:
mov     si, 1

loc_120F8:
mov     ax, si
pop     di
pop     si
pop     bp
retn    4
sub_120AE endp



; Attributes: bp-based frame

sub_12100 proc near

var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
mov     si, [bp+arg_2]
xor     di, di
mov     ax, [bp+arg_4]
mov     ds:8250h, ax
push    ds
push    ax
mov     ax, 3
push    ax
call    sub_106E6
mov     [bp+var_2], ax
or      ax, ax
jge     short loc_12131
mov     ax, 1494h
push    ax
push    word ptr ds:8250h
call    sub_19065
jmp     loc_1219E

loc_12131:
push    [bp+var_2]
push    [bp+arg_0]
call    sub_120AE
mov     di, ax
jmp     short loc_1217D

loc_1213E:
mov     dx, [si]
cmp     dx, 0FFFFh
jz      short loc_1214B
test    dx, 8000h
jnz     short loc_12175

loc_1214B:
push    [bp+var_2]
push    ds
push    si
mov     ax, 4
push    ax
call    sub_10769
cmp     ax, 4
jnz     short loc_1216E
push    [bp+var_2]
push    ds
push    word ptr [si+4]
push    word ptr [si+2]
call    sub_10769
cmp     ax, [si+2]
jz      short loc_12173

loc_1216E:
mov     di, 1
jmp     short loc_12175

loc_12173:
xor     di, di

loc_12175:
cmp     word ptr [si], 0FFFFh
jz      short loc_12181
add     si, 6

loc_1217D:
or      di, di
jz      short loc_1213E

loc_12181:
push    [bp+var_2]
call    sub_10728
or      di, di
jz      short loc_121A2
mov     ax, 14A2h
push    ax
push    word ptr ds:8250h
call    sub_19065
push    ds
push    word ptr ds:8250h
call    sub_10394

loc_1219E:
xor     ax, ax
jmp     short loc_121A5

loc_121A2:
mov     ax, 1

loc_121A5:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    6
sub_12100 endp




sub_121AD proc near
call    sub_1D1C6
mov     dx, ds:91D3h
cmp     word ptr ds:0F2h, 19h
jle     short loc_121D7
test    dx, 14h
jz      short loc_121D7
test    dx, 4
jz      short loc_121CF
mov     word ptr ds:0F2h, 2Bh ; '+'
jmp     short locret_121DD

loc_121CF:
mov     word ptr ds:0F2h, 32h ; '2'
jmp     short locret_121DD

loc_121D7:
mov     word ptr ds:0F2h, 19h

locret_121DD:
retn
sub_121AD endp



; Attributes: bp-based frame

sub_121DE proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     word ptr ds:40DAh, 0Ch
mov     ax, 0FFFFh
push    ax
call    sub_156D7
push    [bp+arg_0]
mov     ax, 0F6h
push    ax
mov     ax, 22h ; '"'
push    ax
call    sub_12100
mov     si, ax
mov     ax, si
cmp     ax, 1
jnz     short loc_1221C
mov     ax, 0F6h
push    ax
call    sub_12397
mov     ds:8254h, ax
mov     ax, 9963h
push    ax
push    [bp+arg_0]
call    sub_19C57

loc_1221C:
mov     ax, si
pop     si
pop     bp
retn    2
sub_121DE endp



; Attributes: bp-based frame

sub_12223 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     word ptr ds:40DAh, 0Eh
mov     ax, 0FFFFh
push    ax
call    sub_156D7
push    [bp+arg_0]
mov     ax, 0F6h
push    ax
mov     ax, 22h ; '"'
push    ax
call    sub_11FAE
mov     si, ax
mov     ax, si
cmp     ax, 1
jnz     short loc_12261
mov     ax, 0F6h
push    ax
call    sub_12397
mov     ds:8254h, ax
mov     ax, 9963h
push    ax
push    [bp+arg_0]
call    sub_19C57

loc_12261:
mov     ax, si
pop     si
pop     bp
retn    2
sub_12223 endp



; Attributes: bp-based frame

sub_12268 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
mov     si, [bp+arg_0]
or      si, si
jnz     short loc_1227E
cmp     word ptr ds:23BBh, 0
jnz     short loc_1227E
jmp     loc_122F6

loc_1227E:
or      si, si
jz      short loc_1228C
call    sub_14FFE
or      ax, ax
jnz     short loc_122A3
jmp     loc_12342

loc_1228C:
cmp     word ptr ds:1D2Eh, 0
jnz     short loc_122A3
call    sub_153A6
mov     di, ax
mov     ax, di
or      ax, ax
jge     short loc_122A3
mov     ax, di
jmp     loc_12353

loc_122A3:
or      si, si
jz      short loc_122F6
mov     ax, 33Ch
push    ax
push    word ptr ds:9111h
call    sub_123DA
or      ax, ax
jz      short loc_122F6
mov     ax, 9113h
push    ax
call    sub_17F15
or      ax, ax
jnz     short loc_122F6
mov     word ptr ds:1DD3h, 11Ah
xor     ax, ax
push    ax
mov     ax, 0C64h
push    ax
mov     ax, 157Ah
push    ax
mov     ax, 0C81h
push    ax
mov     ax, 0Ah
push    ax
mov     ax, 14h
push    ax
mov     ax, 4
push    ax
call    sub_18EAD
add     sp, 0Eh
cmp     al, 59h ; 'Y'
jnz     short loc_12342
mov     ax, 33Ch
push    ax
call    sub_12397
mov     ds:9111h, ax

loc_122F6:
cmp     word ptr ds:23BDh, 0
jz      short loc_12351
mov     ax, 0F6h
push    ax
push    word ptr ds:8254h
call    sub_123DA
or      ax, ax
jz      short loc_12351
mov     ax, 9963h
push    ax
call    sub_121DE
or      ax, ax
jnz     short loc_12351
mov     word ptr ds:1DD3h, 11Bh
xor     ax, ax
push    ax
mov     ax, 0C64h
push    ax
mov     ax, 1591h
push    ax
mov     ax, 0C81h
push    ax
mov     ax, 0Ah
push    ax
mov     ax, 14h
push    ax
mov     ax, 4
push    ax
call    sub_18EAD
add     sp, 0Eh
cmp     al, 59h ; 'Y'
jz      short loc_12347

loc_12342:
mov     ax, 0FFFFh
jmp     short loc_12353

loc_12347:
mov     ax, 0F6h
push    ax
call    sub_12397
mov     ds:8254h, ax

loc_12351:
xor     ax, ax

loc_12353:
pop     di
pop     si
pop     bp
retn    2
sub_12268 endp



; Attributes: bp-based frame

sub_12359 proc near

arg_0= byte ptr  4

push    bp
mov     bp, sp
push    si
mov     si, 8
mov     al, [bp+arg_0]
mov     ah, 0
xor     ax, ds:8252h
mov     ds:8252h, ax
jmp     short loc_1238B

loc_1236E:
test    word ptr ds:8252h, 1
jz      short loc_12383
mov     ax, ds:8252h
shr     ax, 1
xor     ax, 8404h
mov     ds:8252h, ax
jmp     short loc_1238B

loc_12383:
mov     ax, ds:8252h
shr     ax, 1
mov     ds:8252h, ax

loc_1238B:
mov     ax, si
dec     si
or      ax, ax
jnz     short loc_1236E
pop     si
pop     bp
retn    2
sub_12359 endp



; Attributes: bp-based frame

sub_12397 proc near

var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
mov     si, [bp+arg_0]
mov     word ptr ds:8252h, 0
jmp     short loc_123CA

loc_123AA:
mov     di, [si+2]
mov     ax, [si+4]
mov     [bp+var_2], ax
jmp     short loc_123C0

loc_123B5:
mov     bx, [bp+var_2]
inc     [bp+var_2]
push    word ptr [bx]
call    sub_12359

loc_123C0:
mov     ax, di
dec     di
or      ax, ax
jnz     short loc_123B5
add     si, 6

loc_123CA:
cmp     word ptr [si], 0FFFFh
jnz     short loc_123AA
mov     ax, ds:8252h
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_12397 endp



; Attributes: bp-based frame

sub_123DA proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    [bp+arg_2]
call    sub_12397
cmp     ax, [bp+arg_0]
jz      short loc_123ED
mov     ax, 1
jmp     short loc_123EF

loc_123ED:
xor     ax, ax

loc_123EF:
pop     bp
retn    4
sub_123DA endp



; Attributes: bp-based frame

sub_123F3 proc near

var_52= word ptr -52h
var_50= byte ptr -50h
var_1= byte ptr -1

push    bp
mov     bp, sp
sub     sp, 52h
push    si
call    sub_10490
mov     [bp+var_1], al
cmp     byte ptr ds:91CDh, 0
jz      short loc_1241C
mov     al, ds:91CDh
cmp     al, [bp+var_1]
jnz     short loc_12416
mov     byte ptr ds:91CDh, 0
jmp     short loc_1241C

loc_12416:
mov     al, ds:91CDh
mov     [bp+var_1], al

loc_1241C:
mov     byte ptr [bp+var_52], 2Eh ; '.'
mov     al, ds:226Eh
mov     byte ptr [bp+var_52+1], al
mov     ax, [bp+var_52]
cmp     ax, ds:9179h
jnz     short loc_1243C
mov     ax, 9179h
push    ax
mov     ax, 917Bh
push    ax
call    sub_19458
jmp     short loc_1248E

loc_1243C:              ; EQUIPMENT DETERMINATION
int     11h             ; Return: AX = equipment flag bits
test    al, 1
jz      short loc_1244C
mov     cl, 6
shr     al, cl
and     al, 3
inc     al
jmp     short loc_1244E

loc_1244C:
mov     al, 0

loc_1244E:
add     al, 41h ; 'A'
cmp     al, [bp+var_1]
ja      short loc_1248E
push    word ptr ds:91CDh
push    ss
lea     ax, [bp+var_52]
push    ax
call    sub_10534
lea     ax, [bp+var_52]
push    ax
call    sub_19448
mov     si, ax
add     si, 0FFFEh
push    ss
lea     ax, [bp+var_50]
push    ax
push    ds
mov     ax, 9179h
push    ax
push    si
call    sub_46E7B
or      ax, ax
jnz     short loc_1248E
mov     ax, 9179h
push    ax
mov     ax, si
add     ax, 9179h
push    ax
call    sub_19458

loc_1248E:
pop     si
mov     sp, bp
pop     bp
retn
sub_123F3 endp



; Attributes: bp-based frame

sub_12493 proc near

var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
mov     ax, 91CDh
push    ax
call    sub_19448
mov     di, ax
push    di
mov     ax, 9170h
push    ax
call    sub_19448
pop     di
add     di, ax
push    di
mov     ax, 91C8h
push    ax
call    sub_19448
pop     di
add     di, ax
mov     ax, 9179h
push    ax
call    sub_19448
mov     [bp+var_2], ax
mov     ax, di
add     ax, [bp+var_2]
cmp     ax, [bp+arg_0]
jle     short loc_1250D
mov     ax, [bp+arg_0]
sub     ax, di
mov     si, [bp+var_2]
sub     si, ax
add     si, 917Dh
jmp     short loc_124EA

loc_124DE:
mov     bx, si
inc     si
push    word ptr [bx]
call    sub_19729
or      al, al
jnz     short loc_124EF

loc_124EA:
cmp     byte ptr [si], 0
jnz     short loc_124DE

loc_124EF:
sub     si, 5
mov     ax, si
inc     ax
push    ax
mov     ax, 1B40h
push    ax
call    sub_19458
mov     al, ds:226Eh
mov     [si+4], al
mov     [si], al
mov     ax, 9179h
push    ax
push    si
call    sub_19458

loc_1250D:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_12493 endp



; Attributes: bp-based frame

sub_12515 proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
push    [bp+arg_4]
call    sub_19C1B
call    sub_123F3
push    [bp+arg_0]
call    sub_12493
push    [bp+arg_2]
call    sub_19C39
pop     bp
retn    6
sub_12515 endp

push    ax
push    bx
push    cx
push    dx
push    es
push    ds
push    si
push    di
push    bp
mov     bp, seg seg091
mov     ds, bp
assume ds:seg091
cmp     word_53B0A, 0
jz      short loc_12556
mov     bh, 0
mov     ah, 3
call    sub_10BFC
dec     dh
mov     bh, 0
mov     ah, 2
call    sub_10BFC

loc_12556:
pop     bp
pop     di
pop     si
pop     ds
assume ds:nothing
pop     es
pop     dx
pop     cx
pop     bx
pop     ax
iret
push    ax
push    bx
push    cx
push    dx
push    es
push    ds
push    si
push    di
push    bp
mov     bp, seg seg091
mov     ds, bp
assume ds:seg091
xor     ax, ax
mov     es, ax
assume es:nothing
mov     bx, 471h
and     byte ptr es:[bx], 7Fh
mov     word_53B0D, 1
pop     bp
pop     di
pop     si
pop     ds
assume ds:nothing
pop     es
assume es:nothing
pop     dx
pop     cx
pop     bx
pop     ax
iret



sub_12589 proc near
mov     ax, 3300h
int     21h             ; DOS - EXTENDED CONTROL-BREAK CHECKING
                        ; AL = 00h get state / 01h set state / 02h set AND get
                        ; DL = 00h for OFF or 01h for ON
mov     al, dl
mov     ds:825Ch, al
mov     word ptr ds:825Dh, 0
mov     ax, 3301h
mov     dl, 0
int     21h             ; DOS - EXTENDED CONTROL-BREAK CHECKING
                        ; AL = 00h get state / 01h set state / 02h set AND get
                        ; DL = 00h for OFF or 01h for ON
mov     ax, 1Bh
push    ax
call    sub_468C2
mov     ds:8261h, dx
mov     ds:825Fh, ax
mov     ax, 1Bh
push    ax
push    cs
mov     ax, 2560h
push    ax
call    sub_468D4
mov     ax, 23h ; '#'
push    ax
call    sub_468C2
mov     ds:8258h, dx
mov     ds:8256h, ax
mov     ax, 23h ; '#'
push    ax
push    cs
mov     ax, 2531h
push    ax
call    sub_468D4
retn
sub_12589 endp




sub_125DD proc near
mov     ax, 1Bh
push    ax
push    word ptr ds:8261h
push    word ptr ds:825Fh
call    sub_468D4
mov     ax, 23h ; '#'
push    ax
push    word ptr ds:8258h
push    word ptr ds:8256h
call    sub_468D4
mov     ax, 3301h
mov     dl, ds:825Ch
int     21h             ; DOS - EXTENDED CONTROL-BREAK CHECKING
                        ; AL = 00h get state / 01h set state / 02h set AND get
                        ; DL = 00h for OFF or 01h for ON
retn
sub_125DD endp




sub_12609 proc near
mov     word ptr ds:40DAh, 1
mov     word ptr ds:1DD3h, 0F3h
call    sub_157A7
and     ax, 0FFh
cmp     ax, 3
jz      short loc_12627
cmp     word ptr ds:825Dh, 0
jz      short loc_12635

loc_12627:
call    sub_15852
mov     word ptr ds:825Dh, 0
mov     ax, 1
jmp     short locret_12637

loc_12635:
xor     ax, ax

locret_12637:
retn
sub_12609 endp

push    ax
push    bx
push    cx
push    dx
push    es
push    ds
push    si
push    di
push    bp
mov     bp, seg seg091
mov     ds, bp
assume ds:seg091
pop     bp
pop     di
pop     si
pop     ds
assume ds:nothing
pop     es
pop     dx
pop     cx
pop     bx
pop     ax
iret


; Attributes: bp-based frame

sub_12650 proc near

var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 4
push    si
xor     si, si
jmp     short loc_1267A

loc_1265B:
mov     ax, 4400h
mov     bx, si
xor     cx, cx
call    sub_10BD7
mov     ax, 4401h
mov     bx, si
xor     cx, cx
or      dx, 40h
xor     dh, dh
call    sub_10BD7
inc     si

loc_1267A:
cmp     si, 5
jl      short loc_1265B
mov     ax, 10h
push    ax
call    sub_468C2
mov     [bp+var_2], dx
mov     [bp+var_4], ax
mov     ax, 10h
push    ax
push    cs
mov     ax, 2638h
push    ax
call    sub_468D4
mov     ah, 0Bh
int     21h             ; DOS - CHECK STANDARD INPUT STATUS
                        ; Return: AL = FFh if character available
                        ; 00h if no character
mov     ax, 10h
push    ax
push    [bp+var_2]
push    [bp+var_4]
call    sub_468D4
pop     si
mov     sp, bp
pop     bp
retn
sub_12650 endp



; Attributes: bp-based frame

sub_126B4 proc near

var_50= byte ptr -50h
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 50h
push    si
push    di
xor     di, di
cmp     [bp+arg_0], di
jg      short loc_126C6
jmp     loc_1279A

loc_126C6:
push    ss
lea     ax, [bp+var_50]
push    ax
push    [bp+arg_0]
call    sub_401D4
push    dx
push    ax
call    sub_46D76
jmp     loc_12791

loc_126DD:
push    ss
lea     ax, [bp+var_50]
push    ax
call    sub_11C48
or      ax, ax
jnz     short loc_126F7
push    ss
lea     ax, [bp+var_50]
push    ax
call    sub_105F1
or      ax, ax
jz      short loc_1272F

loc_126F7:
push    ss
lea     ax, [bp+var_50]
push    ax
push    [bp+arg_2]
call    sub_148A4
or      di, di
jnz     short loc_12709
jmp     loc_1279A

loc_12709:
lea     ax, [bp+var_50]
push    ax
lea     ax, [bp+var_50]
push    ax
call    sub_19C57
push    [bp+arg_0]
push    ss
lea     ax, [bp+var_50]
push    ax
call    sub_40037
push    [bp+arg_0]
lea     ax, [bp+var_50]
push    ax
call    sub_12A4F
jmp     short loc_1279A

loc_1272F:
mov     di, 1
mov     word ptr ds:1DD3h, 11Ch
mov     ax, 0EA6h
push    ax
lea     ax, [bp+var_50]
push    ax
mov     ax, 5
push    ax
push    ax
mov     ax, 50h ; 'P'
push    ax
mov     ax, 28h ; '('
push    ax
call    sub_18E6D
mov     si, ax
mov     ax, si
or      ax, ax
jl      short loc_1278D
cmp     [bp+var_50], 0
jnz     short loc_12773
push    [bp+arg_0]
call    sub_12A82
push    [bp+arg_0]
push    ss
lea     ax, [bp+var_50]
push    ax
call    sub_40037
jmp     short loc_1279A

loc_12773:
lea     ax, [bp+var_50]
push    ax
lea     ax, [bp+var_50]
push    ax
xor     ax, ax
push    ax
mov     ax, 0E56h
push    ax
call    sub_14398
mov     si, ax
mov     ax, si
or      ax, ax
jge     short loc_12791

loc_1278D:
mov     ax, si
jmp     short loc_1279D

loc_12791:
cmp     [bp+var_50], 0
jz      short loc_1279A
jmp     loc_126DD

loc_1279A:
mov     ax, 600h

loc_1279D:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    4
sub_126B4 endp



; Attributes: bp-based frame

sub_127A5 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
call    sub_40033
mov     di, ax
mov     si, 1
jmp     short loc_127CE

loc_127B6:
push    ds
push    [bp+arg_0]
push    si
call    sub_401D4
push    dx
push    ax
call    sub_19911
or      ax, ax
jz      short loc_127CD
mov     ax, si
jmp     short loc_127D4

loc_127CD:
inc     si

loc_127CE:
cmp     si, di
jle     short loc_127B6
xor     ax, ax

loc_127D4:
pop     di
pop     si
pop     bp
retn    2
sub_127A5 endp



; Attributes: bp-based frame

sub_127DA proc near

var_100= byte ptr -100h
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 100h
push    ss
lea     ax, [bp+var_100]
push    ax
push    [bp+arg_2]
call    sub_3FDE1
push    dx
push    ax
call    sub_46D76
mov     ax, ds:4A0Ch
mov     ds:93C8h, ax
lea     ax, [bp+var_100]
push    ax
mov     ax, [bp+arg_2]
sub     ax, ds:8266h
inc     ax
push    ax
push    [bp+arg_0]
mov     al, ds:4A16h
mov     ah, 0
mov     dl, ds:4A14h
mov     dh, 0
sub     ax, dx
dec     ax
push    ax
call    sub_1B181
mov     sp, bp
pop     bp
retn    4
sub_127DA endp




sub_12825 proc near
push    si
push    di
mov     word ptr ds:9166h, 0
mov     ax, ds:8276h
cmp     ax, ds:8272h
jle     short loc_1283C
mov     ax, ds:8272h
mov     ds:8276h, ax

loc_1283C:
mov     ax, ds:8276h
cmp     ax, ds:8266h
jge     short loc_12848
mov     ds:8266h, ax

loc_12848:
cmp     word ptr ds:8266h, 0
jnz     short loc_12855
mov     word ptr ds:8266h, 1

loc_12855:
mov     ax, ds:8266h
add     ax, ds:8270h
cmp     ax, ds:8276h
jg      short loc_12874
mov     ax, ds:8266h
add     ax, ds:8270h
mov     dx, ds:8276h
sub     dx, ax
inc     dx
add     ds:8266h, dx

loc_12874:
mov     si, ds:8266h
mov     di, 1
jmp     short loc_12891

loc_1287D:
push    si
cmp     si, ds:8276h
jnz     short loc_12889
mov     ax, 2
jmp     short loc_1288B

loc_12889:
xor     ax, ax

loc_1288B:
push    ax
call    sub_127DA
inc     si
inc     di

loc_12891:
cmp     di, ds:8270h
jle     short loc_1287D
pop     di
pop     si
retn
sub_12825 endp



; Attributes: bp-based frame

sub_1289A proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     word ptr ds:9166h, 0
push    [bp+arg_0]
xor     ax, ax
push    ax
call    sub_127DA
pop     bp
retn    2
sub_1289A endp




sub_128B0 proc near
mov     ax, ds:8276h
cmp     ax, ds:8266h
jl      short loc_128C6
mov     ax, ds:8266h
add     ax, ds:8270h
cmp     ax, ds:8276h
jg      short loc_128CB

loc_128C6:
call    sub_12825
jmp     short locret_128D6

loc_128CB:
push    word ptr ds:8276h
mov     ax, 2
push    ax
call    sub_127DA

locret_128D6:
retn
sub_128B0 endp



; Attributes: bp-based frame

sub_128D7 proc near

var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
mov     di, ds:8276h
mov     ax, ds:8266h
mov     [bp+var_4], ax
xor     ax, ax
mov     ds:9166h, ax
mov     [bp+var_2], ax

loc_128F1:
mov     word ptr ds:40DAh, 0Fh
mov     word ptr ds:1DD3h, 11Dh
push    word ptr ds:8272h
push    word ptr ds:8270h
mov     ax, 8276h
push    ax
mov     ax, 8266h
push    ax
call    sub_1927C
mov     si, ax
mov     ax, ds:8266h
cmp     ax, [bp+var_4]
jz      short loc_1291F
call    sub_12825
jmp     short loc_12938

loc_1291F:
mov     ax, ds:8276h
cmp     ax, di
jz      short loc_1292C
push    di
call    sub_1289A
jmp     short loc_12935

loc_1292C:
mov     ax, [bp+var_2]
cmp     ax, ds:9166h
jz      short loc_12938

loc_12935:
call    sub_128B0

loc_12938:
mov     ax, ds:8266h
mov     [bp+var_4], ax
mov     di, ds:8276h
mov     ax, ds:9166h
mov     [bp+var_2], ax
cmp     si, 0FFFFh
jl      short loc_12960
cmp     si, 500h
jz      short loc_12960
cmp     si, 4
jz      short loc_12960
cmp     si, 5
jnz     short loc_128F1
mov     si, 0FFFFh

loc_12960:
mov     ax, si
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_128D7 endp




sub_12968 proc near
push    si
push    di
mov     di, 0Ch
mov     si, 1
jmp     short loc_12986

loc_12972:
push    si
call    sub_3FDE1
push    dx
push    ax
call    sub_46E60
cmp     ax, di
jbe     short loc_12985
mov     di, ax

loc_12985:
inc     si

loc_12986:
cmp     si, ds:8272h
jle     short loc_12972
cmp     di, 28h ; '('
jg      short loc_12995
mov     ax, di
jmp     short loc_12997

loc_12995:
mov     al, 28h ; '('

loc_12997:
mov     dl, ds:4A16h
sub     dl, al
add     dl, 0FDh
mov     ds:4A14h, dl
mov     al, ds:4A15h
mov     dx, si
add     al, dl
mov     ds:4A17h, al
cmp     al, 10h
jbe     short loc_129B7
mov     byte ptr ds:4A17h, 10h

loc_129B7:
mov     al, ds:4A17h
mov     ah, 0
mov     dl, ds:4A15h
mov     dh, 0
sub     ax, dx
dec     ax
mov     ds:8270h, ax
pop     di
pop     si
retn
sub_12968 endp



; Attributes: bp-based frame

sub_129CB proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, 0FFFFh
call    sub_40223
mov     ax, 1
mov     ds:8276h, ax
mov     ds:8266h, ax
call    sub_3FBAD
mov     ds:8272h, ax
call    sub_12968
push    ds
inc     word ptr ds:1DE8h
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jz      short loc_12A0A
mov     si, 0FFFFh
jmp     short loc_12A38

loc_12A0A:
mov     ax, 10h
push    ax
call    sub_1ACE5
mov     ax, 1
push    ax
call    sub_1DCE5
call    sub_12825
call    sub_128D7
mov     si, ax
mov     ax, si
cmp     ax, 4
jnz     short loc_12A38
push    word ptr ds:8276h
call    sub_3FFCD
mov     bx, [bp+arg_0]
mov     [bx], ax
mov     [bx+2], dx

loc_12A38:
dec     word ptr ds:1DE8h
mov     ax, 10h
push    ax
call    sub_1AD85
call    sub_402B3
mov     ax, si
pop     si
pop     bp
retn    2
sub_129CB endp



; Attributes: bp-based frame

sub_12A4F proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    si
push    di
mov     si, 82DAh
mov     di, 15h
jmp     short loc_12A78

loc_12A5C:
mov     ax, [si+6]
cmp     ax, [bp+arg_2]
jnz     short loc_12A74
mov     ax, si
add     ax, 0Ah
push    ax
push    [bp+arg_0]
call    sub_19458
push    si
call    sub_12B18

loc_12A74:
dec     di
add     si, 5Eh ; '^'

loc_12A78:
or      di, di
jnz     short loc_12A5C
pop     di
pop     si
pop     bp
retn    4
sub_12A4F endp



; Attributes: bp-based frame

sub_12A82 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
mov     si, 82DAh
mov     di, 15h
jmp     short loc_12AA4

loc_12A8F:
mov     ax, [si+6]
cmp     ax, [bp+arg_0]
jnz     short loc_12AA0
mov     word ptr [si+2], 0
mov     word ptr [si], 0

loc_12AA0:
dec     di
add     si, 5Eh ; '^'

loc_12AA4:
or      di, di
jnz     short loc_12A8F
pop     di
pop     si
pop     bp
retn    2
sub_12A82 endp



; Attributes: bp-based frame

sub_12AAE proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    si
push    di
mov     si, 82DAh
mov     di, 15h
jmp     short loc_12AE7

loc_12ABB:
mov     bx, [bp+arg_2]
mov     ax, [bx+8]
cmp     ax, [si+8]
jnz     short loc_12AE3
cmp     [bp+arg_0], 0
jnz     short loc_12AE3
mov     ax, bx
add     ax, 0Ah
push    ax
mov     ax, si
add     ax, 0Ah
push    ax
call    sub_19497
or      ax, ax
jnz     short loc_12AE3
mov     ax, si
jmp     short loc_12AED

loc_12AE3:
dec     di
add     si, 5Eh ; '^'

loc_12AE7:
or      di, di
jnz     short loc_12ABB
xor     ax, ax

loc_12AED:
pop     di
pop     si
pop     bp
retn    4
sub_12AAE endp



; Attributes: bp-based frame

sub_12AF3 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
cmp     word ptr ds:1D2Eh, 0
jz      short loc_12B07
mov     ax, [si+8]
mov     [si+4], ax

loc_12B07:
push    word ptr [si+8]
xor     ax, ax
push    ax
call    sub_14875
mov     [si+5Ah], ax
pop     si
pop     bp
retn    2
sub_12AF3 endp



; Attributes: bp-based frame

sub_12B18 proc near

var_2= byte ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 2
push    si
mov     si, [bp+arg_0]
cmp     word ptr [si+8], 0
jz      short loc_12B52
mov     ax, si
add     ax, 0Ah
push    ax
call    sub_127A5
mov     [si+6], ax
or      ax, ax
jz      short loc_12B4E
push    word ptr [si+8]
push    word ptr [si+6]
push    ds
push    si
push    ss
lea     ax, [bp+var_2]
push    ax
call    sub_3F201
or      ax, ax
jnz     short loc_12B52

loc_12B4E:
xor     ax, ax
jmp     short loc_12B55

loc_12B52:
mov     ax, 1

loc_12B55:
pop     si
mov     sp, bp
pop     bp
retn    2
sub_12B18 endp



; Attributes: bp-based frame

sub_12B5C proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
mov     di, [bp+arg_0]
mov     ax, ds:4942h
mov     [bp+var_2], ax
mov     si, 82DAh
mov     [bp+var_4], 15h
jmp     loc_12C2E

loc_12B78:
cmp     word ptr [si+8], 0
jnz     short loc_12B81
jmp     def_12C01       ; jumptable 00012C01 default case

loc_12B81:
push    si
call    sub_12B18
or      ax, ax
jz      short loc_12B8C
jmp     def_12C01       ; jumptable 00012C01 default case

loc_12B8C:
or      di, di
jnz     short loc_12BEE
push    ds
mov     ax, si
add     ax, 0Ah
push    ax
push    word ptr [si+8]
call    sub_148A4
or      word ptr ds:1C68h, 200h
call    sub_1492F
xor     ax, ax
push    ax
call    sub_1ACE5
mov     word ptr ds:4942h, 0D51h
mov     word ptr ds:1DD3h, 11Eh
xor     ax, ax
push    ax
mov     ax, 0D68h
push    ax
mov     ax, 0DA5h
push    ax
call    sub_1DBF2
and     ax, 0FF00h
mov     cl, 8
shr     ax, cl
push    ax
mov     al, ds:1C63h
cbw
pop     dx
add     dx, ax
push    dx
mov     al, ds:1C62h
cbw
push    ax
mov     ax, 4
push    ax
call    sub_18EAD
add     sp, 0Ch
cbw
mov     di, ax
mov     ax, [bp+var_2]
mov     ds:4942h, ax

loc_12BEE:
mov     ax, di
mov     cx, 4           ; switch 4 cases
mov     bx, 2C05h

loc_12BF6:
cmp     ax, cs:[bx]
jz      short loc_12C01
inc     bx
inc     bx
loop    loc_12BF6
jmp     short def_12C01 ; jumptable 00012C01 default case

loc_12C01:              ; switch jump
jmp     word ptr cs:[bx+8]
dw    1Bh,   43h,   45h,   49h ; value table for switch statement
jpt_12C01 dw offset loc_12C23 ; jump table for switch statement
dw offset loc_12C1D
dw offset loc_12C15
dw offset loc_12C19

loc_12C15:              ; jumptable 00012C01 case 69
push    si
call    sub_12C45

loc_12C19:              ; jumptable 00012C01 case 73
xor     di, di
jmp     short def_12C01 ; jumptable 00012C01 default case

loc_12C1D:              ; jumptable 00012C01 case 67
push    si
call    sub_12C45
jmp     short def_12C01 ; jumptable 00012C01 default case

loc_12C23:              ; jumptable 00012C01 case 27
mov     ax, 0BAD0h
jmp     short loc_12C3D

def_12C01:              ; jumptable 00012C01 default case
dec     [bp+var_4]
add     si, 5Eh ; '^'

loc_12C2E:
cmp     [bp+var_4], 0
jz      short loc_12C37
jmp     loc_12B78

loc_12C37:
mov     ax, 1
mov     ds:8264h, ax

loc_12C3D:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_12B5C endp



; Attributes: bp-based frame

sub_12C45 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    ds
push    [bp+arg_0]
mov     ax, 5Eh ; '^'
push    ax
mov     al, 0
push    ax
call    sub_46C10
dec     word ptr ds:8274h
pop     bp
retn    2
sub_12C45 endp




sub_12C60 proc near
push    si
push    di
mov     di, 82DAh
mov     si, 15h
jmp     short loc_12C74

loc_12C6A:
mov     ax, di
add     di, 5Eh ; '^'
push    ax
call    sub_12C45
dec     si

loc_12C74:
or      si, si
jnz     short loc_12C6A
xor     ax, ax
mov     ds:8264h, ax
mov     ds:8274h, ax
mov     word ptr ds:1B46h, 1
call    sub_1492F
pop     di
pop     si
retn
sub_12C60 endp




sub_12C8C proc near
push    si
mov     si, ds:1B46h
cmp     word ptr ds:8274h, 0
jz      short loc_12CFC
cmp     word ptr ds:8274h, 1
jg      short loc_12CAF
mov     ax, si
mov     dx, 5Eh ; '^'
mul     dx
mov     bx, ax
cmp     word ptr [bx-7D7Ch], 0
jnz     short loc_12CD0

loc_12CAF:
inc     si
mov     ax, si
cmp     ax, ds:1B46h
jz      short loc_12CFC
cmp     si, 16h
jl      short loc_12CC0
mov     si, 1

loc_12CC0:
mov     ax, si
mov     dx, 5Eh ; '^'
mul     dx
mov     bx, ax
cmp     word ptr [bx-7D7Ch], 0
jz      short loc_12CAF

loc_12CD0:
mov     ds:1B46h, si
push    ds
mov     ax, si
mov     dx, 5Eh ; '^'
mul     dx
add     ax, 8286h
push    ax
xor     ax, ax
push    ax
call    sub_148A4
mov     ax, si
mov     dx, 5Eh ; '^'
mul     dx
mov     bx, ax
mov     ax, [bx-7D2Ah]
mov     ds:1C96h, ax
call    sub_17CEE
call    sub_1492F

loc_12CFC:
pop     si
retn
sub_12C8C endp



; Attributes: bp-based frame

sub_12CFE proc near

var_62= word ptr -62h
var_60= word ptr -60h
var_5E= byte ptr -5Eh
var_56= word ptr -56h
var_54= byte ptr -54h

push    bp
mov     bp, sp
sub     sp, 62h
push    si
push    di
mov     [bp+var_60], 1
mov     di, ds:4942h
push    ss
lea     ax, [bp+var_5E]
push    ax
mov     ax, 5Eh ; '^'
push    ax
mov     al, 0
push    ax
call    sub_46C10
push    word ptr ds:1C96h
call    sub_1488E
mov     [bp+var_56], ax
lea     ax, [bp+var_54]
push    ax
mov     ax, 9877h
push    ax
call    sub_19458
cmp     word ptr ds:0C0EFh, 2
jnz     short loc_12D46
lea     ax, [bp+var_5E]
push    ax
call    sub_12B18
mov     [bp+var_60], ax

loc_12D46:
lea     ax, [bp+var_5E]
push    ax
xor     ax, ax
push    ax
call    sub_12AAE
mov     si, ax
mov     ax, si
or      ax, ax
jz      short loc_12D5F
push    si
call    sub_12C45
jmp     loc_12E21

loc_12D5F:
cmp     [bp+var_60], 0
jnz     short loc_12DD8
xor     ax, ax
push    ax
call    sub_1AE6D
mov     word ptr ds:4942h, 0D51h
call    sub_1DBF2
mov     dx, ax
mov     al, dh
mov     ah, 0
push    ax
mov     al, ds:1C63h
cbw
pop     dx
add     dx, ax
mov     al, ds:926Eh
mov     ah, 0
add     ax, 0FFFEh
cmp     dx, ax
jl      short loc_12D9D
or      word ptr ds:1C68h, 200h
call    sub_1492F
xor     ax, ax
push    ax
call    sub_1ACE5

loc_12D9D:
mov     word ptr ds:1DD3h, 11Fh
xor     ax, ax
push    ax
mov     ax, 0C6Fh
push    ax
mov     ax, 0DABh
push    ax
mov     ax, 0C81h
push    ax
call    sub_1DBF2
and     ax, 0FF00h
mov     cl, 8
shr     ax, cl
push    ax
mov     al, ds:1C63h
cbw
pop     dx
add     dx, ax
push    dx
mov     al, ds:1C62h
cbw
push    ax
mov     ax, 4
push    ax
call    sub_18EAD
add     sp, 0Eh
cmp     al, 59h ; 'Y'
jnz     short loc_12E24

loc_12DD8:
cmp     word ptr ds:8274h, 15h
jge     short loc_12E17
mov     si, 82DAh
mov     [bp+var_62], 15h
jmp     short loc_12E0F

loc_12DE9:
cmp     word ptr [si+8], 0
jnz     short loc_12E09
push    ss
lea     ax, [bp+var_5E]
push    ax
push    ds
push    si
mov     ax, 5Eh ; '^'
push    ax
call    sub_46A2C
push    si
call    sub_12AF3
inc     word ptr ds:8274h
jmp     short loc_12E21

loc_12E09:
dec     [bp+var_62]
add     si, 5Eh ; '^'

loc_12E0F:
cmp     [bp+var_62], 0
jnz     short loc_12DE9
jmp     short loc_12E21

loc_12E17:
mov     ax, 0DB9h
push    ax
xor     ax, ax
push    ax
call    sub_19065

loc_12E21:
call    sub_1490A

loc_12E24:
mov     ds:4942h, di
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_12CFE endp



; Attributes: bp-based frame

sub_12E2E proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
jmp     short loc_12E4E

loc_12E37:
mov     bx, [bp+arg_6]
add     [bp+arg_6], 6
mov     dx, [bx+2]
mov     ax, [bx]
cmp     dx, [bp+arg_4]
jnz     short loc_12E4D
cmp     ax, [bp+arg_2]
jz      short loc_12E52

loc_12E4D:
dec     si

loc_12E4E:
or      si, si
jnz     short loc_12E37

loc_12E52:
mov     ax, si
pop     si
pop     bp
retn    8
sub_12E2E endp



; Attributes: bp-based frame

sub_12E59 proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
mov     si, 827Ch
mov     ax, [bp+arg_0]
mov     [bp+var_2], ax
xor     di, di
push    ds
mov     ax, si
add     ax, 0Ah
push    ax
push    word ptr [si+6]
call    sub_401D4
push    dx
push    ax
call    sub_46D76
push    si
call    sub_12B18
cmp     word ptr ds:8264h, 0
jnz     short loc_12E9C
xor     ax, ax
push    ax
call    sub_12B5C
or      ax, ax
jg      short loc_12E9C
mov     ax, 0BAD0h
jmp     short loc_12EDB

loc_12E9C:
mov     [bp+var_4], 16h
jmp     short loc_12ED3

loc_12EA3:
cmp     word ptr [si+8], 0
jz      short loc_12ECD
push    [bp+arg_0]
push    ds
mov     ax, si
add     ax, 6
push    ax
push    di
call    sub_12E2E
or      ax, ax
jnz     short loc_12ECD
mov     dx, [si+2]
mov     ax, [si]
mov     bx, [bp+var_2]
mov     [bx+2], dx
mov     [bx], ax
add     [bp+var_2], 6
inc     di

loc_12ECD:
dec     [bp+var_4]
add     si, 5Eh ; '^'

loc_12ED3:
cmp     [bp+var_4], 0
jnz     short loc_12EA3
mov     ax, di

loc_12EDB:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_12E59 endp




sub_12EE3 proc near
xor     ax, ax
mov     ds:1B70h, ax
mov     ds:1B6Eh, ax
mov     ds:1B62h, ax
mov     ds:1B60h, ax
mov     ds:1B54h, ax
mov     ds:1B52h, ax
mov     ax, 1
mov     ds:1B66h, ax
mov     ds:1B4Ah, ax
retn
sub_12EE3 endp



; Attributes: bp-based frame

sub_12F01 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
push    word ptr [si+8]
call    sub_1E8C0
push    word ptr [si+6]
push    word ptr ds:826Eh
mov     ax, si
add     ax, 0Ah
push    ax
mov     ax, si
add     ax, 0Ch
push    ax
xor     ax, ax
push    ax
call    sub_188F3
pop     si
pop     bp
retn    2
sub_12F01 endp



; Attributes: bp-based frame

sub_12F2C proc near

var_1= byte ptr -1
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 2
mov     word ptr ds:827Ah, 0
mov     bx, ds:1B4Eh
cmp     byte ptr [bx], 0
jz      short loc_12F8E
cmp     word ptr ds:826Ch, 0
jnz     short loc_12F9B
push    ds
push    bx
push    ds
push    word ptr ds:1B5Ch
push    ds
mov     ax, 8278h
push    ax
mov     ax, 1
push    ax
call    sub_4031D
mov     [bp+var_1], al
call    sub_13469
cmp     [bp+var_1], 0
jz      short loc_12F83
mov     al, [bp+var_1]
mov     ah, 0
dec     ax
mov     ds:1B52h, ax
xor     ax, ax
mov     ds:1B66h, ax
mov     ds:1B4Ah, ax
mov     ds:827Ah, ax
mov     ds:1B60h, ax
jmp     loc_12FFD

loc_12F83:
mov     ax, 1
mov     ds:826Ch, ax
mov     ds:827Ah, ax
jmp     short loc_12F9B

loc_12F8E:
mov     bx, ds:1B5Ch
mov     byte ptr [bx], 0
mov     word ptr ds:8278h, 0

loc_12F9B:
cmp     [bp+arg_0], 0
jnz     short loc_13001
cmp     word ptr ds:8278h, 0
jz      short loc_12FE4
push    ds
push    word ptr ds:1B6Ah
push    ds
push    word ptr ds:1B5Ch
call    sub_40627
mov     [bp+var_1], al
call    sub_13469
cmp     [bp+var_1], 0
jz      short loc_12FDC
mov     al, [bp+var_1]
mov     ah, 0
dec     ax
mov     ds:1B6Eh, ax
xor     ax, ax
mov     ds:1B66h, ax
mov     ds:1B4Ah, ax
mov     ds:1B60h, ax
mov     ax, 2
jmp     short loc_13004

loc_12FDC:
mov     word ptr ds:827Ah, 0
jmp     short loc_13001

loc_12FE4:
push    word ptr ds:1B5Ch
mov     ax, 1544h
push    ax
call    sub_19458
xor     ax, ax
mov     ds:1B66h, ax
mov     ds:1B4Ah, ax
mov     ds:1B60h, ax
mov     ds:1B52h, ax

loc_12FFD:
xor     ax, ax
jmp     short loc_13004

loc_13001:
mov     ax, 0FFFFh

loc_13004:
mov     sp, bp
pop     bp
retn    2
sub_12F2C endp



; Attributes: bp-based frame

sub_1300A proc near

var_306= byte ptr -306h
var_206= byte ptr -206h
var_106= byte ptr -106h
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 306h
push    si
push    di
mov     [bp+var_2], 0
lea     ax, [bp+var_306]
mov     ds:1B4Eh, ax
lea     ax, [bp+var_106]
mov     ds:1B5Ch, ax
lea     ax, [bp+var_206]
mov     ds:1B6Ah, ax
mov     ax, 1
mov     ds:1B68h, ax
mov     ds:1B4Ch, ax
xor     ax, ax
mov     ds:826Ch, ax
mov     ds:827Ah, ax
call    sub_40223
mov     al, ds:4A27h
mov     ah, 0
mov     dl, ds:4A25h
mov     dh, 0
sub     ax, dx
add     ax, 0FFFDh
mov     ds:826Eh, ax
mov     ax, 11h
push    ax
mov     ax, 2Eh ; '.'
push    ax
mov     ax, 3
push    ax
mov     ax, 826Eh
push    ax
mov     al, ds:4A28h
mov     ah, 0
mov     dl, ds:4A26h
mov     dh, 0
sub     ax, dx
dec     ax
push    ax
xor     ax, ax
push    ax
call    sub_18D5E
mov     [bp+var_4], ax
lea     ax, [bp+var_306]
push    ax
call    sub_1B1FB
mov     al, 0
mov     [bp+var_206], al
mov     [bp+var_106], al
mov     si, 3
mov     di, 1B64h
jmp     short loc_13106

loc_13098:
dec     si
mov     ax, si
mov     dx, 3
mul     dx
mov     dx, ax
inc     dx
inc     dx
mov     al, ds:4A25h
mov     ah, 0
add     ax, 3
push    ax
mov     al, ds:4A26h
mov     ah, 0
add     ax, dx
push    ax
mov     al, ds:4A27h
mov     ah, 0
dec     ax
push    ax
mov     al, ds:4A26h
mov     ah, 0
add     ax, dx
inc     ax
inc     ax
push    ax
mov     al, ds:4A29h
mov     ah, 0
push    ax
mov     bx, ds:4A1Dh
mov     al, [bx+1]
mov     ah, 0
push    ax
mov     al, [bx+3]
mov     ah, 0
push    ax
mov     ax, 1
push    ax
push    ax
call    sub_1E93C
mov     [di+8], ax
mov     ax, 20h ; ' '
push    ax
call    sub_1DC4A
push    word ptr [di]
mov     bx, ds:4A1Dh
mov     al, [bx]
mov     ah, 0
push    ax
call    sub_1E90D
mov     ax, 1
push    ax
call    sub_1DCE5
sub     di, 0Eh

loc_13106:
or      si, si
jnz     short loc_13098
call    sub_12EE3
sub     word ptr ds:826Eh, 4

loc_13112:
mov     ax, si
mov     dx, 0Eh
mul     dx
mov     di, ax
add     di, 1B48h
mov     bx, di
push    word ptr [bx+8]
call    sub_1E8C0
xor     ax, ax
push    ax
call    sub_1DC5F
mov     ax, si
or      ax, ax
jz      short loc_1313F
cmp     ax, 1
jz      short loc_13159
cmp     ax, 2
jz      short loc_13167
jmp     short loc_13173

loc_1313F:
mov     word ptr ds:1DD3h, 120h
cmp     word ptr ds:8B9Dh, 0
jz      short loc_13151
mov     ax, 12h
jmp     short loc_13154

loc_13151:
mov     ax, 11h

loc_13154:
mov     ds:40DAh, ax
jmp     short loc_13173

loc_13159:
mov     word ptr ds:1DD3h, 121h
mov     word ptr ds:40DAh, 13h
jmp     short loc_13173

loc_13167:
mov     word ptr ds:1DD3h, 122h
mov     word ptr ds:40DAh, 14h

loc_13173:
push    word ptr [di+6]
push    word ptr ds:826Eh
mov     ax, 0FFh
push    ax
mov     ax, di
add     ax, 0Ah
push    ax
mov     ax, di
add     ax, 0Ch
push    ax
mov     ax, di
inc     ax
inc     ax
push    ax
push    word ptr [di+4]
call    sub_18A4A
mov     [bp+var_6], ax
cmp     word ptr ds:1B4Ah, 0
jnz     short loc_131A5
mov     word ptr ds:826Ch, 0

loc_131A5:
mov     ax, [bp+var_6]
mov     cx, 5           ; switch 5 cases
mov     bx, 31BEh

loc_131AE:
cmp     ax, cs:[bx]
jz      short loc_131BA
inc     bx
inc     bx
loop    loc_131AE
jmp     def_131BA       ; jumptable 000131BA default case

loc_131BA:              ; switch jump
jmp     word ptr cs:[bx+0Ah]
dw      0,     1,     4,   1Eh ; value table for switch statement
dw    1Fh
jpt_131BA dw offset loc_1325E ; jump table for switch statement
dw offset loc_13244
dw offset loc_131D2
dw offset loc_13244
dw offset loc_1325E

loc_131D2:              ; jumptable 000131BA case 4
mov     ax, si
or      ax, ax
jz      short loc_131E4
cmp     ax, 1
jz      short loc_131FE
cmp     ax, 2
jz      short loc_13217
jmp     short loc_1322D

loc_131E4:
mov     word ptr ds:826Ch, 0
mov     ax, 1
push    ax
call    sub_12F2C
or      ax, ax
jge     short loc_1322D
mov     bx, ds:1B6Ah
mov     byte ptr [bx], 0
jmp     short loc_13226

loc_131FE:
cmp     word ptr ds:827Ah, 0
jz      short loc_1322D
lea     ax, [bp+var_206]
push    ax
lea     ax, [bp+var_106]
push    ax
call    sub_19458
mov     si, 2
jmp     short loc_13226

loc_13217:
xor     ax, ax
push    ax
call    sub_12F2C
or      ax, ax
jge     short loc_1322B
mov     [bp+var_2], 1

loc_13226:
call    sub_12EE3
jmp     short loc_1322D

loc_1322B:
mov     si, ax

loc_1322D:
mov     ax, 1B48h
push    ax
call    sub_12F01
mov     ax, 1B56h
push    ax
call    sub_12F01
mov     ax, 1B64h
push    ax
call    sub_12F01
jmp     short def_131BA ; jumptable 000131BA default case

loc_13244:              ; jumptable 000131BA cases 1,30
mov     ax, si
mov     dx, 0Eh
mul     dx
add     ax, 1B48h
push    ax
call    sub_12F01
inc     si
mov     ax, si
cmp     ax, 3
jl      short def_131BA ; jumptable 000131BA default case
xor     si, si
jmp     short def_131BA ; jumptable 000131BA default case

loc_1325E:              ; jumptable 000131BA cases 0,31
mov     ax, si
mov     dx, 0Eh
mul     dx
add     ax, 1B48h
push    ax
call    sub_12F01
dec     si
jge     short def_131BA ; jumptable 000131BA default case
mov     si, 2

def_131BA:              ; jumptable 000131BA default case
cmp     [bp+var_6], 0
jl      short loc_1327B
jmp     loc_13112

loc_1327B:
mov     di, 1B48h
jmp     short loc_1328C

loc_13280:
push    word ptr [di+8]
call    sub_1E8C0
call    sub_1DA41
add     di, 0Eh

loc_1328C:
cmp     di, 1B64h
jbe     short loc_13280
mov     ax, 11h
push    ax
call    sub_1AD85
push    [bp+var_4]
call    sub_1E8C0
call    sub_402B3
cmp     [bp+var_2], 0
jz      short loc_132B4
mov     ax, 0FFFFh
push    ax
call    sub_1774F
call    sub_1A751

loc_132B4:
mov     ax, [bp+var_6]
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_1300A endp




sub_132BD proc near
push    si
push    di
mov     di, 82DAh
cmp     word ptr ds:0C0EFh, 2
jnz     short loc_132F2
call    sub_12650
mov     si, 15h
jmp     short loc_132DE

loc_132D1:
mov     word ptr [di+2], 0
mov     word ptr [di], 0
add     di, 5Eh ; '^'
dec     si

loc_132DE:
or      si, si
jnz     short loc_132D1
xor     ax, ax
mov     ds:8264h, ax
mov     ds:8268h, ax
call    sub_1F00F
call    sub_1492F

loc_132F2:
pop     di
pop     si
retn
sub_132BD endp



; Attributes: bp-based frame

sub_132F5 proc near

var_A0= byte ptr -0A0h
var_50= byte ptr -50h
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 0A0h
push    si
push    di
mov     di, 600h
mov     dx, [bp+arg_2]
mov     ax, [bp+arg_0]
mov     ds:826Ah, dx
mov     ds:8268h, ax
cmp     ax, 0FFFFh
jnz     short loc_13317
or      dx, dx
jz      short loc_1333B

loc_13317:
cmp     [bp+arg_0], 0
jz      short loc_1333B
cmp     word ptr ds:8268h, 0
jge     short loc_1332C
mov     ax, ds:8268h
neg     ax
mov     ds:8268h, ax

loc_1332C:
cmp     word ptr ds:826Ah, 0
jge     short loc_1333B
mov     ax, ds:826Ah
neg     ax
mov     ds:826Ah, ax

loc_1333B:
mov     [bp+var_50], 0
xor     si, si
cmp     [bp+arg_0], si
jnz     short loc_13375
lea     ax, [bp+var_50]
push    ax
mov     ax, 0E59h
push    ax
call    sub_19483
cmp     [bp+arg_2], 0FFFFh
jnz     short loc_13368
mov     si, 1
lea     ax, [bp+var_50]
push    ax
mov     ax, 0E6Dh
push    ax
call    sub_19483
jmp     loc_133EE

loc_13368:
mov     [bp+var_50], 0
mov     ax, [bp+arg_2]
mov     ds:1B44h, ax
jmp     loc_133EE

loc_13375:
cmp     [bp+arg_0], 0
jge     short loc_133EE
lea     ax, [bp+var_50]
push    ax
mov     ax, 0E80h
push    ax
call    sub_19483
cmp     [bp+arg_2], 0
jg      short loc_1339C
mov     si, 1
lea     ax, [bp+var_50]
push    ax
mov     ax, 0E8Ch
push    ax
call    sub_19483
jmp     short loc_133EE

loc_1339C:
lea     ax, [bp+var_50]
push    ax
mov     ax, 0EA1h
push    ax
call    sub_19483
push    ss
lea     ax, [bp+var_A0]
push    ax
push    word ptr ds:8268h
call    sub_401D4
push    dx
push    ax
call    sub_46D76
lea     ax, [bp+var_A0]
push    ax
lea     ax, [bp+var_A0]
push    ax
lea     ax, [bp+var_50]
push    ax
call    sub_19448
push    ax
mov     ax, 0C52h
push    ax
call    sub_19448
pop     dx
add     dx, ax
mov     ax, 4Ch ; 'L'
sub     ax, dx
push    ax
call    sub_12515
lea     ax, [bp+var_50]
push    ax
lea     ax, [bp+var_A0]
push    ax
call    sub_19483

loc_133EE:
cmp     [bp+var_50], 0
jz      short loc_1341E
xor     ax, ax
push    ax
mov     ax, 0C52h
push    ax
lea     ax, [bp+var_50]
push    ax
mov     ax, 0C7Fh
push    ax
mov     ax, 5
push    ax
mov     ax, 0Ah
push    ax
or      si, si
jz      short loc_13414
mov     ax, 5
jmp     short loc_13417

loc_13414:
mov     ax, 4

loc_13417:
push    ax
call    sub_18EAD
add     sp, 0Eh

loc_1341E:
cmp     di, 600h
jnz     short loc_13431
push    word ptr ds:826Ah
push    word ptr ds:8268h
call    sub_126B4
mov     di, ax

loc_13431:
cmp     [bp+arg_0], 0
jz      short loc_13443
cmp     [bp+arg_0], 0
jge     short loc_13446
cmp     [bp+arg_2], 0
jg      short loc_13446

loc_13443:
call    sub_132BD

loc_13446:
mov     ax, di
pop     di
pop     si
mov     sp, bp
pop     bp
retn    4
sub_132F5 endp




sub_13450 proc far
cmp     word ptr ds:472Ah, 0
jnz     short locret_13468
cmp     word ptr ds:229Ah, 0
jnz     short locret_13468
cmp     word ptr ds:23C7h, 0
jz      short locret_13468
call    sub_1A45E

locret_13468:
retf
sub_13450 endp




sub_13469 proc near
cmp     word ptr ds:229Ah, 0
jz      short locret_13473
call    sub_1A39F

locret_13473:
retn
sub_13469 endp



; Attributes: bp-based frame

sub_13474 proc near

var_88= byte ptr -88h
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 88h
push    si
lea     ax, [bp+var_88]
push    ax
call    sub_12E59
mov     si, ax
cmp     si, 0BAD0h
jnz     short loc_13498
mov     ax, 0BAD0h
mov     [bp+var_2], ax
mov     [bp+var_4], ax
jmp     loc_1351A

loc_13498:
cmp     word ptr ds:472Ah, 0
jnz     short loc_134A6
call    sub_1A521
or      ax, ax
jnz     short loc_134B6

loc_134A6:
mov     ax, 91D3h
push    ax
call    sub_1E87B
mov     ax, 9276h
push    ax
call    sub_19CCF
jmp     short loc_134C0

loc_134B6:
cmp     word ptr ds:23C7h, 2
jnz     short loc_134C0
call    sub_1A45E

loc_134C0:
call    sub_14E1B
call    sub_125DD
push    si
push    ss
lea     ax, [bp+var_88]
push    ax
push    [bp+arg_0]
call    sub_10C5E
mov     [bp+var_2], dx
mov     [bp+var_4], ax
call    sub_12589
call    sub_14E2F
call    sub_14E43
cmp     word ptr ds:229Ah, 0
jz      short loc_134F0
call    sub_1A39F
jmp     short loc_13506

loc_134F0:
cmp     word ptr ds:229Eh, 9276h
jnz     short loc_13506
mov     ax, 9276h
push    ax
call    sub_1E87B
mov     ax, 91D3h
push    ax
call    sub_19CCF

loc_13506:
push    ds
mov     ax, 827Ch
push    ax
mov     ax, 5Eh ; '^'
push    ax
mov     al, 0
push    ax
call    sub_46C10
call    sub_10944

loc_1351A:
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]
pop     si
mov     sp, bp
pop     bp
retn    2
sub_13474 endp



; Attributes: bp-based frame

sub_13527 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    si
mov     ax, [bp+arg_2]
sub     ax, 0FFFAh      ; switch 5 cases
cmp     ax, 4
ja      short def_1353A ; jumptable 0001353A default case
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_1353A[bx] ; switch jump
jpt_1353A dw offset loc_13562 ; jump table for switch statement
dw offset loc_1354E
dw offset loc_13558
dw offset loc_13549
dw offset loc_13553

loc_13549:              ; jumptable 0001353A case -3
mov     si, 0F71h
jmp     short loc_1356A

loc_1354E:              ; jumptable 0001353A case -5
mov     si, 0F7Eh
jmp     short loc_1356A

loc_13553:              ; jumptable 0001353A case -2
mov     si, 0E1Fh
jmp     short loc_1356A

loc_13558:              ; jumptable 0001353A case -4
mov     si, 0E3Eh
mov     [bp+arg_0], 0
jmp     short loc_1356A

loc_13562:              ; jumptable 0001353A case -6
mov     si, 0F91h
jmp     short loc_1356A

def_1353A:              ; jumptable 0001353A default case
mov     si, 0F5Bh

loc_1356A:
push    si
push    [bp+arg_0]
call    sub_19065
pop     si
pop     bp
retn    4
sub_13527 endp



; Attributes: bp-based frame

sub_13576 proc near

var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 4
mov     word ptr ds:229Ch, 1
call    sub_1A45E
call    sub_1EF94
mov     word ptr ds:0C0EFh, 0
xor     ax, ax
push    ax
push    ax
push    ax
mov     ax, 2
push    ax
call    sub_10C5E
mov     [bp+var_2], dx
mov     [bp+var_4], ax
call    sub_1F00F
mov     word ptr ds:0C0EFh, 0
mov     ax, [bp+var_2]
mov     ds:1B44h, ax
call    sub_1A39F
mov     sp, bp
pop     bp
retn
sub_13576 endp



; Attributes: bp-based frame

sub_135BC proc near

var_A4= word ptr -0A4h

push    bp
mov     bp, sp
sub     sp, 0A4h
cmp     word ptr ds:472Ah, 0
jz      short loc_135D4
mov     al, ds:9224h
mov     ah, 0
call    sub_10BFC
jmp     short loc_135E4

loc_135D4:
cmp     word ptr ds:0C0EFh, 2
jz      short loc_135E1
mov     word ptr ds:229Ch, 1

loc_135E1:
call    sub_1A45E

loc_135E4:
mov     ax, 1214h
push    ax
call    sub_19BEC
call    sub_125DD
call    sub_16A20
call    sub_16478
call    sub_1EF52
call    sub_16431
call    sub_16A05
call    sub_12589
cmp     word ptr ds:472Ah, 0
jz      short loc_13652
lea     ax, [bp+var_A4]
push    ax
call    sub_1E87B
mov     ax, [bp+var_A4]
cmp     ax, ds:9276h
jnz     short loc_13649
push    ss
lea     ax, [bp+var_A4]
push    ax
push    ds
mov     ax, 9276h
push    ax
mov     ax, 0A3h
push    ax
call    sub_46A2C
cmp     word ptr ds:0C0EFh, 2
jz      short loc_13649
push    ds
mov     ax, 9276h
push    ax
push    ds
mov     ax, 931Bh
push    ax
mov     ax, 0A3h
push    ax
call    sub_46A2C

loc_13649:
mov     ax, 1
push    ax
call    sub_1A4C4
jmp     short loc_1366F

loc_13652:
call    sub_1A39F
cmp     word ptr ds:0C0EFh, 2
jz      short loc_1366F
push    ds
mov     ax, 9276h
push    ax
push    ds
mov     ax, 931Bh
push    ax
mov     ax, 0A3h
push    ax
call    sub_46A2C

loc_1366F:
mov     sp, bp
pop     bp
retn
sub_135BC endp



; Attributes: bp-based frame

sub_13673 proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
push    si
cmp     word ptr ds:0C0EFh, 2
jz      short loc_1368C
call    sub_139EF
call    sub_1BDD1
call    sub_147A2
call    sub_31744

loc_1368C:
push    ds
push    [bp+arg_2]
call    sub_1EE52
push    ds
push    [bp+arg_4]
call    sub_1EEB8
mov     si, ax
mov     ax, si
or      ax, ax
jl      short loc_136B9
cmp     [bp+arg_0], 0
jz      short loc_136B1
call    sub_135BC
jmp     short loc_136B4

loc_136B1:
call    sub_13576

loc_136B4:
call    sub_12650
jmp     short loc_136C0

loc_136B9:
push    si
push    [bp+arg_4]
call    sub_13527

loc_136C0:
cmp     word ptr ds:0C0EFh, 2
jz      short loc_136CF
call    sub_317B4
call    sub_1BE15

loc_136CF:
pop     si
pop     bp
retn    6
sub_13673 endp



; Attributes: bp-based frame

sub_136D4 proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 4
push    si
mov     si, 0FFFFh
push    [bp+arg_0]
call    sub_13474
mov     [bp+var_2], dx
mov     [bp+var_4], ax
cmp     ax, 0BAD0h
jz      short loc_136F9
push    dx
push    ax
call    sub_132F5
mov     si, ax
call    sub_1A751

loc_136F9:
mov     ax, si
pop     si
mov     sp, bp
pop     bp
retn    2
sub_136D4 endp



; Attributes: bp-based frame

sub_13702 proc near

var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
mov     si, 827Ch
les     bx, ds:5AAh
les     bx, es:[bx+12h]
mov     [bp+var_2], es
mov     [bp+var_4], bx
mov     di, 16h
jmp     short loc_13733

loc_13720:
mov     dx, [si+2]
mov     ax, [si]
cmp     dx, [bp+var_2]
jnz     short loc_1372F
cmp     ax, [bp+var_4]
jz      short loc_13737

loc_1372F:
dec     di
add     si, 5Eh ; '^'

loc_13733:
or      di, di
jnz     short loc_13720

loc_13737:
mov     ax, di
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_13702 endp



; Attributes: bp-based frame

sub_1373F proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
mov     si, [bp+arg_0]
mov     ax, 9877h
push    ax
call    sub_127A5
mov     di, ax
mov     ax, di
or      ax, ax
jz      short loc_13786
mov     ax, 8286h
push    ax
mov     ax, 9877h
push    ax
call    sub_19458
push    word ptr ds:1C96h
call    sub_1488E
mov     ds:8284h, ax
mov     ds:8282h, di
mov     ax, 827Ch
push    ax
call    sub_12B18
or      ax, ax
jnz     short loc_13794
mov     ax, 0F14h
push    ax
xor     ax, ax
push    ax
call    sub_19065
jmp     short loc_13791

loc_13786:
mov     ax, 0F34h
push    ax
mov     ax, 9877h
push    ax
call    sub_19065

loc_13791:
mov     si, 905h

loc_13794:
mov     ax, si
pop     di
pop     si
pop     bp
retn    2
sub_1373F endp



; Attributes: bp-based frame

sub_1379C proc near

var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_4= byte ptr -4
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 0Ch
push    si
push    di
mov     di, [bp+arg_0]
mov     si, 0FFFFh
xor     ax, ax
push    ax
call    sub_12268
or      ax, ax
jge     short loc_137B7
jmp     loc_1393E

loc_137B7:
mov     word ptr ds:1B44h, 0FFFFh
call    sub_139EF
call    sub_31529
mov     ds:93DAh, dx
mov     ds:93D8h, ax
push    ds
mov     ax, 2EFCh
push    ax
call    sub_1EE52
mov     word ptr ds:8A90h, 0
cmp     word ptr ds:23CBh, 0
jz      short loc_137EE
mov     ax, 0FFFFh
mov     [bp+var_A], ax
mov     [bp+var_C], ax
jmp     short loc_137FE

loc_137EE:
push    ds
push    word ptr ds:40BCh
call    sub_3EAFC
mov     [bp+var_A], dx
mov     [bp+var_C], ax

loc_137FE:
cmp     [bp+var_C], 0FFFFh
jnz     short loc_13869
cmp     [bp+var_A], 0FFFFh
jnz     short loc_1385C
cmp     di, 901h
jnz     short loc_13817
cmp     word ptr ds:8274h, 0
jz      short loc_13845

loc_13817:
mov     word ptr ds:1DD3h, 123h
xor     ax, ax
push    ax
mov     ax, 0C6Fh
push    ax
mov     ax, 0EFAh
push    ax
mov     ax, 0C81h
push    ax
mov     ax, 5
push    ax
mov     ax, 0Ah
push    ax
mov     ax, 4
push    ax
call    sub_18EAD
add     sp, 0Eh
cmp     al, 59h ; 'Y'
jz      short loc_13845
jmp     loc_1392A

loc_13845:
mov     word ptr ds:8A90h, 1
push    word ptr ds:40BCh
mov     ax, 2EFCh
push    ax
xor     ax, ax
push    ax
call    sub_13673
jmp     loc_1393C

loc_1385C:
push    [bp+var_A]
push    word ptr ds:40BCh
call    sub_13527
jmp     loc_1393C

loc_13869:
xor     ax, ax
push    ax
call    sub_1B2A2
xor     ax, ax
push    ax
call    sub_12B5C
cmp     ax, 0BAD0h
jnz     short loc_1387D
jmp     loc_1392A

loc_1387D:
cmp     di, 902h
jnz     short loc_13889
push    di
call    sub_1373F
mov     di, ax

loc_13889:
call    sub_13702
or      ax, ax
jz      short loc_13893
mov     di, 905h

loc_13893:
mov     ax, di
sub     ax, 901h        ; switch 5 cases
cmp     ax, 4
jbe     short loc_138A0
jmp     def_138A4       ; jumptable 000138A4 default case, case 2307

loc_138A0:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_138A4[bx] ; switch jump
jpt_138A4 dw offset loc_1392F ; jump table for switch statement
dw offset loc_1392F
dw offset def_138A4
dw offset loc_138B3
dw offset loc_138B3

loc_138B3:              ; jumptable 000138A4 cases 2308,2309
les     bx, ds:5AAh
push    word ptr es:[bx+14h]
push    word ptr es:[bx+12h]
push    ss
lea     ax, [bp+var_4]
push    ax
call    sub_3F3F4
mov     [bp+var_6], dx
mov     [bp+var_8], ax
or      ax, ax
jz      short loc_138E5
mov     [bp+var_A], dx
mov     [bp+var_C], ax
push    dx
push    ax
call    sub_132F5
mov     si, ax
call    sub_1A751
jmp     short loc_13936

loc_138E5:
cmp     [bp+var_C], 0
jbe     short loc_138FF
cmp     [bp+var_A], 0
jbe     short loc_138FF
mov     ax, [bp+var_A]
mov     ds:8284h, ax
mov     ax, [bp+var_C]
mov     ds:8282h, ax
jmp     short loc_1392F ; jumptable 000138A4 cases 2305,2306

loc_138FF:
mov     word ptr ds:1DD3h, 124h
xor     ax, ax
push    ax
mov     ax, 0C6Fh
push    ax
mov     ax, 0ECFh
push    ax
mov     ax, 0C81h
push    ax
mov     ax, 5
push    ax
mov     ax, 0Ah
push    ax
mov     ax, 4
push    ax
call    sub_18EAD
add     sp, 0Eh
cmp     al, 59h ; 'Y'
jz      short loc_1392F ; jumptable 000138A4 cases 2305,2306

loc_1392A:
call    sub_132BD
jmp     short loc_1393C

loc_1392F:              ; jumptable 000138A4 cases 2305,2306
mov     si, di
jmp     short loc_13936

def_138A4:              ; jumptable 000138A4 default case, case 2307
mov     si, 0FFFFh

loc_13936:
mov     word ptr ds:229Ch, 1

loc_1393C:
mov     ax, si

loc_1393E:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_1379C endp



; Attributes: bp-based frame

sub_13946 proc near

var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
mov     di, [bp+arg_0]
mov     si, 0FFFFh
mov     ax, di
cmp     ax, 903h
jz      short loc_1395D
jmp     short loc_13963

loc_1395D:
call    sub_132BD
jmp     def_139AF       ; jumptable 000139AF default case, case 2307

loc_13963:
cmp     word ptr ds:0C0EFh, 2
jz      short loc_1397B
cmp     word ptr ds:99FDh, 0
jz      short loc_13974
call    sub_139EF

loc_13974:
cmp     word ptr ds:0C0EFh, 1
jnz     short loc_13992

loc_1397B:
call    sub_1D4DD
mov     [bp+var_2], ax
cmp     ax, 1Bh
jz      short def_139AF ; jumptable 000139AF default case, case 2307
cmp     ax, 59h ; 'Y'
jz      short loc_13992
cmp     word ptr ds:0C0EFh, 2
jz      short loc_1399A

loc_13992:
push    di
call    sub_1D321
mov     si, ax
jmp     short def_139AF ; jumptable 000139AF default case, case 2307

loc_1399A:
mov     ax, 0FFFFh
push    ax
call    sub_17720
mov     ax, di
sub     ax, 901h        ; switch 5 cases
cmp     ax, 4
ja      short def_139AF ; jumptable 000139AF default case, case 2307
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_139AF[bx] ; switch jump
jpt_139AF dw offset loc_139C7 ; jump table for switch statement
dw offset loc_139BE
dw offset def_139AF
dw offset loc_139D2
dw offset loc_139D2

loc_139BE:              ; jumptable 000139AF case 2306
push    di
call    sub_1373F
cmp     ax, 905h
jz      short def_139AF ; jumptable 000139AF default case, case 2307

loc_139C7:              ; jumptable 000139AF case 2305
mov     ax, 2
push    ax
call    sub_136D4
mov     si, ax
jmp     short def_139AF ; jumptable 000139AF default case, case 2307

loc_139D2:              ; jumptable 000139AF cases 2308,2309
cmp     di, 904h
jnz     short loc_139DC
xor     ax, ax
jmp     short loc_139DF

loc_139DC:
mov     ax, 1

loc_139DF:
push    ax
call    sub_136D4
mov     si, ax

def_139AF:              ; jumptable 000139AF default case, case 2307
mov     ax, si
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_13946 endp




sub_139EF proc near
cmp     word ptr ds:0C0EFh, 0
jz      short locret_13A01
call    sub_132BD
call    sub_3F160
call    sub_1A751

locret_13A01:
retn
sub_139EF endp



; Attributes: bp-based frame

sub_13A02 proc near

var_50= byte ptr -50h

push    bp
mov     bp, sp
sub     sp, 50h
push    ds
inc     word ptr ds:1DE8h
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jnz     short loc_13A76
push    ss
lea     ax, [bp+var_50]
push    ax
push    ds
mov     ax, 0F53h
push    ax
call    sub_4682F
push    dx
push    ax
call    sub_46D76
push    ss
lea     ax, [bp+var_50]
push    ax
call    sub_105F1
or      ax, ax
jnz     short loc_13A51
mov     ax, 0E1Fh
push    ax
lea     ax, [bp+var_50]
push    ax
call    sub_19065
jmp     short loc_13A76

loc_13A51:
push    ds
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jnz     short loc_13A76
lea     ax, [bp+var_50]
push    ax
mov     ax, 0C63h
push    ax
mov     ax, 1
push    ax
call    sub_13673

loc_13A76:
dec     word ptr ds:1DE8h
mov     sp, bp
pop     bp
retn
sub_13A02 endp



; Attributes: bp-based frame

sub_13A7E proc near

var_24= byte ptr -24h
var_22= byte ptr -22h
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah
arg_8= byte ptr  0Ch
arg_A= word ptr  0Eh

push    bp
mov     bp, sp
sub     sp, 24h
push    si
push    di
mov     di, [bp+arg_4]
mov     ax, [bp+arg_A]
cmp     ax, [bp+arg_6]
jl      short loc_13A94
jmp     loc_13B26

loc_13A94:
cmp     byte ptr [di], 7Eh ; '~'
jl      short loc_13A9E
mov     ax, 1
jmp     short loc_13AA0

loc_13A9E:
xor     ax, ax

loc_13AA0:
mov     [bp+var_2], ax
inc     di
lea     si, [bp+var_24]
mov     [bp+var_8], 0
jmp     short loc_13ABC

loc_13AAE:
mov     byte ptr [si], 20h ; ' '
mov     al, [bp+arg_8]
mov     [si+1], al
inc     [bp+var_8]
inc     si
inc     si

loc_13ABC:
cmp     [bp+var_8], 0Eh
jl      short loc_13AAE
lea     si, [bp+var_22]
jmp     short loc_13AD4

loc_13AC7:
mov     al, [di]
mov     [si], al
mov     al, [bp+arg_8]
mov     [si+1], al
inc     di
inc     si
inc     si

loc_13AD4:
cmp     byte ptr [di], 0
jnz     short loc_13AC7
cmp     [bp+var_2], 0
jz      short loc_13AEC
mov     al, ds:226Eh
mov     [si], al
mov     al, [bp+arg_8]
mov     [si+1], al
inc     si
inc     si

loc_13AEC:
mov     ax, [bp+arg_A]
sub     ax, [bp+arg_2]
cwd
idiv    [bp+arg_0]
mov     ax, dx
mul     word ptr ds:8A92h
inc     ax
mov     [bp+var_6], ax
mov     ax, [bp+arg_A]
sub     ax, [bp+arg_2]
cwd
idiv    [bp+arg_0]
inc     ax
mov     [bp+var_4], ax
push    [bp+var_6]
push    ax
mov     ax, [bp+var_6]
add     ax, 0Dh
push    ax
push    [bp+var_4]
lea     ax, [bp+var_24]
push    ax
xor     ax, ax
push    ax
call    sub_1D8CC

loc_13B26:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    0Ch
sub_13A7E endp




sub_13B2E proc near
push    si
push    di
mov     di, 492Fh
mov     al, [di+0Ah]
mov     ah, 0
mov     si, ax
mov     al, [di+8]
mov     ah, 0
sub     si, ax
dec     si
mov     ax, si
mov     bx, 0Eh
cwd
idiv    bx
mov     ds:8A9Eh, ax
mov     dx, bx
mul     dx
push    ax
mov     ax, si
pop     dx
sub     ax, dx
cwd
idiv    word ptr ds:8A9Eh
mov     ds:8A94h, ax
add     ax, bx
mov     ds:8A92h, ax
mov     al, [di+0Bh]
mov     ah, 0
mov     dl, [di+9]
mov     dh, 0
sub     ax, dx
dec     ax
mul     word ptr ds:8A9Eh
mov     ds:8AA0h, ax
call    sub_1DA26
cmp     word ptr ds:8AF2h, 0
jnz     short loc_13B90
mov     ax, 1
push    ax
push    ax
mov     ax, 0E1Fh
push    ax
call    sub_1ED32
jmp     short loc_13BC1

loc_13B90:
mov     si, ds:8A96h
jmp     short loc_13BB6

loc_13B96:
push    si
mov     bx, [di]
push    word ptr [bx+3]
push    word ptr ds:8AF2h
mov     bx, si
shl     bx, 1
add     bx, ds:8A9Ch
push    word ptr [bx]
push    word ptr ds:8A96h
push    word ptr ds:8A9Eh
call    sub_13A7E
inc     si

loc_13BB6:
mov     ax, ds:8A96h
add     ax, ds:8AA0h
cmp     ax, si
jg      short loc_13B96

loc_13BC1:
pop     di
pop     si
retn
sub_13B2E endp



; Attributes: bp-based frame

sub_13BC4 proc near

var_52= byte ptr -52h
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 52h
push    si
push    di
mov     si, 492Fh
mov     al, [si+0Ah]
mov     ah, 0
mov     dl, [si+8]
mov     dh, 0
sub     ax, dx
dec     ax
mov     [bp+var_2], ax
lea     ax, [bp+var_52]
push    ax
mov     ax, 0D66h
push    ax
call    sub_19458
mov     ax, 8AA2h
push    ax
call    sub_19448
mov     di, ax
inc     di
inc     di
cmp     di, [bp+var_2]
jle     short loc_13C17
lea     ax, [bp+var_52]
push    ax
mov     ax, 1B72h
push    ax
call    sub_19483
push    ax
mov     ax, di
add     ax, 8AA2h
sub     ax, [bp+var_2]
add     ax, 3
push    ax
call    sub_19483
jmp     short loc_13C22

loc_13C17:
lea     ax, [bp+var_52]
push    ax
mov     ax, 8AA2h
push    ax
call    sub_19483

loc_13C22:
lea     ax, [bp+var_52]
push    ax
mov     ax, 0D66h
push    ax
call    sub_19483
lea     ax, [bp+var_52]
push    ax
mov     bx, [si]
mov     al, [bx]
mov     ah, 0
push    ax
call    sub_1E90D
cmp     word ptr ds:8AF6h, 0
jz      short loc_13C85
mov     ax, ds:8A98h
mov     ds:8AF2h, ax
lea     ax, [bp+var_52]
push    ax
mov     ax, 150Ah
push    ax
call    sub_19458
lea     bx, [bp+var_52]
add     bx, [bp+var_2]
mov     byte ptr [bx], 0
mov     al, [si+0Bh]
mov     ah, 0
mov     di, ax
mov     al, [si+9]
mov     ah, 0
sub     di, ax
mov     ax, 1
push    ax
push    di
lea     ax, [bp+var_52]
push    ax
call    sub_19448
push    ax
push    di
lea     ax, [bp+var_52]
push    ax
mov     ax, 1
push    ax
call    sub_1D8CC
jmp     short loc_13C92

loc_13C85:
mov     al, [si+0Ch]
mov     ah, 0
push    ax
mov     ax, 0FFh
push    ax
call    sub_1DA05

loc_13C92:
call    sub_13B2E
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_13BC4 endp



; Attributes: bp-based frame

sub_13C9B proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    si
push    di
mov     si, [bp+arg_0]
mov     di, [bp+arg_2]
jmp     short loc_13CBA

loc_13CA8:
cmp     byte ptr [si], 2Ah ; '*'
jz      short loc_13CC4
cmp     byte ptr [si], 3Fh ; '?'
jz      short loc_13CB8
mov     al, [di]
cmp     al, [si]
jnz     short loc_13CD5

loc_13CB8:
inc     di
inc     si

loc_13CBA:
cmp     byte ptr [di], 0
jz      short loc_13CC4
cmp     byte ptr [si], 0
jnz     short loc_13CA8

loc_13CC4:
cmp     byte ptr [si], 2Ah ; '*'
jz      short loc_13CD9
mov     al, [di]
cbw
push    ax
mov     al, [si]
cbw
pop     dx
add     dx, ax
jz      short loc_13CD9

loc_13CD5:
xor     ax, ax
jmp     short loc_13CDC

loc_13CD9:
mov     ax, 1

loc_13CDC:
pop     di
pop     si
pop     bp
retn    4
sub_13C9B endp



; Attributes: bp-based frame

sub_13CE2 proc near

var_10= byte ptr -10h
var_6= byte ptr -6
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 10h
push    ds
push    [bp+arg_0]
xor     ax, ax
push    ax
push    ax
lea     ax, [bp+var_10]
push    ax
lea     ax, [bp+var_6]
push    ax
call    sub_19500
test    ax, 2
jnz     short loc_13D1E
lea     ax, [bp+var_6]
push    ax
mov     ax, 1B74h
push    ax
call    sub_19458
push    ds
push    [bp+arg_0]
xor     ax, ax
push    ax
push    ax
lea     ax, [bp+var_10]
push    ax
lea     ax, [bp+var_6]
push    ax
call    sub_19777

loc_13D1E:
lea     ax, [bp+var_10]
push    ax
mov     ax, 9170h
push    ax
call    sub_13C9B
or      ax, ax
jnz     short loc_13D31
xor     ax, ax
jmp     short loc_13D3C

loc_13D31:
lea     ax, [bp+var_6]
push    ax
mov     ax, 91C8h
push    ax
call    sub_13C9B

loc_13D3C:
mov     sp, bp
pop     bp
retn    2
sub_13CE2 endp



; Attributes: bp-based frame

sub_13D42 proc near

var_83= word ptr -83h
var_31= byte ptr -31h
var_30= word ptr -30h
var_2E= word ptr -2Eh
var_2C= byte ptr -2Ch
var_17= byte ptr -17h
var_E= byte ptr -0Eh

push    bp
mov     bp, sp
sub     sp, 84h
push    si
push    di
push    ss
lea     ax, [bp+var_83+1]
push    ax
mov     ax, 91CDh
push    ax
mov     ax, 9179h
push    ax
mov     ax, 1B76h
push    ax
mov     ax, 1B78h
push    ax
call    sub_19777
push    ss
lea     ax, [bp+var_30]
push    ax
call    sub_10411
push    ss
lea     ax, [bp+var_2C]
push    ax
call    sub_10431
mov     al, 0
mov     byte ptr [bp+var_83], al
cbw
mov     ds:8A9Ah, ax
mov     ds:8AF2h, ax
lea     di, [bp+var_E]
jmp     short loc_13DEE

loc_13D86:
mov     byte ptr [bp+var_83], 1
test    [bp+var_17], 10h
jz      short loc_13DB2
mov     ax, [di]
cmp     ax, 2Eh ; '.'
jz      short loc_13DEE
cmp     ax, 2E2Eh
jnz     short loc_13DA3
mov     [bp+var_31], 7Fh
jmp     short loc_13DA7

loc_13DA3:
mov     [bp+var_31], 7Eh ; '~'

loc_13DA7:
mov     ax, ds:8AF2h
cmp     ax, ds:8A98h
jz      short loc_13DC3
jmp     short loc_13DD1

loc_13DB2:
push    di
call    sub_13CE2
or      ax, ax
jz      short loc_13DEE
mov     ax, ds:8AF2h
cmp     ax, ds:8A98h
jnz     short loc_13DC9

loc_13DC3:
inc     word ptr ds:8AF2h
jmp     short loc_13E0F

loc_13DC9:
inc     word ptr ds:8A9Ah
mov     [bp+var_31], 7Dh ; '}'

loc_13DD1:
mov     ax, ds:8AF2h
mov     dx, 0Eh
mul     dx
mov     si, ax
add     si, ds:8AF8h
inc     word ptr ds:8AF2h
mov     al, [bp+var_31]
mov     [si], al
inc     si
push    si
push    di
call    sub_19458

loc_13DEE:
mov     ax, ds:8AF2h
cmp     ax, ds:8A98h
ja      short loc_13E0F
push    ss
lea     ax, [bp+var_83+1]
push    ax
push    [bp+var_83]
mov     ax, 10h
push    ax
call    sub_105BB
or      ax, ax
jnz     short loc_13E0F
jmp     loc_13D86

loc_13E0F:
push    [bp+var_2E]
push    [bp+var_30]
call    sub_10431
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_13D42 endp



; Attributes: bp-based frame

sub_13E1E proc near

var_50= byte ptr -50h
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 50h
push    si
test    word ptr ds:8AFAh, 20h
jnz     short loc_13E4B
mov     ax, 0CB2h
push    ax
xor     ax, ax
push    ax
call    sub_19065
xor     ax, ax
mov     ds:8AF4h, ax
mov     ds:8A96h, ax
mov     ds:8A9Ah, ax
mov     ds:8AF2h, ax
mov     ds:8AF6h, ax
jmp     loc_13EFE

loc_13E4B:
mov     ax, 91CDh
push    ax
mov     ax, 9179h
push    ax
call    sub_1982B
or      word ptr ds:8AFAh, 18h
mov     ax, 8AA2h
push    ax
call    sub_19C39
cmp     [bp+arg_0], 0
jz      short loc_13EA1
mov     al, 0
push    ax
push    ss
lea     ax, [bp+var_50]
push    ax
call    sub_10534
lea     ax, [bp+var_50]
push    ax
call    sub_19448
mov     si, ax
push    [bp+arg_0]
push    ss
lea     ax, [bp+var_50]
push    ax
push    ds
mov     ax, 8AA2h
push    ax
push    si
call    sub_46E7B
or      ax, ax
jz      short loc_13E98
xor     ax, ax
jmp     short loc_13E9A

loc_13E98:
mov     ax, si

loc_13E9A:
add     ax, 8AA2h
push    ax
call    sub_19458

loc_13EA1:
call    sub_13D42
mov     ax, ds:8AF2h
cmp     ax, ds:8A98h
jbe     short loc_13EB2
mov     ax, 1
jmp     short loc_13EB4

loc_13EB2:
xor     ax, ax

loc_13EB4:
mov     ds:8AF6h, ax
or      ax, ax
jz      short loc_13EC1
mov     ax, ds:8A98h
mov     ds:8AF2h, ax

loc_13EC1:
cmp     word ptr ds:8AF2h, 0
jle     short loc_13EF3
xor     si, si
jmp     short loc_13EE2

loc_13ECC:
mov     ax, si
mov     dx, 0Eh
mul     dx
add     ax, ds:8AF8h
mov     bx, si
shl     bx, 1
add     bx, ds:8A9Ch
mov     [bx], ax
inc     si

loc_13EE2:
cmp     si, ds:8AF2h
jl      short loc_13ECC
push    word ptr ds:8AF2h
push    word ptr ds:8A9Ch
call    sub_1938B

loc_13EF3:
xor     ax, ax
mov     ds:8AF4h, ax
mov     ds:8A96h, ax
mov     ax, 1

loc_13EFE:
pop     si
mov     sp, bp
pop     bp
retn    2
sub_13E1E endp



; Attributes: bp-based frame

sub_13F05 proc near

arg_0= word ptr  4
arg_2= byte ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
cmp     [bp+arg_0], 0
jz      short loc_13F29
cmp     byte ptr [bp+arg_4], 7Eh ; '~'
jb      short loc_13F25
mov     ax, [bp+arg_4]
mov     cl, 8
shr     ax, cl
cmp     al, [bp+arg_2]
jnz     short loc_13F25
mov     ax, 1
jmp     short loc_13F27

loc_13F25:
xor     ax, ax

loc_13F27:
jmp     short loc_13F42

loc_13F29:
cmp     byte ptr [bp+arg_4], 7Dh ; '}'
jnz     short loc_13F40
mov     ax, [bp+arg_4]
mov     cl, 8
shr     ax, cl
cmp     al, [bp+arg_2]
jnz     short loc_13F40
mov     ax, 1
jmp     short loc_13F42

loc_13F40:
xor     ax, ax

loc_13F42:
pop     bp
retn    6
sub_13F05 endp



; Attributes: bp-based frame

sub_13F46 proc near

var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
sub     sp, 8
push    si
push    di
mov     [bp+var_8], 492Fh

loc_13F53:
mov     ax, ds:8A96h
mov     [bp+var_6], ax

loc_13F59:
push    word ptr ds:8AF4h
mov     bx, [bp+var_8]
mov     bx, [bx]
push    word ptr [bx+2]
push    word ptr ds:8AF2h
mov     bx, ds:8AF4h
shl     bx, 1
add     bx, ds:8A9Ch
push    word ptr [bx]
push    word ptr ds:8A96h
push    word ptr ds:8A9Eh
call    sub_13A7E
mov     si, ds:8AF4h
mov     word ptr ds:40DAh, 3
mov     word ptr ds:1DD3h, 2Bh ; '+'
call    sub_15852
mov     [bp+var_2], ax
push    ax
call    sub_11EA2
mov     di, ax
push    word ptr ds:8AF4h
mov     bx, [bp+var_8]
mov     bx, [bx]
push    word ptr [bx+3]
push    word ptr ds:8AF2h
mov     bx, ds:8AF4h
shl     bx, 1
add     bx, ds:8A9Ch
push    word ptr [bx]
push    word ptr ds:8A96h
push    word ptr ds:8A9Eh
call    sub_13A7E
mov     ax, di
sub     ax, 0FFEBh      ; switch 34 cases
cmp     ax, 21h
jbe     short loc_13FD0
jmp     def_13FD4       ; jumptable 00013FD4 default case, cases -20--1,6-8

loc_13FD0:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_13FD4[bx] ; switch jump
jpt_13FD4 dw offset loc_1401D ; jump table for switch statement
dw offset def_13FD4
dw offset def_13FD4
dw offset def_13FD4
dw offset def_13FD4
dw offset def_13FD4
dw offset def_13FD4
dw offset def_13FD4
dw offset def_13FD4
dw offset def_13FD4
dw offset def_13FD4
dw offset def_13FD4
dw offset def_13FD4
dw offset def_13FD4
dw offset def_13FD4
dw offset def_13FD4
dw offset def_13FD4
dw offset def_13FD4
dw offset def_13FD4
dw offset def_13FD4
dw offset def_13FD4
dw offset loc_1410E
dw offset loc_14124
dw offset loc_140E9
dw offset loc_140FA
dw offset loc_140DC
dw offset loc_140D6
dw offset def_13FD4
dw offset def_13FD4
dw offset def_13FD4
dw offset loc_141BB
dw offset loc_141C4
dw offset loc_1414D
dw offset loc_14181

loc_1401D:              ; jumptable 00013FD4 case -21
inc     word ptr ds:1DE8h

loc_14021:
mov     word ptr ds:1DD3h, 12Dh
mov     ax, 1519h
push    ax
mov     ax, 8AA2h
push    ax
mov     bx, [bp+var_8]
mov     al, [bx+8]
mov     ah, 0
add     ax, 5
push    ax
mov     al, [bx+9]
mov     ah, 0
add     ax, 3
push    ax
mov     ax, 50h ; 'P'
push    ax
mov     ax, 28h ; '('
push    ax
call    sub_18E6D
mov     di, ax
or      di, di
jl      short loc_140BB
push    ds
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jnz     short loc_14021
mov     ax, 8AA2h
push    ax
push    [bp+arg_2]
xor     ax, ax
push    ax
push    [bp+arg_0]
call    sub_19A67
mov     ds:8AFAh, ax
and     ax, 21h
cmp     ax, 20h ; ' '
jnz     short loc_140AB
mov     bx, ds:8A9Ch
mov     bx, [bx]
mov     byte ptr [bx], 7Dh ; '}'
mov     bx, ds:8A9Ch
mov     ax, [bx]
inc     ax
push    ax
mov     ax, 9170h
push    ax
call    sub_19458
push    ax
mov     ax, 91C8h
push    ax
call    sub_19483
xor     si, si
jmp     loc_142D6

loc_140AB:
push    [bp+arg_4]
call    sub_13E1E
or      ax, ax
jnz     short loc_140B8
jmp     loc_14021

loc_140B8:
call    sub_13BC4

loc_140BB:
dec     word ptr ds:1DE8h
mov     si, di
mov     ax, si
cmp     ax, 0FFFFh
jl      short loc_140CB
jmp     loc_14288

loc_140CB:
cmp     di, 0FFEBh
jz      short loc_140D3
jmp     loc_142D6

loc_140D3:
jmp     loc_14021

loc_140D6:              ; jumptable 00013FD4 case 5
mov     si, 0FFFFh
jmp     loc_142D6

loc_140DC:              ; jumptable 00013FD4 case 4
cmp     word ptr ds:8AF2h, 0
jle     short loc_140E6
jmp     loc_142D6

loc_140E6:
jmp     loc_14288

loc_140E9:              ; jumptable 00013FD4 case 2
cmp     word ptr ds:8AF4h, 0
jg      short loc_140F3
jmp     loc_14288

loc_140F3:
dec     word ptr ds:8AF4h
jmp     loc_14288

loc_140FA:              ; jumptable 00013FD4 case 3
mov     ax, ds:8AF4h
inc     ax
cmp     ax, ds:8AF2h
jl      short loc_14107
jmp     loc_14288

loc_14107:
inc     word ptr ds:8AF4h
jmp     loc_14288

loc_1410E:              ; jumptable 00013FD4 case 0
mov     ax, ds:8AF4h
cmp     ax, ds:8A9Eh
jge     short loc_1411A
jmp     loc_14288

loc_1411A:
mov     ax, ds:8A9Eh
sub     ds:8AF4h, ax
jmp     loc_14288

loc_14124:              ; jumptable 00013FD4 case 1
mov     ax, ds:8A9Eh
add     ds:8AF4h, ax
mov     ax, ds:8AF4h
cmp     ax, ds:8AF2h
jge     short loc_14137
jmp     loc_14288

loc_14137:
mov     ax, ds:8A96h
add     ax, ds:8AA0h
cmp     ax, ds:8AF2h
jge     short loc_1411A
mov     ax, ds:8A9Eh
add     ds:8A96h, ax
jmp     short loc_1411A

loc_1414D:              ; jumptable 00013FD4 case 11
mov     ax, ds:8AF4h
sub     ax, ds:8AA0h
mov     ds:8AF4h, ax
jmp     short loc_14160

loc_14159:
mov     ax, ds:8A9Eh
add     ds:8AF4h, ax

loc_14160:
cmp     word ptr ds:8AF4h, 0
jl      short loc_14159
mov     ax, ds:8AA0h
sub     ds:8A96h, ax
cmp     word ptr ds:8A96h, 0
jl      short loc_14178
jmp     loc_14288

loc_14178:
mov     word ptr ds:8A96h, 0
jmp     loc_14288

loc_14181:              ; jumptable 00013FD4 case 12
cmp     word ptr ds:8AF2h, 0
jnz     short loc_1418B
jmp     loc_14288

loc_1418B:
mov     ax, ds:8AA0h
add     ds:8AF4h, ax
mov     ax, ds:8A96h
add     ax, ds:8AA0h
cmp     ax, ds:8AF2h
jge     short loc_141AF
mov     ax, ds:8AA0h
add     ds:8A96h, ax
jmp     short loc_141AF

loc_141A8:
mov     ax, ds:8A9Eh
sub     ds:8AF4h, ax

loc_141AF:
mov     ax, ds:8AF4h
cmp     ax, ds:8AF2h
jge     short loc_141A8
jmp     loc_14288

loc_141BB:              ; jumptable 00013FD4 case 9
mov     word ptr ds:8AF4h, 0
jmp     loc_14288

loc_141C4:              ; jumptable 00013FD4 case 10
cmp     word ptr ds:8AF2h, 0
jg      short loc_141CE
jmp     loc_14288

loc_141CE:
mov     ax, ds:8AF2h
dec     ax
mov     ds:8AF4h, ax
jmp     loc_14288

def_13FD4:              ; jumptable 00013FD4 default case, cases -20--1,6-8
cmp     di, 0FFFFh
jge     short loc_141FF
mov     si, di
mov     ax, si
cmp     ax, 0FFFFh
jge     short loc_141E9
jmp     loc_142D6

loc_141E9:
jmp     short loc_141EF

loc_141EB:
dec     word ptr ds:8AF4h

loc_141EF:
mov     ax, ds:8A96h
add     ax, ds:8AA0h
cmp     ax, ds:8AF4h
jle     short loc_141EB
jmp     loc_14288

loc_141FF:
and     [bp+var_2], 0FFh
mov     ax, [bp+var_2]
or      ax, ax
jnz     short loc_1420E
jmp     loc_14288

loc_1420E:
push    ax
call    sub_46F25
mov     [bp+var_2], ax
call    sub_107CE
and     ax, 3
mov     [bp+var_4], ax
mov     bx, si
shl     bx, 1
add     bx, ds:8A9Ch
mov     bx, [bx]
push    word ptr [bx]
push    [bp+var_2]
push    ax
call    sub_13F05
or      ax, ax
jz      short loc_1423D
mov     ax, ds:8AF4h
inc     ax
jmp     short loc_1423F

loc_1423D:
xor     ax, ax

loc_1423F:
mov     si, ax
or      si, si
jz      short loc_14282
mov     bx, si
shl     bx, 1
add     bx, ds:8A9Ch
mov     bx, [bx]
push    word ptr [bx]
push    [bp+var_2]
push    [bp+var_4]
call    sub_13F05
or      ax, ax
jnz     short loc_14282
xor     si, si
jmp     short loc_14282

loc_14262:
mov     bx, si
shl     bx, 1
add     bx, ds:8A9Ch
mov     bx, [bx]
push    word ptr [bx]
push    [bp+var_2]
push    [bp+var_4]
call    sub_13F05
or      ax, ax
jz      short loc_14281
mov     ds:8AF4h, si
jmp     short loc_14288

loc_14281:
inc     si

loc_14282:
cmp     si, ds:8AF2h
jl      short loc_14262

loc_14288:
mov     ax, ds:8AF4h
cmp     ax, ds:8A96h
jge     short loc_14296
mov     ds:8A96h, ax
jmp     short loc_142B1

loc_14296:
mov     ax, ds:8A96h
add     ax, ds:8AA0h
cmp     ax, ds:8AF4h
jg      short loc_142B1
mov     ax, ds:8AF4h
sub     ax, ds:8AA0h
add     ax, ds:8A9Eh
mov     ds:8A96h, ax

loc_142B1:
mov     ax, ds:8A96h
cmp     ax, [bp+var_6]
jnz     short loc_142BC
jmp     loc_13F59

loc_142BC:
cwd
idiv    word ptr ds:8A9Eh
sub     ds:8A96h, dx
mov     ax, ds:8A96h
cmp     ax, [bp+var_6]
jnz     short loc_142D0
jmp     loc_13F59

loc_142D0:
call    sub_13B2E
jmp     loc_13F53

loc_142D6:
mov     ax, si
pop     di
pop     si
mov     sp, bp
pop     bp
retn    6
sub_13F46 endp



; Attributes: bp-based frame

sub_142E0 proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
push    si
push    di

loc_142E5:
push    [bp+arg_4]
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_13F46
mov     si, ax
or      si, si
jge     short loc_142FA
jmp     loc_14390

loc_142FA:
mov     bx, si
shl     bx, 1
add     bx, ds:8A9Ch
mov     bx, [bx]
cmp     byte ptr [bx], 7Eh ; '~'
jl      short loc_14364
mov     bx, si
shl     bx, 1
add     bx, ds:8A9Ch
mov     bx, [bx]
cmp     word ptr [bx+1], 2E2Eh
jnz     short loc_1433D
push    ds
mov     ax, 9179h
push    ax
call    sub_46E60
mov     di, ax
dec     di
add     di, 9179h

loc_1432B:
dec     di
mov     bx, di
push    word ptr [bx]
call    sub_19729
or      al, al
jz      short loc_1432B
mov     byte ptr [di+1], 0
jmp     short loc_14358

loc_1433D:
mov     ax, 9179h
push    ax
mov     bx, si
shl     bx, 1
add     bx, ds:8A9Ch
mov     ax, [bx]
inc     ax
push    ax
call    sub_19483
push    ax
mov     ax, 226Eh
push    ax
call    sub_19483

loc_14358:
push    [bp+arg_4]
call    sub_13E1E
call    sub_13BC4
jmp     loc_142E5

loc_14364:
push    ds
mov     ax, 8AA2h
push    ax
mov     ax, 91CDh
push    ax
mov     ax, 9179h
push    ax
xor     ax, ax
push    ax
push    ax
call    sub_19777
mov     ax, 8AA2h
push    ax
mov     bx, si
shl     bx, 1
add     bx, ds:8A9Ch
mov     ax, [bx]
inc     ax
push    ax
call    sub_19483
mov     ax, 4
jmp     short loc_14392

loc_14390:
mov     ax, si

loc_14392:
pop     di
pop     si
pop     bp
retn    6
sub_142E0 endp



; Attributes: bp-based frame

sub_14398 proc near

var_64= word ptr -64h
var_62= byte ptr -62h
var_12= byte ptr -12h
var_8= byte ptr -8
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
sub     sp, 64h
push    si
push    di
mov     [bp+var_2], 0
xor     di, di
push    ds
inc     word ptr ds:1DE8h
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jz      short loc_143C7
mov     si, 0FFFFh
jmp     loc_14516

loc_143C7:
cmp     [bp+arg_0], 0
jz      short loc_143F9
push    ds
push    [bp+arg_0]
xor     ax, ax
push    ax
push    ax
lea     ax, [bp+var_12]
push    ax
lea     ax, [bp+var_8]
push    ax
call    sub_19500
mov     ds:8AFAh, ax
test    ax, 4
jz      short loc_143EE
lea     ax, [bp+var_12]
mov     [bp+var_2], ax

loc_143EE:
test    word ptr ds:8AFAh, 2
jz      short loc_143F9
lea     di, [bp+var_8]

loc_143F9:
cmp     [bp+arg_4], 0
jz      short loc_14408
push    [bp+arg_6]
push    [bp+arg_4]
call    sub_19458

loc_14408:
push    [bp+arg_6]
push    [bp+arg_2]
push    [bp+var_2]
push    di
call    sub_19A67
mov     ds:8AFAh, ax
mov     ax, 8AA2h
push    ax
push    [bp+arg_6]
call    sub_19458
mov     ax, ds:8AFAh
and     ax, 21h
cmp     ax, 20h ; ' '
jnz     short loc_14433
mov     si, 4
jmp     loc_14516

loc_14433:
mov     ax, sp
sub     ax, ds:20h
add     ax, 0F0B8h
mov     cl, 4
shr     ax, cl
mov     ds:8A98h, ax
shl     ax, 1
mov     dx, sp
sub     dx, ax
mov     sp, dx
mov     ax, sp
mov     ds:8A9Ch, ax
mov     ax, ds:8A98h
mov     dx, 0Eh
mul     dx
mov     dx, sp
sub     dx, ax
mov     sp, dx
mov     ax, sp
mov     ds:8AF8h, ax
push    ds
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jnz     short loc_14483
push    [bp+arg_4]
call    sub_13E1E
or      ax, ax
jnz     short loc_14489

loc_14483:
mov     si, 0FFFFh
jmp     loc_1450B

loc_14489:
mov     ax, 3
push    ax
call    sub_1ACE5
mov     ax, 1
push    ax
call    sub_1DCE5
call    sub_13BC4
push    ds
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jz      short loc_144B5
mov     si, 0FFFFh
jmp     short loc_14504

loc_144B5:
push    [bp+arg_4]
push    [bp+arg_2]
push    di
call    sub_142E0
mov     si, ax
mov     ax, si
cmp     ax, 4
jnz     short loc_14504
mov     al, 0
push    ax
push    ss
lea     ax, [bp+var_62]
push    ax
call    sub_10534
lea     ax, [bp+var_62]
push    ax
call    sub_19448
mov     [bp+var_64], ax
push    [bp+arg_6]
push    ss
lea     ax, [bp+var_62]
push    ax
push    ds
mov     ax, 8AA2h
push    ax
push    [bp+var_64]
call    sub_46E7B
or      ax, ax
jz      short loc_144FA
xor     ax, ax
jmp     short loc_144FD

loc_144FA:
mov     ax, [bp+var_64]

loc_144FD:
add     ax, 8AA2h
push    ax
call    sub_19458

loc_14504:
mov     ax, 3
push    ax
call    sub_1AD85

loc_1450B:
mov     ax, ds:8A98h
mov     cl, 4
shl     ax, cl
add     ax, sp
mov     sp, ax

loc_14516:
dec     word ptr ds:1DE8h
mov     ax, si
pop     di
pop     si
mov     sp, bp
pop     bp
retn    8
sub_14398 endp




sub_14524 proc near
cmp     word ptr ds:23C5h, 0
jz      short loc_14537
mov     byte ptr ds:3496h, 2
mov     byte ptr ds:3497h, 2
jmp     short locret_14547

loc_14537:
mov     al, ds:4904h
add     al, 3
mov     ds:3496h, al
mov     al, ds:4905h
add     al, 2
mov     ds:3497h, al

locret_14547:
retn
sub_14524 endp


loc_14548:
push    si
mov     word ptr ds:40DAh, 1
jmp     short loc_14554

loc_14551:
call    sub_15852

loc_14554:
call    sub_157A7
mov     si, ax
mov     ax, si
cmp     ax, 0FFFFh
jz      short loc_14551
or      si, si
jnz     short loc_14569
mov     ax, 0FFFFh
jmp     short loc_1456B

loc_14569:
mov     ax, si

loc_1456B:
pop     si
retf

loc_1456D:
push    si
mov     word ptr ds:40DAh, 1

loc_14574:
call    sub_15852
mov     si, ax
mov     ax, si
cmp     ax, 0FFFFh
jz      short loc_14574
mov     word ptr ds:1DD3h, 0F2h
mov     ax, si
pop     si
retf

loc_1458A:
push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
mov     al, ds:4906h
mov     ah, 0
mov     di, ax
mov     al, ds:4904h
mov     ah, 0
sub     di, ax
inc     di
push    di
cmp     word ptr ds:23C5h, 0
jz      short loc_145AD
xor     ax, ax
jmp     short loc_145B0

loc_145AD:
mov     ax, 2

loc_145B0:
pop     di
sub     di, ax
push    word ptr [bp+6]
call    sub_30C40
mov     ax, 9A78h
push    ax
mov     al, 3Ah ; ':'
push    ax
call    sub_194AB
mov     [bp-4], ax
or      ax, ax
jz      short loc_145E8
inc     ax
push    ax
mov     al, 3Ah ; ':'
push    ax
call    sub_194AB
mov     [bp-2], ax
or      ax, ax
jz      short loc_145E8
mov     ax, [bp-4]
add     ax, 0FFFEh
push    ax
push    word ptr [bp-2]
call    sub_19458

loc_145E8:
push    ds
mov     ax, 8AFCh
push    ax
push    ds
mov     ax, 9A78h
push    ax
push    di
call    sub_46DA1
mov     ax, ds:0BFC4h
add     ax, 1F4h
mov     ds:1DD3h, ax
mov     byte ptr [di-7504h], 0
mov     ax, 8AFCh
push    ax
call    sub_19448
mov     si, ax
jmp     short loc_14617

loc_14611:
mov     byte ptr [si-7504h], 20h ; ' '
inc     si

loc_14617:
cmp     si, di
jl      short loc_14611
mov     ax, 8AFCh
mov     dx, ds
pop     di
pop     si
mov     sp, bp
pop     bp
retf


; Attributes: bp-based frame

sub_14626 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    si
call    sub_14524
push    [bp+arg_2]
push    [bp+arg_0]
mov     ax, 50h ; 'P'
push    ax
call    sub_1917C
mov     si, ax
mov     word ptr ds:1DD3h, 0F2h
cmp     si, 0FFFFh
jge     short loc_1464E
push    si
call    far ptr sub_463C2
pop     cx

loc_1464E:
cmp     si, 0FFFFh
jnz     short loc_14658
mov     ax, 0FFFFh
jmp     short loc_14660

loc_14658:
push    [bp+arg_0]
call    sub_1943A
xor     ax, ax

loc_14660:
pop     si
pop     bp
retn    4
sub_14626 endp



; Attributes: bp-based frame

sub_14665 proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_2]
push    ds
push    [bp+arg_4]
push    [bp+arg_0]
call    sub_106E6
mov     si, ax
dec     word ptr ds:1DE8h
or      si, si
jg      short loc_1468F
mov     ax, 169Ah
push    ax
push    [bp+arg_4]
call    sub_19065
mov     ax, 0FFFFh
jmp     short loc_14691

loc_1468F:
mov     ax, si

loc_14691:
pop     si
pop     bp
retn    6
sub_14665 endp


loc_14696:
push    bp
mov     bp, sp
sub     sp, 50h
push    si
mov     word ptr ds:1DD3h, 125h
mov     ax, 16AAh
push    ax
mov     ax, 8B4Dh
push    ax
call    sub_14626
or      ax, ax
jnz     short loc_146FB
push    ds
inc     word ptr ds:1DE8h
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jnz     short loc_146F7
lea     ax, [bp-50h]
push    ax
mov     ax, 8B4Dh
push    ax
xor     ax, ax
push    ax
mov     ax, 0E56h
push    ax
call    sub_14398
mov     si, ax
mov     ax, si
cmp     ax, 0FFFFh
jge     short loc_146F2
dec     word ptr ds:1DE8h
push    si
call    far ptr sub_463C2
pop     cx

loc_146F2:
cmp     si, 0FFFFh
jnz     short loc_14700

loc_146F7:
dec     word ptr ds:1DE8h

loc_146FB:
mov     ax, 0FFFFh
jmp     short loc_1470B

loc_14700:
lea     ax, [bp-50h]
push    ax
push    si
xor     ax, ax
push    ax
call    sub_14665

loc_1470B:
pop     si
mov     sp, bp
pop     bp
retf

loc_14710:
push    bp
mov     bp, sp
sub     sp, 50h
push    si
mov     word ptr ds:1DD3h, 126h
mov     ax, 16C1h
push    ax
mov     ax, 8B4Dh
push    ax
call    sub_14626
or      ax, ax
jnz     short loc_1478C
push    ds
inc     word ptr ds:1DE8h
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jnz     short loc_14788
lea     ax, [bp-50h]
push    ax
mov     ax, 8B4Dh
push    ax
xor     ax, ax
push    ax
mov     ax, 0E56h
push    ax
call    sub_14398
mov     si, ax
mov     ax, si
cmp     ax, 0FFFFh
jge     short loc_1476C
dec     word ptr ds:1DE8h
push    si
call    far ptr sub_463C2
pop     cx

loc_1476C:
cmp     si, 0FFFFh
jz      short loc_14788
push    ss
lea     ax, [bp-50h]
push    ax
call    sub_105F1
or      ax, ax
jz      short loc_14791
lea     ax, [bp-50h]
push    ax
call    sub_1913E
or      ax, ax
jnz     short loc_14791

loc_14788:
dec     word ptr ds:1DE8h

loc_1478C:
mov     ax, 0FFFFh
jmp     short loc_1479D

loc_14791:
lea     ax, [bp-50h]
push    ax
push    si
mov     ax, 3
push    ax
call    sub_14665

loc_1479D:
pop     si
mov     sp, bp
pop     bp
retf



sub_147A2 proc near
mov     word ptr ds:1C7Ch, ds
mov     word ptr ds:1C7Ah, 1C05h
and     word ptr ds:1C68h, 0FD9Fh
call    sub_308FC
mov     byte ptr ds:942Ch, 0
retn
sub_147A2 endp




sub_147BD proc near
push    si
mov     si, ds:48FCh
mov     al, [si+3]
mov     ds:1B8Fh, al
mov     al, [si+4]
mov     ds:1B90h, al
mov     al, [si+2]
mov     ds:1B91h, al
mov     al, [si+5]
mov     ds:1B92h, al
mov     bx, ds:9A66h
mov     al, [bx]
mov     ds:1B93h, al
mov     al, [bx+1]
mov     ds:1B94h, al
push    ds
mov     ax, 1B8Fh
push    ax
push    ds
mov     ax, 1B89h
push    ax
mov     ax, 6
push    ax
call    sub_46A2C
push    ds
mov     ax, 1B8Fh
push    ax
push    ds
mov     ax, 1B83h
push    ax
mov     ax, 6
push    ax
call    sub_46A2C
push    ds
mov     ax, 1C5Eh
push    ax
call    sub_4623D
pop     cx
pop     cx
pop     si
retn
sub_147BD endp




sub_1481D proc near
mov     byte ptr ds:1B7Fh, 50h ; 'P'
mov     al, ds:926Eh
mov     ds:1B80h, al
mov     ax, ds:9225h
mov     ds:1C66h, ax
cmp     word ptr ds:23C5h, 0
jz      short loc_14854
mov     al, 0
mov     ds:1C63h, al
mov     ds:1C62h, al
mov     al, ds:1B7Fh
dec     al
mov     ds:1C64h, al
mov     byte ptr ds:1C63h, 1
mov     al, ds:1B80h
add     al, 0FEh
mov     ds:1C65h, al
jmp     short locret_14874

loc_14854:
mov     al, ds:4904h
inc     al
mov     ds:1C62h, al
mov     al, ds:4905h
inc     al
mov     ds:1C63h, al
mov     al, ds:4906h
dec     al
mov     ds:1C64h, al
mov     al, ds:4907h
dec     al
mov     ds:1C65h, al

locret_14874:
retn
sub_1481D endp



; Attributes: bp-based frame

sub_14875 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    [bp+arg_0]
push    [bp+arg_2]
push    ds
mov     ax, 1C5Eh
push    ax
call    sub_46242
mov     sp, bp
pop     bp
retn    4
sub_14875 endp



; Attributes: bp-based frame

sub_1488E proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    [bp+arg_0]
push    ds
mov     ax, 1C5Eh
push    ax
call    sub_46247
mov     sp, bp
pop     bp
retn    2
sub_1488E endp



; Attributes: bp-based frame

sub_148A4 proc near

var_50= byte ptr -50h
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
sub     sp, 50h
push    si
xor     si, si
mov     ax, si
push    ax
call    sub_1AE6D
push    [bp+arg_4]
push    [bp+arg_2]
push    ds
mov     ax, 9877h
push    ax
call    sub_19911
or      ax, ax
jnz     short loc_148EA
push    ss
lea     ax, [bp+var_50]
push    ax
push    [bp+arg_4]
push    [bp+arg_2]
call    sub_46D76
lea     ax, [bp+var_50]
push    ax
call    sub_152EB
or      ax, ax
jnz     short loc_148E7
call    sub_147A2
xor     ax, ax
jmp     short loc_14903

loc_148E7:
mov     si, 200h

loc_148EA:
push    [bp+arg_0]
xor     ax, ax
push    ax
call    sub_14875
mov     ds:1C96h, ax
call    sub_1490A
or      ds:1C68h, si
call    sub_17CEE
mov     ax, 1

loc_14903:
pop     si
mov     sp, bp
pop     bp
retn    6
sub_148A4 endp




sub_1490A proc near
and     word ptr ds:1C68h, 0FFDFh
retn
sub_1490A endp




sub_14911 proc near
mov     word ptr ds:1D2Eh, 1
test    word ptr ds:1C98h, 8
jz      short locret_1492E
and     word ptr ds:1C98h, 0FFF7h
and     word ptr ds:1C68h, 0EFFFh
call    sub_1492F

locret_1492E:
retn
sub_14911 endp




sub_1492F proc near
call    sub_1490A
xor     ax, ax
push    ax
call    sub_1B056
or      ax, ax
jz      short locret_14949
mov     ax, 0FFFFh
push    ax
call    sub_1774F
mov     al, 1Bh
push    ax
call    sub_14C12

locret_14949:
retn
sub_1492F endp



; Attributes: bp-based frame

sub_1494A proc near

arg_0= byte ptr  4

push    bp
mov     bp, sp
mov     al, [bp+arg_0]
mov     ds:1BF2h, al
pop     bp
retn    2
sub_1494A endp



; Attributes: bp-based frame

sub_14957 proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
mov     di, [bp+arg_0]
mov     si, 82DAh
cmp     word ptr ds:8268h, 0
jz      short loc_14993
push    word ptr ds:8268h
call    sub_401D4
push    dx
push    ax
push    ds
mov     ax, 9877h
push    ax
call    sub_46D55
or      ax, ax
jnz     short loc_14993
push    word ptr ds:826Ah
xor     ax, ax
push    ax
call    sub_14875
mov     [di], ax
jmp     short loc_14997

loc_14993:
mov     word ptr [di], 0FFFEh

loc_14997:
mov     byte ptr [di+2], 5
add     di, 3
cmp     word ptr ds:8274h, 0
jz      short loc_149FC
mov     [bp+var_2], 2
mov     [bp+var_4], 16h
jmp     short loc_149F6

loc_149B1:
cmp     word ptr [si+8], 0
jz      short loc_149EC
mov     ax, si
add     ax, 0Ah
push    ax
mov     ax, 9877h
push    ax
call    sub_19497
or      ax, ax
jnz     short loc_149EC
cmp     word ptr [si+5Ah], 0FFFFh
jnz     short loc_149D5
push    si
call    sub_12AF3
call    sub_1490A

loc_149D5:
mov     ax, [si+5Ah]
mov     [di], ax
mov     byte ptr [di+2], 4
add     di, 3
mov     al, byte ptr [bp+var_2]
mov     [si+5Dh], al
inc     [bp+var_2]
jmp     short loc_149F0

loc_149EC:
mov     byte ptr [si+5Dh], 0

loc_149F0:
dec     [bp+var_4]
add     si, 5Eh ; '^'

loc_149F6:
cmp     [bp+var_4], 0
jnz     short loc_149B1

loc_149FC:
mov     word ptr [di], 0FFFFh
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_14957 endp



; Attributes: bp-based frame

sub_14A08 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
mov     di, [bp+arg_0]
jmp     short loc_14A2E

loc_14A12:
mov     si, di
add     si, 3
jmp     short loc_14A26

loc_14A19:
mov     ax, [si]
cmp     ax, [di]
jnz     short loc_14A23
mov     word ptr [si], 0FFFEh

loc_14A23:
add     si, 3

loc_14A26:
cmp     word ptr [si], 0FFFFh
jnz     short loc_14A19
add     di, 3

loc_14A2E:
cmp     word ptr [di], 0FFFFh
jnz     short loc_14A12
pop     di
pop     si
pop     bp
retn    2
sub_14A08 endp



; Attributes: bp-based frame

sub_14A39 proc near

var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
mov     si, 82DAh
cmp     word ptr ds:8268h, 0
jz      short loc_14A56
mov     bx, [bp+arg_0]
push    word ptr [bx]
call    sub_1488E
mov     ds:826Ah, ax

loc_14A56:
push    [bp+arg_0]
call    sub_14A08
mov     di, 16h
jmp     short loc_14A9C

loc_14A61:
cmp     byte ptr [si+5Dh], 0
jz      short loc_14A98
mov     al, [si+5Dh]
mov     ah, 0
dec     ax
mov     dx, 3
mul     dx
mov     bx, ax
add     bx, [bp+arg_0]
mov     [bp+var_2], bx
cmp     word ptr [bx], 0FFFEh
jnz     short loc_14A85
push    si
call    sub_12C45
jmp     short loc_14A98

loc_14A85:
mov     bx, [bp+var_2]
push    word ptr [bx]
call    sub_1488E
mov     [si+8], ax
mov     bx, [bp+var_2]
mov     ax, [bx]
mov     [si+5Ah], ax

loc_14A98:
dec     di
add     si, 5Eh ; '^'

loc_14A9C:
or      di, di
jnz     short loc_14A61
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_14A39 endp




sub_14AA8 proc near
push    si
push    di
mov     si, 82DAh
mov     di, 16h
jmp     short loc_14AC7

loc_14AB2:
cmp     byte ptr [si+5Dh], 0
jz      short loc_14AC3
mov     word ptr [si+5Ah], 0FFFFh
mov     ax, [si+4]
mov     [si+8], ax

loc_14AC3:
dec     di
add     si, 5Eh ; '^'

loc_14AC7:
or      di, di
jnz     short loc_14AB2
pop     di
pop     si
retn
sub_14AA8 endp




sub_14ACE proc near
push    si
push    di
mov     si, 82DAh
mov     di, 16h
jmp     short loc_14AE8

loc_14AD8:
cmp     byte ptr [si+5Dh], 0
jz      short loc_14AE4
mov     ax, [si+8]
mov     [si+4], ax

loc_14AE4:
dec     di
add     si, 5Eh ; '^'

loc_14AE8:
or      di, di
jnz     short loc_14AD8
pop     di
pop     si
retn
sub_14ACE endp



; Attributes: bp-based frame

sub_14AEF proc near

arg_0= byte ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    ds
push    [bp+arg_2]
mov     al, [bp+arg_0]
mov     ah, 0
push    ax
call    sub_46F25
push    ax
call    sub_46CCE
or      dx, ax
jz      short loc_14B10
mov     ax, 1
jmp     short loc_14B12

loc_14B10:
xor     ax, ax

loc_14B12:
pop     bp
retn    4
sub_14AEF endp



; Attributes: bp-based frame

sub_14B16 proc near

var_6= byte ptr -6
var_5= byte ptr -5
var_4= dword ptr -4
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 6
push    si
mov     si, ds:8B9Fh
mov     ax, si
les     bx, ds:1C86h
add     bx, ax
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
mov     [bp+var_5], 0

loc_14B33:
mov     ax, si
inc     si
cmp     ax, ds:1C94h
jb      short loc_14B42
mov     [bp+var_6], 0
jmp     short loc_14B74

loc_14B42:
les     bx, [bp+var_4]
inc     word ptr [bp+var_4]
mov     al, es:[bx]
mov     [bp+var_6], al
cmp     al, 20h ; ' '
jge     short loc_14B56
mov     [bp+var_6], 20h ; ' '

loc_14B56:
cmp     [bp+var_6], 20h ; ' '
jnz     short loc_14B62
cmp     [bp+var_5], 20h ; ' '
jz      short loc_14B6C

loc_14B62:
mov     ax, [bp+arg_0]
dec     [bp+arg_0]
or      ax, ax
jz      short loc_14B74

loc_14B6C:
mov     al, [bp+var_6]
mov     [bp+var_5], al
jmp     short loc_14B33

loc_14B74:
mov     al, [bp+var_6]
pop     si
mov     sp, bp
pop     bp
retn    2
sub_14B16 endp



; Attributes: bp-based frame

sub_14B7E proc near

var_9= dword ptr -9
var_4= dword ptr -4
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
sub     sp, 0Ah
push    si
push    di
mov     si, ds:1C96h
mov     ax, si
les     bx, ds:1C86h
add     bx, ax
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
jmp     short loc_14BBA

loc_14B9A:
dec     si
dec     word ptr [bp+var_4]
les     bx, [bp+var_4]
mov     al, es:[bx]
mov     byte ptr [bp+var_9], al
push    [bp+arg_2]
push    word ptr [bp+var_9]
call    sub_14AEF
or      ax, ax
jnz     short loc_14BBA
inc     si
inc     word ptr [bp+var_4]
jmp     short loc_14BBE

loc_14BBA:
or      si, si
jnz     short loc_14B9A

loc_14BBE:
mov     ds:8B9Fh, si
xor     di, di
mov     bx, [bp+arg_4]
push    ds
pop     es
mov     word ptr [bp+var_9+3], es
mov     word ptr [bp+var_9+1], bx
jmp     short loc_14BF8

loc_14BD1:
les     bx, [bp+var_4]
mov     al, es:[bx]
mov     byte ptr [bp+var_9], al
inc     word ptr [bp+var_4]
inc     si
push    [bp+arg_2]
push    word ptr [bp+var_9]
call    sub_14AEF
or      ax, ax
jz      short loc_14C03
mov     al, byte ptr [bp+var_9]
les     bx, [bp+var_9+1]
mov     es:[bx], al
inc     word ptr [bp+var_9+1]
inc     di

loc_14BF8:
cmp     si, ds:1C94h
jnb     short loc_14C03
cmp     di, [bp+arg_0]
jb      short loc_14BD1

loc_14C03:
les     bx, [bp+var_9+1]
mov     byte ptr es:[bx], 0
pop     di
pop     si
mov     sp, bp
pop     bp
retn    6
sub_14B7E endp



; Attributes: bp-based frame

sub_14C12 proc near

var_46= byte ptr -46h
arg_0= byte ptr  4

push    bp
mov     bp, sp
sub     sp, 46h
push    si
push    di
lea     ax, [bp+var_46]
push    ax
call    sub_14957
mov     bx, ss
mov     es, bx
lea     bx, [bp+var_46]
mov     word ptr ds:1CB0h, es
mov     ds:1CAEh, bx
cmp     [bp+arg_0], 1Bh
jnz     short loc_14C3E
mov     word ptr ds:1C5Bh, 0FF00h
jmp     short loc_14C5A

loc_14C3E:
cmp     [bp+arg_0], 0FFh
jz      short loc_14C70
mov     al, [bp+arg_0]
cbw
mov     ds:1C5Bh, ax
mov     word ptr ds:1D1Ah, 0
mov     al, [bp+arg_0]
cbw
test    ax, 0FF00h
jz      short loc_14C62

loc_14C5A:
mov     word ptr ds:1D1Ah, 2
jmp     short loc_14C74

loc_14C62:
test    [bp+arg_0], 0FFh
jz      short loc_14C74
mov     word ptr ds:1D1Ah, 1
jmp     short loc_14C74

loc_14C70:
mov     [bp+arg_0], 1Bh

loc_14C74:
inc     word ptr ds:1DE8h

loc_14C78:
cmp     word ptr ds:0BFBAh, 0
jz      short loc_14CAB
cmp     byte ptr ds:942Ch, 0
jnz     short loc_14CAB
push    ds
mov     ax, 942Ch
push    ax
push    ds
mov     ax, 9877h
push    ax
call    sub_46D76
push    ds
mov     ax, 942Ch
push    ax
call    sub_30B00
les     bx, ds:0BFBCh
mov     word ptr ds:1C7Ch, es
mov     ds:1C7Ah, bx

loc_14CAB:
les     bx, ds:1C86h
add     bx, ds:1C94h
mov     byte ptr es:[bx], 1Ah
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
mov     bx, ax
mov     word ptr [bx-73AAh], 0FFFFh
call    sub_1481D
cmp     word ptr ds:4066h, 0
jnz     short loc_14D18
mov     ax, ds:1FF2h
mov     dx, 52h ; 'R'
mul     dx
mov     bx, ax
mov     ax, [bx-71D1h]
mov     ds:1C96h, ax
push    ds
mov     ax, ds:1FF2h
mov     dx, 11h
mul     dx
add     ax, 8D96h
push    ax
push    ds
mov     ax, 1CB5h
push    ax
mov     ax, 11h
push    ax
call    sub_46A2C
mov     ax, ds:1FF2h
mov     dx, 6
mul     dx
mov     bx, ax
mov     ax, [bx+2004h]
mov     dx, ds:1C68h
and     dx, 0FFEFh
or      ax, dx
mov     ds:1C68h, ax

loc_14D18:
push    word ptr ds:4900h
call    sub_1E8C0
mov     di, ax
xor     ax, ax
push    ax
call    sub_1DC5F
mov     ax, 1
push    ax
call    sub_1DC39
push    ax
call    sub_1DCCB
mov     ax, ds:1C96h
cmp     ax, ds:1C94h
jbe     short loc_14D41
mov     ax, ds:1C94h
mov     ds:1C96h, ax

loc_14D41:
mov     word ptr ds:1DD3h, 0F2h
push    ds
mov     ax, 1C5Eh
push    ax
call    sub_46238
pop     cx
pop     cx
mov     si, ax
or      si, si
jl      short loc_14D61
mov     bx, si
shl     bx, 1
mov     si, [bx+1E6Fh]

loc_14D61:
and     word ptr ds:1C68h, 0FCFFh
test    word ptr ds:1C98h, 1
jz      short loc_14D8B
lea     ax, [bp+var_46]
push    ax
call    sub_14A39
and     word ptr ds:1C98h, 0FFFEh
mov     word ptr ds:1D2Eh, 0
mov     word ptr ds:99FDh, 1
call    sub_11D3B

loc_14D8B:
cmp     word ptr ds:4066h, 0
jnz     short loc_14D95
call    sub_17CEE

loc_14D95:
push    ds
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jz      short loc_14DAE
jmp     loc_14C78

loc_14DAE:
cmp     [bp+arg_0], 1Bh
jz      short loc_14DED
mov     ax, si
cmp     ax, 0FFFFh
jz      short loc_14DEA
cmp     ax, 1
jz      short loc_14DC2
jmp     short loc_14DED

loc_14DC2:
mov     ax, 8C1Bh
push    ax
mov     ax, 16D7h
push    ax
mov     ax, 20h ; ' '
push    ax
call    sub_14B7E
mov     ax, 2
push    ax
call    sub_1611D
push    ax
call    sub_11EA2
mov     si, ax
mov     ax, si
cmp     ax, 0FFFFh
jl      short loc_14DE8
jmp     loc_14C78

loc_14DE8:
jmp     short loc_14DED

loc_14DEA:
mov     si, 500h

loc_14DED:
xor     ax, ax
push    ax
call    sub_1DC39
push    ax
call    sub_1DCCB
push    di
call    sub_1E8C0
xor     ax, ax
push    ax
call    sub_1DC5F
dec     word ptr ds:1DE8h
mov     word ptr ds:1CB0h, 0
mov     word ptr ds:1CAEh, 0
mov     ax, si
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_14C12 endp




sub_14E1B proc near
push    si
push    di
cmp     word ptr ds:1D20h, 0
jz      short loc_14E2C
mov     ah, 48h ; 'H'
mov     dx, ds:8BA6h
int     67h             ;  - LIM EMS - RESTORE MAPPING CONTEXT
                        ; DX = handle
                        ; Return: AH = status

loc_14E2C:
pop     di
pop     si
retn
sub_14E1B endp




sub_14E2F proc near
push    si
push    di
cmp     word ptr ds:1D20h, 0
jz      short loc_14E40
mov     ah, 47h ; 'G'
mov     dx, ds:8BA6h
int     67h             ;  - LIM EMS - SAVE MAPPING CONTEXT
                        ; DX = handle
                        ; Return: AH = status

loc_14E40:
pop     di
pop     si
retn
sub_14E2F endp




sub_14E43 proc near
push    si
push    di
cmp     word ptr ds:1D20h, 0
jz      short loc_14E65
mov     di, ds:1D22h
xor     si, si
jmp     short loc_14E61

loc_14E54:
mov     bx, si
mov     al, bl
mov     ah, 44h ; 'D'
mov     dx, ds:8BA6h
int     67h             ;  - LIM EMS - MAP MEMORY
                        ; AL = physical page number (0-3)
                        ; BX = logical page number, DX = handle
                        ; Return: AH = status
inc     si

loc_14E61:
cmp     si, di
jb      short loc_14E54

loc_14E65:
pop     di
pop     si
retn
sub_14E43 endp




sub_14E68 proc near
push    si
push    di
cmp     word ptr ds:1D20h, 0
jz      short loc_14E79
mov     ah, 45h ; 'E'
mov     dx, ds:8BA6h
int     67h             ;  - LIM EMS - RELEASE HANDLE AND MEMORY
                        ; DX = EMM handle
                        ; Return: AH = status

loc_14E79:
pop     di
pop     si
retn
sub_14E68 endp



; Attributes: bp-based frame

sub_14E7C proc near

var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 8
push    si
push    di
mov     di, 1D24h
mov     ax, ds:1C09h
mov     [bp+var_6], ax
mov     [bp+var_8], ax
cmp     word ptr ds:1D20h, 0
jz      short loc_14EBF
xor     bx, bx
mov     es, bx
assume es:nothing
mov     bx, 19Eh
mov     es, word ptr es:[bx]
assume es:nothing
mov     si, 0Ah
jmp     short loc_14EA8

loc_14EA6:
inc     si
inc     di

loc_14EA8:
cmp     si, 12h
jnb     short loc_14EB4
mov     al, es:[si]
cmp     al, [di]
jz      short loc_14EA6

loc_14EB4:
cmp     si, 12h
jz      short loc_14EC4
mov     word ptr ds:1D20h, 0

loc_14EBF:
mov     [bp+var_8], 0

loc_14EC4:
cmp     word ptr ds:1D20h, 0
jz      short loc_14F15
mov     ah, 42h ; 'B'
int     67h             ;  - LIM EMS - GET NUMBER OF PAGES
                        ; Return: AH = 00h function successful, BX = number of unallocated pages
                        ; DX = total number of pages
                        ; AH = error code
mov     ax, bx
xor     dx, dx
mov     cl, 0Eh
call    sub_1EDF6
mov     [bp+var_2], dx
mov     [bp+var_4], ax
mov     dx, [bp+arg_2]
mov     ax, [bp+arg_0]
cmp     dx, [bp+var_2]
jb      short loc_14EFE
ja      short loc_14EF2
cmp     ax, [bp+var_4]
jbe     short loc_14EFE

loc_14EF2:
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]
mov     [bp+arg_2], dx
mov     [bp+arg_0], ax

loc_14EFE:
mov     ax, [bp+var_8]
xor     dx, dx
cmp     dx, [bp+arg_2]
jb      short loc_14F15
ja      short loc_14F0F
cmp     ax, [bp+arg_0]
jbe     short loc_14F15

loc_14F0F:
mov     ax, [bp+arg_0]
mov     [bp+var_8], ax

loc_14F15:
call    sub_1BEA3
mov     cx, ax
mov     ax, [bp+var_6]
cmp     ax, cx
jbe     short loc_14F24
mov     [bp+var_6], cx

loc_14F24:
mov     ax, [bp+var_6]
cmp     ax, [bp+var_8]
jbe     short loc_14F37
mov     ds:1C09h, ax
mov     word ptr ds:1D20h, 0
jmp     short loc_14F66

loc_14F37:
mov     ax, [bp+var_8]
mov     ds:1C09h, ax
mov     bx, ax
dec     bx
mov     cl, 0Eh
shr     bx, cl
inc     bx
mov     ah, 43h ; 'C'
int     67h             ;  - LIM EMS - GET HANDLE AND ALLOCATE MEMORY
                        ; BX = number of logical pages to allocate
                        ; Return: AH = status
mov     ds:1D22h, bx
mov     ds:8BA6h, dx
call    sub_14E2F
call    sub_14E43
mov     ah, 41h ; 'A'
int     67h             ;  - LIM EMS - GET PAGE FRAME SEGMENT
                        ; Return: AH = 00h function successful, BX = segment of page frame
                        ; AH = error code
mov     dx, bx
xor     ax, ax
mov     ds:8BA3h, dx
mov     ds:8BA1h, ax

loc_14F66:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    4
sub_14E7C endp



; Attributes: bp-based frame

sub_14F6E proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    [bp+arg_2]
push    [bp+arg_0]
xor     ax, ax
push    ax
push    ax
call    sub_19A67
mov     ax, [bp+arg_2]
pop     bp
retn    4
sub_14F6E endp



; Attributes: bp-based frame

sub_14F85 proc near

var_50= byte ptr -50h
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
sub     sp, 50h
push    si
push    di
mov     di, [bp+arg_2]
mov     si, 0C63h
mov     bx, [bp+arg_4]
cmp     byte ptr [bx], 0
jz      short loc_14F9F
mov     si, bx
jmp     short loc_14FEF

loc_14F9F:
push    ds
push    di
call    sub_105F1
or      ax, ax
jz      short loc_14FAC
mov     si, di
jmp     short loc_14FEF

loc_14FAC:
cmp     byte ptr ds:2C7Ch, 0
jz      short loc_14FCC
push    ds
lea     ax, [bp+var_50]
push    ax
push    di
call    sub_19458
push    ax
mov     ax, 2C7Ch
push    ax
call    sub_14F6E
push    ax
call    sub_105F1
or      ax, ax
jnz     short loc_14FEC

loc_14FCC:
cmp     byte ptr ds:991Bh, 0
jz      short loc_14FEF
push    ds
lea     ax, [bp+var_50]
push    ax
push    di
call    sub_19458
push    ax
mov     ax, 991Bh
push    ax
call    sub_14F6E
push    ax
call    sub_105F1
or      ax, ax
jz      short loc_14FEF

loc_14FEC:
lea     si, [bp+var_50]

loc_14FEF:
push    [bp+arg_0]
push    si
call    sub_19458
pop     di
pop     si
mov     sp, bp
pop     bp
retn    6
sub_14F85 endp




sub_14FFE proc near
push    si
mov     si, 1
cmp     word ptr ds:1D2Eh, 0
jz      short loc_1500C
jmp     loc_1507D

loc_1500C:
mov     word ptr ds:1DD3h, 127h
xor     ax, ax
push    ax
mov     ax, 0C6Fh
push    ax
mov     ax, 15F7h
push    ax
mov     ax, 9877h
push    ax
mov     ax, 0FFFFh
push    ax
mov     ax, 0C81h
push    ax
mov     ax, 5
push    ax
mov     ax, 0Ah
push    ax
mov     ax, 4
push    ax
call    sub_18EAD
add     sp, 12h
cbw
cmp     ax, 1Bh
jz      short loc_1507B
cmp     ax, 4Eh ; 'N'
jz      short loc_1505E
cmp     ax, 59h ; 'Y'
jz      short loc_1504D
jmp     short loc_1507D

loc_1504D:
call    sub_153A6
cmp     ax, 1
jnz     short loc_1505A
mov     si, 1
jmp     short loc_1505C

loc_1505A:
xor     si, si

loc_1505C:
jmp     short loc_1507D

loc_1505E:
mov     ax, ds:0BFBCh
or      ax, ds:0BFBEh
jz      short loc_15070
les     bx, ds:0BFBCh
mov     word ptr es:[bx], 0FFFFh

loc_15070:
call    sub_147A2
call    sub_14911
call    sub_14AA8
jmp     short loc_1507D

loc_1507B:
xor     si, si

loc_1507D:
mov     ax, si
pop     si
retn
sub_14FFE endp



; Attributes: bp-based frame

sub_15081 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
mov     di, [bp+arg_0]
xor     si, si
call    sub_14FFE
or      ax, ax
jnz     short loc_15095
jmp     loc_15129

loc_15095:
mov     word ptr ds:1C96h, 0FFFFh
mov     word ptr ds:1C98h, 0
call    sub_11C33
cmp     byte ptr [di], 0
jnz     short loc_150AC
jmp     loc_1516C

loc_150AC:
push    ds
push    di
call    sub_105F1
or      ax, ax
jnz     short loc_150B8
jmp     loc_1514D

loc_150B8:
mov     word ptr ds:40DAh, 9
mov     ax, 0FFFFh
push    ax
call    sub_156D7
push    ds
inc     word ptr ds:1DE8h
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jz      short loc_150E6
dec     word ptr ds:1DE8h
jmp     loc_1516C

loc_150E6:
mov     ax, ds:1C8Ah
xor     dx, dx
cmp     dx, ds:37Ah
ja      short loc_1512F
jnz     short loc_150F9
cmp     ax, ds:378h
ja      short loc_1512F

loc_150F9:
mov     word ptr ds:1DD3h, 128h
xor     ax, ax
push    ax
mov     ax, 0C6Fh
push    ax
mov     ax, 1684h
push    ax
push    di
mov     ax, 0FFFFh
push    ax
mov     ax, 0C81h
push    ax
mov     ax, 5
push    ax
mov     ax, 0Ah
push    ax
mov     ax, 4
push    ax
call    sub_18EAD
add     sp, 12h
cmp     al, 59h ; 'Y'
jz      short loc_1512F

loc_15129:
mov     ax, 0FFFFh
jmp     loc_151B1

loc_1512F:
push    ds
push    di
push    word ptr ds:1C8Ah
push    ds
mov     ax, 1C94h
push    ax
push    word ptr ds:1C88h
push    word ptr ds:1C86h
call    sub_102E5
mov     si, ax
dec     word ptr ds:1DE8h
jmp     short loc_15150

loc_1514D:
mov     si, 1

loc_15150:
cmp     si, 1
jnz     short loc_1515D
mov     word ptr ds:1C94h, 0
jmp     short loc_15190

loc_1515D:
cmp     si, 2
jnz     short loc_15170
mov     ax, 1679h
push    ax
xor     ax, ax
push    ax
call    sub_19065

loc_1516C:
xor     ax, ax
jmp     short loc_151B1

loc_15170:
mov     ax, ds:1C8Ah
xor     dx, dx
cmp     dx, ds:37Ah
ja      short loc_1518C
jnz     short loc_15183
cmp     ax, ds:378h
ja      short loc_1518C

loc_15183:
mov     ax, ds:1C8Ah
add     ax, 0FFFEh
mov     ds:1C94h, ax

loc_1518C:
push    di
call    sub_11D26

loc_15190:
xor     si, si
jmp     short loc_151A5

loc_15194:
les     bx, ds:1C86h
cmp     byte ptr es:[bx+si], 1Ah
jnz     short loc_151A4
mov     ds:1C94h, si
jmp     short loc_151AB

loc_151A4:
inc     si

loc_151A5:
cmp     si, ds:1C94h
jb      short loc_15194

loc_151AB:
call    sub_14ACE
mov     ax, 1

loc_151B1:
pop     di
pop     si
pop     bp
retn    2
sub_15081 endp



; Attributes: bp-based frame

sub_151B7 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    [bp+arg_2]
call    sub_19C1B
mov     ax, 91C8h
push    ax
mov     ax, 1088h
push    ax
call    sub_19458
push    [bp+arg_0]
call    sub_19C39
pop     bp
retn    4
sub_151B7 endp



; Attributes: bp-based frame

sub_151D5 proc near

var_52= word ptr -52h
var_50= byte ptr -50h
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 52h
push    si
push    di
mov     si, [bp+arg_0]
mov     word ptr ds:40DAh, 8
mov     ax, 0FFFFh
push    ax
call    sub_156D7
cmp     byte ptr [si], 0
jnz     short loc_151F8
mov     di, 0CA4h
jmp     loc_1527F

loc_151F8:
push    ds
push    si
call    sub_103E8
test    ax, 1
jz      short loc_15208
mov     di, 0D03h
jmp     loc_1527F

loc_15208:
cmp     word ptr ds:23BFh, 0
jz      short loc_15229
push    si
lea     ax, [bp+var_50]
push    ax
call    sub_151B7
push    ss
lea     ax, [bp+var_50]
push    ax
call    sub_10394
push    ss
lea     ax, [bp+var_50]
push    ax
push    ds
push    si
call    sub_103BD

loc_15229:
push    ds
push    si
mov     ax, ds:1C94h
inc     ax
push    ax
push    word ptr ds:1C88h
push    word ptr ds:1C86h
call    sub_10332
mov     [bp+var_52], ax
cmp     ax, 1
jnz     short loc_15248
mov     di, 0CCDh
jmp     short loc_1527F

loc_15248:
cmp     [bp+var_52], 2
jnz     short loc_15253
mov     di, 0CE1h
jmp     short loc_1527F

loc_15253:
cmp     [bp+var_52], 3
jnz     short loc_1525E
mov     di, 0CF2h
jmp     short loc_1527F

loc_1525E:
cmp     word ptr ds:1D2Eh, 0
jnz     short loc_15270
push    si
call    sub_11C40
push    dx
push    ax
call    sub_11CE4
jmp     short loc_15274

loc_15270:
push    si
call    sub_11D26

loc_15274:
call    sub_17CEE
call    sub_14911
mov     ax, 1
jmp     short loc_15288

loc_1527F:
push    di
xor     ax, ax
push    ax
call    sub_19065
xor     ax, ax

loc_15288:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_151D5 endp



; Attributes: bp-based frame

sub_15290 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
jmp     short loc_1529A

loc_15299:
inc     si

loc_1529A:
cmp     byte ptr [si], 20h ; ' '
jz      short loc_15299
cmp     byte ptr [si], 0
jnz     short loc_152A9
mov     ax, 1
jmp     short loc_152E6

loc_152A9:
push    si
call    sub_19C1B
test    ax, 0Eh
jnz     short loc_152C4
push    word ptr [si]
call    sub_1044A
or      ax, ax
jz      short loc_152C0
mov     ax, 2
jmp     short loc_152C2

loc_152C0:
xor     ax, ax

loc_152C2:
jmp     short loc_152E6

loc_152C4:
push    ds
push    si
call    sub_104B9
or      ax, ax
jnz     short loc_152DF
cmp     byte ptr [si], 0
jz      short loc_152E4
cmp     byte ptr [si+1], 3Ah ; ':'
jnz     short loc_152E4
push    word ptr [si]
call    sub_1044A
jmp     short loc_152E4

loc_152DF:
mov     ax, 2
jmp     short loc_152E6

loc_152E4:
xor     ax, ax

loc_152E6:
pop     si
pop     bp
retn    2
sub_15290 endp



; Attributes: bp-based frame

sub_152EB proc near

var_50= byte ptr -50h
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 50h
push    si
push    di
push    [bp+arg_0]
call    sub_15081
mov     si, ax
mov     ax, si
cmp     ax, 0FFFFh
jnz     short loc_15307
xor     ax, ax
jmp     loc_1539E

loc_15307:
or      si, si
jnz     short loc_15333
mov     word ptr ds:1C94h, 0
mov     al, 0
push    ax
push    ss
lea     ax, [bp+var_50]
push    ax
call    sub_10534
lea     ax, [bp+var_50]
push    ax
mov     ax, 0E50h
push    ax
call    sub_19483
lea     ax, [bp+var_50]
push    ax
call    sub_17D70
mov     si, 1
jmp     short loc_15341

loc_15333:
push    ss
lea     ax, [bp+var_50]
push    ax
push    ds
push    [bp+arg_0]
call    sub_46D76

loc_15341:
mov     ax, 9877h
push    ax
lea     ax, [bp+var_50]
push    ax
call    sub_19C57
push    ds
mov     ax, 9877h
push    ax
push    word ptr ds:1C6Ch
push    word ptr ds:1C6Ah
call    sub_463CE
add     sp, 8
call    sub_17DD8
mov     ax, 0FFFFh
push    ax
call    sub_1774F
call    sub_147A2
and     word ptr ds:1C68h, 0FFDFh
mov     di, ds:4066h
mov     word ptr ds:4066h, 0
xor     ax, ax
push    ax
call    sub_1B056
or      ax, ax
jz      short loc_15392
mov     al, 1Bh
push    ax
call    sub_14C12
jmp     short loc_15398

loc_15392:
xor     ax, ax
push    ax
call    sub_1AE6D

loc_15398:
mov     ds:4066h, di
mov     ax, si

loc_1539E:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_152EB endp



; Attributes: bp-based frame

sub_153A6 proc near

var_50= byte ptr -50h

push    bp
mov     bp, sp
sub     sp, 50h
push    si
mov     ax, 9877h
push    ax
call    sub_19C1B
mov     ax, 9170h
push    ax
mov     ax, 1D30h
push    ax
call    sub_19497
or      ax, ax
jz      short loc_153C6
jmp     loc_1546F

loc_153C6:
mov     ax, 91C8h
push    ax
mov     ax, 0E56h
push    ax
call    sub_19497
or      ax, ax
jz      short loc_153D8
jmp     loc_1546F

loc_153D8:
lea     ax, [bp+var_50]
push    ax
mov     ax, 9877h
push    ax
call    sub_19458
mov     word ptr ds:1DD3h, 129h
mov     ax, 15ACh
push    ax
lea     ax, [bp+var_50]
push    ax
mov     ax, 7
push    ax
mov     ax, 3
push    ax
mov     ax, 50h ; 'P'
push    ax
mov     ax, 28h ; '('
push    ax
call    sub_18E6D
mov     si, ax
mov     ax, si
or      ax, ax
jl      short loc_15423
lea     ax, [bp+var_50]
push    ax
xor     ax, ax
push    ax
push    ax
mov     ax, 0E56h
push    ax
call    sub_14398
mov     si, ax
mov     ax, si
or      ax, ax
jge     short loc_15431

loc_15423:
cmp     si, 0FFFFh
jnz     short loc_1542C
xor     ax, ax
jmp     short loc_1542E

loc_1542C:
mov     ax, si

loc_1542E:
jmp     loc_154E1

loc_15431:
push    ss
lea     ax, [bp+var_50]
push    ax
call    sub_105F1
or      ax, ax
jz      short loc_1544D
lea     ax, [bp+var_50]
push    ax
call    sub_1913E
or      ax, ax
jnz     short loc_1544D
xor     ax, ax
jmp     loc_154E1

loc_1544D:
lea     ax, [bp+var_50]
push    ax
lea     ax, [bp+var_50]
push    ax
call    sub_19C57
push    ss
lea     ax, [bp+var_50]
push    ax
push    word ptr ds:1C6Ch
push    word ptr ds:1C6Ah
call    sub_463CE
add     sp, 8

loc_1546F:
push    word ptr ds:1C6Ah
call    sub_151D5
or      ax, ax
jz      short loc_154C9
mov     ax, ds:0BFBCh
or      ax, ds:0BFBEh
jz      short loc_15488
call    sub_308AB

loc_15488:
mov     ax, 9877h
push    ax
push    word ptr ds:1C6Ah
call    sub_19497
or      ax, ax
jz      short loc_154B4
push    ds
mov     ax, 9877h
push    ax
push    word ptr ds:1C6Ch
push    word ptr ds:1C6Ah
call    sub_46D76
mov     ax, 98C7h
push    ax
mov     ax, 9877h
push    ax
call    sub_19458

loc_154B4:
call    sub_17DD8
mov     ax, 0FFFFh
push    ax
call    sub_17720
call    sub_1492F
call    sub_14ACE
mov     ax, 1
jmp     short loc_154E1

loc_154C9:
push    ds
mov     ax, 9877h
push    ax
push    word ptr ds:1C6Ch
push    word ptr ds:1C6Ah
call    sub_463CE
add     sp, 8
mov     ax, 0FFFFh

loc_154E1:
pop     si
mov     sp, bp
pop     bp
retn
sub_153A6 endp



; Attributes: bp-based frame

sub_154E6 proc near

var_50= byte ptr -50h

push    bp
mov     bp, sp
sub     sp, 50h
push    si
mov     ax, 15BCh
push    ax
mov     ax, 4730h
push    ax
mov     ax, 50h ; 'P'
push    ax
call    sub_1917C
mov     si, ax
mov     ax, si
or      ax, ax
jl      short loc_15543
mov     ax, 4730h
push    ax
call    sub_1943A
lea     ax, [bp+var_50]
push    ax
mov     ax, 4730h
push    ax
xor     ax, ax
push    ax
mov     ax, 0E56h
push    ax
call    sub_14398
mov     si, ax
mov     ax, si
or      ax, ax
jl      short loc_15543
lea     ax, [bp+var_50]
push    ax
call    sub_152EB
or      ax, ax
jnz     short loc_15535
mov     si, 0FFFFh
jmp     short loc_15543

loc_15535:
mov     byte ptr ds:98C7h, 0
xor     ax, ax
push    ax
call    sub_1AE6D
mov     si, 600h

loc_15543:
mov     ax, si
pop     si
mov     sp, bp
pop     bp
retn
sub_154E6 endp



; Attributes: bp-based frame

sub_1554A proc near

var_A2= word ptr -0A2h
var_A0= byte ptr -0A0h
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 0A2h
push    si
push    di
mov     ax, [bp+arg_2]
mov     dx, 11h
mul     dx
mov     bx, ax
mov     di, [bx+48FCh]
mov     al, [di+3]
mov     ah, 0
mov     [bp+var_A2], ax
lea     ax, [bp+var_A0]
push    ax
push    [bp+arg_0]
call    sub_19458
mov     [bp+arg_0], ax

loc_15578:
push    [bp+var_A2]
xor     ax, ax
push    ax
call    sub_1D98E
push    [bp+arg_0]
mov     al, 0FFh
push    ax
call    sub_194AB
mov     si, ax
or      si, si
jnz     short loc_1559A
push    [bp+arg_0]
call    sub_1EB1F
jmp     loc_15615

loc_1559A:
mov     byte ptr [si], 0
inc     si
push    [bp+arg_0]
call    sub_1EB1F
mov     al, [si]
cbw
dec     ax              ; switch 6 cases
cmp     ax, 5
ja      short def_155B1 ; jumptable 000155B1 default case
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_155B1[bx] ; switch jump
jpt_155B1 dw offset loc_155C2 ; jump table for switch statement
dw offset loc_155CC
dw offset loc_155D7
dw offset loc_155E2
dw offset loc_155ED
dw offset loc_155F8

loc_155C2:              ; jumptable 000155B1 case 1
mov     al, [di]
mov     ah, 0
mov     [bp+var_A2], ax
jmp     short loc_15615

loc_155CC:              ; jumptable 000155B1 case 2
mov     al, [di+1]
mov     ah, 0
mov     [bp+var_A2], ax
jmp     short loc_15615

loc_155D7:              ; jumptable 000155B1 case 3
mov     al, [di+2]
mov     ah, 0
mov     [bp+var_A2], ax
jmp     short loc_15615

loc_155E2:              ; jumptable 000155B1 case 4
mov     al, [di+3]
mov     ah, 0
mov     [bp+var_A2], ax
jmp     short loc_15615

loc_155ED:              ; jumptable 000155B1 case 5
mov     al, [di+4]
mov     ah, 0
mov     [bp+var_A2], ax
jmp     short loc_15615

loc_155F8:              ; jumptable 000155B1 case 6
mov     al, [di+5]
mov     ah, 0
mov     [bp+var_A2], ax
jmp     short loc_15615

def_155B1:              ; jumptable 000155B1 default case
test    byte ptr [si], 80h
jz      short loc_15615
mov     al, [si]
cbw
and     ax, 7Fh
push    ax
xor     ax, ax
push    ax
call    sub_1DC08

loc_15615:
mov     ax, si
inc     ax
mov     [bp+arg_0], ax
or      si, si
jz      short loc_15629
mov     bx, ax
cmp     byte ptr [bx], 0
jz      short loc_15629
jmp     loc_15578

loc_15629:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    4
sub_1554A endp



; Attributes: bp-based frame

sub_15631 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
push    word ptr ds:4966h
call    sub_1E8C0
mov     di, ax
mov     ax, 9
push    ax
mov     ax, ds:1D3Ch
and     ax, 40h
push    ax
call    sub_1ADEF
mov     ax, 8
push    ax
mov     ax, ds:1D3Ch
and     ax, 20h
push    ax
call    sub_1ADEF
mov     ax, 7
push    ax
mov     ax, ds:1D3Ch
and     ax, 10h
push    ax
call    sub_1ADEF
mov     bx, ds:4962h
mov     al, [bx+3]
mov     ah, 0
push    ax
xor     ax, ax
push    ax
call    sub_1D98E
call    sub_1DA26
mov     ax, 6
push    ax
push    [bp+arg_0]
call    sub_1554A
mov     bx, ds:4962h
mov     al, [bx+4]
mov     ah, 0
mov     si, ax
mov     ax, 9
push    ax
call    sub_1ACE5
mov     ax, 1
push    ax
push    ax
mov     ax, 14B2h
push    ax
push    si
call    sub_1EB3C
mov     ax, 8
push    ax
call    sub_1ACE5
mov     ax, 1
push    ax
push    ax
mov     ax, 14B9h
push    ax
push    si
call    sub_1EB3C
mov     ax, 7
push    ax
call    sub_1ACE5
mov     ax, 1
push    ax
push    ax
mov     ax, 14BFh
push    ax
push    si
call    sub_1EB3C
push    di
call    sub_1E8C0
pop     di
pop     si
pop     bp
retn    2
sub_15631 endp



; Attributes: bp-based frame

sub_156D7 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
cmp     byte ptr ds:1D40h, 0
jnz     short loc_156E6
jmp     loc_1576D

loc_156E6:
call    sub_107B7
mov     si, ax
xor     si, ds:1D3Ch
xor     ds:1D3Ch, si
test    si, 70h
jz      short loc_156FF
mov     word ptr ds:1D38h, 0FFFFh

loc_156FF:
mov     word ptr ds:1D3Ah, 0
test    word ptr ds:1D3Ch, 3
jz      short loc_15713
mov     word ptr ds:1D3Ah, 1

loc_15713:
test    word ptr ds:1D3Ch, 4
jz      short loc_15721
mov     word ptr ds:1D3Ah, 2

loc_15721:
test    word ptr ds:1D3Ch, 8
jz      short loc_1572F
mov     word ptr ds:1D3Ah, 3

loc_1572F:
mov     bx, ds:40DAh
shl     bx, 1
shl     bx, 1
shl     bx, 1
mov     ax, ds:1D3Ah
shl     ax, 1
add     bx, ax
mov     di, [bx+40DCh]
cmp     di, ds:1D38h
jnz     short loc_15751
cmp     [bp+arg_0], 3E7h
jnz     short loc_1576D

loc_15751:
cmp     word ptr ds:1D3Eh, 0
jz      short loc_1575D
mov     ax, ds:1D3Eh
jmp     short loc_15769

loc_1575D:
mov     bx, di
mov     ds:1D38h, bx
shl     bx, 1
mov     ax, [bx+418Ch]

loc_15769:
push    ax
call    sub_15631

loc_1576D:
pop     di
pop     si
pop     bp
retn    2
sub_156D7 endp



; Attributes: bp-based frame

sub_15773 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
cmp     word ptr ds:1D3Eh, 0
jnz     short loc_15787
mov     ax, [bp+arg_0]
mov     ds:1D3Eh, ax
push    ax
call    sub_15631

loc_15787:
pop     bp
retn    2
sub_15773 endp



; Attributes: bp-based frame

sub_1578B proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     ax, [bp+arg_0]
mov     ds:1D41h, ax
pop     bp
retn    2
sub_1578B endp




sub_15798 proc near
push    si
mov     si, ds:1D41h
mov     word ptr ds:1D41h, 0
mov     ax, si
pop     si
retn
sub_15798 endp




sub_157A7 proc near
push    si
push    di
mov     ax, 0FFFFh
push    ax
call    sub_156D7
mov     byte ptr ds:8BE8h, 0
cmp     word ptr ds:1D41h, 0
jz      short loc_157C2
mov     ax, ds:1D41h
jmp     loc_1584F

loc_157C2:
call    sub_107E7
mov     di, ax
mov     ax, di
or      ax, ax
jnz     short loc_157D0
jmp     loc_1584D

loc_157D0:
push    di
call    sub_11EA2
mov     si, ax
cmp     byte ptr ds:1D40h, 0
jz      short loc_15823
cmp     si, 0FFFBh
jz      short loc_157E7
cmp     si, 0FFFAh
jnz     short loc_15804

loc_157E7:
call    sub_1090A
cmp     si, 0FFFBh
jnz     short loc_157F3
xor     ax, ax
jmp     short loc_157F6

loc_157F3:
mov     ax, 1

loc_157F6:
push    ax
call    sub_1611D
mov     di, ax
mov     ax, di
push    ax
call    sub_1578B
jmp     short loc_1584D

loc_15804:
cmp     si, 0FFFEh
jnz     short loc_15823
call    sub_1090A
call    sub_165B3
mov     di, ax
mov     ax, di
push    ax
call    sub_11EA2
or      ax, ax
jle     short loc_1581D
xor     di, di

loc_1581D:
push    di
call    sub_1578B
jmp     short loc_1584D

loc_15823:
cmp     si, 0Fh
jz      short loc_15841
cmp     si, 11h
jz      short loc_15841
cmp     si, 10h
jz      short loc_15841
cmp     si, 14h
jz      short loc_15841
cmp     si, 13h
jz      short loc_15841
cmp     si, 12h
jnz     short loc_1584D

loc_15841:
call    sub_1090A
xor     di, di
push    si
call    sub_156D7
jmp     loc_157C2

loc_1584D:
mov     ax, di

loc_1584F:
pop     di
pop     si
retn
sub_157A7 endp




sub_15852 proc near
call    sub_157A7
or      ax, ax
jz      short sub_15852
cmp     word ptr ds:1D41h, 0
jz      short loc_15865
call    sub_15798
jmp     short locret_1586E

loc_15865:
mov     word ptr ds:1D3Eh, 0
call    sub_1090A

locret_1586E:
retn
sub_15852 endp



; Attributes: bp-based frame

sub_1586F proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= dword ptr  4

push    bp
mov     bp, sp
sub     sp, 4
les     bx, [bp+arg_0]
mov     dx, es:[bx+2]
mov     ax, es:[bx]
and     ax, 0FFFFh
and     dx, 0FFh
mov     [bp+var_2], dx
mov     [bp+var_4], ax
and     ax, 0
and     dx, 10h
or      dx, ax
jz      short loc_158AA
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]
or      ax, 0
or      dx, 0FF00h
mov     [bp+var_2], dx
mov     [bp+var_4], ax

loc_158AA:
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]
mov     sp, bp
pop     bp
retn    4
sub_1586F endp



; Attributes: bp-based frame

sub_158B6 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    word ptr ds:1D53h
push    [bp+arg_2]
push    [bp+arg_0]
xor     ax, ax
push    ax
call    sub_10792
pop     bp
retn    4
sub_158B6 endp



; Attributes: bp-based frame

sub_158CD proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    word ptr ds:1D53h
push    [bp+arg_2]
push    [bp+arg_0]
mov     ax, 1
push    ax
call    sub_10792
pop     bp
retn    4
sub_158CD endp



; Attributes: bp-based frame

sub_158E5 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    word ptr ds:1D53h
push    ds
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_10740
pop     bp
retn    4
sub_158E5 endp




sub_158FA proc near
push    word ptr ds:1D53h
push    ds
mov     ax, 8BF5h
push    ax
mov     ax, 3
push    ax
call    sub_10740
or      ax, ax
jz      short loc_15913
mov     ax, 1
jmp     short locret_15915

loc_15913:
xor     ax, ax

locret_15915:
retn
sub_158FA endp



; Attributes: bp-based frame

sub_15916 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
xor     si, si
jmp     short loc_15942

loc_1591E:
call    sub_158FA
or      ax, ax
jz      short loc_15946
mov     al, ds:8BF5h
cbw
cmp     ax, [bp+arg_0]
jnz     short loc_15933
mov     si, 1
jmp     short loc_15935

loc_15933:
xor     si, si

loc_15935:
or      si, si
jnz     short loc_15942
mov     ax, ds:8BF6h
cwd
push    dx
push    ax
call    sub_158CD

loc_15942:
or      si, si
jz      short loc_1591E

loc_15946:
mov     ax, si
pop     si
pop     bp
retn    2
sub_15916 endp




sub_1594D proc near
push    word ptr ds:1D53h
call    sub_10728
retn
sub_1594D endp



; Attributes: bp-based frame

sub_15955 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
xor     ax, ax
push    ax
mov     ax, 0C52h
push    ax
push    [bp+arg_0]
mov     ax, 0FFFFh
push    ax
push    [bp+arg_2]
mov     ax, 0C7Fh
push    ax
mov     ax, 0Ah
push    ax
mov     ax, 14h
push    ax
mov     ax, 0Dh
push    ax
call    sub_18EAD
mov     sp, bp
pop     bp
retn    4
sub_15955 endp



; Attributes: bp-based frame

sub_15982 proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
mov     si, [bp+arg_0]
mov     di, ds:8BEBh
mov     ax, di
mov     [bp+var_4], ax
mov     [bp+var_2], ax
mov     ax, 0C63h
push    ax
push    si
push    si
call    sub_14F85
cmp     byte ptr [si], 0
jnz     short loc_159AF
push    si
mov     ax, 0D15h
push    ax
call    sub_19458

loc_159AF:
push    ds
push    si
xor     ax, ax
push    ax
call    sub_106E6
mov     ds:1D53h, ax
or      ax, ax
jg      short loc_159C9
mov     ax, 0E1Fh
push    ax
push    si
call    sub_15955
jmp     loc_15A6A

loc_159C9:
push    word ptr ds:1D53h
push    ds
push    [bp+var_4]
mov     ax, 0D20h
push    ax
call    sub_19448
inc     ax
inc     ax
push    ax
call    sub_10740
push    [bp+var_4]
mov     ax, 0D20h
push    ax
call    sub_19497
or      ax, ax
jnz     short loc_15A0E
push    word ptr ds:1D53h
push    ds
push    [bp+var_2]
mov     ax, 1D44h
push    ax
call    sub_19448
inc     ax
push    ax
call    sub_10740
push    [bp+var_2]
mov     ax, 1D44h
push    ax
call    sub_19497
or      ax, ax
jz      short loc_15A18

loc_15A0E:
mov     ax, 14C8h
push    ax
push    si
call    sub_15955
jmp     short loc_15A6A

loc_15A18:
push    word ptr ds:1D53h
push    ds
push    di
mov     ax, 2
push    ax
call    sub_10740
cmp     byte ptr [di], 4
jz      short loc_15A34
mov     ax, 14DBh
push    ax
push    si
call    sub_15955
jmp     short loc_15A6A

loc_15A34:
xor     ax, ax
push    ax
call    sub_15916
or      ax, ax
jz      short loc_15A6A
mov     ax, 8BFAh
push    ax
push    word ptr ds:8BF6h
call    sub_158E5
mov     ax, 5
push    ax
call    sub_15916
or      ax, ax
jz      short loc_15A6A
mov     ax, 8C06h
push    ax
push    word ptr ds:8BF6h
call    sub_158E5
mov     ax, 1
push    ax
call    sub_15916
or      ax, ax
jnz     short loc_15A6E

loc_15A6A:
xor     ax, ax
jmp     short loc_15AA8

loc_15A6E:
push    word ptr ds:1D53h
push    ds
mov     ax, 8C42h
push    ax
mov     ax, 2
push    ax
call    sub_10740
xor     ax, ax
push    ax
push    ax
call    sub_158CD
mov     ds:8C40h, dx
mov     ds:8C3Eh, ax
mov     ax, ds:8C42h
mov     dx, 3
mul     dx
xor     dx, dx
add     ax, ds:8C3Eh
adc     dx, ds:8C40h
mov     ds:8C17h, dx
mov     ds:8C15h, ax
mov     ax, 1

loc_15AA8:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_15982 endp



; Attributes: bp-based frame

sub_15AB0 proc near

var_1= byte ptr -1
arg_0= byte ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 2
push    si
mov     ax, [bp+arg_2]
mov     dx, 9
mul     dx
mov     si, ax
add     si, ds:8BEDh
mov     al, [si+2]
sub     al, [si+1]
inc     al
mov     [bp+var_1], al
mov     al, [si+1]
cbw
push    ax
mov     al, [si]
cbw
push    ax
lea     ax, [bp+var_1]
push    ax
mov     al, [bp+arg_0]
mov     ah, 0
mov     cl, 8
shl     ax, cl
or      ax, 8
push    ax
call    sub_1EB6C
pop     si
mov     sp, bp
pop     bp
retn    4
sub_15AB0 endp



; Attributes: bp-based frame

sub_15AF4 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     bx, ds:1D55h
push    word ptr [bx]
mov     bx, ds:8C46h
push    word ptr [bx+4]
call    sub_15AB0
dec     [bp+arg_0]
mov     ax, [bp+arg_0]
mov     bx, ds:1D55h
mov     [bx], ax
push    ax
mov     bx, ds:8C46h
push    word ptr [bx+2]
call    sub_15AB0
pop     bp
retn    2
sub_15AF4 endp



; Attributes: bp-based frame

sub_15B22 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
mov     bx, [bp+arg_0]
xor     word ptr [bx], 1
test    word ptr [bx], 1
jz      short loc_15B3D
mov     bx, [bp+arg_2]
mov     bx, [bx]
mov     al, [bx]
and     al, 0Fh
jmp     short loc_15B4E

loc_15B3D:
mov     bx, [bp+arg_2]
mov     ax, [bx]
inc     word ptr [bx]
mov     bx, ax
mov     al, [bx]
mov     cl, 4
sar     al, cl
and     al, 0Fh

loc_15B4E:
pop     bp
retn    4
sub_15B22 endp



; Attributes: bp-based frame

sub_15B52 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    si
push    di
mov     di, [bp+arg_0]
mov     si, [bp+arg_2]
cmp     word ptr ds:1DD5h, 0
jz      short loc_15B6D
dec     word ptr ds:1DD5h
mov     al, ds:8BEAh
jmp     short loc_15BDE

loc_15B6D:
push    si
push    di
call    sub_15B22
mov     ds:8BEAh, al
cmp     al, 0Fh
jnz     short loc_15B8F
push    si
push    di
call    sub_15B22
push    ax
push    si
push    di
call    sub_15B22
mov     cl, 4
shl     al, cl
mov     dl, al
pop     ax
or      al, dl
jmp     short loc_15BDE

loc_15B8F:
cmp     byte ptr ds:8BEAh, 0Eh
jnz     short loc_15BD4
push    si
push    di
call    sub_15B22
cbw
inc     ax
mov     ds:1DD5h, ax
push    si
push    di
call    sub_15B22
mov     ds:8BEAh, al
cmp     al, 0Fh
jnz     short loc_15BC5
push    si
push    di
call    sub_15B22
push    ax
push    si
push    di
call    sub_15B22
mov     cl, 4
shl     al, cl
mov     dl, al
pop     ax
or      al, dl
mov     ds:8BEAh, al
jmp     short loc_15BDE

loc_15BC5:
mov     al, ds:8BEAh
cbw
mov     bx, ax
mov     al, [bx-73F9h]
mov     ds:8BEAh, al
jmp     short loc_15BDE

loc_15BD4:
mov     al, ds:8BEAh
cbw
mov     bx, ax
mov     al, [bx-73F9h]

loc_15BDE:
pop     di
pop     si
pop     bp
retn    4
sub_15B52 endp



; Attributes: bp-based frame

sub_15BE4 proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_6]
mov     ax, [bp+arg_4]
sub     ax, si
jz      short loc_15C10
mov     bx, [bp+arg_4]
sub     bx, si
add     bx, [bp+arg_0]
mov     byte ptr [bx], 0
mov     al, ds:8C02h
cbw
add     ax, si
inc     ax
push    ax
mov     ax, [bp+arg_2]
inc     ax
push    ax
push    [bp+arg_0]
call    sub_1ED32

loc_15C10:
pop     si
pop     bp
retn    8
sub_15BE4 endp



; Attributes: bp-based frame

sub_15C15 proc near

var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
xor     si, si
cmp     ds:8C3Ch, si
jz      short loc_15C30
cmp     ds:8C44h, si
jz      short loc_15C30
mov     si, 14FBh
jmp     short loc_15C46

loc_15C30:
cmp     word ptr ds:8C3Ch, 0
jz      short loc_15C3C
mov     si, 1505h
jmp     short loc_15C46

loc_15C3C:
cmp     word ptr ds:8C44h, 0
jz      short loc_15C46
mov     si, 1500h

loc_15C46:
mov     bx, ds:1D51h
mov     al, [bx+0Ch]
mov     ah, 0
push    ax
mov     bx, [bx]
mov     al, [bx+1]
mov     ah, 0
push    ax
call    sub_1DA05
or      si, si
jz      short loc_15C8C
mov     al, ds:8C00h
cbw
mov     di, ax
inc     di
mov     al, ds:8C01h
cbw
mov     [bp+var_2], ax
push    ds
push    si
call    sub_46E60
mov     dx, [bp+var_2]
sub     dx, ax
mov     [bp+var_4], dx
push    dx
push    di
mov     ax, [bp+var_2]
dec     ax
push    ax
push    di
push    si
mov     ax, 1
push    ax
call    sub_1D8CC

loc_15C8C:
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_15C15 endp



; Attributes: bp-based frame

sub_15C92 proc near

var_5A= word ptr -5Ah
var_58= word ptr -58h
var_56= word ptr -56h
var_53= byte ptr -53h
var_52= byte ptr -52h
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 5Ah
push    si
push    di
mov     [bp+var_5A], 0
mov     [bp+var_58], 0
xor     si, si
mov     [bp+var_56], si
call    sub_1DA26
mov     ax, ds:1DCFh
mov     dx, 6
mul     dx
mov     bx, ax
push    word ptr [bx+1D59h]
push    word ptr [bx+1D57h]
call    sub_158B6
call    sub_158FA
push    word ptr ds:8BEBh
push    word ptr ds:8BF6h
call    sub_158E5
mov     ax, ds:8BEBh
mov     [bp+var_2], ax
jmp     short loc_15D0C

loc_15CD7:
lea     ax, [bp+var_2]
push    ax
lea     ax, [bp+var_56]
push    ax
call    sub_15B52
mov     [bp+var_53], al
cbw
or      ax, ax
jz      short loc_15CEC
jmp     short loc_15D05

loc_15CEC:
push    [bp+var_58]
push    si
mov     ax, [bp+var_5A]
inc     [bp+var_5A]
push    ax
lea     ax, [bp+var_52]
push    ax
call    sub_15BE4
xor     si, si
mov     [bp+var_58], si
jmp     short loc_15D0C

loc_15D05:
mov     al, [bp+var_53]
mov     [bp+si+var_52], al
inc     si

loc_15D0C:
mov     ax, [bp+var_2]
sub     ax, ds:8BEBh
cmp     ax, ds:8BF6h
jl      short loc_15CD7
cmp     word ptr ds:1DD5h, 0
jnz     short loc_15CD7
push    [bp+var_58]
push    si
push    [bp+var_5A]
lea     ax, [bp+var_52]
push    ax
call    sub_15BE4
call    sub_158FA
xor     ax, ax
mov     ds:8BF1h, ax
mov     ds:8C44h, ax
mov     ds:8C3Ch, ax
mov     ax, 8C3Ch
push    ax
mov     ax, 2
push    ax
call    sub_158E5
mov     ax, 8C44h
push    ax
mov     ax, 2
push    ax
call    sub_158E5
mov     ax, 8BF1h
push    ax
mov     ax, 1
push    ax
call    sub_158E5
cmp     word ptr ds:8BF1h, 0
jnz     short loc_15D6E
mov     bx, ds:1D55h
mov     word ptr [bx], 0FFFFh
jmp     short loc_15DB1

loc_15D6E:
push    word ptr ds:8BEBh
mov     ax, ds:8BF1h
mov     dx, 9
mul     dx
push    ax
call    sub_158E5
xor     di, di
jmp     short loc_15D8E

loc_15D82:
push    di
mov     bx, ds:8C46h
push    word ptr [bx+4]
call    sub_15AB0
inc     di

loc_15D8E:
cmp     di, ds:8BF1h
jl      short loc_15D82
mov     bx, ds:1D55h
cmp     word ptr [bx], 0FFFFh
jnz     short loc_15DA1
mov     word ptr [bx], 0

loc_15DA1:
mov     bx, ds:1D55h
push    word ptr [bx]
mov     bx, ds:8C46h
push    word ptr [bx+2]
call    sub_15AB0

loc_15DB1:
call    sub_15C15
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_15C92 endp



; Attributes: bp-based frame

sub_15DBA proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
mov     dx, [bp+arg_2]
mov     ax, [bp+arg_0]
push    dx
push    ax
mov     ax, ds:1DCFh
mov     dx, 6
mul     dx
mov     bx, ax
pop     ax
pop     dx
mov     [bx+1D59h], dx
mov     [bx+1D57h], ax
mov     ax, ds:1DCFh
mov     dx, 6
mul     dx
add     ax, 1D5Bh
mov     ds:1D55h, ax
mov     bx, ax
mov     word ptr [bx], 0FFFFh
call    sub_15C92
pop     bp
retn    4
sub_15DBA endp



; Attributes: bp-based frame

sub_15DF4 proc near

arg_0= byte ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
cmp     word ptr ds:1DCFh, 0
jl      short loc_15E25
mov     ax, ds:1DCFh
mov     dx, 6
mul     dx
mov     bx, ax
mov     dx, [bx+1D59h]
mov     ax, [bx+1D57h]
cmp     dx, [bp+arg_4]
jnz     short loc_15E25
cmp     ax, [bp+arg_2]
jnz     short loc_15E25
cmp     [bp+arg_0], 0
jz      short loc_15E4E
call    sub_15C92
jmp     short loc_15E4E

loc_15E25:
cmp     word ptr ds:1DCFh, 13h
jnz     short loc_15E41
push    ds
mov     ax, 1D5Dh
push    ax
push    ds
mov     ax, 1D57h
push    ax
mov     ax, 72h ; 'r'
push    ax
call    sub_46A2C
jmp     short loc_15E45

loc_15E41:
inc     word ptr ds:1DCFh

loc_15E45:
push    [bp+arg_4]
push    [bp+arg_2]
call    sub_15DBA

loc_15E4E:
pop     bp
retn    6
sub_15DF4 endp




sub_15E52 proc near
cmp     word ptr ds:1DCFh, 0
jle     short locret_15E6E
dec     word ptr ds:1DCFh
mov     ax, ds:1DCFh
mov     dx, 6
mul     dx
add     ax, 1D5Bh
mov     ds:1D55h, ax
call    sub_15C92

locret_15E6E:
retn
sub_15E52 endp



; Attributes: bp-based frame

sub_15E6F proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 4
push    si
mov     si, [bp+arg_0]
or      si, si
jl      short loc_15EC8
cmp     si, ds:8C42h
jge     short loc_15EC8
mov     ax, si
mov     dx, 3
mul     dx
xor     dx, dx
add     ax, ds:8C3Eh
adc     dx, ds:8C40h
push    dx
push    ax
call    sub_158B6
mov     ax, 8C03h
push    ax
mov     ax, 3
push    ax
call    sub_158E5
push    ds
mov     ax, 8C03h
push    ax
call    sub_1586F
mov     [bp+var_2], dx
mov     [bp+var_4], ax
cmp     dx, 0FFFFh
jnz     short loc_15EBC
cmp     ax, 0FFFFh
jz      short loc_15EC8

loc_15EBC:
cmp     [bp+var_2], 0FFFFh
jnz     short loc_15EE5
cmp     [bp+var_4], 0FFFEh
jnz     short loc_15EE5

loc_15EC8:
mov     dx, ds:8C40h
mov     ax, ds:8C3Eh
add     ax, 12Ch
adc     dx, 0
push    dx
push    ax
call    sub_158B6
mov     ax, 8C03h
push    ax
mov     ax, 3
push    ax
call    sub_158E5

loc_15EE5:
push    ds
mov     ax, 8C03h
push    ax
call    sub_1586F
pop     si
mov     sp, bp
pop     bp
retn    2
sub_15E6F endp



; Attributes: bp-based frame

sub_15EF4 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    [bp+arg_2]
call    sub_15E6F
push    dx
push    ax
push    [bp+arg_0]
call    sub_15DF4
pop     bp
retn    4
sub_15EF4 endp



; Attributes: bp-based frame

sub_15F09 proc near

var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di

def_15F92:              ; jumptable 00015F92 default case, cases 5-8
mov     word ptr ds:40DAh, 5
call    sub_15852
mov     [bp+var_2], ax
push    ax
call    sub_11EA2
mov     si, ax
cmp     si, 5
jnz     short loc_15F2D
xor     ax, ax
jmp     loc_15FF9

loc_15F2D:
cmp     si, 0FFFFh
jge     short loc_15F38
mov     ax, [bp+var_2]
jmp     loc_15FF9

loc_15F38:
cmp     si, 0Bh
jnz     short loc_15F52
cmp     word ptr ds:8C3Ch, 0
jz      short def_15F92 ; jumptable 00015F92 default case, cases 5-8
push    word ptr ds:8C3Ch
call    sub_15E6F
push    dx
push    ax
call    sub_15DBA
jmp     short def_15F92 ; jumptable 00015F92 default case, cases 5-8

loc_15F52:
cmp     si, 0Ch
jnz     short loc_15F6C
cmp     word ptr ds:8C44h, 0
jz      short def_15F92 ; jumptable 00015F92 default case, cases 5-8
push    word ptr ds:8C44h
call    sub_15E6F
push    dx
push    ax
call    sub_15DBA
jmp     short def_15F92 ; jumptable 00015F92 default case, cases 5-8

loc_15F6C:
cmp     word ptr ds:8BF1h, 0
jz      short def_15F92 ; jumptable 00015F92 default case, cases 5-8
mov     bx, ds:1D55h
mov     ax, [bx]
mov     dx, 9
mul     dx
mov     di, ax
add     di, ds:8BEDh
mov     ax, si
cmp     ax, 0Ah         ; switch 11 cases
jbe     short loc_15F8E
jmp     def_15F92       ; jumptable 00015F92 default case, cases 5-8

loc_15F8E:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_15F92[bx] ; switch jump
jpt_15F92 dw offset loc_15FC3 ; jump table for switch statement
dw offset loc_15FCE
dw offset loc_15FAD
dw offset loc_15FB8
dw offset loc_15FED
dw offset def_15F92
dw offset def_15F92
dw offset def_15F92
dw offset def_15F92
dw offset loc_15FD9
dw offset loc_15FE3

loc_15FAD:              ; jumptable 00015F92 case 2
mov     al, [di+3]
cbw
push    ax
call    sub_15AF4
jmp     def_15F92       ; jumptable 00015F92 default case, cases 5-8

loc_15FB8:              ; jumptable 00015F92 case 3
mov     al, [di+4]
cbw
push    ax
call    sub_15AF4
jmp     def_15F92       ; jumptable 00015F92 default case, cases 5-8

loc_15FC3:              ; jumptable 00015F92 case 0
mov     al, [di+5]
cbw
push    ax
call    sub_15AF4
jmp     def_15F92       ; jumptable 00015F92 default case, cases 5-8

loc_15FCE:              ; jumptable 00015F92 case 1
mov     al, [di+6]
cbw
push    ax
call    sub_15AF4
jmp     def_15F92       ; jumptable 00015F92 default case, cases 5-8

loc_15FD9:              ; jumptable 00015F92 case 9
mov     ax, 1
push    ax
call    sub_15AF4
jmp     def_15F92       ; jumptable 00015F92 default case, cases 5-8

loc_15FE3:              ; jumptable 00015F92 case 10
push    word ptr ds:8BF1h
call    sub_15AF4
jmp     def_15F92       ; jumptable 00015F92 default case, cases 5-8

loc_15FED:              ; jumptable 00015F92 case 4
push    word ptr [di+7]
xor     ax, ax
push    ax
call    sub_15EF4
jmp     def_15F92       ; jumptable 00015F92 default case, cases 5-8

loc_15FF9:
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_15F09 endp




sub_15FFF proc near
mov     ax, ds:8BF3h
cmp     ax, ds:8BEFh
jnz     short loc_1602F
mov     word ptr ds:8BF3h, 0
mov     ax, ds:8BF8h
cmp     ax, ds:8C19h
jbe     short loc_1601C
mov     ax, ds:8C19h
jmp     short loc_1601F

loc_1601C:
mov     ax, ds:8BF8h

loc_1601F:
mov     ds:8BEFh, ax
push    word ptr ds:1D53h
push    ds
push    word ptr ds:8BEBh
push    ax
call    sub_10740

loc_1602F:
dec     word ptr ds:8BF8h
mov     ax, ds:8BF3h
inc     word ptr ds:8BF3h
mov     bx, ax
add     bx, ds:8BEBh
mov     al, [bx]
retn
sub_15FFF endp



; Attributes: bp-based frame

sub_16043 proc near

var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
mov     si, [bp+arg_0]
call    sub_15FFF
cbw
mov     di, ax
mov     ax, di
mov     cl, 5
sar     ax, cl
and     ax, 7
add     ax, si
mov     si, ax
and     di, 1Fh
jmp     short loc_1606D

loc_16067:
call    sub_15FFF
mov     [si], al
inc     si

loc_1606D:
mov     ax, di
dec     di
or      ax, ax
jnz     short loc_16067
mov     byte ptr [si], 0
call    sub_15FFF
mov     byte ptr [bp+var_2], al
call    sub_15FFF
mov     byte ptr [bp+var_2+1], al
mov     ax, [bp+var_2]
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_16043 endp



; Attributes: bp-based frame

sub_1608E proc near

var_22= byte ptr -22h
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 22h
push    si
mov     [bp+var_22], 0
xor     ax, ax
mov     ds:8BEFh, ax
mov     ds:8BF3h, ax
test    word ptr ds:8BFAh, 4
jnz     short loc_160B0
mov     ax, 8C1Bh
push    ax
call    sub_1943A

loc_160B0:
push    word ptr ds:8C17h
push    word ptr ds:8C15h
call    sub_158B6
call    sub_158FA
mov     ax, ds:8BF6h
mov     ds:8BF8h, ax
call    sub_15FFF
mov     byte ptr [bp+var_2], al
call    sub_15FFF
mov     byte ptr [bp+var_2+1], al
jmp     short loc_160EA

loc_160D2:
lea     ax, [bp+var_22]
push    ax
call    sub_16043
mov     si, ax
lea     ax, [bp+var_22]
push    ax
mov     ax, 8C1Bh
push    ax
call    sub_19497
or      ax, ax
jge     short loc_160F4

loc_160EA:
mov     ax, [bp+var_2]
dec     [bp+var_2]
or      ax, ax
jnz     short loc_160D2

loc_160F4:
lea     ax, [bp+var_22]
push    ax
mov     ax, 8C1Bh
push    ax
call    sub_19497
or      ax, ax
jz      short loc_16110
mov     ax, 0DCh
push    ax
mov     ax, 1
push    ax
call    sub_15EF4
jmp     short loc_16118

loc_16110:
push    si
mov     ax, 1
push    ax
call    sub_15EF4

loc_16118:
pop     si
mov     sp, bp
pop     bp
retn
sub_1608E endp



; Attributes: bp-based frame

sub_1611D proc near

var_54= byte ptr -54h
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 54h
push    si
push    di
mov     di, [bp+arg_0]
xor     si, si
mov     ax, ds:491Eh
mov     ds:8C46h, ax
cmp     ds:1DD1h, si
jz      short loc_16159
cmp     word ptr ds:1DD1h, 1
jle     short loc_16140
jmp     loc_16275

loc_16140:
cmp     di, 1
jnz     short loc_1614B
call    sub_15E52
jmp     loc_16275

loc_1614B:
mov     ax, 64h ; 'd'
push    ax
mov     ax, 1
push    ax
call    sub_15EF4
jmp     loc_16275

loc_16159:
mov     ax, ds:40DAh
mov     [bp+var_2], ax
lea     ax, [bp+var_54]
push    ax
mov     ax, 0D15h
push    ax
call    sub_19458
call    sub_1D8C0
mov     [bp+var_4], ax
mov     ax, sp
sub     ax, ds:20h
add     ax, 0FA88h
mov     ds:8C19h, ax
mov     ax, sp
sub     ax, ds:8C19h
mov     sp, ax
mov     ax, sp
mov     ds:8BEBh, ax
mov     ds:8BEDh, ax
push    ds
inc     word ptr ds:1DE8h
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jz      short loc_161AB
xor     si, si
jmp     loc_1623F

loc_161AB:
mov     word ptr ds:1DD1h, 2
lea     ax, [bp+var_54]
push    ax
call    sub_15982
or      ax, ax
jnz     short loc_161BF
jmp     loc_1623F

loc_161BF:
mov     word ptr ds:1DD1h, 1
mov     al, ds:8C01h
cbw
mov     bx, 2
cwd
idiv    bx
mov     dl, 27h ; '''
sub     dl, al
mov     bx, ds:1D51h
mov     [bx+8], dl
mov     al, [bx+8]
add     al, ds:8C01h
inc     al
mov     [bx+0Ah], al
mov     al, ds:8C00h
cbw
mov     bx, 2
cwd
idiv    bx
mov     dl, 0Ch
sub     dl, al
mov     bx, ds:1D51h
mov     [bx+9], dl
mov     al, [bx+9]
add     al, ds:8C00h
inc     al
mov     [bx+0Bh], al
mov     ax, 2
push    ax
call    sub_1ACE5
mov     ax, 1
push    ax
call    sub_1DCE5
cmp     di, 2
jnz     short loc_1621F
call    sub_1608E
jmp     short loc_1623A

loc_1621F:
or      di, di
jz      short loc_1622A
cmp     word ptr ds:1DCFh, 0FFFFh
jnz     short loc_16237

loc_1622A:
push    word ptr ds:1DD3h
mov     ax, 1
push    ax
call    sub_15EF4
jmp     short loc_1623A

loc_16237:
call    sub_15C92

loc_1623A:
call    sub_15F09
mov     si, ax

loc_1623F:
mov     ax, sp
add     ax, ds:8C19h
mov     sp, ax
cmp     word ptr ds:1D53h, 0
jle     short loc_16251
call    sub_1594D

loc_16251:
dec     word ptr ds:1DE8h
mov     ax, 2
push    ax
call    sub_1AD85
push    [bp+var_4]
call    sub_1E8C0
mov     ax, [bp+var_2]
mov     ds:40DAh, ax
mov     ax, 0FFFFh
push    ax
call    sub_156D7
mov     word ptr ds:1DD1h, 0

loc_16275:
mov     ax, si
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_1611D endp



; Attributes: bp-based frame

sub_1627F proc near

arg_0= byte ptr  4

push    bp
mov     bp, sp
les     bx, ds:2274h
xor     word ptr es:[bx+10h], 10h
mov     al, [bp+arg_0]
cbw
mov     bx, ax
test    word ptr ds:91D3h, 200h
jz      short loc_1629F
mov     ax, 6F05h
jmp     short loc_162A1

loc_1629F:
mov     ax, bx

loc_162A1:
call    sub_10BFC
pop     bp
retn    2
sub_1627F endp




sub_162A8 proc near
mov     ax, 91D3h
push    ax
call    sub_1E87B
mov     al, ds:9224h
mov     ds:926Dh, al
mov     cl, ds:9274h
test    word ptr ds:91D3h, 2
jz      short loc_162D0
cmp     cl, 10h
jz      short loc_162CB
cmp     cl, 20h ; ' '
jnz     short loc_162D0

loc_162CB:
mov     byte ptr ds:9273h, 2

loc_162D0:
mov     ch, ds:9273h
mov     dl, ds:926Dh
mov     dh, ds:9240h
mov     al, dl
mov     ah, 0
cmp     ax, 2
jz      short loc_16306
cmp     ax, 3
jz      short loc_16306
cmp     ax, 7
jz      short loc_16306
jmp     short $+2

loc_162F1:
mov     dl, 3
mov     dh, 29h ; ')'
or      ch, ch
jnz     short loc_162FD
mov     dl, 7
jmp     short loc_16306

loc_162FD:
cmp     ch, 2
jnz     short loc_16306
mov     dl, 2
mov     dh, 2Dh ; '-'

loc_16306:
mov     ds:926Dh, dl
mov     ds:9240h, dh
mov     al, 0
mov     ds:923Dh, al
mov     ah, 0
mov     ds:9229h, ax
mov     ds:9241h, al
mov     word ptr ds:9225h, 50h ; 'P'
cmp     word ptr ds:472Ah, 0
jz      short loc_16350
cmp     word ptr ds:91D7h, 0
jz      short loc_16350
cmp     word ptr ds:1DD8h, 0
jnz     short loc_16356
cmp     byte ptr ds:926Dh, 7
jnz     short loc_16342
mov     ax, 3
jmp     short loc_16345

loc_16342:
mov     ax, 7

loc_16345:
mov     ds:0ECh, ax
mov     word ptr ds:1DD8h, 1
jmp     short loc_16356

loc_16350:
mov     word ptr ds:472Ah, 0

loc_16356:
cmp     word ptr ds:0ECh, 0FFh
jz      short loc_163A7
cmp     word ptr ds:0ECh, 7
jnz     short loc_1636F
test    word ptr ds:91D9h, 1
jz      short loc_163A7
jmp     short loc_1639C

loc_1636F:
test    word ptr ds:91D5h, 1
jnz     short loc_1638D
mov     al, ds:0ECh
mov     ds:926Dh, al
mov     al, 1
cmp     word ptr ds:0ECh, 2
jnz     short loc_16388
mov     al, 2

loc_16388:
mov     ds:9273h, al
jmp     short loc_163A7

loc_1638D:
cmp     word ptr ds:91D7h, 0
jz      short loc_163A7
test    word ptr ds:91D9h, 1
jnz     short loc_163A7

loc_1639C:
push    word ptr ds:0ECh
call    sub_1627F
xor     ax, ax
jmp     short locret_163AA

loc_163A7:
mov     ax, 1

locret_163AA:
retn
sub_162A8 endp




sub_163AB proc near
mov     ax, 931Bh
push    ax
call    sub_1E87B

loc_163B2:
call    sub_162A8
or      ax, ax
jz      short loc_163B2
test    word ptr ds:91D3h, 14h
jz      short loc_163C9
cmp     word ptr ds:9271h, 0C8h
jnz     short locret_163CE

loc_163C9:
or      byte ptr ds:2C62h, 1

locret_163CE:
retn
sub_163AB endp




sub_163CF proc near
push    si
push    di
mov     al, ds:9273h
mov     ah, 0
or      ax, ax
jz      short loc_163E6
cmp     ax, 1
jz      short loc_163F6
cmp     ax, 2
jz      short loc_163EE
jmp     short loc_163FC

loc_163E6:
mov     si, 2349h
mov     di, 4870h
jmp     short loc_163FC

loc_163EE:
mov     si, 236Ch
mov     di, 48B6h
jmp     short loc_163FC

loc_163F6:
mov     si, 2326h
mov     di, 482Ah

loc_163FC:
push    si
push    di
call    sub_1D02D
pop     di
pop     si
retn
sub_163CF endp




sub_16404 proc near
call    sub_1481D
mov     ax, ds:8BA3h
mov     ds:1C5Eh, ax
mov     ax, ds:1C09h
mov     ds:1C60h, ax
push    ds
mov     ax, 1C5Eh
push    ax
call    sub_461DC
pop     cx
pop     cx
mov     word ptr ds:1C94h, 0
les     bx, ds:1C86h
mov     byte ptr es:[bx], 1Ah
call    sub_147BD
retn
sub_16404 endp




sub_16431 proc near
push    si
push    word ptr ds:0F4h
call    sub_468C2
mov     ds:8C4Ah, dx
mov     ds:8C48h, ax
xor     si, si
jmp     short loc_16459

loc_16446:
mov     bx, si
shl     bx, 1
mov     ax, seg seg000
mov     es, ax
assume es:seg000
cmp     word ptr es:[bx+126h], 9090h
jnz     short loc_1645F
inc     si

loc_16459:
cmp     si, 80h
jl      short loc_16446

loc_1645F:
cmp     si, 80h
jge     short loc_16476
push    word ptr ds:0F4h
mov     ax, seg seg000
push    ax
mov     ax, 0F6h
push    ax
call    sub_468D4

loc_16476:
pop     si
retn
sub_16431 endp




sub_16478 proc near
push    word ptr ds:0F4h
push    word ptr ds:8C4Ah
push    word ptr ds:8C48h
call    sub_468D4
retn
sub_16478 endp




sub_1648A proc near
cmp     word ptr ds:472Ah, 0
jz      short loc_16499
mov     al, ds:9224h
mov     ah, 0
call    sub_10BFC

loc_16499:
mov     word ptr ds:229Ch, 1
call    sub_1A45E
call    sub_1A0A9
call    sub_14E1B
call    sub_14E68
call    sub_125DD
call    sub_16A20
call    sub_16478
retn
sub_1648A endp



; Attributes: noreturn bp-based frame

sub_164B5 proc near

var_6= byte ptr -6
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 6
push    si
push    di
mov     di, [bp+arg_0]
call    sub_139EF
call    sub_1E88C
mov     si, ax
mov     word ptr ds:1DE8h, 0FFFFh
or      di, di
jnz     short loc_164D6
or      si, si
jz      short loc_164EF

loc_164D6:
or      si, si
jz      short loc_164E2
call    sub_1AE49
mov     byte ptr ds:1D40h, 0

loc_164E2:
call    sub_1A2B7
mov     ax, 15CDh
push    ax
xor     ax, ax
push    ax
call    sub_19065

loc_164EF:
mov     ax, 1
push    ax
call    sub_12268
call    sub_1648A
or      si, si
jnz     short loc_16501
or      di, di
jz      short loc_1653A

loc_16501:
mov     ax, 1609h
push    ax
call    sub_19BEC
push    di
push    ss
lea     ax, [bp+var_6]
push    ax
call    sub_472E0
lea     ax, [bp+var_6]
push    ax
call    sub_19BEC
mov     ax, 1617h
push    ax
call    sub_19BEC
push    si
push    ss
lea     ax, [bp+var_6]
push    ax
call    sub_472E0
lea     ax, [bp+var_6]
push    ax
call    sub_19BEC
mov     ax, 1DDAh
push    ax
call    sub_19BEC

loc_1653A:
push    di
call    far ptr sub_100ED
sub_164B5 endp

pop     cx
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2


; Attributes: noreturn bp-based frame

sub_16549 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
cmp     [bp+arg_0], 1
jnz     short loc_16573
mov     ax, 0E3Eh
push    ax
call    sub_19BEC
mov     ax, 1DDAh
push    ax
call    sub_19BEC
call    sub_125DD
call    sub_16A20
call    sub_16478
mov     ax, 1
push    ax
call    far ptr sub_100ED
pop     cx

loc_16573:
push    [bp+arg_0]
call    sub_164B5
sub_16549 endp

pop     bp
retn    2


; Attributes: bp-based frame

sub_1657D proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    si
push    [bp+arg_0]
call    sub_19448
mov     dl, ds:49F4h
mov     dh, 0
push    ax
mov     ax, dx
mov     dl, ds:49F2h
mov     dh, 0
sub     ax, dx
inc     ax
pop     dx
sub     ax, dx
mov     bx, 2
cwd
idiv    bx
mov     si, ax
push    si
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1ED32
pop     si
pop     bp
retn    4
sub_1657D endp




sub_165B3 proc near
push    si
push    di
cmp     word ptr ds:49EEh, 0FFFFh
jz      short loc_165C1
xor     ax, ax
jmp     loc_1664D

loc_165C1:
mov     ax, 0Eh
push    ax
call    sub_1ACE5
mov     ax, 2
push    ax
mov     ax, 1625h
push    ax
call    sub_1657D
mov     ax, 4
push    ax
mov     ax, 0DBh
push    ax
call    sub_1657D
mov     ax, 5
push    ax
mov     ax, 162Dh
push    ax
call    sub_1657D
mov     ax, 6
push    ax
mov     ax, 1649h
push    ax
call    sub_1657D
mov     ax, 1
push    ax
call    sub_1DCE5
mov     di, ds:1DD1h
mov     ax, di
cmp     ax, 1
jnz     short loc_1660C
mov     word ptr ds:1DD1h, 2

loc_1660C:
mov     word ptr ds:40DAh, 1
mov     word ptr ds:1DD3h, 1

loc_16618:
call    sub_15852
mov     si, ax
mov     ax, si
or      ax, ax
jz      short loc_16618
push    si
call    sub_11EA2
cmp     ax, 1Dh
jnz     short loc_16639
mov     ax, 7
push    ax
mov     ax, 0D33h
push    ax
call    sub_1657D
jmp     short loc_1660C

loc_16639:
cmp     ax, 0FFFFh
jl      short loc_16640
xor     si, si

loc_16640:
mov     ax, 0Eh
push    ax
call    sub_1AD85
mov     ds:1DD1h, di
mov     ax, si

loc_1664D:
pop     di
pop     si
retn
sub_165B3 endp



; Attributes: bp-based frame

sub_16650 proc near

var_50= byte ptr -50h

push    bp
mov     bp, sp
sub     sp, 50h
push    si
mov     si, 500h
cmp     word ptr ds:472Eh, 0
jz      short loc_1666E
lea     ax, [bp+var_50]
push    ax
mov     ax, 4730h
push    ax
call    sub_19458
jmp     short loc_16679

loc_1666E:
mov     ax, 0FFFFh
push    ax
lea     ax, [bp+var_50]
push    ax
call    sub_17D3E

loc_16679:
cmp     [bp+var_50], 0
jnz     short loc_1668C
lea     ax, [bp+var_50]
push    ax
mov     ax, 0E50h
push    ax
call    sub_19458
jmp     short loc_1668F

loc_1668C:
mov     si, 600h

loc_1668F:
lea     ax, [bp+var_50]
push    ax
xor     ax, ax
push    ax
push    ax
mov     ax, 0E56h
push    ax
call    sub_14398
or      ax, ax
jge     short loc_166B4
cmp     ax, 0FFFFh
jge     short loc_166A9
mov     si, ax

loc_166A9:
lea     ax, [bp+var_50]
push    ax
mov     ax, 0E50h
push    ax
call    sub_19458

loc_166B4:
lea     ax, [bp+var_50]
push    ax
call    sub_152EB
mov     ax, si
pop     si
mov     sp, bp
pop     bp
retn
sub_16650 endp




sub_166C2 proc near
cmp     word ptr ds:472Ch, 0
jnz     short loc_166EB
mov     ax, 9963h
push    ax
mov     ax, 1DDCh
push    ax
mov     ax, 9963h
push    ax
call    sub_14F85
cmp     byte ptr ds:9963h, 0
jz      short loc_166E4
mov     ax, 1
jmp     short loc_166E6

loc_166E4:
xor     ax, ax

loc_166E6:
mov     ds:472Ch, ax
jmp     short loc_16705

loc_166EB:
mov     ax, 9963h
push    ax
xor     ax, ax
push    ax
push    ax
mov     ax, 1DE4h
push    ax
call    sub_19A67
test    ax, 20h
jnz     short loc_16705
mov     word ptr ds:472Ch, 0

loc_16705:
cmp     word ptr ds:472Ch, 0
jz      short loc_16716
mov     ax, 9963h
push    ax
call    sub_12223
mov     ds:472Ch, ax

loc_16716:
cmp     word ptr ds:472Ch, 0
jnz     short locret_16728
mov     ax, 9963h
push    ax
mov     ax, 1DDCh
push    ax
call    sub_19458

locret_16728:
retn
sub_166C2 endp




sub_16729 proc near
cmp     word ptr ds:1D20h, 0
jnz     short loc_16765
cmp     word ptr ds:1C09h, 1000h
jnb     short loc_1673C
xor     ax, ax
jmp     short locret_16768

loc_1673C:
push    word ptr ds:1C09h
call    sub_3193F
mov     ds:8BA3h, dx
mov     ds:8BA1h, ax
or      ax, ax
jz      short loc_16765
mov     ax, 10h
sub     ax, ds:8BA1h
sub     ds:1C09h, ax
mov     word ptr ds:8BA1h, 0
inc     word ptr ds:8BA3h

loc_16765:
mov     ax, 1

locret_16768:
retn
sub_16729 endp



; Attributes: bp-based frame

sub_16769 proc near

var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
call    sub_12589
call    sub_16A05
call    sub_163AB
call    sub_163CF
call    sub_166C2
call    sub_31529
mov     [bp+var_2], dx
mov     [bp+var_4], ax
call    sub_19E1F
or      ax, ax
jz      short loc_16799
call    sub_1A628
or      ax, ax
jnz     short loc_167A0

loc_16799:
mov     ax, 1
push    ax
call    sub_16549

loc_167A0:
push    [bp+var_2]
push    [bp+var_4]
call    sub_14E7C
call    sub_16729
or      ax, ax
jnz     short loc_167B7
mov     ax, 1
push    ax
call    sub_16549

loc_167B7:
call    sub_1A236
call    sub_121AD
mov     al, ds:0F2h
mov     ds:926Eh, al
test    word ptr ds:91D3h, 1Ch
jz      short loc_167D3
mov     al, ds:0F2h
add     al, 0FFh
mov     ds:925Fh, al

loc_167D3:
call    sub_1A39F
push    ds
mov     ax, 931Bh
push    ax
push    ds
mov     ax, 9276h
push    ax
mov     ax, 0A3h
push    ax
call    sub_46A2C
call    sub_16404
mov     ax, ds:0F0h
mov     ds:23C5h, ax
call    sub_1A583
mov     ax, 1FA2h
push    ax
call    sub_17F56
call    sub_16650
mov     di, ax
mov     ax, di
cmp     ax, 500h
jnz     short loc_16836
cmp     word ptr ds:472Ch, 0
jnz     short loc_16836
cmp     word ptr ds:4728h, 0
jnz     short loc_16836
call    sub_157A7
mov     si, ax
mov     ax, si
or      ax, ax
jnz     short loc_16836
mov     ax, 3493h
push    ax
xor     ax, ax
push    ax
call    sub_177BE
call    sub_165B3
mov     si, ax
mov     ax, si
push    ax
call    sub_1578B

loc_16836:
push    si
call    sub_11EA2
mov     si, ax
cmp     ax, 0FFFFh
jge     short loc_1684A
call    sub_15852
or      ax, ax
jz      short loc_1684A
mov     di, si

loc_1684A:
mov     ax, di
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_16769 endp



; Attributes: bp-based frame

sub_16852 proc near

var_1= byte ptr -1
arg_0= dword ptr  4
arg_4= word ptr  8

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
mov     di, [bp+arg_4]
xor     si, si
jmp     short loc_1687A

loc_16861:
les     bx, [bp+arg_0]
assume es:nothing
mov     al, es:[bx]
mov     [bp+var_1], al
inc     word ptr [bp+arg_0]
cmp     [bp+var_1], 20h ; ' '
jz      short loc_1687F
mov     al, [bp+var_1]
mov     [di], al
inc     di
inc     si

loc_1687A:
cmp     si, 8
jl      short loc_16861

loc_1687F:
mov     byte ptr [di], 0
pop     di
pop     si
mov     sp, bp
pop     bp
retn    6
sub_16852 endp




sub_1688A proc near
push    si
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
mov     si, ax
add     si, 8C50h
cmp     word ptr ds:1DE8h, 0FFFFh
jz      short loc_168B1
cmp     word ptr [si+6], 0FFFFh
jz      short loc_168B1
push    ds
push    si
mov     ax, 1
push    ax
call    sub_4698B

loc_168B1:
pop     si
retn
sub_1688A endp ; sp-analysis failed

push    bp
mov     bp, sp
sub     sp, 6Ah
push    si
push    di
lea     ax, [bp-10h]
mov     [bp-6], ax
lea     si, [bp-60h]
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
mov     [bp-2], ax
test    word ptr [bp+0Ah], 8000h
jz      short loc_1690B
mov     es, word ptr [bp+8]
mov     bx, [bp+6]
mov     word ptr [bp-68h], es
mov     [bp-6Ah], bx
test    byte ptr es:[bx+5], 80h
jz      short loc_16904
lea     ax, [bp-10h]
push    ax
mov     dx, [bp-68h]
mov     ax, bx
add     ax, 0Ah
push    dx
push    ax
call    sub_16852
mov     word ptr [bp+0Ch], 0Fh
jmp     short loc_1691C

loc_16904:
mov     word ptr [bp+0Ch], 0Eh
jmp     short loc_1691C

loc_1690B:
cmp     word ptr [bp+0Ch], 0
jl      short loc_16917
cmp     word ptr [bp+0Ch], 0Ch
jle     short loc_1691C

loc_16917:
mov     word ptr [bp+0Ch], 0Dh

loc_1691C:
mov     bx, [bp+0Ch]
shl     bx, 1
mov     di, [bx+1DEAh]
jmp     short loc_1695B

loc_16927:
mov     al, [di]
cbw
cmp     ax, 24h ; '$'
jz      short loc_1694B
cmp     ax, 40h ; '@'
jz      short loc_16936
jmp     short loc_16955

loc_16936:
mov     al, [bp+0Ah]
add     al, 41h ; 'A'
mov     [si], al
inc     si
jmp     short loc_1695A

loc_16940:
mov     bx, [bp-6]
mov     al, [bx]
mov     [si], al
inc     word ptr [bp-6]
inc     si

loc_1694B:
mov     bx, [bp-6]
cmp     byte ptr [bx], 0
jnz     short loc_16940
jmp     short loc_1695A

loc_16955:
mov     al, [di]
mov     [si], al
inc     si

loc_1695A:
inc     di

loc_1695B:
cmp     byte ptr [di], 0
jnz     short loc_16927
mov     byte ptr [si], 0
call    sub_10944
mov     ax, [bp+0Ch]
add     ax, 64h ; 'd'
mov     [bp-66h], ax
cmp     word ptr ds:1DE8h, 0FFFFh
jnz     short loc_1697B
mov     ax, 0FFFFh
jmp     short loc_16981

loc_1697B:
mov     bx, [bp-2]
mov     ax, [bx+6]

loc_16981:
mov     [bp-4], ax
or      ax, ax
jz      short loc_169F5
mov     ax, ds:1DD1h
mov     [bp-64h], ax
mov     word ptr ds:1DD1h, 2
xor     ax, ax
push    ax
mov     ax, 0C85h
push    ax
lea     ax, [bp-60h]
push    ax
mov     ax, 0CA0h
push    ax
mov     ax, 14h
push    ax
push    ax
mov     ax, 0Bh
push    ax
call    sub_18EAD
add     sp, 0Eh
cbw
mov     [bp-62h], ax
mov     ax, [bp-64h]
mov     ds:1DD1h, ax
cmp     word ptr [bp-62h], 52h ; 'R'
jz      short loc_169F0
cmp     word ptr ds:1DE8h, 0FFFFh
jz      short loc_169D1
mov     bx, [bp-2]
mov     word ptr [bx+6], 0

loc_169D1:
call    sub_25ED6
call    sub_4B0DE
cmp     word ptr ds:1DE8h, 0FFFFh
jz      short loc_169F5
mov     ax, [bp-4]
mov     bx, [bp-2]
mov     [bx+6], ax
call    sub_1688A
jmp     short loc_169F5

loc_169F0:
mov     ax, 1
jmp     short loc_169FD

loc_169F5:
push    word ptr [bp-66h]
call    sub_4695A

loc_169FD:
pop     di
pop     si
mov     sp, bp
pop     bp
retf    8



sub_16A05 proc near
mov     ax, 24h ; '$'
push    ax
call    sub_468C2
mov     ds:8C4Eh, dx
mov     ds:8C4Ch, ax
push    cs
mov     ax, 68B3h
push    ax
call    sub_4691D
retn
sub_16A05 endp




sub_16A20 proc near
mov     ax, 24h ; '$'
push    ax
push    word ptr ds:8C4Eh
push    word ptr ds:8C4Ch
call    sub_468D4
retn
sub_16A20 endp



; Attributes: bp-based frame

sub_16A32 proc far

arg_0= word ptr  6

push    bp
mov     bp, sp
mov     ax, [bp+arg_0]
and     ax, 0FFh
add     ax, 41h ; 'A'
mov     [bp+arg_0], ax
call    sub_10944
mov     word ptr ds:1DD3h, 12Ah
xor     ax, ax
push    ax
mov     ax, 13D1h
push    ax
lea     ax, [bp+arg_0]
push    ax
mov     ax, 1238h
push    ax
mov     ax, 1E0Ah
push    ax
mov     ax, 14h
push    ax
push    ax
mov     ax, 4
push    ax
call    sub_18EAD
mov     sp, bp
cmp     al, 1Bh
jnz     short loc_16A76
call    sub_1688A
xor     ax, ax
jmp     short loc_16A79

loc_16A76:
mov     ax, 1

loc_16A79:
pop     bp
retf    2
sub_16A32 endp




sub_16A7D proc near
cmp     word ptr ds:1F88h, 0
jz      short loc_16A93
mov     bx, ds:1F88h
cmp     byte ptr [bx+4], 1
jnz     short loc_16A93
mov     ax, 1
jmp     short loc_16A95

loc_16A93:
xor     ax, ax

loc_16A95:
mov     ds:1F9Ah, ax
retn
sub_16A7D endp



; Attributes: bp-based frame

sub_16A99 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
cmp     byte ptr [si+0Dh], 50h ; 'P'
jb      short loc_16AB6
mov     al, [si+0Dh]
add     al, 0B1h
sub     [si+0Bh], al
mov     al, [si+0Dh]
add     al, 0B1h
sub     [si+0Dh], al

loc_16AB6:
les     bx, ds:9A68h
mov     al, es:[bx+29h]
cmp     al, [si+0Eh]
ja      short loc_16ADF
mov     al, [si+0Eh]
mov     dl, es:[bx+29h]
sub     al, dl
inc     al
sub     [si+0Ch], al
mov     al, [si+0Eh]
mov     dl, es:[bx+29h]
sub     al, dl
inc     al
sub     [si+0Eh], al

loc_16ADF:
pop     si
pop     bp
retn    2
sub_16A99 endp



; Attributes: bp-based frame

sub_16AE4 proc near

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

push    bp
mov     bp, sp
sub     sp, 12h
push    si
push    di
mov     si, [bp+arg_0]
xor     ax, ax
mov     [bp+var_C], ax
mov     [bp+var_8], ax
mov     [bp+var_12], ax
jmp     loc_16BE9

loc_16AFD:
mov     ax, [bp+var_12]
mov     dx, 0Bh
mul     dx
add     ax, [si+11h]
mov     [bp+var_4], ax
mov     bx, ax
mov     ax, [bx+7]
mov     [bp+var_2], ax
push    word ptr [bx]
call    sub_19448
mov     di, ax
cmp     di, [bp+var_C]
jle     short loc_16B22
mov     [bp+var_C], di

loc_16B22:
mov     [bp+var_A], 0
mov     bx, [bp+var_4]
mov     al, [bx+5]
mov     ah, 0
cmp     ax, 2
jz      short loc_16B3B
cmp     ax, 3
jz      short loc_16B46
jmp     short loc_16B53

loc_16B3B:
mov     bx, [bp+var_2]
mov     ax, [bx+2]
mov     [bp+var_E], ax
jmp     short loc_16B58

loc_16B46:
mov     bx, [bp+var_2]
mov     al, [bx+10h]
mov     ah, 0
mov     [bp+var_E], ax
jmp     short loc_16B58

loc_16B53:
mov     [bp+var_E], 0

loc_16B58:
cmp     [bp+var_E], 0
jz      short loc_16BB6
mov     [bp+var_10], 0
jmp     short loc_16BAC

loc_16B65:
mov     bx, [bp+var_4]
cmp     byte ptr [bx+5], 2
jnz     short loc_16B86
mov     bx, [bp+var_10]
shl     bx, 1
push    bx
mov     bx, [bp+var_2]
pop     ax
add     ax, [bx+4]
mov     bx, ax
push    word ptr [bx]
call    sub_19448
mov     di, ax
jmp     short loc_16BA1

loc_16B86:
mov     ax, [bp+var_10]
mov     dx, 0Bh
mul     dx
mov     bx, ax
push    bx
mov     bx, [bp+var_2]
pop     ax
add     ax, [bx+11h]
mov     bx, ax
push    word ptr [bx]
call    sub_19448
mov     di, ax

loc_16BA1:
cmp     di, [bp+var_A]
jle     short loc_16BA9
mov     [bp+var_A], di

loc_16BA9:
inc     [bp+var_10]

loc_16BAC:
mov     ax, [bp+var_10]
cmp     ax, [bp+var_E]
jl      short loc_16B65
jmp     short loc_16BDB

loc_16BB6:
mov     bx, [bp+var_4]
mov     al, [bx+5]
mov     ah, 0
cmp     ax, 4
jnz     short loc_16BCD
mov     bx, [bp+var_2]
mov     ax, [bx]
mov     [bp+var_A], ax
jmp     short loc_16BDB

loc_16BCD:
cmp     ax, 6
jnz     short loc_16BDB
mov     bx, [bp+var_2]
mov     ax, [bx+6]
mov     [bp+var_A], ax

loc_16BDB:
mov     ax, [bp+var_A]
cmp     ax, [bp+var_8]
jle     short loc_16BE6
mov     [bp+var_8], ax

loc_16BE6:
inc     [bp+var_12]

loc_16BE9:
mov     al, [si+10h]
mov     ah, 0
cmp     ax, [bp+var_12]
jle     short loc_16BF6
jmp     loc_16AFD

loc_16BF6:
mov     al, [si+0Ch]
add     al, [si+10h]
inc     al
mov     [si+0Eh], al
cmp     [bp+var_8], 0
jle     short loc_16C0C
mov     ax, 2
jmp     short loc_16C0E

loc_16C0C:
xor     ax, ax

loc_16C0E:
mov     dx, [bp+var_C]
add     dx, [bp+var_8]
add     ax, dx
inc     ax
inc     ax
mov     [bp+var_6], ax
cmp     word ptr [si], 0
jz      short loc_16C31
push    word ptr [si]
call    sub_19448
mov     di, ax
inc     di
inc     di
cmp     di, [bp+var_6]
jle     short loc_16C31
mov     [bp+var_6], di

loc_16C31:
mov     al, [si+0Bh]
add     al, byte ptr [bp+var_6]
inc     al
mov     [si+0Dh], al
mov     al, byte ptr [bp+var_C]
add     al, 3
mov     [si+0Fh], al
push    si
call    sub_16A99
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_16AE4 endp



; Attributes: bp-based frame

sub_16C50 proc near

var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
mov     bx, ds:1F88h
cmp     byte ptr [bx+4], 0
jz      short loc_16C65
jmp     loc_16D24

loc_16C65:
call    sub_177F2
or      ax, ax
jz      short loc_16C71
mov     ax, 1
jmp     short loc_16C73

loc_16C71:
xor     ax, ax

loc_16C73:
mov     [bp+var_2], ax
mov     bx, ds:1F88h
mov     byte ptr [bx+0Bh], 1
mov     byte ptr [bx+0Ch], 1
mov     byte ptr [bx+0Dh], 50h ; 'P'
mov     al, byte ptr [bp+var_2]
shl     al, 1
inc     al
mov     [bx+0Eh], al
mov     word ptr ds:8D1Ch, 3
xor     si, si
jmp     short loc_16D03

loc_16C9A:
mov     ax, si
mov     dx, 0Bh
mul     dx
mov     di, ax
mov     bx, ds:1F88h
add     di, [bx+11h]
push    word ptr [di]
call    sub_19448
mov     [bp+var_4], ax
mov     bx, si
shl     bx, 1
mov     ax, [bx-72E4h]
add     ax, [bp+var_4]
add     ax, 3
mov     bx, si
inc     bx
shl     bx, 1
mov     [bx-72E4h], ax
cmp     word ptr [di+7], 0
jz      short loc_16D02
mov     bx, si
shl     bx, 1
mov     al, [bx-72E4h]
add     al, byte ptr [bp+var_2]
mov     bx, [di+7]
mov     [bx+0Bh], al
mov     bx, ds:1F88h
mov     al, [bx+0Eh]
mov     dl, byte ptr [bp+var_2]
add     dl, 0FFh
sub     al, dl
mov     bx, [di+7]
mov     [bx+0Ch], al
push    word ptr [di+7]
call    sub_16AE4
mov     bx, [di+7]
mov     byte ptr [bx+2], 1

loc_16D02:
inc     si

loc_16D03:
mov     bx, ds:1F88h
mov     al, [bx+10h]
mov     ah, 0
cmp     ax, si
jg      short loc_16C9A
mov     ax, [bp+var_2]
shl     ax, 1
mov     dx, 50h ; 'P'
sub     dx, ax
mov     bx, si
shl     bx, 1
mov     [bx-72E4h], dx
jmp     short loc_16D2B

loc_16D24:
push    word ptr ds:1F88h
call    sub_16AE4

loc_16D2B:
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_16C50 endp



; Attributes: bp-based frame

sub_16D31 proc near

var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
mov     si, [bp+arg_2]
mov     [bp+var_2], 0
mov     bx, ds:1F88h
mov     al, [bx+10h]
mov     ah, 0
mov     di, ax
jmp     short loc_16D83

loc_16D4E:
add     si, [bp+arg_0]
mov     ax, si
cmp     ax, di
jl      short loc_16D5B
xor     si, si
jmp     short loc_16D62

loc_16D5B:
or      si, si
jge     short loc_16D62
mov     si, di
dec     si

loc_16D62:
mov     ax, si
mov     dx, 0Bh
mul     dx
mov     bx, ax
push    bx
mov     bx, ds:1F88h
pop     ax
add     ax, [bx+11h]
mov     bx, ax
test    byte ptr [bx+6], 1
jnz     short loc_16D80
mov     ax, si
jmp     short loc_16D8D

loc_16D80:
inc     [bp+var_2]

loc_16D83:
mov     ax, [bp+var_2]
cmp     ax, di
jl      short loc_16D4E
mov     ax, 0FFFFh

loc_16D8D:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    4
sub_16D31 endp



; Attributes: bp-based frame

sub_16D95 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
cmp     [bp+arg_0], 0FFFFh
jz      short loc_16DA4
push    [bp+arg_0]
call    sub_1787A

loc_16DA4:
mov     word ptr ds:1F98h, 1
pop     bp
retn    2
sub_16D95 endp



; Attributes: bp-based frame

sub_16DAE proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
mov     si, [bp+arg_0]
cmp     si, 0FFFFh
jz      short loc_16DDA
mov     bx, ds:1F88h
mov     al, [bx+10h]
mov     ah, 0
cmp     ax, si
jle     short loc_16DDA
mov     di, ds:1F8Ch
mov     word ptr ds:1F8Ch, 0FFFFh
push    si
call    sub_1787A
mov     ds:1F8Ch, di

loc_16DDA:
mov     word ptr ds:1F98h, 0
pop     di
pop     si
pop     bp
retn    2
sub_16DAE endp



; Attributes: bp-based frame

sub_16DE6 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    word ptr ds:1F8Ch
call    sub_16DAE
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_16D31
mov     ds:1F8Ch, ax
mov     bx, ds:1F88h
mov     [bx+5], ax
push    ax
call    sub_16D95
pop     bp
retn    4
sub_16DE6 endp




sub_16E0B proc near
mov     bx, ds:1F88h
mov     ax, [bx+9]
mov     ds:1FA0h, ax
push    ax
call    sub_1E8C0
xor     ax, ax
push    ax
call    sub_1DCE5
call    sub_17BEB
mov     bx, ds:1F88h
mov     byte ptr [bx+3], 1
retn
sub_16E0B endp




sub_16E2B proc near
mov     word ptr ds:1F9Ch, 0
dec     word ptr ds:1F90h
dec     word ptr ds:1F8Ah
mov     bx, ds:1F90h
shl     bx, 1
shl     bx, 1
mov     ax, [bx-72BAh]
mov     ds:1F88h, ax
or      ax, ax
jz      short locret_16E54
mov     bx, ax
mov     ax, [bx+5]
mov     ds:1F8Ch, ax

locret_16E54:
retn
sub_16E2B endp




sub_16E55 proc near
mov     bx, ds:1F88h
cmp     byte ptr [bx+3], 0
jz      short loc_16E75
push    word ptr [bx+9]
call    sub_1E8C0
call    sub_1DA41
mov     bx, ds:1F88h
mov     word ptr [bx+9], 0FFFFh
mov     byte ptr [bx+3], 0

loc_16E75:
call    sub_16E2B
cmp     word ptr ds:1F88h, 0
jz      short loc_16E95
mov     bx, ds:1F88h
cmp     word ptr [bx+9], 0FFFFh
jz      short loc_16E95
mov     ax, [bx+9]
mov     ds:1FA0h, ax
push    ax
call    sub_1E8C0
jmp     short locret_16E9B

loc_16E95:
mov     word ptr ds:1FA0h, 0FFFFh

locret_16E9B:
retn
sub_16E55 endp




sub_16E9C proc near
push    word ptr ds:1F88h
call    sub_18039
mov     bx, ds:1F88h
cmp     byte ptr [bx+2], 0
jnz     short loc_16EB4
mov     byte ptr [bx+2], 1
call    sub_16C50

loc_16EB4:
mov     bx, ds:1F88h
cmp     word ptr [bx+5], 0FFFFh
jnz     short loc_16ECE
mov     ax, 0FFFFh
push    ax
mov     ax, 1
push    ax
call    sub_16D31
mov     ds:1F8Ch, ax
jmp     short loc_16EE1

loc_16ECE:
mov     bx, ds:1F88h
mov     ax, [bx+5]
dec     ax
push    ax
mov     ax, 1
push    ax
call    sub_16D31
mov     ds:1F8Ch, ax

loc_16EE1:
mov     ax, ds:1F8Ch
mov     bx, ds:1F88h
mov     [bx+5], ax
cmp     word ptr [bx+9], 0FFFFh
jnz     short loc_16EF4
call    sub_1782E

loc_16EF4:
mov     bx, ds:1F88h
cmp     byte ptr [bx+3], 0
jnz     short loc_16F03
call    sub_16E0B
jmp     short locret_16F0D

loc_16F03:
mov     bx, ds:1F88h
push    word ptr [bx+9]
call    sub_1E8C0

locret_16F0D:
retn
sub_16E9C endp



; Attributes: bp-based frame

sub_16F0E proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
inc     word ptr ds:1F90h
mov     bx, ds:1F90h
shl     bx, 1
shl     bx, 1
mov     [bx-72BAh], si
or      si, si
jnz     short loc_16F31
mov     word ptr ds:1F8Ah, 0
jmp     short loc_16F35

loc_16F31:
inc     word ptr ds:1F8Ah

loc_16F35:
mov     ds:1F88h, si
pop     si
pop     bp
retn    2
sub_16F0E endp



; Attributes: bp-based frame

sub_16F3E proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
jmp     short loc_16F7D

loc_16F44:
mov     bx, ds:1F90h
shl     bx, 1
shl     bx, 1
cmp     word ptr [bx-72BAh], 0
jnz     short loc_16F7A
call    sub_16E2B
mov     word ptr ds:1F8Ah, 0
mov     si, ds:1F90h
jmp     short loc_16F74

loc_16F62:
mov     bx, si
shl     bx, 1
shl     bx, 1
cmp     word ptr [bx-72BAh], 0
jz      short loc_16F7D
inc     word ptr ds:1F8Ah
dec     si

loc_16F74:
or      si, si
jnz     short loc_16F62
jmp     short loc_16F7D

loc_16F7A:
call    sub_16E55

loc_16F7D:
cmp     word ptr ds:1F90h, 0
jz      short loc_16F8E
mov     ax, [bp+arg_0]
dec     [bp+arg_0]
or      ax, ax
jnz     short loc_16F44

loc_16F8E:
pop     si
pop     bp
retn    2
sub_16F3E endp




sub_16F93 proc near
cmp     word ptr ds:1F8Ah, 1
jnz     short loc_16FF1
mov     bx, ds:1F88h
cmp     byte ptr [bx+4], 0
jnz     short loc_17002
mov     ax, ds:1F8Ch
mov     dx, 0Bh
mul     dx
mov     bx, ax
push    bx
mov     bx, ds:1F88h
pop     ax
add     ax, [bx+11h]
mov     bx, ax
test    byte ptr [bx+6], 4
jnz     short loc_17005

loc_16FBF:
push    word ptr ds:1F8Ch
call    sub_16DAE
jmp     short loc_17005

loc_16FC8:
call    sub_16E55
cmp     word ptr ds:1F88h, 0
jz      short loc_17005
mov     ax, ds:1F8Ch
mov     dx, 0Bh
mul     dx
mov     bx, ax
push    bx
mov     bx, ds:1F88h
pop     ax
add     ax, [bx+11h]
mov     bx, ax
test    byte ptr [bx+6], 4
jz      short loc_16FF1
xor     ax, ax
jmp     short locret_17008

loc_16FF1:
cmp     word ptr ds:1F8Ah, 1
jg      short loc_16FC8
mov     bx, ds:1F88h
cmp     byte ptr [bx+4], 0
jz      short loc_16FBF

loc_17002:
call    sub_16E55

loc_17005:
mov     ax, 1

locret_17008:
retn
sub_16F93 endp



; Attributes: bp-based frame

sub_17009 proc near

var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
mov     ax, ds:1F8Ch
mov     dx, 0Bh
mul     dx
mov     di, ax
mov     bx, ds:1F88h
add     di, [bx+11h]
mov     ax, [di+7]
mov     [bp+var_4], ax
mov     bx, ax
mov     si, [bx]
mov     bx, ax
mov     ax, [bx+2]
mov     [bp+var_2], ax
test    byte ptr [di+6], 10h
jz      short loc_1704A
inc     byte ptr [si]
mov     al, [si]
mov     ah, 0
cmp     ax, [bp+var_2]
jl      short loc_17057
mov     byte ptr [si], 0
jmp     short loc_17057

loc_1704A:
inc     word ptr [si]
mov     ax, [si]
cmp     ax, [bp+var_2]
jl      short loc_17057
mov     word ptr [si], 0

loc_17057:
push    word ptr ds:1F8Ch
call    sub_1787A
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_17009 endp



; Attributes: bp-based frame

sub_17064 proc near

var_86= word ptr -86h
var_84= word ptr -84h
var_82= word ptr -82h
var_80= byte ptr -80h
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 86h
push    si
push    di
xor     di, di
mov     ax, ds:1F8Ch
cmp     ax, [bp+arg_0]
jz      short loc_1708C
push    ax
call    sub_16DAE
mov     ax, [bp+arg_0]
mov     ds:1F8Ch, ax
mov     bx, ds:1F88h
mov     [bx+5], ax
push    ax
call    sub_16D95

loc_1708C:
mov     ax, [bp+arg_0]
mov     dx, 0Bh
mul     dx
mov     si, ax
mov     bx, ds:1F88h
add     si, [bx+11h]
mov     ax, [si+3]
mov     bx, ds:1F90h
shl     bx, 1
shl     bx, 1
mov     [bx-72BCh], ax
mov     al, [si+5]
mov     ah, 0
cmp     ax, 6           ; switch 7 cases
jbe     short loc_170B9
jmp     def_170BD       ; jumptable 000170BD default case, cases 1,5

loc_170B9:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_170BD[bx] ; switch jump
jpt_170BD dw offset loc_170D6 ; jump table for switch statement
dw offset def_170BD
dw offset loc_17199
dw offset loc_170D0
dw offset loc_1722C
dw offset def_170BD
dw offset loc_1719F

loc_170D0:              ; jumptable 000170BD case 3
mov     word ptr ds:1F9Ch, 1

loc_170D6:              ; jumptable 000170BD case 0
cmp     word ptr [si+7], 0
jnz     short loc_170DF
jmp     loc_1722C       ; jumptable 000170BD case 4

loc_170DF:
mov     bx, ds:1F88h
mov     al, [bx+0Bh]
mov     ah, 0
inc     ax
inc     ax
mov     [bp+var_86], ax
cmp     word ptr ds:1F9Ch, 0
jz      short loc_170FF
mov     al, [bx+0Fh]
mov     ah, 0
dec     ax
add     [bp+var_86], ax

loc_170FF:
mov     bx, ds:1F88h
mov     al, [bx+0Ch]
mov     ah, 0
add     ax, ds:1F8Ch
inc     ax
inc     ax
mov     [bp+var_84], ax
mov     ax, [si+7]
mov     ds:1F88h, ax
cmp     word ptr ds:1F9Ch, 0
jz      short loc_1713F
mov     bx, ax
mov     bx, [bx+13h]
mov     ax, [bx]
mov     ds:1F8Ch, ax
test    byte ptr [si+6], 10h
jz      short loc_17135
and     word ptr ds:1F8Ch, 0FFh

loc_17135:
mov     ax, ds:1F8Ch
mov     bx, ds:1F88h
mov     [bx+5], ax

loc_1713F:
push    word ptr ds:1F88h
call    sub_16F0E
mov     bx, ds:1F88h
cmp     byte ptr [bx+4], 2
jnz     short loc_1718A
cmp     byte ptr [bx+2], 0
jz      short loc_1716E
mov     al, byte ptr [bp+var_86]
mov     dl, [bx+0Bh]
sub     al, dl
add     [bx+0Dh], al
mov     al, byte ptr [bp+var_84]
mov     dl, [bx+0Ch]
sub     al, dl
add     [bx+0Eh], al

loc_1716E:
mov     al, byte ptr [bp+var_86]
mov     bx, ds:1F88h
mov     [bx+0Bh], al
mov     al, byte ptr [bp+var_84]
mov     [bx+0Ch], al
cmp     byte ptr [bx+2], 0
jz      short loc_1718A
push    bx
call    sub_16A99

loc_1718A:
call    sub_16A7D
call    sub_16E9C
xor     ax, ax
push    ax
call    sub_17C15
jmp     def_170BD       ; jumptable 000170BD default case, cases 1,5

loc_17199:              ; jumptable 000170BD case 2
call    sub_17009
jmp     loc_1722C       ; jumptable 000170BD case 4

loc_1719F:              ; jumptable 000170BD case 6
mov     ax, [si+7]
mov     [bp+var_82], ax
lea     ax, [bp+var_80]
push    ax
mov     bx, [bp+var_82]
push    word ptr [bx+2]
call    sub_19458
mov     bx, [bp+var_82]
push    word ptr [bx]
push    word ptr [bx+2]
mov     bx, ds:1F88h
mov     al, [bx+0Bh]
mov     ah, 0
inc     ax
push    ax
mov     al, [bx+0Ch]
mov     ah, 0
add     ax, ds:1F8Ch
inc     ax
push    ax
mov     bx, [bp+var_82]
push    word ptr [bx+4]
mov     ax, [bx+4]
shr     ax, 1
push    ax
call    sub_18E6D
mov     di, ax
mov     ax, di
or      ax, ax
jge     short loc_17202
cmp     di, 0FFFFh
jnz     short loc_171F2
xor     di, di

loc_171F2:
mov     bx, [bp+var_82]
push    word ptr [bx+2]
lea     ax, [bp+var_80]
push    ax
call    sub_19458
jmp     short def_170BD ; jumptable 000170BD default case, cases 1,5

loc_17202:
test    byte ptr [si+6], 8
jnz     short loc_17212
mov     bx, [bp+var_82]
push    word ptr [bx+2]
call    sub_1943A

loc_17212:
xor     di, di
test    byte ptr [si+6], 80h
jnz     short loc_1722C ; jumptable 000170BD case 4
mov     bx, [bp+var_82]
push    word ptr [bx+2]
lea     ax, [bp+var_80]
push    ax
call    sub_19497
or      ax, ax
jz      short def_170BD ; jumptable 000170BD default case, cases 1,5

loc_1722C:              ; jumptable 000170BD case 4
mov     di, [si+3]

def_170BD:              ; jumptable 000170BD default case, cases 1,5
mov     ax, di
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_17064 endp



; Attributes: bp-based frame

sub_17239 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
cmp     [bp+arg_0], 0
jz      short loc_17288
xor     si, si
jmp     short loc_1727B

loc_17248:
mov     ax, si
mov     dx, 0Bh
mul     dx
mov     di, ax
mov     bx, ds:1F88h
add     di, [bx+11h]
push    [bp+arg_0]
call    sub_46F25
push    ax
mov     al, [di+2]
cbw
pop     dx
cmp     dx, ax
jnz     short loc_1727A
test    byte ptr [di+6], 1
jnz     short loc_1727A
mov     ax, [di+9]
mov     ds:1DD3h, ax
mov     ax, si
jmp     short loc_1728B

loc_1727A:
inc     si

loc_1727B:
mov     bx, ds:1F88h
mov     al, [bx+10h]
mov     ah, 0
cmp     ax, si
jg      short loc_17248

loc_17288:
mov     ax, 0FFFFh

loc_1728B:
pop     di
pop     si
pop     bp
retn    2
sub_17239 endp



; Attributes: bp-based frame

sub_17291 proc near

var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 6
push    si
push    di
xor     di, di
jmp     def_17308       ; jumptable 00017308 default case, cases 6-8

loc_1729E:
mov     word ptr ds:40DAh, 0
mov     ax, ds:1F8Ch
mov     dx, 0Bh
mul     dx
mov     bx, ax
push    bx
mov     bx, ds:1F88h
pop     ax
add     ax, [bx+11h]
mov     bx, ax
mov     ax, [bx+9]
mov     ds:1DD3h, ax
call    sub_15852
mov     [bp+var_2], ax
and     ax, 0FFh
push    ax
call    sub_17239
mov     [bp+var_4], ax
cmp     ax, 0FFFFh
jz      short loc_172D7
jmp     loc_173D9

loc_172D7:
push    [bp+var_2]
call    sub_11EA2
mov     [bp+var_4], ax
cmp     ax, 0FFFFh
jge     short loc_172EE
mov     ds:1F9Eh, ax
mov     ax, 0FFFCh
jmp     loc_173D9

loc_172EE:
mov     bx, ds:1F88h
mov     al, [bx+4]
mov     ah, 0
mov     si, ax
mov     ax, [bp+var_4]
cmp     ax, 0Ah         ; switch 11 cases
jbe     short loc_17304
jmp     def_17308       ; jumptable 00017308 default case, cases 6-8

loc_17304:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_17308[bx] ; switch jump
jpt_17308 dw offset loc_1738D ; jump table for switch statement
dw offset loc_1739E
dw offset loc_17344
dw offset loc_17365
dw offset loc_173BD
dw offset loc_173C8
dw offset def_17308
dw offset def_17308
dw offset def_17308
dw offset loc_17323
dw offset loc_17337

loc_17323:              ; jumptable 00017308 case 9
mov     bx, ds:1F88h
mov     al, [bx+10h]
mov     ah, 0
push    ax
mov     ax, 1
push    ax
call    sub_16DE6
jmp     def_17308       ; jumptable 00017308 default case, cases 6-8

loc_17337:              ; jumptable 00017308 case 10
xor     ax, ax
push    ax
mov     ax, 0FFFFh
push    ax
call    sub_16DE6
jmp     def_17308       ; jumptable 00017308 default case, cases 6-8

loc_17344:              ; jumptable 00017308 case 2
cmp     si, 1
jz      short loc_17354
or      si, si
jnz     short loc_1735C
cmp     word ptr ds:1F9Ah, 0
jz      short loc_1735C

loc_17354:
mov     [bp+var_6], 0FFFEh
jmp     loc_173C3

loc_1735C:
or      si, si
jz      short loc_17363
jmp     def_17308       ; jumptable 00017308 default case, cases 6-8

loc_17363:
jmp     short loc_17391

loc_17365:              ; jumptable 00017308 case 3
cmp     si, 1
jz      short loc_17375
or      si, si
jnz     short loc_1737C
cmp     word ptr ds:1F9Ah, 0
jz      short loc_1737C

loc_17375:
mov     [bp+var_6], 0FFFDh
jmp     short loc_173C3

loc_1737C:
or      si, si
jnz     short def_17308 ; jumptable 00017308 default case, cases 6-8

loc_17380:
push    word ptr ds:1F8Ch
mov     ax, 1
push    ax
call    sub_16DE6
jmp     short def_17308 ; jumptable 00017308 default case, cases 6-8

loc_1738D:              ; jumptable 00017308 case 0
or      si, si
jz      short def_17308 ; jumptable 00017308 default case, cases 6-8

loc_17391:
push    word ptr ds:1F8Ch
mov     ax, 0FFFFh
push    ax
call    sub_16DE6
jmp     short def_17308 ; jumptable 00017308 default case, cases 6-8

loc_1739E:              ; jumptable 00017308 case 1
or      si, si
jnz     short loc_17380
mov     ax, ds:1F8Ch
mov     dx, 0Bh
mul     dx
mov     bx, ax
push    bx
mov     bx, ds:1F88h
pop     ax
add     ax, [bx+11h]
mov     bx, ax
cmp     word ptr [bx+7], 0
jz      short def_17308 ; jumptable 00017308 default case, cases 6-8

loc_173BD:              ; jumptable 00017308 case 4
mov     ax, ds:1F8Ch
mov     [bp+var_6], ax

loc_173C3:
mov     di, 1
jmp     short def_17308 ; jumptable 00017308 default case, cases 6-8

loc_173C8:              ; jumptable 00017308 case 5
mov     [bp+var_6], 0FFFFh
jmp     short loc_173C3

def_17308:              ; jumptable 00017308 default case, cases 6-8
or      di, di
jnz     short loc_173D6
jmp     loc_1729E

loc_173D6:
mov     ax, [bp+var_6]

loc_173D9:
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_17291 endp




sub_173DF proc near
push    si
xor     si, si
jmp     short loc_17419

loc_173E4:
mov     bx, si
shl     bx, 1
shl     bx, 1
mov     ax, [bx-72BAh]
mov     ds:1F88h, ax
or      ax, ax
jz      short loc_17418
mov     bx, ax
cmp     word ptr [bx+9], 0FFFFh
jnz     short loc_17408
mov     bx, ax
mov     byte ptr [bx+3], 1
call    sub_16E9C
jmp     short loc_17418

loc_17408:
mov     bx, ds:1F88h
push    word ptr [bx+9]
call    sub_1E8C0
xor     ax, ax
push    ax
call    sub_1DC5F

loc_17418:
inc     si

loc_17419:
cmp     si, ds:1F90h
jle     short loc_173E4
xor     si, si
jmp     short loc_17454

loc_17423:
mov     bx, si
shl     bx, 1
shl     bx, 1
mov     ax, [bx-72BAh]
mov     ds:1F88h, ax
or      ax, ax
jz      short loc_17453
mov     bx, ax
push    word ptr [bx+9]
call    sub_1E8C0
xor     ax, ax
push    ax
call    sub_1DCE5
mov     bx, ds:1F88h
mov     ax, [bx+5]
mov     ds:1F8Ch, ax
mov     ax, 1
push    ax
call    sub_17C15

loc_17453:
inc     si

loc_17454:
cmp     si, ds:1F90h
jle     short loc_17423
call    sub_1DA35
mov     ds:1FA0h, ax
pop     si
retn
sub_173DF endp



; Attributes: bp-based frame

sub_17462 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
cmp     word ptr ds:8D6Ch, 0
jz      short loc_174AD
push    ds
mov     ax, 8D6Eh
push    ax
push    ds
mov     ax, 8D44h
push    ax
mov     ax, 28h ; '('
push    ax
call    sub_46A2C
mov     ax, ds:1F92h
mov     ds:1F88h, ax
mov     ax, ds:1F94h
mov     ds:1F8Ah, ax
mov     ax, ds:1F96h
mov     ds:1F8Ch, ax
mov     ax, ds:8D1Ah
mov     ds:1F90h, ax
push    [bp+arg_0]
push    word ptr ds:1F98h
call    sub_177BE
mov     ax, ds:8D18h
mov     ds:1F90h, ax
mov     word ptr ds:8D6Ch, 0

loc_174AD:
pop     bp
retn    2
sub_17462 endp



; Attributes: bp-based frame

sub_174B1 proc near

var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 8
push    si
push    di
push    [bp+arg_0]
call    sub_17462
cmp     word ptr ds:1F90h, 0
jl      short loc_17524
mov     ax, [bp+arg_0]
mov     ds:1F8Eh, ax
mov     bx, ax
mov     byte ptr [bx+5], 0
call    sub_1DA35
cmp     ax, ds:1FA0h
jz      short loc_174E0
call    sub_173DF
jmp     short loc_1751D

loc_174E0:
xor     si, si
jmp     short loc_17517

loc_174E4:
mov     bx, si
shl     bx, 1
shl     bx, 1
mov     ax, [bx-72BAh]
mov     ds:1F88h, ax
or      ax, ax
jz      short loc_17516
cmp     si, ds:1F90h
jz      short loc_17503
mov     bx, ax
cmp     word ptr [bx+9], 0FFFFh
jnz     short loc_17516

loc_17503:
mov     bx, ds:1F88h
mov     ax, [bx+5]
mov     ds:1F8Ch, ax
call    sub_16E9C
xor     ax, ax
push    ax
call    sub_17C15

loc_17516:
inc     si

loc_17517:
cmp     si, ds:1F90h
jle     short loc_174E4

loc_1751D:
cmp     word ptr ds:1F88h, 0
jnz     short loc_1752A

loc_17524:
mov     ax, 0FFFFh
jmp     loc_176F6

loc_1752A:
call    sub_16A7D
mov     [bp+var_8], 0
jmp     loc_1761A

loc_17535:
call    sub_17291
mov     di, ax
mov     ax, di
sub     ax, 0FFFCh      ; switch 4 cases
cmp     ax, 3
jbe     short loc_17547
jmp     def_1754B       ; jumptable 0001754B default case

loc_17547:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_1754B[bx] ; switch jump
jpt_1754B dw offset loc_17594 ; jump table for switch statement
dw offset loc_17569
dw offset loc_17569
dw offset loc_17558

loc_17558:              ; jumptable 0001754B case -1
call    sub_16F93
mov     [bp+var_8], ax
call    sub_16A7D
mov     [bp+var_6], 0FFFFh
jmp     loc_1761A

loc_17569:              ; jumptable 0001754B cases -3,-2
mov     bx, ds:1F88h
cmp     byte ptr [bx+4], 1
jnz     short loc_17576
call    sub_16E55

loc_17576:
push    word ptr ds:1F8Ch
cmp     di, 0FFFDh
jnz     short loc_17584
mov     ax, 1
jmp     short loc_17587

loc_17584:
mov     ax, 0FFFFh

loc_17587:
push    ax
call    sub_16D31
mov     di, ax
push    di
call    sub_17064
jmp     loc_1761A

loc_17594:              ; jumptable 0001754B case -4
mov     [bp+var_8], 1
mov     ax, ds:1F9Eh
mov     [bp+var_6], ax
mov     ax, ds:1F8Ch
mov     dx, 0Bh
mul     dx
mov     bx, ax
push    bx
mov     bx, ds:1F88h
pop     ax
add     ax, [bx+11h]
mov     bx, ax
mov     ax, [bx+3]
mov     bx, ds:1F90h
shl     bx, 1
shl     bx, 1
mov     [bx-72BCh], ax
jmp     short loc_1761A

def_1754B:              ; jumptable 0001754B default case
push    di
call    sub_17064
mov     [bp+var_8], ax
or      ax, ax
jz      short loc_1761A
mov     ax, ds:1F8Ch
mov     dx, 0Bh
mul     dx
mov     bx, ds:1F88h
add     ax, [bx+11h]
mov     [bp+var_2], ax
mov     ax, [bp+var_8]
mov     [bp+var_6], ax
cmp     word ptr ds:1F9Ch, 0
jz      short loc_1761A
mov     ax, [bx+13h]
mov     [bp+var_4], ax
mov     bx, [bp+var_2]
test    byte ptr [bx+6], 10h
jz      short loc_17608
mov     al, ds:1F8Ch
mov     bx, [bp+var_4]
mov     [bx], al
jmp     short loc_17610

loc_17608:
mov     ax, ds:1F8Ch
mov     bx, [bp+var_4]
mov     [bx], ax

loc_17610:
call    sub_16E55
push    word ptr ds:1F8Ch
call    sub_1787A

loc_1761A:
cmp     [bp+var_8], 0
jnz     short loc_17623
jmp     loc_17535

loc_17623:
xor     si, si
jmp     short loc_17646

loc_17627:
mov     bx, si
add     bx, ds:1F90h
sub     bx, ds:1F8Ah
inc     bx
shl     bx, 1
shl     bx, 1
mov     ax, [bx-72BCh]
mov     bx, si
shl     bx, 1
add     bx, ds:1F8Eh
mov     [bx+8], ax
inc     si

loc_17646:
mov     ax, ds:1F8Ah
dec     ax
cmp     ax, si
jge     short loc_17627
mov     ax, ds:1F8Ah
mov     bx, ds:1F8Eh
mov     [bx+6], ax
mov     bx, ds:1F88h
mov     al, [bx+0Bh]
mov     bx, ds:1F8Eh
mov     [bx+3], al
mov     bx, ds:1F88h
mov     al, [bx+0Ch]
add     al, ds:1F8Ch
inc     al
mov     bx, ds:1F8Eh
mov     [bx+4], al
or      di, di
jge     short loc_17695
mov     ax, [bp+var_6]
mov     bx, ds:1F8Ah
shl     bx, 1
add     bx, ds:1F8Eh
mov     [bx+8], ax
mov     bx, ds:1F8Eh
inc     word ptr [bx+6]

loc_17695:
cmp     di, 0FFFCh
jz      short loc_176F3
jmp     short loc_176C3

loc_1769C:
mov     ax, ds:1F8Ch
mov     dx, 0Bh
mul     dx
mov     bx, ds:1F88h
add     ax, [bx+11h]
mov     [bp+var_2], ax
mov     bx, ax
test    byte ptr [bx+6], 4
jnz     short loc_176CA
mov     bx, ds:1F88h
cmp     byte ptr [bx+4], 0
jz      short loc_176CA
call    sub_16E55

loc_176C3:
cmp     word ptr ds:1F88h, 0
jnz     short loc_1769C

loc_176CA:
cmp     word ptr ds:1F88h, 0
jz      short loc_176F3
mov     bx, [bp+var_2]
test    byte ptr [bx+6], 4
jnz     short loc_176F3
mov     bx, ds:1F88h
cmp     byte ptr [bx+4], 0
jnz     short loc_176F3
push    word ptr ds:1F8Ch
call    sub_16DAE
mov     bx, ds:1F8Eh
mov     byte ptr [bx+5], 1

loc_176F3:
mov     ax, [bp+var_6]

loc_176F6:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_174B1 endp




sub_176FE proc near
cmp     word ptr ds:1F88h, 0
jz      short locret_1771F
mov     bx, ds:1F88h
cmp     word ptr [bx+9], 0FFFFh
jz      short locret_1771F
push    word ptr [bx+9]
call    sub_1E8C0
mov     bx, ds:1F88h
push    word ptr [bx+5]
call    sub_16DAE

locret_1771F:
retn
sub_176FE endp



; Attributes: bp-based frame

sub_17720 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
mov     di, [bp+arg_0]
mov     si, ds:1F8Ah
or      di, di
jge     short loc_17737
or      si, si
jz      short loc_17749
dec     si
jmp     short loc_1773D

loc_17737:
cmp     di, si
jg      short loc_1773D
sub     si, di

loc_1773D:
push    si
call    sub_16F3E
cmp     di, 0FFFFh
jnz     short loc_17749
call    sub_176FE

loc_17749:
pop     di
pop     si
pop     bp
retn    2
sub_17720 endp



; Attributes: bp-based frame

sub_1774F proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
cmp     word ptr ds:8D6Ch, 0
jnz     short loc_177B9
push    ds
mov     ax, 8D44h
push    ax
push    ds
mov     ax, 8D6Eh
push    ax
mov     ax, 28h ; '('
push    ax
call    sub_46A2C
mov     ax, ds:1F90h
mov     ds:8D18h, ax
mov     ax, ds:1F88h
mov     ds:1F92h, ax
mov     ax, ds:1F8Ah
mov     ds:1F94h, ax
mov     ax, ds:1F8Ch
mov     ds:1F96h, ax
mov     si, ds:1F90h
jmp     short loc_177A5

loc_1778B:
mov     bx, si
shl     bx, 1
shl     bx, 1
mov     ax, [bx-72BAh]
mov     ds:1F88h, ax
or      ax, ax
jz      short loc_177A4
mov     bx, ax
cmp     word ptr [bx+9], 0FFFFh
jnz     short loc_177A9

loc_177A4:
dec     si

loc_177A5:
or      si, si
jge     short loc_1778B

loc_177A9:
mov     ds:8D1Ah, si
push    [bp+arg_0]
call    sub_17720
mov     word ptr ds:8D6Ch, 1

loc_177B9:
pop     si
pop     bp
retn    2
sub_1774F endp



; Attributes: bp-based frame

sub_177BE proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    si
push    di
mov     ax, [bp+arg_2]
mov     ds:1F8Eh, ax
mov     si, ds:1F88h
mov     di, ds:1F8Ch
call    sub_173DF
cmp     [bp+arg_0], 0
jnz     short loc_177DD
call    sub_176FE

loc_177DD:
mov     ds:1F88h, si
mov     ds:1F8Ch, di
pop     di
pop     si
pop     bp
retn    4
sub_177BE endp




sub_177EB proc near
mov     word ptr ds:8D6Ch, 0
retn
sub_177EB endp




sub_177F2 proc near
mov     bx, ds:1F88h
mov     al, [bx+4]
mov     ah, 0
or      ax, ax
jz      short loc_1780B
cmp     ax, 1
jz      short loc_17815
cmp     ax, 2
jz      short loc_17820
jmp     short loc_1782B

loc_1780B:
mov     bx, ds:1F8Eh
mov     al, [bx]
mov     ah, 0
jmp     short locret_1782D

loc_17815:
mov     bx, ds:1F8Eh
mov     al, [bx+1]
mov     ah, 0
jmp     short locret_1782D

loc_17820:
mov     bx, ds:1F8Eh
mov     al, [bx+2]
mov     ah, 0
jmp     short locret_1782D

loc_1782B:
xor     ax, ax

locret_1782D:
retn
sub_177F2 endp




sub_1782E proc near
mov     bx, ds:1F88h
mov     al, [bx+0Bh]
mov     ah, 0
push    ax
mov     al, [bx+0Ch]
mov     ah, 0
push    ax
mov     al, [bx+0Dh]
mov     ah, 0
push    ax
mov     al, [bx+0Eh]
mov     ah, 0
push    ax
call    sub_177F2
push    ax
mov     bx, ds:1F88h
mov     bx, [bx+7]
mov     al, [bx+1]
mov     ah, 0
push    ax
mov     bx, ds:1F88h
mov     bx, [bx+7]
mov     al, [bx+3]
mov     ah, 0
push    ax
xor     ax, ax
push    ax
mov     ax, 1
push    ax
call    sub_1E93C
mov     bx, ds:1F88h
mov     [bx+9], ax
retn
sub_1782E endp



; Attributes: bp-based frame

sub_1787A proc near

var_110= byte ptr -110h
var_10F= byte ptr -10Fh
var_70= byte ptr -70h
var_24= word ptr -24h
var_22= word ptr -22h
var_20= byte ptr -20h
var_1F= byte ptr -1Fh
var_1E= byte ptr -1Eh
var_1D= byte ptr -1Dh
var_1C= word ptr -1Ch
var_1A= word ptr -1Ah
var_18= word ptr -18h
var_16= word ptr -16h
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

push    bp
mov     bp, sp
sub     sp, 110h
push    si
push    di
mov     bx, ds:1F88h
mov     ax, [bx+7]
mov     [bp+var_24], ax
mov     ax, [bp+arg_0]
mov     dx, 0Bh
mul     dx
mov     di, ax
add     di, [bx+11h]
mov     ax, [di+7]
mov     [bp+var_22], ax
mov     ax, [bp+arg_0]
cmp     ax, ds:1F8Ch
jnz     short loc_178BD
mov     bx, [bp+var_24]
mov     al, [bx+2]
mov     [bp+var_1E], al
mov     [bp+var_1D], al
mov     al, [bx+3]
mov     [bp+var_1F], al
jmp     short loc_17903

loc_178BD:
cmp     byte ptr [di+5], 5
jnz     short loc_178D4
mov     bx, [bp+var_24]
mov     al, [bx+1]
mov     [bp+var_1E], al
call    sub_177F2
mov     [bp+var_10], ax
jmp     short loc_17903

loc_178D4:
test    byte ptr [di+6], 1
jz      short loc_178F1
cmp     byte ptr [di+5], 1
jz      short loc_178F1
mov     bx, [bp+var_24]
mov     al, [bx+4]
mov     [bp+var_1F], al
mov     [bp+var_1D], al
mov     [bp+var_1E], al
jmp     short loc_17903

loc_178F1:
mov     bx, [bp+var_24]
mov     al, [bx+3]
mov     [bp+var_1F], al
mov     [bp+var_1E], al
mov     al, [bx+5]
mov     [bp+var_1D], al

loc_17903:
cmp     byte ptr [di+5], 1
jnz     short loc_17912
mov     bx, [di]
mov     al, [bx]
mov     [bp+var_20], al
jmp     short loc_1792E

loc_17912:
cmp     byte ptr [di+5], 5
jnz     short loc_1792A
mov     bx, [bp+var_10]
shl     bx, 1
shl     bx, 1
shl     bx, 1
mov     al, [bx+1B0Ah]
mov     [bp+var_20], al
jmp     short loc_1792E

loc_1792A:
mov     [bp+var_20], 20h ; ' '

loc_1792E:
mov     si, [di]
push    si
call    sub_19448
mov     [bp+var_16], ax
mov     bx, ds:1F88h
cmp     byte ptr [bx+4], 0
jnz     short loc_17994
cmp     [bp+arg_0], 0
jz      short loc_1795B
mov     [bp+var_8], 0
mov     bx, [bp+arg_0]
shl     bx, 1
mov     ax, [bx-72E4h]
inc     ax
mov     [bp+var_E], ax
jmp     short loc_1796C

loc_1795B:
mov     bx, [bp+arg_0]
shl     bx, 1
mov     ax, [bx-72E4h]
mov     [bp+var_8], ax
mov     [bp+var_E], 1

loc_1796C:
mov     ax, [bp+var_8]
mov     [bp+var_6], ax
add     ax, [bp+var_16]
dec     ax
mov     [bp+var_4], ax
mov     bx, [bp+arg_0]
inc     bx
shl     bx, 1
mov     ax, [bx-72E4h]
mov     [bp+var_C], ax
mov     [bp+var_A], 1
sub     ax, [bp+var_E]
inc     ax
mov     [bp+var_2], ax
jmp     short loc_179D8

loc_17994:
cmp     byte ptr [di+5], 5
jz      short loc_1799F
mov     ax, 1
jmp     short loc_179A1

loc_1799F:
xor     ax, ax

loc_179A1:
mov     [bp+var_E], ax
mov     bx, ds:1F88h
mov     al, [bx+0Dh]
mov     ah, 0
mov     dl, [bx+0Bh]
mov     dh, 0
sub     ax, dx
sub     ax, [bp+var_E]
mov     [bp+var_C], ax
mov     ax, [bp+arg_0]
inc     ax
mov     [bp+var_A], ax
mov     [bp+var_8], 0
mov     [bp+var_6], 1
mov     ax, [bp+var_C]
sub     ax, [bp+var_E]
inc     ax
mov     [bp+var_2], ax
mov     [bp+var_4], ax

loc_179D8:
mov     [bp+var_1C], 0
jmp     short loc_17A14

loc_179DF:
mov     al, [bp+var_20]
mov     bx, [bp+var_1C]
shl     bx, 1
lea     dx, [bp+var_110]
add     bx, dx
mov     [bx], al
mov     ax, [bp+var_1C]
cmp     ax, [bp+var_8]
jl      short loc_179FC
cmp     ax, [bp+var_4]
jle     short loc_17A01

loc_179FC:
mov     al, [bp+var_1F]
jmp     short loc_17A04

loc_17A01:
mov     al, [bp+var_1E]

loc_17A04:
mov     bx, [bp+var_1C]
shl     bx, 1
lea     dx, [bp+var_10F]
add     bx, dx
mov     [bx], al
inc     [bp+var_1C]

loc_17A14:
mov     ax, [bp+var_1C]
cmp     ax, [bp+var_2]
jl      short loc_179DF
cmp     byte ptr [di+5], 5
jnz     short loc_17A4F
mov     bx, [bp+var_10]
shl     bx, 1
shl     bx, 1
shl     bx, 1
mov     al, [bx+1B0Ch]
mov     [bp+var_110], al
mov     bx, [bp+var_10]
shl     bx, 1
shl     bx, 1
shl     bx, 1
mov     al, [bx+1B0Dh]
mov     bx, [bp+var_C]
shl     bx, 1
lea     dx, [bp+var_110]
add     bx, dx
mov     [bx], al
jmp     short loc_17A96

loc_17A4F:
mov     ax, [bp+var_6]
mov     [bp+var_1C], ax
mov     [bp+var_14], 0
jmp     short loc_17A91

loc_17A5C:
mov     al, [si]
mov     bx, [bp+var_1C]
shl     bx, 1
lea     dx, [bp+var_110]
add     bx, dx
mov     [bx], al
cmp     [bp+var_14], 0
jnz     short loc_17A8D
mov     al, [si]
cmp     al, [di+2]
jnz     short loc_17A8D
mov     [bp+var_14], 1
mov     al, [bp+var_1D]
mov     bx, [bp+var_1C]
shl     bx, 1
lea     dx, [bp+var_10F]
add     bx, dx
mov     [bx], al

loc_17A8D:
inc     si
inc     [bp+var_1C]

loc_17A91:
cmp     byte ptr [si], 0
jnz     short loc_17A5C

loc_17A96:
mov     bx, ds:1F88h
mov     al, [bx+0Fh]
mov     ah, 0
mov     [bp+var_1C], ax
mov     al, [bx+0Dh]
mov     ah, 0
mov     dl, [bx+0Bh]
mov     dh, 0
sub     ax, dx
add     ax, 0FFFDh
mov     [bp+var_1A], ax
xor     si, si
mov     al, [di+5]
mov     ah, 0
dec     ax
dec     ax              ; switch 5 cases
cmp     ax, 4
jbe     short loc_17AC5
jmp     def_17AC9       ; jumptable 00017AC9 default case, case 4

loc_17AC5:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_17AC9[bx] ; switch jump
jpt_17AC9 dw offset loc_17AD8 ; jump table for switch statement
dw offset loc_17B05
dw offset loc_17B36
dw offset def_17AC9
dw offset loc_17B43

loc_17AD8:              ; jumptable 00017AC9 case 1
mov     bx, [bp+var_22]
mov     ax, [bx]
mov     [bp+var_12], ax
test    byte ptr [di+6], 10h
jz      short loc_17AF0
mov     bx, ax
mov     al, [bx]
mov     ah, 0
mov     bx, ax
jmp     short loc_17AF5

loc_17AF0:
mov     bx, [bp+var_12]
mov     bx, [bx]

loc_17AF5:
shl     bx, 1
push    bx
mov     bx, [bp+var_22]
pop     ax
add     ax, [bx+4]
mov     bx, ax
mov     si, [bx]
jmp     short def_17AC9 ; jumptable 00017AC9 default case, case 4

loc_17B05:              ; jumptable 00017AC9 case 2
mov     bx, [bp+var_22]
mov     ax, [bx+13h]
mov     [bp+var_12], ax
test    byte ptr [di+6], 10h
jz      short loc_17B1C
mov     bx, ax
mov     al, [bx]
mov     ah, 0
jmp     short loc_17B21

loc_17B1C:
mov     bx, [bp+var_12]
mov     ax, [bx]

loc_17B21:
mov     dx, 0Bh
mul     dx
mov     bx, ax
push    bx
mov     bx, [bp+var_22]
pop     ax
add     ax, [bx+11h]
mov     bx, ax
mov     si, [bx]
jmp     short def_17AC9 ; jumptable 00017AC9 default case, case 4

loc_17B36:              ; jumptable 00017AC9 case 3
mov     bx, [bp+var_22]
mov     si, [bx+2]
mov     ax, [bx]
mov     [bp+var_16], ax
jmp     short def_17AC9 ; jumptable 00017AC9 default case, case 4

loc_17B43:              ; jumptable 00017AC9 case 5
mov     bx, [bp+var_22]
mov     ax, [bx+6]
mov     [bp+var_16], ax
or      ax, ax
jz      short def_17AC9 ; jumptable 00017AC9 default case, case 4
mov     si, [bx+2]

def_17AC9:              ; jumptable 00017AC9 default case, case 4
test    byte ptr [di+6], 20h
jz      short loc_17B6B
push    si
call    sub_19C1B
mov     byte ptr ds:9179h, 0
lea     ax, [bp+var_70]
push    ax
call    sub_19C39
jmp     short loc_17B7C

loc_17B6B:
test    byte ptr [di+6], 40h
jz      short loc_17B7F
push    si
lea     ax, [bp+var_70]
push    ax
push    [bp+var_16]
call    sub_12515

loc_17B7C:
lea     si, [bp+var_70]

loc_17B7F:
or      si, si
jz      short loc_17BCC
test    byte ptr [di+6], 2
jz      short loc_17BBF
push    si
call    sub_19448
mov     bx, ds:1F88h
mov     dl, [bx+0Fh]
mov     dh, 0
mov     bx, [bp+var_1A]
sub     bx, dx
sub     bx, ax
inc     bx
mov     [bp+var_18], bx
or      bx, bx
jle     short loc_17BBF
mov     ax, bx
add     [bp+var_1C], ax
jmp     short loc_17BBF

loc_17BAC:
mov     al, [si]
mov     bx, [bp+var_1C]
shl     bx, 1
lea     dx, [bp+var_110]
add     bx, dx
mov     [bx], al
inc     si
inc     [bp+var_1C]

loc_17BBF:
cmp     byte ptr [si], 0
jz      short loc_17BCC
mov     ax, [bp+var_1C]
cmp     ax, [bp+var_1A]
jle     short loc_17BAC

loc_17BCC:
push    [bp+var_E]
push    [bp+var_A]
push    [bp+var_C]
push    [bp+var_A]
lea     ax, [bp+var_110]
push    ax
xor     ax, ax
push    ax
call    sub_1D8CC
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_1787A endp




sub_17BEB proc near
push    si
mov     bx, ds:1F88h
mov     si, [bx+7]
call    sub_177F2
push    ax
mov     al, [si+1]
mov     ah, 0
push    ax
call    sub_1DA05
mov     bx, ds:1F88h
cmp     word ptr [bx], 0
jz      short loc_17C13
push    word ptr [bx]
mov     al, [si]
mov     ah, 0
push    ax
call    sub_1E90D

loc_17C13:
pop     si
retn
sub_17BEB endp



; Attributes: bp-based frame

sub_17C15 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
cmp     [bp+arg_0], 0
jz      short loc_17C35
mov     bx, ds:1F88h
mov     bx, [bx+7]
mov     al, [bx+3]
mov     ah, 0
push    ax
xor     ax, ax
push    ax
call    sub_1D98E
call    sub_17BEB

loc_17C35:
xor     si, si
jmp     short loc_17C3E

loc_17C39:
push    si
call    sub_1787A
inc     si

loc_17C3E:
mov     bx, ds:1F88h
mov     al, [bx+10h]
mov     ah, 0
cmp     ax, si
jg      short loc_17C39
pop     si
pop     bp
retn    2
sub_17C15 endp



; Attributes: bp-based frame

sub_17C50 proc near

var_4= word ptr -4
var_1= byte ptr -1

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
mov     di, 2217h
mov     [bp+var_1], 11h
mov     [bp+var_4], 0
jmp     short loc_17CA1

loc_17C66:
mov     bx, [bp+var_4]
shl     bx, 1
mov     ax, [bx+1FF2h]
mov     dx, 52h ; 'R'
mul     dx
mov     si, ax
add     si, 8E31h
cmp     byte ptr [si], 0
jz      short loc_17CA7
push    si
push    word ptr [di]
mov     ax, 32h ; '2'
push    ax
call    sub_12515
mov     bx, di
inc     di
inc     di
push    word ptr [bx]
call    sub_19448
mov     dl, [bp+var_1]
mov     dh, 0
cmp     ax, dx
jle     short loc_17C9E
mov     [bp+var_1], al

loc_17C9E:
inc     [bp+var_4]

loc_17CA1:
cmp     [bp+var_4], 9
jl      short loc_17C66

loc_17CA7:
inc     [bp+var_4]
mov     word ptr ds:30B1h, 1
mov     al, ds:30B7h
add     al, [bp+var_1]
add     al, 3
mov     ds:30B9h, al
mov     al, ds:30B8h
add     al, byte ptr [bp+var_4]
inc     al
mov     ds:30BAh, al
mov     al, byte ptr [bp+var_4]
mov     ds:30BCh, al
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_17C50 endp



; Attributes: bp-based frame

sub_17CD2 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
jmp     short loc_17CE0

loc_17CD7:
mov     bx, [bp+arg_2]
mov     byte ptr [bx], 0
inc     [bp+arg_2]

loc_17CE0:
mov     ax, [bp+arg_0]
dec     [bp+arg_0]
or      ax, ax
jnz     short loc_17CD7
pop     bp
retn    4
sub_17CD2 endp




sub_17CEE proc near
push    si
mov     ax, ds:1C96h
push    ax
mov     ax, ds:1FF2h
mov     dx, 52h ; 'R'
mul     dx
mov     bx, ax
pop     ax
mov     [bx-71D1h], ax
push    ds
mov     ax, 1CB5h
push    ax
push    ds
mov     ax, ds:1FF2h
mov     dx, 11h
mul     dx
add     ax, 8D96h
push    ax
mov     ax, 11h
push    ax
call    sub_46A2C
mov     ax, ds:1FF2h
mov     dx, 6
mul     dx
mov     si, ax
add     si, 2004h
mov     ax, ds:1C68h
and     ax, 10h
mov     [si], ax
call    sub_11C40
mov     [si+4], dx
mov     [si+2], ax
pop     si
retn
sub_17CEE endp



; Attributes: bp-based frame

sub_17D3E proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
inc     [bp+arg_2]
mov     ax, [bp+arg_2]
cmp     ax, 9
jl      short loc_17D54
mov     bx, [bp+arg_0]
mov     byte ptr [bx], 0
jmp     short loc_17D6C

loc_17D54:
push    [bp+arg_0]
mov     bx, [bp+arg_2]
shl     bx, 1
mov     ax, [bx+1FF2h]
mov     dx, 52h ; 'R'
mul     dx
add     ax, 8E31h
push    ax
call    sub_19458

loc_17D6C:
pop     bp
retn    4
sub_17D3E endp



; Attributes: bp-based frame

sub_17D70 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
xor     si, si
jmp     short loc_17D9D

loc_17D79:
mov     bx, si
shl     bx, 1
mov     ax, [bx+1FF2h]
mov     dx, 52h ; 'R'
mul     dx
mov     di, ax
add     di, 8E31h
cmp     byte ptr [di], 0
jz      short loc_17DA2
push    [bp+arg_0]
push    di
call    sub_19497
or      ax, ax
jz      short loc_17DA2
inc     si

loc_17D9D:
cmp     si, 9
jl      short loc_17D79

loc_17DA2:
or      di, di
jz      short loc_17DD2
mov     byte ptr [di], 0
mov     bx, si
shl     bx, 1
mov     dx, [bx+1FF2h]
jmp     short loc_17DC5

loc_17DB3:
mov     bx, si
inc     bx
shl     bx, 1
mov     ax, [bx+1FF2h]
mov     bx, si
shl     bx, 1
mov     [bx+1FF2h], ax
inc     si

loc_17DC5:
cmp     si, 8
jl      short loc_17DB3
mov     bx, si
shl     bx, 1
mov     [bx+1FF2h], dx

loc_17DD2:
pop     di
pop     si
pop     bp
retn    2
sub_17D70 endp



; Attributes: bp-based frame

sub_17DD8 proc near

var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 8
push    si
push    di
xor     si, si
jmp     short loc_17E0B

loc_17DE4:
mov     bx, si
shl     bx, 1
mov     ax, [bx+1FF2h]
mov     dx, 52h ; 'R'
mul     dx
mov     di, ax
add     di, 8E31h
cmp     byte ptr [di], 0
jz      short loc_17E10
push    ds
mov     ax, 9877h
push    ax
push    ds
push    di
call    sub_19911
or      ax, ax
jnz     short loc_17E10
inc     si

loc_17E0B:
cmp     si, 9
jl      short loc_17DE4

loc_17E10:
cmp     si, 9
jz      short loc_17E1A
cmp     byte ptr [di], 0
jnz     short loc_17E1F

loc_17E1A:
mov     ax, 1
jmp     short loc_17E21

loc_17E1F:
xor     ax, ax

loc_17E21:
mov     [bp+var_8], ax
cmp     si, 9
jnz     short loc_17E2A
dec     si

loc_17E2A:
mov     bx, si
shl     bx, 1
mov     ax, [bx+1FF2h]
mov     [bp+var_6], ax
push    di
mov     ax, 9877h
push    ax
call    sub_19458
jmp     short loc_17E51

loc_17E3F:
mov     bx, si
dec     bx
shl     bx, 1
mov     ax, [bx+1FF2h]
mov     bx, si
shl     bx, 1
mov     [bx+1FF2h], ax
dec     si

loc_17E51:
or      si, si
jnz     short loc_17E3F
mov     ax, [bp+var_6]
mov     ds:1FF2h, ax
push    ds
mov     ax, 1C5Eh
push    ax
call    sub_46233
pop     cx
pop     cx
cmp     [bp+var_8], 0
jz      short loc_17E7F
and     word ptr ds:1C68h, 0FFEFh
mov     word ptr ds:1C96h, 0
call    sub_17CEE
jmp     loc_17F0F

loc_17E7F:
mov     ax, ds:1FF2h
mov     dx, 6
mul     dx
add     ax, 2004h
mov     [bp+var_2], ax
inc     ax
inc     ax
mov     [bp+var_4], ax
call    sub_11C40
mov     bx, [bp+var_4]
cmp     dx, [bx+2]
jnz     short loc_17EEA
cmp     ax, [bx]
jnz     short loc_17EEA
mov     ax, ds:1FF2h
mov     dx, 52h ; 'R'
mul     dx
mov     bx, ax
mov     ax, [bx-71D1h]
mov     ds:1C96h, ax
push    ds
mov     ax, ds:1FF2h
mov     dx, 11h
mul     dx
add     ax, 8D96h
push    ax
push    ds
mov     ax, 1CB5h
push    ax
mov     ax, 11h
push    ax
call    sub_46A2C
mov     ax, ds:1FF2h
mov     dx, 6
mul     dx
mov     bx, ax
mov     ax, [bx+2004h]
mov     dx, ds:1C68h
and     dx, 0FFEFh
or      ax, dx
mov     ds:1C68h, ax
jmp     short loc_17F0F

loc_17EEA:
call    sub_11C40
mov     bx, [bp+var_4]
mov     [bx+2], dx
mov     [bx], ax
mov     bx, [bp+var_2]
mov     word ptr [bx], 0
mov     ax, ds:1FF2h
mov     dx, 11h
mul     dx
add     ax, 8D96h
push    ax
mov     ax, 11h
push    ax
call    sub_17CD2

loc_17F0F:
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_17DD8 endp



; Attributes: bp-based frame

sub_17F15 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, 1
mov     bx, [bp+arg_0]
cmp     byte ptr [bx], 0
jz      short loc_17F41
mov     word ptr ds:40DAh, 0Bh
mov     ax, 0FFFFh
push    ax
call    sub_156D7
push    [bp+arg_0]
mov     ax, 33Ch
push    ax
mov     ax, 0B2h
push    ax
call    sub_12100
mov     si, ax

loc_17F41:
or      si, si
jz      short loc_17F4F
mov     ax, 33Ch
push    ax
call    sub_12397
mov     ds:9111h, ax

loc_17F4F:
mov     ax, si
pop     si
pop     bp
retn    2
sub_17F15 endp



; Attributes: bp-based frame

sub_17F56 proc near

var_50= byte ptr -50h
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 50h
push    si
push    di
push    [bp+arg_0]
mov     ax, 222Bh
push    ax
lea     ax, [bp+var_50]
push    ax
call    sub_14F85
push    ss
lea     ax, [bp+var_50]
push    ax
push    ds
mov     ax, 9113h
push    ax
call    sub_19911
or      ax, ax
jz      short loc_17F80
jmp     loc_1802E

loc_17F80:
mov     ax, 33Ch
push    ax
push    word ptr ds:9111h
call    sub_123DA
or      ax, ax
jz      short loc_17F96
mov     ax, 9113h
push    ax
call    sub_17F15

loc_17F96:
mov     word ptr ds:9111h, 0
cmp     [bp+var_50], 0
jnz     short loc_17FA5
jmp     loc_1802E

loc_17FA5:
lea     ax, [bp+var_50]
push    ax
lea     ax, [bp+var_50]
push    ax
call    sub_19C57
push    ss
lea     ax, [bp+var_50]
push    ax
call    sub_105F1
or      ax, ax
jnz     short loc_17FCB
lea     ax, [bp+var_50]
push    ax
call    sub_17F15
or      ax, ax
jz      short loc_18029
jmp     short loc_1801C

loc_17FCB:
mov     word ptr ds:40DAh, 0Dh
mov     ax, 0FFFFh
push    ax
call    sub_156D7
lea     ax, [bp+var_50]
push    ax
mov     ax, 33Ch
push    ax
mov     ax, 0B2h
push    ax
call    sub_11FAE
or      ax, ax
jz      short loc_18029
xor     si, si
jmp     short loc_1800D

loc_17FEF:
mov     bx, si
shl     bx, 1
mov     ax, [bx+1FF2h]
mov     dx, 52h ; 'R'
mul     dx
mov     di, ax
add     di, 8E31h
cmp     byte ptr [di], 0
jz      short loc_18012
push    ds
push    di
call    sub_10505
inc     si

loc_1800D:
cmp     si, 9
jl      short loc_17FEF

loc_18012:
mov     ax, 33Ch
push    ax
call    sub_12397
mov     ds:9111h, ax

loc_1801C:
mov     ax, 9113h
push    ax
lea     ax, [bp+var_50]
push    ax
call    sub_19458
jmp     short loc_1802E

loc_18029:
mov     byte ptr ds:9113h, 0

loc_1802E:
mov     ax, 1
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_17F56 endp



; Attributes: bp-based frame

sub_18039 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
cmp     [bp+arg_0], 30ACh
jnz     short loc_18046
call    sub_17C50

loc_18046:
pop     bp
retn    2
sub_18039 endp



; Attributes: bp-based frame

sub_1804A proc near

var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
mov     di, [bp+arg_0]
mov     byte ptr ds:97F0h, 0
cmp     di, 104h
jl      short loc_1808A
cmp     di, 10Dh
jg      short loc_1808A
mov     ax, di
add     ax, 0FEFBh
push    ax
mov     ax, 97F0h
push    ax
call    sub_17D3E
cmp     byte ptr ds:97F0h, 0
jz      short loc_1807F
mov     di, 111h
jmp     short loc_1808A

loc_1807F:
mov     di, 101h
mov     al, 4
mov     ds:3497h, al
mov     ds:3496h, al

loc_1808A:
mov     ax, di
sub     ax, 101h        ; switch 18 cases
cmp     ax, 11h
jbe     short loc_18097
jmp     def_1809B       ; jumptable 0001809B default case, cases 259-269

loc_18097:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_1809B[bx] ; switch jump
jpt_1809B dw offset loc_180C4 ; jump table for switch statement
dw offset loc_18106
dw offset def_1809B
dw offset def_1809B
dw offset def_1809B
dw offset def_1809B
dw offset def_1809B
dw offset def_1809B
dw offset def_1809B
dw offset def_1809B
dw offset def_1809B
dw offset def_1809B
dw offset def_1809B
dw offset loc_1811F
dw offset loc_180CC
dw offset loc_1819A
dw offset loc_180E9
dw offset loc_1820F

loc_180C4:              ; jumptable 0001809B case 257
call    sub_154E6
mov     si, ax
jmp     loc_18223

loc_180CC:              ; jumptable 0001809B case 271
mov     ax, 97F0h
push    ax
mov     ax, 30C1h
push    ax
xor     ax, ax
push    ax
mov     ax, 2236h
push    ax
call    sub_14398
mov     si, ax
mov     ax, si
or      ax, ax
jge     short loc_180E9 ; jumptable 0001809B case 273
jmp     loc_18223

loc_180E9:              ; jumptable 0001809B case 273
mov     ax, 97F0h
push    ax
call    sub_152EB
mov     si, ax
mov     ax, si
or      ax, ax
jg      short loc_180FB
jmp     loc_18223

loc_180FB:
mov     byte ptr ds:98C7h, 0
mov     si, 600h
jmp     loc_18223

loc_18106:              ; jumptable 0001809B case 258
call    sub_153A6
mov     si, ax
mov     ax, si
or      ax, ax
jnz     short loc_18114
jmp     loc_18223

loc_18114:
cmp     si, 0FFFFh
jge     short loc_1811C
jmp     loc_18223

loc_1811C:
jmp     loc_18204

loc_1811F:              ; jumptable 0001809B case 270
mov     ax, 97F0h
push    ax
mov     ax, 93DCh
push    ax
xor     ax, ax
push    ax
mov     ax, 0E56h
push    ax
call    sub_14398
mov     si, ax
mov     ax, si
or      ax, ax
jge     short loc_1813C
jmp     loc_18223

loc_1813C:
push    ds
mov     ax, 97F0h
push    ax
call    sub_105F1
or      ax, ax
jz      short loc_18156
mov     ax, 97F0h
push    ax
call    sub_1913E
or      ax, ax
jnz     short loc_18156
jmp     loc_18223

loc_18156:
mov     ax, 97F0h
push    ax
call    sub_151D5
or      ax, ax
jnz     short loc_18164
jmp     loc_18223

loc_18164:
mov     ax, 9877h
push    ax
mov     ax, 97F0h
push    ax
call    sub_19C57
push    ds
mov     ax, 9877h
push    ax
push    word ptr ds:1C6Ch
push    word ptr ds:1C6Ah
call    sub_463CE
add     sp, 8
call    sub_17DD8
mov     byte ptr ds:98C7h, 0
mov     ax, 0FFFFh
push    ax
call    sub_17720
call    sub_1492F
jmp     short loc_18204

loc_1819A:              ; jumptable 0001809B case 272
mov     al, 0
push    ax
push    ds
mov     ax, 97F0h
push    ax
call    sub_10534
mov     ax, 97F0h
push    ax
call    sub_19448
mov     [bp+var_2], ax
cmp     ax, 3
jle     short loc_181BB
mov     bx, ax
mov     byte ptr [bx-6811h], 0

loc_181BB:
mov     ax, 0FF9h
push    ax
mov     ax, 97F0h
push    ax
mov     ax, 44h ; 'D'
push    ax
call    sub_1917C
mov     si, ax
mov     ax, si
cmp     ax, 4
jnz     short loc_18209
mov     ax, 97F0h
push    ax
call    sub_1943A
mov     ax, 97F0h
push    ax
call    sub_15290
cmp     ax, 1
jz      short loc_18204
cmp     ax, 2
jz      short loc_181ED
jmp     short loc_181F9

loc_181ED:
mov     ax, 1009h
push    ax
xor     ax, ax
push    ax
call    sub_19065
jmp     short loc_18223

loc_181F9:
mov     ax, 99B9h
push    ax
mov     ax, 97F0h
push    ax
call    sub_19458

loc_18204:
mov     si, 0FFE5h
jmp     short loc_18223

loc_18209:
or      si, si
jle     short loc_18223
jmp     short def_1809B ; jumptable 0001809B default case, cases 259-269

loc_1820F:              ; jumptable 0001809B case 274
xor     ax, ax
push    ax
call    sub_12268
mov     si, ax
mov     ax, si
or      ax, ax
jl      short loc_18223
call    sub_13A02

def_1809B:              ; jumptable 0001809B default case, cases 259-269
mov     si, 0FFFFh

loc_18223:
or      si, si
jz      short loc_1822C
cmp     si, 4
jnz     short loc_1822F

loc_1822C:
mov     si, 0FFFFh

loc_1822F:
mov     ax, si
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_1804A endp



; Attributes: bp-based frame

sub_18239 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     ax, [bp+arg_0]
sub     ax, 305h        ; switch 10 cases
cmp     ax, 9
jbe     short loc_1824B
jmp     def_1824F       ; jumptable 0001824F default case, cases 775-778,780,781

loc_1824B:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_1824F[bx] ; switch jump
jpt_1824F dw offset loc_18268 ; jump table for switch statement
dw offset loc_18310
dw offset def_1824F
dw offset def_1824F
dw offset def_1824F
dw offset def_1824F
dw offset loc_1837D
dw offset def_1824F
dw offset def_1824F
dw offset loc_1842D

loc_18268:              ; jumptable 0001824F case 773
mov     ax, 97F0h
push    ax
mov     ax, 2F7Ch
push    ax
xor     ax, ax
push    ax
mov     ax, 2239h
push    ax
call    sub_14398
mov     si, ax
mov     ax, si
or      ax, ax
jge     short loc_18285
jmp     loc_1844A

loc_18285:
cmp     word ptr ds:23BDh, 0
jz      short loc_182A9
mov     ax, 0F6h
push    ax
push    word ptr ds:8254h
call    sub_123DA
or      ax, ax
jz      short loc_182A9
mov     ax, 9963h
push    ax
call    sub_121DE
or      ax, ax
jnz     short loc_182A9
jmp     loc_1844A

loc_182A9:
mov     ax, 97F0h
push    ax
call    sub_12223
or      ax, ax
jz      short loc_18302
mov     byte ptr ds:98C7h, 0
mov     ax, 0FFFFh
push    ax
call    sub_17720
mov     si, 0FFE5h
call    sub_121AD
mov     al, ds:926Eh
mov     ah, 0
cmp     ax, ds:0F2h
jz      short loc_182DF
mov     ax, ds:0F0h
mov     ds:23C5h, ax
xor     ax, ax
push    ax
call    sub_1A4C4
jmp     short loc_182F1

loc_182DF:
mov     ax, ds:23C5h
cmp     ax, ds:0F0h
jz      short loc_182F1
mov     ax, ds:0F0h
mov     ds:23C5h, ax
call    sub_1AFE5

loc_182F1:
mov     ax, 1FA2h
push    ax
call    sub_17F56
or      ax, ax
jnz     short loc_182FF
jmp     loc_1844A

loc_182FF:
jmp     loc_183EF

loc_18302:
mov     ax, 9963h
push    ax
mov     ax, 223Dh
push    ax
call    sub_19458
jmp     loc_1844A

loc_18310:              ; jumptable 0001824F case 774
mov     ax, 97F0h
push    ax
mov     ax, 9963h
push    ax
call    sub_19458
mov     ax, 1032h
push    ax
mov     ax, 97F0h
push    ax
mov     ax, 50h ; 'P'
push    ax
call    sub_1917C
mov     si, ax
mov     ax, si
or      ax, ax
jge     short loc_18335
jmp     loc_1844A

loc_18335:
mov     ax, 97F0h
push    ax
xor     ax, ax
push    ax
push    ax
mov     ax, 2239h
push    ax
call    sub_14398
mov     si, ax
mov     ax, si
or      ax, ax
jge     short loc_1834F
jmp     loc_1844A

loc_1834F:
push    ds
mov     ax, 97F0h
push    ax
call    sub_105F1
or      ax, ax
jz      short loc_18369
mov     ax, 97F0h
push    ax
call    sub_1913E
or      ax, ax
jnz     short loc_18369
jmp     loc_1844A

loc_18369:
mov     ax, 97F0h
push    ax
call    sub_121DE
mov     ax, 0FFFFh
push    ax
call    sub_17720
mov     si, 0FFE5h
jmp     loc_1844A

loc_1837D:              ; jumptable 0001824F case 779
mov     ax, 97F0h
push    ax
mov     ax, 1FA2h
push    ax
call    sub_19458
cmp     byte ptr ds:97F0h, 0
jnz     short loc_1839A
mov     ax, 97F0h
push    ax
mov     ax, 2249h
push    ax
call    sub_19458

loc_1839A:
mov     ax, 1056h
push    ax
mov     ax, 97F0h
push    ax
mov     ax, 50h ; 'P'
push    ax
call    sub_1917C
mov     si, ax
mov     ax, si
or      ax, ax
jge     short loc_183B4
jmp     loc_1844A

loc_183B4:
mov     ax, 97F0h
push    ax
call    sub_1943A
cmp     byte ptr ds:97F0h, 0
jz      short loc_183D9
mov     ax, 97F0h
push    ax
xor     ax, ax
push    ax
push    ax
mov     ax, 2249h
push    ax
call    sub_14398
mov     si, ax
mov     ax, si
or      ax, ax
jl      short loc_1844A

loc_183D9:
mov     ax, 97F0h
push    ax
call    sub_17F56
or      ax, ax
jz      short loc_1844A
mov     ax, 1FA2h
push    ax
mov     ax, 97F0h
push    ax
call    sub_19458

loc_183EF:
mov     ax, 0FFFFh
push    ax
mov     ax, 97F0h
push    ax
call    sub_17D3E
cmp     byte ptr ds:97F0h, 0
jnz     short loc_1840C
mov     ax, 97F0h
push    ax
mov     ax, 0E50h
push    ax
call    sub_19458

loc_1840C:
push    ds
mov     ax, 97F0h
push    ax
push    ds
mov     ax, 9877h
push    ax
call    sub_19911
or      ax, ax
jnz     short loc_1844A
mov     ax, 0FFFFh
push    ax
call    sub_1774F
mov     ax, 97F0h
push    ax
call    sub_152EB
jmp     short loc_1844A

loc_1842D:              ; jumptable 0001824F case 782
mov     ax, 1CB4h
push    ax
mov     ax, 2E83h
push    ax
mov     ax, 2
push    ax
mov     ax, 10h
push    ax
call    sub_190A1
or      ax, ax
jz      short def_1824F ; jumptable 0001824F default case, cases 775-778,780,781
call    sub_1492F

def_1824F:              ; jumptable 0001824F default case, cases 775-778,780,781
mov     si, 0FFFFh

loc_1844A:
or      si, si
jl      short loc_18453
mov     ax, 0FFFFh
jmp     short loc_18455

loc_18453:
mov     ax, si

loc_18455:
pop     si
pop     bp
retn    2
sub_18239 endp



; Attributes: bp-based frame

sub_1845A proc near

arg_0= byte ptr  4

push    bp
mov     bp, sp
mov     al, [bp+arg_0]
cmp     al, ds:926Eh
jz      short loc_18474
mov     al, [bp+arg_0]
mov     ah, 0
mov     ds:0F2h, ax
xor     ax, ax
push    ax
call    sub_1A4C4

loc_18474:
mov     ax, 500h
pop     bp
retn    2
sub_1845A endp



; Attributes: bp-based frame

sub_1847B proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, 0FFFFh
mov     ax, [bp+arg_0]
mov     cx, 8           ; switch 8 cases
mov     bx, 849Bh

loc_1848B:
cmp     ax, cs:[bx]
jz      short loc_18497
inc     bx
inc     bx
loop    loc_1848B
jmp     def_18497       ; jumptable 00018497 default case

loc_18497:              ; switch jump
jmp     word ptr cs:[bx+10h]
dw 0FFE4h,0FFEFh,0FFF8h,0FFFCh ; value table for switch statement
dw   401h,  402h,  403h,  404h
jpt_18497 dw offset loc_184FE ; jump table for switch statement
dw offset loc_184BB
dw offset loc_184DA
dw offset loc_184F0
dw offset loc_184E5
dw offset loc_1852B
dw offset loc_18530
dw offset loc_184BB

loc_184BB:              ; jumptable 00018497 cases 65519,1028
cmp     word ptr ds:472Ah, 0
jz      short loc_184C5
jmp     def_18497       ; jumptable 00018497 default case

loc_184C5:
call    sub_1A45E
call    sub_15852
push    ax
call    sub_11EA2
mov     si, ax
call    sub_1A39F
mov     si, 0FFFFh
jmp     def_18497       ; jumptable 00018497 default case

loc_184DA:              ; jumptable 00018497 case 65528
mov     ax, ds:23C5h
neg     ax
sbb     ax, ax
inc     ax
mov     ds:23C5h, ax

loc_184E5:              ; jumptable 00018497 case 1025
mov     ax, ds:23C5h
mov     ds:0F0h, ax
call    sub_1AFE5
jmp     short def_18497 ; jumptable 00018497 default case

loc_184F0:              ; jumptable 00018497 case 65532
mov     ax, 0FFFFh
push    ax
call    sub_17720
call    sub_1AF1E
mov     si, ax
jmp     short def_18497 ; jumptable 00018497 default case

loc_184FE:              ; jumptable 00018497 case 65508
cmp     word ptr ds:4724h, 600h
jnz     short loc_1850B
mov     si, 105h
jmp     short def_18497 ; jumptable 00018497 default case

loc_1850B:
cmp     word ptr ds:4724h, 700h
jnz     short def_18497 ; jumptable 00018497 default case
cmp     word ptr ds:4722h, 0
jnz     short loc_1851F
mov     ax, 1
jmp     short loc_18521

loc_1851F:
xor     ax, ax

loc_18521:
push    ax
call    sub_1B2A2
mov     si, ds:4913h
jmp     short def_18497 ; jumptable 00018497 default case

loc_1852B:              ; jumptable 00018497 case 1026
mov     ax, 19h
jmp     short loc_18540

loc_18530:              ; jumptable 00018497 case 1027
test    word ptr ds:91D3h, 4
jz      short loc_1853D
mov     ax, 2Bh ; '+'
jmp     short loc_18540

loc_1853D:
mov     ax, 32h ; '2'

loc_18540:
push    ax
call    sub_1845A
mov     si, ax

def_18497:              ; jumptable 00018497 default case
mov     ax, si
pop     si
pop     bp
retn    2
sub_1847B endp



; Attributes: bp-based frame

sub_1854D proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
mov     si, 500h
mov     bx, ds:1F90h
shl     bx, 1
shl     bx, 1
mov     di, [bx-72BAh]
mov     ax, [bp+arg_0]
sub     ax, 0FFDCh      ; switch 34 cases
cmp     ax, 21h
jbe     short loc_18572
jmp     def_18576       ; jumptable 00018576 default case, cases -7--5

loc_18572:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_18576[bx] ; switch jump
jpt_18576 dw offset loc_185BF ; jump table for switch statement
dw offset loc_186F2
dw offset loc_185BF
dw offset loc_185BF
dw offset loc_185BF
dw offset loc_185BF
dw offset loc_185BF
dw offset loc_185BF
dw offset loc_18601
dw offset loc_186D6
dw offset loc_18729
dw offset loc_18724
dw offset loc_18706
dw offset loc_1870B
dw offset loc_186BF
dw offset loc_1871A
dw offset loc_18715
dw offset loc_18710
dw offset loc_1871F
dw offset loc_18601
dw offset loc_18701
dw offset loc_186FC
dw offset loc_1860C
dw offset loc_1860C
dw offset loc_186F7
dw offset loc_1869B
dw offset loc_18678
dw offset loc_186CE
dw offset loc_18601
dw offset def_18576
dw offset def_18576
dw offset def_18576
dw offset loc_18601
dw offset loc_186ED

loc_185BF:              ; jumptable 00018576 cases -36,-34--29
mov     ax, 0FFFFh
push    ax
call    sub_17720
mov     ax, [bp+arg_0]
add     ax, 24h ; '$'
mov     ds:3483h, ax
mov     dx, 0Bh
mul     dx
add     ax, ds:348Fh
mov     [bp+var_4], ax
mov     bx, ax
cmp     word ptr [bx+7], 0
jnz     short loc_185EA
mov     bx, ax
mov     si, [bx+3]
jmp     short loc_185F5

loc_185EA:
mov     ax, 3493h
push    ax
mov     ax, 1
push    ax
call    sub_177BE

loc_185F5:
mov     bx, [bp+var_4]
push    word ptr [bx+7]
call    sub_16F0E
jmp     def_18576       ; jumptable 00018576 default case, cases -7--5

loc_18601:              ; jumptable 00018576 cases -28,-17,-8,-4
push    [bp+arg_0]
call    sub_1847B
mov     si, ax
jmp     def_18576       ; jumptable 00018576 default case, cases -7--5

loc_1860C:              ; jumptable 00018576 cases -14,-13
mov     si, 0FFFFh
cmp     word ptr ds:4726h, 0
jnz     short loc_18619
jmp     def_18576       ; jumptable 00018576 default case, cases -7--5

loc_18619:
mov     ax, si
push    ax
call    sub_17720
mov     ax, [bp+arg_0]
add     ax, 0Eh
shl     ax, 1
dec     ax
push    ax
call    sub_1BFAB
mov     [bp+var_2], ax
cmp     ax, ds:4068h
jnz     short loc_18638
jmp     def_18576       ; jumptable 00018576 default case, cases -7--5

loc_18638:
push    word ptr ds:4068h
call    sub_1BF54
mov     ax, [bp+var_2]
mov     ds:4068h, ax
call    sub_1BF6A
mov     si, ds:23C1h
mov     word ptr ds:23C1h, 1
call    sub_1C033
mov     ds:23C1h, si
mov     ax, ds:0BFACh
or      ax, ds:0BFAEh
jz      short loc_18667
mov     si, 600h
jmp     short loc_18675

loc_18667:
mov     ax, ds:4720h
mov     dx, 11h
mul     dx
mov     bx, ax
mov     si, [bx+4902h]

loc_18675:              ; jumptable 00018576 default case, cases -7--5
jmp     def_18576

loc_18678:              ; jumptable 00018576 case -10
cmp     di, 30ACh
jnz     short loc_18684
mov     ax, 500h
jmp     loc_18741

loc_18684:
cmp     di, 3184h
jz      short loc_18691
mov     ax, 0FFDCh
push    ax
call    sub_1854D

loc_18691:
mov     ax, 50h ; 'P'
push    ax
call    sub_1578B
jmp     def_18576       ; jumptable 00018576 default case, cases -7--5

loc_1869B:              ; jumptable 00018576 case -11
cmp     di, 30ACh
jnz     short loc_186A8
mov     ax, 1
push    ax
call    sub_16F3E

loc_186A8:
cmp     di, 3184h
jz      short loc_186B5
mov     ax, 0FFDCh
push    ax
call    sub_1854D

loc_186B5:
mov     ax, 4Ch ; 'L'
push    ax
call    sub_1578B
jmp     def_18576       ; jumptable 00018576 default case, cases -7--5

loc_186BF:              ; jumptable 00018576 case -22
mov     ax, 0FFFFh
push    ax
call    sub_17720
call    sub_1300A
mov     si, ax
jmp     def_18576       ; jumptable 00018576 default case, cases -7--5

loc_186CE:              ; jumptable 00018576 case -9
cmp     word ptr ds:4724h, 500h
jnz     short def_18576 ; jumptable 00018576 default case, cases -7--5

loc_186D6:              ; jumptable 00018576 case -27
mov     ax, 0FFFFh
push    ax
call    sub_17720
mov     ax, ds:4720h
mov     dx, 11h
mul     dx
mov     bx, ax
mov     si, [bx+4902h]
jmp     short def_18576 ; jumptable 00018576 default case, cases -7--5

loc_186ED:              ; jumptable 00018576 case -3
mov     si, 800h
jmp     short def_18576 ; jumptable 00018576 default case, cases -7--5

loc_186F2:              ; jumptable 00018576 case -35
mov     si, 600h
jmp     short def_18576 ; jumptable 00018576 default case, cases -7--5

loc_186F7:              ; jumptable 00018576 case -12
mov     si, 102h
jmp     short def_18576 ; jumptable 00018576 default case, cases -7--5

loc_186FC:              ; jumptable 00018576 case -15
mov     si, 0A01h
jmp     short def_18576 ; jumptable 00018576 default case, cases -7--5

loc_18701:              ; jumptable 00018576 case -16
mov     si, 0A04h
jmp     short def_18576 ; jumptable 00018576 default case, cases -7--5

loc_18706:              ; jumptable 00018576 case -24
mov     si, 0C01h
jmp     short def_18576 ; jumptable 00018576 default case, cases -7--5

loc_1870B:              ; jumptable 00018576 case -23
mov     si, 0C05h
jmp     short def_18576 ; jumptable 00018576 default case, cases -7--5

loc_18710:              ; jumptable 00018576 case -19
mov     si, 904h
jmp     short def_18576 ; jumptable 00018576 default case, cases -7--5

loc_18715:              ; jumptable 00018576 case -20
mov     si, 905h
jmp     short def_18576 ; jumptable 00018576 default case, cases -7--5

loc_1871A:              ; jumptable 00018576 case -21
mov     si, 902h
jmp     short def_18576 ; jumptable 00018576 default case, cases -7--5

loc_1871F:              ; jumptable 00018576 case -18
mov     si, 901h
jmp     short def_18576 ; jumptable 00018576 default case, cases -7--5

loc_18724:              ; jumptable 00018576 case -25
mov     si, 903h
jmp     short def_18576 ; jumptable 00018576 default case, cases -7--5

loc_18729:              ; jumptable 00018576 case -26
cmp     word ptr ds:0C0EFh, 2
jz      short loc_18735
mov     si, 0FFFFh
jmp     short def_18576 ; jumptable 00018576 default case, cases -7--5

loc_18735:
mov     ax, 0FFFFh
push    ax
call    sub_17720
mov     si, 0B01h

def_18576:              ; jumptable 00018576 default case, cases -7--5
mov     ax, si

loc_18741:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_1854D endp



; Attributes: bp-based frame

sub_18749 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     ax, [bp+arg_0]
sub     ax, 0C01h       ; switch 7 cases
cmp     ax, 6
ja      short def_1875B ; jumptable 0001875B default case
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_1875B[bx] ; switch jump
jpt_1875B dw offset loc_1876E ; jump table for switch statement
dw offset loc_1877B
dw offset loc_18797
dw offset loc_18792
dw offset loc_187A1
dw offset loc_1879C
dw offset loc_187A6

loc_1876E:              ; jumptable 0001875B case 3073
mov     al, 5
mov     ds:3497h, al
mov     ds:3496h, al
call    sub_1A8D3
jmp     short loc_187B1

loc_1877B:              ; jumptable 0001875B case 3074
mov     ax, 1
push    ax
call    sub_1B056
or      ax, ax
jz      short def_1875B ; jumptable 0001875B default case
cmp     word ptr ds:4722h, 0
jnz     short def_1875B ; jumptable 0001875B default case
call    sub_1A932
jmp     short loc_187B1

loc_18792:              ; jumptable 0001875B case 3076
call    sub_1AB6A
jmp     short def_1875B ; jumptable 0001875B default case

loc_18797:              ; jumptable 0001875B case 3075
call    sub_1A9AD
jmp     short loc_187B1

loc_1879C:              ; jumptable 0001875B case 3078
call    sub_12C60
jmp     short def_1875B ; jumptable 0001875B default case

loc_187A1:              ; jumptable 0001875B case 3077
call    sub_12CFE
jmp     short loc_187A9

loc_187A6:              ; jumptable 0001875B case 3079
call    sub_12C8C

loc_187A9:
mov     ax, 600h
jmp     short loc_187B1

def_1875B:              ; jumptable 0001875B default case
mov     ax, 0FFFFh

loc_187B1:
pop     bp
retn    2
sub_18749 endp



; Attributes: bp-based frame

sub_187B5 proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 4
push    si
mov     si, 0FFFFh
mov     ax, [bp+arg_0]
sub     ax, 0B01h       ; switch 4 cases
cmp     ax, 3
jbe     short loc_187CD
jmp     def_187D1       ; jumptable 000187D1 default case

loc_187CD:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_187D1[bx] ; switch jump
jpt_187D1 dw offset loc_187DE ; jump table for switch statement
dw offset loc_18802
dw offset loc_18815
dw offset loc_18809

loc_187DE:              ; jumptable 000187D1 case 2817
lea     ax, [bp+var_4]
push    ax
call    sub_129CB
mov     si, ax
mov     ax, si
cmp     ax, 4
jnz     short loc_187FB
push    [bp+var_2]
push    [bp+var_4]
call    sub_126B4
mov     si, ax
jmp     short def_187D1 ; jumptable 000187D1 default case

loc_187FB:
cmp     si, 0FFFFh
jl      short def_187D1 ; jumptable 000187D1 default case
jmp     short loc_18810

loc_18802:              ; jumptable 000187D1 case 2818
call    sub_1300A
mov     si, ax
jmp     short def_187D1 ; jumptable 000187D1 default case

loc_18809:              ; jumptable 000187D1 case 2820
mov     ax, 1
push    ax
call    sub_1A4C4

loc_18810:
mov     si, 0FFE5h
jmp     short def_187D1 ; jumptable 000187D1 default case

loc_18815:              ; jumptable 000187D1 case 2819
call    sub_40223
push    ds
mov     ax, 9A13h
push    ax
call    sub_3F39D
mov     [bp+var_2], dx
mov     [bp+var_4], ax
call    sub_402B3
cmp     [bp+var_4], 0
jnz     short loc_18841
mov     ax, 10A6h
push    ax
xor     ax, ax
push    ax
call    sub_19065
jmp     short def_187D1 ; jumptable 000187D1 default case

loc_18841:
push    [bp+var_2]
push    [bp+var_4]
call    sub_126B4
mov     si, 600h

def_187D1:              ; jumptable 000187D1 default case
mov     ax, si
pop     si
mov     sp, bp
pop     bp
retn    2
sub_187B5 endp




sub_18856 proc near
xor     ax, ax
push    ax
call    sub_1AE6D
mov     al, 0
push    ax
call    sub_14C12
retn
sub_18856 endp



; Attributes: bp-based frame

sub_18863 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
mov     di, [bp+arg_0]
mov     si, di
and     si, 0FF00h
cmp     si, 100h
jnz     short loc_1887E
push    di
call    sub_1804A
jmp     loc_188ED

loc_1887E:
cmp     si, 900h
jnz     short loc_1888B
push    di
call    sub_13946
jmp     loc_188ED

loc_1888B:
cmp     si, 0D00h
jnz     short loc_18897
push    di
call    sub_1D117
jmp     short loc_188ED

loc_18897:
cmp     si, 0A00h
jnz     short loc_188A3
push    di
call    sub_1D38B
jmp     short loc_188ED

loc_188A3:
cmp     si, 200h
jnz     short loc_188AE
call    sub_1D1C6
jmp     short loc_188ED

loc_188AE:
cmp     si, 300h
jnz     short loc_188BA
push    di
call    sub_18239
jmp     short loc_188ED

loc_188BA:
cmp     si, 400h
jnz     short loc_188C6
push    di
call    sub_1847B
jmp     short loc_188ED

loc_188C6:
cmp     si, 0B00h
jnz     short loc_188D2
push    di
call    sub_187B5
jmp     short loc_188ED

loc_188D2:
cmp     si, 0C00h
jnz     short loc_188DE
push    di
call    sub_18749
jmp     short loc_188ED

loc_188DE:
cmp     si, 0FF00h
jnz     short loc_188EA
push    di
call    sub_1854D
jmp     short loc_188ED

loc_188EA:
mov     ax, 500h

loc_188ED:
pop     di
pop     si
pop     bp
retn    2
sub_18863 endp



; Attributes: bp-based frame

sub_188F3 proc near

var_102= word ptr -102h
var_100= byte ptr -100h
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah
arg_8= word ptr  0Ch

push    bp
mov     bp, sp
sub     sp, 102h
push    si
push    di
mov     di, [bp+arg_6]
push    ds
push    [bp+arg_8]
call    sub_46E60
mov     si, ax
inc     si
cmp     si, di
jl      short loc_18922
mov     bx, [bp+arg_2]
mov     ax, [bx]
mov     dx, si
sub     dx, di
cmp     ax, dx
jle     short loc_18922
mov     ax, si
sub     ax, di
mov     [bx], ax

loc_18922:
dec     si
cmp     [bp+arg_0], 0
jz      short loc_1893B
cmp     si, 100h
jnz     short loc_18934
mov     ax, si
dec     ax
jmp     short loc_18936

loc_18934:
mov     ax, si

loc_18936:
mov     bx, [bp+arg_4]
mov     [bx], ax

loc_1893B:
mov     bx, [bp+arg_4]
mov     ax, [bx]
mov     bx, [bp+arg_2]
cmp     ax, [bx]
jge     short loc_18951
mov     bx, [bp+arg_4]
mov     ax, [bx]
mov     bx, [bp+arg_2]
mov     [bx], ax

loc_18951:
mov     bx, [bp+arg_4]
mov     ax, [bx]
mov     bx, [bp+arg_2]
mov     dx, [bx]
add     dx, di
dec     dx
cmp     ax, dx
jl      short loc_1896F
mov     bx, [bp+arg_4]
mov     ax, [bx]
sub     ax, di
inc     ax
mov     bx, [bp+arg_2]
mov     [bx], ax

loc_1896F:
xor     ax, ax
push    ax
call    sub_1DC39
push    ax
call    sub_1DCCB
mov     ax, 1
push    ax
push    ax
mov     bx, [bp+arg_2]
cmp     word ptr [bx], 0
jz      short loc_1898B
mov     ax, 2254h
jmp     short loc_1898E

loc_1898B:
mov     ax, 2256h

loc_1898E:
push    ax
call    sub_1ED32
mov     bx, ds:9164h
mov     al, [bx+3]
mov     ah, 0
mov     [bp+var_102], ax
cmp     [bp+arg_0], 0
jz      short loc_189AC
mov     al, [bx+2]
mov     ah, 0
jmp     short loc_189B0

loc_189AC:
mov     ax, [bp+var_102]

loc_189B0:
push    ax
xor     ax, ax
push    ax
call    sub_1D98E
lea     ax, [bp+var_100]
push    ax
push    [bp+arg_8]
call    sub_19458
mov     bx, [bp+arg_2]
mov     ax, [bx]
add     di, ax
mov     ax, di
cmp     ax, 100h
jge     short loc_189D5
mov     [bp+di+var_100], 0

loc_189D5:
mov     bx, [bp+arg_2]
mov     ax, [bx]
lea     dx, [bp+var_100]
add     ax, dx
push    ax
call    sub_1EB1F
push    [bp+var_102]
xor     ax, ax
push    ax
call    sub_1D98E
cmp     si, di
jge     short loc_18A13
lea     ax, [bp+var_100]
push    ax
mov     ax, 0DCEh
push    ax
call    sub_19458
mov     bx, di
sub     bx, si
lea     ax, [bp+var_100]
add     bx, ax
mov     byte ptr [bx], 0
lea     ax, [bp+var_100]
push    ax
call    sub_1EB1F

loc_18A13:
cmp     si, di
jle     short loc_18A1C
mov     ax, 2258h
jmp     short loc_18A1F

loc_18A1C:
mov     ax, 2256h

loc_18A1F:
push    ax
call    sub_1EB1F
mov     bx, [bp+arg_4]
mov     ax, [bx]
inc     ax
inc     ax
mov     bx, [bp+arg_2]
sub     ax, [bx]
push    ax
mov     ax, 1
push    ax
call    sub_1DC08
mov     ax, 1
push    ax
call    sub_1DC39
push    ax
call    sub_1DCCB
pop     di
pop     si
mov     sp, bp
pop     bp
retn    0Ah
sub_188F3 endp



; Attributes: bp-based frame

sub_18A4A proc near

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
arg_C= word ptr  10h

push    bp
mov     bp, sp
sub     sp, 12h
push    si
push    di
mov     di, [bp+arg_6]
mov     [bp+var_8], 0
mov     ax, sp
mov     [bp+var_E], ax
push    [bp+arg_C]
call    sub_19448
mov     [bp+var_10], ax
inc     ax
mov     dx, sp
sub     dx, ax
mov     sp, dx
mov     ax, sp
mov     [bp+var_2], ax
push    ax
push    [bp+arg_C]
call    sub_19458
mov     bx, ds:40DAh
mov     [bp+var_C], bx
shl     bx, 1
shl     bx, 1
shl     bx, 1
mov     ax, [bx+40E0h]
mov     [bp+var_A], ax
mov     bx, ds:40DAh
shl     bx, 1
shl     bx, 1
shl     bx, 1
mov     word ptr [bx+40E0h], 4
push    [bp+arg_C]
push    [bp+arg_A]
push    di
push    [bp+arg_4]
mov     bx, [bp+arg_2]
push    word ptr [bx]
call    sub_188F3
jmp     loc_18CB9

loc_18AB4:
mov     ax, [bp+var_C]
mov     ds:40DAh, ax
call    sub_15852
mov     [bp+var_6], ax
push    ax
call    sub_11EA2
mov     [bp+var_12], ax
cmp     ax, 0FFFFh
jge     short loc_18ACF
jmp     loc_18CC2

loc_18ACF:
cmp     ax, 3
jnz     short loc_18B24
mov     ax, [di]
cmp     ax, [bp+var_10]
jge     short loc_18AE9
mov     ax, [di]
mov     dx, [bp+arg_8]
dec     dx
cmp     ax, dx
jge     short loc_18AE9
inc     word ptr [di]
jmp     short loc_18B24

loc_18AE9:
cmp     word ptr ds:8B9Dh, 0
jz      short loc_18B24

loc_18AF0:
push    word ptr [di]
call    sub_14B16
cbw
mov     [bp+var_6], ax
cmp     ax, 20h ; ' '
jnz     short loc_18B12
cmp     word ptr [di], 0
jz      short loc_18B12
mov     bx, [di]
add     bx, [bp+arg_C]
cmp     byte ptr [bx-1], 20h ; ' '
jnz     short loc_18B12
inc     word ptr [di]
jmp     short loc_18AF0

loc_18B12:
cmp     [bp+var_6], 0
jz      short loc_18B24
mov     [bp+var_12], 0FFFFh
mov     bx, [bp+arg_2]
mov     word ptr [bx], 0

loc_18B24:
mov     ax, [bp+var_6]
and     ax, 0FFh
mov     [bp+var_4], ax
cmp     [bp+arg_0], 0
jz      short loc_18B81
cmp     ax, 20h ; ' '
jb      short loc_18B81
mov     bx, [bp+arg_2]
cmp     word ptr [bx], 0
jz      short loc_18B52
xor     ax, ax
mov     [bp+var_10], ax
mov     [di], ax
mov     bx, [bp+arg_4]
mov     [bx], ax
mov     bx, [bp+arg_C]
mov     byte ptr [bx], 0

loc_18B52:
mov     ax, [bp+arg_8]
dec     ax
cmp     ax, [bp+var_10]
jg      short loc_18B5E
jmp     loc_18CB9

loc_18B5E:
mov     si, [di]
add     si, [bp+arg_C]
push    ds
push    si
push    ds
mov     ax, si
inc     ax
push    ax
mov     ax, [di]
inc     word ptr [di]
inc     [bp+var_10]
mov     dx, [bp+var_10]
sub     dx, ax
push    dx
call    sub_46A2C
mov     al, byte ptr [bp+var_4]
mov     [si], al

loc_18B81:
mov     ax, [bp+var_12]
cmp     ax, 1Fh         ; switch 32 cases
jbe     short loc_18B8C
jmp     def_18B90       ; jumptable 00018B90 default case, cases 3,6,12-25,27-29

loc_18B8C:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_18B90[bx] ; switch jump
jpt_18B90 dw offset loc_18C73 ; jump table for switch statement
dw offset loc_18C73
dw offset loc_18BF2
dw offset def_18B90
dw offset loc_18C73
dw offset loc_18C4C
dw offset def_18B90
dw offset loc_18BFF
dw offset loc_18C25
dw offset loc_18BD5
dw offset loc_18BDC
dw offset loc_18C56
dw offset def_18B90
dw offset def_18B90
dw offset def_18B90
dw offset def_18B90
dw offset def_18B90
dw offset def_18B90
dw offset def_18B90
dw offset def_18B90
dw offset def_18B90
dw offset def_18B90
dw offset def_18B90
dw offset def_18B90
dw offset def_18B90
dw offset def_18B90
dw offset loc_18C39
dw offset def_18B90
dw offset def_18B90
dw offset def_18B90
dw offset loc_18C73
dw offset loc_18C73

loc_18BD5:              ; jumptable 00018B90 case 9
mov     word ptr [di], 0
jmp     def_18B90       ; jumptable 00018B90 default case, cases 3,6,12-25,27-29

loc_18BDC:              ; jumptable 00018B90 case 10
mov     ax, [bp+arg_8]
dec     ax
mov     [di], ax
cmp     ax, [bp+var_10]
jg      short loc_18BEA
jmp     def_18B90       ; jumptable 00018B90 default case, cases 3,6,12-25,27-29

loc_18BEA:
mov     ax, [bp+var_10]
mov     [di], ax
jmp     def_18B90       ; jumptable 00018B90 default case, cases 3,6,12-25,27-29

loc_18BF2:              ; jumptable 00018B90 case 2
cmp     word ptr [di], 0
jnz     short loc_18BFA
jmp     def_18B90       ; jumptable 00018B90 default case, cases 3,6,12-25,27-29

loc_18BFA:
dec     word ptr [di]
jmp     def_18B90       ; jumptable 00018B90 default case, cases 3,6,12-25,27-29

loc_18BFF:              ; jumptable 00018B90 case 7
cmp     [bp+arg_0], 0
jnz     short loc_18C08
jmp     def_18B90       ; jumptable 00018B90 default case, cases 3,6,12-25,27-29

loc_18C08:
mov     ax, [di]
cmp     ax, [bp+var_10]
jl      short loc_18C12
jmp     def_18B90       ; jumptable 00018B90 default case, cases 3,6,12-25,27-29

loc_18C12:
mov     si, [di]
add     si, [bp+arg_C]

loc_18C17:
push    si
mov     ax, si
inc     ax
push    ax
call    sub_19458
dec     [bp+var_10]
jmp     def_18B90       ; jumptable 00018B90 default case, cases 3,6,12-25,27-29

loc_18C25:              ; jumptable 00018B90 case 8
cmp     [bp+arg_0], 0
jz      short def_18B90 ; jumptable 00018B90 default case, cases 3,6,12-25,27-29
cmp     word ptr [di], 0
jz      short def_18B90 ; jumptable 00018B90 default case, cases 3,6,12-25,27-29
dec     word ptr [di]
mov     si, [di]
add     si, [bp+arg_C]
jmp     short loc_18C17

loc_18C39:              ; jumptable 00018B90 case 26
cmp     [bp+arg_0], 0
jz      short def_18B90 ; jumptable 00018B90 default case, cases 3,6,12-25,27-29
mov     bx, [bp+arg_C]
mov     byte ptr [bx], 0
mov     [bp+var_10], 0
jmp     short loc_18C68

loc_18C4C:              ; jumptable 00018B90 case 5
mov     [bp+var_12], 0FFFFh
mov     [bp+var_8], 1

loc_18C56:              ; jumptable 00018B90 case 11
push    [bp+arg_C]
push    [bp+var_2]
call    sub_19458
push    [bp+arg_C]
call    sub_19448
mov     [bp+var_10], ax

loc_18C68:
xor     ax, ax
mov     [di], ax
mov     bx, [bp+arg_4]
mov     [bx], ax
jmp     short def_18B90 ; jumptable 00018B90 default case, cases 3,6,12-25,27-29

loc_18C73:              ; jumptable 00018B90 cases 0,1,4,30,31
push    ds
push    [bp+arg_C]
call    sub_46E60
mov     si, ax
add     si, [bp+arg_C]
dec     si
jmp     short loc_18C85

loc_18C84:
dec     si

loc_18C85:
cmp     si, [bp+arg_C]
jbe     short loc_18C8F
cmp     byte ptr [si], 20h ; ' '
jz      short loc_18C84

loc_18C8F:
inc     si
mov     byte ptr [si], 0
mov     [bp+var_8], 1

def_18B90:              ; jumptable 00018B90 default case, cases 3,6,12-25,27-29
cmp     [bp+var_12], 0FFFFh
jl      short loc_18CB9
cmp     [bp+var_8], 0
jnz     short loc_18CB9
push    [bp+arg_C]
push    [bp+arg_A]
push    di
push    [bp+arg_4]
xor     ax, ax
mov     bx, [bp+arg_2]
mov     [bx], ax
push    ax
call    sub_188F3

loc_18CB9:
cmp     [bp+var_8], 0
jnz     short loc_18CC2
jmp     loc_18AB4

loc_18CC2:
mov     ax, [bp+var_A]
mov     bx, [bp+var_C]
mov     ds:40DAh, bx
shl     bx, 1
shl     bx, 1
shl     bx, 1
mov     [bx+40E0h], ax
mov     ax, 0FFFFh
push    ax
call    sub_156D7
mov     si, [bp+arg_C]
jmp     short loc_18CE3

loc_18CE2:
inc     si

loc_18CE3:
cmp     byte ptr [si], 20h ; ' '
jz      short loc_18CE2
cmp     si, [bp+arg_C]
jz      short loc_18CF4
push    [bp+arg_C]
push    si
call    sub_19458

loc_18CF4:
push    ds
push    [bp+arg_C]
call    sub_46E60
mov     si, ax
add     si, [bp+arg_C]
dec     si
jmp     short loc_18D09

loc_18D05:
mov     byte ptr [si], 0
dec     si

loc_18D09:
cmp     si, [bp+arg_C]
jb      short loc_18D13
cmp     byte ptr [si], 20h ; ' '
jz      short loc_18D05

loc_18D13:
mov     word ptr ds:8B9Dh, 0
mov     sp, [bp+var_E]
mov     ax, [bp+var_12]
pop     di
pop     si
mov     sp, bp
pop     bp
retn    0Eh
sub_18A4A endp



; Attributes: bp-based frame

sub_18D27 proc near

var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
push    [bp+arg_0]
call    sub_19448
mov     [bp+var_2], ax
mov     di, [bp+arg_0]
xor     si, si
jmp     short loc_18D46

loc_18D3F:
cmp     byte ptr [di], 0FFh
jnz     short loc_18D45
inc     si

loc_18D45:
inc     di

loc_18D46:
cmp     byte ptr [di], 0
jnz     short loc_18D3F
mov     ax, si
shl     ax, 1
mov     si, ax
mov     ax, [bp+var_2]
sub     ax, si
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_18D27 endp



; Attributes: bp-based frame

sub_18D5E proc near

var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah
arg_8= word ptr  0Ch
arg_A= word ptr  0Eh

push    bp
mov     bp, sp
sub     sp, 6
push    si
push    di
mov     ax, [bp+arg_A]
mov     dx, 11h
mul     dx
mov     si, ax
add     si, 48FCh
cmp     [bp+arg_0], 0
jz      short loc_18D80
mov     ax, [bp+arg_0]
mov     [si+2], ax

loc_18D80:
push    word ptr [si+2]
call    sub_19448
mov     di, ax
mov     ax, di
mov     bx, [bp+arg_4]
cmp     ax, [bx]
jle     short loc_18D93
mov     [bx], di

loc_18D93:
mov     ax, [bp+arg_6]
add     ax, [bp+arg_2]
inc     ax
mov     [bp+var_4], ax
mov     bx, [bp+arg_4]
mov     ax, [bx]
add     ax, [bp+arg_8]
add     ax, 3
mov     [bp+var_6], ax
cmp     ax, 50h ; 'P'
jl      short loc_18DC5
mov     di, ax
add     di, 0FFB1h
sub     [bp+var_6], di
sub     [bp+arg_8], di
jge     short loc_18DC5
mov     [bp+arg_8], 0
inc     [bp+var_4]

loc_18DC5:
mov     al, ds:926Eh
mov     ah, 0
dec     ax
cmp     ax, [bp+var_4]
jg      short loc_18DE3
mov     al, ds:926Eh
mov     ah, 0
add     ax, 0FFFEh
mov     di, [bp+var_4]
sub     di, ax
sub     [bp+arg_6], di
sub     [bp+var_4], di

loc_18DE3:
mov     al, byte ptr [bp+arg_8]
mov     [si+8], al
mov     al, byte ptr [bp+arg_6]
mov     [si+9], al
mov     al, byte ptr [bp+var_6]
mov     [si+0Ah], al
mov     al, byte ptr [bp+var_4]
mov     [si+0Bh], al
call    sub_1D8C0
mov     [bp+var_2], ax
push    [bp+arg_A]
call    sub_1ACE5
mov     ax, 2
push    ax
mov     ax, 1
push    ax
call    sub_1DC08
mov     ax, 1
push    ax
call    sub_1DCE5
mov     ax, [si]
mov     ds:9164h, ax
mov     ax, [bp+var_2]
pop     di
pop     si
mov     sp, bp
pop     bp
retn    0Ch
sub_18D5E endp



; Attributes: bp-based frame

sub_18E29 proc near

var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
sub     sp, 6
push    si
xor     ax, ax
mov     [bp+var_4], ax
mov     [bp+var_6], ax
mov     [bp+var_2], 1

loc_18E3D:
push    [bp+arg_4]
push    [bp+arg_2]
push    [bp+arg_0]
lea     ax, [bp+var_6]
push    ax
lea     ax, [bp+var_4]
push    ax
lea     ax, [bp+var_2]
push    ax
mov     ax, 1
push    ax
call    sub_18A4A
mov     si, ax
or      si, si
jl      short loc_18E64
cmp     si, 4
jnz     short loc_18E3D

loc_18E64:
mov     ax, si
pop     si
mov     sp, bp
pop     bp
retn    6
sub_18E29 endp



; Attributes: bp-based frame

sub_18E6D proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah
arg_8= word ptr  0Ch
arg_A= word ptr  0Eh

push    bp
mov     bp, sp
push    si
push    di
mov     ax, 0Ah
push    ax
push    [bp+arg_6]
push    [bp+arg_4]
lea     ax, [bp+arg_0]
push    ax
mov     ax, 1
push    ax
push    [bp+arg_A]
call    sub_18D5E
mov     di, ax
push    [bp+arg_8]
push    [bp+arg_0]
push    [bp+arg_2]
call    sub_18E29
mov     si, ax
mov     ax, 0Ah
push    ax
call    sub_1AD85
push    di
call    sub_1E8C0
mov     ax, si
pop     di
pop     si
pop     bp
retn    0Ch
sub_18E6D endp



; Attributes: bp-based frame

sub_18EAD proc near

var_E0= word ptr -0E0h
var_DE= word ptr -0DEh
var_DC= word ptr -0DCh
var_D9= word ptr -0D9h
var_D7= word ptr -0D7h
var_58= byte ptr -58h
var_8= word ptr -8
var_6= word ptr -6
var_4= dword ptr -4
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah
arg_8= byte ptr  0Ch

push    bp
mov     bp, sp
sub     sp, 0E0h
push    si
push    di
mov     [bp+var_8], 0
mov     byte ptr [bp+var_D9+1], 0
mov     bx, ss
mov     es, bx
lea     bx, [bp+arg_8]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
jmp     short loc_18EFD

loc_18ECF:
cmp     di, 0FFFFh
jnz     short loc_18EF4
lea     ax, [bp+var_D9+1]
push    ax
call    sub_19448
lea     dx, [bp+var_D9+1]
add     ax, dx
mov     [bp+var_6], ax
les     bx, [bp+var_4]
mov     ax, es:[bx]
mov     [bp+var_8], ax
add     word ptr [bp+var_4], 2
jmp     short loc_18EFD

loc_18EF4:
lea     ax, [bp+var_D9+1]
push    ax
push    di
call    sub_19483

loc_18EFD:
les     bx, [bp+var_4]
mov     di, es:[bx]
add     word ptr [bp+var_4], 2
or      di, di
jnz     short loc_18ECF
cmp     [bp+var_8], 0
jz      short loc_18F6A
mov     bx, [bp+var_8]
cmp     byte ptr [bx], 0
jz      short loc_18F6A
lea     ax, [bp+var_D9+1]
push    ax
call    sub_18D27
mov     si, 4Ch ; 'L'
sub     si, ax
push    [bp+var_8]
lea     ax, [bp+var_58]
push    ax
push    si
call    sub_12515
lea     ax, [bp+var_58]
push    ax
call    sub_19448
mov     si, ax
push    ds
push    [bp+var_6]
push    ds
mov     ax, [bp+var_6]
add     ax, si
push    ax
lea     ax, [bp+var_D9+1]
mov     dx, [bp+var_6]
sub     dx, ax
mov     ax, 80h
sub     ax, dx
sub     ax, si
push    ax
call    sub_46A2C
push    ss
lea     ax, [bp+var_58]
push    ax
push    ds
push    [bp+var_6]
push    si
call    sub_46A2C

loc_18F6A:
cmp     byte ptr ds:1D40h, 0
jz      short loc_18FA6
lea     ax, [bp+var_D9+1]
push    ax
call    sub_18D27
mov     [bp+var_DE], ax
push    [bp+arg_0]
push    [bp+arg_2]
push    [bp+arg_4]
lea     ax, [bp+var_DE]
push    ax
mov     ax, 1
push    ax
xor     ax, ax
push    ax
call    sub_18D5E
mov     [bp+var_E0], ax
push    [bp+arg_0]
lea     ax, [bp+var_D9+1]
push    ax
call    sub_1554A
jmp     short loc_18FB5

loc_18FA6:
lea     ax, [bp+var_D9+1]
push    ax
call    sub_19BEC
mov     ax, 0D66h
push    ax
call    sub_19BEC

loc_18FB5:
cmp     [bp+arg_6], 0
jnz     short loc_18FC0
mov     al, 0
jmp     loc_1905F

loc_18FC0:
mov     ax, ds:40DAh
mov     [bp+var_DC], ax

loc_18FC7:
cmp     word ptr ds:1DD1h, 2
jnz     short loc_18FD6
mov     word ptr ds:40DAh, 10h
jmp     short loc_18FF1

loc_18FD6:
push    [bp+arg_6]
mov     al, 1Bh
push    ax
call    sub_194AB
or      ax, ax
jz      short loc_18FEB
mov     word ptr ds:40DAh, 6
jmp     short loc_18FF1

loc_18FEB:
mov     word ptr ds:40DAh, 7

loc_18FF1:
call    sub_15852
and     ax, 0FFh
push    ax
call    sub_46F25
mov     byte ptr [bp+var_D9], al
cmp     byte ptr [bp+var_D9], 0
jz      short loc_18FC7
push    [bp+arg_6]
push    [bp+var_D9]
call    sub_194AB
or      ax, ax
jz      short loc_18FC7
mov     ax, [bp+var_DC]
mov     ds:40DAh, ax
mov     ax, 0FFFFh
push    ax
call    sub_156D7
cmp     byte ptr ds:1D40h, 0
jz      short loc_1903A
push    [bp+arg_0]
call    sub_1AD85
push    [bp+var_E0]
call    sub_1E8C0
jmp     short loc_1905B

loc_1903A:
cmp     byte ptr [bp+var_D9], 20h ; ' '
jge     short loc_19045
mov     al, 20h ; ' '
jmp     short loc_19049

loc_19045:
mov     al, byte ptr [bp+var_D9]

loc_19049:
mov     byte ptr [bp+var_D9+1], al
mov     [bp+var_D7], 0Ah
lea     ax, [bp+var_D9+1]
push    ax
call    sub_19BEC

loc_1905B:
mov     al, byte ptr [bp+var_D9]

loc_1905F:
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_18EAD endp



; Attributes: bp-based frame

sub_19065 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    si
push    di
mov     di, [bp+arg_0]
mov     si, 0FFFFh
or      di, di
jnz     short loc_19079
mov     di, 0C63h
mov     si, di

loc_19079:
xor     ax, ax
push    ax
mov     ax, 0C52h
push    ax
push    di
push    si
push    [bp+arg_2]
mov     ax, 0C7Fh
push    ax
mov     ax, 0Ah
push    ax
mov     ax, 14h
push    ax
mov     ax, 5
push    ax
call    sub_18EAD
add     sp, 12h
pop     di
pop     si
pop     bp
retn    4
sub_19065 endp



; Attributes: bp-based frame

sub_190A1 proc near

var_10= word ptr -10h
var_E= word ptr -0Eh
var_C= byte ptr -0Ch
var_6= byte ptr -6
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
sub     sp, 10h
push    [bp+arg_4]
lea     ax, [bp+var_E]
push    ax
call    sub_11E72
mov     [bp+var_10], ax
cmp     ax, [bp+arg_2]
jb      short loc_190CE
cmp     ax, [bp+arg_0]
ja      short loc_190CE
cmp     [bp+var_E], 0
jz      short loc_190CE
mov     al, byte ptr [bp+var_10]
mov     bx, [bp+arg_6]
mov     [bx], al
jmp     short loc_19129

loc_190CE:
push    [bp+arg_2]
push    ss
lea     ax, [bp+var_C]
push    ax
call    sub_472C8
push    [bp+arg_0]
push    ss
lea     ax, [bp+var_6]
push    ax
call    sub_472C8
xor     ax, ax
push    ax
mov     ax, 0C52h
push    ax
lea     ax, [bp+var_6]
push    ax
mov     ax, 225Ah
push    ax
lea     ax, [bp+var_C]
push    ax
mov     ax, 1556h
push    ax
mov     ax, 0C7Fh
push    ax
mov     al, ds:3497h
mov     ah, 0
push    ax
mov     al, ds:3496h
mov     ah, 0
inc     ax
push    ax
mov     ax, 5
push    ax
call    sub_18EAD
add     sp, 14h
mov     bx, [bp+arg_6]
mov     al, [bx]
mov     ah, 0
mov     [bp+var_10], ax
mov     [bp+var_E], 0

loc_19129:
push    [bp+var_10]
push    ds
push    [bp+arg_4]
call    sub_472C8
mov     ax, [bp+var_E]
mov     sp, bp
pop     bp
retn    8
sub_190A1 endp



; Attributes: bp-based frame

sub_1913E proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
xor     ax, ax
push    ax
mov     ax, 0C6Fh
push    ax
push    [bp+arg_0]
mov     ax, 0FFFFh
push    ax
mov     ax, 156Fh
push    ax
mov     ax, 0C81h
push    ax
mov     al, ds:3497h
mov     ah, 0
push    ax
mov     al, ds:3496h
mov     ah, 0
inc     ax
push    ax
mov     ax, 4
push    ax
call    sub_18EAD
mov     sp, bp
cmp     al, 59h ; 'Y'
jnz     short loc_19176
mov     ax, 1
jmp     short loc_19178

loc_19176:
xor     ax, ax

loc_19178:
pop     bp
retn    2
sub_1913E endp



; Attributes: bp-based frame

sub_1917C proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
push    [bp+arg_4]
push    [bp+arg_2]
mov     al, ds:3496h
mov     ah, 0
inc     ax
push    ax
mov     al, ds:3497h
mov     ah, 0
push    ax
push    [bp+arg_0]
mov     ax, [bp+arg_0]
mov     bx, 2
cwd
idiv    bx
push    ax
call    sub_18E6D
pop     bp
retn    6
sub_1917C endp




sub_191A6 proc near
cmp     word ptr ds:916Ah, 1
jle     short locret_191B1
dec     word ptr ds:916Ah

locret_191B1:
retn
sub_191A6 endp




sub_191B2 proc near
mov     ax, ds:916Ah
cmp     ax, ds:916Eh
jge     short locret_191BF
inc     word ptr ds:916Ah

locret_191BF:
retn
sub_191B2 endp




sub_191C0 proc near
cmp     word ptr ds:916Ah, 1
jle     short locret_191E5
mov     ax, ds:9168h
sub     ds:916Ch, ax
jg      short loc_191D6
mov     word ptr ds:916Ch, 1

loc_191D6:
mov     ax, ds:9168h
sub     ds:916Ah, ax
jg      short locret_191E5
mov     word ptr ds:916Ah, 1

locret_191E5:
retn
sub_191C0 endp




sub_191E6 proc near
mov     ax, ds:916Ah
cmp     ax, ds:916Eh
jge     short locret_1923E
mov     cx, ds:916Ch
add     cx, ds:9168h
cmp     cx, ds:916Eh
ja      short loc_19201
mov     ds:916Ch, cx

loc_19201:
mov     ax, ds:916Ch
add     ax, ds:9168h
dec     ax
cmp     ax, ds:916Eh
jle     short loc_19228
mov     ax, ds:916Eh
cmp     ax, ds:9168h
jge     short loc_1921D
mov     ax, 1
jmp     short loc_19225

loc_1921D:
mov     ax, ds:916Eh
sub     ax, ds:9168h
inc     ax

loc_19225:
mov     ds:916Ch, ax

loc_19228:
mov     cx, ds:916Ah
add     cx, ds:9168h
cmp     cx, ds:916Eh
jbe     short loc_1923A
mov     cx, ds:916Eh

loc_1923A:
mov     ds:916Ah, cx

locret_1923E:
retn
sub_191E6 endp




sub_1923F proc near
cmp     word ptr ds:916Ah, 1
jle     short locret_1924C
mov     word ptr ds:916Ah, 1

locret_1924C:
retn
sub_1923F endp




sub_1924D proc near
mov     ax, ds:916Ah
cmp     ax, ds:916Eh
jge     short locret_1925C
mov     ax, ds:916Eh
mov     ds:916Ah, ax

locret_1925C:
retn
sub_1924D endp




sub_1925D proc near
cmp     word ptr ds:9166h, 0
jz      short locret_19268
dec     word ptr ds:9166h

locret_19268:
retn
sub_1925D endp




sub_19269 proc near
inc     word ptr ds:9166h
retn
sub_19269 endp




sub_1926E proc near
mov     word ptr ds:9166h, 0
retn
sub_1926E endp




sub_19275 proc near
mov     word ptr ds:9166h, 100h
retn
sub_19275 endp



; Attributes: bp-based frame

sub_1927C proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
push    si
mov     si, 0FFFFh
call    sub_157A7
or      ax, ax
jnz     short loc_1928D
jmp     loc_19329

loc_1928D:
call    sub_15852
push    ax
call    sub_11EA2
mov     si, ax
cmp     [bp+arg_6], 0
jnz     short loc_1929F
jmp     loc_19329

loc_1929F:
mov     ax, [bp+arg_6]
mov     ds:916Eh, ax
mov     ax, [bp+arg_4]
mov     ds:9168h, ax
mov     bx, [bp+arg_2]
mov     ax, [bx]
mov     ds:916Ah, ax
mov     bx, [bp+arg_0]
mov     ax, [bx]
mov     ds:916Ch, ax
mov     ax, si
cmp     ax, 0Eh         ; switch 15 cases
ja      short def_192C6 ; jumptable 000192C6 default case, cases 4-8
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_192C6[bx] ; switch jump
jpt_192C6 dw offset loc_192E9 ; jump table for switch statement
dw offset loc_192EE
dw offset loc_19311
dw offset loc_19316
dw offset def_192C6
dw offset def_192C6
dw offset def_192C6
dw offset def_192C6
dw offset def_192C6
dw offset loc_19307
dw offset loc_1930C
dw offset loc_192F3
dw offset loc_192F8
dw offset loc_192FD
dw offset loc_19302

loc_192E9:              ; jumptable 000192C6 case 0
call    sub_191A6
jmp     short def_192C6 ; jumptable 000192C6 default case, cases 4-8

loc_192EE:              ; jumptable 000192C6 case 1
call    sub_191B2
jmp     short def_192C6 ; jumptable 000192C6 default case, cases 4-8

loc_192F3:              ; jumptable 000192C6 case 11
call    sub_191C0
jmp     short def_192C6 ; jumptable 000192C6 default case, cases 4-8

loc_192F8:              ; jumptable 000192C6 case 12
call    sub_191E6
jmp     short def_192C6 ; jumptable 000192C6 default case, cases 4-8

loc_192FD:              ; jumptable 000192C6 case 13
call    sub_1923F
jmp     short def_192C6 ; jumptable 000192C6 default case, cases 4-8

loc_19302:              ; jumptable 000192C6 case 14
call    sub_1924D
jmp     short def_192C6 ; jumptable 000192C6 default case, cases 4-8

loc_19307:              ; jumptable 000192C6 case 9
call    sub_1926E
jmp     short def_192C6 ; jumptable 000192C6 default case, cases 4-8

loc_1930C:              ; jumptable 000192C6 case 10
call    sub_19275
jmp     short def_192C6 ; jumptable 000192C6 default case, cases 4-8

loc_19311:              ; jumptable 000192C6 case 2
call    sub_1925D
jmp     short def_192C6 ; jumptable 000192C6 default case, cases 4-8

loc_19316:              ; jumptable 000192C6 case 3
call    sub_19269

def_192C6:              ; jumptable 000192C6 default case, cases 4-8
mov     ax, ds:916Ah
mov     bx, [bp+arg_2]
mov     [bx], ax
mov     ax, ds:916Ch
mov     bx, [bp+arg_0]
mov     [bx], ax

loc_19329:
mov     ax, si
pop     si
pop     bp
retn    8
sub_1927C endp



; Attributes: bp-based frame

sub_19330 proc near

var_2= byte ptr -2
var_1= byte ptr -1
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
mov     di, [bp+arg_0]
mov     si, [bp+arg_2]
jmp     short loc_19375

loc_19340:
mov     al, [si]
mov     ah, 0
push    ax
call    sub_46F01
mov     [bp+var_2], al
mov     al, [di]
mov     ah, 0
push    ax
call    sub_46F01
mov     [bp+var_1], al
mov     al, [bp+var_2]
cmp     al, [bp+var_1]
jbe     short loc_19367
mov     ax, 1
jmp     short loc_19383

loc_19367:
mov     al, [bp+var_2]
cmp     al, [bp+var_1]
jnb     short loc_19373
xor     ax, ax
jmp     short loc_19383

loc_19373:
inc     si
inc     di

loc_19375:
cmp     byte ptr [si], 0
jz      short loc_1937F
cmp     byte ptr [di], 0
jnz     short loc_19340

loc_1937F:
mov     al, [si]
mov     ah, 0

loc_19383:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    4
sub_19330 endp



; Attributes: bp-based frame

sub_1938B proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
mov     si, 1

loc_19396:
mov     ax, si
mov     dx, 3
mul     dx
inc     ax
mov     si, ax
cmp     si, [bp+arg_2]
jle     short loc_19396
jmp     short loc_19406

loc_193A7:
mov     [bp+var_4], si
jmp     short loc_193FE

loc_193AC:
mov     bx, [bp+var_4]
shl     bx, 1
add     bx, [bp+arg_0]
mov     ax, [bx]
mov     [bp+var_2], ax
mov     di, [bp+var_4]
sub     di, si
jmp     short loc_193E9

loc_193C0:
mov     bx, di
shl     bx, 1
add     bx, [bp+arg_0]
push    word ptr [bx]
push    [bp+var_2]
call    sub_19330
or      ax, ax
jz      short loc_193ED
mov     bx, di
shl     bx, 1
add     bx, [bp+arg_0]
mov     ax, [bx]
mov     bx, di
add     bx, si
shl     bx, 1
add     bx, [bp+arg_0]
mov     [bx], ax
sub     di, si

loc_193E9:
or      di, di
jge     short loc_193C0

loc_193ED:
mov     ax, [bp+var_2]
mov     bx, di
add     bx, si
shl     bx, 1
add     bx, [bp+arg_0]
mov     [bx], ax
inc     [bp+var_4]

loc_193FE:
mov     ax, [bp+var_4]
cmp     ax, [bp+arg_2]
jl      short loc_193AC

loc_19406:
mov     ax, si
mov     bx, 3
cwd
idiv    bx
mov     si, ax
or      si, si
jg      short loc_193A7
pop     di
pop     si
mov     sp, bp
pop     bp
retn    4
sub_1938B endp



; Attributes: bp-based frame

sub_1941C proc far

arg_0= word ptr  6

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
jmp     short loc_19426

loc_19425:
inc     si

loc_19426:
mov     al, [si]
cbw
push    ax
call    sub_46F25
mov     [si], al
or      al, al
jnz     short loc_19425
pop     si
pop     bp
retf    2
sub_1941C endp



; Attributes: bp-based frame

sub_1943A proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    [bp+arg_0]
push    cs
call    near ptr sub_1941C
pop     bp
retn    2
sub_1943A endp



; Attributes: bp-based frame

sub_19448 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    ds
push    [bp+arg_0]
call    sub_46E60
pop     bp
retn    2
sub_19448 endp



; Attributes: bp-based frame

sub_19458 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    ds
push    [bp+arg_2]
push    ds
push    [bp+arg_0]
call    sub_46D76
pop     bp
retn    4
sub_19458 endp



; Attributes: bp-based frame

sub_1946C proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
push    ds
push    [bp+arg_4]
push    ds
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_46DA1
pop     bp
retn    6
sub_1946C endp



; Attributes: bp-based frame

sub_19483 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    ds
push    [bp+arg_2]
push    ds
push    [bp+arg_0]
call    sub_46C3E
pop     bp
retn    4
sub_19483 endp



; Attributes: bp-based frame

sub_19497 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    ds
push    [bp+arg_2]
push    ds
push    [bp+arg_0]
call    sub_46D55
pop     bp
retn    4
sub_19497 endp



; Attributes: bp-based frame

sub_194AB proc near

arg_0= byte ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    ds
push    [bp+arg_2]
mov     al, [bp+arg_0]
cbw
push    ax
call    sub_46CCE
pop     bp
retn    4
sub_194AB endp



; Attributes: bp-based frame

sub_194C0 proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
push    si
push    di
mov     di, [bp+arg_2]
mov     si, [bp+arg_4]
or      si, si
jz      short loc_194FA
jmp     short loc_194ED

loc_194D1:
cmp     byte ptr [di], 2Fh ; '/'
jz      short loc_194DB
cmp     byte ptr [di], 5Ch ; '\'
jnz     short loc_194E0

loc_194DB:
mov     al, ds:226Eh
jmp     short loc_194E2

loc_194E0:
mov     al, [di]

loc_194E2:
mov     [si], al
inc     si
mov     bx, di
inc     di
cmp     byte ptr [bx], 0
jz      short loc_194F7

loc_194ED:
mov     ax, [bp+arg_0]
dec     [bp+arg_0]
or      ax, ax
jnz     short loc_194D1

loc_194F7:
mov     byte ptr [si], 0

loc_194FA:
pop     di
pop     si
pop     bp
retn    6
sub_194C0 endp



; Attributes: bp-based frame

sub_19500 proc near

var_58= word ptr -58h
var_56= byte ptr -56h
var_55= byte ptr -55h
var_54= byte ptr -54h
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah
arg_8= dword ptr  0Ch

push    bp
mov     bp, sp
sub     sp, 58h
push    si
push    di
lea     ax, [bp+var_54]
mov     [bp+var_4], ax
xor     di, di
cmp     [bp+arg_6], di
jz      short loc_1951B
mov     bx, [bp+arg_6]
mov     byte ptr [bx], 0

loc_1951B:
cmp     [bp+arg_4], 0
jz      short loc_19527
mov     bx, [bp+arg_4]
mov     byte ptr [bx], 0

loc_19527:
cmp     [bp+arg_2], 0
jz      short loc_19533
mov     bx, [bp+arg_2]
mov     byte ptr [bx], 0

loc_19533:
cmp     [bp+arg_0], 0
jz      short loc_1953F
mov     bx, [bp+arg_0]
mov     byte ptr [bx], 0

loc_1953F:
mov     ax, word ptr [bp+arg_8]
or      ax, word ptr [bp+arg_8+2]
jnz     short loc_1954D
jmp     loc_196FC

loc_1954A:
inc     word ptr [bp+arg_8]

loc_1954D:
les     bx, [bp+arg_8]
cmp     byte ptr es:[bx], 20h ; ' '
jz      short loc_1954A
mov     [bp+var_56], 0
mov     [bp+var_2], 0
jmp     short loc_195CB

loc_19561:
les     bx, [bp+arg_8]
add     bx, [bp+var_2]
mov     al, es:[bx]
mov     cl, al
or      al, al
jz      short loc_195D1
cmp     cl, 20h ; ' '
jb      short loc_19581
mov     ax, 225Eh
push    ax
push    cx
call    sub_194AB
or      ax, ax
jz      short loc_195C8

loc_19581:
cmp     word ptr ds:225Ch, 0
jz      short loc_1958B
jmp     loc_196FC

loc_1958B:
xor     ax, ax
push    ax
mov     ax, 0C52h
push    ax
mov     ax, 2269h
push    ax
push    ss
lea     ax, [bp+var_56]
push    ax
push    word ptr [bp+arg_8+2]
push    word ptr [bp+arg_8]
call    sub_46D76
push    ax
mov     ax, 2269h
push    ax
mov     ax, 1665h
push    ax
mov     ax, 0C7Fh
push    ax
mov     ax, 0Ah
push    ax
mov     ax, 14h
push    ax
mov     ax, 5
push    ax
call    sub_18EAD
add     sp, 14h
jmp     loc_196FC

loc_195C8:
inc     [bp+var_2]

loc_195CB:
cmp     [bp+var_2], 50h ; 'P'
jl      short loc_19561

loc_195D1:
push    ss
lea     ax, [bp+var_55]
push    ax
push    word ptr [bp+arg_8+2]
push    word ptr [bp+arg_8]
call    sub_46D76
lea     ax, [bp+var_55]
push    ax
call    sub_19448
mov     si, ax
lea     ax, [bp+var_56]
add     si, ax
mov     [bp+var_58], si

loc_195F2:
mov     al, [si]
cbw
mov     cx, 7           ; switch 7 cases
mov     bx, 960Ah

loc_195FB:
cmp     ax, cs:[bx]
jz      short loc_19606
inc     bx
inc     bx
loop    loc_195FB
jmp     short def_19606 ; jumptable 00019606 default case

loc_19606:              ; switch jump
jmp     word ptr cs:[bx+0Eh]
dw      0,   2Ah,   2Eh,   2Fh ; value table for switch statement
dw    3Ah,   3Fh,   5Ch
jpt_19606 dw offset loc_1963F ; jump table for switch statement
dw offset loc_19644
dw offset loc_19626
dw offset loc_1963B
dw offset loc_1963B
dw offset loc_19644
dw offset loc_1963B

loc_19626:              ; jumptable 00019606 case 46
or      di, 2
push    [bp+arg_0]
push    si
mov     ax, 4
push    ax
call    sub_194C0
mov     byte ptr [si], 0
dec     si
jmp     short loc_1964B

loc_1963B:              ; jumptable 00019606 cases 47,58,92
and     di, 0FFFEh

loc_1963F:              ; jumptable 00019606 case 0
mov     si, [bp+var_58]
jmp     short loc_1964B

loc_19644:              ; jumptable 00019606 cases 42,63
or      di, 1

def_19606:              ; jumptable 00019606 default case
dec     si
jmp     short loc_195F2

loc_1964B:
mov     al, [si]
cbw
mov     cx, 6           ; switch 6 cases
mov     bx, 9663h

loc_19654:
cmp     ax, cs:[bx]
jz      short loc_1965F
inc     bx
inc     bx
loop    loc_19654
jmp     short def_1965F ; jumptable 0001965F default case

loc_1965F:              ; switch jump
jmp     word ptr cs:[bx+0Ch]
dw      0,   2Ah,   2Fh,   3Ah ; value table for switch statement
dw    3Fh,   5Ch
jpt_1965F dw offset loc_19680 ; jump table for switch statement
dw offset loc_196A0
dw offset loc_19680
dw offset loc_1967B
dw offset loc_196A0
dw offset loc_19680

loc_1967B:              ; jumptable 0001965F case 58
cmp     si, [bp+var_4]
jnz     short def_1965F ; jumptable 0001965F default case

loc_19680:              ; jumptable 0001965F cases 0,47,92
inc     si
cmp     byte ptr [si], 0
jz      short loc_1968A
or      di, 4

loc_1968A:
push    [bp+arg_2]
push    si
mov     ax, 8
push    ax
call    sub_194C0
mov     byte ptr [si], 0
dec     si
cmp     byte ptr [si], 0
jnz     short loc_196A7
jmp     short loc_196FC

loc_196A0:              ; jumptable 0001965F cases 42,63
or      di, 1

def_1965F:              ; jumptable 0001965F default case
dec     si
jmp     short loc_1964B

loc_196A7:
cmp     si, [bp+var_4]
jb      short loc_196E2
mov     si, [bp+var_4]
cmp     byte ptr [si], 3Ah ; ':'
jnz     short loc_196E2
inc     si
mov     bx, si
cmp     byte ptr [bx], 0
jz      short loc_196C0
or      di, 8

loc_196C0:
push    [bp+arg_4]
push    si
mov     ax, 41h ; 'A'
push    ax
call    sub_194C0
mov     byte ptr [si], 0
or      di, 10h
push    [bp+arg_6]
lea     ax, [bp+var_55]
push    ax
mov     ax, 2
push    ax
call    sub_194C0
jmp     short loc_196FC

loc_196E2:
push    [bp+arg_4]
lea     ax, [bp+var_55]
push    ax
mov     ax, 41h ; 'A'
push    ax
call    sub_194C0
mov     bx, [bp+arg_4]
cmp     byte ptr [bx], 0
jz      short loc_196FC
or      di, 8

loc_196FC:
mov     ax, di
pop     di
pop     si
mov     sp, bp
pop     bp
retn    0Ch
sub_19500 endp



; Attributes: bp-based frame

sub_19706 proc near

arg_0= word ptr  4
arg_2= dword ptr  6

push    bp
mov     bp, sp
jmp     short loc_1970E

loc_1970B:
inc     word ptr [bp+arg_2]

loc_1970E:
mov     bx, [bp+arg_0]
inc     [bp+arg_0]
mov     al, [bx]
les     bx, [bp+arg_2]
mov     es:[bx], al
or      al, al
jnz     short loc_1970B
mov     dx, word ptr [bp+arg_2+2]
mov     ax, bx
pop     bp
retn    6
sub_19706 endp



; Attributes: bp-based frame

sub_19729 proc near

arg_0= byte ptr  4

push    bp
mov     bp, sp
cmp     [bp+arg_0], 5Ch ; '\'
jz      short loc_19738
cmp     [bp+arg_0], 2Fh ; '/'
jnz     short loc_1973D

loc_19738:
mov     ax, 1
jmp     short loc_1973F

loc_1973D:
xor     ax, ax

loc_1973F:
pop     bp
retn    2
sub_19729 endp



; Attributes: bp-based frame

sub_19743 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
or      si, si
jz      short loc_1976F
cmp     byte ptr [si], 0
jz      short loc_1976F
cmp     word ptr [si+1], 3Ah ; ':'
jz      short loc_1976F
push    si
call    sub_19448
add     si, ax
push    word ptr [si-1]
call    sub_19729
or      al, al
jnz     short loc_1976F
mov     al, ds:226Eh
cbw
mov     [si], ax

loc_1976F:
mov     ax, [bp+arg_0]
pop     si
pop     bp
retn    2
sub_19743 endp



; Attributes: bp-based frame

sub_19777 proc near

var_4= dword ptr -4
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah
arg_8= dword ptr  0Ch

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
mov     di, [bp+arg_4]
mov     si, [bp+arg_6]
les     bx, [bp+arg_8]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
or      si, si
jz      short loc_197B8
cmp     byte ptr [si], 0
jz      short loc_197B8
push    word ptr [bp+var_4+2]
push    bx
push    si
call    sub_19706
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
les     bx, [bp+var_4]
dec     bx
cmp     byte ptr es:[bx], 3Ah ; ':'
jz      short loc_197B8
mov     bx, ax
mov     byte ptr es:[bx], 3Ah ; ':'
inc     word ptr [bp+var_4]

loc_197B8:
or      di, di
jz      short loc_197EC
cmp     byte ptr [di], 0
jz      short loc_197EC
push    word ptr [bp+var_4+2]
push    word ptr [bp+var_4]
push    di
call    sub_19706
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
les     bx, [bp+var_4]
dec     bx
mov     al, es:[bx]
push    ax
call    sub_19729
or      al, al
jnz     short loc_197EC
mov     al, ds:226Eh
les     bx, [bp+var_4]
mov     es:[bx], al
inc     word ptr [bp+var_4]

loc_197EC:
cmp     [bp+arg_2], 0
jz      short loc_19804
push    word ptr [bp+var_4+2]
push    word ptr [bp+var_4]
push    [bp+arg_2]
call    sub_19706
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax

loc_19804:
cmp     [bp+arg_0], 0
jz      short loc_1981C
push    word ptr [bp+var_4+2]
push    word ptr [bp+var_4]
push    [bp+arg_0]
call    sub_19706
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax

loc_1981C:
les     bx, [bp+var_4]
mov     byte ptr es:[bx], 0
pop     di
pop     si
mov     sp, bp
pop     bp
retn    0Ch
sub_19777 endp



; Attributes: bp-based frame

sub_1982B proc near

var_84= byte ptr -84h
var_82= byte ptr -82h
var_1= byte ptr -1
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 84h
push    si
push    di
lea     si, [bp+var_84]
mov     [bp+var_84], 0
mov     bx, [bp+arg_2]
cmp     byte ptr [bx], 0
jnz     short loc_1984D
call    sub_10490
mov     bx, [bp+arg_2]
mov     [bx], al

loc_1984D:
mov     bx, [bp+arg_0]
mov     al, [bx]
cmp     al, 5Ch ; '\'
jz      short loc_19875
cmp     al, 2Fh ; '/'
jz      short loc_19875
mov     bx, [bp+arg_2]
push    word ptr [bx]
push    ss
lea     ax, [bp+var_84]
push    ax
call    sub_10534
lea     ax, [bp+var_84]
push    ax
lea     ax, [bp+var_82]
push    ax
call    sub_19458

loc_19875:
lea     ax, [bp+var_84]
push    ax
push    [bp+arg_0]
call    sub_19483
jmp     loc_198F2

loc_19883:
inc     si
mov     di, si
jmp     short loc_19889

loc_19888:
inc     di

loc_19889:
mov     al, [di]
or      al, al
jz      short loc_19897
cmp     al, 5Ch ; '\'
jz      short loc_19897
cmp     al, 2Fh ; '/'
jnz     short loc_19888

loc_19897:
mov     al, [di]
mov     [bp+var_1], al
mov     byte ptr [di], 0
cmp     byte ptr [si], 2Eh ; '.'
jnz     short loc_198EB
mov     ax, [si+1]
or      al, al
jnz     short loc_198BA
mov     al, [bp+var_1]
mov     [di], al
dec     si
mov     ax, si
push    ax
push    di
call    sub_19458
jmp     short loc_198F2

loc_198BA:
cmp     ax, 2Eh ; '.'
jnz     short loc_198F2
mov     al, [bp+var_1]
mov     [di], al
dec     si
jmp     short loc_198D1

loc_198C7:
mov     al, [si]
cmp     al, 5Ch ; '\'
jz      short loc_198DC
cmp     al, 2Fh ; '/'
jz      short loc_198DC

loc_198D1:
dec     si
mov     ax, si
lea     dx, [bp+var_84]
cmp     ax, dx
jnb     short loc_198C7

loc_198DC:
lea     ax, [bp+var_84]
cmp     ax, si
ja      short loc_198F2
push    si
push    di
call    sub_19458
jmp     short loc_198F2

loc_198EB:
mov     al, [bp+var_1]
mov     [di], al
mov     si, di

loc_198F2:
cmp     byte ptr [si], 0
jz      short loc_198FA
jmp     loc_19883

loc_198FA:
push    ds
push    [bp+arg_0]
push    ss
lea     ax, [bp+var_84]
push    ax
call    sub_46D76
pop     di
pop     si
mov     sp, bp
pop     bp
retn    4
sub_1982B endp



; Attributes: bp-based frame

sub_19911 proc near

var_AC= byte ptr -0ACh
var_AB= byte ptr -0ABh
var_AA= byte ptr -0AAh
var_A8= byte ptr -0A8h
var_A7= byte ptr -0A7h
var_A6= byte ptr -0A6h
var_A4= word ptr -0A4h
var_62= word ptr -62h
var_20= byte ptr -20h
var_16= byte ptr -16h
var_C= byte ptr -0Ch
var_6= byte ptr -6
var_1= byte ptr -1
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
sub     sp, 0ACh
push    si
push    [bp+arg_6]
push    [bp+arg_4]
lea     ax, [bp+var_AC]
push    ax
lea     ax, [bp+var_A4]
push    ax
lea     ax, [bp+var_20]
push    ax
lea     ax, [bp+var_C]
push    ax
call    sub_19500
push    [bp+arg_2]
push    [bp+arg_0]
lea     ax, [bp+var_A8]
push    ax
lea     ax, [bp+var_62]
push    ax
lea     ax, [bp+var_16]
push    ax
lea     ax, [bp+var_6]
push    ax
call    sub_19500
lea     ax, [bp+var_20]
push    ax
lea     ax, [bp+var_16]
push    ax
call    sub_19497
or      ax, ax
jz      short loc_19960
jmp     loc_19A59

loc_19960:
lea     ax, [bp+var_C]
push    ax
lea     ax, [bp+var_6]
push    ax
call    sub_19497
or      ax, ax
jz      short loc_19972
jmp     loc_19A59

loc_19972:
call    sub_10490
mov     [bp+var_1], al
cmp     [bp+var_AC], 0
jnz     short loc_19986
cmp     [bp+var_A8], 0
jz      short loc_199C5

loc_19986:
cmp     [bp+var_AC], 0
jnz     short loc_199A0
mov     al, [bp+var_1]
mov     [bp+var_AC], al
mov     [bp+var_AB], 3Ah ; ':'
mov     [bp+var_AA], 0
jmp     short loc_199B8

loc_199A0:
cmp     [bp+var_A8], 0
jnz     short loc_199B8
mov     al, [bp+var_1]
mov     [bp+var_A8], al
mov     [bp+var_A7], 3Ah ; ':'
mov     [bp+var_A6], 0

loc_199B8:
mov     al, [bp+var_AC]
cmp     al, [bp+var_A8]
jz      short loc_199C5
jmp     loc_19A59

loc_199C5:
cmp     byte ptr [bp+var_A4], 0
jnz     short loc_199D5
cmp     byte ptr [bp+var_62], 0
jnz     short loc_199D5
jmp     loc_19A5D

loc_199D5:
lea     ax, [bp+var_A4]
push    ax
lea     ax, [bp+var_62]
push    ax
call    sub_19497
or      ax, ax
jnz     short loc_199E8
jmp     loc_19A5D

loc_199E8:
push    [bp+var_A4]
call    sub_19729
push    ax
push    [bp+var_62]
call    sub_19729
mov     dl, al
pop     ax
xor     al, dl
cbw
mov     si, ax
cmp     byte ptr [bp+var_A4], 0
jz      short loc_19A18
or      si, si
jnz     short loc_19A18
lea     ax, [bp+var_A4]
push    ax
mov     al, 2Eh ; '.'
push    ax
call    sub_194AB
or      ax, ax
jz      short loc_19A25

loc_19A18:
lea     ax, [bp+var_AC]
push    ax
lea     ax, [bp+var_A4]
push    ax
call    sub_1982B

loc_19A25:
cmp     byte ptr [bp+var_62], 0
jz      short loc_19A3D
or      si, si
jnz     short loc_19A3D
lea     ax, [bp+var_62]
push    ax
mov     al, 2Eh ; '.'
push    ax
call    sub_194AB
or      ax, ax
jz      short loc_19A49

loc_19A3D:
lea     ax, [bp+var_A8]
push    ax
lea     ax, [bp+var_62]
push    ax
call    sub_1982B

loc_19A49:
lea     ax, [bp+var_A4]
push    ax
lea     ax, [bp+var_62]
push    ax
call    sub_19497
or      ax, ax
jz      short loc_19A5D

loc_19A59:
xor     ax, ax
jmp     short loc_19A60

loc_19A5D:
mov     ax, 1

loc_19A60:
pop     si
mov     sp, bp
pop     bp
retn    8
sub_19911 endp



; Attributes: bp-based frame

sub_19A67 proc near

var_94= byte ptr -94h
var_44= byte ptr -44h
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
sub     sp, 94h
push    si
push    di
mov     di, [bp+arg_4]
xor     si, si
push    ds
inc     word ptr ds:1DE8h
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jz      short loc_19A94
xor     si, si
jmp     loc_19BCD

loc_19A94:
lea     ax, [bp+var_94]
push    ax
push    [bp+arg_6]
call    sub_19458
push    ax
call    sub_1943A
push    ss
lea     ax, [bp+var_94]
push    ax
call    sub_10652
or      ax, ax
jz      short loc_19ABC
lea     ax, [bp+var_94]
push    ax
call    sub_19743
or      si, 20h

loc_19ABC:
lea     ax, [bp+var_94]
push    ax
call    sub_19C1B
mov     si, ax
test    si, 18h
jnz     short loc_19B16
or      di, di
jz      short loc_19B16
cmp     byte ptr [di], 0
jz      short loc_19B16
lea     ax, [bp+var_44]
push    ax
push    di
call    sub_19458
lea     ax, [bp+var_44]
push    ax
call    sub_19743
lea     ax, [bp+var_44]
push    ax
call    sub_1943A
push    ss
lea     ax, [bp+var_44]
push    ax
call    sub_10652
or      ax, ax
jnz     short loc_19AFA
jmp     loc_19BCD

loc_19AFA:
push    ss
lea     ax, [bp+var_44]
push    ax
mov     ax, 91CDh
push    ax
mov     ax, 9179h
push    ax
xor     ax, ax
push    ax
push    ax
call    sub_19500
and     ax, 18h
or      ax, 20h
or      si, ax

loc_19B16:
test    si, 18h
jz      short loc_19B44
test    si, 20h
jnz     short loc_19B44
lea     ax, [bp+var_44]
push    ax
mov     ax, 91CDh
push    ax
call    sub_19458
push    ax
mov     ax, 9179h
push    ax
call    sub_19483
push    ss
lea     ax, [bp+var_44]
push    ax
call    sub_10652
or      ax, ax
jnz     short loc_19B44
jmp     loc_19BCD

loc_19B44:
or      si, 20h
test    si, 4
jnz     short loc_19B8F
cmp     [bp+arg_2], 0
jz      short loc_19B60
mov     ax, 9170h
push    ax
push    [bp+arg_2]
call    sub_19458
jmp     short loc_19B66

loc_19B60:
mov     word ptr ds:9170h, 2Ah ; '*'

loc_19B66:
cmp     byte ptr ds:9170h, 0
jz      short loc_19B78
or      si, 4
mov     ax, 9170h
push    ax
call    sub_1943A

loc_19B78:
push    ds
mov     ax, 9170h
push    ax
push    ds
mov     ax, 226Bh
push    ax
call    sub_46EB6
or      dx, ax
jz      short loc_19B8F
or      si, 1

loc_19B8F:
test    si, 2
jnz     short loc_19BC7
mov     ax, 91C8h
push    ax
push    [bp+arg_0]
call    sub_19458
cmp     byte ptr ds:91C8h, 0
jz      short loc_19BB1
or      si, 2
mov     ax, 91C8h
push    ax
call    sub_1943A

loc_19BB1:
push    ds
push    [bp+arg_0]
push    ds
mov     ax, 226Bh
push    ax
call    sub_46EB6
or      dx, ax
jz      short loc_19BC7
or      si, 1

loc_19BC7:
push    [bp+arg_6]
call    sub_19C39

loc_19BCD:
dec     word ptr ds:1DE8h
mov     ax, si
pop     di
pop     si
mov     sp, bp
pop     bp
retn    8
sub_19A67 endp



; Attributes: bp-based frame

sub_19BDB proc near

arg_0= byte ptr  4

push    bp
mov     bp, sp
mov     al, [bp+arg_0]
mov     ah, 0Eh
mov     bl, 7
call    sub_10BFC
pop     bp
retn    2
sub_19BDB endp



; Attributes: bp-based frame

sub_19BEC proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
jmp     short loc_19C11

loc_19BF5:
cmp     byte ptr [si], 0FFh
jnz     short loc_19BFE
inc     si
inc     si
jmp     short loc_19C11

loc_19BFE:
cmp     byte ptr [si], 0Ah
jnz     short loc_19C09
mov     al, 0Dh
push    ax
call    sub_19BDB

loc_19C09:
mov     bx, si
inc     si
push    word ptr [bx]
call    sub_19BDB

loc_19C11:
cmp     byte ptr [si], 0
jnz     short loc_19BF5
pop     si
pop     bp
retn    2
sub_19BEC endp



; Attributes: bp-based frame

sub_19C1B proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    ds
push    [bp+arg_0]
mov     ax, 91CDh
push    ax
mov     ax, 9179h
push    ax
mov     ax, 9170h
push    ax
mov     ax, 91C8h
push    ax
call    sub_19500
pop     bp
retn    2
sub_19C1B endp



; Attributes: bp-based frame

sub_19C39 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    ds
push    [bp+arg_0]
mov     ax, 91CDh
push    ax
mov     ax, 9179h
push    ax
mov     ax, 9170h
push    ax
mov     ax, 91C8h
push    ax
call    sub_19777
pop     bp
retn    2
sub_19C39 endp



; Attributes: bp-based frame

sub_19C57 proc far

arg_0= word ptr  6
arg_2= word ptr  8

push    bp
mov     bp, sp
push    [bp+arg_0]
call    sub_19C1B
mov     ax, 91CDh
push    ax
mov     ax, 9179h
push    ax
call    sub_1982B
push    [bp+arg_2]
call    sub_19C39
pop     bp
retf    4
sub_19C57 endp




sub_19C75 proc near
mov     ax, 3700h
int     21h             ; DOS - 2+ internal - GET SWITCHAR/AVAILDEV
                        ; Return: AL = FFh unsupported subfunction
                        ; DL = current switch character
mov     al, dl
mov     ds:91D0h, al
cmp     al, 2Fh ; '/'
jz      short locret_19C88
mov     byte ptr ds:226Eh, 2Fh ; '/'

locret_19C88:
retn
sub_19C75 endp



; Attributes: bp-based frame

sub_19C89 proc near

var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 2
push    si
mov     si, [bp+arg_0]
mov     al, [si+6Ah]
mov     ah, 0
mov     [bp+var_2], ax
test    word ptr [si], 1
jnz     short loc_19CA9
mov     al, byte ptr [bp+var_2]
mov     ah, 5
call    sub_10BFC

loc_19CA9:
mov     bx, [bp+var_2]
shl     bx, 1
add     bx, si
mov     dx, [bx+58h]
mov     bh, byte ptr [bp+var_2]
mov     ah, 2
call    sub_10BFC
mov     cx, [si+9Ch]
mov     ah, 1
call    sub_10BFC
mov     ds:229Eh, si
pop     si
mov     sp, bp
pop     bp
retn    2
sub_19C89 endp



; Attributes: bp-based frame

sub_19CCF proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
mov     ax, [si+18h]
les     bx, ds:2274h
mov     es:[bx+10h], ax
push    ds
mov     ax, si
add     ax, 51h ; 'Q'
push    ax
mov     dx, ds:2276h
mov     ax, bx
add     ax, 49h ; 'I'
push    dx
push    ax
mov     ax, 1Eh
push    ax
call    sub_46A2C
push    ds
mov     ax, si
add     ax, 8Ch
push    ax
mov     dx, ds:2276h
mov     ax, ds:2274h
add     ax, 84h
push    dx
push    ax
mov     ax, 0Ch
push    ax
call    sub_46A2C
push    si
call    sub_19C89
pop     si
pop     bp
retn    2
sub_19CCF endp



; Attributes: bp-based frame

sub_19D21 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
push    [bp+arg_2]
push    si
call    sub_10AB4
mov     al, [si+9Ah]
cmp     al, 3
jbe     short loc_19D3E
cmp     al, 7
jz      short loc_19D3E
jmp     loc_19DBF

loc_19D3E:
mov     cl, [si+9Bh]
mov     dx, [si]
les     bx, ds:2274h
mov     al, es:[bx+84h]
inc     al
cmp     al, cl
jz      short loc_19D86
test    dx, 14h
jz      short loc_19D86
cmp     cl, 19h
jnz     short loc_19D7D
mov     ax, [si+9Eh]
mov     bx, 19h
xor     dx, dx
div     bx
cmp     al, 8
jz      short loc_19D7D
cmp     al, 0Eh
jnz     short loc_19D75
mov     al, 11h
jmp     short loc_19D7F

loc_19D75:
cmp     al, 10h
jnz     short loc_19D7F
mov     al, 14h
jmp     short loc_19D7F

loc_19D7D:
mov     al, 12h

loc_19D7F:
mov     ah, 11h
mov     bl, 0
call    sub_10BFC

loc_19D86:
mov     ax, [si]
and     ax, 24h
cmp     ax, 4
jnz     short loc_19DBF
les     bx, ds:2274h
cmp     byte ptr es:[bx+84h], 18h
jnz     short loc_19DA6
les     bx, ds:2280h
and     byte ptr es:[bx], 0FEh
jmp     short loc_19DBF

loc_19DA6:
les     bx, ds:2280h
or      byte ptr es:[bx], 1
mov     dx, [si+6Bh]
mov     al, 14h
out     dx, al
inc     dx
mov     al, 7
out     dx, al
mov     ah, 12h
mov     bl, 20h ; ' '
call    sub_10BFC

loc_19DBF:
pop     si
pop     bp
retn    4
sub_19D21 endp



; Attributes: bp-based frame

sub_19DC4 proc near

var_A4= byte ptr -0A4h
var_52= word ptr -52h
var_A= byte ptr -0Ah
var_9= byte ptr -9
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 0A4h
push    si
mov     si, [bp+arg_0]
lea     ax, [bp+var_A4]
push    ax
call    sub_1E87B
push    si
call    sub_19CCF
mov     al, [bp+var_A]
mov     ah, 0
and     ax, 7Fh
mov     dl, [si+9Ah]
mov     dh, 0
and     dx, 7Fh
cmp     ax, dx
jnz     short loc_19E02
mov     al, [si+9Bh]
cmp     al, [bp+var_9]
jnz     short loc_19E02
mov     ax, [si+52h]
cmp     ax, [bp+var_52]
jz      short loc_19E10

loc_19E02:
or      byte ptr [si+9Ah], 80h
lea     ax, [bp+var_A4]
push    ax
push    si
call    sub_19D21

loc_19E10:
push    si
call    sub_19C89
push    si
call    sub_1E87B
pop     si
mov     sp, bp
pop     bp
retn    2
sub_19DC4 endp




sub_19E1F proc near
push    si
push    di
xor     si, si
mov     di, si
mov     ax, di
mov     ds:9319h, ax
cmp     ds:472Ah, ax
jz      short loc_19E33
jmp     def_19E46       ; jumptable 00019E46 default case, cases 3,5-7,9-15

loc_19E33:
mov     ax, ds:91D3h
and     ax, 1Fh
dec     ax              ; switch 16 cases
cmp     ax, 0Fh
jbe     short loc_19E42
jmp     def_19E46       ; jumptable 00019E46 default case, cases 3,5-7,9-15

loc_19E42:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_19E46[bx] ; switch jump
jpt_19E46 dw offset loc_19E6B ; jump table for switch statement
dw offset loc_19E73
dw offset def_19E46
dw offset loc_19E88
dw offset def_19E46
dw offset def_19E46
dw offset def_19E46
dw offset loc_19EBF
dw offset def_19E46
dw offset def_19E46
dw offset def_19E46
dw offset def_19E46
dw offset def_19E46
dw offset def_19E46
dw offset def_19E46
dw offset loc_19EA7

loc_19E6B:              ; jumptable 00019E46 case 1
mov     word ptr ds:9319h, 0FA0h
jmp     short loc_19E80

loc_19E73:              ; jumptable 00019E46 case 2
mov     word ptr ds:9319h, 0FA0h
mov     si, 2
or      ds:2294h, si

loc_19E80:
mov     word ptr ds:2298h, 0
jmp     short def_19E46 ; jumptable 00019E46 default case, cases 3,5-7,9-15

loc_19E88:              ; jumptable 00019E46 case 4
mov     word ptr ds:9319h, 1AE0h
cmp     word ptr ds:2296h, 0
jz      short loc_19ED5
cmp     byte ptr ds:9273h, 0
jz      short loc_19ED5
mov     si, 146h
or      word ptr ds:2294h, 4
jmp     short loc_19ED5

loc_19EA7:              ; jumptable 00019E46 case 16
mov     word ptr ds:9319h, 1F40h
cmp     byte ptr ds:9273h, 0
jz      short loc_19ED5
mov     si, 22h ; '"'
or      word ptr ds:2294h, 10h
jmp     short loc_19ED5

loc_19EBF:              ; jumptable 00019E46 case 8
mov     word ptr ds:9319h, 0FA0h
cmp     byte ptr ds:9273h, 0
jz      short loc_19ED5
mov     si, 2
or      word ptr ds:2294h, 8

loc_19ED5:
mov     di, 2000h

def_19E46:              ; jumptable 00019E46 default case, cases 3,5-7,9-15
call    sub_1BEA3
mov     dx, ds:9319h
add     dx, di
add     dx, si
add     dx, 1896h
cmp     ax, dx
jnb     short loc_19EEF
xor     ax, ax
jmp     short loc_19F42

loc_19EEF:
mov     ax, 1896h
push    ax
call    sub_3193F
mov     ds:9A6Eh, dx
mov     ds:9A6Ch, ax
cmp     word ptr ds:9319h, 0
jz      short loc_19F16
push    word ptr ds:9319h
call    sub_3193F
mov     ds:228Ah, dx
mov     ds:2288h, ax

loc_19F16:
or      si, si
jz      short loc_19F27
push    si
call    sub_3193F
mov     ds:2292h, dx
mov     ds:2290h, ax

loc_19F27:
cmp     word ptr ds:2298h, 0
jz      short loc_19F3F
or      di, di
jz      short loc_19F3F
push    di
call    sub_3193F
mov     ds:228Eh, dx
mov     ds:228Ch, ax

loc_19F3F:
mov     ax, 1

loc_19F42:
pop     di
pop     si
retn
sub_19E1F endp



; Attributes: bp-based frame

sub_19F45 proc near

var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 4
push    si
mov     si, ds:2294h
and     si, ds:9276h
test    si, 2
jnz     short loc_19F60
test    si, 8
jz      short loc_19F8D

loc_19F60:
les     bx, ds:2290h
mov     dl, es:[bx]
mov     al, dl
mov     ah, 0
mov     bx, ax
and     bx, 20h
mov     cl, 5
sar     bx, cl
or      bx, 100h
mov     ah, 0Bh
call    sub_10BFC
mov     al, dl
mov     ah, 0
mov     bx, ax
and     bx, 1Fh
mov     ah, 0Bh
call    sub_10BFC

loc_19F8D:
test    si, 4
jz      short loc_19FAE
les     bx, ds:2290h
add     bx, 120h
mov     [bp+var_2], es
mov     [bp+var_4], bx
mov     dx, bx
mov     ax, [bp+var_2]
mov     es, ax
mov     ax, 1002h
call    sub_10BFC

loc_19FAE:
test    si, 10h
jz      short loc_19FBF
push    word ptr ds:2292h
push    word ptr ds:2290h
call    sub_10BA4

loc_19FBF:
pop     si
mov     sp, bp
pop     bp
retn
sub_19F45 endp




sub_19FC4 proc near
push    si
mov     si, ds:2294h
and     si, ds:9276h
test    si, 2
jnz     short loc_19FD9
test    si, 8
jz      short loc_19FE8

loc_19FD9:
les     bx, ds:2274h
mov     al, es:[bx+66h]
les     bx, ds:2290h
mov     es:[bx], al

loc_19FE8:
test    si, 4
jz      short loc_1A012
les     bx, ds:2284h
les     bx, es:[bx]
push    word ptr es:[bx+6]
push    word ptr es:[bx+4]
mov     dx, ds:2292h
mov     ax, ds:2290h
add     ax, 120h
push    dx
push    ax
mov     ax, 11h
push    ax
call    sub_46A2C

loc_1A012:
test    si, 10h
jz      short loc_1A023
push    word ptr ds:2292h
push    word ptr ds:2290h
call    sub_10B65

loc_1A023:
pop     si
retn
sub_19FC4 endp



; Attributes: bp-based frame

sub_1A025 proc near

var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 4
test    word ptr ds:2294h, 2
jnz     short loc_1A03B
test    word ptr ds:2294h, 8
jz      short loc_1A069

loc_1A03B:
les     bx, ds:2290h
mov     dl, es:[bx+1]
mov     al, dl
mov     ah, 0
mov     bx, ax
and     bx, 20h
mov     cl, 5
sar     bx, cl
or      bx, 100h
mov     ah, 0Bh
call    sub_10BFC
mov     al, dl
mov     ah, 0
mov     bx, ax
and     bx, 1Fh
mov     ah, 0Bh
call    sub_10BFC

loc_1A069:
test    word ptr ds:2294h, 4
jz      short loc_1A08E
les     bx, ds:2290h
add     bx, 131h
mov     [bp+var_2], es
mov     [bp+var_4], bx
mov     dx, bx
mov     ax, [bp+var_2]
mov     es, ax
mov     ax, 1002h
call    sub_10BFC
jmp     short loc_1A0A5

loc_1A08E:
test    word ptr ds:2294h, 10h
jz      short loc_1A0A5
mov     dx, ds:2292h
mov     ax, ds:2290h
add     ax, 11h
push    dx
push    ax
call    sub_10BA4

loc_1A0A5:
mov     sp, bp
pop     bp
retn
sub_1A025 endp




sub_1A0A9 proc near
test    word ptr ds:2294h, 4
jz      short locret_1A0D0
les     bx, ds:2290h
mov     dx, es:[bx+144h]
mov     ax, es:[bx+142h]
les     bx, ds:2284h
mov     es:[bx+2], dx
mov     es:[bx], ax
mov     word ptr ds:2294h, 0

locret_1A0D0:
retn
sub_1A0A9 endp



; Attributes: bp-based frame

sub_1A0D1 proc near

var_4= dword ptr -4

push    bp
mov     bp, sp
sub     sp, 4
push    si
les     bx, ds:2284h
mov     dx, es:[bx+2]
mov     ax, es:[bx]
les     bx, ds:2290h
mov     es:[bx+144h], dx
mov     es:[bx+142h], ax
les     bx, ds:2284h
les     bx, es:[bx]
mov     ax, es:[bx+4]
or      ax, es:[bx+6]
jnz     short loc_1A141
les     bx, ds:2284h
push    word ptr es:[bx+2]
push    word ptr es:[bx]
push    word ptr ds:2292h
push    word ptr ds:2290h
mov     ax, 20h ; ' '
push    ax
call    sub_46A2C
mov     dx, ds:2292h
mov     ax, ds:2290h
add     ax, 20h ; ' '
les     bx, ds:2290h
mov     es:[bx+6], dx
mov     es:[bx+4], ax
mov     ax, bx
les     bx, ds:2284h
mov     es:[bx+2], dx
mov     es:[bx], ax

loc_1A141:
xor     si, si
les     bx, ds:2284h
les     bx, es:[bx]
les     bx, es:[bx+4]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
jmp     short loc_1A161

loc_1A156:
les     bx, [bp+var_4]
mov     byte ptr es:[bx], 0
inc     word ptr [bp+var_4]
inc     si

loc_1A161:
cmp     si, 11h
jl      short loc_1A156
mov     ax, 931Bh
push    ax
call    sub_1E87B
or      byte ptr ds:93B5h, 80h
mov     ax, 931Bh
push    ax
mov     ax, 931Bh
push    ax
call    sub_19D21
mov     ax, 931Bh
push    ax
call    sub_19C89
mov     ax, 931Bh
push    ax
call    sub_1E87B
xor     si, si
les     bx, ds:2284h
les     bx, es:[bx]
les     bx, es:[bx+4]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
jmp     short loc_1A1AD

loc_1A1A0:
les     bx, [bp+var_4]
inc     word ptr [bp+var_4]
cmp     byte ptr es:[bx], 0
jnz     short loc_1A1B2
inc     si

loc_1A1AD:
cmp     si, 11h
jl      short loc_1A1A0

loc_1A1B2:
cmp     si, 11h
jnz     short loc_1A1BA
call    sub_1A0A9

loc_1A1BA:
pop     si
mov     sp, bp
pop     bp
retn
sub_1A0D1 endp




sub_1A1BF proc near
test    word ptr ds:2294h, 2
jz      short loc_1A1D7
les     bx, ds:2274h
mov     al, es:[bx+66h]
les     bx, ds:2290h
mov     es:[bx+1], al

loc_1A1D7:
test    word ptr ds:2294h, 8
jz      short loc_1A1EF
les     bx, ds:2274h
mov     al, es:[bx+66h]
les     bx, ds:2290h
mov     es:[bx+1], al

loc_1A1EF:
test    word ptr ds:2294h, 4
jz      short loc_1A21E
call    sub_1A0D1
les     bx, ds:2284h
les     bx, es:[bx]
push    word ptr es:[bx+6]
push    word ptr es:[bx+4]
mov     dx, ds:2292h
mov     ax, ds:2290h
add     ax, 131h
push    dx
push    ax
mov     ax, 11h
push    ax
call    sub_46A2C

loc_1A21E:
test    word ptr ds:2294h, 10h
jz      short locret_1A235
mov     dx, ds:2292h
mov     ax, ds:2290h
add     ax, 11h
push    dx
push    ax
call    sub_10B65

locret_1A235:
retn
sub_1A1BF endp



; Attributes: bp-based frame

sub_1A236 proc near

var_4= dword ptr -4

push    bp
mov     bp, sp
sub     sp, 4
push    si
cmp     word ptr ds:472Ah, 0
jnz     short loc_1A26B
xor     si, si
les     bx, ds:2288h
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
jmp     short loc_1A25F

loc_1A252:
les     bx, [bp+var_4]
mov     word ptr es:[bx], 720h
add     word ptr [bp+var_4], 2
inc     si

loc_1A25F:
mov     ax, ds:9319h
shr     ax, 1
cmp     ax, si
ja      short loc_1A252
call    sub_1A1BF

loc_1A26B:
pop     si
mov     sp, bp
pop     bp
retn
sub_1A236 endp




sub_1A270 proc near
test    byte ptr ds:91D2h, 4
jz      short locret_1A27A
call    sub_10A5B

locret_1A27A:
retn
sub_1A270 endp




sub_1A27B proc near
mov     cl, ds:92C7h
mov     ch, ds:9305h
mov     dx, ds:9276h
cmp     word ptr ds:2298h, 0
jz      short locret_1A2B6
cmp     cl, 0Dh
jb      short locret_1A2B6
cmp     cl, 13h
ja      short locret_1A2B6
test    dx, 1Ch
jz      short locret_1A2B6
test    dx, 4
jz      short loc_1A2B3
test    ch, 60h
jnz     short loc_1A2B3
cmp     cl, 0Fh
jb      short loc_1A2B3
or      byte ptr ds:91D2h, 3

loc_1A2B3:
call    sub_10A03

locret_1A2B6:
retn
sub_1A27B endp



; Attributes: bp-based frame

sub_1A2B7 proc near

var_A4= byte ptr -0A4h
var_52= byte ptr -52h
var_9= byte ptr -9

push    bp
mov     bp, sp
sub     sp, 0A4h
lea     ax, [bp+var_A4]
push    ax
call    sub_1E87B
mov     dh, [bp+var_9]
mov     dl, [bp+var_52]
mov     ax, 600h
mov     bh, 7
xor     cx, cx
call    sub_10BFC
mov     sp, bp
pop     bp
retn
sub_1A2B7 endp



; Attributes: bp-based frame

sub_1A2DA proc near

var_12= word ptr -12h
var_10= word ptr -10h
var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 12h
push    si
push    di
cmp     word ptr ds:472Ah, 0
jz      short loc_1A2EC
jmp     loc_1A399

loc_1A2EC:
mov     ax, sp
sub     ax, ds:20h
add     ax, 0FC00h
mov     [bp+var_4], ax
mov     dx, sp
sub     dx, ax
mov     sp, dx
mov     [bp+var_6], dx
cmp     byte ptr ds:9275h, 0
jz      short loc_1A30F
mov     ax, 91D3h
push    ax
call    sub_10953

loc_1A30F:
mov     si, ds:9319h
xor     di, di
jmp     short loc_1A380

loc_1A317:
mov     dx, ds:926Bh
mov     ax, di
mov     [bp+var_C], dx
mov     [bp+var_E], ax
mov     ax, di
mov     [bp+var_8], dx
mov     [bp+var_A], ax
les     bx, ds:2288h
add     bx, di
mov     [bp+var_10], es
mov     [bp+var_12], bx
cmp     si, [bp+var_4]
jnb     short loc_1A340
mov     ax, si
jmp     short loc_1A343

loc_1A340:
mov     ax, [bp+var_4]

loc_1A343:
mov     [bp+var_2], ax
sub     si, ax
add     di, ax
push    [bp+var_C]
push    [bp+var_E]
push    ds
push    [bp+var_6]
push    ax
call    sub_46A2C
push    [bp+var_10]
push    [bp+var_12]
push    [bp+var_8]
push    [bp+var_A]
push    [bp+var_2]
call    sub_46A2C
push    ds
push    [bp+var_6]
push    [bp+var_10]
push    [bp+var_12]
push    [bp+var_2]
call    sub_46A2C

loc_1A380:
or      si, si
jnz     short loc_1A317
mov     ax, sp
add     ax, [bp+var_4]
mov     sp, ax
cmp     byte ptr ds:9275h, 0
jz      short loc_1A399
mov     ax, 91D3h
push    ax
call    sub_10999

loc_1A399:
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_1A2DA endp




sub_1A39F proc near
push    si
and     byte ptr ds:91D2h, 0F8h
call    sub_1A521
mov     si, ax
mov     ax, 9276h
push    ax
call    sub_1E87B
or      si, si
jnz     short loc_1A3BC
call    sub_1A521
or      ax, ax
jz      short loc_1A3CE

loc_1A3BC:
call    sub_19FC4
call    sub_1A27B
mov     ax, 91D3h
push    ax
call    sub_19DC4
call    sub_1A025
jmp     short loc_1A3D5

loc_1A3CE:
mov     ax, 91D3h
push    ax
call    sub_19CCF

loc_1A3D5:
call    sub_1A2DA
mov     word ptr ds:229Ah, 0
mov     byte ptr ds:1D40h, 1
pop     si
retn
sub_1A39F endp




sub_1A3E5 proc near
mov     ax, ds:9276h
cmp     ax, ds:931Bh
jnz     short loc_1A43C
test    byte ptr ds:92E3h, 2
jnz     short loc_1A42F
mov     al, ds:9310h
cmp     al, ds:93B5h
jnz     short loc_1A42F
mov     al, ds:9311h
cmp     al, ds:93B6h
jnz     short loc_1A42F
mov     ax, ds:92C8h
cmp     ax, ds:936Dh
jnz     short loc_1A42F
cmp     byte ptr ds:92E0h, 0
jnz     short loc_1A42F
mov     ax, ds:92CEh
mov     cl, 8
shr     ax, cl
cmp     al, ds:9311h
jnb     short loc_1A42F
mov     al, ds:92CEh
mov     ah, 0
cmp     ax, ds:92C8h
jb      short loc_1A44E

loc_1A42F:
mov     ax, 9276h
push    ax
mov     ax, 931Bh
push    ax
call    sub_19D21
jmp     short loc_1A44E

loc_1A43C:
mov     al, ds:9333h
les     bx, ds:2278h
mov     es:[bx], al
mov     al, ds:936Ch
mov     ah, 0
call    sub_10BFC

loc_1A44E:
mov     cx, ds:93B7h
mov     ah, 1
call    sub_10BFC
mov     word ptr ds:229Ch, 0
retn
sub_1A3E5 endp




sub_1A45E proc near
cmp     word ptr ds:229Eh, 91D3h
jnz     short loc_1A46D
mov     ax, 91D3h
push    ax
call    sub_1E87B

loc_1A46D:
call    sub_1A2DA
call    sub_1A521
or      ax, ax
jz      short loc_1A486
mov     ax, 9276h
push    ax
call    sub_19DC4
call    sub_1A270
call    sub_19F45
jmp     short loc_1A48D

loc_1A486:
mov     ax, 9276h
push    ax
call    sub_19CCF

loc_1A48D:
mov     word ptr ds:229Ah, 1
mov     byte ptr ds:1D40h, 0
cmp     word ptr ds:229Ch, 0
jz      short locret_1A4A2
call    sub_1A3E5

locret_1A4A2:
retn
sub_1A45E endp




sub_1A4A3 proc near
push    si
xor     ax, ax
push    ax
call    sub_17720
mov     ax, 1
push    ax
call    sub_16F3E
xor     si, si
jmp     short loc_1A4BA

loc_1A4B5:
push    si
call    sub_1AD85
inc     si

loc_1A4BA:
cmp     si, 12h
jl      short loc_1A4B5
call    sub_1AE49
pop     si
retn
sub_1A4A3 endp



; Attributes: bp-based frame

sub_1A4C4 proc near

var_A4= byte ptr -0A4h
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 0A4h
mov     ax, 0FFFFh
push    ax
call    sub_1774F
call    sub_1A4A3
mov     al, ds:0F2h
mov     ds:926Eh, al
or      byte ptr ds:926Dh, 80h
cmp     [bp+arg_0], 0
jz      short loc_1A511
lea     ax, [bp+var_A4]
push    ax
call    sub_1E87B
mov     ax, 91D3h
push    ax
call    sub_19CCF
lea     ax, [bp+var_A4]
push    ax
mov     ax, 91D3h
push    ax
call    sub_19D21
mov     ax, 91D3h
push    ax
call    sub_19C89
mov     ax, 91D3h
push    ax
call    sub_1E87B
jmp     short loc_1A518

loc_1A511:
mov     ax, 91D3h
push    ax
call    sub_19DC4

loc_1A518:
call    sub_1A583
mov     sp, bp
pop     bp
retn    2
sub_1A4C4 endp




sub_1A521 proc near
mov     ax, ds:91D3h
cmp     ax, ds:9276h
jnz     short loc_1A52F
mov     ax, 1
jmp     short locret_1A531

loc_1A52F:
xor     ax, ax

locret_1A531:
retn
sub_1A521 endp




sub_1A532 proc near
push    word ptr ds:0EEh
call    sub_1DD0C
call    sub_1DD32
or      ax, ax
jnz     short loc_1A544
mov     al, 0
jmp     short loc_1A546

loc_1A544:
mov     al, 0FFh

loc_1A546:
mov     ds:1B82h, al
mov     al, ds:926Eh
add     al, 0FFh
mov     ds:49A0h, al
mov     ds:499Eh, al
mov     ds:498Fh, al
mov     ds:498Dh, al
mov     ds:497Eh, al
mov     ds:497Ch, al
mov     ds:496Dh, al
mov     ds:496Bh, al
mov     ax, 6
push    ax
call    sub_1ACE5
mov     ax, 7
push    ax
call    sub_1ACE5
mov     ax, 8
push    ax
call    sub_1ACE5
mov     ax, 9
push    ax
call    sub_1ACE5
retn
sub_1A532 endp




sub_1A583 proc near
call    sub_1AE25
call    sub_1A532
xor     ax, ax
push    ax
call    sub_16F0E
mov     ax, 347Eh
push    ax
call    sub_16F0E
mov     ax, 3493h
push    ax
xor     ax, ax
push    ax
call    sub_177BE
mov     ax, 6
push    ax
mov     ax, 1
push    ax
call    sub_1ADEF
mov     ax, 3E7h
push    ax
call    sub_156D7
call    sub_1AFE5
retn
sub_1A583 endp



; Attributes: bp-based frame

sub_1A5B6 proc near

var_8= word ptr -8
var_6= word ptr -6
var_4= dword ptr -4
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 8
push    si
les     bx, ds:93BEh
add     bx, ds:93C2h
mov     [bp+var_6], es
mov     [bp+var_8], bx
push    [bp+var_6]
push    bx
push    ds
push    [bp+arg_0]
call    sub_46D76
push    [bp+var_6]
push    [bp+var_8]
call    sub_46E60
inc     ax
add     ds:93C2h, ax
inc     word ptr ds:93C4h
les     bx, ds:93BEh
add     bx, 7D0h
mov     ax, ds:93C4h
shl     ax, 1
sub     bx, ax
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
mov     si, ds:22A6h
jmp     short loc_1A615

loc_1A607:
les     bx, [bp+var_4]
mov     ax, es:[bx+2]
mov     es:[bx], ax
add     word ptr [bp+var_4], 2

loc_1A615:
dec     si
jnz     short loc_1A607
mov     ax, [bp+var_8]
les     bx, [bp+var_4]
mov     es:[bx], ax
pop     si
mov     sp, bp
pop     bp
retn    2
sub_1A5B6 endp




sub_1A628 proc near
call    sub_1BEA3
cmp     ax, 7D0h
jnb     short loc_1A634
xor     ax, ax
jmp     short locret_1A64E

loc_1A634:
mov     ax, 7D0h
push    ax
call    sub_3193F
mov     ds:93C0h, dx
mov     ds:93BEh, ax
mov     ax, 22A8h
push    ax
call    sub_1A5B6
mov     ax, 1

locret_1A64E:
retn
sub_1A628 endp



; Attributes: bp-based frame

sub_1A64F proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
les     bx, ds:93BEh
add     bx, 7D0h
mov     ax, ds:93C4h
shl     ax, 1
sub     bx, ax
mov     ax, [bp+arg_0]
dec     ax
shl     ax, 1
add     bx, ax
mov     ax, es:[bx]
mov     dx, ds:93C0h
pop     bp
retn    2
sub_1A64F endp



; Attributes: bp-based frame

sub_1A674 proc near

var_102= byte ptr -102h
var_2= byte ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 102h
push    si
mov     si, [bp+arg_0]
mov     ax, [bp+arg_2]
cmp     ax, ds:93C4h
jb      short loc_1A68D
mov     byte ptr [si], 0
jmp     short loc_1A6C5

loc_1A68D:
push    ds
push    si
push    [bp+arg_2]
call    sub_1A64F
push    dx
push    ax
call    sub_46D76
push    ds
push    si
push    ss
lea     ax, [bp+var_102]
push    ax
push    ss
lea     ax, [bp+var_2]
push    ax
xor     ax, ax
push    ax
call    sub_4031D
call    sub_13469
push    si
mov     ax, 22A9h
push    ax
call    sub_19483
push    si
lea     ax, [bp+var_102]
push    ax
call    sub_19483

loc_1A6C5:
pop     si
mov     sp, bp
pop     bp
retn    4
sub_1A674 endp



; Attributes: bp-based frame

sub_1A6CC proc near

var_204= byte ptr -204h
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 204h
push    si
push    di
mov     di, [bp+arg_2]
lea     si, [bp+var_204]
mov     ax, 1
push    ax
call    sub_1B056
or      ax, ax
jz      short loc_1A749
cmp     word ptr ds:4722h, 0
jnz     short loc_1A749
push    word ptr ds:4911h
call    sub_1E8C0
mov     [bp+var_2], ax
cmp     di, ds:22A6h
jnz     short loc_1A708
push    si
push    word ptr ds:93C6h
call    sub_19458
jmp     short loc_1A70D

loc_1A708:
push    di
push    si
call    sub_1A674

loc_1A70D:
mov     ax, ds:490Dh
mov     ds:93C8h, ax
push    si
mov     ax, di
sub     ax, ds:22A2h
inc     ax
push    ax
cmp     [bp+arg_0], 1
jnz     short loc_1A72D
cmp     word ptr ds:93C4h, 1
jnz     short loc_1A72D
xor     ax, ax
jmp     short loc_1A730

loc_1A72D:
mov     ax, [bp+arg_0]

loc_1A730:
push    ax
mov     al, ds:4917h
mov     ah, 0
mov     dl, ds:4915h
mov     dh, 0
sub     ax, dx
dec     ax
push    ax
call    sub_1B181
push    [bp+var_2]
call    sub_1E8C0

loc_1A749:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    4
sub_1A6CC endp



; Attributes: bp-based frame

sub_1A751 proc near

var_202= byte ptr -202h

push    bp
mov     bp, sp
sub     sp, 202h
cmp     word ptr ds:22A0h, 0
jnz     short loc_1A766
lea     ax, [bp+var_202]
mov     ds:93C6h, ax

loc_1A766:
cmp     word ptr ds:4722h, 0
jnz     short loc_1A79D
call    sub_40223
push    word ptr ds:22A6h
push    word ptr ds:93C6h
call    sub_1A674
push    word ptr ds:93C4h
push    word ptr ds:22A6h
push    word ptr ds:22A0h
mov     ax, 22A2h
push    ax
mov     ax, 22A4h
push    ax
mov     ax, 0A6CCh
push    ax
call    sub_1B085
call    sub_402B3

loc_1A79D:
mov     sp, bp
pop     bp
retn
sub_1A751 endp



; Attributes: bp-based frame

sub_1A7A1 proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
mov     ax, ds:93C4h
inc     ax
shl     ax, 1
mov     dx, 7D0h
sub     dx, ax
add     si, dx
mov     ax, si
cmp     ax, ds:93C2h
jnb     short loc_1A7C1
xor     si, si
jmp     short loc_1A7C5

loc_1A7C1:
sub     si, ds:93C2h

loc_1A7C5:
push    [bp+arg_4]
push    [bp+arg_2]
mov     ax, 0Ah
push    ax
mov     ax, 7
push    ax
mov     ax, 100h
push    ax
mov     ax, 21h ; '!'
push    ax
call    sub_18E6D
or      ax, ax
jge     short loc_1A7E4
jmp     short loc_1A805

loc_1A7E4:
push    [bp+arg_2]
call    sub_19448
or      ax, ax
jnz     short loc_1A7F3
mov     ax, 0FFFFh
jmp     short loc_1A805

loc_1A7F3:
cmp     ax, si
jb      short loc_1A803
mov     ax, 1700h
push    ax
xor     ax, ax
push    ax
call    sub_19065
jmp     short loc_1A7C5

loc_1A803:
xor     ax, ax

loc_1A805:
pop     si
pop     bp
retn    6
sub_1A7A1 endp



; Attributes: bp-based frame

sub_1A80A proc near

var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_4= dword ptr -4

push    bp
mov     bp, sp
sub     sp, 0Ah
push    si
push    di
push    word ptr ds:22A6h
call    sub_1A64F
mov     [bp+var_6], dx
mov     [bp+var_8], ax
push    dx
push    ax
call    sub_46E60
mov     di, ax
inc     di
sub     ds:93C2h, di
mov     ax, [bp+var_8]
xor     dx, dx
sub     ax, ds:93BEh
sbb     dx, 0
mov     [bp+var_A], ax
mov     ax, ds:93C2h
sub     ax, [bp+var_A]
or      ax, ax
jbe     short loc_1A860
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
add     ax, di
push    dx
push    ax
push    dx
push    [bp+var_8]
mov     ax, ds:93C2h
sub     ax, [bp+var_A]
push    ax
call    sub_46A2C

loc_1A860:
les     bx, ds:93BEh
add     bx, 7CEh
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
mov     si, ds:93C4h
jmp     short loc_1A897

loc_1A874:
les     bx, [bp+var_4]
mov     ax, es:[bx]
cmp     ax, [bp+var_8]
jbe     short loc_1A882
sub     es:[bx], di

loc_1A882:
cmp     si, ds:22A6h
jge     short loc_1A892
les     bx, [bp+var_4]
mov     ax, es:[bx]
mov     es:[bx+2], ax

loc_1A892:
dec     si
sub     word ptr [bp+var_4], 2

loc_1A897:
or      si, si
jnz     short loc_1A874
dec     word ptr ds:93C4h
mov     ax, ds:93C4h
cmp     ax, ds:22A6h
jge     short loc_1A8B4
or      ax, ax
jz      short loc_1A8AE
jmp     short loc_1A8B1

loc_1A8AE:
mov     ax, 1

loc_1A8B1:
mov     ds:22A6h, ax

loc_1A8B4:
cmp     word ptr ds:22A2h, 1
jle     short loc_1A8CD
call    sub_1B243
add     ax, ds:22A2h
dec     ax
cmp     ax, ds:93C4h
jle     short loc_1A8CD
dec     word ptr ds:22A2h

loc_1A8CD:
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_1A80A endp



; Attributes: bp-based frame

sub_1A8D3 proc near

var_100= byte ptr -100h

push    bp
mov     bp, sp
sub     sp, 100h
lea     ax, [bp+var_100]
push    ax
call    sub_1B1FB
mov     word ptr ds:1DD3h, 108h
cmp     word ptr ds:8B9Dh, 0
jz      short loc_1A8F4
mov     ax, 15h
jmp     short loc_1A8F7

loc_1A8F4:
mov     ax, 1

loc_1A8F7:
mov     ds:40DAh, ax
mov     ax, 171Dh
push    ax
lea     ax, [bp+var_100]
push    ax
xor     ax, ax
push    ax
call    sub_1A7A1
or      ax, ax
jge     short loc_1A90F
jmp     short loc_1A92E

loc_1A90F:
lea     ax, [bp+var_100]
push    ax
call    sub_1A5B6
xor     ax, ax
push    ax
call    sub_1B2A2
or      ax, ax
jnz     short loc_1A924
call    sub_1A751

loc_1A924:
mov     ax, 0FFFFh
push    ax
call    sub_17720
mov     ax, 0FFE5h

loc_1A92E:
mov     sp, bp
pop     bp
retn
sub_1A8D3 endp




sub_1A932 proc near
mov     ax, ds:22A6h
cmp     ax, ds:93C4h
jge     short loc_1A941
call    sub_1A80A
call    sub_1A751

loc_1A941:
mov     ax, 0FFFFh
retn
sub_1A932 endp



; Attributes: bp-based frame

sub_1A945 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     word ptr ds:9166h, 0
call    sub_40223
push    [bp+arg_0]
xor     ax, ax
push    ax
call    sub_1A6CC
call    sub_402B3
pop     bp
retn    2
sub_1A945 endp




sub_1A965 proc near
mov     ax, ds:22A6h
cmp     ax, ds:22A2h
jl      short loc_1A97B
mov     ax, ds:22A2h
add     ax, ds:22A4h
cmp     ax, ds:22A6h
jg      short loc_1A980

loc_1A97B:
call    sub_1A751
jmp     short locret_1A9AC

loc_1A980:
call    sub_40223
push    word ptr ds:22A6h
push    word ptr ds:93C6h
call    sub_1A674
push    word ptr ds:22A6h
cmp     word ptr ds:22A0h, 0
jz      short loc_1A9A0
mov     ax, 2
jmp     short loc_1A9A3

loc_1A9A0:
mov     ax, 1

loc_1A9A3:
push    ax
call    sub_1A6CC
call    sub_402B3

locret_1A9AC:
retn
sub_1A965 endp



; Attributes: bp-based frame

sub_1A9AD proc near

var_202= byte ptr -202h

push    bp
mov     bp, sp
sub     sp, 202h
cmp     word ptr ds:22A0h, 0
jnz     short loc_1A9C2
lea     ax, [bp+var_202]
mov     ds:93C6h, ax

loc_1A9C2:
push    ss
lea     ax, [bp+var_202]
push    ax
push    word ptr ds:22A6h
call    sub_1A64F
push    dx
push    ax
call    sub_46D76
mov     word ptr ds:1DD3h, 10Ah
mov     word ptr ds:40DAh, 1
mov     ax, 1729h
push    ax
lea     ax, [bp+var_202]
push    ax
mov     ax, ds:22A6h
cmp     ax, ds:93C4h
jge     short loc_1AA04
push    ss
lea     ax, [bp+var_202]
push    ax
call    sub_46E60
add     ax, 3
jmp     short loc_1AA06

loc_1AA04:
xor     ax, ax

loc_1AA06:
push    ax
call    sub_1A7A1
or      ax, ax
jge     short loc_1AA10
jmp     short loc_1AA3E

loc_1AA10:
mov     ax, ds:22A6h
cmp     ax, ds:93C4h
jge     short loc_1AA29
call    sub_1A80A
lea     ax, [bp+var_202]
push    ax
call    sub_1A5B6
call    sub_1A965
jmp     short loc_1AA34

loc_1AA29:
lea     ax, [bp+var_202]
push    ax
call    sub_1A5B6
call    sub_1A751

loc_1AA34:
mov     ax, 0FFFFh
push    ax
call    sub_17720
mov     ax, 0FFE5h

loc_1AA3E:
mov     sp, bp
pop     bp
retn
sub_1A9AD endp



; Attributes: bp-based frame

sub_1AA42 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     word ptr ds:9166h, 0
mov     ax, [bp+arg_0]
mov     ds:22A0h, ax
or      ax, ax
jz      short loc_1AA69
xor     ax, ax
push    ax
call    sub_1B2A2
mov     ax, 1
push    ax
call    sub_1AE6D
call    sub_40223
jmp     short loc_1AA6E

loc_1AA69:
call    sub_402B3

loc_1AA6E:
call    sub_1A965
pop     bp
retn    2
sub_1AA42 endp



; Attributes: bp-based frame

sub_1AA75 proc near

var_206= word ptr -206h
var_204= word ptr -204h
var_202= byte ptr -202h

push    bp
mov     bp, sp
sub     sp, 206h
push    si
push    di
lea     ax, [bp+var_202]
mov     ds:93C6h, ax
mov     di, ds:22A6h
mov     ax, ds:22A2h
mov     [bp+var_206], ax
mov     ax, ds:9166h
mov     [bp+var_204], ax
mov     ax, 1
push    ax
call    sub_1AA42
xor     ax, ax
push    ax
call    sub_1DC39
push    ax
call    sub_1DCCB

loc_1AAA8:
mov     word ptr ds:40DAh, 2
mov     word ptr ds:1DD3h, 0CDh
push    word ptr ds:93C4h
push    word ptr ds:22A4h
mov     ax, 22A6h
push    ax
mov     ax, 22A2h
push    ax
call    sub_1927C
mov     si, ax
mov     ax, si
cmp     ax, 0FFFFh
jge     short loc_1AAD3
jmp     loc_1AB5C

loc_1AAD3:
mov     ax, ds:22A2h
cmp     ax, [bp+var_206]
jz      short loc_1AAE1
call    sub_1A751
jmp     short loc_1AB06

loc_1AAE1:
mov     ax, ds:22A6h
cmp     ax, di
jz      short loc_1AAF1
push    di
call    sub_1A945
call    sub_1A965
jmp     short loc_1AB06

loc_1AAF1:
mov     ax, [bp+var_204]
cmp     ax, ds:9166h
jz      short loc_1AB06
push    word ptr ds:22A6h
mov     ax, 2
push    ax
call    sub_1A6CC

loc_1AB06:
mov     ax, ds:22A2h
mov     [bp+var_206], ax
mov     di, ds:22A6h
mov     ax, ds:9166h
mov     [bp+var_204], ax
mov     ax, si
mov     cx, 5           ; switch 5 cases
mov     bx, 0AB2Fh

loc_1AB20:
cmp     ax, cs:[bx]
jz      short loc_1AB2B
inc     bx
inc     bx
loop    loc_1AB20
jmp     short def_1AB2B ; jumptable 0001AB2B default case

loc_1AB2B:              ; switch jump
jmp     word ptr cs:[bx+0Ah]
dw      4,     6,     7,   1Ah ; value table for switch statement
dw    1Bh
jpt_1AB2B dw offset loc_1AB43 ; jump table for switch statement
dw offset loc_1AB4A
dw offset loc_1AB51
dw offset loc_1AB51
dw offset loc_1AB4A

loc_1AB43:              ; jumptable 0001AB2B case 4
call    sub_1A9AD
mov     si, ax
jmp     short def_1AB2B ; jumptable 0001AB2B default case

loc_1AB4A:              ; jumptable 0001AB2B cases 6,27
call    sub_1A8D3
mov     si, ax
jmp     short def_1AB2B ; jumptable 0001AB2B default case

loc_1AB51:              ; jumptable 0001AB2B cases 7,26
call    sub_1A932

def_1AB2B:              ; jumptable 0001AB2B default case
cmp     si, 0FFFFh
jl      short loc_1AB5C
jmp     loc_1AAA8

loc_1AB5C:
xor     ax, ax
push    ax
call    sub_1AA42
mov     ax, si
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_1AA75 endp




sub_1AB6A proc near
mov     word ptr ds:22A6h, 1
jmp     short loc_1AB75

loc_1AB72:
call    sub_1A80A

loc_1AB75:
cmp     word ptr ds:93C4h, 1
jg      short loc_1AB72
call    sub_1A751
retn
sub_1AB6A endp



; Attributes: bp-based frame

sub_1AB80 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
call    sub_1E8A9
or      ax, ax
jz      short loc_1AB94
xor     ax, ax
push    ax
call    sub_164B5

loc_1AB94:
or      si, si
jl      short loc_1AB9D
cmp     si, 12h
jle     short loc_1ABA6

loc_1AB9D:
mov     ax, si
add     ax, 0C8h
push    ax
call    sub_164B5

loc_1ABA6:
pop     si
pop     bp
retn    2
sub_1AB80 endp



; Attributes: bp-based frame

sub_1ABAB proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
mov     di, [bp+arg_0]
mov     al, [di+0Ch]
mov     ah, 0
mov     si, ax
cmp     word ptr ds:23C5h, 0
jz      short loc_1ABCE
cmp     byte ptr [di+10h], 0
jz      short loc_1ABCE
mov     al, [di+0Dh]
mov     ah, 0
mov     si, ax

loc_1ABCE:
mov     ax, si
pop     di
pop     si
pop     bp
retn    2
sub_1ABAB endp



; Attributes: bp-based frame

sub_1ABD6 proc near

var_4= byte ptr -4
var_2= byte ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 4
cmp     [bp+arg_0], 0
jz      short loc_1ABE9
cmp     word ptr ds:23C5h, 0
jz      short loc_1AC04

loc_1ABE9:
cmp     word ptr ds:4720h, 0
jnz     short loc_1ABFA
mov     [bp+var_4], 0D5h
mov     [bp+var_2], 0B8h
jmp     short loc_1AC1F

loc_1ABFA:
mov     [bp+var_4], 0DAh
mov     [bp+var_2], 0BFh
jmp     short loc_1AC1F

loc_1AC04:
mov     ax, [bp+arg_0]
cmp     ax, ds:4720h
jnz     short loc_1AC17
mov     [bp+var_4], 0C6h
mov     [bp+var_2], 0B5h
jmp     short loc_1AC1F

loc_1AC17:
mov     [bp+var_4], 0C3h
mov     [bp+var_2], 0B4h

loc_1AC1F:
xor     ax, ax
push    ax
push    ax
push    ax
push    ax
lea     ax, [bp+var_4]
push    ax
mov     ax, 1
push    ax
call    sub_1D8CC
mov     ax, 4Fh ; 'O'
push    ax
xor     ax, ax
push    ax
mov     ax, 4Fh ; 'O'
push    ax
xor     ax, ax
push    ax
lea     ax, [bp+var_2]
push    ax
mov     ax, 1
push    ax
call    sub_1D8CC
mov     sp, bp
pop     bp
retn    2
sub_1ABD6 endp



; Attributes: bp-based frame

sub_1AC4F proc near

var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_1= byte ptr -1
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 8
push    si
push    di
mov     si, [bp+arg_0]
mov     ax, si
mov     dx, 11h
mul     dx
mov     di, ax
add     di, 48FCh
push    si
call    sub_1AB80
mov     ax, [di+2]
mov     [bp+var_6], ax
or      ax, ax
jz      short loc_1ACDD
push    di
call    sub_1ABAB
or      ax, ax
jz      short loc_1ACDD
push    word ptr [di+4]
call    sub_1E8C0
mov     [bp+var_8], ax
or      si, si
jz      short loc_1AC8F
cmp     si, 1
jnz     short loc_1AC93

loc_1AC8F:
push    si
call    sub_1ABD6

loc_1AC93:
mov     al, [di+0Ch]
mov     ah, 0
shl     ax, 1
shl     ax, 1
shl     ax, 1
add     ax, 1B0Ah
mov     [bp+var_4], ax
mov     bx, ax
mov     al, [bx]
mov     [bp+var_1], al
mov     bx, [di]
cmp     si, ds:4720h
jnz     short loc_1ACBE
mov     cl, [bx+6]
mov     bx, [bp+var_4]
mov     byte ptr [bx], 0CDh
jmp     short loc_1ACC0

loc_1ACBE:
mov     cl, [bx]

loc_1ACC0:
push    [bp+var_6]
mov     al, cl
mov     ah, 0
push    ax
call    sub_1E90D
mov     al, [bp+var_1]
mov     bx, [bp+var_4]
mov     [bx], al
push    [bp+var_8]
call    sub_1E8C0
push    si
call    sub_1AB80

loc_1ACDD:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_1AC4F endp



; Attributes: bp-based frame

sub_1ACE5 proc near

var_1= byte ptr -1
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
mov     di, [bp+arg_0]
mov     ax, di
mov     dx, 11h
mul     dx
mov     si, ax
add     si, 48FCh
push    di
call    sub_1AB80
cmp     word ptr [si+4], 0FFFFh
jz      short loc_1AD0F
push    word ptr [si+4]
call    sub_1E8C0
jmp     short loc_1AD7A

loc_1AD0F:
or      di, di
jz      short loc_1AD1D
cmp     di, 1
jz      short loc_1AD1D
mov     ax, 1
jmp     short loc_1AD1F

loc_1AD1D:
xor     ax, ax

loc_1AD1F:
mov     [bp+var_1], al
mov     al, [si+8]
mov     ah, 0
inc     ax
push    ax
mov     al, [si+9]
mov     ah, 0
inc     ax
push    ax
mov     al, [si+0Ah]
mov     ah, 0
inc     ax
push    ax
mov     al, [si+0Bh]
mov     ah, 0
inc     ax
push    ax
push    si
call    sub_1ABAB
push    ax
mov     bx, [si]
mov     al, [bx+1]
mov     ah, 0
push    ax
mov     bx, [si]
mov     al, [bx+3]
mov     ah, 0
push    ax
mov     al, [si+0Fh]
cbw
push    ax
mov     al, [bp+var_1]
cbw
push    ax
call    sub_1E93C
mov     [si+4], ax
cmp     [bp+var_1], 0
jz      short loc_1AD6D
push    di
call    sub_1AC4F

loc_1AD6D:
mov     al, [si+0Eh]
mov     ah, 0
push    ax
call    sub_1DC4A
push    di
call    sub_1AB80

loc_1AD7A:
mov     ax, [si+4]
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_1ACE5 endp



; Attributes: bp-based frame

sub_1AD85 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
mov     di, [bp+arg_0]
mov     ax, di
mov     dx, 11h
mul     dx
mov     si, ax
add     si, 48FCh
push    di
call    sub_1AB80
cmp     word ptr [si+4], 0FFFFh
jz      short loc_1ADB6
push    word ptr [si+4]
call    sub_1E8C0
call    sub_1DA41
mov     word ptr [si+4], 0FFFFh
push    di
call    sub_1AB80

loc_1ADB6:
pop     di
pop     si
pop     bp
retn    2
sub_1AD85 endp



; Attributes: bp-based frame

sub_1ADBC proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
mov     di, [bp+arg_0]
mov     ax, di
mov     dx, 11h
mul     dx
mov     si, ax
add     si, 48FCh
push    di
call    sub_1AB80
push    si
call    sub_1ABAB
push    ax
mov     bx, [si]
mov     al, [bx+1]
mov     ah, 0
push    ax
call    sub_1DA05
push    di
call    sub_1AB80
pop     di
pop     si
pop     bp
retn    2
sub_1ADBC endp



; Attributes: bp-based frame

sub_1ADEF proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    si
mov     ax, [bp+arg_2]
mov     dx, 11h
mul     dx
mov     bx, ax
push    word ptr [bx+4900h]
call    sub_1E8C0
mov     si, ax
cmp     [bp+arg_0], 0
jz      short loc_1AE15
mov     ax, 1
push    ax
call    sub_1DCE5
jmp     short loc_1AE1C

loc_1AE15:
mov     ax, 1
push    ax
call    sub_1EA98

loc_1AE1C:
push    si
call    sub_1E8C0
pop     si
pop     bp
retn    4
sub_1ADEF endp




sub_1AE25 proc near
push    word ptr ds:9A6Eh
push    word ptr ds:9A6Ch
mov     ax, 1896h
push    ax
mov     ax, 12h
push    ax
push    ds
mov     ax, 1B06h
push    ax
mov     ax, 8
push    ax
call    sub_1DABB
mov     ds:9A6Ah, dx
mov     ds:9A68h, ax
retn
sub_1AE25 endp




sub_1AE49 proc near
push    si
xor     si, si
jmp     short loc_1AE53

loc_1AE4E:
push    si
call    sub_1AD85
inc     si

loc_1AE53:
cmp     si, 12h
jl      short loc_1AE4E
mov     ax, 1
push    ax
call    sub_1EACC
mov     word ptr ds:9A6Ah, 0
mov     word ptr ds:9A68h, 0
pop     si
retn
sub_1AE49 endp



; Attributes: bp-based frame

sub_1AE6D proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
xor     si, si
mov     ax, ds:4720h
cmp     ax, [bp+arg_0]
jz      short loc_1AEA3
mov     ax, [bp+arg_0]
mov     ds:4720h, ax
cmp     ds:23C5h, si
jz      short loc_1AE8F
call    sub_1AFE5
mov     si, 1
jmp     short loc_1AEA3

loc_1AE8F:
mov     ax, 0FFFFh
push    ax
call    sub_1774F
mov     ax, 1
push    ax
call    sub_1AC4F
xor     ax, ax
push    ax
call    sub_1AC4F

loc_1AEA3:
push    word ptr ds:4720h
call    sub_1ACE5
xor     ax, ax
push    ax
call    sub_1DC5F
mov     ax, si
pop     si
pop     bp
retn    2
sub_1AE6D endp




sub_1AEB7 proc near
push    ds
mov     ax, 1C5Eh
push    ax
call    sub_4623D
pop     cx
pop     cx
and     word ptr ds:1C68h, 0EFDFh
cmp     byte ptr ds:9877h, 0
jz      short loc_1AED8
mov     al, 1Bh
push    ax
call    sub_14C12
jmp     short locret_1AEE1

loc_1AED8:
xor     ax, ax
push    ax
call    sub_1ACE5
call    sub_1DA26

locret_1AEE1:
retn
sub_1AEB7 endp



; Attributes: bp-based frame

sub_1AEE2 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
mov     ax, 0FFFFh
push    ax
call    sub_1774F
push    si
call    sub_1ACE5
xor     ax, ax
push    ax
call    sub_1DCE5
cmp     word ptr ds:23C5h, 0
jz      short loc_1AF05
or      si, si
jz      short loc_1AF0D

loc_1AF05:
push    si
call    sub_1ADBC
push    si
call    sub_1AC4F

loc_1AF0D:
or      si, si
jnz     short loc_1AF16
call    sub_1AEB7
jmp     short loc_1AF19

loc_1AF16:
call    sub_1B2D9

loc_1AF19:
pop     si
pop     bp
retn    2
sub_1AEE2 endp




sub_1AF1E proc near
cmp     word ptr ds:4720h, 0
jnz     short loc_1AF2A
mov     ax, 1
jmp     short loc_1AF2C

loc_1AF2A:
xor     ax, ax

loc_1AF2C:
mov     ds:4720h, ax
cmp     word ptr ds:23C5h, 0
jz      short loc_1AF3B
call    sub_1AFE5
jmp     short loc_1AF4F

loc_1AF3B:
mov     ax, 1
push    ax
call    sub_1AC4F
xor     ax, ax
push    ax
call    sub_1AC4F
push    word ptr ds:4720h
call    sub_1ACE5

loc_1AF4F:
mov     ax, ds:4720h
mov     dx, 11h
mul     dx
mov     bx, ax
mov     ax, [bx+4902h]
retn
sub_1AF1E endp




sub_1AF5E proc near
push    si
push    di
cmp     word ptr ds:23C5h, 0
jz      short loc_1AF79
mov     byte ptr ds:4916h, 1
mov     al, ds:926Eh
add     al, 0FEh
mov     ds:4918h, al
mov     ds:4907h, al
jmp     short loc_1AF9B

loc_1AF79:
call    sub_1B243
mov     dl, ds:926Eh
mov     dh, 0
mov     di, dx
dec     di
mov     si, di
sub     si, ax
dec     si
mov     ax, si
add     al, 0FFh
mov     ds:4916h, al
mov     ds:4907h, al
mov     ax, di
add     al, 0FFh
mov     ds:4918h, al

loc_1AF9B:
call    sub_1481D
push    ds
mov     ax, 1C5Eh
push    ax
call    sub_4623D
pop     cx
pop     cx
pop     di
pop     si
retn
sub_1AF5E endp



; Attributes: bp-based frame

sub_1AFAD proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
push    si
call    sub_1ACE5
xor     ax, ax
push    ax
call    sub_1DCE5
push    si
call    sub_1ADBC
push    si
call    sub_1AC4F
pop     si
pop     bp
retn    2
sub_1AFAD endp




sub_1AFCB proc near
mov     cx, 100h
mov     dh, ds:926Eh
add     dh, 0FDh
mov     dl, ds:9225h
add     dl, 0FFh
mov     bh, 7
mov     ax, 600h
call    sub_10BFC
retn
sub_1AFCB endp




sub_1AFE5 proc near
call    sub_1AF5E
xor     ax, ax
push    ax
call    sub_1AD85
mov     ax, 1
push    ax
call    sub_1AD85
call    sub_1DD32
or      ax, ax
jz      short loc_1AFFF
call    sub_1AFCB

loc_1AFFF:
cmp     word ptr ds:23C5h, 0
jz      short loc_1B014
mov     byte ptr ds:4908h, 0
push    word ptr ds:4720h
call    sub_1AEE2
jmp     short loc_1B047

loc_1B014:
mov     byte ptr ds:4908h, 1
mov     ax, 0FFFFh
push    ax
call    sub_1774F
xor     ax, ax
push    ax
call    sub_1AFAD
mov     ax, 1
push    ax
call    sub_1AFAD
call    sub_1AEB7
call    sub_1B2D9
cmp     word ptr ds:4720h, 0
jnz     short loc_1B047
push    word ptr ds:4720h
call    sub_1ACE5
xor     ax, ax
push    ax
call    sub_1DC5F

loc_1B047:
mov     ax, ds:4720h
mov     dx, 11h
mul     dx
mov     bx, ax
mov     ax, [bx+4902h]
retn
sub_1AFE5 endp



; Attributes: bp-based frame

sub_1B056 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     ax, [bp+arg_0]
mov     dx, 11h
mul     dx
mov     bx, ax
cmp     word ptr [bx+4900h], 0FFFFh
jz      short loc_1B06F
mov     ax, 1
jmp     short loc_1B071

loc_1B06F:
xor     ax, ax

loc_1B071:
pop     bp
retn    2
sub_1B056 endp




sub_1B075 proc near
xor     ax, ax
push    ax
push    ax
mov     ax, 0DCEh
push    ax
mov     ax, 22h ; '"'
push    ax
call    sub_1EB6C
retn
sub_1B075 endp



; Attributes: bp-based frame

sub_1B085 proc near

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

push    bp
mov     bp, sp
sub     sp, 8
push    si
push    di
mov     si, [bp+arg_4]
mov     di, [bp+arg_8]
mov     [bp+var_8], 490Dh
mov     ax, 1
push    ax
call    sub_1B056
or      ax, ax
jnz     short loc_1B0A6
jmp     loc_1B179

loc_1B0A6:
mov     word ptr ds:9166h, 0
mov     bx, [bp+var_8]
mov     al, [bx+0Bh]
mov     ah, 0
mov     dl, [bx+9]
mov     dh, 0
sub     ax, dx
dec     ax
mov     bx, [bp+arg_2]
mov     [bx], ax
call    sub_1B243
mov     bx, [bp+arg_2]
cmp     ax, [bx]
jz      short loc_1B0D8
cmp     word ptr [si], 1
jle     short loc_1B0D2
dec     word ptr [si]

loc_1B0D2:
call    sub_1AFE5
jmp     loc_1B179

loc_1B0D8:
cmp     [bp+arg_A], 0
jnz     short loc_1B107
mov     bx, [bp+var_8]
push    word ptr [bx+4]
call    sub_1E8C0
mov     [bp+var_2], ax
mov     bx, [bp+var_8]
mov     bx, [bx]
mov     al, [bx+3]
mov     ah, 0
push    ax
xor     ax, ax
push    ax
call    sub_1D98E
call    sub_1DA26
push    [bp+var_2]
call    sub_1E8C0
jmp     loc_1B179

loc_1B107:
cmp     di, [bp+arg_A]
jle     short loc_1B10F
mov     di, [bp+arg_A]

loc_1B10F:
mov     ax, [si]
cmp     ax, di
jle     short loc_1B117
mov     [si], di

loc_1B117:
cmp     word ptr [si], 0
jnz     short loc_1B120
mov     word ptr [si], 1

loc_1B120:
mov     ax, [si]
mov     bx, [bp+arg_2]
add     ax, [bx]
cmp     ax, di
jg      short loc_1B136
mov     ax, [si]
add     ax, [bx]
mov     dx, di
sub     dx, ax
inc     dx
add     [si], dx

loc_1B136:
mov     ax, 0FFFFh
push    ax
call    sub_1774F
mov     ax, [si]
mov     [bp+var_6], ax
mov     [bp+var_4], 1
jmp     short loc_1B16F

loc_1B149:
push    [bp+var_6]
mov     ax, [bp+var_6]
cmp     ax, di
jnz     short loc_1B163
cmp     [bp+arg_6], 0
jz      short loc_1B15E
mov     ax, 2
jmp     short loc_1B161

loc_1B15E:
mov     ax, 1

loc_1B161:
jmp     short loc_1B165

loc_1B163:
xor     ax, ax

loc_1B165:
push    ax
call    [bp+arg_0]
inc     [bp+var_6]
inc     [bp+var_4]

loc_1B16F:
mov     bx, [bp+arg_2]
mov     ax, [bx]
cmp     ax, [bp+var_4]
jge     short loc_1B149

loc_1B179:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    0Ch
sub_1B085 endp



; Attributes: bp-based frame

sub_1B181 proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
push    si
push    di
mov     di, [bp+arg_0]
mov     si, [bp+arg_6]
dec     di
dec     di
push    si
call    sub_19448
mov     cx, ax
cmp     cx, di
jbe     short loc_1B19C
sub     cx, di
jmp     short loc_1B19E

loc_1B19C:
xor     cx, cx

loc_1B19E:
mov     ax, ds:9166h
cmp     ax, cx
jbe     short loc_1B1A9
mov     ds:9166h, cx

loc_1B1A9:
add     si, ds:9166h
cmp     [bp+arg_2], 2
jnz     short loc_1B1BC
mov     bx, ds:93C8h
mov     cl, [bx+2]
jmp     short loc_1B1C3

loc_1B1BC:
mov     bx, ds:93C8h
mov     cl, [bx+3]

loc_1B1C3:
mov     al, cl
mov     ah, 0
push    ax
xor     ax, ax
push    ax
call    sub_1D98E
mov     ax, 1
push    ax
push    [bp+arg_4]
cmp     [bp+arg_2], ax
jnz     short loc_1B1DF
mov     ax, 22ACh
jmp     short loc_1B1E2

loc_1B1DF:
mov     ax, 22AEh

loc_1B1E2:
push    ax
call    sub_1ED32
push    si
call    sub_1EB1F
push    si
call    sub_19448
cmp     ax, di
jg      short loc_1B1F5
call    sub_1B075

loc_1B1F5:
pop     di
pop     si
pop     bp
retn    8
sub_1B181 endp



; Attributes: bp-based frame

sub_1B1FB proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
mov     byte ptr [si], 0
cmp     word ptr ds:4720h, 0
jnz     short loc_1B220
push    si
mov     ax, 16DAh
push    ax
mov     ax, 0FFh
push    ax
call    sub_14B7E
mov     word ptr ds:8B9Dh, 1
jmp     short loc_1B23E

loc_1B220:
cmp     word ptr ds:4720h, 1
jnz     short loc_1B23E
cmp     word ptr ds:4722h, 0
jnz     short loc_1B23E
push    ds
push    si
push    word ptr ds:22A6h
call    sub_1A64F
push    dx
push    ax
call    sub_46D76

loc_1B23E:
pop     si
pop     bp
retn    2
sub_1B1FB endp




sub_1B243 proc near
les     bx, ds:9A68h
mov     cl, es:[bx+29h]
add     cl, 0FFh
cmp     word ptr ds:23C5h, 0
jz      short loc_1B25E
mov     al, cl
mov     ah, 0
add     ax, 0FFFDh
jmp     short locret_1B2A1

loc_1B25E:
mov     al, cl
mov     ah, 0
mul     word ptr ds:0EAh
mov     bx, 18h
cwd
idiv    bx
sub     cl, al
cmp     word ptr ds:4722h, 0
jnz     short loc_1B289
cmp     word ptr ds:93C4h, 1
jnz     short loc_1B280
mov     ch, 1
jmp     short loc_1B287

loc_1B280:
mov     ch, ds:93C4h
add     ch, 0FFh

loc_1B287:
jmp     short loc_1B28D

loc_1B289:
mov     ch, ds:0BFBAh

loc_1B28D:
mov     al, ch
cmp     al, cl
jnb     short loc_1B29D
or      ch, ch
jz      short loc_1B29B
mov     cl, ch
jmp     short loc_1B29D

loc_1B29B:
mov     cl, 1

loc_1B29D:
mov     al, cl
mov     ah, 0

locret_1B2A1:
retn
sub_1B243 endp



; Attributes: bp-based frame

sub_1B2A2 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     ax, [bp+arg_0]
cmp     ax, ds:4722h
jz      short loc_1B2CB
mov     ds:4722h, ax
or      ax, ax
jnz     short loc_1B2BA
mov     ax, 13F3h
jmp     short loc_1B2BD

loc_1B2BA:
mov     ax, 13FBh

loc_1B2BD:
mov     ds:490Fh, ax
mov     ax, 1
push    ax
call    sub_1B056
or      ax, ax
jnz     short loc_1B2CF

loc_1B2CB:
xor     ax, ax
jmp     short loc_1B2D5

loc_1B2CF:
call    sub_1AFE5
mov     ax, 1

loc_1B2D5:
pop     bp
retn    2
sub_1B2A2 endp




sub_1B2D9 proc near
cmp     word ptr ds:4722h, 0
jnz     short loc_1B2E5
call    sub_1A751
jmp     short locret_1B2E8

loc_1B2E5:
call    sub_1BF31

locret_1B2E8:
retn
sub_1B2D9 endp



; Attributes: bp-based frame

sub_1B2E9 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    si
push    di
mov     si, [bp+arg_0]
push    [bp+arg_2]
push    ds
push    si
mov     ax, 3
push    ax
call    sub_10740
cmp     ax, 3
jnz     short loc_1B35A
cmp     byte ptr [si], 80h
jz      short loc_1B30C
cmp     byte ptr [si], 88h
jnz     short loc_1B35A

loc_1B30C:
mov     di, [si+1]
cmp     di, 7Dh ; '}'
jle     short loc_1B348
push    [bp+arg_2]
push    ds
mov     ax, si
add     ax, 3
push    ax
mov     ax, 7Dh ; '}'
push    ax
call    sub_10740
cmp     ax, 7Dh ; '}'
jnz     short loc_1B35A
push    [bp+arg_2]
mov     ax, di
add     ax, 0FF83h
cwd
push    dx
push    ax
mov     ax, 1
push    ax
call    sub_10792
or      dx, dx
jl      short loc_1B35A
jnz     short loc_1B346
or      ax, ax
jb      short loc_1B35A

loc_1B346:
jmp     short loc_1B35E

loc_1B348:
push    [bp+arg_2]
push    ds
mov     ax, si
add     ax, 3
push    ax
push    di
call    sub_10740
cmp     ax, di
jz      short loc_1B35E

loc_1B35A:
xor     ax, ax
jmp     short loc_1B362

loc_1B35E:
mov     al, [si]
mov     ah, 0

loc_1B362:
pop     di
pop     si
pop     bp
retn    4
sub_1B2E9 endp



; Attributes: bp-based frame

sub_1B368 proc near

var_D6= word ptr -0D6h
var_D4= word ptr -0D4h
var_D2= word ptr -0D2h
var_D0= byte ptr -0D0h
var_CF= word ptr -0CFh
var_CC= byte ptr -0CCh
var_CB= word ptr -0CBh
var_C9= word ptr -0C9h
var_C7= byte ptr -0C7h
var_C6= byte ptr -0C6h
var_50= byte ptr -50h
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
sub     sp, 0D6h
push    si
push    di
mov     di, 1
push    ds
push    [bp+arg_4]
xor     ax, ax
push    ax
call    sub_106E6
mov     si, ax
or      si, si
jge     short loc_1B387
jmp     loc_1B42D

loc_1B387:
push    si
lea     ax, [bp+var_D0]
push    ax
call    sub_1B2E9
mov     [bp+var_D6], ax
cmp     ax, 80h
jnz     short loc_1B39C
jmp     loc_1B414

loc_1B39C:
jmp     loc_1B429

loc_1B39F:
cmp     [bp+var_CC], 0E9h
jnz     short loc_1B414
cmp     [bp+var_CF], 3
jnz     short loc_1B3B0
jmp     loc_1B429

loc_1B3B0:
push    ss
lea     ax, [bp+var_C6]
push    ax
push    ss
lea     ax, [bp+var_50]
push    ax
mov     al, [bp+var_C7]
mov     ah, 0
push    ax
call    sub_46A2C
mov     al, [bp+var_C7]
mov     ah, 0
mov     bx, ax
lea     ax, [bp+var_50]
add     bx, ax
mov     byte ptr [bx], 0
push    ss
lea     ax, [bp+var_50]
push    ax
call    sub_11CC1
mov     [bp+var_D2], dx
mov     [bp+var_D4], ax
xor     di, di
cmp     dx, [bp+var_C9]
jnz     short loc_1B40B
cmp     ax, [bp+var_CB]
jnz     short loc_1B40B
mov     dx, [bp+var_D2]
mov     ax, [bp+var_D4]
cmp     dx, [bp+arg_2]
jl      short loc_1B414
jg      short loc_1B40B
cmp     ax, [bp+arg_0]
jbe     short loc_1B414

loc_1B40B:
push    si
call    sub_10728
mov     ax, 1
jmp     short loc_1B42F

loc_1B414:
push    si
lea     ax, [bp+var_D0]
push    ax
call    sub_1B2E9
mov     [bp+var_D6], ax
cmp     ax, 88h
jnz     short loc_1B429
jmp     loc_1B39F

loc_1B429:
push    si
call    sub_10728

loc_1B42D:
mov     ax, di

loc_1B42F:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    6
sub_1B368 endp



; Attributes: bp-based frame

sub_1B437 proc near

var_8= byte ptr -8

push    bp
mov     bp, sp
sub     sp, 8
push    si
call    sub_31529
mov     cl, 0Ah
call    sub_1EE15
mov     si, ax
push    si
push    ss
lea     ax, [bp+var_8]
push    ax
call    sub_472C8
lea     ax, [bp+var_8]
push    ax
mov     ax, 1736h
push    ax
call    sub_19483
mov     ax, 15h
push    ax
mov     ax, 0Ah
push    ax
lea     ax, [bp+var_8]
push    ax
call    sub_1ED32
pop     si
mov     sp, bp
pop     bp
retn
sub_1B437 endp



; Attributes: bp-based frame

sub_1B476 proc far

var_72= byte ptr -72h
var_6C= byte ptr -6Ch
var_50= byte ptr -50h
arg_0= word ptr  6

push    bp
mov     bp, sp
sub     sp, 72h
call    sub_12609
or      ax, ax
jz      short loc_1B49C
mov     word ptr ds:968Ah, 0
cmp     word ptr ds:93CAh, 0
jz      short loc_1B497
call    sub_4B0DE
jmp     short loc_1B49C

loc_1B497:
call    sub_25ED6

loc_1B49C:
call    sub_1B437
cmp     word ptr ds:93CEh, 0
jnz     short loc_1B4A9
jmp     loc_1B59D

loc_1B4A9:
mov     word ptr ds:93CEh, 0
cmp     word ptr ds:93CAh, 0
jz      short loc_1B4B9
jmp     loc_1B53F

loc_1B4B9:
mov     ax, ds:0BFACh
or      ax, ds:0BFAEh
jnz     short loc_1B4C5
jmp     loc_1B59D

loc_1B4C5:
push    word ptr ds:0BFAEh
push    word ptr ds:0BFACh
call    sub_11C48
or      ax, ax
jz      short loc_1B50A
push    word ptr ds:0BFAEh
push    word ptr ds:0BFACh
xor     ax, ax
push    ax
push    ax
mov     ax, 9170h
push    ax
mov     ax, 91C8h
push    ax
call    sub_19500
lea     ax, [bp+var_6C]
push    ax
mov     ax, 173Ah
push    ax
call    sub_19458
push    ax
mov     ax, 9170h
push    ax
call    sub_19483
push    ax
mov     ax, 91C8h
push    ax
call    sub_19483
jmp     short loc_1B52B

loc_1B50A:
push    ss
lea     ax, [bp+var_50]
push    ax
push    word ptr ds:0BFAEh
push    word ptr ds:0BFACh
call    sub_46D76
lea     ax, [bp+var_50]
push    ax
lea     ax, [bp+var_6C]
push    ax
mov     ax, 1Ah
push    ax
call    sub_12515

loc_1B52B:
mov     ax, 0Dh
push    ax
mov     ax, 3
push    ax
lea     ax, [bp+var_6C]
push    ax
call    sub_1ED32
call    sub_1B075
jmp     short loc_1B59D

loc_1B53F:
mov     ax, ds:0BFB0h
or      ax, ds:0BFB2h
jz      short loc_1B59D
push    ss
lea     ax, [bp+var_50]
push    ax
push    word ptr ds:0BFB2h
push    word ptr ds:0BFB0h
call    sub_46D76
lea     ax, [bp+var_50]
push    ax
lea     ax, [bp+var_6C]
push    ax
mov     ax, 1Ah
push    ax
call    sub_12515
mov     ax, 0Dh
push    ax
mov     ax, 3
push    ax
lea     ax, [bp+var_6C]
push    ax
call    sub_1ED32
call    sub_1B075
cmp     word ptr ds:93CCh, 1
jnz     short loc_1B59D
cmp     [bp+arg_0], 2
jnz     short loc_1B59D
mov     ax, [bp+arg_0]
mov     ds:93CCh, ax
mov     ax, 1Eh
push    ax
mov     ax, 6
push    ax
mov     ax, 18D1h
push    ax
call    sub_1ED32

loc_1B59D:
cmp     word ptr ds:93CAh, 0
jnz     short loc_1B5E9
push    word ptr ds:0BEE4h
push    ss
lea     ax, [bp+var_72]
push    ax
call    sub_472C8
mov     ax, 1Eh
push    ax
mov     ax, 6
push    ax
lea     ax, [bp+var_72]
push    ax
call    sub_1ED32
mov     ax, ds:0BEE4h
xor     dx, dx
add     ax, ds:99B5h
adc     dx, ds:99B7h
push    dx
push    ax
push    ss
lea     ax, [bp+var_72]
push    ax
call    sub_47298
mov     ax, 15h
push    ax
mov     ax, 6
push    ax
lea     ax, [bp+var_72]
push    ax
call    sub_1ED32

loc_1B5E9:
mov     ax, ds:0BFAAh
cmp     ax, ds:93D0h
jnz     short loc_1B5F5
jmp     loc_1B682

loc_1B5F5:
mov     ds:93D0h, ax
mov     ax, ds:9961h
sub     ax, ds:995Fh
mov     dx, ds:0BFAAh
sub     dx, ds:0BFA8h
add     ax, dx
push    ax
push    ss
lea     ax, [bp+var_72]
push    ax
call    sub_472C8
mov     ax, 15h
push    ax
mov     ax, 7
push    ax
lea     ax, [bp+var_72]
push    ax
call    sub_1ED32
mov     ax, ds:0BFAAh
sub     ax, ds:0BFA8h
push    ax
push    ss
lea     ax, [bp+var_72]
push    ax
call    sub_472C8
mov     ax, 1Eh
push    ax
mov     ax, 7
push    ax
lea     ax, [bp+var_72]
push    ax
call    sub_1ED32
mov     ax, ds:995Fh
add     ax, ds:0BFA8h
push    ax
push    ss
lea     ax, [bp+var_72]
push    ax
call    sub_472C8
mov     ax, 15h
push    ax
mov     ax, 8
push    ax
lea     ax, [bp+var_72]
push    ax
call    sub_1ED32
push    word ptr ds:0BFA8h
push    ss
lea     ax, [bp+var_72]
push    ax
call    sub_472C8
mov     ax, 1Eh
push    ax
mov     ax, 8
push    ax
lea     ax, [bp+var_72]
push    ax
call    sub_1ED32

loc_1B682:
mov     sp, bp
pop     bp
retf    2
sub_1B476 endp



; Attributes: bp-based frame

sub_1B688 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     ax, 1
push    ax
mov     ax, 0Bh
push    ax
push    [bp+arg_0]
mov     bx, ds:49C8h
mov     al, [bx+2]
mov     ah, 0
push    ax
call    sub_1EB3C
pop     bp
retn    2
sub_1B688 endp



; Attributes: bp-based frame

sub_1B6A7 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    [bp+arg_0]
call    sub_1B688
mov     ax, 14h
push    ax
mov     ax, 0Bh
push    ax
mov     ax, 17E8h
push    ax
mov     bx, ds:49C8h
mov     al, [bx+2]
mov     ah, 0
or      ax, 80h
push    ax
call    sub_1EB3C
pop     bp
retn    2
sub_1B6A7 endp



; Attributes: bp-based frame

sub_1B6D0 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
mov     di, [bp+arg_0]
mov     ax, 0FFFFh
push    ax
call    sub_17720
mov     ax, ds:4720h
mov     dx, 11h
mul     dx
mov     bx, ax
mov     ax, [bx+4902h]
mov     ds:4724h, ax
push    word ptr ds:23C3h
call    sub_1C23E
mov     ax, 0Ch
push    ax
call    sub_1ACE5
cmp     di, 7
jz      short loc_1B732
cmp     di, 2
jz      short loc_1B712
cmp     di, 6
jz      short loc_1B712
mov     si, 18D8h
jmp     short loc_1B715

loc_1B712:
mov     si, 18F4h

loc_1B715:
mov     ax, 2
push    ax
push    ax
push    si
call    sub_1ED32
mov     ax, 1744h
push    ax
call    sub_1B688
mov     word ptr ds:825Dh, 0
mov     ax, 1
push    ax
call    sub_1DCE5

loc_1B732:
pop     di
pop     si
pop     bp
retn    2
sub_1B6D0 endp




sub_1B738 proc near
call    sub_1DA26
mov     ax, 5
push    ax
mov     ax, 6
push    ax
mov     ax, 1792h
push    ax
call    sub_1ED32
mov     ax, 0Bh
push    ax
mov     ax, 7
push    ax
mov     ax, 17C0h
push    ax
call    sub_1ED32
mov     ax, 0Dh
push    ax
mov     ax, 8
push    ax
mov     ax, 17D5h
push    ax
call    sub_1ED32
mov     ax, 3
push    ax
mov     ax, 0Ah
push    ax
mov     ax, 17ADh
push    ax
call    sub_1ED32
mov     ax, 1744h
push    ax
call    sub_1B688
retn
sub_1B738 endp



; Attributes: bp-based frame

sub_1B77F proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
cmp     word ptr ds:93D2h, 0
jnz     short loc_1B7C8
mov     word ptr ds:93D2h, 1
mov     word ptr ds:93CAh, 0
cmp     [bp+arg_0], 2
jz      short loc_1B7C8
call    sub_1B738
mov     ax, 2
push    ax
push    ax
mov     ax, 176Eh
push    ax
call    sub_1ED32
mov     ax, 2
push    ax
mov     ax, 3
push    ax
mov     ax, 1779h
push    ax
call    sub_1ED32
mov     ax, 15h
push    ax
mov     ax, 5
push    ax
mov     ax, 1784h
push    ax
call    sub_1ED32

loc_1B7C8:
pop     bp
retn    2
sub_1B77F endp



; Attributes: bp-based frame

sub_1B7CC proc near

var_1C= byte ptr -1Ch
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 1Ch
mov     word ptr ds:93D0h, 0FFFFh
push    [bp+arg_0]
lea     ax, [bp+var_1C]
push    ax
mov     ax, 1Ah
push    ax
call    sub_12515
mov     ax, 0Dh
push    ax
mov     ax, 2
push    ax
lea     ax, [bp+var_1C]
push    ax
call    sub_1ED32
mov     ax, 0DCEh
push    ax
call    sub_1EB1F
mov     ax, 0Dh
push    ax
mov     ax, 3
push    ax
mov     ax, 0DCEh
push    ax
call    sub_1ED32
mov     ax, 1Fh
push    ax
mov     ax, 6
push    ax
mov     ax, 0DCEh
push    ax
call    sub_1ED32
mov     ax, 1Fh
push    ax
mov     ax, 7
push    ax
mov     ax, 0DCEh
push    ax
call    sub_1ED32
mov     ax, 1Fh
push    ax
mov     ax, 8
push    ax
mov     ax, 0DCEh
push    ax
call    sub_1ED32
xor     ax, ax
push    ax
push    cs
call    near ptr sub_1B476
mov     sp, bp
pop     bp
retn    2
sub_1B7CC endp



; Attributes: bp-based frame

sub_1B845 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
mov     di, 1903h
cmp     [bp+arg_0], 4
jnz     short loc_1B859
mov     di, 1967h
jmp     loc_1B8BA

loc_1B859:
cmp     [bp+arg_0], 5
jz      short loc_1B8AB
cmp     [bp+arg_0], 3
jnz     short loc_1B875
cmp     word ptr ds:995Fh, 0
jnz     short loc_1B883
cmp     word ptr ds:9961h, 0
jz      short loc_1B8BA
jmp     short loc_1B898

loc_1B875:
cmp     word ptr ds:31C5h, 1
jg      short loc_1B888
cmp     word ptr ds:995Fh, 0
jz      short loc_1B888

loc_1B883:
mov     di, 192Bh
jmp     short loc_1B8BA

loc_1B888:
cmp     word ptr ds:31C5h, 0
jnz     short loc_1B89D
mov     ax, ds:9961h
sub     ax, ds:995Fh
jz      short loc_1B89D

loc_1B898:
mov     di, 1917h
jmp     short loc_1B8BA

loc_1B89D:
cmp     word ptr ds:31C5h, 2
jg      short loc_1B8B0
cmp     word ptr ds:995Fh, 0
jz      short loc_1B8B0

loc_1B8AB:
mov     di, 193Fh
jmp     short loc_1B8BA

loc_1B8B0:
cmp     word ptr ds:31C5h, 3
jnz     short loc_1B8BA
mov     di, 1953h

loc_1B8BA:
push    di
call    sub_1B6A7
cmp     [bp+arg_0], 1
jnz     short loc_1B8D7
cmp     word ptr ds:968Ah, 0
jz      short loc_1B8D7
cmp     word ptr ds:995Fh, 0
jnz     short loc_1B8D7
mov     si, 900h
jmp     short loc_1B90A

loc_1B8D7:
mov     si, 0FFFDh
cmp     word ptr ds:4728h, 0
jnz     short loc_1B90A
mov     word ptr ds:40DAh, 1
mov     word ptr ds:1DD3h, 0F3h
call    sub_15852
push    ax
call    sub_11EA2
mov     si, ax
cmp     si, 0FFFFh
jl      short loc_1B90A
cmp     si, 5
jnz     short loc_1B905
mov     ax, 0E00h
jmp     short loc_1B908

loc_1B905:
mov     ax, 0FFFFh

loc_1B908:
mov     si, ax

loc_1B90A:
mov     ax, 0Ch
push    ax
call    sub_1AD85
call    sub_1BFE3
call    sub_1BF31
cmp     si, 0E00h
jz      short loc_1B94C
cmp     si, 0FFFDh
jz      short loc_1B94E
or      si, si
jge     short loc_1B934
cmp     word ptr ds:9961h, 0
jz      short loc_1B934
mov     ax, 1
push    ax
call    sub_1B2A2

loc_1B934:
cmp     si, 0FFFFh
jnz     short loc_1B94E
cmp     word ptr ds:9961h, 0
jz      short loc_1B94C
mov     ax, 1
push    ax
call    sub_1AE6D
mov     si, 700h
jmp     short loc_1B94E

loc_1B94C:
xor     si, si

loc_1B94E:
mov     ax, si
pop     di
pop     si
pop     bp
retn    2
sub_1B845 endp



; Attributes: bp-based frame

sub_1B956 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     ax, 0Ch
push    ax
call    sub_1ACE5
mov     ax, 197Bh
push    ax
mov     bx, ds:49C8h
mov     al, [bx]
mov     ah, 0
push    ax
call    sub_1E90D
cmp     word ptr ds:93D2h, 0
jnz     short loc_1B97A
call    sub_1B738

loc_1B97A:
push    [bp+arg_0]
call    sub_1B7CC
mov     ax, 2
push    ax
push    ax
mov     ax, 1985h
push    ax
call    sub_1ED32
mov     ax, 2
push    ax
mov     ax, 3
push    ax
mov     ax, 1990h
push    ax
call    sub_1ED32
mov     ax, 15h
push    ax
mov     ax, 5
push    ax
mov     ax, 199Bh
push    ax
call    sub_1ED32
mov     ax, 1Eh
push    ax
mov     ax, 6
push    ax
mov     ax, 18CAh
push    ax
call    sub_1ED32
mov     ax, 1
mov     ds:93CAh, ax
mov     ds:93D2h, ax
mov     ds:93CCh, ax
pop     bp
retn    2
sub_1B956 endp



; Attributes: bp-based frame

sub_1B9C9 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     ax, 0Ch
push    ax
call    sub_1ACE5
mov     ax, 19A9h
push    ax
mov     bx, ds:49C8h
mov     al, [bx]
mov     ah, 0
push    ax
call    sub_1E90D
call    sub_1DA26
mov     ax, 2
push    ax
push    ax
push    [bp+arg_0]
call    sub_1ED32
mov     ax, 0Dh
push    ax
mov     ax, 6
push    ax
mov     ax, 19B2h
push    ax
call    sub_1ED32
mov     ax, 1903h
push    ax
call    sub_1B688
pop     bp
retn    2
sub_1B9C9 endp




sub_1BA0B proc far
call    sub_12609
or      ax, ax
jz      short locret_1BA1D
mov     word ptr ds:968Ah, 0
call    sub_25ED6

locret_1BA1D:
retf
sub_1BA0B endp




sub_1BA1E proc near
mov     ah, 48h ; 'H'
mov     bx, 0FFFFh
call    sub_10BD7
mov     ax, bx
retn
sub_1BA1E endp



; Attributes: bp-based frame

sub_1BA2B proc near

var_A6= word ptr -0A6h
var_A4= byte ptr -0A4h
var_55= byte ptr -55h
var_54= byte ptr -54h
var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 0A6h
push    si
push    di
mov     si, 0FFFFh
mov     ax, 0Fh
push    ax
call    sub_1ACE5
lea     ax, [bp+var_A4]
push    ax
mov     ax, 183Bh
push    ax
call    sub_19458
mov     al, 0
push    ax
push    ss
lea     ax, [bp+var_54]
push    ax
call    sub_10534
push    ss
lea     ax, [bp+var_54]
push    ax
call    sub_46E60
mov     [bp+var_A6], ax
cmp     ax, 3
jle     short loc_1BA70
lea     bx, [bp+var_55]
add     bx, ax
mov     byte ptr [bx], 0

loc_1BA70:
lea     ax, [bp+var_A4]
push    ax
lea     ax, [bp+var_54]
push    ax
call    sub_19483
mov     ax, 3
push    ax
mov     ax, 2
push    ax
lea     ax, [bp+var_A4]
push    ax
call    sub_1ED32
lea     ax, [bp+var_A4]
push    ax
mov     ax, 1850h
push    ax
call    sub_19458
mov     ax, 9877h
push    ax
call    sub_19C1B
mov     ax, 2Ah ; '*'
push    ax
call    sub_12493
lea     ax, [bp+var_54]
push    ax
call    sub_19C39
lea     ax, [bp+var_A4]
push    ax
lea     ax, [bp+var_54]
push    ax
call    sub_19483
mov     ax, 3
push    ax
push    ax
lea     ax, [bp+var_A4]
push    ax
call    sub_1ED32
mov     ax, ds:1C94h
xor     dx, dx
push    dx
push    ax
push    ss
lea     ax, [bp+var_54]
push    ax
call    sub_47298
lea     ax, [bp+var_A4]
push    ax
mov     ax, 1865h
push    ax
call    sub_19458
push    ax
lea     ax, [bp+var_54]
push    ax
call    sub_19483
mov     ax, ds:1C8Ah
add     ax, 0FFFEh
xor     dx, dx
push    dx
push    ax
push    ss
lea     ax, [bp+var_54]
push    ax
call    sub_47298
lea     ax, [bp+var_A4]
push    ax
mov     ax, 188Fh
push    ax
call    sub_19483
push    ax
lea     ax, [bp+var_54]
push    ax
call    sub_19483
push    ax
mov     ax, 0C7Dh
push    ax
call    sub_19483
mov     ax, 3
push    ax
mov     ax, 4
push    ax
lea     ax, [bp+var_A4]
push    ax
call    sub_1ED32
mov     ax, ds:1D22h
mov     cl, 4
shl     ax, cl
push    ax
push    ss
lea     ax, [bp+var_54]
push    ax
call    sub_472C8
lea     ax, [bp+var_A4]
push    ax
mov     ax, 187Ah
push    ax
call    sub_19458
push    ax
lea     ax, [bp+var_54]
push    ax
call    sub_19483
push    ax
mov     ax, 1736h
push    ax
call    sub_19483
mov     ax, 3
push    ax
mov     ax, 5
push    ax
lea     ax, [bp+var_A4]
push    ax
call    sub_1ED32
push    word ptr ds:99B7h
push    word ptr ds:99B5h
push    ss
lea     ax, [bp+var_54]
push    ax
call    sub_47298
lea     ax, [bp+var_A4]
push    ax
mov     ax, 1897h
push    ax
call    sub_19458
push    ax
lea     ax, [bp+var_54]
push    ax
call    sub_19483
mov     ax, 3
push    ax
mov     ax, 7
push    ax
lea     ax, [bp+var_A4]
push    ax
call    sub_1ED32
mov     ax, ds:9961h
sub     ax, ds:995Fh
push    ax
push    ss
lea     ax, [bp+var_54]
push    ax
call    sub_472C8
lea     ax, [bp+var_A4]
push    ax
mov     ax, 18B9h
push    ax
call    sub_19458
push    ax
lea     ax, [bp+var_54]
push    ax
call    sub_19483
mov     ax, 3
push    ax
mov     ax, 8
push    ax
lea     ax, [bp+var_A4]
push    ax
call    sub_1ED32
push    word ptr ds:995Fh
push    ss
lea     ax, [bp+var_54]
push    ax
call    sub_472C8
lea     ax, [bp+var_A4]
push    ax
mov     ax, 18A8h
push    ax
call    sub_19458
push    ax
lea     ax, [bp+var_54]
push    ax
call    sub_19483
mov     ax, 3
push    ax
mov     ax, 9
push    ax
lea     ax, [bp+var_A4]
push    ax
call    sub_1ED32
mov     ax, ds:0C0EFh
cmp     ax, 2
jz      short loc_1BC16
cmp     ax, 3
jz      short loc_1BC1B
jmp     short loc_1BC20

loc_1BC16:
mov     di, 19D4h
jmp     short loc_1BC23

loc_1BC1B:
mov     di, 19E5h
jmp     short loc_1BC23

loc_1BC20:
mov     di, 19C1h

loc_1BC23:
lea     ax, [bp+var_A4]
push    ax
push    di
call    sub_19458
mov     ax, 21h ; '!'
push    ax
mov     ax, 7
push    ax
lea     ax, [bp+var_A4]
push    ax
call    sub_1ED32
mov     [bp+var_54], 0
cmp     word ptr ds:1B44h, 0FFFFh
jz      short loc_1BC55
push    word ptr ds:1B44h
push    ss
lea     ax, [bp+var_54]
push    ax
call    sub_472C8

loc_1BC55:
lea     ax, [bp+var_A4]
push    ax
mov     ax, 19F9h
push    ax
call    sub_19458
lea     ax, [bp+var_A4]
push    ax
lea     ax, [bp+var_54]
push    ax
call    sub_19483
mov     ax, 21h ; '!'
push    ax
mov     ax, 8
push    ax
lea     ax, [bp+var_A4]
push    ax
call    sub_1ED32
cmp     word ptr ds:0C0EFh, 2
jnz     short loc_1BC98
call    sub_1BA1E
xor     dx, dx
mov     cl, 4
call    sub_1EDF6
mov     [bp+var_2], dx
mov     [bp+var_4], ax
jmp     short loc_1BCEE

loc_1BC98:
cmp     word ptr ds:0C0EFh, 0
jnz     short loc_1BCCA
call    sub_31529
push    dx
push    ax
cmp     word ptr ds:1D20h, 0
jz      short loc_1BCB3
xor     dx, dx
mov     ax, dx
jmp     short loc_1BCBC

loc_1BCB3:
mov     ax, ds:1C8Ah
sub     ax, ds:1C94h
xor     dx, dx

loc_1BCBC:
pop     bx
pop     cx
add     bx, ax
adc     cx, dx
mov     [bp+var_2], cx
mov     [bp+var_4], bx
jmp     short loc_1BCEE

loc_1BCCA:
cmp     word ptr ds:1D20h, 0
jz      short loc_1BCD7
xor     dx, dx
mov     ax, dx
jmp     short loc_1BCE0

loc_1BCD7:
mov     ax, ds:1C8Ah
sub     ax, ds:1C94h
xor     dx, dx

loc_1BCE0:
add     ax, ds:93D8h
adc     dx, ds:93DAh
mov     [bp+var_2], dx
mov     [bp+var_4], ax

loc_1BCEE:
xor     dx, dx
mov     ax, 400h
push    dx
push    ax
push    [bp+var_2]
push    [bp+var_4]
call    sub_1ED51
push    ax
push    ss
lea     ax, [bp+var_54]
push    ax
call    sub_472C8
lea     ax, [bp+var_54]
push    ax
mov     ax, 1736h
push    ax
call    sub_19483
lea     ax, [bp+var_A4]
push    ax
mov     ax, 17ADh
push    ax
call    sub_19458
push    ax
lea     ax, [bp+var_54]
push    ax
call    sub_19483
mov     ax, 21h ; '!'
push    ax
mov     ax, 9
push    ax
lea     ax, [bp+var_A4]
push    ax
call    sub_1ED32
mov     ax, 1
push    ax
mov     ax, 0Bh
push    ax
mov     ax, 17FDh
push    ax
mov     bx, ds:49C8h
mov     al, [bx+2]
mov     ah, 0
push    ax
call    sub_1EB3C
mov     ax, 1
push    ax
call    sub_1DCE5
mov     word ptr ds:40DAh, 1
mov     word ptr ds:1DD3h, 12Ch
call    sub_15852
push    ax
call    sub_11EA2
mov     si, ax
mov     ax, 0Fh
push    ax
call    sub_1AD85
or      si, si
jl      short loc_1BD7D
mov     si, 0FFFFh

loc_1BD7D:
mov     ax, si
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_1BA2B endp




sub_1BD85 proc near
push    si
xor     si, si
push    ds
inc     word ptr ds:1DE8h
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jnz     short loc_1BDC9
cmp     byte ptr ds:47D0h, 20h ; ' '
jnz     short loc_1BDAE
mov     byte ptr ds:47D0h, 0

loc_1BDAE:
push    ds
mov     ax, 0C63h
push    ax
call    sub_30A40
call    sub_4B10F
mov     si, ax
or      si, si
jnz     short loc_1BDC9
mov     word ptr ds:99FDh, 0

loc_1BDC9:
dec     word ptr ds:1DE8h
mov     ax, si
pop     si
retn
sub_1BD85 endp




sub_1BDD1 proc near
cmp     word ptr ds:1D20h, 0
jz      short loc_1BDE6
les     bx, ds:0Ah
mov     word ptr ds:93D6h, es
mov     ds:93D4h, bx
jmp     short locret_1BE14

loc_1BDE6:
mov     ax, ds:1C86h
add     ax, ds:1C94h
inc     ax
inc     ax
and     ax, 0FFFEh
mov     ds:2324h, ax
mov     dx, ds:1C5Eh
xor     ax, ax
mov     bx, ds:2324h
xor     cx, cx
call    sub_46B23
mov     ds:93D6h, dx
mov     ds:93D4h, ax
push    dx
push    ax
call    sub_31B0C

locret_1BE14:
retn
sub_1BDD1 endp



; Attributes: bp-based frame

sub_1BE15 proc near

var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 4
push    si
cmp     word ptr ds:1D20h, 0
jz      short loc_1BE32
push    word ptr ds:93D6h
push    word ptr ds:93D4h
call    sub_31B0C
jmp     short loc_1BE96

loc_1BE32:
call    sub_31529
mov     [bp+var_2], dx
mov     [bp+var_4], ax
mov     si, ds:1C60h
sub     si, ds:2324h
mov     word ptr ds:2324h, 0
mov     dx, ds:18h
mov     ax, ds:16h
mov     cx, ds:14h
mov     bx, ds:12h
call    sub_46BA0
add     ax, [bp+var_4]
adc     dx, [bp+var_2]
mov     bx, si
xor     cx, cx
sub     ax, bx
sbb     dx, cx
push    dx
push    ax
call    sub_30789
or      ax, ax
jz      short loc_1BE83
mov     ax, 1A0Fh
push    ax
mov     ax, 0C63h
push    ax
call    sub_19065

loc_1BE83:
push    word ptr ds:93D6h
push    word ptr ds:93D4h
call    sub_31B0C
push    si
call    sub_3193F

loc_1BE96:
call    sub_30959
mov     ds:4726h, ax
pop     si
mov     sp, bp
pop     bp
retn
sub_1BE15 endp




sub_1BEA3 proc near
call    sub_31529
or      dx, dx
jg      short loc_1BEB6
jl      short loc_1BEB2
or      ax, ax
jnb     short loc_1BEB6

loc_1BEB2:
xor     ax, ax
jmp     short locret_1BEC1

loc_1BEB6:
mov     cx, 0FFFEh
or      dx, dx
jnz     short loc_1BEBF
and     cx, ax

loc_1BEBF:
mov     ax, cx

locret_1BEC1:
retn
sub_1BEA3 endp



; Attributes: bp-based frame

sub_1BEC2 proc near

var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
mov     si, [bp+arg_2]
mov     di, 9A78h
mov     ax, 1
push    ax
call    sub_1B056
or      ax, ax
jz      short loc_1BF29
cmp     word ptr ds:4722h, 1
jnz     short loc_1BF29
push    word ptr ds:4911h
call    sub_1E8C0
mov     [bp+var_2], ax
cmp     si, ds:0BFBAh
ja      short loc_1BEFA
push    si
call    sub_30C40
jmp     short loc_1BEFF

loc_1BEFA:
mov     byte ptr ds:9A78h, 0

loc_1BEFF:
mov     ax, ds:490Dh
mov     ds:93C8h, ax
push    di
mov     ax, si
sub     ax, ds:947Ch
inc     ax
push    ax
push    [bp+arg_0]
mov     al, ds:4917h
mov     ah, 0
mov     dl, ds:4915h
mov     dh, 0
sub     ax, dx
dec     ax
push    ax
call    sub_1B181
push    [bp+var_2]
call    sub_1E8C0

loc_1BF29:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    4
sub_1BEC2 endp




sub_1BF31 proc near
cmp     word ptr ds:4722h, 1
jnz     short locret_1BF53
push    word ptr ds:0BFBAh
push    word ptr ds:4068h
push    word ptr ds:4066h
mov     ax, 947Ch
push    ax
mov     ax, 947Eh
push    ax
mov     ax, 0BEC2h
push    ax
call    sub_1B085

locret_1BF53:
retn
sub_1BF31 endp



; Attributes: bp-based frame

sub_1BF54 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     word ptr ds:9166h, 0
push    [bp+arg_0]
xor     ax, ax
push    ax
call    sub_1BEC2
pop     bp
retn    2
sub_1BF54 endp




sub_1BF6A proc near
cmp     word ptr ds:0BFBAh, 0
jz      short locret_1BFAA
mov     ax, ds:4068h
cmp     ax, ds:947Ch
jl      short loc_1BF8E
cmp     word ptr ds:947Ch, 0
jz      short loc_1BF8E
mov     ax, ds:947Ch
add     ax, ds:947Eh
cmp     ax, ds:4068h
jg      short loc_1BF93

loc_1BF8E:
call    sub_1BF31
jmp     short locret_1BFAA

loc_1BF93:
push    word ptr ds:4068h
cmp     word ptr ds:4066h, 0
jz      short loc_1BFA3
mov     ax, 2
jmp     short loc_1BFA6

loc_1BFA3:
mov     ax, 1

loc_1BFA6:
push    ax
call    sub_1BEC2

locret_1BFAA:
retn
sub_1BF6A endp



; Attributes: bp-based frame

sub_1BFAB proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
mov     si, ds:4068h

loc_1BFB4:
mov     ax, si
add     ax, [bp+arg_0]
jnz     short loc_1BFC0
mov     ax, ds:4068h
jmp     short loc_1BFDD

loc_1BFC0:
add     si, [bp+arg_0]
mov     ax, si
push    ax
call    sub_30C40
mov     di, ax
cmp     di, 6
jge     short loc_1BFB4
or      di, di
jnz     short loc_1BFDB
mov     ax, ds:4068h
jmp     short loc_1BFDD

loc_1BFDB:
mov     ax, si

loc_1BFDD:
pop     di
pop     si
pop     bp
retn    2
sub_1BFAB endp




sub_1BFE3 proc near
cmp     byte ptr ds:47D0h, 20h ; ' '
jz      short locret_1C032
mov     word ptr ds:4068h, 1
jmp     short loc_1C019

loc_1BFF2:
push    word ptr ds:4068h
call    sub_30C40
or      ax, ax
jz      short loc_1C015
push    ds
mov     ax, 47D0h
push    ax
push    word ptr ds:0BFAEh
push    word ptr ds:0BFACh
call    sub_46D55
or      ax, ax
jz      short loc_1C022

loc_1C015:
inc     word ptr ds:4068h

loc_1C019:
mov     ax, ds:4068h
cmp     ax, ds:0BFBAh
jle     short loc_1BFF2

loc_1C022:
mov     word ptr ds:947Ch, 0
mov     ax, 1
push    ax
call    sub_1BFAB
mov     ds:4068h, ax

locret_1C032:
retn
sub_1BFE3 endp



; Attributes: bp-based frame

sub_1C033 proc near

var_56= word ptr -56h
var_54= dword ptr -54h
var_50= byte ptr -50h

push    bp
mov     bp, sp
sub     sp, 56h
push    si
push    di
mov     ax, ds:0BFBAh
cmp     ax, ds:4068h
jl      short loc_1C088
mov     ax, ds:0BFACh
or      ax, ds:0BFAEh
jz      short loc_1C088
les     bx, ds:0BFACh
cmp     byte ptr es:[bx], 0
jz      short loc_1C088
push    word ptr ds:0BFAEh
push    bx
push    ds
mov     ax, 9877h
push    ax
call    sub_19911
or      ax, ax
jnz     short loc_1C08D
push    ss
lea     ax, [bp+var_50]
push    ax
push    word ptr ds:0BFAEh
push    word ptr ds:0BFACh
call    sub_46D76
lea     ax, [bp+var_50]
push    ax
call    sub_152EB
or      ax, ax
jnz     short loc_1C08D
call    sub_147A2

loc_1C088:
xor     ax, ax
jmp     loc_1C16B

loc_1C08D:
push    ds
mov     ax, 942Ch
push    ax
push    ds
mov     ax, 9877h
push    ax
call    sub_19911
or      ax, ax
jnz     short loc_1C0C8
mov     ax, 942Ch
push    ax
mov     ax, 9877h
push    ax
call    sub_19458
push    ds
mov     ax, 942Ch
push    ax
call    sub_30B00
push    word ptr ds:4068h
call    sub_30C40
les     bx, ds:0BFBCh
mov     word ptr ds:1C7Ch, es
mov     ds:1C7Ah, bx

loc_1C0C8:
mov     ax, ds:1C68h
and     ax, 0FFDFh
or      ax, 300h
mov     ds:1C68h, ax
les     bx, ds:0BFBCh
mov     word ptr [bp+var_54+2], es
mov     word ptr [bp+var_54], bx
xor     si, si
jmp     short loc_1C0E7

loc_1C0E2:
add     word ptr [bp+var_54], 4
inc     si

loc_1C0E7:
les     bx, [bp+var_54]
mov     ax, es:[bx+2]
cmp     ax, ds:4068h
jz      short loc_1C0FA
cmp     word ptr es:[bx], 0FFFFh
jnz     short loc_1C0E2

loc_1C0FA:
les     bx, [bp+var_54]
cmp     word ptr es:[bx], 0FFFFh
jnz     short loc_1C11C
and     word ptr ds:1C68h, 0FEFFh
mov     ax, ds:1FF2h
mov     dx, 52h ; 'R'
mul     dx
mov     bx, ax
mov     ax, [bx-71D1h]
mov     ds:1C96h, ax
jmp     short loc_1C13E

loc_1C11C:
les     bx, [bp+var_54]
mov     ax, es:[bx]
mov     [bp+var_56], ax
cmp     ax, ds:1C94h
jbe     short loc_1C134
mov     ax, ds:1C94h
mov     [bp+var_56], ax
mov     es:[bx], ax

loc_1C134:
mov     ax, [bp+var_56]
mov     ds:1C96h, ax
mov     ds:1CB2h, si

loc_1C13E:
mov     di, ds:4068h
jmp     short loc_1C164

loc_1C144:
push    di
call    sub_30C40
cmp     ax, 6
jnz     short loc_1C163
push    ds
mov     ax, 98C7h
push    ax
push    word ptr ds:0BFAEh
push    word ptr ds:0BFACh
call    sub_46D76
jmp     short loc_1C168

loc_1C163:
dec     di

loc_1C164:
or      di, di
jg      short loc_1C144

loc_1C168:
mov     ax, 1

loc_1C16B:
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_1C033 endp



; Attributes: bp-based frame

sub_1C171 proc near

var_1= byte ptr -1

push    bp
mov     bp, sp
sub     sp, 2
push    si
cmp     word ptr ds:23C1h, 0
jnz     short loc_1C182
jmp     loc_1C239

loc_1C182:
xor     ax, ax
push    ax
call    sub_1B056
or      ax, ax
jnz     short loc_1C18F
jmp     loc_1C239

loc_1C18F:
cmp     word ptr ds:4066h, 0
jz      short loc_1C1CF
push    word ptr ds:4068h
call    sub_30C40
cmp     ax, 7
jz      short loc_1C1CF
mov     ax, ds:0BFACh
or      ax, ds:0BFAEh
jz      short loc_1C1CF
push    word ptr ds:0BFAEh
push    word ptr ds:0BFACh
push    ds
mov     ax, 9877h
push    ax
call    sub_19911
or      ax, ax
jnz     short loc_1C1C8
cmp     word ptr ds:23C1h, 2
jz      short loc_1C1CF

loc_1C1C8:
call    sub_1C033
or      ax, ax
jnz     short loc_1C1D7

loc_1C1CF:
mov     al, 1Bh
push    ax
call    sub_14C12
jmp     short loc_1C239

loc_1C1D7:
xor     ax, ax
push    ax
call    sub_1ACE5
and     word ptr ds:1C68h, 0FEFFh
mov     al, 1Bh
push    ax
call    sub_14C12
mov     [bp+var_1], 50h ; 'P'
mov     bx, ds:490Dh
mov     al, [bx+4]
mov     ah, 0
mov     si, ax
mov     cl, 8
shl     si, cl
or      si, 2Ah
mov     ax, 1
push    ax
xor     ax, ax
push    ax
lea     ax, [bp+var_1]
push    ax
push    si
call    sub_1EB6C
mov     [bp+var_1], 1
mov     bx, ds:490Dh
mov     al, [bx+5]
mov     ah, 0
mov     si, ax
mov     cl, 8
shl     si, cl
or      si, 2Ah
xor     ax, ax
push    ax
push    ax
lea     ax, [bp+var_1]
push    ax
push    si
call    sub_1EB6C
mov     ax, 1
push    ax
call    sub_1ACE5

loc_1C239:
pop     si
mov     sp, bp
pop     bp
retn
sub_1C171 endp



; Attributes: bp-based frame

sub_1C23E proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
cmp     word ptr ds:0BFBAh, 0
jz      short loc_1C28B
mov     word ptr ds:4066h, 0
mov     ax, 47D0h
push    ax
mov     ax, 406Ah
push    ax
call    sub_19458
call    sub_147A2
push    [bp+arg_0]
call    sub_30913
xor     ax, ax
mov     ds:4726h, ax
mov     ds:9961h, ax
mov     ds:995Fh, ax
mov     ds:0BFAAh, ax
mov     ds:0BFA8h, ax
cwd
mov     ds:99B7h, dx
mov     ds:99B5h, ax
cmp     [bp+arg_0], ax
jnz     short loc_1C28B
mov     ax, 1
mov     ds:4068h, ax
mov     ds:947Ch, ax

loc_1C28B:
pop     bp
retn    2
sub_1C23E endp



; Attributes: bp-based frame

sub_1C28F proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     word ptr ds:9166h, 0
mov     ax, [bp+arg_0]
mov     ds:4066h, ax
or      ax, ax
jz      short loc_1C2B0
mov     ax, 1
push    ax
call    sub_1B2A2
mov     ax, 1
push    ax
call    sub_1AE6D

loc_1C2B0:
call    sub_1BF6A
cmp     word ptr ds:0BFBAh, 0
jz      short loc_1C2BD
call    sub_1C171

loc_1C2BD:
pop     bp
retn    2
sub_1C28F endp



; Attributes: bp-based frame

sub_1C2C1 proc near

var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 8
push    si
push    di
mov     [bp+var_2], 0FFFFh
mov     di, ds:4068h
mov     [bp+var_6], di
mov     ax, ds:947Ch
mov     [bp+var_8], ax
mov     ax, ds:9166h
mov     [bp+var_4], ax
mov     ax, 1
push    ax
call    sub_1C28F
cmp     word ptr ds:0BFBAh, 0
jz      short loc_1C2FB
xor     ax, ax
push    ax
call    sub_1DC39
push    ax
call    sub_1DCCB
jmp     short loc_1C306

loc_1C2FB:
mov     ax, 1
push    ax
call    sub_1DC39
push    ax
call    sub_1DCCB

loc_1C306:
push    word ptr ds:4068h
call    sub_30C40
dec     ax              ; switch 5 cases
cmp     ax, 4
ja      short def_1C319 ; jumptable 0001C319 default case
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_1C319[bx] ; switch jump
jpt_1C319 dw offset loc_1C328 ; jump table for switch statement
dw offset loc_1C328
dw offset loc_1C328
dw offset loc_1C328
dw offset loc_1C328

loc_1C328:              ; jumptable 0001C319 cases 1-5
mov     ax, ds:0BFC4h
add     ax, 1F4h
mov     ds:1DD3h, ax
jmp     short loc_1C339

def_1C319:              ; jumptable 0001C319 default case
mov     word ptr ds:1DD3h, 0F1h

loc_1C339:
mov     word ptr ds:40DAh, 0
push    word ptr ds:0BFBAh
push    word ptr ds:947Eh
mov     ax, 4068h
push    ax
mov     ax, 947Ch
push    ax
call    sub_1927C
mov     si, ax
mov     ax, si
cmp     ax, 0FFFFh
jge     short loc_1C35E
jmp     loc_1C3FA

loc_1C35E:
mov     ax, ds:947Ch
cmp     ax, [bp+var_8]
jz      short loc_1C36B
call    sub_1BF31
jmp     short loc_1C384

loc_1C36B:
mov     ax, ds:4068h
cmp     ax, di
jz      short loc_1C378
push    di
call    sub_1BF54
jmp     short loc_1C381

loc_1C378:
mov     ax, [bp+var_4]
cmp     ax, ds:9166h
jz      short loc_1C384

loc_1C381:
call    sub_1BF6A

loc_1C384:
mov     ax, ds:947Ch
mov     [bp+var_8], ax
mov     di, ds:4068h
mov     ax, ds:9166h
mov     [bp+var_4], ax
cmp     si, 4
jnz     short loc_1C3D9
push    di
call    sub_30C40
cmp     ax, 7
jz      short loc_1C3D9
mov     ax, ds:0BFACh
or      ax, ds:0BFAEh
jz      short loc_1C3D9
xor     ax, ax
push    ax
call    sub_1C28F
xor     ax, ax
push    ax
call    sub_1AE6D
mov     ax, ds:23C1h
mov     [bp+var_2], ax
mov     word ptr ds:23C1h, 1
push    word ptr ds:4068h
call    sub_30C40
call    sub_1C033
mov     ax, [bp+var_2]
mov     ds:23C1h, ax
jmp     short loc_1C3FA

loc_1C3D9:
mov     ax, ds:4068h
cmp     ax, [bp+var_6]
jnz     short loc_1C3E4
jmp     loc_1C306

loc_1C3E4:
call    sub_157A7
or      ax, ax
jz      short loc_1C3EE
jmp     loc_1C306

loc_1C3EE:
mov     ax, ds:4068h
mov     [bp+var_6], ax
call    sub_1C171
jmp     loc_1C306

loc_1C3FA:
call    sub_17CEE
cmp     si, 4
jnz     short loc_1C407
mov     si, 600h
jmp     short loc_1C412

loc_1C407:
cmp     si, 0FFFDh
jz      short loc_1C412
xor     ax, ax
push    ax
call    sub_1C28F

loc_1C412:
mov     ax, si
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_1C2C1 endp



; Attributes: bp-based frame

sub_1C41A proc near

var_46= byte ptr -46h
var_42= byte ptr -42h
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
sub     sp, 46h
push    ds
push    [bp+arg_4]
lea     ax, [bp+var_46]
push    ax
lea     ax, [bp+var_42]
push    ax
mov     ax, 96E2h
push    ax
mov     ax, 96F6h
push    ax
call    sub_19500
mov     ds:974Dh, ax
cmp     [bp+arg_0], 0
jnz     short loc_1C445
test    ax, 2
jnz     short loc_1C465

loc_1C445:
push    ds
push    [bp+arg_4]
lea     ax, [bp+var_46]
push    ax
lea     ax, [bp+var_42]
push    ax
mov     ax, 96E2h
push    ax
push    [bp+arg_2]
call    sub_19777
mov     ax, 96F6h
push    ax
push    [bp+arg_2]
call    sub_19458

loc_1C465:
mov     sp, bp
pop     bp
retn    6
sub_1C41A endp



; Attributes: bp-based frame

sub_1C46B proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    word ptr ds:40BEh
push    [bp+arg_0]
call    sub_19458
push    word ptr ds:40BEh
call    sub_19448
mov     ds:9482h, ax
mov     ds:968Ch, ax
les     bx, ds:40BEh
add     bx, ax
mov     byte ptr es:[bx], 1Ah
mov     word ptr ds:9484h, 0
pop     bp
retn    2
sub_1C46B endp




sub_1C499 proc near
push    si
push    di
xor     di, di
mov     ax, di
mov     ds:9484h, ax
mov     ds:9482h, ax
mov     word ptr ds:40C0h, ds
mov     word ptr ds:40BEh, 948Ah
cmp     byte ptr ds:406Ch, 0
jnz     short loc_1C4D9
mov     ax, 96FDh
push    ax
call    sub_1D347
push    ax
call    sub_19458
push    ax
mov     ax, 0E56h
push    ax
xor     ax, ax
push    ax
call    sub_1C41A
mov     ax, 96FDh
push    ax
call    sub_1C46B
mov     si, 0FFFEh
jmp     loc_1C54A

loc_1C4D9:
mov     ax, 96FDh
push    ax
mov     ax, 406Ch
push    ax
call    sub_19458
push    ax
mov     ax, 1AF6h
push    ax
xor     ax, ax
push    ax
call    sub_1C41A
push    ds
mov     ax, 96FDh
push    ax
call    sub_11C48
or      ax, ax
jz      short loc_1C51D
mov     si, 0FFFFh
mov     ax, ds:1C94h
mov     ds:9482h, ax
mov     ds:968Ch, ax
mov     word ptr ds:9484h, 0
les     bx, ds:1C86h
mov     word ptr ds:40C0h, es
mov     ds:40BEh, bx
jmp     short loc_1C54A

loc_1C51D:
push    ds
mov     ax, 96FDh
push    ax
xor     ax, ax
push    ax
call    sub_106E6
mov     si, ax
cmp     si, 0FFFEh
jz      short loc_1C534
cmp     si, 0FFFDh
jnz     short loc_1C539

loc_1C534:
mov     di, 0E1Fh
jmp     short loc_1C54A

loc_1C539:
cmp     si, 0FFFBh
jnz     short loc_1C543
mov     di, 0E30h
jmp     short loc_1C54A

loc_1C543:
or      si, si
jg      short loc_1C54A
mov     di, 1A35h

loc_1C54A:
or      di, di
jz      short loc_1C558
push    di
mov     ax, 96FDh
push    ax
call    sub_19065
xor     si, si

loc_1C558:
mov     ax, 96EDh
push    ax
mov     ax, 96E2h
push    ax
call    sub_19458
mov     ax, si
pop     di
pop     si
retn
sub_1C499 endp



; Attributes: bp-based frame

sub_1C568 proc near

var_4= dword ptr -4

push    bp
mov     bp, sp
sub     sp, 4
mov     ax, ds:9484h
cmp     ax, ds:9482h
jb      short loc_1C5AD
cmp     word ptr ds:96FBh, 0
jl      short loc_1C5AD
push    word ptr ds:96FBh
push    word ptr ds:40C0h
push    word ptr ds:40BEh
mov     ax, 200h
push    ax
call    sub_10740
mov     ds:9482h, ax
or      ax, ax
jge     short loc_1C5A7
mov     ax, 1A53h
push    ax
xor     ax, ax
push    ax
call    sub_19065
mov     ax, 0FFFFh
jmp     short loc_1C5DA

loc_1C5A7:
mov     word ptr ds:9484h, 0

loc_1C5AD:
cmp     word ptr ds:9482h, 0
jz      short loc_1C5C8
les     bx, ds:40BEh
add     bx, ds:9484h
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
cmp     byte ptr es:[bx], 1Ah
jnz     short loc_1C5CC

loc_1C5C8:
xor     ax, ax
jmp     short loc_1C5DA

loc_1C5CC:
les     bx, [bp+var_4]
mov     al, es:[bx]
mov     ah, 0
push    ax
call    sub_46F25

loc_1C5DA:
mov     sp, bp
pop     bp
retn
sub_1C568 endp




sub_1C5DE proc near
push    si
call    sub_1C568
mov     si, ax
inc     word ptr ds:9484h
mov     ax, si
pop     si
retn
sub_1C5DE endp




sub_1C5EC proc near
mov     ax, 1A79h
push    ax
xor     ax, ax
push    ax
call    sub_19065
retn
sub_1C5EC endp



; Attributes: bp-based frame

sub_1C5F7 proc near

var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 2
jmp     short loc_1C60F

loc_1C5FF:
push    [bp+arg_0]
push    [bp+var_2]
call    sub_194AB
or      ax, ax
jz      short loc_1C619
call    sub_1C5DE

loc_1C60F:
call    sub_1C568
mov     [bp+var_2], ax
or      ax, ax
jg      short loc_1C5FF

loc_1C619:
mov     ax, [bp+var_2]
mov     sp, bp
pop     bp
retn    2
sub_1C5F7 endp



; Attributes: bp-based frame

sub_1C622 proc near

var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
mov     si, [bp+arg_0]
mov     di, 1

loc_1C630:
mov     ax, 40C4h
push    ax
call    sub_1C5F7
mov     [bp+var_2], ax
cmp     ax, 28h ; '('
jnz     short loc_1C670
cmp     word ptr ds:9480h, 0
jnz     short loc_1C670
jmp     short loc_1C656

loc_1C648:
call    sub_1C5DE
call    sub_1C568
cmp     ax, 28h ; '('
jnz     short loc_1C656
jmp     loc_1C6ED

loc_1C656:
call    sub_1C568
mov     [bp+var_2], ax
or      ax, ax
jle     short loc_1C665
cmp     ax, 29h ; ')'
jnz     short loc_1C648

loc_1C665:
cmp     [bp+var_2], 0
jle     short loc_1C689
call    sub_1C5DE
jmp     short loc_1C630

loc_1C670:
cmp     [bp+var_2], 28h ; '('
jnz     short loc_1C679
jmp     loc_1C6ED

loc_1C679:
cmp     [bp+var_2], 29h ; ')'
jnz     short loc_1C689
cmp     word ptr ds:9480h, 0
jnz     short loc_1C689
jmp     loc_1C6ED

loc_1C689:
cmp     [bp+var_2], 0
jle     short loc_1C6DE
jmp     short loc_1C6C1

loc_1C691:
mov     ax, 40C2h
push    ax
push    [bp+var_2]
call    sub_194AB
or      ax, ax
jnz     short loc_1C6B2
mov     al, byte ptr [bp+var_2]
mov     [si], al
inc     si
inc     di
mov     ax, di
cmp     ax, 4Fh ; 'O'
jz      short loc_1C6CB
call    sub_1C5DE
jmp     short loc_1C6C1

loc_1C6B2:
cmp     [bp+var_2], 28h ; '('
jnz     short loc_1C6CB
cmp     word ptr ds:9480h, 0
jz      short loc_1C6CB
jmp     short loc_1C6ED

loc_1C6C1:
call    sub_1C568
mov     [bp+var_2], ax
or      ax, ax
jg      short loc_1C691

loc_1C6CB:
mov     byte ptr [si], 0
cmp     [bp+var_2], 0FFFFh
jnz     short loc_1C6D9
mov     ax, 0FFFFh
jmp     short loc_1C6DC

loc_1C6D9:
mov     ax, 1

loc_1C6DC:
jmp     short loc_1C6F3

loc_1C6DE:
cmp     [bp+var_2], 0FFFFh
jnz     short loc_1C6E9
mov     ax, 0FFFFh
jmp     short loc_1C6EB

loc_1C6E9:
xor     ax, ax

loc_1C6EB:
jmp     short loc_1C6F3

loc_1C6ED:
call    sub_1C5EC
mov     ax, 0FFFEh

loc_1C6F3:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_1C622 endp



; Attributes: bp-based frame

sub_1C6FB proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
mov     ax, 96F6h
push    ax
push    [bp+arg_0]
call    sub_19497
or      ax, ax
jnz     short loc_1C711
mov     ax, 1
jmp     short loc_1C713

loc_1C711:
xor     ax, ax

loc_1C713:
pop     bp
retn    2
sub_1C6FB endp




sub_1C717 proc near
cmp     byte ptr ds:96E2h, 43h ; 'C'
jnz     short loc_1C732
mov     ax, 1AA0h
push    ax
push    word ptr ds:96E3h
call    sub_194AB
or      ax, ax
jz      short loc_1C732
mov     ax, 1
jmp     short locret_1C734

loc_1C732:
xor     ax, ax

locret_1C734:
retn
sub_1C717 endp



; Attributes: bp-based frame

sub_1C735 proc near

var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
mov     si, [bp+arg_2]
or      si, si
jz      short loc_1C749
cmp     byte ptr [si], 0
jnz     short loc_1C74E

loc_1C749:
xor     ax, ax
jmp     short loc_1C794

loc_1C74D:
inc     si

loc_1C74E:
cmp     byte ptr [si], 0
jz      short loc_1C760
mov     ax, 40D4h
push    ax
push    word ptr [si]
call    sub_194AB
or      ax, ax
jnz     short loc_1C74D

loc_1C760:
mov     di, si
jmp     short loc_1C765

loc_1C764:
inc     di

loc_1C765:
cmp     byte ptr [di], 0
jz      short loc_1C777
mov     ax, 40D4h
push    ax
push    word ptr [di]
call    sub_194AB
or      ax, ax
jz      short loc_1C764

loc_1C777:
push    [bp+arg_0]
push    si
mov     ax, di
sub     ax, si
mov     [bp+var_2], ax
push    ax
call    sub_1946C
mov     bx, [bp+arg_0]
add     bx, [bp+var_2]
mov     byte ptr [bx], 0
mov     ax, si
add     ax, [bp+var_2]

loc_1C794:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    4
sub_1C735 endp



; Attributes: bp-based frame

sub_1C79C proc near

var_116= byte ptr -116h
var_115= byte ptr -115h
var_114= byte ptr -114h
var_D2= byte ptr -0D2h
var_50= byte ptr -50h
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 116h
push    si
lea     si, [bp+var_D2]
lea     ax, [bp+var_50]
push    ax
push    [bp+arg_2]
call    sub_19458
push    ax
call    sub_19C1B
cmp     [bp+arg_0], 0
jz      short loc_1C7D3
lea     ax, [bp+var_D2]
push    ax
mov     ax, 40D7h
push    ax
call    sub_19458
push    ax
mov     ax, 2D84h
push    ax
call    sub_19483
jmp     loc_1C849

loc_1C7D3:
cmp     byte ptr ds:2D84h, 0
jz      short loc_1C7E8
lea     ax, [bp+var_D2]
push    ax
mov     ax, 2D84h
push    ax
call    sub_19458
jmp     short loc_1C849

loc_1C7E8:
lea     ax, [bp+var_D2]
push    ax
mov     ax, 40D7h
push    ax
call    sub_19458
jmp     short loc_1C849

loc_1C7F6:
cmp     [bp+var_115], 3Ah ; ':'
jnz     short loc_1C819
mov     al, [bp+var_116]
mov     ds:91CDh, al
mov     word ptr ds:91CEh, 3Ah ; ':'
lea     ax, [bp+var_116]
push    ax
lea     ax, [bp+var_114]
push    ax
call    sub_19458
jmp     short loc_1C81E

loc_1C819:
mov     byte ptr ds:91CDh, 0

loc_1C81E:
mov     ax, 9179h
push    ax
lea     ax, [bp+var_116]
push    ax
call    sub_19458
lea     ax, [bp+var_50]
push    ax
call    sub_19C39
push    ss
lea     ax, [bp+var_50]
push    ax
call    sub_105F1
or      ax, ax
jz      short loc_1C849
push    [bp+arg_2]
lea     ax, [bp+var_50]
push    ax
call    sub_19458
jmp     short loc_1C858

loc_1C849:
push    si
lea     ax, [bp+var_116]
push    ax
call    sub_1C735
mov     si, ax
or      ax, ax
jnz     short loc_1C7F6

loc_1C858:
pop     si
mov     sp, bp
pop     bp
retn    4
sub_1C79C endp




sub_1C85F proc near
push    ds
mov     ax, 96E2h
push    ax
push    ds
mov     ax, 1AFBh
push    ax
mov     ax, 2
push    ax
call    sub_46E7B
or      ax, ax
jnz     short loc_1C886
mov     ax, 120Ah
push    ax
call    sub_1C6FB
or      ax, ax
jz      short loc_1C886
mov     ax, 1
jmp     short locret_1C888

loc_1C886:
xor     ax, ax

locret_1C888:
retn
sub_1C85F endp



; Attributes: bp-based frame

sub_1C889 proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 4
cmp     word ptr ds:96EBh, 0
jnz     short loc_1C8CC
push    ds
push    [bp+arg_0]
call    sub_11CC1
mov     [bp+var_2], dx
mov     [bp+var_4], ax
cmp     dx, 0FFFFh
jnz     short loc_1C8AF
cmp     ax, 0FFFFh
jz      short loc_1C8C6

loc_1C8AF:
push    ds
push    [bp+arg_0]
call    sub_11CC1
cmp     dx, ds:9488h
jl      short loc_1C8CC
jg      short loc_1C8C6
cmp     ax, ds:9486h
jbe     short loc_1C8CC

loc_1C8C6:
mov     word ptr ds:96EBh, 1

loc_1C8CC:
mov     sp, bp
pop     bp
retn    2
sub_1C889 endp



; Attributes: bp-based frame

sub_1C8D2 proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
push    [bp+arg_4]
mov     ax, 2D40h
push    ax
call    sub_19458
push    ax
call    sub_19743
push    ax
push    [bp+arg_2]
call    sub_19483
push    ax
push    [bp+arg_0]
call    sub_19483
pop     bp
retn    6
sub_1C8D2 endp



; Attributes: bp-based frame

sub_1C8F5 proc near

var_4= dword ptr -4
arg_0= dword ptr  4
arg_4= word ptr  8

push    bp
mov     bp, sp
sub     sp, 4
push    si
mov     si, [bp+arg_4]
push    si
call    sub_1943A
push    ds
push    si
call    sub_46E60
add     ax, 5
push    ax
call    sub_3193F
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
les     bx, [bp+arg_0]
mov     es:[bx+2], dx
mov     es:[bx], ax
add     ax, 4
push    dx
push    ax
push    ds
push    si
call    sub_46D76
les     bx, [bp+var_4]
mov     word ptr es:[bx+2], 0
mov     word ptr es:[bx], 0
mov     dx, word ptr [bp+var_4+2]
mov     ax, bx
pop     si
mov     sp, bp
pop     bp
retn    6
sub_1C8F5 endp



; Attributes: bp-based frame

sub_1C949 proc near

var_50= byte ptr -50h
var_4E= byte ptr -4Eh
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 50h
lea     ax, [bp+var_50]
push    ax
mov     ax, 1AFEh
push    ax
call    sub_19458
mov     al, ds:22B1h
cbw
mov     dx, 0Bh
mul     dx
mov     bx, ax
mov     al, [bx+2B13h]
mov     [bp+var_4E], al
lea     ax, [bp+var_50]
push    ax
xor     ax, ax
push    ax
call    sub_1C79C
lea     ax, [bp+var_50]
push    ax
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1C8F5
mov     sp, bp
pop     bp
retn    4
sub_1C949 endp



; Attributes: bp-based frame

sub_1C989 proc near

var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
mov     si, 7
mov     di, 0FFFFh
mov     ax, 2
push    ax
call    sub_1B6D0
push    ds
inc     word ptr ds:1DE8h
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jz      short loc_1C9BB
jmp     loc_1CA3C

loc_1C9BB:
call    sub_1C499
mov     ds:96FBh, ax
or      ax, ax
jnz     short loc_1C9C8
jmp     loc_1CA3C

loc_1C9C8:
jmp     short loc_1CA26

loc_1C9CA:
cmp     [bp+var_2], 0
jge     short loc_1C9D5
mov     si, 5
jmp     short loc_1CA34

loc_1C9D5:
mov     ax, 96FDh
push    ax
mov     ax, 0E56h
push    ax
xor     ax, ax
push    ax
call    sub_1C41A
call    sub_12609
or      ax, ax
jz      short loc_1C9EF
mov     si, 4
jmp     short loc_1CA34

loc_1C9EF:
mov     ax, 120Ah
push    ax
call    sub_1C6FB
or      ax, ax
jnz     short loc_1CA26
mov     ax, 1ACAh
push    ax
call    sub_1C6FB
or      ax, ax
jnz     short loc_1CA26
mov     ax, 96FDh
push    ax
call    sub_19C1B
mov     ax, 96FDh
push    ax
mov     ax, 9170h
push    ax
mov     ax, 120Ah
push    ax
call    sub_1C8D2
mov     ax, 96FDh
push    ax
xor     ax, ax
push    ax
push    ax
call    sub_11CE4

loc_1CA26:
mov     ax, 96FDh
push    ax
call    sub_1C622
mov     [bp+var_2], ax
or      ax, ax
jnz     short loc_1C9CA

loc_1CA34:
cmp     si, 7
jnz     short loc_1CA3C
mov     di, 7

loc_1CA3C:
cmp     di, 0FFFFh
jnz     short loc_1CA4B
push    si
call    sub_1B845
or      ax, ax
jz      short loc_1CA4B
mov     di, ax

loc_1CA4B:
cmp     word ptr ds:96FBh, 0
jle     short loc_1CA59
push    word ptr ds:96FBh
call    sub_10728

loc_1CA59:
dec     word ptr ds:1DE8h
mov     ax, di
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_1C989 endp



; Attributes: bp-based frame

sub_1CA65 proc near

var_54= byte ptr -54h
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 54h
push    si
push    di
xor     si, si
mov     ax, 40C3h
push    ax
call    sub_1C5F7
cmp     ax, 28h ; '('
jz      short loc_1CA7E
jmp     loc_1CAED

loc_1CA7E:
call    sub_1C5DE
inc     word ptr ds:9480h
jmp     short loc_1CACE

loc_1CA87:
push    ss
lea     ax, [bp+var_54]
push    ax
call    sub_11CC1
mov     [bp+var_2], dx
mov     [bp+var_4], ax
cmp     dx, [bp+arg_2]
jl      short loc_1CAA6
jg      short loc_1CAA3
cmp     ax, [bp+arg_0]
jbe     short loc_1CAA6

loc_1CAA3:
mov     si, 1

loc_1CAA6:
cmp     [bp+var_2], 0FFFFh
jnz     short loc_1CAC2
cmp     [bp+var_4], 0FFFFh
jnz     short loc_1CAC2
mov     ax, 1AA7h
push    ax
lea     ax, [bp+var_54]
push    ax
call    sub_19065
mov     di, 0FFFFh
jmp     short loc_1CADD

loc_1CAC2:
mov     ax, 40C4h
push    ax
call    sub_1C5F7
cmp     ax, 29h ; ')'
jz      short loc_1CADD

loc_1CACE:
lea     ax, [bp+var_54]
push    ax
call    sub_1C622
mov     di, ax
mov     ax, di
or      ax, ax
jg      short loc_1CA87

loc_1CADD:
dec     word ptr ds:9480h
or      di, di
jge     short loc_1CAEA
mov     si, 0FFFFh
jmp     short loc_1CAED

loc_1CAEA:
call    sub_1C5DE

loc_1CAED:
mov     ax, si
pop     di
pop     si
mov     sp, bp
pop     bp
retn    4
sub_1CA65 endp



; Attributes: bp-based frame

sub_1CAF7 proc near

var_58= word ptr -58h
var_56= word ptr -56h
var_54= word ptr -54h
var_52= word ptr -52h
var_50= byte ptr -50h
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 58h
push    si
xor     si, si
mov     ax, 96FDh
push    ax
call    sub_19C1B
lea     ax, [bp+var_50]
push    ax
mov     ax, 9170h
push    ax
mov     ax, 120Ah
push    ax
call    sub_1C8D2
lea     ax, [bp+var_50]
push    ax
push    word ptr ds:40CEh
push    word ptr ds:40CCh
call    sub_1C8F5
mov     ds:40CEh, dx
mov     ds:40CCh, ax
cmp     [bp+arg_0], 6
jnz     short loc_1CB35
jmp     loc_1CC09

loc_1CB35:
push    ss
lea     ax, [bp+var_50]
push    ax
call    sub_11CC1
mov     [bp+var_52], dx
mov     [bp+var_54], ax
or      ax, dx
jnz     short loc_1CB4C
jmp     loc_1CBE3

loc_1CB4C:
cmp     dx, 0FFFFh
jnz     short loc_1CB5A
cmp     [bp+var_54], 0FFFFh
jnz     short loc_1CB5A
jmp     loc_1CBE3

loc_1CB5A:
mov     dx, ds:9488h
mov     ax, ds:9486h
cmp     dx, [bp+var_52]
jg      short loc_1CB72
jl      short loc_1CB6D
cmp     ax, [bp+var_54]
jnb     short loc_1CB72

loc_1CB6D:
mov     ax, 1
jmp     short loc_1CB74

loc_1CB72:
xor     ax, ax

loc_1CB74:
or      ds:96EBh, ax
cmp     word ptr ds:31E0h, 0
jz      short loc_1CB95
lea     ax, [bp+var_50]
push    ax
push    [bp+var_52]
push    [bp+var_54]
call    sub_1B368
or      ax, ax
jnz     short loc_1CB93
jmp     loc_1CC09

loc_1CB93:
jmp     short loc_1CBE3

loc_1CB95:
push    ds
mov     ax, 96FDh
push    ax
call    sub_11CC1
mov     [bp+var_56], dx
mov     [bp+var_58], ax
or      dx, ax
jz      short loc_1CBE3
cmp     [bp+var_56], 0FFFFh
jnz     short loc_1CBB4
cmp     ax, 0FFFFh
jz      short loc_1CBE3

loc_1CBB4:
mov     dx, [bp+var_52]
mov     ax, [bp+var_54]
cmp     dx, [bp+var_56]
jl      short loc_1CBE3
jnz     short loc_1CBC6
cmp     ax, [bp+var_58]
jb      short loc_1CBE3

loc_1CBC6:
push    [bp+var_52]
push    [bp+var_54]
call    sub_1CA65
mov     si, ax
mov     ax, si
or      ax, ax
jg      short loc_1CBE3
cmp     si, 0FFFFh
jnz     short loc_1CC09
mov     [bp+arg_0], 5
jmp     short loc_1CC03

loc_1CBE3:
mov     word ptr ds:96EBh, 1
cmp     word ptr ds:93D2h, 0
jnz     short loc_1CBF6
xor     ax, ax
push    ax
call    sub_1B77F

loc_1CBF6:
mov     ax, 96FDh
push    ax
call    sub_1D234
cmp     ax, ds:31C5h
jle     short loc_1CC09

loc_1CC03:
mov     word ptr ds:968Ah, 0

loc_1CC09:
pop     si
mov     sp, bp
pop     bp
retn    2
sub_1CAF7 endp



; Attributes: bp-based frame

sub_1CC10 proc near

var_5= byte ptr -5
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 6
push    si
push    di
mov     si, [bp+arg_0]
mov     [bp+var_4], 0FFFFh
mov     [bp+var_2], 0
mov     word ptr ds:96FBh, 0
mov     word ptr ds:40CEh, ds
mov     word ptr ds:40CCh, 2314h
mov     word ptr ds:40D2h, ds
mov     word ptr ds:40D0h, 2320h
cmp     si, 6
jnz     short loc_1CC49
mov     ax, 1
jmp     short loc_1CC4B

loc_1CC49:
xor     ax, ax

loc_1CC4B:
mov     ds:96EBh, ax
mov     word ptr ds:968Ah, 1
call    sub_1BDD1
push    si
call    sub_1B6D0
mov     word ptr ds:93D2h, 0
push    ds
inc     word ptr ds:1DE8h
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jz      short loc_1CC7E
jmp     loc_1CFF3

loc_1CC7E:
call    sub_1C499
mov     ds:96FBh, ax
or      ax, ax
jnz     short loc_1CC8B
jmp     loc_1CFF3

loc_1CC8B:
mov     word ptr ds:2322h, 0
mov     word ptr ds:2320h, 0
xor     bx, bx
mov     es, bx
assume es:nothing
mov     word ptr ds:231Eh, es
mov     ds:231Ch, bx
mov     word ptr ds:2316h, es
mov     ds:2314h, bx
mov     word ptr ds:231Ah, es
mov     ds:2318h, bx
mov     ax, 96FDh
push    ax
mov     ax, 96EDh
push    ax
mov     ax, 120Fh
push    ax
call    sub_1C8D2
mov     ax, 9692h
push    ax
mov     ax, 96FDh
push    ax
call    sub_19C57
push    ds
mov     ax, 9692h
push    ax
call    sub_11CC1
mov     ds:9488h, dx
mov     ds:9486h, ax
mov     word ptr ds:231Ah, ds
mov     word ptr ds:2318h, 968Eh
cmp     word ptr ds:96EBh, 0
jnz     short loc_1CD3B
push    ds
mov     ax, 96FDh
push    ax
call    sub_105F1
or      ax, ax
jnz     short loc_1CD05
mov     word ptr ds:96EBh, 1
jmp     short loc_1CD16

loc_1CD05:
push    ds
mov     ax, 96FDh
push    ax
call    sub_11CC1
mov     ds:9488h, dx
mov     ds:9486h, ax

loc_1CD16:
cmp     word ptr ds:96FBh, 0FFFFh
jl      short loc_1CD3B
push    ds
mov     ax, 406Ch
push    ax
call    sub_11CC1
cmp     dx, ds:9488h
jl      short loc_1CD3B
jg      short loc_1CD35
cmp     ax, ds:9486h
jbe     short loc_1CD3B

loc_1CD35:
mov     word ptr ds:96EBh, 1

loc_1CD3B:
cmp     byte ptr ds:230Ch, 0
jz      short loc_1CD68
mov     ax, 96FDh
push    ax
mov     ax, 9692h
push    ax
call    sub_19458
mov     ax, 96FDh
push    ax
mov     ax, 1205h
push    ax
mov     ax, 1
push    ax
call    sub_1C41A
mov     ax, 96FDh
push    ax
push    ds
mov     ax, 231Ch
push    ax
call    sub_1C8F5

loc_1CD68:
mov     ax, 96FDh
push    ax
call    sub_1C622
or      ax, ax
jg      short loc_1CD76
jmp     loc_1CFF3

loc_1CD76:
mov     ax, 96FDh
push    ax
mov     ax, 0E56h
push    ax
xor     ax, ax
push    ax
call    sub_1C41A
mov     ax, 96FDh
push    ax
call    sub_1C889
call    sub_1C85F
or      ax, ax
jz      short loc_1CDA8
mov     ax, 96FDh
push    ax
push    ds
mov     ax, 2314h
push    ax
call    sub_1C8F5
mov     ds:40CEh, dx
mov     ds:40CCh, ax
jmp     loc_1CE63

loc_1CDA8:
push    ds
mov     ax, 2314h
push    ax
call    sub_1C949
mov     ds:40CEh, dx
mov     ds:40CCh, ax
jmp     short loc_1CDD0

loc_1CDB9:
or      di, di
jge     short loc_1CDC2
mov     si, 5
jmp     short loc_1CDDA

loc_1CDC2:
mov     ax, 96FDh
push    ax
mov     ax, 0E56h
push    ax
xor     ax, ax
push    ax
call    sub_1C41A

loc_1CDD0:
call    sub_12609
or      ax, ax
jz      short loc_1CDE3
mov     si, 4

loc_1CDDA:
mov     word ptr ds:968Ah, 0
jmp     loc_1CE7C

loc_1CDE3:
mov     ax, 1ACAh
push    ax
call    sub_1C6FB
or      ax, ax
jz      short loc_1CE1F
test    word ptr ds:974Dh, 18h
jnz     short loc_1CE01
mov     ax, 96FDh
push    ax
mov     ax, 1
push    ax
call    sub_1C79C

loc_1CE01:
mov     ax, 96FDh
push    ax
push    word ptr ds:40D2h
push    word ptr ds:40D0h
call    sub_1C8F5
mov     ds:40D2h, dx
mov     ds:40D0h, ax
call    sub_1C717
or      [bp+var_2], ax
jmp     short loc_1CE5C

loc_1CE1F:
mov     ax, 120Ah
push    ax
call    sub_1C6FB
or      ax, ax
jz      short loc_1CE42
mov     ax, 96FDh
push    ax
push    word ptr ds:40CEh
push    word ptr ds:40CCh
call    sub_1C8F5
mov     ds:40CEh, dx
mov     ds:40CCh, ax
jmp     short loc_1CE5C

loc_1CE42:
mov     ax, 120Ah
push    ax
call    sub_1C6FB
or      ax, ax
jnz     short loc_1CE5C
mov     ax, 1ACAh
push    ax
call    sub_1C6FB
or      ax, ax
jnz     short loc_1CE5C
push    si
call    sub_1CAF7

loc_1CE5C:
mov     ax, 96FDh
push    ax
call    sub_1C889

loc_1CE63:
cmp     word ptr ds:968Ah, 0
jz      short loc_1CE7C
mov     ax, 96FDh
push    ax
call    sub_1C622
mov     di, ax
mov     ax, di
or      ax, ax
jz      short loc_1CE7C
jmp     loc_1CDB9

loc_1CE7C:
cmp     word ptr ds:995Fh, 0
jz      short loc_1CE86
jmp     loc_1CFF3

loc_1CE86:
cmp     word ptr ds:968Ah, 0
jnz     short loc_1CE90
jmp     loc_1CFF3

loc_1CE90:
cmp     word ptr ds:31C5h, 3
jnz     short loc_1CE9F
cmp     si, 6
jz      short loc_1CE9F
jmp     loc_1CFED

loc_1CE9F:
cmp     si, 1
jnz     short loc_1CEAE
cmp     word ptr ds:96EBh, 0
jnz     short loc_1CEAE
jmp     loc_1CFF3

loc_1CEAE:
cmp     word ptr ds:96EBh, 0
jnz     short loc_1CEBF
mov     ax, 9692h
push    ax
call    sub_1B9C9
jmp     loc_1CFF3

loc_1CEBF:
mov     ax, 9692h
push    ax
call    sub_1B956
cmp     [bp+var_2], 0
jz      short loc_1CECF
jmp     loc_1CFAE

loc_1CECF:
mov     al, ds:22B1h
cbw
mov     bx, ax
mov     al, [bx+1AA0h]
mov     [bp+var_5], al
cmp     byte ptr ds:22B5h, 0
jz      short loc_1CF4B
mov     ax, 96FDh
push    ax
cmp     byte ptr ds:22B5h, 1
jnz     short loc_1CEF3
mov     ax, 1AC7h
jmp     short loc_1CEF6

loc_1CEF3:
mov     ax, 1ADCh

loc_1CEF6:
push    ax
call    sub_19458
mov     ax, 96FDh
push    ax
xor     ax, ax
push    ax
call    sub_1C79C
mov     ax, 96FDh
push    ax
push    word ptr ds:40D2h
push    word ptr ds:40D0h
call    sub_1C8F5
mov     ds:40D2h, dx
mov     ds:40D0h, ax
mov     ax, 96FDh
push    ax
mov     ax, 1AE5h
push    ax
call    sub_19458
mov     al, [bp+var_5]
mov     ds:9701h, al
mov     ax, 96FDh
push    ax
xor     ax, ax
push    ax
call    sub_1C79C
mov     ax, 96FDh
push    ax
push    word ptr ds:40D2h
push    word ptr ds:40D0h
call    sub_1C8F5
mov     ds:40D2h, dx
mov     ds:40D0h, ax

loc_1CF4B:
cmp     word ptr ds:23C9h, 0
jz      short loc_1CF7D
mov     ax, 96FDh
push    ax
mov     ax, 1ACFh
push    ax
call    sub_19458
mov     ax, 96FDh
push    ax
xor     ax, ax
push    ax
call    sub_1C79C
mov     ax, 96FDh
push    ax
push    word ptr ds:40D2h
push    word ptr ds:40D0h
call    sub_1C8F5
mov     ds:40D2h, dx
mov     ds:40D0h, ax

loc_1CF7D:
mov     ax, 96FDh
push    ax
mov     ax, 1AEFh
push    ax
call    sub_19458
mov     al, [bp+var_5]
mov     ds:96FEh, al
mov     ax, 96FDh
push    ax
xor     ax, ax
push    ax
call    sub_1C79C
mov     ax, 96FDh
push    ax
push    word ptr ds:40D2h
push    word ptr ds:40D0h
call    sub_1C8F5
mov     ds:40D2h, dx
mov     ds:40D0h, ax

loc_1CFAE:
call    sub_1BD85
mov     di, ax
mov     word ptr ds:0BFB2h, 0
mov     word ptr ds:0BFB0h, 0
xor     ax, ax
push    ax
call    sub_1B476
mov     ax, ds:0BFA8h
add     ds:995Fh, ax
mov     ax, ds:0BFAAh
add     ds:9961h, ax
xor     ax, ax
mov     ds:0BFAAh, ax
mov     ds:0BFA8h, ax
cmp     di, ax
jnz     short loc_1CFED
cmp     ds:9961h, ax
jz      short loc_1CFF3
cmp     ds:31C5h, ax
jnz     short loc_1CFF3

loc_1CFED:
mov     word ptr ds:968Ah, 0

loc_1CFF3:
call    sub_1BE15
cmp     word ptr ds:93D2h, 0
jz      short loc_1D000
call    sub_1B437

loc_1D000:
push    si
call    sub_1B845
or      ax, ax
jz      short loc_1D00B
mov     [bp+var_4], ax

loc_1D00B:
cmp     word ptr ds:96FBh, 0
jle     short loc_1D019
push    word ptr ds:96FBh
call    sub_10728

loc_1D019:
dec     word ptr ds:1DE8h
mov     byte ptr ds:98C7h, 0
mov     ax, [bp+var_4]
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_1CC10 endp



; Attributes: bp-based frame

sub_1D02D proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    si
push    di
mov     si, [bp+arg_0]
mov     di, [bp+arg_2]
mov     ds:3485h, di
mov     ax, di
add     ax, 7
mov     ds:3293h, ax
mov     ds:335Eh, ax
mov     ds:3030h, ax
mov     ds:3226h, ax
mov     ds:3418h, ax
mov     ds:33B5h, ax
mov     ds:318Bh, ax
mov     ax, di
add     ax, 0Eh
mov     ds:2EEEh, ax
mov     ds:2E75h, ax
mov     ds:29AAh, ax
mov     ds:2C43h, ax
mov     ds:30B3h, ax
mov     ds:31CEh, ax
mov     ax, di
add     ax, 15h
mov     ds:2C6Eh, ax
mov     ds:2AC2h, ax
mov     ds:28D1h, ax
mov     ds:2948h, ax
mov     ds:26A3h, ax
mov     ds:2A80h, ax
mov     ds:2B03h, ax
mov     ds:2B5Ah, ax
mov     ds:32D1h, ax
mov     ds:3307h, ax
mov     ax, di
add     ax, 1Ch
mov     ds:289Bh, ax
mov     ds:27F3h, ax
mov     ds:274Bh, ax
mov     ds:2621h, ax
mov     ds:25CAh, ax
mov     ds:2568h, ax
mov     ds:24FBh, ax
mov     ds:48FCh, si
mov     ax, si
add     ax, 7
mov     ds:490Dh, ax
mov     ax, si
add     ax, 0Eh
mov     ds:491Eh, ax
mov     ax, si
add     ax, 38h ; '8'
mov     ds:492Fh, ax
mov     ds:4A0Ch, ax
mov     ax, si
add     ax, 15h
mov     ds:49EAh, ax
mov     ds:4940h, ax
mov     ax, si
add     ax, 31h ; '1'
mov     ds:49B7h, ax
mov     ds:49D9h, ax
mov     ds:4951h, ax
mov     ax, si
add     ax, 1Ch
mov     ds:4962h, ax
mov     ds:4995h, ax
mov     ds:4984h, ax
mov     ds:4973h, ax
mov     ax, si
add     ax, 2Ah ; '*'
mov     ds:49A6h, ax
mov     ds:4A1Dh, ax
mov     ax, si
add     ax, 3Fh ; '?'
mov     ds:49C8h, ax
mov     ds:49FBh, ax
mov     ax, si
add     ax, 23h ; '#'
mov     ds:9A66h, ax
pop     di
pop     si
pop     bp
retn    4
sub_1D02D endp



; Attributes: bp-based frame

sub_1D117 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     ax, [bp+arg_0]
cmp     ax, 0D01h
jz      short loc_1D136
cmp     ax, 0D07h
jnz     short loc_1D12B
jmp     loc_1D1A0

loc_1D12B:
cmp     ax, 0D08h
jnz     short loc_1D133
jmp     loc_1D1A5

loc_1D133:
jmp     loc_1D1BC

loc_1D136:
mov     ax, 406Ch
push    ax
call    sub_19448
or      ax, ax
jz      short loc_1D14E
mov     ax, 97F0h
push    ax
mov     ax, 406Ch
push    ax
call    sub_19458
jmp     short loc_1D159

loc_1D14E:
mov     ax, 97F0h
push    ax
mov     ax, 4820h
push    ax
call    sub_19458

loc_1D159:
mov     ax, 10DFh
push    ax
mov     ax, 97F0h
push    ax
mov     ax, 50h ; 'P'
push    ax
call    sub_1917C
mov     si, ax
mov     ax, si
or      ax, ax
jl      short loc_1D1BF
cmp     byte ptr ds:97F0h, 0
jz      short loc_1D18E
mov     ax, 97F0h
push    ax
xor     ax, ax
push    ax
push    ax
mov     ax, 4821h
push    ax
call    sub_14398
mov     si, ax
mov     ax, si
or      ax, ax
jl      short loc_1D1BF

loc_1D18E:
mov     ax, 406Ch
push    ax
mov     ax, 97F0h
push    ax
call    sub_19458
mov     byte ptr ds:98C7h, 0
jmp     short loc_1D1BC

loc_1D1A0:
mov     byte ptr ds:406Ch, 0

loc_1D1A5:
cmp     word ptr ds:0BFBAh, 0
jz      short loc_1D1BC
mov     ax, 0FFFFh
push    ax
call    sub_1774F
xor     ax, ax
push    ax
call    sub_1C23E
call    sub_1BF31

loc_1D1BC:
mov     si, 0FFFFh

loc_1D1BF:
mov     ax, si
pop     si
pop     bp
retn    2
sub_1D117 endp




sub_1D1C6 proc near
mov     al, ds:4FE1h
mov     ds:4FE5h, al
mov     ds:2310h, al
mov     al, ds:4FCDh
mov     ds:4FD9h, al
push    word ptr ds:22B8h
call    sub_1494A
mov     al, ds:23CDh
mov     ds:22C0h, al
cmp     word ptr ds:23CBh, 2
jz      short loc_1D1EE
mov     ax, 1
jmp     short loc_1D1F0

loc_1D1EE:
xor     ax, ax

loc_1D1F0:
mov     ds:2312h, al
mov     al, ds:22C1h
mov     ds:230Dh, al
mov     ax, 22BCh
push    ax
mov     ax, 2A8Eh
push    ax
mov     ax, 1
push    ax
mov     ax, 20h ; ' '
push    ax
call    sub_190A1
mov     ax, 22BAh
push    ax
mov     ax, 2635h
push    ax
xor     ax, ax
push    ax
mov     ax, 0FFh
push    ax
call    sub_190A1
mov     ax, 22BBh
push    ax
mov     ax, 263Ah
push    ax
xor     ax, ax
push    ax
mov     ax, 0FFh
push    ax
call    sub_190A1
mov     ax, 0FFFFh
retn
sub_1D1C6 endp



; Attributes: bp-based frame

sub_1D234 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, 7FFFh
push    ds
mov     ax, 986Fh
push    ax
call    sub_46805
push    ds
mov     ax, 9873h
push    ax
call    sub_4681A
mov     word ptr ds:0BEE4h, 0
push    ds
inc     word ptr ds:1DE8h
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jz      short loc_1D272
jmp     loc_1D316

loc_1D272:
mov     ax, 97F0h
push    ax
push    [bp+arg_0]
call    sub_19C57
cmp     byte ptr ds:47D0h, 20h ; ' '
jnz     short loc_1D290
mov     ax, 47D0h
push    ax
mov     ax, 97F0h
push    ax
call    sub_19458

loc_1D290:
push    ds
mov     ax, 97F0h
push    ax
call    sub_30A40
les     bx, ds:1C86h
assume es:nothing
mov     word ptr ds:9919h, es
mov     ds:9917h, bx
mov     ax, ds:1C94h
inc     ax
mov     ds:99B3h, ax
mov     ax, 97F0h
push    ax
call    sub_19C1B
call    sub_123F3
mov     ax, 97F0h
push    ax
call    sub_19C39
mov     ax, 97F0h
push    ax
call    sub_1B7CC
mov     word ptr ds:225Ch, 1
push    ds
mov     ax, 97F0h
push    ax
call    sub_259FD
mov     si, ax
mov     word ptr ds:225Ch, 0
push    ds
mov     ax, 99FFh
push    ax
push    ds
mov     ax, 0BE91h
push    ax
mov     ax, 14h
push    ax
call    sub_46A2C
mov     ax, ds:0BEE4h
xor     dx, dx
add     ds:99B5h, ax
adc     ds:99B7h, dx
mov     ax, ds:0BFA8h
add     ds:995Fh, ax
mov     ax, ds:0BFAAh
add     ds:9961h, ax
xor     ax, ax
mov     ds:0BFAAh, ax
mov     ds:0BFA8h, ax
mov     ds:0BEE4h, ax

loc_1D316:
dec     word ptr ds:1DE8h
mov     ax, si
pop     si
pop     bp
retn    2
sub_1D234 endp



; Attributes: bp-based frame

sub_1D321 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
call    sub_139EF
mov     ax, 1
push    ax
call    sub_1CC10
mov     si, ax
mov     ax, si
cmp     ax, 900h
jnz     short loc_1D340
push    [bp+arg_0]
call    sub_1379C
mov     si, ax

loc_1D340:
mov     ax, si
pop     si
pop     bp
retn    2
sub_1D321 endp




sub_1D347 proc near
cmp     byte ptr ds:406Ch, 0
jz      short loc_1D353
mov     ax, 406Ch
jmp     short locret_1D36E

loc_1D353:
cmp     byte ptr ds:4780h, 0
jz      short loc_1D35F
mov     ax, 4780h
jmp     short locret_1D36E

loc_1D35F:
cmp     byte ptr ds:98C7h, 0
jz      short loc_1D36B
mov     ax, 98C7h
jmp     short locret_1D36E

loc_1D36B:
mov     ax, 9877h

locret_1D36E:
retn
sub_1D347 endp




sub_1D36F proc near
cmp     byte ptr ds:4780h, 0
jz      short loc_1D37B
mov     ax, 4780h
jmp     short locret_1D38A

loc_1D37B:
cmp     byte ptr ds:98C7h, 0
jz      short loc_1D387
mov     ax, 98C7h
jmp     short locret_1D38A

loc_1D387:
mov     ax, 9877h

locret_1D38A:
retn
sub_1D36F endp



; Attributes: bp-based frame

sub_1D38B proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
mov     ax, [bp+arg_0]
cmp     ax, 0A02h
jz      short loc_1D3A3
cmp     ax, 0A06h
jnz     short loc_1D3A0
jmp     loc_1D424

loc_1D3A0:
jmp     loc_1D42C

loc_1D3A3:
mov     ax, 4780h
push    ax
call    sub_19448
or      ax, ax
jz      short loc_1D3BB
mov     ax, 97F0h
push    ax
mov     ax, 4780h
push    ax
call    sub_19458
jmp     short loc_1D3C6

loc_1D3BB:
mov     ax, 97F0h
push    ax
mov     ax, 4826h
push    ax
call    sub_19458

loc_1D3C6:
mov     ax, 1079h
push    ax
mov     ax, 97F0h
push    ax
mov     ax, 50h ; 'P'
push    ax
call    sub_1917C
mov     si, ax
mov     ax, si
or      ax, ax
jge     short loc_1D3E0
jmp     def_1D441       ; jumptable 0001D441 default case, case 2562

loc_1D3E0:
cmp     byte ptr ds:97F0h, 0
jz      short loc_1D401
mov     ax, 97F0h
push    ax
xor     ax, ax
push    ax
push    ax
mov     ax, 0E56h
push    ax
call    sub_14398
mov     si, ax
mov     ax, si
or      ax, ax
jge     short loc_1D401
jmp     def_1D441       ; jumptable 0001D441 default case, case 2562

loc_1D401:
mov     ax, 4780h
push    ax
mov     ax, 97F0h
push    ax
call    sub_19458
cmp     byte ptr ds:97F0h, 0
jnz     short loc_1D41E
mov     ax, 97F0h
push    ax
mov     ax, 4730h
push    ax
call    sub_19458

loc_1D41E:
mov     si, 500h
jmp     def_1D441       ; jumptable 0001D441 default case, case 2562

loc_1D424:
call    sub_1BA2B
mov     si, ax
jmp     def_1D441       ; jumptable 0001D441 default case, case 2562

loc_1D42C:
call    sub_139EF
mov     ax, [bp+arg_0]
sub     ax, 0A01h       ; switch 5 cases
cmp     ax, 4
jbe     short loc_1D43D
jmp     def_1D441       ; jumptable 0001D441 default case, case 2562

loc_1D43D:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_1D441[bx] ; switch jump
jpt_1D441 dw offset loc_1D479 ; jump table for switch statement
dw offset def_1D441
dw offset loc_1D46E
dw offset loc_1D464
dw offset loc_1D450

loc_1D450:              ; jumptable 0001D441 case 2565
call    sub_1C989
mov     si, ax
mov     ax, si
cmp     ax, 7
jnz     short def_1D441 ; jumptable 0001D441 default case, case 2562
push    si
call    sub_1CC10
mov     si, ax
jmp     short def_1D441 ; jumptable 0001D441 default case, case 2562

loc_1D464:              ; jumptable 0001D441 case 2564
xor     ax, ax
push    ax
call    sub_1CC10
mov     si, ax
jmp     short def_1D441 ; jumptable 0001D441 default case, case 2562

loc_1D46E:              ; jumptable 0001D441 case 2563
mov     ax, 6
push    ax
call    sub_1CC10
mov     si, ax
jmp     short def_1D441 ; jumptable 0001D441 default case, case 2562

loc_1D479:              ; jumptable 0001D441 case 2561
mov     ax, 98C7h
push    ax
call    sub_1D36F
mov     di, ax
mov     ax, di
push    ax
call    sub_19458
mov     word ptr ds:93D2h, 0
xor     ax, ax
push    ax
call    sub_1B6D0
xor     ax, ax
push    ax
call    sub_1B77F
call    sub_1BDD1
push    di
call    sub_1D234
call    sub_1B437
call    sub_1BE15
mov     si, 0FFFFh
mov     ax, 3
push    ax
call    sub_1B845
or      ax, ax
jz      short def_1D441 ; jumptable 0001D441 default case, case 2562
mov     si, ax

def_1D441:              ; jumptable 0001D441 default case, case 2562
mov     ax, si
pop     di
pop     si
pop     bp
retn    2
sub_1D38B endp



; Attributes: bp-based frame

sub_1D4BF proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    ds
push    [bp+arg_0]
mov     ax, 91CDh
push    ax
mov     ax, 9179h
push    ax
mov     ax, 9170h
push    ax
mov     ax, 91C8h
push    ax
call    sub_19500
pop     bp
retn    2
sub_1D4BF endp




sub_1D4DD proc near
push    si
mov     si, 4Eh ; 'N'
cmp     word ptr ds:99FDh, 0
jz      short loc_1D51F
mov     word ptr ds:1DD3h, 12Bh
xor     ax, ax
push    ax
mov     ax, 0C6Fh
push    ax
mov     ax, 108Dh
push    ax
mov     ax, 0C81h
push    ax
mov     ax, 5
push    ax
mov     ax, 0Ah
push    ax
mov     ax, 4
push    ax
call    sub_18EAD
add     sp, 0Eh
cbw
mov     si, ax
mov     ax, si
cmp     ax, 1Bh
jz      short loc_1D51F
mov     word ptr ds:99FDh, 0

loc_1D51F:
mov     ax, si
pop     si
retn
sub_1D4DD endp




sub_1D523 proc near
cmp     byte ptr ds:2D40h, 0
jz      short loc_1D539
cmp     byte ptr ds:2D41h, 3Ah ; ':'
jnz     short loc_1D539
mov     ax, ds:2D40h
mov     ds:9750h, ax
jmp     short loc_1D544

loc_1D539:
call    sub_10490
mov     ds:9750h, al
mov     byte ptr ds:9751h, 3Ah ; ':'

loc_1D544:
mov     al, ds:9750h
cbw
push    ax
call    sub_46F25
mov     ds:9750h, al
call    sub_1D347
push    ax
call    sub_1D4BF
mov     ax, 9752h
push    ax
mov     ax, 9170h
push    ax
call    sub_19458
push    ax
mov     ax, 120Fh
push    ax
call    sub_19483
mov     ax, ds:9750h
mov     ds:97A0h, ax
call    sub_1D36F
push    ax
call    sub_1D4BF
mov     ax, 97A2h
push    ax
mov     ax, 9170h
push    ax
call    sub_19458
push    ax
mov     ax, 120Ah
push    ax
call    sub_19483
cmp     word ptr ds:0C0EFh, 2
jnz     short loc_1D596
mov     al, 88h
jmp     short loc_1D598

loc_1D596:
mov     al, 1

loc_1D598:
mov     ds:3326h, al
cmp     word ptr ds:0C0EFh, 0
jle     short loc_1D5A6
mov     al, 88h
jmp     short loc_1D5A8

loc_1D5A6:
mov     al, 1

loc_1D5A8:
mov     ds:3331h, al
cmp     byte ptr ds:22B9h, 0
jz      short loc_1D5B6
mov     al, 1
jmp     short loc_1D5B8

loc_1D5B6:
mov     al, 4

loc_1D5B8:
mov     ds:2697h, al
mov     ds:268Ch, al
mov     ds:2681h, al
mov     ds:2676h, al
mov     ax, 3493h
push    ax
call    sub_174B1
retn
sub_1D523 endp



; Attributes: bp-based frame

sub_1D5CC proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_0]
cmp     si, 0FFFFh
jle     short loc_1D5DC
mov     ds:4724h, si

loc_1D5DC:
push    ds
inc     word ptr ds:1DE8h
mov     ax, ds:1DE8h
mov     dx, 14h
mul     dx
add     ax, 8C50h
push    ax
call    sub_469C1
or      ax, ax
jz      short loc_1D5F9

loc_1D5F6:
mov     si, 500h

loc_1D5F9:
cmp     si, 0FFFFh
jnz     short loc_1D602
mov     si, ds:4724h

loc_1D602:
cmp     si, 500h
jnz     short loc_1D62C
call    sub_1D523
mov     si, ax
cmp     byte ptr ds:3498h, 0
jz      short loc_1D624
mov     ax, ds:4720h
mov     dx, 11h
mul     dx
mov     bx, ax
mov     ax, [bx+4902h]
jmp     short loc_1D627

loc_1D624:
mov     ax, 500h

loc_1D627:
mov     ds:4724h, ax
jmp     short loc_1D5F9

loc_1D62C:
call    sub_177EB
mov     ax, si
cmp     ax, 600h
jz      short loc_1D642
cmp     ax, 700h
jz      short loc_1D656
cmp     ax, 800h
jz      short loc_1D679
jmp     short loc_1D687

loc_1D642:
mov     ax, 0FFFFh
push    ax
call    sub_17720
call    sub_18856
mov     si, ax
mov     word ptr ds:4724h, 600h
jmp     short loc_1D5F9

loc_1D656:
mov     ax, 0FFFFh
push    ax
call    sub_17720
cmp     word ptr ds:4722h, 0
jnz     short loc_1D66B
call    sub_1AA75
mov     si, ax
jmp     short loc_1D670

loc_1D66B:
call    sub_1C2C1
mov     si, ax

loc_1D670:
mov     word ptr ds:4724h, 700h
jmp     loc_1D5F9

loc_1D679:
mov     ax, 1
push    ax
call    sub_12268
or      ax, ax
jge     short loc_1D690
jmp     loc_1D5F6

loc_1D687:
push    si
call    sub_18863
mov     si, ax
jmp     loc_1D5F9

loc_1D690:
pop     si
pop     bp
retn    2
sub_1D5CC endp



; Attributes: bp-based frame

sub_1D695 proc near

arg_0= byte ptr  4

push    bp
mov     bp, sp
push    si
push    di
mov     dl, [bp+arg_0]
mov     ah, 2
int     21h             ; DOS - DISPLAY OUTPUT
                        ; DL = character to send to standard output
pop     di
pop     si
pop     bp
retn    2
sub_1D695 endp



; Attributes: bp-based frame

sub_1D6A7 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
jmp     short loc_1D6B7

loc_1D6AC:
mov     bx, [bp+arg_0]
inc     [bp+arg_0]
push    word ptr [bx]
call    sub_1D695

loc_1D6B7:
mov     bx, [bp+arg_0]
cmp     byte ptr [bx], 0
jnz     short loc_1D6AC
mov     al, 0Dh
push    ax
call    sub_1D695
mov     al, 0Ah
push    ax
call    sub_1D695
pop     bp
retn    2
sub_1D6A7 endp



; Attributes: bp-based frame

sub_1D6CF proc far

arg_0= word ptr  6
arg_2= dword ptr  8

push    bp
mov     bp, sp
push    si
call    sub_16431
call    sub_19C75
mov     si, 1
jmp     loc_1D7E4

loc_1D6DF:
mov     ax, si
shl     ax, 1
shl     ax, 1
les     bx, [bp+arg_2]
add     bx, ax
les     bx, es:[bx]
mov     al, es:[bx]
cmp     al, ds:91D0h
jz      short loc_1D6F9
jmp     loc_1D7BA

loc_1D6F9:
mov     ax, si
shl     ax, 1
shl     ax, 1
les     bx, [bp+arg_2]
add     bx, ax
les     bx, es:[bx]
mov     al, es:[bx+1]
cbw
push    ax
call    sub_46F25
sub     ax, 42h ; 'B'   ; switch 15 cases
cmp     ax, 0Eh
jbe     short loc_1D71D
jmp     def_1D721       ; jumptable 0001D721 default case, cases 69-76,78,79

loc_1D71D:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_1D721[bx] ; switch jump
jpt_1D721 dw offset loc_1D74D ; jump table for switch statement
dw offset loc_1D756
dw offset loc_1D7AA
dw offset def_1D721
dw offset def_1D721
dw offset def_1D721
dw offset def_1D721
dw offset def_1D721
dw offset def_1D721
dw offset def_1D721
dw offset def_1D721
dw offset loc_1D744
dw offset def_1D721
dw offset def_1D721
dw offset loc_1D7B2

loc_1D744:              ; jumptable 0001D721 case 77
mov     word ptr ds:4728h, 1
jmp     def_1D721       ; jumptable 0001D721 default case, cases 69-76,78,79

loc_1D74D:              ; jumptable 0001D721 case 66
mov     word ptr ds:4728h, 2
jmp     def_1D721       ; jumptable 0001D721 default case, cases 69-76,78,79

loc_1D756:              ; jumptable 0001D721 case 67
push    ds
mov     ax, 9963h
push    ax
mov     ax, si
shl     ax, 1
shl     ax, 1
les     bx, [bp+arg_2]
add     bx, ax
mov     dx, es:[bx+2]
mov     ax, es:[bx]
inc     ax
inc     ax
push    dx
push    ax
call    sub_46D76
cmp     byte ptr ds:9963h, 0
jnz     short loc_1D7A1
inc     si
mov     ax, si
cmp     ax, [bp+arg_0]
jge     short loc_1D7A1
push    ds
mov     ax, 9963h
push    ax
mov     ax, si
shl     ax, 1
shl     ax, 1
les     bx, [bp+arg_2]
add     bx, ax
push    word ptr es:[bx+2]
push    word ptr es:[bx]
call    sub_46D76

loc_1D7A1:
mov     al, ds:9963h
cbw
mov     ds:472Ch, ax
jmp     short def_1D721 ; jumptable 0001D721 default case, cases 69-76,78,79

loc_1D7AA:              ; jumptable 0001D721 case 68
mov     word ptr ds:472Ah, 1
jmp     short def_1D721 ; jumptable 0001D721 default case, cases 69-76,78,79

loc_1D7B2:              ; jumptable 0001D721 case 80
mov     word ptr ds:2296h, 1
jmp     short def_1D721 ; jumptable 0001D721 default case, cases 69-76,78,79

loc_1D7BA:
push    ds
mov     ax, 4730h
push    ax
mov     ax, si
shl     ax, 1
shl     ax, 1
les     bx, [bp+arg_2]
add     bx, ax
push    word ptr es:[bx+2]
push    word ptr es:[bx]
call    sub_46D76
mov     ax, 4730h
push    ax
call    sub_1943A
mov     word ptr ds:472Eh, 1

def_1D721:              ; jumptable 0001D721 default case, cases 69-76,78,79
inc     si

loc_1D7E4:
cmp     si, [bp+arg_0]
jge     short loc_1D7EC
jmp     loc_1D6DF

loc_1D7EC:
push    ds
mov     ax, 99FFh
push    ax
call    sub_469C1
or      ax, ax
jz      short loc_1D803
mov     ax, 3
push    ax
call    sub_16549
jmp     short loc_1D816

loc_1D803:
push    ds
mov     ax, 99FFh
push    ax
push    ds
mov     ax, 0BE91h
push    ax
mov     ax, 14h
push    ax
call    sub_46A2C

loc_1D816:
les     bx, [bp+arg_2]
les     bx, es:[bx]
cmp     byte ptr es:[bx], 0
jz      short loc_1D84C
push    ds
mov     ax, 991Bh
push    ax
les     bx, [bp+arg_2]
push    word ptr es:[bx+2]
push    word ptr es:[bx]
call    sub_46D76
mov     ax, 991Bh
push    ax
call    sub_19C1B
mov     al, 0
mov     ds:91C8h, al
mov     ds:9170h, al
mov     ax, 991Bh
push    ax
call    sub_19C39

loc_1D84C:
call    sub_16769
mov     si, ax
cmp     word ptr ds:4728h, 0
jz      short loc_1D8B1
mov     ax, 0F9Dh
push    ax
call    sub_15773
cmp     word ptr ds:1D20h, 0
jnz     short loc_1D87B
cmp     byte ptr ds:406Ch, 0
jnz     short loc_1D874
cmp     byte ptr ds:4780h, 0
jz      short loc_1D87B

loc_1D874:
mov     ax, 111h
push    ax
call    sub_1804A

loc_1D87B:
mov     ax, ds:4728h
add     ax, 0A03h
push    ax
call    sub_1D38B
call    sub_1648A
mov     si, 1
jmp     short loc_1D89B

loc_1D88D:
push    si
call    sub_30C40
mov     ax, 9A78h
push    ax
call    sub_1D6A7
inc     si

loc_1D89B:
cmp     si, ds:0BFBAh
jle     short loc_1D88D
cmp     word ptr ds:995Fh, 0
jz      short loc_1D8AD
mov     ax, 1
jmp     short loc_1D8AF

loc_1D8AD:
xor     ax, ax

loc_1D8AF:
jmp     short loc_1D8BD

loc_1D8B1:
push    si
call    sub_1D5CC
xor     ax, ax
push    ax
call    sub_16549
xor     ax, ax

loc_1D8BD:
pop     si
pop     bp
retf
sub_1D6CF endp




sub_1D8C0 proc near
call    sub_1E13A
jb      short loc_1D8C8
mov     ax, ds:0

loc_1D8C8:
call    sub_1E160
retn
sub_1D8C0 endp




sub_1D8CC proc near
sub     sp, 0A0h
call    sub_1E13A
call    sub_1E6F6
jnb     short loc_1D8DB
jmp     loc_1D984

loc_1D8DB:
mov     cl, [bp+0AEh]
mov     ch, [bp+0ACh]
mov     dl, [bp+0AAh]
mov     dh, [bp+0A8h]
cmp     byte ptr [bx+4], 0
jz      short loc_1D901
mov     ax, [bx+6]
push    ax
neg     al
neg     ah
add     al, [bx+8]
add     ah, [bx+9]
jmp     short loc_1D916

loc_1D901:
dec     cl
dec     ch
dec     dl
dec     dh
mov     ax, [bx]
push    ax
neg     al
neg     ah
add     al, [bx+2]
add     ah, [bx+3]

loc_1D916:
pop     ax
add     cl, al
add     dl, al
add     ch, ah
add     dh, ah
mov     si, [bp+0A6h]

loc_1D923:
lea     di, [bp+2]
cmp     byte ptr [bp+0A4h], 0
jz      short loc_1D95E
push    ss
push    di
push    dx
push    cx
mov     al, ch
push    ax
call    sub_1E2D6
push    cx
push    di
push    ds
push    es
push    ss
pop     es
pop     ds
mov     al, cl
shl     al, 1
xor     ah, ah
add     di, ax

loc_1D946:
movsb
inc     di
inc     cl
cmp     cl, dl
jbe     short loc_1D946
pop     ds
pop     di
pop     cx
push    es
push    di
push    dx
push    cx
mov     al, ch
push    ax
call    sub_1E2DA
jmp     short loc_1D97E
align 2

loc_1D95E:
mov     al, cl
xor     ah, ah
shl     ax, 1
neg     ax
add     ax, si
push    es
push    ax
push    dx
push    cx
mov     al, ch
push    ax
call    sub_1E2DA
mov     al, dl
sub     al, cl
inc     al
xor     ah, ah
shl     ax, 1
add     si, ax

loc_1D97E:
inc     ch
cmp     ch, dh
jbe     short loc_1D923

loc_1D984:
call    sub_1E160
add     sp, 0A0h
retn    0Ch
sub_1D8CC endp




sub_1D98E proc near
sub     sp, 0A0h
call    sub_1E13A
jb      short loc_1D9B8
push    word ptr [bx+0Bh]
mov     al, [bp+0A6h]
mov     [bx+0Bh], al
cmp     byte ptr [bp+0A4h], 0
jz      short loc_1D9B5
call    sub_1E6F6
jb      short loc_1D9B8
push    ss
pop     es
lea     di, [bp+2]
call    sub_1D9C2

loc_1D9B5:
pop     ax
xor     ah, ah

loc_1D9B8:
call    sub_1E160
add     sp, 0A0h
retn    4
sub_1D98E endp ; sp-analysis failed




sub_1D9C2 proc near
mov     dl, [bx+1]
xor     dh, dh
mov     cl, [bx+3]
xor     ch, ch
sub     cx, dx
inc     cx

loc_1D9CF:
push    cx
push    es
push    di
push    word ptr [bx+2]
push    word ptr [bx]
push    dx
call    sub_1E2D6
push    di
mov     al, [bx]
xor     ah, ah
mov     cl, [bx+2]
xor     ch, ch
sub     cx, ax
inc     cx
shl     ax, 1
add     di, ax
mov     al, [bp+0A6h]

loc_1D9F0:
inc     di
stosb
loop    loc_1D9F0
pop     di
push    es
push    di
push    word ptr [bx+2]
push    word ptr [bx]
push    dx
call    sub_1E2DA
inc     dx
pop     cx
loop    loc_1D9CF
retn
sub_1D9C2 endp




sub_1DA05 proc near
call    sub_1E13A
call    sub_1E6F6
jb      short loc_1DA20
mov     al, [bp+6]
mov     [bx+4], al
mov     al, [bp+4]
cmp     al, 0FFh
jz      short loc_1DA1D
mov     [bx+5], al

loc_1DA1D:
call    sub_1E3DF

loc_1DA20:
call    sub_1E160
retn    4
sub_1DA05 endp




sub_1DA26 proc near
call    sub_1E13A
call    sub_1E6F6
jb      short loc_1DA31
call    sub_1E6A9

loc_1DA31:
call    sub_1E160
retn
sub_1DA26 endp




sub_1DA35 proc near
call    sub_1E13A
jb      short loc_1DA3D
mov     ax, ds:2

loc_1DA3D:
call    sub_1E160
retn
sub_1DA35 endp




sub_1DA41 proc near
call    sub_1E13A
jb      short loc_1DA5F
cmp     bx, 30h ; '0'
jnz     short loc_1DA53
mov     word ptr ds:4, 7
jmp     short loc_1DA5F

loc_1DA53:
call    sub_1DA63
mov     bx, ds:2
mov     ax, bx
mov     ds:0, ax

loc_1DA5F:
call    sub_1E160
retn
sub_1DA41 endp




sub_1DA63 proc near
cmp     byte ptr [bx+20h], 2
jnz     short loc_1DA72
push    bx
push    word ptr ds:11h
call    sub_1EA98
pop     bx

loc_1DA72:
call    sub_1E4FA
mov     di, [bx+12h]
or      di, di
jz      short locret_1DABA
mov     ax, [bx+8]
sub     ah, [bx+7]
inc     ah
sub     al, [bx+6]
inc     al
mul     ah
mov     si, di
add     si, ax
add     si, ax
mov     cx, ds:6
sub     cx, si
push    ds
pop     es
rep movsb
shl     ax, 1
sub     ds:6, ax
mov     dx, [bx+12h]
mov     bx, ds:16h

loc_1DAA8:
cmp     bx, 30h ; '0'
jz      short locret_1DABA
cmp     [bx+12h], dx
jb      short loc_1DAB5
sub     [bx+12h], ax

loc_1DAB5:
mov     bx, [bx+14h]
jmp     short loc_1DAA8

locret_1DABA:
retn
sub_1DA63 endp




sub_1DABB proc near
sub     sp, 0A3h
call    sub_1E13A
jb      short loc_1DAC7
jmp     loc_1DBE8

loc_1DAC7:
push    es
push    ax
les     di, [bp+0B1h]
add     di, 0Fh
mov     cl, 4
shr     di, cl
mov     ax, es
add     ax, di
pop     bx
mov     cs:[bx-1EF7h], ax
mov     ds, ax
mov     word ptr ds:4, 0
mov     ds:8, bx
mov     word ptr ds:6, 0
les     di, [bp+0A9h]
mov     ds:2Ch, di
mov     word ptr ds:2Eh, es
mov     al, [bp+0A7h]
mov     ds:2Bh, al
pop     es
mov     word ptr ds:0Ah, es
mov     ax, [bp+0AFh]
mov     di, [bp+0B1h]
and     di, 0Fh
jz      short loc_1DB1A
sub     ax, 10h
add     ax, di

loc_1DB1A:
cmp     ax, 31h ; '1'
jnb     short loc_1DB28
mov     word ptr ds:4, 4
jmp     loc_1DBE8

loc_1DB28:
mov     ds:0Eh, ax
mov     al, [bp+0ADh]
mov     ds:2Ah, al
push    ss
lea     ax, [bp+2]
push    ax
call    sub_1DD40
mov     ax, [bp+2]
mov     ds:22h, ax
mov     ax, [bp+6Dh]
mov     ds:24h, ax
mov     al, [bp+0A4h]
mov     ah, al
mov     ds:26h, ax
mov     al, [bp+54h]
mov     ah, [bp+9Dh]
mov     ds:28h, ax
mov     ax, [bp+9Ah]
mov     ds:0Ch, ax
mov     ax, 22h ; '"'
mov     cl, [bp+0ADh]
inc     cl
mov     ch, 0
mul     cx
add     ax, 31h ; '1'
dec     ax
mov     ds:1Ah, ax
mov     ds:6, ax
cmp     ax, ds:0Eh
jb      short loc_1DB86
mov     word ptr ds:4, 4
jmp     short loc_1DBE8
align 2

loc_1DB86:
mov     bx, 30h ; '0'
call    sub_1E71C
xor     ax, ax
mov     ds:1Ch, ax
mov     ds:1Eh, ax
inc     al
mov     ds:20h, al
xor     ax, ax
mov     [bx+12h], ax
mov     [bx+10h], ax
mov     [bx], ax
mov     [bx+6], ax
mov     ax, ds:28h
dec     al
dec     ah
mov     [bx+2], ax
mov     [bx+8], ax
mov     byte ptr [bx+4], 0
mov     byte ptr [bx+0Bh], 7
mov     ax, [bp+5Ah]
mov     [bx+0Ch], ax
mov     ax, [bp+9Eh]
mov     [bx+0Eh], ax
mov     byte ptr [bx+20h], 2
mov     al, 0
mov     ds:10h, al
mov     ds:11h, al
mov     al, 0
mov     cl, [bp+0ADh]
mov     ch, 0

loc_1DBDC:
add     bx, 22h ; '"'
mov     [bx+20h], al
loop    loc_1DBDC
mov     dx, ds
xor     ax, ax

loc_1DBE8:
call    sub_1E160
add     sp, 0A3h
retn    0Eh
sub_1DABB endp




sub_1DBF2 proc near
call    sub_1E13A
jb      short loc_1DC04
call    sub_1E1AD
mov     cx, [bx]
sub     ah, ch
sub     al, cl
inc     ah
inc     al

loc_1DC04:
call    sub_1E160
retn
sub_1DBF2 endp




sub_1DC08 proc near
call    sub_1E13A
jb      short loc_1DC33
mov     al, [bp+6]
mov     ah, [bp+4]
mov     dx, [bx]
or      al, al
jz      short loc_1DC1D
dec     al
add     dl, al

loc_1DC1D:
or      ah, ah
jz      short loc_1DC25
dec     ah
add     dh, ah

loc_1DC25:
mov     [bx+0Ch], dx
cmp     bx, ds:2
jnz     short loc_1DC33
mov     ax, dx
call    sub_1E846

loc_1DC33:
call    sub_1E160
retn    4
sub_1DC08 endp




sub_1DC39 proc near
call    sub_1E13A
jb      short loc_1DC44
mov     al, [bp+4]
call    sub_1E1D1

loc_1DC44:
call    sub_1E160
retn    2
sub_1DC39 endp




sub_1DC4A proc near
call    sub_1E13A
jb      short loc_1DC59
push    word ptr [bx+10h]
mov     ax, [bp+4]
mov     [bx+10h], ax
pop     ax

loc_1DC59:
call    sub_1E160
retn    2
sub_1DC4A endp




sub_1DC5F proc near
call    sub_1E13A
jb      short loc_1DC6A
call    sub_1DC8B
call    sub_1E53F

loc_1DC6A:
call    sub_1E160
retn    2
sub_1DC5F endp

push    bx

loc_1DC71:
cmp     word ptr [bx+12h], 0
jz      short loc_1DC82
mov     bx, [bx+14h]
cmp     bx, 30h ; '0'
jnz     short loc_1DC71
clc
jmp     short loc_1DC89

loc_1DC82:
mov     word ptr ds:4, 0Bh
stc

loc_1DC89:
pop     bx
retn



sub_1DC8B proc near
push    si
push    di
mov     si, 30h ; '0'
cmp     bx, ds:14h
jz      short loc_1DCC8
mov     di, [bx+14h]
mov     ax, [bx+16h]
mov     [di+16h], ax
cmp     ax, si
jnz     short loc_1DCAC
mov     ds:16h, di
mov     [si+14h], di
jmp     short loc_1DCB1

loc_1DCAC:
mov     si, ax
mov     [si+14h], di

loc_1DCB1:
mov     si, ds:14h
mov     [si+14h], bx
mov     [bx+16h], si
mov     di, 30h ; '0'
mov     [bx+14h], di
mov     ds:14h, bx
mov     [di+16h], bx

loc_1DCC8:
pop     di
pop     si
retn
sub_1DC8B endp




sub_1DCCB proc near
call    sub_1E13A
jb      short loc_1DCDF
mov     ax, [bp+4]
mov     [bx+0Eh], ax
cmp     bx, ds:2
jnz     short loc_1DCDF
call    sub_1E853

loc_1DCDF:
call    sub_1E160
retn    2
sub_1DCCB endp




sub_1DCE5 proc near
call    sub_1E13A
jb      short loc_1DD06
cmp     byte ptr [bx+20h], 1
jnz     short loc_1DD06
cmp     byte ptr [bp+4], 0
jnz     short loc_1DCFE
xor     al, al
push    ax
call    sub_1E5E9
jmp     short loc_1DD06

loc_1DCFE:
call    sub_1E70E
jb      short loc_1DD06
call    sub_1E687

loc_1DD06:
call    sub_1E160
retn    2
sub_1DCE5 endp




sub_1DD0C proc near
call    sub_1E13A
jb      short loc_1DD2A
mov     ax, ds:26h
or      ah, ah
jz      short loc_1DD2A
mov     bl, [bp+4]
cmp     bl, 2
jz      short loc_1DD26
mov     ds:26h, bl
jmp     short loc_1DD2A

loc_1DD26:
mov     ds:26h, ah

loc_1DD2A:
xor     ah, ah
call    sub_1E160
retn    2
sub_1DD0C endp




sub_1DD32 proc near
call    sub_1E13A
jb      short loc_1DD3C
mov     al, ds:26h
xor     ah, ah

loc_1DD3C:
call    sub_1E160
retn
sub_1DD32 endp



; Attributes: bp-based frame

sub_1DD40 proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
call    sub_1E10B
mov     ax, seg seg091
mov     ds, ax
assume ds:seg091
les     di, [bp+arg_0]
call    sub_1DF8A
mov     al, byte_539CE
mov     es:[di+0A1h], al
mov     ax, word_539CC
mov     es:[di+6], ax
mov     ax, word_539CA
mov     es:[di+2], ax
mov     ax, word_539C8
mov     es:[di+4], ax
mov     ax, word_539C6
mov     es:[di], ax
or      ax, ax
jz      short loc_1DD7D
call    sub_1DEF2
jmp     short loc_1DDC2

loc_1DD7D:
mov     cx, 4
lea     si, byte_53984

loc_1DD84:
cld
lodsb
test    al, al
lodsw
jz      short loc_1DD91
push    si
push    cx
call    ax
pop     cx
pop     si

loc_1DD91:
loop    loc_1DD84
call    sub_1DEF2
call    sub_1DF29
call    sub_1DF4E
call    sub_1DFA3
mov     ax, es:[di]
mov     word_539C6, ax
mov     ax, es:[di+4]
mov     word_539C8, ax
mov     ax, es:[di+2]
mov     word_539CA, ax
mov     ax, es:[di+6]
mov     word_539CC, ax
mov     al, es:[di+0A1h]
mov     byte_539CE, al

loc_1DDC2:
call    sub_1DFE1
call    sub_1E118
pop     bp
retn    4
sub_1DD40 endp




sub_1DDCC proc near
push    si
lea     si, [di]
cmp     byte ptr es:[si], 0
jz      short loc_1DDD8
lea     si, [di+4]

loc_1DDD8:
mov     es:[si], ax
mov     es:[si+2], bx
pop     si
retn
sub_1DDCC endp

mov     ax, 1A00h
int     10h             ; - VIDEO - DISPLAY COMBINATION (PS,VGA/MCGA): read display combination code
cmp     al, 1Ah
jnz     short loc_1DE47
mov     cx, bx
mov     bh, 0
or      ch, ch
jz      short loc_1DE0C
mov     bl, ch
shl     bx, 1
shl     bx, 1
mov     ax, [bx-7F60h]
mov     es:[di+4], ax
mov     ax, [bx-7F5Eh]
mov     es:[di+6], ax
mov     bl, cl
mov     bh, 0

loc_1DE0C:
shl     bx, 1
shl     bx, 1
mov     ax, [bx-7F60h]
mov     es:[di], ax
mov     ax, [bx-7F5Eh]
mov     es:[di+2], ax
mov     al, 0
mov     byte_5398A, al
mov     byte_53987, al
mov     byte_5398D, al
lea     bx, [di]
test    word ptr es:[bx], 1
jnz     short loc_1DE3D
lea     bx, [di+4]
test    word ptr es:[bx], 1
jz      short loc_1DE47

loc_1DE3D:
mov     word ptr es:[bx], 0
mov     byte_5398D, 0FFh

loc_1DE47:
mov     byte_53984, 0
retn
mov     bl, 10h
mov     ah, 12h
int     10h             ; - VIDEO - ALTERNATE FUNCTION SELECT (PS, EGA, VGA, MCGA) - GET EGA INFO
                        ; Return: BH = 00h color mode in effect CH = feature bits, CL = switch settings
cmp     bl, 10h
jz      short loc_1DE7C
mov     ax, 4
lea     bx, unk_53944
and     cx, 0FEh
add     bx, cx
mov     bx, [bx]
call    sub_1DDCC
test    bx, 1
jnz     short loc_1DE77
mov     byte_5398A, 0
jmp     short loc_1DE7C

loc_1DE77:
mov     byte_5398D, 0

loc_1DE7C:
mov     byte_53987, 0
retn
mov     dx, 3D4h
call    sub_1DED8
jb      short loc_1DE93
mov     ax, 2
mov     bx, 2
call    sub_1DDCC

loc_1DE93:
mov     byte_5398A, 0
retn
mov     dx, 3B4h
call    sub_1DED8
jb      short loc_1DED2
mov     cx, 0FFFFh
call    sub_1E0D2
jcxz    short loc_1DEC9
mov     dl, 0BAh
in      al, dx
mov     cl, al
and     cl, 70h
mov     ax, 141h
mov     bx, 4
cmp     cl, 50h ; 'P'
jz      short loc_1DECF
mov     ax, 0C1h
cmp     cl, 10h
jz      short loc_1DECC
mov     ax, 41h ; 'A'
jmp     short loc_1DECC

loc_1DEC9:
mov     ax, 1

loc_1DECC:
mov     bx, 1

loc_1DECF:
call    sub_1DDCC

loc_1DED2:
mov     byte_5398D, 0
retn



sub_1DED8 proc near
mov     al, 0Fh
out     dx, al
inc     dx
in      al, dx
mov     ah, al
mov     al, 66h ; 'f'
out     dx, al
mov     cx, 100h

loc_1DEE5:
loop    loc_1DEE5
in      al, dx
xchg    ah, al
out     dx, al
cmp     ah, 66h ; 'f'
jz      short locret_1DEF1
stc

locret_1DEF1:
retn
sub_1DED8 endp




sub_1DEF2 proc near
cmp     word ptr es:[di+4], 0
jz      short locret_1DF28
cmp     byte ptr es:[di+6Bh], 0B4h
jz      short loc_1DF0A
test    word ptr es:[di+2], 1
jz      short locret_1DF28
jmp     short loc_1DF12

loc_1DF0A:
test    word ptr es:[di+2], 1
jnz     short locret_1DF28

loc_1DF12:
mov     ax, es:[di]
xchg    ax, es:[di+4]
mov     es:[di], ax
mov     ax, es:[di+2]
xchg    ax, es:[di+6]
mov     es:[di+2], ax

locret_1DF28:
retn
sub_1DEF2 endp




sub_1DF29 proc near
cmp     word ptr es:[di+4], 0
jz      short locret_1DF4D
mov     dx, 3B4h
test    word ptr es:[di+6], 1
jnz     short loc_1DF3E
mov     dx, 3D4h

loc_1DF3E:
call    sub_1DED8
jnb     short locret_1DF4D
xor     ax, ax
mov     es:[di+4], ax
mov     es:[di+6], ax

locret_1DF4D:
retn
sub_1DF29 endp




sub_1DF4E proc near
lea     bx, [di]
call    sub_1DF5A
lea     bx, [di+4]
call    sub_1DF5A
retn
sub_1DF4E endp




sub_1DF5A proc near
test    word ptr es:[bx], 4
jz      short loc_1DF6F
lea     ax, unk_53990
call    sub_1E0BA
mov     ax, 20h ; ' '
jz      short loc_1DF86
jmp     short locret_1DF89

loc_1DF6F:
test    word ptr es:[bx], 10h
jz      short locret_1DF89
push    bx
mov     ax, 6F00h
int     10h             ; - VIDEO - INSTALLATION CHECK (Video7 VGA,VEGA VGA)
                        ; Return: BX = 5637h ('V7') indicates Video7 VGA/VEGA VGA extensions are present
cmp     bx, 5637h
mov     ax, 200h
pop     bx
jnz     short locret_1DF89

loc_1DF86:
or      es:[bx], ax

locret_1DF89:
retn
sub_1DF5A endp




sub_1DF8A proc near
push    si
push    di
push    ds
xor     si, si
mov     ds, si
assume ds:nothing
mov     si, 400h
lea     di, [di+8]
mov     cx, 90h
shr     cx, 1
cld
rep movsw
pop     ds
assume ds:nothing
pop     di
pop     si
retn
sub_1DF8A endp




sub_1DFA3 proc near
push    di
push    es
les     di, ds:80EFh
mov     al, es:[di]
push    ds
pop     es
lea     di, ds:80F3h
mov     cx, 8
repne scasb
dec     di
lea     ax, ds:80F3h
sub     di, ax
shl     di, 1
mov     ax, [di-7F05h]
cmp     al, 10h
jz      short loc_1DFD9
cmp     al, 30h ; '0'
jz      short loc_1DFD9
push    ax
lea     ax, ds:810Bh
call    sub_1E0BA
pop     ax
jnz     short loc_1DFD9
mov     al, 10h

loc_1DFD9:
pop     es
pop     di
mov     es:[di+0A1h], al
retn
sub_1DFA3 endp




sub_1DFE1 proc near
push    ds
push    es
pop     ds
pop     es
mov     al, 19h
test    word ptr [di], 1Ch
jz      short loc_1E01D
push    ax
push    di
push    bp
push    es
mov     ax, 1130h
mov     bh, 0
mov     dl, 0FFh
int     10h             ; - VIDEO - TEXT-MODE CHARACTER GENERATOR FUNCTIONS (PS, EGA, VGA)
                        ; AL = 00h, 10h: load user-specified patterns
                        ; AL = 01h, 11h: load ROM monochrome patterns (8 by 14)
                        ; AL = 02h, 12h: load ROM 8 by 8 double-dot patterns
                        ; AL = 03h: set block specifier
pop     es
pop     bp
pop     di
pop     ax
inc     dl
jz      short loc_1E01D
mov     al, dl
push    ax
mul     cl
mov     cx, 0C8h
cmp     ax, cx
jbe     short loc_1E018
mov     cx, 15Eh
cmp     ax, cx
jbe     short loc_1E018
mov     cx, 190h

loc_1E018:
mov     [di+9Eh], cx
pop     ax

loc_1E01D:
mov     [di+9Bh], al
mov     ax, [di]
test    ax, 200h
jz      short loc_1E02F
mov     ax, 6F04h
int     10h             ; - VIDEO - GET MODE AND SCREEN RESOLUTION (Video7 VGA, VEGA VGA)
                        ; Return: AL = current video mode
                        ; BX = horizontal columns (text) or pixels (graphics)
                        ; CX = vertical columns (text) or pixels (graphics)
jmp     short loc_1E061

loc_1E02F:
test    ax, 20h
jz      short loc_1E053
mov     al, [di+51h]
cmp     al, 4
jb      short loc_1E03F
cmp     al, 7
jnz     short loc_1E053

loc_1E03F:
cmp     byte ptr [di+8Ch], 2Ch ; ','
jnz     short loc_1E048
or      al, 10h

loc_1E048:
cmp     word ptr [di+52h], 84h
jnz     short loc_1E061
or      al, 20h
jmp     short loc_1E061

loc_1E053:
mov     al, [di+51h]
and     al, 7Fh
test    word ptr [di], 40h
jz      short loc_1E061
call    sub_1E0A8

loc_1E061:
mov     [di+9Ah], al
mov     ah, 0
mov     bx, 0B000h
cmp     byte ptr [di+6Bh], 0B4h
jz      short loc_1E07E
mov     bh, 0B8h
mov     ah, 2
cmp     al, 0
jz      short loc_1E07E
cmp     al, 2
jz      short loc_1E07E
mov     ah, 1

loc_1E07E:
mov     [di+0A0h], ah
mov     [di+98h], bx
mov     al, 0
test    word ptr [di], 2
jz      short loc_1E097
test    byte ptr [di+0A1h], 10h
jnz     short loc_1E097
mov     al, 0FFh

loc_1E097:
mov     [di+0A2h], al
mov     ax, [di+68h]
mov     dx, [di]
call    sub_1E85C
mov     [di+9Ch], ax
retn
sub_1DFE1 endp




sub_1E0A8 proc near
mov     ax, 40h ; '@'
mov     es, ax
assume es:nothing
mov     al, es:65h
test    al, 2
mov     al, 0Fh
jnz     short locret_1E0B9
mov     al, 7

locret_1E0B9:
retn
sub_1E0A8 endp




sub_1E0BA proc near
push    si
push    di
push    es
mov     di, ax
les     di, [di]
assume es:nothing
mov     si, ax
add     si, 4

loc_1E0C6:
cmp     byte ptr [si], 0
jz      short loc_1E0CE
cmpsb
jz      short loc_1E0C6

loc_1E0CE:
pop     es
pop     di
pop     si
retn
sub_1E0BA endp




sub_1E0D2 proc near
push    si
mov     dx, 3BAh
mov     si, cx
xor     bx, bx

loc_1E0DA:              ; Video status bits:
in      al, dx          ; 0: retrace.  1=display is in vert or horiz retrace.
                        ; 1: 1=light pen is triggered; 0=armed
                        ; 2: 1=light pen switch is open; 0=closed
                        ; 3: 1=vertical sync pulse is occurring.
test    al, 80h
loopne  loc_1E0DA
jnz     short loc_1E0F4
mov     cx, si
cli

loc_1E0E4:              ; Video status bits:
in      al, dx          ; 0: retrace.  1=display is in vert or horiz retrace.
                        ; 1: 1=light pen is triggered; 0=armed
                        ; 2: 1=light pen switch is open; 0=closed
                        ; 3: 1=vertical sync pulse is occurring.
inc     bx
test    al, 80h
loope   loc_1E0E4
jz      short loc_1E0F4
mov     cx, si

loc_1E0EE:              ; Video status bits:
in      al, dx          ; 0: retrace.  1=display is in vert or horiz retrace.
                        ; 1: 1=light pen is triggered; 0=armed
                        ; 2: 1=light pen switch is open; 0=closed
                        ; 3: 1=vertical sync pulse is occurring.
inc     bx
test    al, 80h
loopne  loc_1E0EE

loc_1E0F4:
sti
pop     si
retn
sub_1E0D2 endp

db 24h, 2Ah, 24h, 2Ah, 24h, 2Ah, 1, 2, 7
db 1, 57h, 49h, 4Eh, 4Dh, 41h, 4Eh, 0, 1
db 2 dup(0)



sub_1E10B proc near
push    cx
push    dx
push    si
push    di
push    ds
push    es
push    word ptr [bp-2]
mov     [bp-2], bx
retn
sub_1E10B endp ; sp-analysis failed




sub_1E118 proc near
pop     cx
mov     bx, [bp-2]
mov     [bp-2], cx
pop     es
pop     ds
pop     di
pop     si
pop     dx
pop     cx
retn
sub_1E118 endp ; sp-analysis failed




sub_1E126 proc near
push    bx
push    ds
pop     es
call    $+3

loc_1E12C:
pop     bx
sub     bx, (offset loc_1E12C - offset start)
mov     ds, word ptr cs:(loc_2E108+1 - 0FFFF2360h)[bx]
mov     ax, bx
pop     bx
retn
sub_1E126 endp




sub_1E13A proc near
pop     ax
push    bp
mov     bp, sp
push    si
push    di
push    ds
push    ax
cld
call    sub_1E126
push    ax
mov     ax, ds
or      ax, ax
jnz     short loc_1E150
stc
jmp     short loc_1E15E

loc_1E150:
mov     byte ptr ds:21h, 3
inc     byte ptr ds:20h
mov     bx, ds:0
clc

loc_1E15E:
pop     ax
retn
sub_1E13A endp ; sp-analysis failed




sub_1E160 proc near
pushf
push    ax
mov     ax, ds
or      ax, ax
jz      short loc_1E1A4
dec     byte ptr ds:20h
jnz     short loc_1E1A4
cmp     word ptr ds:1Ch, 0
jnz     short loc_1E17C
cmp     word ptr ds:1Eh, 0
jz      short loc_1E1A4

loc_1E17C:
inc     byte ptr ds:20h
push    bx
push    cx
push    dx
push    bp
push    si
push    di
push    ds
push    es
call    dword ptr ds:1Ch
pop     es
pop     ds
pop     di
pop     si
pop     bp
pop     dx
pop     cx
pop     bx
dec     byte ptr ds:20h
mov     word ptr ds:1Ch, 0
mov     word ptr ds:1Eh, 0

loc_1E1A4:
pop     ax
popf
pop     cx
pop     ds
pop     di
pop     si
pop     bp
push    cx
retn
sub_1E160 endp ; sp-analysis failed




sub_1E1AD proc near
cmp     bx, ds:2
jz      short loc_1E1B8
mov     ax, [bx+0Ch]
jmp     short locret_1E1BE

loc_1E1B8:
call    sub_1E821
mov     [bx+0Ch], ax

locret_1E1BE:
retn
sub_1E1AD endp




sub_1E1BF proc near
cmp     bx, ds:2
jz      short loc_1E1CA
mov     ax, [bx+0Eh]
jmp     short locret_1E1D0

loc_1E1CA:
call    sub_1E830
mov     [bx+0Eh], ax

locret_1E1D0:
retn
sub_1E1BF endp




sub_1E1D1 proc near
push    cx
mov     cl, al
cmp     cl, 0
jnz     short loc_1E1E1
call    sub_1E1BF
or      ax, 2000h
jmp     short loc_1E21A

loc_1E1E1:
mov     ax, 7
cmp     word ptr ds:24h, 3B4h
jnz     short loc_1E1F7
mov     al, 0Dh
cmp     byte ptr ds:29h, 19h
jz      short loc_1E1F7
mov     al, 7

loc_1E1F7:
cmp     cl, 2
jz      short loc_1E21A
mov     ah, al
dec     ah
cmp     byte ptr ds:29h, 19h
jz      short loc_1E21A
test    word ptr ds:22h, 4
jz      short loc_1E21A
test    word ptr ds:22h, 20h
jnz     short loc_1E21A
mov     ax, 600h

loc_1E21A:
pop     cx
retn
sub_1E1D1 endp




sub_1E21C proc near
sub     sp, 0F0h
push    bp
mov     bp, sp
call    sub_1E10B
mov     dl, [bx+2]
sub     dl, [bx]
inc     dl
push    ss
pop     es
lea     di, [bp+52h]
mov     al, [bx]
mov     ah, 0
shl     ax, 1
add     di, ax
mov     al, [bx+4]
mul     byte ptr ds:2Bh
push    ds
lds     si, ds:2Ch
add     si, ax
mov     al, [si+4]
pop     ds
mov     ah, [bx+5]
mov     cl, dl
mov     ch, 0
rep stosw
push    ds
lds     si, [bp+0F4h]
push    ss
pop     es
lea     di, [bp+2]
push    es
push    ds
pop     es
xchg    si, di
push    di
mov     al, 0
mov     cx, 0FFFFh
repne scasb
dec     di
pop     cx
mov     ax, di
sub     ax, cx
mov     di, cx
xchg    si, di
pop     es
or      ax, ax
jz      short loc_1E295
mov     cx, ax
cmp     cx, 50h ; 'P'
jb      short loc_1E285
mov     cx, 50h ; 'P'

loc_1E285:
mov     ax, cx
rep movsb
cmp     al, 50h ; 'P'
jbe     short loc_1E28F
mov     al, 50h ; 'P'

loc_1E28F:
cmp     al, dl
jbe     short loc_1E295
mov     al, dl

loc_1E295:
pop     ds
mov     [bx+0Ah], al
mov     cx, ax
jcxz    short loc_1E2BB
neg     al
add     al, dl
shr     ax, 1
add     al, [bx]
shl     ax, 1
lea     di, [bp+52h]
add     di, ax
push    ds
push    ss
pop     ds
lea     si, [bp+2]
mov     al, [bp+0F8h]

loc_1E2B6:
movsb
stosb
loop    loc_1E2B6
pop     ds

loc_1E2BB:
push    ss
lea     ax, [bp+52h]
push    ax
push    word ptr [bx+2]
push    word ptr [bx]
push    word ptr [bx+7]
call    sub_1E2DA
call    sub_1E118
pop     bp
add     sp, 0F0h
retn    6
sub_1E21C endp




sub_1E2D6 proc near
mov     al, 1
jmp     short loc_1E2DC
sub_1E2D6 endp




sub_1E2DA proc near
mov     al, 0

loc_1E2DC:
sub     sp, 8
push    bp
mov     bp, sp
call    sub_1E10B
mov     [bp+4], al
mov     al, [bp+10h]
sub     al, [bp+0Eh]
inc     al
mov     [bp+8], al
cmp     byte ptr [bx+20h], 1
jnz     short loc_1E301
mov     cl, [bp+8]
call    sub_1E364
jmp     short loc_1E35A

loc_1E301:
mov     al, [bp+0Ch]
mov     dl, [bp+0Eh]
mov     cl, [bp+8]
call    sub_1E3D8
mov     [bp+6], dl
or      al, al
jnz     short loc_1E339
push    dx
mov     al, [bp+0Eh]
mov     ah, 0
shl     ax, 1
les     di, [bp+12h]
add     ax, di
push    es
push    ax
push    word ptr [bp+0Eh]
push    word ptr [bp+0Ch]
cmp     byte ptr [bp+4], 1
jz      short loc_1E334
call    sub_1E733
jmp     short loc_1E348

loc_1E334:
call    sub_1E778
jmp     short loc_1E348

loc_1E339:
mov     cl, 22h ; '"'
mul     cl
add     ax, 30h ; '0'
mov     bx, ax
mov     cl, [bp+6]
call    sub_1E364

loc_1E348:
mov     al, [bp+6]
mov     cl, [bp+8]
sub     cl, al
jle     short loc_1E35A
mov     [bp+8], cl
add     [bp+0Eh], al
jmp     short loc_1E301

loc_1E35A:
call    sub_1E118
pop     bp
add     sp, 8
retn    0Ah
sub_1E2DA endp




sub_1E364 proc near
mov     al, ds:21h
mov     [bp+2], al
mov     ch, 0
mov     al, [bp+0Ch]
sub     al, [bx+7]
mov     dl, [bx+8]
sub     dl, [bx+6]
inc     dl
mul     dl
mov     dl, [bp+0Eh]
sub     dl, [bx+6]
mov     dh, 0
add     ax, dx
shl     ax, 1
mov     si, [bx+12h]
add     si, ax
mov     dl, [bp+0Eh]
shl     dx, 1
les     di, [bp+12h]
add     di, dx
cmp     byte ptr [bp+4], 1
jz      short loc_1E3A3
xchg    si, di
push    ds
push    es
pop     ds
pop     es

loc_1E3A3:
test    byte ptr [bp+2], 1
jz      short loc_1E3B3
test    byte ptr [bp+2], 2
jz      short loc_1E3BB
rep movsw
jmp     short loc_1E3C1

loc_1E3B3:
call    sub_1E3CE
movsb
loop    loc_1E3B3
jmp     short loc_1E3C1

loc_1E3BB:
movsb
call    sub_1E3CE
loop    loc_1E3BB

loc_1E3C1:
cmp     byte ptr [bp+4], 1
jz      short locret_1E3CD
xchg    si, di
push    ds
push    es
pop     ds
pop     es

locret_1E3CD:
retn
sub_1E364 endp




sub_1E3CE proc near
cmp     byte ptr [bp+4], 1
jz      short loc_1E3D6
inc     di
retn

loc_1E3D6:
inc     si
retn
sub_1E3CE endp




sub_1E3D8 proc near
mov     dl, cl
mov     dh, 0
mov     al, 0
retn
sub_1E3D8 endp




sub_1E3DF proc near
sub     sp, 0A0h
push    bp
mov     bp, sp
call    sub_1E10B
mov     al, [bx+4]
cmp     al, 0
jnz     short loc_1E3F3
jmp     loc_1E4E1

loc_1E3F3:
mul     byte ptr ds:2Bh
add     ax, ds:2Ch
mov     si, ax
push    ds
mov     ds, word ptr ds:2Eh
mov     al, [si+2]
mov     ah, [si+3]
pop     ds
push    ax
mov     cl, [bx+6]
call    sub_1E4EA
pop     ax
mov     al, ah
mov     cl, [bx+8]
call    sub_1E4EA
lea     di, [bp+2]
mov     dl, [bx]
mov     dh, 0
add     di, dx
add     di, dx
mov     cl, [bx+2]
mov     ch, 0
sub     cx, dx
inc     cx
push    ds
mov     ds, word ptr ds:2Eh
mov     al, [si+4]
pop     ds
mov     ah, [bx+5]
push    ss
pop     es
rep stosw
lea     ax, [bp+2]
push    ss
push    ax
push    word ptr [bx+8]
push    word ptr [bx+6]
push    word ptr [bx+9]
call    sub_1E2DA
push    ds
mov     ds, word ptr ds:2Eh
mov     al, [si]
mov     ah, [si+1]
pop     ds
push    ax
mov     cl, [bx+6]
call    sub_1E4EA
pop     ax
mov     al, ah
mov     cl, [bx+8]
call    sub_1E4EA
mov     al, [bx+2]
mov     cl, [bx]
mov     ch, [bx+0Ah]
sub     al, cl
inc     al
sub     al, ch
shr     al, 1
add     cl, al
add     ch, cl
dec     ch
lea     ax, [bp+2]
push    ss
push    ax
dec     cl
push    cx
push    word ptr [bx+6]
push    word ptr [bx+7]
call    sub_1E2DA
lea     ax, [bp+2]
push    ss
push    ax
push    word ptr [bx+8]
inc     ch
xchg    cl, ch
push    cx
push    word ptr [bx+7]
call    sub_1E2DA
mov     dl, [bx+1]
push    ds
mov     ds, word ptr ds:2Eh
mov     dh, [si+5]
pop     ds

loc_1E4AE:
cmp     dl, [bx+3]
ja      short loc_1E4E1
mov     al, dh
mov     cl, [bx+6]
call    sub_1E4EA
mov     cl, [bx+8]
call    sub_1E4EA
lea     ax, [bp+2]
push    ss
push    ax
mov     al, [bx+6]
push    ax
push    ax
push    dx
call    sub_1E2DA
lea     ax, [bp+2]
push    ss
push    ax
mov     al, [bx+8]
push    ax
push    ax
push    dx
call    sub_1E2DA
inc     dl
jmp     short loc_1E4AE

loc_1E4E1:
call    sub_1E118
pop     bp
add     sp, 0A0h
retn
sub_1E3DF endp




sub_1E4EA proc near
lea     di, [bp+2]
mov     ch, 0
shl     cx, 1
add     di, cx
mov     ah, [bx+5]
mov     ss:[di], ax
retn
sub_1E4EA endp



; Attributes: bp-based frame

sub_1E4FA proc near
push    bp
mov     bp, sp
call    sub_1E10B
mov     si, 30h ; '0'
cmp     [bx+16h], si
jnz     short loc_1E513
mov     ax, [bx+14h]
mov     ds:16h, ax
mov     [si+14h], ax
jmp     short loc_1E51C

loc_1E513:
mov     di, [bx+16h]
mov     ax, [bx+14h]
mov     [di+14h], ax

loc_1E51C:
cmp     word ptr [bx+14h], 30h ; '0'
jnz     short loc_1E52D
mov     ax, [bx+16h]
mov     ds:14h, ax
mov     [si+16h], ax
jmp     short loc_1E536

loc_1E52D:
mov     di, [bx+14h]
mov     ax, [bx+16h]
mov     [di+16h], ax

loc_1E536:
mov     byte ptr [bx+20h], 0
call    sub_1E118
pop     bp
retn
sub_1E4FA endp




sub_1E53F proc near
push    si
mov     bx, ds:2
mov     si, ds:14h

loc_1E548:
cmp     si, 30h ; '0'
jz      short loc_1E558
cmp     byte ptr [si+20h], 2
jz      short loc_1E558
mov     si, [si+16h]
jmp     short loc_1E548

loc_1E558:
cmp     bx, si
jz      short loc_1E577
call    sub_1E1AD
call    sub_1E830
mov     [bx+0Eh], ax
mov     bx, si
mov     ds:2, bx
mov     ax, [bx+0Ch]
call    sub_1E846
mov     ax, [bx+0Eh]
call    sub_1E853

loc_1E577:
pop     si
retn
sub_1E53F endp




sub_1E579 proc near
sub     sp, 0A2h
push    bp
mov     bp, sp
call    sub_1E10B
mov     cl, [bx+8]
mov     ch, 0
mov     dl, [bx+6]
mov     dh, 0
sub     cx, dx
inc     cx
mov     si, [bx+12h]
mov     al, [bx+7]
mov     [bp+2], al

loc_1E599:
mov     al, [bp+2]
cmp     al, [bx+9]
ja      short loc_1E5E0
lea     ax, [bp+4]
push    ss
push    ax
push    word ptr [bx+8]
push    dx
push    word ptr [bp+2]
call    sub_1E2D6
mov     ax, si
sub     ax, dx
sub     ax, dx
push    ds
push    ax
push    word ptr [bx+8]
push    dx
push    word ptr [bp+2]
call    sub_1E2DA
lea     di, [bp+4]
add     di, dx
add     di, dx
xchg    si, di
push    ds
push    ss
pop     ds
pop     es
push    cx
push    di
rep movsw
pop     si
pop     cx
push    es
pop     ds
add     si, cx
add     si, cx
inc     byte ptr [bp+2]
jmp     short loc_1E599

loc_1E5E0:
call    sub_1E118
pop     bp
add     sp, 0A2h
retn
sub_1E579 endp



; Attributes: bp-based frame

sub_1E5E9 proc near

arg_0= byte ptr  4

push    bp
mov     bp, sp
call    sub_1E10B
mov     dl, [bx+8]
mov     dh, 0
mov     cl, [bx+6]
mov     ch, 0
sub     dx, cx
inc     dx
mov     al, [bx+7]
mul     byte ptr ds:28h
add     ax, cx
shl     ax, 1
mov     di, ax
mov     es, word ptr ds:0Ch
mov     cl, [bx+9]
sub     cl, [bx+7]
inc     cl
mov     ch, 0
mov     al, ds:28h
mov     ah, 0
shl     ax, 1
mov     si, [bx+12h]
cmp     [bp+arg_0], 0
jz      short loc_1E64E

loc_1E627:
mov     byte ptr [bx+20h], 1
or      si, si
jz      short loc_1E67D
push    bp
mov     bp, ds:21h
or      bp, 4
push    ax
push    cx
mov     cx, dx
cmp     byte ptr ds:26h, 0
push    di
call    sub_1E7BD
pop     di
pop     cx
pop     ax
pop     bp
add     di, ax
loop    loc_1E627
jmp     short loc_1E67D

loc_1E64E:
mov     byte ptr [bx+20h], 2
or      si, si
jz      short loc_1E67D
push    es
push    ds
pop     es
pop     ds
xchg    si, di

loc_1E65C:
push    bp
mov     bp, es:21h
or      bp, 8
push    ax
push    cx
mov     cx, dx
cmp     byte ptr es:26h, 0
push    si
call    sub_1E7BD
pop     si
pop     cx
pop     ax
pop     bp
add     si, ax
loop    loc_1E65C
push    es
pop     ds

loc_1E67D:
call    sub_1E53F
call    sub_1E118
pop     bp
retn    2
sub_1E5E9 endp




sub_1E687 proc near
cmp     byte ptr [bx+20h], 2
jz      short locret_1E697
mov     byte ptr [bx+20h], 2
call    sub_1E579
call    sub_1E53F

locret_1E697:
retn
sub_1E687 endp




sub_1E698 proc near
cmp     byte ptr [bx+20h], 1
jz      short locret_1E6A8
call    sub_1E579
mov     byte ptr [bx+20h], 1
call    sub_1E53F

locret_1E6A8:
retn
sub_1E698 endp




sub_1E6A9 proc near
sub     sp, 0A0h
push    bp
mov     bp, sp
call    sub_1E10B
mov     al, 20h ; ' '
mov     ah, [bx+0Bh]
mov     cx, 50h ; 'P'
push    ss
pop     es
lea     di, [bp+2]
push    di
rep stosw
pop     di
mov     cl, [bx+3]
mov     dl, [bx+1]
sub     cl, dl
inc     cl
mov     ch, 0

loc_1E6D0:
push    ss
push    di
push    word ptr [bx+2]
push    word ptr [bx]
push    dx
call    sub_1E2DA
inc     dl
loop    loc_1E6D0
mov     ax, [bx]
mov     [bx+0Ch], ax
cmp     bx, ds:2
jnz     short loc_1E6ED
call    sub_1E846

loc_1E6ED:
call    sub_1E118
pop     bp
add     sp, 0A0h
retn
sub_1E6A9 endp




sub_1E6F6 proc near
jb      short locret_1E70B
cmp     byte ptr [bx+20h], 1
jnz     short locret_1E70B
cmp     word ptr [bx+12h], 0
jnz     short locret_1E70B
mov     word ptr ds:4, 0Bh
stc

locret_1E70B:
retn
sub_1E6F6 endp

jb      short locret_1E71B



sub_1E70E proc near
cmp     word ptr [bx+12h], 0
jnz     short locret_1E71B
mov     word ptr ds:4, 0Bh
stc

locret_1E71B:
retn
sub_1E70E endp




sub_1E71C proc near
mov     ds:2, bx
mov     ds:14h, bx
mov     ds:16h, bx
mov     ds:0, bx
mov     [bx+14h], bx
mov     [bx+16h], bx
retn
sub_1E71C endp




sub_1E733 proc near
dec     sp
dec     sp
push    bp
mov     bp, sp
push    cx
push    si
push    di
push    ds
push    es
mov     cx, [bp+0Eh]
jcxz    short loc_1E76D
mov     al, ds:21h
or      al, 4
mov     [bp+2], ax
mov     es, word ptr ds:0Ch
mov     al, [bp+6]
mul     byte ptr ds:28h
add     al, [bp+8]
adc     ah, 0
shl     ax, 1
mov     di, ax
cmp     byte ptr ds:26h, 0
lds     si, [bp+0Ah]
mov     bp, [bp+2]
call    sub_1E7BD

loc_1E76D:
pop     es
pop     ds
pop     di
pop     si
pop     cx
pop     bp
inc     sp
inc     sp
retn    0Ah
sub_1E733 endp




sub_1E778 proc near
dec     sp
dec     sp
push    bp
mov     bp, sp
push    cx
push    si
push    di
push    ds
push    es
mov     cx, [bp+0Eh]
jcxz    short loc_1E7B2
mov     al, ds:21h
or      al, 8
mov     [bp+2], ax
les     di, [bp+0Ah]
mov     al, [bp+6]
mul     byte ptr ds:28h
add     al, [bp+8]
adc     ah, 0
shl     ax, 1
mov     si, ax
cmp     byte ptr ds:26h, 0
mov     ds, word ptr ds:0Ch
mov     bp, [bp+2]
call    sub_1E7BD

loc_1E7B2:
pop     es
pop     ds
pop     di
pop     si
pop     cx
pop     bp
inc     sp
inc     sp
retn    0Ah
sub_1E778 endp




sub_1E7BD proc near

; FUNCTION CHUNK AT E7FF SIZE 00000022 BYTES

push    dx
jnz     short loc_1E7D0
test    bp, 1
jz      short loc_1E7FF
test    bp, 2
jz      short loc_1E802
rep movsw
jmp     short loc_1E81F

loc_1E7D0:
mov     dx, 3DAh
test    bp, 1
jz      short loc_1E80A
test    bp, 2
jz      short loc_1E80D

loc_1E7DF:
cli

loc_1E7E0:              ; Video status bits:
in      al, dx          ; 0: retrace.  1=display is in vert or horiz retrace.
                        ; 1: 1=light pen is triggered; 0=armed
                        ; 2: 1=light pen switch is open; 0=closed
                        ; 3: 1=vertical sync pulse is occurring.
ror     al, 1
jb      short loc_1E7E0

loc_1E7E5:              ; Video status bits:
in      al, dx          ; 0: retrace.  1=display is in vert or horiz retrace.
                        ; 1: 1=light pen is triggered; 0=armed
                        ; 2: 1=light pen switch is open; 0=closed
                        ; 3: 1=vertical sync pulse is occurring.
ror     al, 1
jnb     short loc_1E7E5
movsw
sti
loop    loc_1E7DF
jmp     short loc_1E81F
sub_1E7BD endp




sub_1E7F0 proc near
test    bp, 8
jz      short loc_1E7F7
inc     si

loc_1E7F7:
test    bp, 4
jz      short locret_1E7FE
inc     di

locret_1E7FE:
retn
sub_1E7F0 endp

; START OF FUNCTION CHUNK FOR sub_1E7BD

loc_1E7FF:
call    sub_1E7F0

loc_1E802:
movsb
call    sub_1E7F0
loop    loc_1E802
jmp     short loc_1E81F

loc_1E80A:
call    sub_1E7F0

loc_1E80D:
cli

loc_1E80E:
in      al, dx
ror     al, 1
jb      short loc_1E80E

loc_1E813:
in      al, dx
ror     al, 1
jnb     short loc_1E813
movsb
sti
call    sub_1E7F0
loop    loc_1E80D

loc_1E81F:
pop     dx
retn
; END OF FUNCTION CHUNK FOR sub_1E7BD



sub_1E821 proc near
push    bx
push    cx
push    dx
mov     ah, 3
mov     bh, 0
int     10h             ; - VIDEO - READ CURSOR POSITION
                        ; BH = page number
                        ; Return: DH,DL = row,column, CH = cursor start line, CL = cursor end line
mov     ax, dx
pop     dx
pop     cx
pop     bx
retn
sub_1E821 endp




sub_1E830 proc near
push    bx
push    cx
push    dx
mov     ah, 3
mov     bh, 0
int     10h             ; - VIDEO - READ CURSOR POSITION
                        ; BH = page number
                        ; Return: DH,DL = row,column, CH = cursor start line, CL = cursor end line
mov     ax, cx
mov     dx, ds:22h
call    sub_1E85C
pop     dx
pop     cx
pop     bx
retn
sub_1E830 endp




sub_1E846 proc near
push    bx
push    dx
mov     dx, ax
mov     ah, 2
mov     bh, 0
int     10h             ; - VIDEO - SET CURSOR POSITION
                        ; DH,DL = row, column (0,0 = upper left)
                        ; BH = page number
pop     dx
pop     bx
retn
sub_1E846 endp




sub_1E853 proc near
push    cx
mov     cx, ax
mov     ah, 1
int     10h             ; - VIDEO - SET CURSOR CHARACTERISTICS
                        ; CH bits 0-4 = start line for cursor in character cell
                        ; bits 5-6 = blink attribute
                        ; CL bits 0-4 = end line for cursor in character cell
pop     cx
retn
sub_1E853 endp




sub_1E85C proc near
test    dx, 1
jz      short loc_1E86C
cmp     ax, 607h
jnz     short locret_1E87A
mov     ax, 0B0Ch
jmp     short locret_1E87A

loc_1E86C:
test    dx, 2
jz      short locret_1E87A
cmp     ax, 67h ; 'g'
jnz     short locret_1E87A
mov     ax, 607h

locret_1E87A:
retn
sub_1E85C endp




sub_1E87B proc near
call    sub_1E13A
mov     ax, [bp+4]
push    es
push    ax
call    sub_1DD40
call    sub_1E160
retn    2
sub_1E87B endp




sub_1E88C proc near
call    sub_1E13A
jnb     short loc_1E89C
mov     ax, ds
or      ax, ax
jnz     short loc_1E89C
mov     ax, 1
jmp     short loc_1E8A5

loc_1E89C:
mov     ax, ds:4
mov     word ptr ds:4, 0

loc_1E8A5:
call    sub_1E160
retn
sub_1E88C endp




sub_1E8A9 proc near
call    sub_1E13A
jnb     short loc_1E8B9
mov     ax, ds
or      ax, ax
jnz     short loc_1E8B9
mov     ax, 1
jmp     short loc_1E8BC

loc_1E8B9:
mov     ax, ds:4

loc_1E8BC:
call    sub_1E160
retn
sub_1E8A9 endp




sub_1E8C0 proc near
call    sub_1E13A
jb      short loc_1E907
mov     ax, [bp+4]
or      ax, ax
jnz     short loc_1E8CF
mov     ax, 30h ; '0'

loc_1E8CF:
mov     bx, ax
cmp     ax, 30h ; '0'
jb      short loc_1E8EA
cmp     ax, ds:1Ah
jnb     short loc_1E8EA
sub     ax, 30h ; '0'
mov     cx, 22h ; '"'
xor     dx, dx
div     cx
or      dx, dx
jz      short loc_1E8F2

loc_1E8EA:
mov     word ptr ds:4, 7
jmp     short loc_1E907

loc_1E8F2:
cmp     byte ptr [bx+20h], 0
jnz     short loc_1E900
mov     word ptr ds:4, 5
jmp     short loc_1E907

loc_1E900:
mov     ax, ds:0
mov     ds:0, bx

loc_1E907:
call    sub_1E160
retn    2
sub_1E8C0 endp




sub_1E90D proc near
call    sub_1E13A
call    sub_1E6F6
jb      short loc_1E936
cmp     byte ptr [bx+4], 0
jnz     short loc_1E923
mov     word ptr ds:4, 9
jmp     short loc_1E936

loc_1E923:
mov     al, [bp+4]
cmp     al, 0FFh
jnz     short loc_1E92D
mov     al, [bx+5]

loc_1E92D:
push    ax
mov     di, [bp+6]
push    es
push    di
call    sub_1E21C

loc_1E936:
call    sub_1E160
retn    4
sub_1E90D endp




sub_1E93C proc near
call    sub_1E13A
jnb     short loc_1E947
mov     bx, 0FFFFh
jmp     loc_1EA90

loc_1E947:
mov     cl, [bp+14h]
dec     cl
mov     ch, [bp+12h]
dec     ch
mov     dl, [bp+10h]
dec     dl
mov     dh, [bp+0Eh]
dec     dh
mov     ax, ds:28h
cmp     cl, al
jnb     short loc_1E984
cmp     ch, ah
jnb     short loc_1E984
cmp     dl, cl
jb      short loc_1E984
cmp     dl, al
jnb     short loc_1E984
cmp     dh, ch
jb      short loc_1E984
cmp     dh, ah
jnb     short loc_1E984
cmp     byte ptr [bp+0Ch], 0
jz      short loc_1E990
cmp     cl, dl
jz      short loc_1E984
cmp     ch, dh
jnz     short loc_1E990

loc_1E984:
mov     word ptr ds:4, 3
mov     bx, 0FFFFh
jmp     loc_1EA90

loc_1E990:
push    cx
mov     cl, ds:2Ah
mov     ch, 0
mov     bx, 30h ; '0'

loc_1E99A:
add     bx, 22h ; '"'
cmp     byte ptr [bx+20h], 0
jz      short loc_1E9B2
loop    loc_1E99A
pop     cx
mov     word ptr ds:4, 2
mov     bx, 0FFFFh
jmp     loc_1EA90

loc_1E9B2:
cmp     byte ptr [bp+4], 0
jz      short loc_1E9E3
pop     cx
push    cx
mov     al, dl
sub     al, cl
inc     al
mov     ah, dh
sub     ah, ch
inc     ah
mul     ah
shl     ax, 1
mov     cx, ds:0Eh
sub     cx, ds:6
cmp     cx, ax
jnb     short loc_1E9E3
pop     cx
mov     word ptr ds:4, 4
mov     bx, 0FFFFh
jmp     loc_1EA90

loc_1E9E3:
xor     cx, cx
cmp     byte ptr [bp+4], 0
jz      short loc_1E9F3
mov     cx, ds:6
add     ds:6, ax

loc_1E9F3:
mov     [bx+12h], cx
xor     ax, ax
mov     [bx+10h], ax
mov     al, [bp+0Ch]
mov     [bx+4], al
mov     al, [bp+0Ah]
mov     [bx+5], al
mov     al, [bp+8]
mov     [bx+0Bh], al
pop     cx
mov     [bx+6], cx
mov     [bx+8], dx
cmp     byte ptr [bx+4], 0
jz      short loc_1EA22
inc     cl
inc     ch
dec     dl
dec     dh

loc_1EA22:
mov     [bx], cx
mov     [bx+2], dx
mov     di, ds:14h
mov     [bx+16h], di
mov     word ptr [bx+14h], 30h ; '0'
cmp     word ptr ds:16h, 30h ; '0'
jnz     short loc_1EA42
mov     ds:16h, bx
mov     ds:44h, bx

loc_1EA42:
cmp     di, 30h ; '0'
jz      short loc_1EA4A
mov     [di+14h], bx

loc_1EA4A:
mov     ds:0, bx
mov     ds:14h, bx
mov     ds:46h, bx
mov     byte ptr [bx+20h], 1
mov     byte ptr [bx+0Ah], 0
cmp     byte ptr [bp+4], 0
jz      short loc_1EA7C
cmp     byte ptr [bx+4], 0
jz      short loc_1EA73
cmp     byte ptr [bx+5], 0FFh
jz      short loc_1EA73
call    sub_1E3DF

loc_1EA73:
cmp     byte ptr [bx+0Bh], 0FFh
jz      short loc_1EA7C
call    sub_1E6A9

loc_1EA7C:
mov     ax, [bx]
mov     [bx+0Ch], ax
call    sub_1E830
mov     [bx+0Eh], ax
mov     al, [bp+6]
call    sub_1E1D1
mov     [bx+0Eh], ax

loc_1EA90:
mov     ax, bx
call    sub_1E160
retn    12h
sub_1E93C endp




sub_1EA98 proc near
call    sub_1E13A
jb      short loc_1EAC6
cmp     bx, 30h ; '0'
jnz     short loc_1EAAA
mov     word ptr ds:4, 7
jmp     short loc_1EAC6

loc_1EAAA:
cmp     byte ptr [bx+20h], 2
jnz     short loc_1EAC6
cmp     byte ptr [bp+4], 0
jnz     short loc_1EABE
mov     al, 1
push    ax
call    sub_1E5E9
jmp     short loc_1EAC6

loc_1EABE:
call    sub_1E70E
jb      short loc_1EAC6
call    sub_1E698

loc_1EAC6:
call    sub_1E160
retn    2
sub_1EA98 endp




sub_1EACC proc near
call    sub_1E13A
jb      short loc_1EB10
mov     bx, ds:14h

loc_1EAD5:
cmp     bx, 30h ; '0'
jz      short loc_1EAF6
cmp     byte ptr [bx+20h], 2
jnz     short loc_1EAED
push    bx
mov     ds:0, bx
push    word ptr ds:11h
call    sub_1EA98
pop     bx

loc_1EAED:
mov     byte ptr [bx+20h], 0
mov     bx, [bx+16h]
jmp     short loc_1EAD5

loc_1EAF6:
call    sub_1E71C
mov     ax, ds:1Ah
mov     ds:6, ax
cmp     byte ptr [bp+4], 0
jz      short loc_1EB10
mov     bx, ds:8
mov     word ptr cs:[bx-1EF7h], 0

loc_1EB10:
mov     ax, ds:4
mov     word ptr ds:4, 0
call    sub_1E160
retn    2
sub_1EACC endp




sub_1EB1F proc near
call    sub_1E13A
call    sub_1E6F6
jb      short loc_1EB36
push    word ptr [bx+10h]
mov     ax, [bp+4]
push    es
push    ax
xor     ax, ax
push    ax
push    ax
call    sub_1EBD3

loc_1EB36:
call    sub_1E160
retn    2
sub_1EB1F endp




sub_1EB3C proc near
call    sub_1E13A
call    sub_1E6F6
jb      short loc_1EB66
mov     cl, [bx+10h]
test    cl, 0Ch
jz      short loc_1EB51
or      cl, 8
jmp     short loc_1EB54

loc_1EB51:
or      cl, 0Ch

loc_1EB54:
mov     ch, [bp+4]
push    cx
mov     ax, [bp+6]
push    es
push    ax
push    word ptr [bp+8]
push    word ptr [bp+0Ah]
call    sub_1EBD3

loc_1EB66:
call    sub_1E160
retn    8
sub_1EB3C endp




sub_1EB6C proc near
call    sub_1E13A
call    sub_1E6F6
jb      short loc_1EB85
push    word ptr [bp+4]
mov     ax, [bp+6]
push    es
push    ax
push    word ptr [bp+8]
push    word ptr [bp+0Ah]
call    sub_1EBD3

loc_1EB85:
call    sub_1E160
retn    8
sub_1EB6C endp




sub_1EB8B proc near
mov     al, [bx+2]
cmp     [bp+6], al
nop
nop
jbe     short loc_1EBB4
test    dl, 20h
jz      short loc_1EBA8
mov     [bp+6], al
nop
nop
mov     word ptr [bp+2], 0
nop
nop
jmp     short locret_1EBD2

loc_1EBA8:
mov     al, [bx]
mov     [bp+6], al
nop
nop
inc     byte ptr [bp+4]
nop
nop

loc_1EBB4:
mov     al, [bx+3]
cmp     [bp+4], al
nop
nop
jbe     short locret_1EBD2
test    dl, 10h
jz      short loc_1EBCD
mov     al, [bx+1]
mov     [bp+4], al
nop
nop
jmp     short locret_1EBD2

loc_1EBCD:
mov     [bp+4], al
nop
nop

locret_1EBD2:
retn
sub_1EB8B endp




sub_1EBD3 proc near
sub     sp, 0ACh
push    bp
mov     bp, sp
call    sub_1E10B
mov     dx, [bp+0B8h]
les     di, [bp+0B4h]
test    dl, 4
jnz     short loc_1EBEF
test    dl, 8
jnz     short loc_1EC0B

loc_1EBEF:
push    di
mov     cx, 0FFFFh
xor     al, al
repne scasb
pop     ax
mov     cx, di
sub     cx, ax
dec     cx
mov     [bp+0A8h], cx
mov     [bp+0AAh], ax
mov     word ptr [bp+0ACh], es
jmp     short loc_1EC1D

loc_1EC0B:
mov     cl, es:[di]
xor     ch, ch
inc     di
mov     [bp+0A8h], cx
mov     [bp+0AAh], di
mov     word ptr [bp+0ACh], es

loc_1EC1D:
test    dl, 8
jnz     short loc_1EC2D
test    dl, 4
jnz     short loc_1EC2D
or      dl, 0Ch
mov     dh, [bx+0Bh]

loc_1EC2D:
xor     al, al
test    dl, 4
jz      short loc_1EC36
mov     al, 1

loc_1EC36:
test    dl, 8
jz      short loc_1EC3D
or      al, 2

loc_1EC3D:
mov     ds:21h, al
test    dl, 2
jz      short loc_1EC48
and     dl, 0FEh

loc_1EC48:
call    sub_1E1AD
mov     [bp+4], ah
mov     [bp+6], al
mov     cx, [bx]
mov     al, [bp+0B2h]
or      al, al
jz      short loc_1EC62
dec     al
add     al, ch
mov     [bp+4], al

loc_1EC62:
mov     al, [bp+0B0h]
or      al, al
jz      short loc_1EC71
dec     al
add     al, cl
mov     [bp+6], al

loc_1EC71:
mov     al, [bp+4]
cmp     al, [bx+3]
jbe     short loc_1EC7C
mov     [bp+4], al

loc_1EC7C:
cmp     al, ch
jnb     short loc_1EC83
mov     [bp+4], al

loc_1EC83:
mov     al, [bp+6]
cmp     al, [bx+2]
jbe     short loc_1EC8E
mov     [bp+6], al

loc_1EC8E:
cmp     al, cl
jnb     short loc_1EC95
mov     [bp+6], al

loc_1EC95:
mov     ax, [bp+0A8h]
mov     [bp+2], ax

loc_1EC9C:
mov     ax, [bp+2]
or      ax, ax
jnz     short loc_1ECA6
jmp     short loc_1ED00
align 2

loc_1ECA6:
mov     cl, [bx+2]
sub     cl, [bp+6]
xor     ch, ch
inc     cx
cmp     cx, ax
jbe     short loc_1ECB5
mov     cx, ax

loc_1ECB5:
push    cx
push    ds
lds     si, [bp+0AAh]
push    ss
pop     es
lea     di, [bp+8]
mov     al, [bp+6]
xor     ah, ah
shl     ax, 1
add     di, ax

loc_1ECC9:
test    dl, 4
jz      short loc_1ECCF
movsb

loc_1ECCF:
test    dl, 8
jz      short loc_1ECD7
mov     al, dh
stosb

loc_1ECD7:
loop    loc_1ECC9
mov     [bp+0AAh], si
pop     ds
pop     cx
push    ss
lea     ax, [bp+8]
push    ax
mov     al, [bp+6]
add     al, cl
dec     al
push    ax
push    word ptr [bp+6]
push    word ptr [bp+4]
call    sub_1E2DA
add     [bp+6], cl
sub     [bp+2], cx
call    sub_1EB8B
jmp     short loc_1EC9C

loc_1ED00:
test    dl, 1
jz      short loc_1ED10
inc     byte ptr [bp+4]
mov     al, [bx]
mov     [bp+6], al
call    sub_1EB8B

loc_1ED10:
test    dl, 2
jnz     short loc_1ED27
mov     al, [bp+6]
mov     ah, [bp+4]
mov     [bx+0Ch], ax
cmp     bx, ds:2
jnz     short loc_1ED27
call    sub_1E846

loc_1ED27:
call    sub_1E118
pop     bp
add     sp, 0ACh
retn    0Ah
sub_1EBD3 endp




sub_1ED32 proc near
call    sub_1E13A
call    sub_1E6F6
jb      short loc_1ED4B
push    word ptr [bx+10h]
mov     ax, [bp+4]
push    es
push    ax
push    word ptr [bp+6]
push    word ptr [bp+8]
call    sub_1EBD3

loc_1ED4B:
call    sub_1E160
retn    6
sub_1ED32 endp




sub_1ED51 proc far
xor     cx, cx
jmp     short loc_1ED62
sub_1ED51 endp




sub_1ED55 proc far
mov     cx, 1
jmp     short loc_1ED62
sub_1ED55 endp




sub_1ED5A proc far
mov     cx, 2
jmp     short loc_1ED62
sub_1ED5A endp



; Attributes: bp-based frame

sub_1ED5F proc far

arg_0= word ptr  0Ah
arg_2= word ptr  0Ch
arg_4= word ptr  0Eh
arg_6= word ptr  10h

mov     cx, 3

loc_1ED62:
push    bp
push    si
push    di
mov     bp, sp
mov     di, cx
mov     ax, [bp+arg_0]
mov     dx, [bp+arg_2]
mov     bx, [bp+arg_4]
mov     cx, [bp+arg_6]
or      cx, cx
jnz     short loc_1ED81
or      dx, dx
jz      short loc_1EDE8
or      bx, bx
jz      short loc_1EDE8

loc_1ED81:
test    di, 1
jnz     short loc_1EDA5
or      dx, dx
jns     short loc_1ED96
neg     dx
neg     ax
sbb     dx, 0
or      di, 0Ch

loc_1ED96:
or      cx, cx
jns     short loc_1EDA5
neg     cx
neg     bx
sbb     cx, 0
xor     di, 4

loc_1EDA5:
mov     bp, cx
mov     cx, 20h ; ' '
push    di
xor     di, di
xor     si, si

loc_1EDAF:
shl     ax, 1
rcl     dx, 1
rcl     si, 1
rcl     di, 1
cmp     di, bp
jb      short loc_1EDC6
ja      short loc_1EDC1
cmp     si, bx
jb      short loc_1EDC6

loc_1EDC1:
sub     si, bx
sbb     di, bp
inc     ax

loc_1EDC6:
loop    loc_1EDAF
pop     bx
test    bx, 2
jz      short loc_1EDD5
mov     ax, si
mov     dx, di
shr     bx, 1

loc_1EDD5:
test    bx, 4
jz      short loc_1EDE2
neg     dx
neg     ax
sbb     dx, 0

loc_1EDE2:
pop     di
pop     si
pop     bp
retf    8

loc_1EDE8:
div     bx
test    di, 2
jz      short loc_1EDF2
mov     ax, dx

loc_1EDF2:
xor     dx, dx
jmp     short loc_1EDE2
sub_1ED5F endp




sub_1EDF6 proc far
cmp     cl, 10h
jnb     short loc_1EE0B
mov     bx, ax
shl     ax, cl
shl     dx, cl
neg     cl
add     cl, 10h
shr     bx, cl
or      dx, bx
retf

loc_1EE0B:
sub     cl, 10h
mov     dx, ax
xor     ax, ax
shl     dx, cl
retf
sub_1EDF6 endp




sub_1EE15 proc far
cmp     cl, 10h
jnb     short loc_1EE2A
mov     bx, dx
shr     ax, cl
sar     dx, cl
neg     cl
add     cl, 10h
shl     bx, cl
or      ax, bx
retf

loc_1EE2A:
sub     cl, 10h
mov     ax, dx
cwd
sar     ax, cl
retf
sub_1EE15 endp




sub_1EE33 proc far
cmp     cl, 10h
jnb     short loc_1EE48
mov     bx, dx
shr     ax, cl
shr     dx, cl
neg     cl
add     cl, 10h
shl     bx, cl
or      ax, bx
retf

loc_1EE48:
sub     cl, 10h
mov     ax, dx
xor     dx, dx
shr     ax, cl
retf
sub_1EE33 endp

seg000 ends


; Segment type: Pure code
seg001 segment byte public 'CODE' use16
assume cs:seg001
;org 2
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing


; Attributes: bp-based frame

sub_1EE52 proc far

arg_0= dword ptr  6

push    bp
mov     bp, sp
push    si
push    di
push    ds
mov     es, word ptr ds:1Eh
mov     di, 81h
lds     si, [bp+arg_0]
xor     cx, cx
cld

loc_1EE65:
lodsb
or      al, al
jz      short loc_1EE6E
stosb
inc     cx
jmp     short loc_1EE65

loc_1EE6E:
mov     al, 0Dh
stosb
mov     es:80h, cl
push    es
pop     ds
mov     si, 81h
mov     di, 5Ch ; '\'
mov     ax, 2901h
int     21h             ; DOS - PARSE FILENAME
                        ; DS:SI -> string to parse
                        ; ES:DI -> buffer to fill with unopened FCB
                        ; AL = bit mask to control parsing
mov     di, 6Ch ; 'l'
mov     ax, 2901h
int     21h             ; DOS - PARSE FILENAME
                        ; DS:SI -> string to parse
                        ; ES:DI -> buffer to fill with unopened FCB
                        ; AL = bit mask to control parsing
pop     ds
pop     di
pop     si
pop     bp
retf    4
sub_1EE52 endp




sub_1EE92 proc near
mov     es, word ptr ds:1Eh
mov     ax, es:2Eh
mov     ds:8248h, ax
mov     ax, es:30h
mov     ds:824Ah, ax
retn
sub_1EE92 endp




sub_1EEA5 proc near
mov     es, word ptr ds:1Eh
mov     ax, ds:8248h
mov     es:2Eh, ax
mov     ax, ds:824Ah
mov     es:30h, ax
retn
sub_1EEA5 endp



; Attributes: bp-based frame

sub_1EEB8 proc far

arg_0= dword ptr  6

push    bp
mov     bp, sp
push    si
push    di
mov     bx, 8230h
push    ds
pop     es
mov     di, bx
mov     dx, ds:1Eh
cld
mov     ax, ds:1Ch
stosw
mov     ax, 80h
stosw
mov     ax, dx
stosw
mov     ax, 5Ch ; '\'
stosw
mov     ax, dx
stosw
mov     ax, 6Ch ; 'l'
stosw
mov     ax, dx
stosw
push    word ptr ds:2Eh
push    word ptr ds:30h
mov     ds:8246h, sp
mov     sp, ds:7E64h
lds     dx, [bp+arg_0]
mov     ax, 4B01h
int     21h             ; DOS - 2+ - LOAD OR EXECUTE (EXEC)
                        ; DS:DX -> ASCIZ filename
                        ; ES:BX -> parameter block
                        ; AL = subfunc: load but do not execute (internal)
mov     dx, seg seg091
mov     ds, dx
assume ds:seg091
cli
mov     ss, dx
assume ss:seg091
mov     sp, word_53AF6
sti
pushf
push    ax
mov     ah, 30h
int     21h             ; DOS - GET DOS VERSION
                        ; Return: AL = major version number (00h for DOS 1.x)
xchg    al, ah
cmp     ax, 20Ah
jge     short loc_1EF26
mov     es, word_4B8CE
mov     ax, word_4B8DE
mov     es:2Eh, ax
mov     ax, word_4B8E0
mov     es:30h, ax

loc_1EF26:
pop     ax
popf
pop     word_4B8E0
pop     word_4B8DE
jb      short loc_1EF3A
call    sub_1EE92
mov     ax, 0
jmp     short loc_1EF4C

loc_1EF3A:
xchg    ax, dx
mov     ax, 0FFFEh
cmp     dl, 2
jz      short loc_1EF4C
mov     al, 0FCh
cmp     dl, 8
jz      short loc_1EF4C
mov     al, 0FAh

loc_1EF4C:
pop     di
pop     si
pop     bp
retf    4
sub_1EEB8 endp




sub_1EF52 proc far
push    bp
push    si
push    di
mov     ah, 51h
int     21h             ; DOS - 2+ internal - GET PSP SEGMENT
                        ; Return: BX = current PSP segment
call    sub_1EEA5
mov     word_53AF6, sp
cli
mov     ss, word_53AF0
assume ss:nothing
mov     sp, word_53AEE
sti
les     ax, dword_53AF2
push    es
push    ax
mov     ds, bx
assume ds:nothing
mov     es, bx
mov     word ptr ds:0Ah, offset loc_1EF7F
mov     word ptr ds:0Ch, cs
retf
sub_1EF52 endp


loc_1EF7F:
mov     ax, seg seg091
mov     ds, ax
assume ds:seg091
cli
mov     ss, ax
assume ss:seg091
mov     sp, word_53AF6
sti
mov     ah, 4Dh
int     21h             ; DOS - 2+ - GET EXIT CODE OF SUBPROGRAM (WAIT)
pop     di
pop     si
pop     bp
retf



sub_1EF94 proc far
push    bp
push    si
push    di
mov     ah, 51h
int     21h             ; DOS - 2+ internal - GET PSP SEGMENT
                        ; Return: BX = current PSP segment
mov     word_4C500, bx
les     di, off_4BE5A
cld
xor     ax, ax
mov     cx, 7
rep stosw
mov     ax, bx
stosw
stosw
mov     ax, word ptr dword_53AF2
stosw
mov     ax, word ptr dword_53AF2+2
stosw
pushf
pop     ax
stosw
mov     ax, word_53AEE
stosw
mov     ax, word_53AF0
stosw
mov     es, bx
mov     word ptr es:0Ah, offset loc_1EFEE
mov     word ptr es:0Ch, cs
push    bx
call    sub_11396
mov     bx, word_4B8CE
mov     ah, 50h
int     21h             ; DOS - 2+ internal - SET PSP SEGMENT
                        ; BX = segment address of new PSP
mov     word_5799F, 2
mov     ax, word_4C500
add     ax, 10h
pop     di
pop     si
pop     bp
retf
sub_1EF94 endp


loc_1EFEE:
mov     ax, seg seg091
mov     ds, ax
cli
mov     ss, ax
mov     sp, word_53714
sti
mov     ah, 4Dh
int     21h             ; DOS - 2+ - GET EXIT CODE OF SUBPROGRAM (WAIT)
push    ax
call    nullsub_1
xor     ax, ax
mov     word_4C500, ax
call    sub_1135B



sub_1F00F proc far
push    bp
push    si
push    di
mov     bx, word_4C500
or      bx, bx
jz      short loc_1F04F
call    sub_1EEA5
mov     word_53AF6, sp
mov     es, bx
mov     word ptr es:0Ah, offset loc_1F038
mov     word ptr es:0Ch, cs
mov     ah, 50h
int     21h             ; DOS - 2+ internal - SET PSP SEGMENT
                        ; BX = segment address of new PSP
mov     ax, 4C00h
int     21h             ; DOS - 2+ - QUIT WITH EXIT CODE (EXIT)
                        ; AL = exit code

loc_1F038:
mov     ax, seg seg091
mov     ds, ax
cli
mov     ss, ax
mov     sp, word_53AF6
sti
call    nullsub_1
xor     ax, ax
mov     word_4C500, ax

loc_1F04F:
mov     word_5799F, 3
pop     di
pop     si
pop     bp
retf
sub_1F00F endp

seg001 ends


; Segment type: Pure code
seg002 segment byte public 'CODE' use16
assume cs:seg002
;org 9
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing



sub_1F059 proc far
cmp     ah, 3Fh ; '?'
jz      short loc_1F063
cmp     ah, 40h ; '@'
jnz     short loc_1F06C

loc_1F063:
push    ax
mov     ax, ds
cmp     ax, 0A000h
pop     ax
jnb     short loc_1F072

loc_1F06C:
call    sub_10BD7
retf

loc_1F072:
push    bp
push    si
push    di
push    es
push    ds
push    dx
mov     bp, sp
pushf
cld
mov     dx, seg seg091
mov     ds, dx
assume ds:seg091
mov     ds, word_4B8CE
assume ds:nothing
mov     dx, ds:2
sub     dx, 1000h
mov     ds, dx
les     di, [bp+0]
xor     si, si
sub     si, cx
cmp     ah, 3Fh ; '?'
jz      short loc_1F0A0
call    sub_1F0C7
jmp     short loc_1F0A9

loc_1F0A0:
push    cx
shr     cx, 1
jnb     short loc_1F0A6
movsb

loc_1F0A6:
rep movsw
pop     cx

loc_1F0A9:
xor     dx, dx
sub     dx, cx
popf
call    sub_10BD7
pushf
cld
les     di, [bp+0]
xor     si, si
sub     si, cx
call    sub_1F0C7
popf
pop     dx
pop     ds
pop     es
pop     di
pop     si
pop     bp
retf
sub_1F059 endp




sub_1F0C7 proc near
push    ax
push    cx
shr     cx, 1
jnb     short loc_1F0D6
mov     al, es:[di]
movsb
mov     [si-1], al
jcxz    short loc_1F0DF

loc_1F0D6:
mov     ax, es:[di]
movsw
mov     [si-2], ax
loop    loc_1F0D6

loc_1F0DF:
pop     cx
pop     ax
retn
sub_1F0C7 endp

seg002 ends


; Segment type: Pure code
seg003 segment byte public 'CODE' use16
assume cs:seg003
;org 2
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing


; Attributes: bp-based frame

sub_1F0E2 proc far

var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= word ptr -4
var_2= word ptr -2
arg_0= dword ptr  6

push    bp
mov     bp, sp
sub     sp, 0Ch
les     bx, ds:9A70h
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
jmp     short loc_1F150

loc_1F0F4:
les     bx, [bp+var_8]
les     bx, es:[bx+4]
mov     word ptr [bp+var_C+2], es
mov     word ptr [bp+var_C], bx
jmp     short loc_1F13C

loc_1F103:
les     bx, [bp+var_C]
mov     dx, es:[bx+2]
mov     ax, es:[bx]
cmp     dx, word ptr [bp+arg_0+2]
jnz     short loc_1F12F
cmp     ax, word ptr [bp+arg_0]
jnz     short loc_1F12F
les     bx, [bp+var_C]
cmp     byte ptr es:[bx+8], 2
jz      short loc_1F124
jmp     loc_1F198

loc_1F124:
mov     dx, es:[bx+0Eh]
mov     ax, es:[bx+0Ch]
jmp     loc_1F1A4

loc_1F12F:
les     bx, [bp+var_C]
les     bx, es:[bx+4]
mov     word ptr [bp+var_C+2], es
mov     word ptr [bp+var_C], bx

loc_1F13C:
mov     ax, word ptr [bp+var_C]
or      ax, word ptr [bp+var_C+2]
jnz     short loc_1F103
les     bx, [bp+var_8]
les     bx, es:[bx]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx

loc_1F150:
mov     ax, word ptr [bp+var_8]
or      ax, word ptr [bp+var_8+2]
jnz     short loc_1F0F4
les     bx, [bp+arg_0]
add     bx, 0FFF6h
mov     [bp+var_2], es
mov     [bp+var_4], bx
les     bx, es:[bx+4]
mov     word ptr [bp+var_C+2], es
mov     word ptr [bp+var_C], bx
mov     ax, bx
or      ax, word ptr [bp+var_C+2]
jz      short loc_1F186
cmp     byte ptr es:[bx+8], 0Ch
jnz     short loc_1F186
les     bx, es:[bx+4]
mov     word ptr [bp+var_C+2], es
mov     word ptr [bp+var_C], bx

loc_1F186:
mov     ax, word ptr [bp+var_C]
or      ax, word ptr [bp+var_C+2]
jz      short loc_1F1A0
les     bx, [bp+var_C]
test    byte ptr es:[bx+9], 20h
jz      short loc_1F1A0

loc_1F198:
mov     dx, word ptr [bp+var_C+2]
mov     ax, word ptr [bp+var_C]
jmp     short loc_1F1A4

loc_1F1A0:
xor     dx, dx
mov     ax, dx

loc_1F1A4:
mov     sp, bp
pop     bp
retf    4
sub_1F0E2 endp



; Attributes: bp-based frame

sub_1F1AA proc far

arg_0= word ptr  6
arg_2= word ptr  8
arg_4= dword ptr  0Ah

push    bp
mov     bp, sp
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx+4], 11h
jnz     short loc_1F1C3
mov     ax, es:[bx+8]
or      ax, es:[bx+0Ah]
jnz     short loc_1F1DC
jmp     short loc_1F1D4

loc_1F1C3:
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx+4], 10h
jnz     short loc_1F1DC
cmp     word ptr es:[bx+0Ch], 0
jnz     short loc_1F1DC

loc_1F1D4:
mov     dx, [bp+arg_2]
mov     ax, [bp+arg_0]
jmp     short loc_1F1E2

loc_1F1DC:
mov     dx, word ptr [bp+arg_4+2]
mov     ax, word ptr [bp+arg_4]

loc_1F1E2:
pop     bp
retf    8
sub_1F1AA endp



; Attributes: bp-based frame

sub_1F1E6 proc far

var_8= dword ptr -8
var_4= dword ptr -4
arg_0= word ptr  6
arg_2= dword ptr  8
arg_6= word ptr  0Ch
arg_8= dword ptr  0Eh

push    bp
mov     bp, sp
sub     sp, 8
push    si
push    di
mov     si, [bp+arg_0]
mov     di, si
and     di, 100h
mov     ax, word ptr [bp+arg_8]
or      ax, word ptr [bp+arg_8+2]
jnz     short loc_1F20A
inc     word ptr ds:0BDFBh
xor     dx, dx
mov     ax, dx
jmp     loc_1F46D

loc_1F20A:
les     bx, [bp+arg_8]
add     bx, 0FFF6h
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
les     bx, es:[bx+4]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
mov     ax, bx
or      ax, word ptr [bp+var_8+2]
jz      short loc_1F238
cmp     byte ptr es:[bx+8], 0Ch
jnz     short loc_1F238
les     bx, es:[bx+4]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx

loc_1F238:
mov     ax, word ptr [bp+var_8]
or      ax, word ptr [bp+var_8+2]
jnz     short loc_1F243
jmp     loc_1F361

loc_1F243:
les     bx, [bp+var_8]
test    byte ptr es:[bx+9], 10h
jz      short loc_1F25F
test    si, 10h
jz      short loc_1F25F
push    word ptr [bp+arg_8+2]
push    word ptr [bp+arg_8]
call    sub_1F9F7
jmp     def_1F410       ; jumptable 0001F410 default case, cases 3-7,10,12

loc_1F25F:
mov     ax, [bp+arg_6]
cmp     ax, 1
jnz     short loc_1F26A
jmp     loc_1F2CE

loc_1F26A:
cmp     ax, 2
jz      short loc_1F277
cmp     ax, 3
jz      short loc_1F2CE
jmp     loc_1F2F9

loc_1F277:
les     bx, [bp+var_8]
cmp     byte ptr es:[bx+8], 0Dh
jnz     short loc_1F29F
mov     ax, es:[bx+0Ch]
or      ax, es:[bx+0Eh]
jz      short loc_1F28E
jmp     loc_1F302

loc_1F28E:
mov     dx, word ptr [bp+arg_2+2]
mov     ax, word ptr [bp+arg_2]
mov     es:[bx+0Eh], dx
mov     es:[bx+0Ch], ax
jmp     def_1F410       ; jumptable 0001F410 default case, cases 3-7,10,12

loc_1F29F:
les     bx, [bp+var_8]
cmp     byte ptr es:[bx+8], 2
jz      short loc_1F2B7
cmp     byte ptr es:[bx+8], 3
jz      short loc_1F2B7
cmp     byte ptr es:[bx+8], 1
jnz     short loc_1F2F9

loc_1F2B7:
or      di, di
jz      short loc_1F302
les     bx, [bp+var_8]
cmp     byte ptr es:[bx+8], 2
jnz     short loc_1F302
cmp     byte ptr es:[bx+12h], 5
jz      short loc_1F302
jmp     short loc_1F2F9

loc_1F2CE:
les     bx, [bp+var_8]
cmp     byte ptr es:[bx+8], 2
jz      short loc_1F2E6
cmp     byte ptr es:[bx+8], 3
jz      short loc_1F2E6
cmp     byte ptr es:[bx+8], 1
jnz     short loc_1F2F9

loc_1F2E6:
les     bx, [bp+var_8]
cmp     byte ptr es:[bx+8], 3
jz      short loc_1F302
mov     al, byte ptr [bp+arg_6]
mov     es:[bx+8], al
jmp     short loc_1F302

loc_1F2F9:
push    word ptr [bp+arg_8+2]
push    word ptr [bp+arg_8]
call    sub_1F9F7

loc_1F302:
mov     al, 20h ; ' '
mov     dx, si
or      al, dl
les     bx, [bp+var_8]
or      es:[bx+9], al
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
push    word ptr [bp+arg_2+2]
push    word ptr [bp+arg_2]
xor     ax, ax
push    ax
call    sub_2A221
or      ax, ax
jnz     short loc_1F33E
push    word ptr [bp+arg_8+2]
push    word ptr [bp+arg_8]
mov     ax, 41h ; 'A'
push    ax
call    sub_312DE
add     sp, 6
jmp     def_1F410       ; jumptable 0001F410 default case, cases 3-7,10,12

loc_1F33E:
push    word ptr [bp+arg_2+2]
push    word ptr [bp+arg_2]
les     bx, [bp+var_8]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
push    cs
call    near ptr sub_1F1AA
les     bx, [bp+var_8]
mov     es:[bx+0Eh], dx
mov     es:[bx+0Ch], ax
jmp     def_1F410       ; jumptable 0001F410 default case, cases 3-7,10,12

loc_1F361:
mov     ax, 13h
push    ax
call    sub_3193F
mov     word ptr [bp+var_8+2], dx
mov     word ptr [bp+var_8], ax
les     bx, [bp+var_4]
mov     ax, es:[bx+4]
or      ax, es:[bx+6]
jz      short loc_1F38E
mov     ax, word ptr [bp+var_8]
les     bx, es:[bx+4]
mov     es:[bx+6], dx
mov     es:[bx+4], ax
jmp     short loc_1F39F

loc_1F38E:
mov     dx, word ptr [bp+var_8+2]
mov     ax, word ptr [bp+var_8]
les     bx, [bp+var_4]
mov     es:[bx+6], dx
mov     es:[bx+4], ax

loc_1F39F:
mov     al, byte ptr [bp+arg_6]
les     bx, [bp+var_8]
mov     es:[bx+8], al
cmp     word ptr ds:0C064h, 0
jz      short loc_1F3B4
mov     al, 4
jmp     short loc_1F3B6

loc_1F3B4:
mov     al, 2

loc_1F3B6:
les     bx, [bp+var_8]
mov     es:[bx+12h], al
les     bx, [bp+arg_2]
cmp     byte ptr es:[bx+4], 11h
jnz     short loc_1F3CF
les     bx, [bp+var_8]
mov     byte ptr es:[bx+12h], 1

loc_1F3CF:
mov     dx, word ptr [bp+arg_2+2]
mov     ax, word ptr [bp+arg_2]
les     bx, [bp+var_8]
mov     es:[bx+0Eh], dx
mov     es:[bx+0Ch], ax
mov     dx, word ptr [bp+arg_8+2]
mov     ax, word ptr [bp+arg_8]
mov     es:[bx+2], dx
mov     es:[bx], ax
mov     al, 22h ; '"'
mov     dx, si
or      al, dl
mov     es:[bx+9], al
mov     word ptr es:[bx+10h], 0
mov     word ptr es:[bx+0Ah], 0
mov     ax, [bp+arg_6]
dec     ax              ; switch 13 cases
cmp     ax, 0Ch
ja      short def_1F410 ; jumptable 0001F410 default case, cases 3-7,10,12
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_1F410[bx] ; switch jump
jpt_1F410 dw offset loc_1F45F ; jump table for switch statement
dw offset loc_1F451
dw offset def_1F410
dw offset def_1F410
dw offset def_1F410
dw offset def_1F410
dw offset def_1F410
dw offset loc_1F45F
dw offset loc_1F45F
dw offset def_1F410
dw offset loc_1F441
dw offset def_1F410
dw offset loc_1F42F

loc_1F42F:              ; jumptable 0001F410 case 13
mov     al, ds:0BE1Ch
mov     ah, 0
les     bx, [bp+var_8]
mov     es:[bx+0Ah], ax
inc     byte ptr ds:0BE1Ch
jmp     short loc_1F45F ; jumptable 0001F410 cases 1,8,9

loc_1F441:              ; jumptable 0001F410 case 11
inc     word ptr ds:0BDFBh
mov     ax, ds:0BDFBh
les     bx, [bp+var_8]
mov     es:[bx+0Ah], ax
jmp     short loc_1F45F ; jumptable 0001F410 cases 1,8,9

loc_1F451:              ; jumptable 0001F410 case 2
or      di, di
jz      short def_1F410 ; jumptable 0001F410 default case, cases 3-7,10,12
les     bx, [bp+var_8]
mov     byte ptr es:[bx+12h], 5
jmp     short def_1F410 ; jumptable 0001F410 default case, cases 3-7,10,12

loc_1F45F:              ; jumptable 0001F410 cases 1,8,9
les     bx, [bp+var_8]
or      byte ptr es:[bx+9], 1

def_1F410:              ; jumptable 0001F410 default case, cases 3-7,10,12
mov     dx, word ptr [bp+var_8+2]
mov     ax, word ptr [bp+var_8]

loc_1F46D:
pop     di
pop     si
mov     sp, bp
pop     bp
retf    0Ch
sub_1F1E6 endp



; Attributes: bp-based frame

sub_1F475 proc far

var_8= dword ptr -8
var_4= dword ptr -4
arg_0= word ptr  6
arg_2= word ptr  8
arg_4= word ptr  0Ah
arg_6= word ptr  0Ch
arg_8= word ptr  0Eh
arg_A= word ptr  10h

push    bp
mov     bp, sp
sub     sp, 8
mov     ax, [bp+arg_8]
or      ax, [bp+arg_A]
jnz     short loc_1F486
jmp     loc_1F57B

loc_1F486:
les     bx, ds:9A70h
les     bx, es:[bx+4]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
jmp     short loc_1F4B7

loc_1F496:
les     bx, [bp+var_8]
mov     dx, es:[bx+2]
mov     ax, es:[bx]
cmp     dx, [bp+arg_A]
jnz     short loc_1F4AA
cmp     ax, [bp+arg_8]
jz      short loc_1F4BF

loc_1F4AA:
les     bx, [bp+var_8]
les     bx, es:[bx+4]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx

loc_1F4B7:
mov     ax, word ptr [bp+var_8]
or      ax, word ptr [bp+var_8+2]
jnz     short loc_1F496

loc_1F4BF:
cmp     [bp+arg_6], 2
jz      short loc_1F4C8
jmp     loc_1F570

loc_1F4C8:
mov     ax, word ptr [bp+var_8]
or      ax, word ptr [bp+var_8+2]
jz      short loc_1F4E9
les     bx, [bp+var_8]
cmp     byte ptr es:[bx+8], 2
jnz     short loc_1F4DD
jmp     loc_1F624

loc_1F4DD:
push    [bp+arg_A]
push    [bp+arg_8]
call    sub_1F9F7
jmp     loc_1F624

loc_1F4E9:
push    [bp+arg_A]
push    [bp+arg_8]
push    [bp+arg_6]
push    [bp+arg_4]
push    [bp+arg_2]
push    [bp+arg_0]
push    cs
call    near ptr sub_1F1E6
mov     word ptr [bp+var_8+2], dx
mov     word ptr [bp+var_8], ax
mov     ax, 13h
push    ax
call    sub_318B7
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
mov     dx, word ptr [bp+var_8+2]
mov     ax, word ptr [bp+var_8]
les     bx, [bp+var_4]
mov     es:[bx+0Eh], dx
mov     es:[bx+0Ch], ax
mov     byte ptr es:[bx+8], 2
mov     dx, [bp+arg_A]
mov     ax, [bp+arg_8]
mov     es:[bx+2], dx
mov     es:[bx], ax
les     bx, [bp+var_8]
mov     al, es:[bx+9]
les     bx, [bp+var_4]
mov     es:[bx+9], al
les     bx, ds:9A70h
mov     dx, es:[bx+6]
mov     ax, es:[bx+4]
les     bx, [bp+var_4]
mov     es:[bx+6], dx
mov     es:[bx+4], ax
mov     dx, word ptr [bp+var_4+2]
mov     ax, bx
les     bx, ds:9A70h
mov     es:[bx+6], dx
mov     es:[bx+4], ax
jmp     loc_1F624

loc_1F570:
mov     ax, word ptr [bp+var_8]
or      ax, word ptr [bp+var_8+2]
jz      short loc_1F57B
jmp     loc_1F4DD

loc_1F57B:
mov     ax, 13h
push    ax
call    sub_318B7
mov     word ptr [bp+var_8+2], dx
mov     word ptr [bp+var_8], ax
les     bx, ds:9A70h
mov     dx, es:[bx+6]
mov     ax, es:[bx+4]
les     bx, [bp+var_8]
mov     es:[bx+6], dx
mov     es:[bx+4], ax
mov     dx, word ptr [bp+var_8+2]
mov     ax, bx
les     bx, ds:9A70h
mov     es:[bx+6], dx
mov     es:[bx+4], ax
mov     al, byte ptr [bp+arg_6]
les     bx, [bp+var_8]
mov     es:[bx+8], al
cmp     word ptr ds:0C064h, 0
jz      short loc_1F5C7
mov     al, 4
jmp     short loc_1F5C9

loc_1F5C7:
mov     al, 2

loc_1F5C9:
les     bx, [bp+var_8]
mov     es:[bx+12h], al
mov     dx, [bp+arg_4]
mov     ax, [bp+arg_2]
mov     es:[bx+0Eh], dx
mov     es:[bx+0Ch], ax
mov     dx, [bp+arg_A]
mov     ax, [bp+arg_8]
mov     es:[bx+2], dx
mov     es:[bx], ax
mov     al, byte ptr [bp+arg_0]
and     al, 7Fh
mov     es:[bx+9], al
mov     word ptr es:[bx+10h], 0
mov     word ptr es:[bx+0Ah], 0
mov     ax, [bp+arg_6]
cmp     ax, 4
jz      short loc_1F61C
cmp     ax, 8
jz      short loc_1F614
cmp     ax, 9
jz      short loc_1F614
jmp     short loc_1F624

loc_1F614:
les     bx, [bp+var_8]
or      byte ptr es:[bx+9], 1

loc_1F61C:
les     bx, [bp+var_8]
or      byte ptr es:[bx+9], 2

loc_1F624:
mov     dx, word ptr [bp+var_8+2]
mov     ax, word ptr [bp+var_8]
mov     sp, bp
pop     bp
retf    0Ch
sub_1F475 endp



; Attributes: bp-based frame

sub_1F630 proc far

var_4= dword ptr -4
arg_0= dword ptr  6
arg_4= word ptr  0Ah
arg_6= word ptr  0Ch
arg_8= word ptr  0Eh
arg_A= dword ptr  10h

push    bp
mov     bp, sp
sub     sp, 4
push    si
mov     si, [bp+arg_4]
les     bx, [bp+arg_A]
les     bx, es:[bx+4]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
jmp     loc_1F6FA

loc_1F64A:
les     bx, [bp+var_4]
mov     dx, es:[bx+2]
mov     ax, es:[bx]
cmp     dx, [bp+arg_8]
jz      short loc_1F65C
jmp     loc_1F6ED

loc_1F65C:
cmp     ax, [bp+arg_6]
jz      short loc_1F664
jmp     loc_1F6ED

loc_1F664:
les     bx, [bp+var_4]
cmp     byte ptr es:[bx+8], 7
jz      short loc_1F67A
push    [bp+arg_8]
push    [bp+arg_6]
call    sub_1F9F7
jmp     loc_1F717

loc_1F67A:
mov     ax, word ptr [bp+arg_0]
or      ax, word ptr [bp+arg_0+2]
jz      short loc_1F6C3
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+4], 10h
jnz     short loc_1F6A7
push    word ptr es:[bx+2]
push    word ptr es:[bx]
mov     al, es:[bx+5]
mov     ah, 0
push    ax
call    sub_2A771
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
jmp     short loc_1F6C3

loc_1F6A7:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+4], 11h
jnz     short loc_1F6C3
push    word ptr [bp+arg_0+2]
push    bx
xor     ax, ax
push    ax
call    sub_2A771
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax

loc_1F6C3:
mov     dx, word ptr [bp+arg_0+2]
mov     ax, word ptr [bp+arg_0]
les     bx, [bp+var_4]
mov     es:[bx+0Eh], dx
mov     es:[bx+0Ch], ax
mov     byte ptr es:[bx+8], 6
cmp     si, 0Ah
jnz     short loc_1F6E2
mov     al, 40h ; '@'
jmp     short loc_1F6E4

loc_1F6E2:
mov     al, 0

loc_1F6E4:
les     bx, [bp+var_4]
mov     es:[bx+9], al
jmp     short loc_1F717

loc_1F6ED:
les     bx, [bp+var_4]
les     bx, es:[bx+4]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx

loc_1F6FA:
mov     ax, word ptr [bp+var_4]
or      ax, word ptr [bp+var_4+2]
jz      short loc_1F705
jmp     loc_1F64A

loc_1F705:
push    [bp+arg_8]
push    [bp+arg_6]
mov     ax, 43h ; 'C'
push    ax
call    sub_312DE
add     sp, 6

loc_1F717:
pop     si
mov     sp, bp
pop     bp
retf    0Eh
sub_1F630 endp



; Attributes: bp-based frame

sub_1F71E proc far

var_4= dword ptr -4
arg_0= dword ptr  6

push    bp
mov     bp, sp
sub     sp, 4
les     bx, [bp+arg_0]
les     bx, es:[bx+4]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
jmp     short loc_1F763

loc_1F733:
les     bx, [bp+var_4]
cmp     byte ptr es:[bx+8], 7
jnz     short loc_1F756
mov     byte ptr es:[bx+9], 0
mov     byte ptr es:[bx+8], 6
mov     dx, ds:0BD80h
mov     ax, ds:0BD7Eh
mov     es:[bx+0Eh], dx
mov     es:[bx+0Ch], ax

loc_1F756:
les     bx, [bp+var_4]
les     bx, es:[bx+4]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx

loc_1F763:
mov     ax, word ptr [bp+var_4]
or      ax, word ptr [bp+var_4+2]
jnz     short loc_1F733
mov     sp, bp
pop     bp
retf    4
sub_1F71E endp



; Attributes: bp-based frame

sub_1F771 proc far

var_4= dword ptr -4
arg_0= byte ptr  6
arg_2= word ptr  8
arg_4= dword ptr  0Ah
arg_8= word ptr  0Eh
arg_A= word ptr  10h
arg_C= dword ptr  12h

push    bp
mov     bp, sp
sub     sp, 4
push    si
mov     ax, [bp+arg_8]
or      ax, [bp+arg_A]
jz      short loc_1F7C4
les     bx, [bp+arg_C]
les     bx, es:[bx+4]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
jmp     short loc_1F7BC

loc_1F78F:
les     bx, [bp+var_4]
mov     dx, es:[bx+2]
mov     ax, es:[bx]
cmp     dx, [bp+arg_A]
jnz     short loc_1F7AF
cmp     ax, [bp+arg_8]
jnz     short loc_1F7AF
push    [bp+arg_A]
push    [bp+arg_8]
call    sub_1F9F7
jmp     loc_1F8ED

loc_1F7AF:
les     bx, [bp+var_4]
les     bx, es:[bx+4]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx

loc_1F7BC:
mov     ax, word ptr [bp+var_4]
or      ax, word ptr [bp+var_4+2]
jnz     short loc_1F78F

loc_1F7C4:
mov     ax, 13h
push    ax
call    sub_3193F
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
les     bx, [bp+arg_C]
mov     ax, es:[bx+14h]
or      ax, es:[bx+16h]
jz      short loc_1F7F1
mov     ax, word ptr [bp+var_4]
les     bx, es:[bx+14h]
mov     es:[bx+6], dx
mov     es:[bx+4], ax
jmp     short loc_1F802

loc_1F7F1:
mov     dx, word ptr [bp+var_4+2]
mov     ax, word ptr [bp+var_4]
les     bx, [bp+arg_C]
mov     es:[bx+6], dx
mov     es:[bx+4], ax

loc_1F802:
mov     dx, word ptr [bp+var_4+2]
mov     ax, word ptr [bp+var_4]
les     bx, [bp+arg_C]
mov     es:[bx+16h], dx
mov     es:[bx+14h], ax
les     bx, [bp+var_4]
mov     word ptr es:[bx+6], 0
mov     word ptr es:[bx+4], 0
mov     dx, [bp+arg_A]
mov     ax, [bp+arg_8]
mov     es:[bx+2], dx
mov     es:[bx], ax
mov     al, [bp+arg_0]
mov     es:[bx+8], al
mov     ax, word ptr [bp+arg_4]
or      ax, word ptr [bp+arg_4+2]
jz      short loc_1F87F
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx+4], 10h
jnz     short loc_1F863
push    word ptr es:[bx+2]
push    word ptr es:[bx]
mov     al, es:[bx+5]
mov     ah, 0
push    ax
call    sub_2A771
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax
jmp     short loc_1F87F

loc_1F863:
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx+4], 11h
jnz     short loc_1F87F
push    word ptr [bp+arg_4+2]
push    bx
xor     ax, ax
push    ax
call    sub_2A771
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax

loc_1F87F:
mov     dx, word ptr [bp+arg_4+2]
mov     ax, word ptr [bp+arg_4]
les     bx, [bp+var_4]
mov     es:[bx+0Eh], dx
mov     es:[bx+0Ch], ax
mov     word ptr es:[bx+10h], 0
cmp     [bp+arg_2], 0Ah
jnz     short loc_1F8A0
mov     al, 40h ; '@'
jmp     short loc_1F8A2

loc_1F8A0:
mov     al, 0

loc_1F8A2:
les     bx, [bp+var_4]
mov     es:[bx+9], al
mov     ax, word ptr [bp+arg_4]
or      ax, word ptr [bp+arg_4+2]
jz      short loc_1F8ED
les     bx, [bp+arg_4]
mov     al, es:[bx+4]
cbw
mov     bx, ax
shl     bx, 1
mov     si, [bx+7BA2h]
or      si, si
jz      short loc_1F8DB
push    si
mov     bx, word ptr [bp+arg_4]
mov     al, es:[bx+5]
mov     ah, 0
push    ax
call    sub_2A52D
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax

loc_1F8DB:
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_2A8BF
les     bx, [bp+arg_C]
add     es:[bx+12h], ax

loc_1F8ED:
mov     dx, word ptr [bp+var_4+2]
mov     ax, word ptr [bp+var_4]
pop     si
mov     sp, bp
pop     bp
retf    10h
sub_1F771 endp



; Attributes: bp-based frame

sub_1F8FA proc far

var_E= dword ptr -0Eh
var_A= dword ptr -0Ah
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= dword ptr  6

push    bp
mov     bp, sp
sub     sp, 0Eh
push    si
push    di
mov     [bp+var_2], 0
les     bx, [bp+arg_0]
mov     word ptr es:[bx+12h], 0
les     bx, es:[bx+4]
mov     word ptr [bp+var_E+2], es
mov     word ptr [bp+var_E], bx
mov     si, 1
jmp     loc_1F9E4

loc_1F920:
les     bx, [bp+var_E]
mov     ax, es:[bx]
or      ax, es:[bx+2]
jnz     short loc_1F939
push    si
mov     ax, 86h
push    ax
call    sub_312DE
add     sp, 4

loc_1F939:
les     bx, [bp+var_E]
les     bx, es:[bx+0Ch]
mov     [bp+var_4], es
mov     [bp+var_6], bx
mov     al, es:[bx+4]
cbw
mov     bx, ax
shl     bx, 1
mov     di, [bx+7BA2h]
or      di, di
jz      short loc_1F966
push    di
xor     ax, ax
push    ax
call    sub_2A52D
mov     [bp+var_4], dx
mov     [bp+var_6], ax

loc_1F966:
push    [bp+var_4]
push    [bp+var_6]
call    sub_2A8BF
les     bx, [bp+arg_0]
add     es:[bx+12h], ax
mov     ax, 13h
push    ax
call    sub_318B7
mov     word ptr [bp+var_A+2], dx
mov     word ptr [bp+var_A], ax
les     bx, [bp+var_A]
push    es
push    bx
les     bx, [bp+var_E]
push    es
push    bx
mov     cx, 13h
call    sub_46BE5
mov     ax, [bp+var_2]
les     bx, [bp+var_A]
mov     es:[bx+0Ah], ax
inc     [bp+var_2]
les     bx, ds:9A70h
mov     dx, es:[bx+6]
mov     ax, es:[bx+4]
les     bx, [bp+var_A]
mov     es:[bx+6], dx
mov     es:[bx+4], ax
mov     dx, word ptr [bp+var_A+2]
mov     ax, bx
les     bx, ds:9A70h
mov     es:[bx+6], dx
mov     es:[bx+4], ax
les     bx, [bp+var_A]
or      byte ptr es:[bx+9], 22h
les     bx, [bp+var_E]
les     bx, es:[bx+4]
mov     word ptr [bp+var_E+2], es
mov     word ptr [bp+var_E], bx
inc     si

loc_1F9E4:
mov     ax, word ptr [bp+var_E]
or      ax, word ptr [bp+var_E+2]
jz      short loc_1F9EF
jmp     loc_1F920

loc_1F9EF:
pop     di
pop     si
mov     sp, bp
pop     bp
retf    4
sub_1F8FA endp



; Attributes: bp-based frame

sub_1F9F7 proc near

arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
push    [bp+arg_2]
push    [bp+arg_0]
mov     ax, 46h ; 'F'
push    ax
call    sub_312DE
mov     sp, bp
pop     bp
retn    4
sub_1F9F7 endp



; Attributes: bp-based frame

sub_1FA0F proc far

var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4

push    bp
mov     bp, sp
sub     sp, 0Ch
push    si
les     bx, ds:0BD9Ch
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
jmp     short loc_1FA5C

loc_1FA22:
les     bx, [bp+var_8]
cmp     word ptr es:[bx+12h], 0
jnz     short loc_1FA50
cmp     byte ptr es:[bx+19h], 3
jz      short loc_1FA50
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
mov     ax, 0B8h
push    ax
call    sub_31324
add     sp, 6
les     bx, [bp+var_8]
mov     word ptr es:[bx+10h], 1

loc_1FA50:
les     bx, [bp+var_8]
les     bx, es:[bx]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx

loc_1FA5C:
mov     ax, word ptr [bp+var_8]
or      ax, word ptr [bp+var_8+2]
jnz     short loc_1FA22
mov     word ptr ds:0BD9Ah, 0
mov     word ptr ds:0BD98h, 0
xor     si, si
jmp     loc_1FB85

loc_1FA75:
mov     bx, si
shl     bx, 1
shl     bx, 1
les     bx, [bx-5588h]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
jmp     loc_1FB79

loc_1FA88:
les     bx, [bp+var_4]
les     bx, es:[bx+4]
mov     word ptr [bp+var_C+2], es
mov     word ptr [bp+var_C], bx
mov     ax, bx
or      ax, word ptr [bp+var_C+2]
jz      short loc_1FAAD
cmp     byte ptr es:[bx+8], 0Ch
jnz     short loc_1FAAD
les     bx, es:[bx+4]
mov     word ptr [bp+var_C+2], es
mov     word ptr [bp+var_C], bx

loc_1FAAD:
mov     ax, word ptr [bp+var_C]
or      ax, word ptr [bp+var_C+2]
jnz     short loc_1FAB8
jmp     loc_1FB6D

loc_1FAB8:
mov     dx, ds:0BD9Ah
mov     ax, ds:0BD98h
les     bx, [bp+var_C]
mov     es:[bx+6], dx
mov     es:[bx+4], ax
mov     word ptr ds:0BD9Ah, es
mov     ds:0BD98h, bx
mov     al, es:[bx+8]
cbw
cmp     ax, 1
jz      short loc_1FB01
cmp     ax, 3
jz      short loc_1FAE4
jmp     loc_1FB6D

loc_1FAE4:
les     bx, [bp+var_C]
test    byte ptr es:[bx+9], 1
jnz     short loc_1FB01
push    word ptr es:[bx+2]
push    word ptr es:[bx]
mov     ax, 0ACh
push    ax
call    sub_31324
add     sp, 6

loc_1FB01:
les     bx, [bp+var_C]
test    byte ptr es:[bx+9], 10h
jnz     short loc_1FB6D
les     bx, es:[bx+0Ch]
cmp     byte ptr es:[bx+4], 11h
jnz     short loc_1FB35
les     bx, [bp+var_C]
test    byte ptr es:[bx+9], 1
jz      short loc_1FB6D
push    word ptr es:[bx+2]
push    word ptr es:[bx]
mov     ax, 48h ; 'H'
push    ax
call    sub_312DE
add     sp, 6
jmp     short loc_1FB6D

loc_1FB35:
call    dword ptr ds:0C040h
les     bx, [bp+var_C]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
call    sub_2A954
push    ax
call    dword ptr ds:0C038h
push    word ptr [bp+var_C+2]
push    word ptr [bp+var_C]
call    dword ptr ds:0C034h
les     bx, [bp+var_C]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
call    sub_2A8BF
push    ax
call    dword ptr ds:0BFF0h

loc_1FB6D:
les     bx, [bp+var_4]
les     bx, es:[bx]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx

loc_1FB79:
mov     ax, word ptr [bp+var_4]
or      ax, word ptr [bp+var_4+2]
jz      short loc_1FB84
jmp     loc_1FA88

loc_1FB84:
inc     si

loc_1FB85:
cmp     si, 400h
jge     short loc_1FB8E
jmp     loc_1FA75

loc_1FB8E:
mov     ax, ds:0BDC9h
mov     ds:67F5h, ax
mov     byte ptr ds:67FDh, 2
pop     si
mov     sp, bp
pop     bp
retf
sub_1FA0F endp



; Attributes: bp-based frame

sub_1FB9E proc far

var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  6

push    bp
mov     bp, sp
sub     sp, 8
les     bx, [bp+arg_0]
les     bx, es:[bx+8]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
jmp     short loc_1FBED

loc_1FBB3:
les     bx, [bp+var_4]
cmp     word ptr es:[bx+12h], 0
jnz     short loc_1FBE1
cmp     byte ptr es:[bx+19h], 3
jz      short loc_1FBE1
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
mov     ax, 0B8h
push    ax
call    sub_31324
add     sp, 6
les     bx, [bp+var_4]
mov     word ptr es:[bx+10h], 1

loc_1FBE1:
les     bx, [bp+var_4]
les     bx, es:[bx]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx

loc_1FBED:
mov     ax, word ptr [bp+var_4]
or      ax, word ptr [bp+var_4+2]
jnz     short loc_1FBB3
les     bx, [bp+arg_0]
les     bx, es:[bx+4]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
jmp     short loc_1FC6F

loc_1FC04:
les     bx, [bp+var_8]
cmp     byte ptr es:[bx+8], 2
jz      short loc_1FC62
mov     ax, es:[bx]
or      ax, es:[bx+2]
jz      short loc_1FC62
mov     al, es:[bx+9]
cbw
and     ax, 3
cmp     ax, 2
jnz     short loc_1FC45
push    word ptr es:[bx+2]
push    word ptr es:[bx]
cmp     byte ptr es:[bx+8], 6
jnz     short loc_1FC37
mov     ax, 0B4h
jmp     short loc_1FC3A

loc_1FC37:
mov     ax, 0ABh

loc_1FC3A:
push    ax
call    sub_31324
add     sp, 6
jmp     short loc_1FC62

loc_1FC45:
les     bx, [bp+var_8]
test    byte ptr es:[bx+9], 3
jnz     short loc_1FC62
push    word ptr es:[bx+2]
push    word ptr es:[bx]
mov     ax, 0ACh
push    ax
call    sub_31324
add     sp, 6

loc_1FC62:
les     bx, [bp+var_8]
les     bx, es:[bx+4]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx

loc_1FC6F:
mov     ax, word ptr [bp+var_8]
or      ax, word ptr [bp+var_8+2]
jz      short loc_1FC7A
jmp     loc_1FC04

loc_1FC7A:
mov     sp, bp
pop     bp
retf    4
sub_1FB9E endp

seg003 ends


; Segment type: Pure code
seg004 segment byte public 'CODE' use16
assume cs:seg004
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing


; Attributes: bp-based frame

sub_1FC80 proc near

arg_0= word ptr  4
arg_2= dword ptr  6

push    bp
mov     bp, sp
push    si
les     bx, [bp+arg_2]
mov     al, es:[bx+1]
cbw
mov     si, ax
cmp     si, 7
jl      short loc_1FCBE
cmp     byte ptr [si+4A75h], 0
jz      short loc_1FCBE
mov     ax, [bp+arg_0]
mov     dl, [si+4A75h]
mov     dh, 0
test    dx, ax
jnz     short loc_1FCBE
mov     bx, si
add     bx, 0FFF9h
shl     bx, 1
push    word ptr [bx+4A89h]
call    sub_312DE
inc     sp
inc     sp
mov     ax, 1
jmp     short loc_1FCC0

loc_1FCBE:
xor     ax, ax

loc_1FCC0:
pop     si
pop     bp
retn    6
sub_1FC80 endp



; Attributes: bp-based frame

sub_1FCC5 proc far

var_C= dword ptr -0Ch
var_8= word ptr -8
var_6= word ptr -6
var_4= dword ptr -4
arg_0= word ptr  6
arg_2= word ptr  8

push    bp
mov     bp, sp
sub     sp, 0Ch
cmp     byte ptr ds:9A63h, 3
jnz     short loc_1FCE6
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_40AC9
mov     word ptr [bp+var_C+2], dx
mov     word ptr [bp+var_C], ax
jmp     loc_1FE4F

loc_1FCE6:
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1F0E2
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
or      ax, dx
jnz     short loc_1FD5C
cmp     byte ptr ds:0BDB7h, 0
jz      short loc_1FD16
push    word ptr ds:0BD80h
push    word ptr ds:0BD7Eh
xor     ax, ax
push    ax
push    ax
call    sub_29A88
jmp     loc_1FE5A

loc_1FD16:
push    [bp+arg_2]
push    [bp+arg_0]
mov     ax, 48h ; 'H'
push    ax
call    sub_312DE
add     sp, 6
mov     ax, ds:0BFB0h
or      ax, ds:0BFB2h
jnz     short loc_1FD34
jmp     loc_1FE48

loc_1FD34:
push    [bp+arg_2]
push    [bp+arg_0]
mov     ax, 5
push    ax
push    word ptr ds:0BD80h
push    word ptr ds:0BD7Eh
xor     ax, ax
push    ax
call    sub_1F475
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
les     bx, [bp+var_4]
mov     byte ptr es:[bx+9], 23h ; '#'

loc_1FD5C:
les     bx, [bp+var_4]
les     bx, es:[bx+0Ch]
mov     [bp+var_6], es
mov     [bp+var_8], bx
les     bx, [bp+var_4]
mov     al, es:[bx+8]
cbw
dec     ax              ; switch 13 cases
cmp     ax, 0Ch
jbe     short loc_1FD7A
jmp     def_1FD7E       ; jumptable 0001FD7E default case, cases 7,8,10,12

loc_1FD7A:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_1FD7E[bx] ; switch jump
jpt_1FD7E dw offset loc_1FDE9 ; jump table for switch statement
dw offset loc_1FDE9
dw offset loc_1FDE9
dw offset loc_1FDE9
dw offset loc_1FE02
dw offset loc_1FE02
dw offset def_1FD7E
dw offset def_1FD7E
dw offset loc_1FE1E
dw offset def_1FD7E
dw offset loc_1FD9D
dw offset def_1FD7E
dw offset loc_1FDD1

loc_1FD9D:              ; jumptable 0001FD7E case 11
mov     al, 4
push    ax
push    [bp+var_6]
push    [bp+var_8]
push    word ptr [bp+var_4+2]
push    word ptr [bp+var_4]
call    sub_29943
mov     word ptr [bp+var_C+2], dx
mov     word ptr [bp+var_C], ax
les     bx, [bp+var_4]
mov     ax, es:[bx+0Ah]
les     bx, [bp+var_C]
mov     es:[bx+0Ah], ax
push    word ptr es:[bx+0Ah]
call    sub_3B194
jmp     loc_1FE4F

loc_1FDD1:              ; jumptable 0001FD7E case 13
les     bx, [bp+var_4]
mov     ax, es:[bx+0Ch]
or      ax, es:[bx+0Eh]
jnz     short loc_1FDE9 ; jumptable 0001FD7E cases 1-4
mov     ax, 2
push    ax
call    sub_3129B
inc     sp
inc     sp

loc_1FDE9:              ; jumptable 0001FD7E cases 1-4
push    [bp+var_6]
push    [bp+var_8]
push    word ptr [bp+var_4+2]
push    word ptr [bp+var_4]
call    sub_299B0
mov     word ptr [bp+var_C+2], dx
mov     word ptr [bp+var_C], ax
jmp     short loc_1FE4F

loc_1FE02:              ; jumptable 0001FD7E cases 5,6
mov     al, 7
push    ax
push    [bp+var_6]
push    [bp+var_8]
push    word ptr [bp+var_4+2]
push    word ptr [bp+var_4]
call    sub_29943
mov     word ptr [bp+var_C+2], dx
mov     word ptr [bp+var_C], ax
jmp     short loc_1FE4F

loc_1FE1E:              ; jumptable 0001FD7E case 9
push    word ptr ds:0BD80h
push    word ptr ds:0BD7Eh
les     bx, [bp+var_4]
mov     ax, es:[bx+0Ah]
cwd
push    dx
push    ax
call    sub_29A88
mov     word ptr [bp+var_C+2], dx
mov     word ptr [bp+var_C], ax
jmp     short loc_1FE4F

def_1FD7E:              ; jumptable 0001FD7E default case, cases 7,8,10,12
mov     ax, 49h ; 'I'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_1FE48:
call    sub_29811
jmp     short loc_1FE5A

loc_1FE4F:
push    word ptr [bp+var_C+2]
push    word ptr [bp+var_C]
call    sub_1FE60

loc_1FE5A:
mov     sp, bp
pop     bp
retf    4
sub_1FCC5 endp



; Attributes: bp-based frame

sub_1FE60 proc far

arg_0= dword ptr  6

push    bp
mov     bp, sp
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+1], 10h
jnz     short loc_1FE9A
cmp     byte ptr ds:9A63h, 3
jz      short loc_1FE7D
les     bx, es:[bx+6]
or      byte ptr es:[bx+9], 8

loc_1FE7D:
les     bx, [bp+arg_0]
les     bx, es:[bx+2]
push    word ptr es:[bx+2]
push    word ptr es:[bx]
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_1FEC3
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax

loc_1FE9A:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+1], 11h
jnz     short loc_1FEB9
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    word ptr [bp+arg_0+2]
push    bx
call    sub_1FEC3
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax

loc_1FEB9:
mov     dx, word ptr [bp+arg_0+2]
mov     ax, word ptr [bp+arg_0]
pop     bp
retf    4
sub_1FE60 endp



; Attributes: bp-based frame

sub_1FEC3 proc near

arg_0= dword ptr  4
arg_4= word ptr  8
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
push    si
xor     si, si
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 1
jnz     short loc_1FEE0
les     bx, es:[bx+6]
cmp     byte ptr es:[bx+12h], 5
jnz     short loc_1FEE0
mov     si, 5

loc_1FEE0:
mov     al, 2Ch ; ','
push    ax
push    [bp+arg_6]
push    [bp+arg_4]
push    si
call    sub_2A980
push    dx
push    ax
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
xor     ax, ax
push    ax
push    ax
call    sub_29862
pop     si
pop     bp
retn    8
sub_1FEC3 endp



; Attributes: bp-based frame

sub_1FF05 proc near

arg_0= dword ptr  4
arg_4= word ptr  8

push    bp
mov     bp, sp
push    si
mov     si, [bp+arg_4]
cmp     byte ptr ds:9A63h, 3
jz      short loc_1FF66
cmp     si, 1Ah
jz      short loc_1FF66
cmp     si, 1Ch
jz      short loc_1FF66
cmp     si, 1Bh
jz      short loc_1FF66
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+1], 8
jz      short loc_1FF33
cmp     byte ptr es:[bx+1], 9
jnz     short loc_1FF3F

loc_1FF33:
cmp     si, 18h
jz      short loc_1FF57
cmp     si, 19h
jz      short loc_1FF57
jmp     short loc_1FF66

loc_1FF3F:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+1], 0Ch
jz      short loc_1FF66
cmp     byte ptr es:[bx+1], 0Dh
jz      short loc_1FF66
cmp     byte ptr es:[bx+1], 0Eh
jz      short loc_1FF66

loc_1FF57:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 2Dh ; '-'
jz      short loc_1FF66
cmp     byte ptr es:[bx], 4
jnz     short loc_1FF6B

loc_1FF66:
mov     ax, 1
jmp     short loc_1FF6D

loc_1FF6B:
xor     ax, ax

loc_1FF6D:
pop     si
pop     bp
retn    6
sub_1FF05 endp



; Attributes: bp-based frame

sub_1FF72 proc far

var_18= dword ptr -18h
var_14= dword ptr -14h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= word ptr -4
var_2= word ptr -2
arg_0= dword ptr  6
arg_4= dword ptr  0Ah
arg_8= word ptr  0Eh

push    bp
mov     bp, sp
sub     sp, 18h
push    si
push    di
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx+1], 0
jnz     short loc_1FF87
jmp     loc_203D8

loc_1FF87:
mov     ax, word ptr [bp+arg_0]
or      ax, word ptr [bp+arg_0+2]
jz      short loc_1FFA1
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+1], 0
jnz     short loc_1FFA1
mov     dx, word ptr [bp+arg_0+2]
mov     ax, bx
jmp     loc_20B8F

loc_1FFA1:
mov     ax, word ptr [bp+arg_0]
or      ax, word ptr [bp+arg_0+2]
jnz     short loc_1FFB2
les     bx, [bp+arg_4]
mov     word ptr [bp+arg_0+2], es
mov     word ptr [bp+arg_0], bx

loc_1FFB2:
les     bx, [bp+arg_4]
mov     word ptr [bp+var_10+2], es
mov     word ptr [bp+var_10], bx
cmp     [bp+arg_8], 0Dh
jl      short loc_1FFC7
cmp     [bp+arg_8], 33h ; '3'
jle     short loc_1FFCB

loc_1FFC7:
xor     si, si
jmp     short loc_1FFD7

loc_1FFCB:
mov     bx, [bp+arg_8]
add     bx, 0FFF3h
shl     bx, 1
mov     si, [bx+4A2Eh]

loc_1FFD7:
test    si, 8000h
jz      short loc_20033
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_21BF9
or      ax, ax
jnz     short loc_1FFFA
mov     ax, 4Ah ; 'J'
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_20839

loc_1FFFA:
les     bx, [bp+arg_4]
les     bx, es:[bx+2]
test    byte ptr es:[bx+5], 40h
jnz     short loc_20025
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx+1], 12h
jnz     short loc_20033
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
mov     ax, 40h ; '@'
push    ax
call    sub_226C1
or      ax, ax
jz      short loc_20033

loc_20025:
mov     ax, 3Fh ; '?'
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_20839

loc_20033:
les     bx, [bp+arg_4]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jnz     short loc_20055
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jz      short loc_20059

loc_20055:
and     si, 0FFEFh

loc_20059:
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
push    si
call    sub_1FC80
or      ax, ax
jz      short loc_2006A
jmp     loc_20839

loc_2006A:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
push    si
call    sub_1FC80
or      ax, ax
jz      short loc_2007B
jmp     loc_20839

loc_2007B:
cmp     [bp+arg_8], 17h
jle     short loc_200AE
cmp     [bp+arg_8], 21h ; '!'
jg      short loc_200AE
push    [bp+arg_8]
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_1FF05
or      ax, ax
jz      short loc_200AE
push    [bp+arg_8]
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_29BC4
jmp     loc_20B8F

loc_200AE:
mov     di, 6Bh ; 'k'
mov     [bp+var_2], 0A4h
mov     ax, [bp+arg_8]
sub     ax, 0Dh         ; switch 39 cases
cmp     ax, 26h
jbe     short loc_200C4
jmp     def_200C8       ; jumptable 000200C8 default case, cases 15-22,26-33,45,49

loc_200C4:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_200C8[bx] ; switch jump
jpt_200C8 dw offset loc_204E6 ; jump table for switch statement
dw offset loc_20610
dw offset def_200C8
dw offset def_200C8
dw offset def_200C8
dw offset def_200C8
dw offset def_200C8
dw offset def_200C8
dw offset def_200C8
dw offset def_200C8
dw offset loc_207EC
dw offset loc_2058D
dw offset loc_20610
dw offset def_200C8
dw offset def_200C8
dw offset def_200C8
dw offset def_200C8
dw offset def_200C8
dw offset def_200C8
dw offset def_200C8
dw offset def_200C8
dw offset loc_20867
dw offset loc_20867
dw offset loc_20867
dw offset loc_20867
dw offset loc_20867
dw offset loc_20867
dw offset loc_2043D
dw offset loc_2043D
dw offset loc_20411
dw offset loc_2011B
dw offset loc_2023E
dw offset def_200C8
dw offset loc_20468
dw offset loc_20468
dw offset loc_2079A
dw offset def_200C8
dw offset loc_2095A
dw offset loc_2095A

loc_2011B:              ; jumptable 000200C8 case 43
les     bx, [bp+arg_4]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 8
jnz     short loc_2013A
mov     ax, 4Eh ; 'N'
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_20839

loc_2013A:
les     bx, [bp+arg_4]
les     bx, es:[bx+2]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
les     bx, es:[bx]
mov     word ptr [bp+var_C+2], es
mov     word ptr [bp+var_C], bx
cmp     byte ptr es:[bx+4], 0Fh
jnz     short loc_20165
mov     ax, 40h ; '@'
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_20839

loc_20165:
les     bx, [bp+var_C]
cmp     byte ptr es:[bx+4], 10h
jnz     short loc_201C1
mov     al, 2Bh ; '+'
push    ax
push    word ptr [bp+var_C+2]
push    bx
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
xor     ax, ax
push    ax
push    ax
call    sub_29862
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax
mov     al, 2Ch ; ','
push    ax
les     bx, [bp+var_C]
push    word ptr es:[bx+2]
push    word ptr es:[bx]
les     bx, [bp+var_8]
mov     al, es:[bx+5]
mov     ah, 0
push    ax
call    sub_2A980
push    dx
push    ax
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
xor     ax, ax
push    ax
push    ax
call    sub_29862
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
jmp     loc_20B89

loc_201C1:
les     bx, [bp+var_C]
cmp     byte ptr es:[bx+4], 11h
jnz     short loc_201D7
les     bx, [bp+arg_4]
mov     word ptr [bp+var_10+2], es
mov     word ptr [bp+var_10], bx
jmp     loc_20B89

loc_201D7:
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx], 2Ch ; ','
jnz     short loc_2021D
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
call    sub_22692
or      ax, ax
jz      short loc_2021D
les     bx, [bp+arg_4]
les     bx, es:[bx+6]
mov     word ptr [bp+arg_4+2], es
mov     word ptr [bp+arg_4], bx
mov     dx, word ptr [bp+var_C+2]
mov     ax, word ptr [bp+var_C]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
les     bx, [bp+var_C]
mov     al, es:[bx+4]
les     bx, [bp+arg_4]
mov     es:[bx+1], al
jmp     loc_203D8

loc_2021D:
push    [bp+arg_8]
push    word ptr [bp+var_C+2]
push    word ptr [bp+var_C]
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
xor     ax, ax
push    ax
push    ax
call    sub_29862
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
jmp     loc_20B89

loc_2023E:              ; jumptable 000200C8 case 44
les     bx, [bp+arg_4]
les     bx, es:[bx+2]
cmp     byte ptr es:[bx+4], 0Ch
jl      short loc_2025F
les     bx, [bp+arg_4]
les     bx, es:[bx+2]
cmp     byte ptr es:[bx+4], 0Eh
jg      short loc_2025F
mov     byte ptr ds:0BE19h, 1

loc_2025F:
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx], 2Ch ; ','
jnz     short loc_202C4
les     bx, es:[bx+2]
mov     dx, es:[bx+2]
mov     ax, es:[bx]
les     bx, [bp+arg_4]
les     bx, es:[bx+6]
cmp     dx, es:[bx+4]
jnz     short loc_20286
cmp     ax, es:[bx+2]
jz      short loc_202B6

loc_20286:
les     bx, [bp+arg_4]
les     bx, es:[bx+6]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
les     bx, [bp+arg_4]
les     bx, es:[bx+2]
mov     al, es:[bx+5]
mov     ah, 0
push    ax
call    sub_2A980
les     bx, [bp+arg_4]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
jmp     loc_203D8

loc_202B6:
mov     ax, 0A3h
push    ax
call    sub_31324
inc     sp
inc     sp
jmp     loc_203D8

loc_202C4:
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_21BB5
or      ax, ax
jnz     short loc_202E7
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx], 2Dh ; '-'
jz      short loc_202E7
push    word ptr [bp+arg_4+2]
push    bx
call    sub_21BF9
or      ax, ax
jnz     short loc_202F5

loc_202E7:
mov     ax, 59h ; 'Y'
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_20839

loc_202F5:
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx], 2Bh ; '+'
jnz     short loc_20348
les     bx, es:[bx+6]
mov     word ptr [bp+var_10+2], es
mov     word ptr [bp+var_10], bx
les     bx, [bp+arg_4]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
les     bx, [bp+var_10]
les     bx, es:[bx+2]
mov     al, es:[bx+5]
mov     ah, 0
push    ax
call    sub_2A980
mov     word ptr [bp+var_C+2], dx
mov     word ptr [bp+var_C], ax
les     bx, [bp+var_10]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
les     bx, [bp+var_C]
mov     al, es:[bx+4]
les     bx, [bp+var_10]
mov     es:[bx+1], al
jmp     loc_20B89

loc_20348:
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx], 30h ; '0'
jz      short loc_20354
jmp     loc_203E1

loc_20354:
les     bx, es:[bx+0Ah]
mov     word ptr [bp+var_18+2], es
mov     word ptr [bp+var_18], bx
mov     ax, 2Ch ; ','
push    ax
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
xor     ax, ax
push    ax
push    ax
push    cs
call    near ptr sub_1FF72
les     bx, [bp+var_18]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
mov     word ptr [bp+var_14+2], dx
mov     word ptr [bp+var_14], ax
mov     ax, 2Ch ; ','
push    ax
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
xor     ax, ax
push    ax
push    ax
push    cs
call    near ptr sub_1FF72
les     bx, [bp+var_18]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
les     bx, [bp+var_14]
mov     al, es:[bx+1]
les     bx, [bp+var_18]
mov     es:[bx+1], al
les     bx, [bp+arg_4]
mov     es:[bx+1], al
les     bx, [bp+var_14]
mov     dx, es:[bx+4]
mov     ax, es:[bx+2]
les     bx, [bp+var_18]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
les     bx, [bp+arg_4]
mov     es:[bx+4], dx
mov     es:[bx+2], ax

loc_203D8:
mov     dx, word ptr [bp+arg_4+2]
mov     ax, word ptr [bp+arg_4]
jmp     loc_20B8F

loc_203E1:
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx], 1
jz      short loc_203F0
cmp     byte ptr es:[bx], 7
jnz     short loc_203FC

loc_203F0:
les     bx, [bp+arg_4]
les     bx, es:[bx+6]
or      byte ptr es:[bx+9], 8

loc_203FC:
les     bx, [bp+arg_4]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    word ptr [bp+arg_4+2]
push    bx
call    sub_1FEC3
jmp     loc_20B8F

loc_20411:              ; jumptable 000200C8 case 42
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_20C7F
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax
mov     al, 2Ah ; '*'
push    ax
push    word ptr ds:0BD80h
push    word ptr ds:0BD7Eh
push    dx
push    word ptr [bp+arg_4]
xor     ax, ax
push    ax
push    ax
call    sub_29862
jmp     loc_20B8F

loc_2043D:              ; jumptable 000200C8 cases 40,41
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_21B15
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax
push    [bp+arg_8]
les     bx, [bp+arg_4]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    dx
push    ax
xor     ax, ax
push    ax
push    ax
call    sub_29862
jmp     loc_20B8F

loc_20468:              ; jumptable 000200C8 cases 46,47
les     bx, [bp+arg_4]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jz      short loc_2048A
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_219A1
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
jmp     short loc_204C6

loc_2048A:
les     bx, [bp+arg_4]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 2
jz      short loc_204AC
push    [bp+arg_8]
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_29D0F
jmp     loc_20B8F

loc_204AC:
push    word ptr ds:0BD80h
push    word ptr ds:0BD7Eh
xor     dx, dx
mov     ax, 1
push    dx
push    ax
call    sub_29A88
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax

loc_204C6:
push    [bp+arg_8]
les     bx, [bp+arg_4]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    word ptr [bp+arg_4+2]
push    bx
push    word ptr [bp+var_10+2]
push    word ptr [bp+var_10]
call    sub_29862
jmp     loc_20B8F

loc_204E6:              ; jumptable 000200C8 case 13
les     bx, [bp+arg_4]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jz      short loc_20547
mov     bx, word ptr [bp+arg_4]
les     bx, es:[bx+2]
mov     word ptr [bp+var_C+2], es
mov     word ptr [bp+var_C], bx
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jz      short loc_20518
jmp     loc_205AF

loc_20518:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_21A0B
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
push    word ptr [bp+var_C+2]
push    word ptr [bp+var_C]
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
push    dx
push    ax
call    sub_22671
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
jmp     loc_20B89

loc_20547:
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jnz     short loc_2055B
jmp     def_200C8       ; jumptable 000200C8 default case, cases 15-22,26-33,45,49

loc_2055B:
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_21A0B
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax
les     bx, [bp+arg_0]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    word ptr [bp+arg_0+2]
push    bx
push    dx
push    ax
call    sub_22671
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
jmp     loc_20B89

loc_2058D:              ; jumptable 000200C8 case 24
les     bx, [bp+arg_4]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jz      short loc_205EE
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jz      short loc_205BD

loc_205AF:
mov     ax, 5Ah ; 'Z'
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_20839

loc_205BD:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_21A0B
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
push    [bp+arg_8]
les     bx, [bp+arg_4]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    word ptr [bp+arg_4+2]
push    bx
push    dx
push    ax
call    sub_29862
jmp     loc_20B8F

loc_205EE:
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jnz     short loc_20602
jmp     def_200C8       ; jumptable 000200C8 default case, cases 15-22,26-33,45,49

loc_20602:
mov     ax, 5Bh ; '['
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_20839

loc_20610:              ; jumptable 000200C8 cases 14,25
les     bx, [bp+arg_4]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jnz     short loc_20624
jmp     loc_20778

loc_20624:
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jnz     short loc_20638
jmp     loc_20741

loc_20638:
cmp     [bp+arg_8], 19h
jnz     short loc_20641
jmp     loc_2078C

loc_20641:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
les     bx, [bp+arg_4]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
xor     ax, ax
push    ax
push    ax
push    ax
call    sub_21215
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_219A1
mov     word ptr [bp+var_14+2], dx
mov     word ptr [bp+var_14], ax
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+1], 0Bh
jnz     short loc_20680
mov     ax, 8
jmp     short loc_20683

loc_20680:
mov     ax, 5

loc_20683:
push    ax
xor     ax, ax
push    ax
call    sub_2A52D
mov     word ptr [bp+var_C+2], dx
mov     word ptr [bp+var_C], ax
les     bx, [bp+var_C]
cmp     byte ptr es:[bx+4], 8
jnz     short loc_206FD
les     bx, [bp+arg_0]
les     bx, es:[bx+2]
mov     al, es:[bx+5]
mov     ah, 0
and     ax, 0Fh
cmp     ax, 5
jnz     short loc_206FD
mov     ax, 6
push    ax
xor     ax, ax
push    ax
call    sub_2A52D
mov     word ptr [bp+var_18+2], dx
mov     word ptr [bp+var_18], ax
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
push    dx
push    ax
mov     ax, 1
push    ax
xor     ax, ax
push    ax
push    ax
call    sub_21215
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
push    word ptr [bp+var_18+2]
push    word ptr [bp+var_18]
mov     ax, 1
push    ax
xor     ax, ax
push    ax
push    ax
call    sub_21215
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax

loc_206FD:
mov     al, 3Ah ; ':'
push    ax
push    word ptr [bp+var_C+2]
push    word ptr [bp+var_C]
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_29862
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
mov     al, 10h
push    ax
les     bx, [bp+var_10]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    dx
push    bx
push    word ptr [bp+var_14+2]
push    word ptr [bp+var_14]
call    sub_29862
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
jmp     loc_20B89

loc_20741:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_21A0B
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
push    [bp+arg_8]
les     bx, [bp+arg_4]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    word ptr [bp+arg_4+2]
push    bx
push    dx
push    ax
call    sub_29862
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
jmp     loc_20B89

loc_20778:
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jnz     short loc_2078C
jmp     def_200C8       ; jumptable 000200C8 default case, cases 15-22,26-33,45,49

loc_2078C:
mov     ax, 5Ch ; '\'
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_20839

loc_2079A:              ; jumptable 000200C8 case 48
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx], 2
jz      short loc_207B2
push    word ptr [bp+arg_4+2]
push    bx
call    sub_20C7F
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax

loc_207B2:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 31h ; '1'
jz      short loc_207C6
mov     ax, 3Bh ; ';'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_207C6:
mov     al, 30h ; '0'
push    ax
les     bx, [bp+arg_0]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
push    word ptr [bp+arg_0+2]
push    bx
call    sub_29862
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
jmp     loc_20B89

loc_207EC:              ; jumptable 000200C8 case 23
mov     di, 6Ah ; 'j'
mov     [bp+var_2], 0A5h
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx+1], 12h
jz      short loc_2080B
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+1], 12h
jz      short loc_2080B
jmp     def_200C8       ; jumptable 000200C8 default case, cases 15-22,26-33,45,49

loc_2080B:
les     bx, [bp+arg_4]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
les     bx, [bp+arg_0]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
mov     ax, 1
push    ax
call    sub_2A221
or      ax, ax
jnz     short loc_20841
mov     ax, 4Ch ; 'L'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_20839:
call    sub_29811
jmp     loc_20B8F

loc_20841:
mov     al, 17h
push    ax
les     bx, [bp+arg_4]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    word ptr [bp+arg_4+2]
push    bx
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_29862
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
jmp     loc_20B89

loc_20867:              ; jumptable 000200C8 cases 34-39
mov     di, 6Ch ; 'l'
mov     [bp+var_2], 0A6h
les     bx, [bp+arg_4]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jnz     short loc_208E8
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jnz     short loc_208E8
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_237EA
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_237EA
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 2
jz      short loc_208CA
push    dx
push    ax
mov     al, es:[bx+1]
cbw
push    ax
call    sub_21CA1
jmp     def_200C8       ; jumptable 000200C8 default case, cases 15-22,26-33,45,49

loc_208CA:
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx], 2
jnz     short loc_208D6
jmp     def_200C8       ; jumptable 000200C8 default case, cases 15-22,26-33,45,49

loc_208D6:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
mov     al, es:[bx+1]
cbw
push    ax
call    sub_21CA1
jmp     def_200C8       ; jumptable 000200C8 default case, cases 15-22,26-33,45,49

loc_208E8:
les     bx, [bp+arg_4]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jnz     short loc_208FC
jmp     def_200C8       ; jumptable 000200C8 default case, cases 15-22,26-33,45,49

loc_208FC:
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jnz     short loc_20910
jmp     def_200C8       ; jumptable 000200C8 default case, cases 15-22,26-33,45,49

loc_20910:
mov     bx, word ptr [bp+arg_0]
cmp     byte ptr es:[bx+1], 0Bh
jnz     short loc_2093E
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx+1], 0Bh
jz      short loc_2093E
push    word ptr [bp+arg_4+2]
push    bx
les     bx, [bp+arg_0]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
call    sub_21750
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax
jmp     short def_200C8 ; jumptable 000200C8 default case, cases 15-22,26-33,45,49

loc_2093E:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
les     bx, [bp+arg_4]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
call    sub_21750
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
jmp     short def_200C8 ; jumptable 000200C8 default case, cases 15-22,26-33,45,49

loc_2095A:              ; jumptable 000200C8 cases 50,51
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_20C7F
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_20C7F
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
push    [bp+arg_8]
push    word ptr ds:0BD80h
push    word ptr ds:0BD7Eh
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
push    dx
push    ax
call    sub_29862
jmp     loc_20B8F

def_200C8:              ; jumptable 000200C8 default case, cases 15-22,26-33,45,49
test    si, 2000h
jz      short loc_209BD
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_21B15
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_21B15
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax
jmp     short loc_209E1

loc_209BD:
test    si, 4000h
jz      short loc_209E1
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_21B60
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_21B60
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax

loc_209E1:
mov     ax, si
and     ax, 3
mov     [bp+var_4], ax
cmp     ax, 3
jnz     short loc_20A18
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
mov     ax, 2
push    ax
xor     ax, ax
push    ax
call    sub_2A52D
push    dx
push    ax
mov     ax, 1
push    ax
xor     ax, ax
push    ax
push    ax
call    sub_21215
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
jmp     loc_20B4A

loc_20A18:
cmp     [bp+var_4], 1
jnz     short loc_20A21
jmp     loc_20AF1

loc_20A21:
cmp     [bp+var_4], 2
jnz     short loc_20A50
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
mov     ax, 2
push    ax
xor     ax, ax
push    ax
call    sub_2A52D
push    dx
push    ax
xor     ax, ax
push    ax
push    di
push    [bp+var_2]
call    sub_21215
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
jmp     loc_20B14

loc_20A50:
les     bx, [bp+arg_4]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jz      short loc_20A99
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 2
jnz     short loc_20A99
mov     ax, es:[bx+6]
or      ax, es:[bx+8]
jnz     short loc_20A99
push    word ptr [bp+arg_0+2]
push    bx
les     bx, [bp+arg_4]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
mov     ax, 1
push    ax
xor     ax, ax
push    ax
push    ax
call    sub_21215
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
jmp     loc_20B14

loc_20A99:
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jz      short loc_20AE1
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx], 2
jnz     short loc_20AE1
mov     ax, es:[bx+6]
or      ax, es:[bx+8]
jnz     short loc_20AE1
push    word ptr [bp+arg_4+2]
push    bx
les     bx, [bp+arg_0]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
mov     ax, 1
push    ax
xor     ax, ax
push    ax
push    ax
call    sub_21215
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax
jmp     short loc_20B14

loc_20AE1:
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
les     bx, [bp+arg_4]
cmp     al, es:[bx+1]
jge     short loc_20B14

loc_20AF1:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
les     bx, [bp+arg_4]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
xor     ax, ax
push    ax
push    di
push    [bp+var_2]
call    sub_21215
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax

loc_20B14:
test    si, 4
jnz     short loc_20B4A
les     bx, [bp+arg_4]
mov     al, es:[bx+1]
les     bx, [bp+arg_0]
cmp     al, es:[bx+1]
jge     short loc_20B4A
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
xor     ax, ax
push    ax
push    di
push    [bp+var_2]
call    sub_21215
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax

loc_20B4A:
test    si, 8
jz      short loc_20B5C
les     bx, ds:0BD7Eh
mov     word ptr [bp+var_C+2], es
mov     word ptr [bp+var_C], bx
jmp     short loc_20B69

loc_20B5C:
les     bx, [bp+arg_4]
les     bx, es:[bx+2]
mov     word ptr [bp+var_C+2], es
mov     word ptr [bp+var_C], bx

loc_20B69:
push    [bp+arg_8]
push    word ptr [bp+var_C+2]
push    word ptr [bp+var_C]
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_29862
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax

loc_20B89:
mov     dx, word ptr [bp+var_10+2]
mov     ax, word ptr [bp+var_10]

loc_20B8F:
pop     di
pop     si
mov     sp, bp
pop     bp
retf    0Ah
sub_1FF72 endp



; Attributes: bp-based frame

sub_20B97 proc far

var_4= word ptr -4
var_2= word ptr -2
arg_0= dword ptr  6
arg_4= dword ptr  0Ah

push    bp
mov     bp, sp
sub     sp, 4
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx+1], 0
jnz     short loc_20BAF
mov     dx, word ptr [bp+arg_4+2]
mov     ax, bx
jmp     loc_20C79

loc_20BAF:
mov     ax, word ptr [bp+arg_0]
or      ax, word ptr [bp+arg_0+2]
jz      short loc_20BC9
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+1], 0
jnz     short loc_20BC9
mov     dx, word ptr [bp+arg_0+2]
mov     ax, bx
jmp     loc_20C79

loc_20BC9:
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx+1], 12h
jz      short loc_20BDD
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+1], 12h
jnz     short loc_20C37

loc_20BDD:
les     bx, [bp+arg_4]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
les     bx, [bp+arg_0]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
mov     ax, 1
push    ax
call    sub_2A221
or      ax, ax
jnz     short loc_20C12
mov     ax, 4Ch ; 'L'
push    ax
call    sub_312DE
inc     sp
inc     sp
call    sub_29811
jmp     short loc_20C79

loc_20C12:
mov     al, 17h
push    ax
les     bx, [bp+arg_4]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    word ptr [bp+arg_4+2]
push    bx
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_29862
mov     [bp+var_2], dx
mov     [bp+var_4], ax
jmp     short loc_20C79

loc_20C37:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
les     bx, [bp+arg_4]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
xor     ax, ax
push    ax
mov     ax, 6Ah ; 'j'
push    ax
mov     ax, 0A5h
push    ax
call    sub_21215
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
mov     al, 17h
push    ax
les     bx, [bp+arg_4]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    word ptr [bp+arg_4+2]
push    bx
push    dx
push    word ptr [bp+arg_0]
call    sub_29862

loc_20C79:
mov     sp, bp
pop     bp
retf    8
sub_20B97 endp



; Attributes: bp-based frame

sub_20C7F proc far

arg_0= dword ptr  6

push    bp
mov     bp, sp
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 17h
jnz     short loc_20C96
mov     ax, 0B6h
push    ax
call    sub_31324
mov     sp, bp

loc_20C96:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 22h ; '"'
jl      short loc_20CA5
cmp     byte ptr es:[bx], 27h ; '''
jle     short loc_20CBA

loc_20CA5:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 32h ; '2'
jz      short loc_20CBA
cmp     byte ptr es:[bx], 33h ; '3'
jz      short loc_20CBA
cmp     byte ptr es:[bx], 2Ah ; '*'
jnz     short loc_20CC2

loc_20CBA:
mov     dx, word ptr [bp+arg_0+2]
mov     ax, word ptr [bp+arg_0]
jmp     short loc_20CE3

loc_20CC2:
mov     ax, 23h ; '#'
push    ax
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
push    word ptr ds:0BD80h
push    word ptr ds:0BD7Eh
xor     ax, ax
push    ax
push    ax
call    sub_29A88
push    dx
push    ax
push    cs
call    near ptr sub_1FF72

loc_20CE3:
pop     bp
retf    4
sub_20C7F endp



; Attributes: bp-based frame

sub_20CE7 proc near

var_4= dword ptr -4
arg_0= dword ptr  4

push    bp
mov     bp, sp
sub     sp, 4
mov     ax, word ptr [bp+arg_0]
or      ax, word ptr [bp+arg_0+2]
jnz     short loc_20CFC
xor     dx, dx
mov     ax, dx
jmp     loc_20D78

loc_20CFC:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 39h ; '9'
jnz     short loc_20D27
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
call    sub_20CE7
les     bx, [bp+arg_0]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
les     bx, es:[bx+0Ah]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
jmp     short loc_20D30

loc_20D27:
les     bx, [bp+arg_0]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx

loc_20D30:
les     bx, [bp+var_4]
cmp     byte ptr es:[bx+1], 12h
jnz     short loc_20D47
mov     ax, 0B7h
push    ax
call    sub_31324
inc     sp
inc     sp
jmp     short loc_20D72

loc_20D47:
push    word ptr [bp+var_4+2]
push    word ptr [bp+var_4]
call    sub_21B15
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 39h ; '9'
jnz     short loc_20D69
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
jmp     short loc_20D72

loc_20D69:
les     bx, [bp+var_4]
mov     word ptr [bp+arg_0+2], es
mov     word ptr [bp+arg_0], bx

loc_20D72:
mov     dx, word ptr [bp+arg_0+2]
mov     ax, word ptr [bp+arg_0]

loc_20D78:
mov     sp, bp
pop     bp
retn    4
sub_20CE7 endp



; Attributes: bp-based frame

sub_20D7E proc far

arg_0= word ptr  6
arg_2= word ptr  8
arg_4= word ptr  0Ah
arg_6= word ptr  0Ch

push    bp
mov     bp, sp
push    [bp+arg_6]
push    [bp+arg_4]
push    [bp+arg_2]
push    [bp+arg_0]
xor     ax, ax
push    ax
mov     ax, 6Bh ; 'k'
push    ax
mov     ax, 0A4h
push    ax
call    sub_21215
pop     bp
retf    8
sub_20D7E endp



; Attributes: bp-based frame

sub_20DA1 proc near

var_1= byte ptr -1
arg_0= dword ptr  4
arg_4= dword ptr  8

push    bp
mov     bp, sp
sub     sp, 2
push    si
mov     ax, word ptr [bp+arg_4]
or      ax, word ptr [bp+arg_4+2]
jz      short loc_20DB9
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx], 0
jnz     short loc_20DC0

loc_20DB9:
xor     dx, dx
mov     ax, dx
jmp     loc_20EFB

loc_20DC0:
les     bx, [bp+arg_4]
mov     al, es:[bx]
cbw
mov     bx, ax
mov     al, [bx+4AA1h]
mov     [bp+var_1], al
mov     al, [bp+var_1]
cbw
cmp     ax, 3           ; switch 4 cases
jbe     short loc_20DDC
jmp     def_20DE0       ; jumptable 00020DE0 default case

loc_20DDC:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_20DE0[bx] ; switch jump
jpt_20DE0 dw offset loc_20DED ; jump table for switch statement
dw offset loc_20ED9
dw offset loc_20E30
dw offset loc_20E09

loc_20DED:              ; jumptable 00020DE0 case 0
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
mov     ax, 1
push    ax
xor     ax, ax
push    ax
push    ax
call    sub_21215
jmp     loc_20EFB

loc_20E09:              ; jumptable 00020DE0 case 3
les     bx, [bp+arg_4]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
les     bx, [bp+arg_0]
mov     al, es:[bx+4]
cbw
push    ax
call    sub_21DC9
les     bx, [bp+arg_4]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
jmp     loc_20ED9       ; jumptable 00020DE0 case 1

loc_20E30:              ; jumptable 00020DE0 case 2
les     bx, [bp+arg_4]
les     bx, es:[bx+6]
mov     al, es:[bx+1]
cbw
mov     si, ax
cmp     si, 9
jle     short loc_20E65
mov     dx, word ptr [bp+arg_0+2]
mov     ax, word ptr [bp+arg_0]
les     bx, [bp+arg_4]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
les     bx, [bp+arg_0]
mov     al, es:[bx+4]
les     bx, [bp+arg_4]
mov     es:[bx+1], al
jmp     loc_20EF5

loc_20E65:
les     bx, [bp+arg_0]
mov     al, es:[bx+4]
cbw
mov     bx, ax
mov     al, [bx+7B6Ch]
cmp     al, [si+7B6Ch]
jg      short loc_20ED9 ; jumptable 00020DE0 case 1
les     bx, [bp+arg_4]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_20DA1
jmp     short loc_20EFB

def_20DE0:              ; jumptable 00020DE0 default case
test    [bp+var_1], 10h
jz      short loc_20EB4
les     bx, [bp+arg_4]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_20DA1
les     bx, [bp+arg_4]
mov     es:[bx+8], dx
mov     es:[bx+6], ax

loc_20EB4:
test    [bp+var_1], 20h
jz      short loc_20ED9 ; jumptable 00020DE0 case 1
les     bx, [bp+arg_4]
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_20DA1
les     bx, [bp+arg_4]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax

loc_20ED9:              ; jumptable 00020DE0 case 1
les     bx, [bp+arg_0]
mov     al, es:[bx+4]
les     bx, [bp+arg_4]
mov     es:[bx+1], al
mov     dx, word ptr [bp+arg_0+2]
mov     ax, word ptr [bp+arg_0]
mov     es:[bx+4], dx
mov     es:[bx+2], ax

loc_20EF5:
mov     dx, word ptr [bp+arg_4+2]
mov     ax, word ptr [bp+arg_4]

loc_20EFB:
pop     si
mov     sp, bp
pop     bp
retn    8
sub_20DA1 endp



; Attributes: bp-based frame

sub_20F02 proc near

var_E= word ptr -0Eh
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= word ptr -4
var_2= word ptr -2
arg_0= dword ptr  4

push    bp
mov     bp, sp
sub     sp, 0Eh
push    si
push    di
mov     ax, word ptr [bp+arg_0]
or      ax, word ptr [bp+arg_0+2]
jnz     short loc_20F19
xor     dx, dx
mov     ax, dx
jmp     loc_210F9

loc_20F19:
les     bx, [bp+arg_0]
mov     al, es:[bx]
cbw
mov     bx, ax
mov     al, [bx+4AE3h]
cbw
mov     di, ax
mov     ax, di
or      ax, ax
jnz     short loc_20F32
jmp     loc_21060

loc_20F32:
cmp     ax, 2
jnz     short loc_20F3A
jmp     loc_21038

loc_20F3A:
cmp     ax, 3
jz      short loc_20F42
jmp     loc_2107F

loc_20F42:
les     bx, [bp+arg_0]
mov     dx, es:[bx+8]
mov     ax, es:[bx+6]
mov     [bp+var_2], dx
mov     [bp+var_4], ax
cmp     dx, ds:73D4h
jl      short loc_20F7B
jnz     short loc_20F61
cmp     ax, ds:73D2h
jb      short loc_20F7B

loc_20F61:
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]
cmp     dx, ds:73D8h
jg      short loc_20F7B
jnz     short loc_20F75
cmp     ax, ds:73D6h
ja      short loc_20F7B

loc_20F75:
mov     si, 1
jmp     loc_21020

loc_20F7B:
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]
cmp     dx, ds:73E0h
jg      short loc_20F95
jnz     short loc_20F8F
cmp     ax, ds:73DEh
ja      short loc_20F95

loc_20F8F:
mov     si, 2
jmp     loc_21020

loc_20F95:
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]
cmp     dx, ds:73E4h
jl      short loc_20FC3
jnz     short loc_20FA9
cmp     ax, ds:73E2h
jb      short loc_20FC3

loc_20FA9:
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]
cmp     dx, ds:73E8h
jg      short loc_20FC3
jnz     short loc_20FBD
cmp     ax, ds:73E6h
ja      short loc_20FC3

loc_20FBD:
mov     si, 3
jmp     loc_21020

loc_20FC3:
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]
cmp     dx, ds:73F0h
jg      short loc_20FDC
jnz     short loc_20FD7
cmp     ax, ds:73EEh
ja      short loc_20FDC

loc_20FD7:
mov     si, 4
jmp     short loc_21020

loc_20FDC:
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]
cmp     dx, ds:73F4h
jl      short loc_21009
jnz     short loc_20FF0
cmp     ax, ds:73F2h
jb      short loc_21009

loc_20FF0:
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]
cmp     dx, ds:73F8h
jg      short loc_21009
jnz     short loc_21004
cmp     ax, ds:73F6h
ja      short loc_21009

loc_21004:
mov     si, 5
jmp     short loc_21020

loc_21009:
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]
cmp     dx, ds:7400h
jg      short loc_21060
jnz     short loc_2101D
cmp     ax, ds:73FEh
ja      short loc_21060

loc_2101D:
mov     si, 6

loc_21020:
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
cmp     ax, si
jle     short loc_21060
push    si
xor     ax, ax
push    ax
call    sub_2A52D
jmp     loc_210F9

loc_21038:
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     [bp+var_E], ax
les     bx, es:[bx+6]
mov     al, es:[bx+1]
cbw
mov     si, ax
cmp     si, 9
jg      short loc_21060
mov     bx, [bp+var_E]
mov     al, [bx+7B6Ch]
cmp     al, [si+7B6Ch]
jg      short loc_2106E

loc_21060:
les     bx, [bp+arg_0]
mov     dx, es:[bx+4]
mov     ax, es:[bx+2]
jmp     loc_210F9

loc_2106E:
les     bx, [bp+arg_0]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
call    sub_20F02
jmp     loc_210F9

loc_2107F:
test    di, 40h
jz      short loc_2109B
les     bx, [bp+arg_0]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
call    sub_20F02
mov     word ptr [bp+var_C+2], dx
mov     word ptr [bp+var_C], ax
jmp     short loc_210A5

loc_2109B:
mov     word ptr [bp+var_C+2], 0
mov     word ptr [bp+var_C], 0

loc_210A5:
test    di, 80h
jz      short loc_210C1
les     bx, [bp+arg_0]
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
call    sub_20F02
mov     word ptr [bp+var_8+2], dx
mov     word ptr [bp+var_8], ax
jmp     short loc_210CB

loc_210C1:
mov     word ptr [bp+var_8+2], 0
mov     word ptr [bp+var_8], 0

loc_210CB:
mov     ax, word ptr [bp+var_C]
or      ax, word ptr [bp+var_C+2]
jz      short loc_210F3
mov     ax, word ptr [bp+var_8]
or      ax, word ptr [bp+var_8+2]
jz      short loc_210EB
les     bx, [bp+var_C]
mov     al, es:[bx+4]
les     bx, [bp+var_8]
cmp     al, es:[bx+4]
jle     short loc_210F3

loc_210EB:
mov     dx, word ptr [bp+var_C+2]
mov     ax, word ptr [bp+var_C]
jmp     short loc_210F9

loc_210F3:
mov     dx, word ptr [bp+var_8+2]
mov     ax, word ptr [bp+var_8]

loc_210F9:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    4
sub_20F02 endp



; Attributes: bp-based frame

sub_21101 proc far

var_4= dword ptr -4
arg_0= dword ptr  6

push    bp
mov     bp, sp
sub     sp, 4
mov     ax, word ptr [bp+arg_0]
or      ax, word ptr [bp+arg_0+2]
jz      short loc_2114C
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+1], 2
jle     short loc_2114C
cmp     byte ptr es:[bx+1], 9
jg      short loc_2114C
mov     al, es:[bx]
cbw
mov     bx, ax
cmp     byte ptr [bx+4AE3h], 0
jz      short loc_2114C
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_20F02
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
les     bx, [bp+var_4]
mov     al, es:[bx+4]
les     bx, [bp+arg_0]
cmp     al, es:[bx+1]
jnz     short loc_21154

loc_2114C:
mov     dx, word ptr [bp+arg_0+2]
mov     ax, word ptr [bp+arg_0]
jmp     short loc_21163

loc_21154:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
push    word ptr [bp+var_4+2]
push    word ptr [bp+var_4]
call    sub_20DA1

loc_21163:
mov     sp, bp
pop     bp
retf    4
sub_21101 endp



; Attributes: bp-based frame

sub_21169 proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= dword ptr  4
arg_4= dword ptr  8

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
mov     ax, 2
push    ax
call    sub_21948
or      ax, ax
jz      short loc_2118B
jmp     loc_2120D

loc_2118B:
les     bx, [bp+arg_4]
les     bx, es:[bx]
mov     al, es:[bx+5]
mov     ah, 0
mov     si, ax
les     bx, [bp+arg_0]
les     bx, es:[bx]
mov     al, es:[bx+5]
mov     ah, 0
mov     di, ax
mov     ax, si
and     ax, 40h
mov     [bp+var_4], ax
mov     ax, di
and     ax, 40h
mov     [bp+var_2], ax
and     si, 80h
and     di, 80h
les     bx, [bp+arg_4]
les     bx, es:[bx]
cmp     byte ptr es:[bx+4], 2
jg      short loc_21202
les     bx, [bp+arg_0]
les     bx, es:[bx]
cmp     byte ptr es:[bx+4], 2
jg      short loc_21202
cmp     di, si
jl      short loc_21202
cmp     ax, [bp+var_4]
jl      short loc_21202
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_218D8
or      ax, ax
jz      short loc_21202
mov     ax, 0BEh
push    ax
call    sub_31324
inc     sp
inc     sp
jmp     short loc_2120D

loc_21202:
mov     ax, 0B0h
push    ax
call    sub_31324
inc     sp
inc     sp

loc_2120D:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    8
sub_21169 endp



; Attributes: bp-based frame

sub_21215 proc far

var_10= byte ptr -10h
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  6
arg_2= word ptr  8
arg_4= word ptr  0Ah
arg_6= dword ptr  0Ch
arg_A= dword ptr  10h

push    bp
mov     bp, sp
sub     sp, 10h
push    si
push    di
mov     di, [bp+arg_4]
les     bx, [bp+arg_A]
cmp     byte ptr es:[bx], 0
jnz     short loc_2122C
jmp     loc_216C2

loc_2122C:
push    word ptr [bp+arg_A+2]
push    bx
call    sub_237EA
mov     word ptr [bp+arg_A+2], dx
mov     word ptr [bp+arg_A], ax
les     bx, [bp+arg_A]
mov     dx, es:[bx+4]
mov     ax, es:[bx+2]
cmp     dx, word ptr [bp+arg_6+2]
jnz     short loc_21253
cmp     ax, word ptr [bp+arg_6]
jnz     short loc_21253
jmp     loc_216C2

loc_21253:
les     bx, [bp+arg_A]
mov     al, es:[bx+1]
cbw
mov     si, ax
les     bx, [bp+arg_6]
mov     al, es:[bx+4]
cbw
mov     [bp+var_6], ax
sub     ax, 7           ; switch 12 cases
cmp     ax, 0Bh
jbe     short loc_21273
jmp     def_21277       ; jumptable 00021277 default case, cases 8,9,12-14

loc_21273:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_21277[bx] ; switch jump
jpt_21277 dw offset loc_2129A ; jump table for switch statement
dw offset def_21277
dw offset def_21277
dw offset loc_2129A
dw offset loc_2129A
dw offset def_21277
dw offset def_21277
dw offset def_21277
dw offset loc_21730
dw offset loc_21294
dw offset loc_21294
dw offset loc_21294

loc_21294:              ; jumptable 00021277 cases 16-18
call    sub_218CC
jmp     loc_216C2

loc_2129A:              ; jumptable 00021277 cases 7,10,11
push    word ptr [bp+arg_A+2]
push    word ptr [bp+arg_A]
call    sub_2240B
les     bx, [bp+arg_A]
mov     al, es:[bx+1]
cbw
mov     si, ax
or      di, di
jnz     short loc_212F0
test    byte ptr [si+6810h], 1
jz      short loc_212F0
cmp     byte ptr es:[bx], 2
jnz     short loc_212CA
mov     ax, es:[bx+6]
or      ax, es:[bx+8]
jz      short loc_212F0

loc_212CA:
cmp     [bp+var_6], 0Bh
jz      short loc_212E6
cmp     si, 8
jz      short loc_212DA
cmp     si, 9
jnz     short loc_212E6

loc_212DA:
push    [bp+arg_2]
call    sub_312DE
inc     sp
inc     sp
jmp     short loc_212F0

loc_212E6:
push    [bp+arg_0]
call    sub_31324
inc     sp
inc     sp

loc_212F0:
les     bx, [bp+arg_A]
cmp     byte ptr es:[bx], 2Ch ; ','
jnz     short loc_21343
cmp     si, [bp+var_6]
jnz     short loc_21343
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    word ptr [bp+arg_6+2]
push    word ptr [bp+arg_6]
mov     ax, 2
push    ax
call    sub_2A221
or      ax, ax
jz      short loc_21343

loc_21319:
mov     dx, word ptr [bp+arg_6+2]
mov     ax, word ptr [bp+arg_6]
les     bx, [bp+arg_A]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
cmp     byte ptr ds:9A63h, 3
jz      short loc_21334
jmp     loc_216C2

loc_21334:
les     bx, [bp+arg_A]
les     bx, es:[bx+6]
mov     byte ptr es:[bx+1], 5
jmp     loc_216C2

loc_21343:
or      di, di
jnz     short def_21277 ; jumptable 00021277 default case, cases 8,9,12-14
test    byte ptr [si+6810h], 14h
jz      short def_21277 ; jumptable 00021277 default case, cases 8,9,12-14
les     bx, [bp+arg_A]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    word ptr [bp+arg_6+2]
push    word ptr [bp+arg_6]
call    sub_21169

def_21277:              ; jumptable 00021277 default case, cases 8,9,12-14
mov     ax, si
sub     ax, 7           ; switch 12 cases
cmp     ax, 0Bh
jbe     short loc_2136F
jmp     def_21373       ; jumptable 00021373 default case, cases 14,16,17

loc_2136F:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_21373[bx] ; switch jump
jpt_21373 dw offset loc_213B4 ; jump table for switch statement
dw offset loc_21390
dw offset loc_21390
dw offset loc_213B4
dw offset loc_213B4
dw offset loc_21497
dw offset loc_21497
dw offset def_21373
dw offset loc_214A3
dw offset def_21373
dw offset def_21373
dw offset loc_214B0

loc_21390:              ; jumptable 00021373 cases 8,9
cmp     [bp+var_6], 5
jz      short loc_2139F
cmp     [bp+var_6], 6
jz      short loc_2139F
jmp     def_21373       ; jumptable 00021373 default case, cases 14,16,17

loc_2139F:
or      di, di
jz      short loc_213A6
jmp     def_21373       ; jumptable 00021373 default case, cases 14,16,17

loc_213A6:
mov     ax, 0B1h
push    ax
call    sub_31324
inc     sp
inc     sp
jmp     def_21373       ; jumptable 00021373 default case, cases 14,16,17

loc_213B4:              ; jumptable 00021373 cases 7,10,11
mov     bx, [bp+var_6]
test    byte ptr [bx+6810h], 2
jz      short loc_213C1
call    sub_218CC

loc_213C1:
or      di, di
jnz     short loc_21402
mov     bx, [bp+var_6]
test    byte ptr [bx+6810h], 1
jz      short loc_21402
cmp     si, 0Bh
jnz     short loc_213E0
cmp     bx, 8
jz      short loc_213F8
cmp     bx, 9
jnz     short loc_213EC
jmp     short loc_213F8

loc_213E0:
cmp     [bp+var_6], 8
jz      short loc_213EC
cmp     [bp+var_6], 9
jnz     short loc_213F8

loc_213EC:
push    [bp+arg_2]
call    sub_312DE
inc     sp
inc     sp
jmp     short loc_21402

loc_213F8:
push    [bp+arg_0]
call    sub_31324
inc     sp
inc     sp

loc_21402:
les     bx, [bp+arg_A]
cmp     byte ptr es:[bx], 2
jnz     short loc_21448
cmp     [bp+var_6], 0Bh
jnz     short loc_21448
cmp     si, 0Bh
jz      short loc_21448
cmp     byte ptr ds:9A63h, 3
jz      short loc_21420
jmp     loc_21730       ; jumptable 00021277 case 15

loc_21420:
cmp     word ptr ds:0C0EFh, 2
jnz     short loc_2143A
mov     ax, es:[bx+6]
mov     dx, ds:0C139h
mov     es:[bx+8], dx
mov     es:[bx+6], ax
jmp     loc_216C2

loc_2143A:
mov     ax, 3Dh ; '='
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_21730       ; jumptable 00021277 case 15

loc_21448:
mov     ax, [bp+var_6]
cmp     ax, si
jnz     short def_21373 ; jumptable 00021373 default case, cases 14,16,17
les     bx, [bp+arg_6]
mov     al, es:[bx+5]
mov     ah, 0
and     ax, 7
les     bx, [bp+arg_A]
les     bx, es:[bx+2]
mov     dl, es:[bx+5]
mov     dh, 0
and     dx, 7
cmp     ax, dx
jnz     short def_21373 ; jumptable 00021373 default case, cases 14,16,17
mov     dx, word ptr [bp+arg_6+2]
mov     ax, word ptr [bp+arg_6]
les     bx, [bp+arg_A]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
cmp     byte ptr ds:9A63h, 3
jz      short loc_2148B
jmp     loc_216C2

loc_2148B:
cmp     byte ptr es:[bx], 2Ch ; ','
jz      short loc_21494
jmp     loc_216C2

loc_21494:
jmp     loc_21334

loc_21497:              ; jumptable 00021373 cases 12,13
mov     bx, [bp+var_6]
test    byte ptr [bx+6810h], 14h
jz      short def_21373 ; jumptable 00021373 default case, cases 14,16,17
jmp     short loc_214B0 ; jumptable 00021373 case 18

loc_214A3:              ; jumptable 00021373 case 15
mov     ax, 40h ; '@'
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     short def_21373 ; jumptable 00021373 default case, cases 14,16,17

loc_214B0:              ; jumptable 00021373 case 18
call    sub_218CC

def_21373:              ; jumptable 00021373 default case, cases 14,16,17
push    word ptr [bp+arg_A+2]
push    word ptr [bp+arg_A]
call    sub_22692
or      ax, ax
jz      short loc_21530
test    byte ptr [si+6810h], 2
jnz     short loc_21530
mov     bx, [bp+var_6]
test    byte ptr [bx+6810h], 2
jnz     short loc_21530
push    word ptr [bp+arg_6+2]
push    word ptr [bp+arg_6]
call    sub_2A8BF
mov     [bp+var_4], ax
les     bx, [bp+arg_A]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
call    sub_2A8BF
mov     [bp+var_2], ax
mov     ax, [bp+var_4]
cmp     ax, [bp+var_2]
jbe     short loc_214FF
jmp     loc_21730       ; jumptable 00021277 case 15

loc_214FF:
les     bx, [bp+arg_A]
cmp     byte ptr es:[bx], 7
jz      short loc_2150B
jmp     loc_216AA

loc_2150B:
cmp     ax, [bp+var_2]
jb      short loc_21513
jmp     loc_216AA

loc_21513:
les     bx, es:[bx+6]
test    byte ptr es:[bx+9], 40h
jz      short loc_21521
jmp     loc_21730       ; jumptable 00021277 case 15

loc_21521:
les     bx, [bp+arg_A]
les     bx, es:[bx+6]
or      byte ptr es:[bx+9], 8
jmp     loc_216AA

loc_21530:
les     bx, [bp+arg_A]
cmp     byte ptr es:[bx], 2Ch ; ','
jnz     short loc_21550
mov     bx, [bp+var_6]
test    byte ptr [bx+6810h], 14h
jz      short loc_21550
mov     al, byte ptr [bp+var_6]
mov     bx, word ptr [bp+arg_A]
mov     es:[bx+1], al
jmp     loc_21319

loc_21550:
mov     bx, si
shl     bx, 1
mov     ax, [bx+7B78h]
mov     bx, [bp+var_6]
shl     bx, 1
cmp     ax, [bx+7B78h]
jnz     short loc_2157A
les     bx, [bp+arg_A]
les     bx, es:[bx+2]
mov     al, es:[bx+5]
les     bx, [bp+arg_6]
cmp     al, es:[bx+5]
jnz     short loc_2157A
jmp     loc_216AA

loc_2157A:
les     bx, [bp+arg_A]
cmp     byte ptr es:[bx], 2
jz      short loc_21586
jmp     loc_21620

loc_21586:
mov     ax, [bp+var_6]
cmp     ax, 0Ch
jz      short loc_2159A
cmp     ax, 0Dh
jz      short loc_2159A
cmp     ax, 0Eh
jz      short loc_2159A
jmp     short loc_215FF

loc_2159A:
test    byte ptr [si+6810h], 20h
jz      short loc_215B8
les     bx, [bp+arg_A]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
push    ss
lea     ax, [bp+var_10]
push    ax
call    sub_4320A
jmp     short loc_215CD

loc_215B8:
les     bx, [bp+arg_A]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
push    ss
lea     ax, [bp+var_10]
push    ax
call    sub_431DC

loc_215CD:
cmp     [bp+var_6], 0Ch
jnz     short loc_215DF
push    ss
lea     ax, [bp+var_10]
push    ax
call    sub_42D6E
jmp     short loc_215EF

loc_215DF:
cmp     [bp+var_6], 0Dh
jnz     short loc_215EF
push    ss
lea     ax, [bp+var_10]
push    ax
call    sub_42E3D

loc_215EF:
push    ss
lea     ax, [bp+var_10]
push    ax
push    [bp+var_6]
call    sub_29AEA
jmp     loc_21748

loc_215FF:
les     bx, [bp+arg_A]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
push    [bp+var_6]
call    sub_21DC9
les     bx, [bp+arg_A]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
jmp     loc_216AA

loc_21620:
les     bx, [bp+arg_A]
cmp     byte ptr es:[bx], 3
jz      short loc_2162C
jmp     loc_216CB

loc_2162C:
cmp     [bp+var_6], 0Ch
jnz     short loc_21643
mov     dx, word ptr [bp+arg_A+2]
mov     ax, bx
add     ax, 6
push    dx
push    ax
call    sub_42D6E
jmp     short loc_216AA

loc_21643:
cmp     [bp+var_6], 0Dh
jnz     short loc_2165B
mov     dx, word ptr [bp+arg_A+2]
mov     ax, word ptr [bp+arg_A]
add     ax, 6
push    dx
push    ax
call    sub_42E3D
jmp     short loc_216AA

loc_2165B:
cmp     [bp+var_6], 0Eh
jz      short loc_216AA
mov     bx, [bp+var_6]
test    byte ptr [bx+6810h], 20h
jz      short loc_21688
mov     dx, word ptr [bp+arg_A+2]
mov     ax, word ptr [bp+arg_A]
add     ax, 6
push    dx
push    ax
call    sub_431AE
les     bx, [bp+arg_A]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
jmp     short loc_216A3

loc_21688:
mov     dx, word ptr [bp+arg_A+2]
mov     ax, word ptr [bp+arg_A]
add     ax, 6
push    dx
push    ax
call    sub_4317A
les     bx, [bp+arg_A]
mov     es:[bx+8], dx
mov     es:[bx+6], ax

loc_216A3:
les     bx, [bp+arg_A]
mov     byte ptr es:[bx], 2

loc_216AA:
mov     al, byte ptr [bp+var_6]
les     bx, [bp+arg_A]
mov     es:[bx+1], al
mov     dx, word ptr [bp+arg_6+2]
mov     ax, word ptr [bp+arg_6]
mov     es:[bx+4], dx
mov     es:[bx+2], ax

loc_216C2:
mov     dx, word ptr [bp+arg_A+2]
mov     ax, word ptr [bp+arg_A]
jmp     loc_21748

loc_216CB:
cmp     [bp+var_6], 0Ah
jge     short loc_21704
cmp     si, 0Ah
jge     short loc_21704
mov     bx, [bp+var_6]
mov     al, [bx+7B6Ch]
cmp     al, [si+7B6Ch]
jge     short loc_21704
les     bx, [bp+arg_A]
mov     al, es:[bx]
cbw
mov     bx, ax
cmp     byte ptr [bx+4AA1h], 0
jz      short loc_21730 ; jumptable 00021277 case 15
push    word ptr [bp+arg_A+2]
push    word ptr [bp+arg_A]
push    word ptr [bp+arg_6+2]
push    word ptr [bp+arg_6]
call    sub_20DA1
jmp     short loc_21748

loc_21704:
cmp     [bp+var_6], 0Ch
jnz     short loc_21730 ; jumptable 00021277 case 15
cmp     si, 0Dh
jnz     short loc_21730 ; jumptable 00021277 case 15
les     bx, [bp+arg_A]
cmp     byte ptr es:[bx], 35h ; '5'
jnz     short loc_21730 ; jumptable 00021277 case 15
les     bx, es:[bx+6]
cmp     byte ptr es:[bx+1], 0Ch
jnz     short loc_21730 ; jumptable 00021277 case 15
les     bx, [bp+arg_A]
mov     dx, es:[bx+8]
mov     ax, es:[bx+6]
jmp     short loc_21748

loc_21730:              ; jumptable 00021277 case 15
mov     al, 35h ; '5'
push    ax
push    word ptr [bp+arg_6+2]
push    word ptr [bp+arg_6]
push    word ptr [bp+arg_A+2]
push    word ptr [bp+arg_A]
xor     ax, ax
push    ax
push    ax
call    sub_29862

loc_21748:
pop     di
pop     si
mov     sp, bp
pop     bp
retf    0Eh
sub_21215 endp



; Attributes: bp-based frame

sub_21750 proc near

var_4= dword ptr -4
arg_0= dword ptr  4
arg_4= dword ptr  8

push    bp
mov     bp, sp
sub     sp, 4
les     bx, [bp+arg_4]
les     bx, es:[bx+2]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
push    word ptr [bp+var_4+2]
push    bx
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
mov     ax, 3
push    ax
call    sub_21948
or      ax, ax
jnz     short loc_217BD
les     bx, [bp+var_4]
les     bx, es:[bx]
cmp     byte ptr es:[bx+4], 2
jg      short loc_217B2
les     bx, [bp+arg_0]
les     bx, es:[bx]
cmp     byte ptr es:[bx+4], 2
jg      short loc_217B2
push    word ptr [bp+var_4+2]
push    word ptr [bp+var_4]
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_218D8
or      ax, ax
jz      short loc_217B2
mov     ax, 0BEh
push    ax
call    sub_31324
inc     sp
inc     sp
jmp     short loc_217BD

loc_217B2:
mov     ax, 0B0h
push    ax
call    sub_31324
inc     sp
inc     sp

loc_217BD:
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
mov     ax, 1
push    ax
xor     ax, ax
push    ax
push    ax
push    cs
call    near ptr sub_21215
mov     sp, bp
pop     bp
retn    8
sub_21750 endp



; Attributes: bp-based frame

sub_217DB proc near

arg_0= dword ptr  4
arg_4= dword ptr  8

push    bp
mov     bp, sp
push    si
push    di
les     bx, [bp+arg_4]
mov     dx, es:[bx+4]
mov     ax, es:[bx+2]
cmp     dx, word ptr [bp+arg_0+2]
jnz     short loc_217F8
cmp     ax, word ptr [bp+arg_0]
jnz     short loc_217F8
jmp     def_21837       ; jumptable 00021837 default case, cases 10,15-17

loc_217F8:
les     bx, [bp+arg_4]
mov     al, es:[bx+1]
cbw
mov     di, ax
les     bx, [bp+arg_0]
mov     al, es:[bx+4]
cbw
mov     si, ax
mov     ax, si
cmp     ax, 10h
jnz     short loc_21816
jmp     loc_218BF       ; jumptable 00021837 case 18

loc_21816:
cmp     ax, 11h
jnz     short loc_2181E
jmp     loc_218BF       ; jumptable 00021837 case 18

loc_2181E:
cmp     ax, 12h
jnz     short loc_21826
jmp     loc_218BF       ; jumptable 00021837 case 18

loc_21826:
jmp     short $+2

loc_21828:
mov     ax, di
dec     ax              ; switch 18 cases
cmp     ax, 11h
jbe     short loc_21833
jmp     def_21837       ; jumptable 00021837 default case, cases 10,15-17

loc_21833:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_21837[bx] ; switch jump
jpt_21837 dw offset loc_2189B ; jump table for switch statement
dw offset loc_2189B
dw offset loc_2189B
dw offset loc_2189B
dw offset loc_2189B
dw offset loc_2189B
dw offset loc_21860
dw offset loc_2189B
dw offset loc_2189B
dw offset def_21837
dw offset loc_21860
dw offset loc_2189B
dw offset loc_2189B
dw offset loc_2189B
dw offset def_21837
dw offset def_21837
dw offset def_21837
dw offset loc_218BF

loc_21860:              ; jumptable 00021837 cases 7,11
test    byte ptr [si+6810h], 14h
jz      short loc_218BF ; jumptable 00021837 case 18
les     bx, [bp+arg_0]
les     bx, es:[bx]
cmp     byte ptr es:[bx+4], 11h
jnz     short def_21837 ; jumptable 00021837 default case, cases 10,15-17
les     bx, [bp+arg_0]
push    word ptr es:[bx+2]
push    word ptr es:[bx]
les     bx, [bp+arg_4]
les     bx, es:[bx+2]
push    word ptr es:[bx+2]
push    word ptr es:[bx]
mov     ax, 0FFFFh
push    ax
call    sub_2A221
or      ax, ax
jnz     short def_21837 ; jumptable 00021837 default case, cases 10,15-17
jmp     short loc_218BF ; jumptable 00021837 case 18

loc_2189B:              ; jumptable 00021837 cases 1-6,8,9,12-14
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx], 2
jnz     short loc_218B5
mov     ax, es:[bx+6]
or      ax, es:[bx+8]
jnz     short loc_218B5
test    byte ptr [si+6810h], 14h
jnz     short def_21837 ; jumptable 00021837 default case, cases 10,15-17

loc_218B5:
cmp     si, 0Eh
jle     short def_21837 ; jumptable 00021837 default case, cases 10,15-17
cmp     si, 13h
jz      short def_21837 ; jumptable 00021837 default case, cases 10,15-17

loc_218BF:              ; jumptable 00021837 case 18
xor     ax, ax
jmp     short loc_218C6

def_21837:              ; jumptable 00021837 default case, cases 10,15-17
mov     ax, 1

loc_218C6:
pop     di
pop     si
pop     bp
retn    8
sub_217DB endp




sub_218CC proc near
mov     ax, 5Dh ; ']'
push    ax
call    sub_312DE
inc     sp
inc     sp
retn
sub_218CC endp



; Attributes: bp-based frame

sub_218D8 proc near

arg_0= dword ptr  4
arg_4= dword ptr  8

push    bp
mov     bp, sp
push    si
push    di
les     bx, [bp+arg_4]
mov     al, es:[bx+5]
mov     ah, 0
mov     si, ax
and     si, 0Fh
les     bx, [bp+arg_0]
mov     al, es:[bx+5]
mov     ah, 0
mov     di, ax
and     di, 0Fh
cmp     byte ptr es:[bx+4], 0Ah
jnz     short loc_2190E
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx+4], 0Ah
jnz     short loc_21940
jmp     short loc_2193B

loc_2190E:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+4], 0Bh
jnz     short loc_2192D
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx+4], 0Bh
jnz     short loc_2193B
cmp     si, di
jz      short loc_2193B
cmp     si, 6
jz      short loc_21940
jmp     short loc_2193B

loc_2192D:
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx+4], 7
jnz     short loc_21940
cmp     si, di
jnz     short loc_21940

loc_2193B:
mov     ax, 1
jmp     short loc_21942

loc_21940:
xor     ax, ax

loc_21942:
pop     di
pop     si
pop     bp
retn    8
sub_218D8 endp



; Attributes: bp-based frame

sub_21948 proc near

arg_0= word ptr  4
arg_2= dword ptr  6
arg_6= dword ptr  0Ah

push    bp
mov     bp, sp
push    word ptr [bp+arg_6+2]
push    word ptr [bp+arg_6]
push    word ptr [bp+arg_2+2]
push    word ptr [bp+arg_2]
call    sub_218D8
or      ax, ax
jnz     short loc_21962
xor     ax, ax
jmp     short loc_2199D

loc_21962:
les     bx, [bp+arg_6]
les     bx, es:[bx]
cmp     byte ptr es:[bx+4], 0Fh
jz      short loc_2197C
les     bx, [bp+arg_2]
les     bx, es:[bx]
cmp     byte ptr es:[bx+4], 0Fh
jnz     short loc_21981

loc_2197C:
mov     ax, 1
jmp     short loc_2199D

loc_21981:
les     bx, [bp+arg_6]
push    word ptr es:[bx+2]
push    word ptr es:[bx]
les     bx, [bp+arg_2]
push    word ptr es:[bx+2]
push    word ptr es:[bx]
push    [bp+arg_0]
call    sub_2A221

loc_2199D:
pop     bp
retn    0Ah
sub_21948 endp



; Attributes: bp-based frame

sub_219A1 proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
push    si
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jz      short loc_219CD
mov     bx, word ptr [bp+arg_0]
les     bx, es:[bx+2]
push    word ptr es:[bx+2]
push    word ptr es:[bx]
call    sub_2A8BF
mov     si, ax
jmp     short loc_219DF

loc_219CD:
les     bx, [bp+arg_0]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
call    sub_2A8BF
mov     si, ax

loc_219DF:
or      si, si
jnz     short loc_219EE
mov     ax, 5Eh ; '^'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_219EE:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_3B144
push    dx
push    ax
mov     ax, si
xor     dx, dx
push    dx
push    ax
call    sub_29A88
pop     si
pop     bp
retn    4
sub_219A1 endp



; Attributes: bp-based frame

sub_21A0B proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
sub     sp, 4
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_3B144
mov     [bp+var_2], dx
mov     [bp+var_4], ax
mov     al, 0Fh
push    ax
push    dx
push    [bp+var_4]
push    [bp+arg_6]
push    [bp+arg_4]
push    dx
push    [bp+var_4]
xor     ax, ax
push    ax
mov     ax, 6Bh ; 'k'
push    ax
mov     ax, 0A4h
push    ax
push    cs
call    near ptr sub_21215
push    dx
push    ax
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_219A1
push    dx
push    ax
call    sub_29862
mov     [bp+arg_6], dx
mov     [bp+arg_4], ax
mov     sp, bp
pop     bp
retn    8
sub_21A0B endp



; Attributes: bp-based frame

sub_21A60 proc far

arg_0= dword ptr  6
arg_4= dword ptr  0Ah

push    bp
mov     bp, sp
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx+1], 0
jnz     short loc_21A75
mov     dx, word ptr [bp+arg_4+2]
mov     ax, bx
jmp     loc_21B11

loc_21A75:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+1], 0
jnz     short loc_21A82
jmp     loc_21B0B

loc_21A82:
les     bx, [bp+arg_4]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jz      short loc_21AC4
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_21A0B
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
les     bx, [bp+arg_4]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    word ptr [bp+arg_4+2]
push    bx
push    dx
push    ax
call    sub_22671
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
jmp     short loc_21AF3

loc_21AC4:
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_21A0B
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax
les     bx, [bp+arg_0]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    word ptr [bp+arg_0+2]
push    bx
push    dx
push    ax
call    sub_22671
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax

loc_21AF3:
mov     ax, 2Bh ; '+'
push    ax
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
xor     ax, ax
push    ax
push    ax
push    cs
call    near ptr sub_1FF72
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax

loc_21B0B:
mov     dx, word ptr [bp+arg_0+2]
mov     ax, word ptr [bp+arg_0]

loc_21B11:
pop     bp
retf    8
sub_21A60 endp



; Attributes: bp-based frame

sub_21B15 proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
push    si
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     si, ax
mov     bx, si
shl     bx, 1
cmp     word ptr [bx+7BA2h], 0
jz      short loc_21B55
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
mov     bx, si
shl     bx, 1
push    word ptr [bx+7BA2h]
xor     ax, ax
push    ax
call    sub_2A52D
push    dx
push    ax
xor     ax, ax
push    ax
push    ax
push    ax
push    cs
call    near ptr sub_21215
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax

loc_21B55:
mov     dx, word ptr [bp+arg_0+2]
mov     ax, word ptr [bp+arg_0]
pop     si
pop     bp
retn    4
sub_21B15 endp



; Attributes: bp-based frame

sub_21B60 proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
push    si
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     si, ax
cmp     si, 8
jl      short loc_21BAA
cmp     si, 0Fh
jz      short loc_21BAA
mov     bx, si
shl     bx, 1
cmp     word ptr [bx+7BA2h], 0
jz      short loc_21BAA
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
mov     bx, si
shl     bx, 1
push    word ptr [bx+7BA2h]
xor     ax, ax
push    ax
call    sub_2A52D
push    dx
push    ax
xor     ax, ax
push    ax
push    ax
push    ax
push    cs
call    near ptr sub_21215
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax

loc_21BAA:
mov     dx, word ptr [bp+arg_0+2]
mov     ax, word ptr [bp+arg_0]
pop     si
pop     bp
retn    4
sub_21B60 endp



; Attributes: bp-based frame

sub_21BB5 proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 7
jnz     short loc_21BCF
les     bx, es:[bx+6]
mov     al, es:[bx+9]
cbw
and     ax, 40h
jmp     short loc_21BF5

loc_21BCF:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 4
jz      short loc_21BEE
cmp     byte ptr es:[bx], 6
jz      short loc_21BEE
cmp     byte ptr es:[bx], 2Bh ; '+'
jnz     short loc_21BF3
mov     ax, es:[bx+0Ah]
or      ax, es:[bx+0Ch]
jz      short loc_21BF3

loc_21BEE:
mov     ax, 1
jmp     short loc_21BF5

loc_21BF3:
xor     ax, ax

loc_21BF5:
pop     bp
retn    4
sub_21BB5 endp



; Attributes: bp-based frame

sub_21BF9 proc far

var_4= dword ptr -4
arg_0= dword ptr  6

push    bp
mov     bp, sp
sub     sp, 4
les     bx, [bp+arg_0]
mov     al, es:[bx]
cbw
cmp     ax, 8
jnz     short loc_21C0E
jmp     loc_21C8A       ; jumptable 00021C1D cases 1,4,5,7

loc_21C0E:
jg      short loc_21C30
dec     ax              ; switch 7 cases
cmp     ax, 6
jbe     short loc_21C19
jmp     def_21C1D       ; jumptable 00021C1D default case, cases 2,3,6

loc_21C19:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_21C1D[bx] ; switch jump
jpt_21C1D dw offset loc_21C8A ; jump table for switch statement
dw offset def_21C1D
dw offset def_21C1D
dw offset loc_21C8A
dw offset loc_21C8A
dw offset def_21C1D
dw offset loc_21C8A

loc_21C30:
cmp     ax, 2Dh ; '-'
jz      short loc_21C8A ; jumptable 00021C1D cases 1,4,5,7
jg      short loc_21C43
cmp     ax, 9
jz      short loc_21C8A ; jumptable 00021C1D cases 1,4,5,7
cmp     ax, 2Bh ; '+'
jz      short loc_21C8A ; jumptable 00021C1D cases 1,4,5,7
jmp     short def_21C1D ; jumptable 00021C1D default case, cases 2,3,6

loc_21C43:
cmp     ax, 30h ; '0'
jz      short loc_21C4A
jmp     short def_21C1D ; jumptable 00021C1D default case, cases 2,3,6

loc_21C4A:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+1], 12h
jnz     short def_21C1D ; jumptable 00021C1D default case, cases 2,3,6
les     bx, es:[bx+0Ah]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
push    cs
call    near ptr sub_21BF9
or      ax, ax
jz      short loc_21C86
les     bx, [bp+var_4]
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
push    cs
call    near ptr sub_21BF9
or      ax, ax
jz      short loc_21C86
mov     ax, 1
jmp     short loc_21C88

loc_21C86:
xor     ax, ax

loc_21C88:
jmp     short loc_21C9B

loc_21C8A:              ; jumptable 00021C1D cases 1,4,5,7
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+1], 10h
jz      short def_21C1D ; jumptable 00021C1D default case, cases 2,3,6
mov     ax, 1
jmp     short loc_21C9B

def_21C1D:              ; jumptable 00021C1D default case, cases 2,3,6
xor     ax, ax

loc_21C9B:
mov     sp, bp
pop     bp
retf    4
sub_21BF9 endp



; Attributes: bp-based frame

sub_21CA1 proc near

arg_0= word ptr  4
arg_2= dword ptr  6

push    bp
mov     bp, sp
les     bx, [bp+arg_2]
cmp     byte ptr es:[bx], 2
jz      short loc_21CB0
jmp     loc_21DC5

loc_21CB0:
cmp     [bp+arg_0], 8
jl      short loc_21CB9
jmp     loc_21DC5

loc_21CB9:
cmp     [bp+arg_0], 2
jz      short loc_21CCB
cmp     [bp+arg_0], 4
jz      short loc_21CCB
cmp     [bp+arg_0], 6
jnz     short loc_21D36

loc_21CCB:
les     bx, [bp+arg_2]
mov     dx, es:[bx+8]
mov     ax, es:[bx+6]
mov     bx, [bp+arg_0]
dec     bx
shl     bx, 1
shl     bx, 1
shl     bx, 1
add     bx, 73D2h
push    dx
push    ax
mov     ax, ds
mov     es, ax
pop     ax
pop     dx
cmp     dx, es:[bx+2]
jnb     short loc_21CF5
jmp     loc_21D93

loc_21CF5:
jnz     short loc_21CFF
cmp     ax, es:[bx]
jnb     short loc_21CFF
jmp     loc_21D93

loc_21CFF:
les     bx, [bp+arg_2]
mov     dx, es:[bx+8]
mov     ax, es:[bx+6]
mov     bx, [bp+arg_0]
dec     bx
shl     bx, 1
shl     bx, 1
shl     bx, 1
add     bx, 73D2h
push    dx
push    ax
mov     ax, ds
mov     es, ax
pop     ax
pop     dx
cmp     dx, es:[bx+6]
jnb     short loc_21D29
jmp     loc_21DA0

loc_21D29:
ja      short loc_21D34
cmp     ax, es:[bx+4]
ja      short loc_21D34
jmp     loc_21DA0

loc_21D34:
jmp     short loc_21D93

loc_21D36:
les     bx, [bp+arg_2]
mov     dx, es:[bx+8]
mov     ax, es:[bx+6]
mov     bx, [bp+arg_0]
dec     bx
shl     bx, 1
shl     bx, 1
shl     bx, 1
add     bx, 73D2h
push    dx
push    ax
mov     ax, ds
mov     es, ax
pop     ax
pop     dx
cmp     dx, es:[bx+2]
jl      short loc_21D93
jnz     short loc_21D64
cmp     ax, es:[bx]
jb      short loc_21D93

loc_21D64:
les     bx, [bp+arg_2]
mov     dx, es:[bx+8]
mov     ax, es:[bx+6]
mov     bx, [bp+arg_0]
dec     bx
shl     bx, 1
shl     bx, 1
shl     bx, 1
add     bx, 73D2h
push    dx
push    ax
mov     ax, ds
mov     es, ax
pop     ax
pop     dx
cmp     dx, es:[bx+6]
jl      short loc_21DA0
jg      short loc_21D93
cmp     ax, es:[bx+4]
jbe     short loc_21DA0

loc_21D93:
mov     ax, 0A7h
push    ax
call    sub_31324
mov     sp, bp
jmp     short loc_21DC5

loc_21DA0:
les     bx, [bp+arg_2]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
push    [bp+arg_0]
call    sub_21DC9
les     bx, [bp+arg_2]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
mov     al, byte ptr [bp+arg_0]
mov     es:[bx+1], al

loc_21DC5:
pop     bp
retn    6
sub_21CA1 endp



; Attributes: bp-based frame

sub_21DC9 proc far

arg_0= word ptr  6
arg_2= word ptr  8
arg_4= word ptr  0Ah

push    bp
mov     bp, sp
mov     ax, [bp+arg_0]
dec     ax              ; switch 6 cases
cmp     ax, 5
jbe     short loc_21DD8
jmp     def_21DDC       ; jumptable 00021DDC default case

loc_21DD8:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_21DDC[bx] ; switch jump
jpt_21DDC dw offset loc_21DED ; jump table for switch statement
dw offset loc_21E39
dw offset loc_21E50
dw offset loc_21E9B
dw offset loc_21EB1
dw offset loc_21EF9

loc_21DED:              ; jumptable 00021DDC case 1
mov     dx, [bp+arg_4]
mov     ax, [bp+arg_2]
and     ax, ds:73DEh
and     dx, ds:73E0h
mov     [bp+arg_4], dx
mov     [bp+arg_2], ax
mov     dx, ds:73E0h
mov     ax, ds:73DEh
add     ax, 1
adc     dx, 0
sar     dx, 1
rcr     ax, 1
and     ax, [bp+arg_2]
and     dx, [bp+arg_4]
or      dx, ax
jnz     short loc_21E1F
jmp     def_21DDC       ; jumptable 00021DDC default case

loc_21E1F:
mov     dx, ds:73E0h
mov     ax, ds:73DEh
not     ax
not     dx
or      ax, [bp+arg_2]
or      dx, [bp+arg_4]
mov     [bp+arg_4], dx
mov     [bp+arg_2], ax
jmp     def_21DDC       ; jumptable 00021DDC default case

loc_21E39:              ; jumptable 00021DDC case 2
mov     dx, [bp+arg_4]
mov     ax, [bp+arg_2]
and     ax, ds:73DEh
and     dx, ds:73E0h
mov     [bp+arg_4], dx
mov     [bp+arg_2], ax
jmp     def_21DDC       ; jumptable 00021DDC default case

loc_21E50:              ; jumptable 00021DDC case 3
mov     dx, [bp+arg_4]
mov     ax, [bp+arg_2]
and     ax, ds:73EEh
and     dx, ds:73F0h
mov     [bp+arg_4], dx
mov     [bp+arg_2], ax
mov     dx, ds:73F0h
mov     ax, ds:73EEh
add     ax, 1
adc     dx, 0
sar     dx, 1
rcr     ax, 1
and     ax, [bp+arg_2]
and     dx, [bp+arg_4]
or      dx, ax
jnz     short loc_21E82
jmp     def_21DDC       ; jumptable 00021DDC default case

loc_21E82:
mov     dx, ds:73F0h
mov     ax, ds:73EEh
not     ax
not     dx
or      ax, [bp+arg_2]
or      dx, [bp+arg_4]
mov     [bp+arg_4], dx
mov     [bp+arg_2], ax
jmp     short def_21DDC ; jumptable 00021DDC default case

loc_21E9B:              ; jumptable 00021DDC case 4
mov     dx, [bp+arg_4]
mov     ax, [bp+arg_2]
and     ax, ds:73EEh
and     dx, ds:73F0h
mov     [bp+arg_4], dx
mov     [bp+arg_2], ax
jmp     short def_21DDC ; jumptable 00021DDC default case

loc_21EB1:              ; jumptable 00021DDC case 5
mov     dx, [bp+arg_4]
mov     ax, [bp+arg_2]
and     ax, ds:73FEh
and     dx, ds:7400h
mov     [bp+arg_4], dx
mov     [bp+arg_2], ax
mov     dx, ds:7400h
mov     ax, ds:73FEh
add     ax, 1
adc     dx, 0
sar     dx, 1
rcr     ax, 1
and     ax, [bp+arg_2]
and     dx, [bp+arg_4]
or      dx, ax
jz      short def_21DDC ; jumptable 00021DDC default case
mov     dx, ds:7400h
mov     ax, ds:73FEh
not     ax
not     dx
or      ax, [bp+arg_2]
or      dx, [bp+arg_4]
mov     [bp+arg_4], dx
mov     [bp+arg_2], ax
jmp     short def_21DDC ; jumptable 00021DDC default case

loc_21EF9:              ; jumptable 00021DDC case 6
mov     dx, [bp+arg_4]
mov     ax, [bp+arg_2]
and     ax, ds:73FEh
and     dx, ds:7400h
mov     [bp+arg_4], dx
mov     [bp+arg_2], ax

def_21DDC:              ; jumptable 00021DDC default case
mov     dx, [bp+arg_4]
mov     ax, [bp+arg_2]
pop     bp
retf    6
sub_21DC9 endp



; Attributes: bp-based frame

sub_21F17 proc far

var_4= dword ptr -4
arg_0= word ptr  6
arg_2= word ptr  8
arg_4= dword ptr  0Ah

push    bp
mov     bp, sp
sub     sp, 4
cmp     byte ptr ds:9A63h, 3
jnz     short loc_21F37
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_40F27
jmp     short loc_21F94

loc_21F37:
push    [bp+arg_2]
push    [bp+arg_0]
les     bx, [bp+arg_4]
les     bx, es:[bx+2]
les     bx, es:[bx]
push    word ptr es:[bx+0Ah]
push    word ptr es:[bx+8]
xor     ax, ax
push    ax
call    sub_2D569
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
or      ax, dx
jnz     short loc_21F7A
push    [bp+arg_2]
push    [bp+arg_0]
mov     ax, 48h ; 'H'
push    ax
call    sub_312DE
add     sp, 6
call    sub_29811
jmp     short loc_21F94

loc_21F7A:
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
les     bx, [bp+var_4]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
call    sub_21F9A

loc_21F94:
mov     sp, bp
pop     bp
retf    8
sub_21F17 endp



; Attributes: bp-based frame

sub_21F9A proc far

var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  6
arg_2= word ptr  8
arg_4= word ptr  0Ah
arg_6= dword ptr  0Ch

push    bp
mov     bp, sp
sub     sp, 8
push    si
les     bx, [bp+arg_6]
les     bx, es:[bx+2]
mov     [bp+var_6], es
mov     [bp+var_8], bx
mov     al, es:[bx+5]
mov     ah, 0
mov     si, ax
and     si, 0Fh
cmp     si, 6
jnz     short loc_21FC2
mov     si, 5

loc_21FC2:
push    [bp+arg_4]
push    [bp+arg_2]
push    si
call    sub_2A980
mov     [bp+var_6], dx
mov     [bp+var_8], ax
push    word ptr [bp+arg_6+2]
push    word ptr [bp+arg_6]
push    dx
push    ax
mov     ax, 1
push    ax
xor     ax, ax
push    ax
push    ax
push    cs
call    near ptr sub_21215
mov     word ptr [bp+arg_6+2], dx
mov     word ptr [bp+arg_6], ax
cmp     [bp+arg_0], 0
jz      short loc_22032
push    word ptr ds:0BD80h
push    word ptr ds:0BD7Eh
mov     ax, [bp+arg_0]
xor     dx, dx
push    dx
push    ax
call    sub_29A88
mov     [bp+var_2], dx
mov     [bp+var_4], ax
push    [bp+var_6]
push    [bp+var_8]
push    word ptr [bp+arg_6+2]
push    word ptr [bp+arg_6]
push    dx
push    ax
call    sub_22671
mov     word ptr [bp+arg_6+2], dx
mov     word ptr [bp+arg_6], ax
push    dx
push    ax
call    sub_237EA
mov     word ptr [bp+arg_6+2], dx
mov     word ptr [bp+arg_6], ax

loc_22032:
mov     ax, 2Bh ; '+'
push    ax
push    word ptr [bp+arg_6+2]
push    word ptr [bp+arg_6]
xor     ax, ax
push    ax
push    ax
push    cs
call    near ptr sub_1FF72
mov     word ptr [bp+arg_6+2], dx
mov     word ptr [bp+arg_6], ax
les     bx, [bp+arg_6]
cmp     byte ptr es:[bx+1], 14h
jnz     short loc_2207E
mov     bx, ax
les     bx, es:[bx+2]
mov     [bp+var_6], es
mov     [bp+var_8], bx
push    word ptr es:[bx+2]
push    word ptr es:[bx]
push    dx
push    ax
mov     al, es:[bx+0Ch]
push    ax
mov     al, es:[bx+6]
push    ax
call    sub_29A18
mov     word ptr [bp+arg_6+2], dx
mov     word ptr [bp+arg_6], ax

loc_2207E:
mov     dx, word ptr [bp+arg_6+2]
mov     ax, word ptr [bp+arg_6]
pop     si
mov     sp, bp
pop     bp
retf    0Ah
sub_21F9A endp



; Attributes: bp-based frame

sub_2208B proc far

var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= dword ptr -8
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  6
arg_2= word ptr  8
arg_4= dword ptr  0Ah

push    bp
mov     bp, sp
sub     sp, 0Ch
push    si
xor     si, si
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx+1], 0
jnz     short loc_220A1
jmp     loc_2222C

loc_220A1:
les     bx, es:[bx+2]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
mov     al, es:[bx+4]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jnz     short loc_220BC
jmp     loc_2214C

loc_220BC:
mov     bx, word ptr [bp+var_8]
les     bx, es:[bx]
cmp     byte ptr es:[bx+4], 11h
jz      short loc_220CC
jmp     loc_2214C

loc_220CC:
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx], 2Ch ; ','
jnz     short loc_22118
les     bx, es:[bx+6]
cmp     byte ptr es:[bx], 1
jnz     short loc_22118
les     bx, [bp+var_8]
les     bx, es:[bx]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
les     bx, [bp+arg_4]
les     bx, es:[bx+6]
mov     word ptr [bp+arg_4+2], es
mov     word ptr [bp+arg_4], bx
les     bx, es:[bx+6]
les     bx, es:[bx]
mov     [bp+var_A], es
mov     [bp+var_C], bx
les     bx, [bp+arg_4]
les     bx, es:[bx+6]
cmp     byte ptr es:[bx+8], 0Dh
jnz     short loc_2215F
mov     si, 1
jmp     short loc_2215F

loc_22118:
les     bx, [bp+var_8]
les     bx, es:[bx]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
mov     al, 2Bh ; '+'
push    ax
push    word ptr [bp+var_8+2]
push    bx
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
xor     ax, ax
push    ax
push    ax
call    sub_29862
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax
mov     [bp+var_A], 0
mov     [bp+var_C], 0
jmp     short loc_2215F

loc_2214C:
mov     ax, 61h ; 'a'
push    ax
call    sub_312DE
inc     sp
inc     sp
call    sub_29811
jmp     loc_22232

loc_2215F:
les     bx, [bp+var_8]
les     bx, es:[bx+8]
mov     [bp+var_2], es
mov     [bp+var_4], bx
mov     word ptr ds:9A74h, 1
mov     ax, bx
or      ax, [bp+var_2]
jz      short loc_221A2
mov     al, es:[bx+18h]
push    ax
push    word ptr es:[bx+6]
push    word ptr es:[bx+4]
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_20CE7
push    dx
push    ax
push    [bp+var_A]
push    [bp+var_C]
call    sub_2239A
mov     [bp+arg_2], dx
mov     [bp+arg_0], ax
jmp     short loc_22202

loc_221A2:
or      si, si
jnz     short loc_221DF
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_20CE7
mov     [bp+arg_2], dx
mov     [bp+arg_0], ax
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx], 1
jnz     short loc_221D2
push    [bp+var_A]
push    [bp+var_C]
mov     ax, 0BFh
push    ax
call    sub_31324
add     sp, 6
jmp     short loc_22202

loc_221D2:
mov     ax, 0BCh
push    ax
call    sub_31324
inc     sp
inc     sp
jmp     short loc_22202

loc_221DF:
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_237EA
mov     [bp+arg_2], dx
mov     [bp+arg_0], ax
les     bx, [bp+arg_4]
les     bx, es:[bx+6]
push    word ptr es:[bx+0Ah]
push    dx
push    ax
call    sub_3900D

loc_22202:
les     bx, [bp+var_8]
les     bx, es:[bx]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
mov     al, 36h ; '6'
push    ax
push    word ptr [bp+var_8+2]
push    bx
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_29862
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax

loc_2222C:
mov     dx, word ptr [bp+arg_4+2]
mov     ax, word ptr [bp+arg_4]

loc_22232:
pop     si
mov     sp, bp
pop     bp
retf    8
sub_2208B endp



; Attributes: bp-based frame

sub_22239 proc near

var_4= dword ptr -4
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= dword ptr  8
arg_8= dword ptr  0Ch
arg_C= word ptr  10h

push    bp
mov     bp, sp
sub     sp, 4
mov     ax, word ptr [bp+arg_4]
or      ax, word ptr [bp+arg_4+2]
jnz     short loc_2224E
xor     dx, dx
mov     ax, dx
jmp     loc_22394

loc_2224E:
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx], 39h ; '9'
jnz     short loc_222A4
push    [bp+arg_C]
push    word ptr [bp+arg_8+2]
push    word ptr [bp+arg_8]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_22239
les     bx, [bp+arg_4]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
push    [bp+arg_C]
push    word ptr [bp+arg_8+2]
push    word ptr [bp+arg_8]
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_22239
les     bx, [bp+arg_4]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
jmp     loc_2238E

loc_222A4:
les     bx, [bp+arg_8]
les     bx, es:[bx]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
mov     ax, bx
or      ax, word ptr [bp+var_4+2]
jnz     short loc_222BA
jmp     loc_22369

loc_222BA:
mov     dx, es:[bx+6]
mov     ax, es:[bx+4]
les     bx, [bp+arg_8]
mov     es:[bx+2], dx
mov     es:[bx], ax
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
les     bx, [bp+var_4]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
call    sub_217DB
or      ax, ax
jz      short loc_2230C
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
les     bx, [bp+var_4]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
xor     ax, ax
push    ax
mov     ax, 6Bh ; 'k'
push    ax
mov     ax, 0A4h
push    ax
push    cs
call    near ptr sub_21215
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax
jmp     short loc_22363

loc_2230C:
les     bx, [bp+var_4]
mov     ax, es:[bx]
or      ax, es:[bx+2]
jz      short loc_22340
push    [bp+arg_2]
push    [bp+arg_0]
push    word ptr es:[bx+2]
push    word ptr es:[bx]
mov     ax, [bp+arg_0]
or      ax, [bp+arg_2]
jz      short loc_22332
mov     ax, 53h ; 'S'
jmp     short loc_22335

loc_22332:
mov     ax, 55h ; 'U'

loc_22335:
push    ax
call    sub_312DE
add     sp, 0Ah
jmp     short loc_22363

loc_22340:
push    [bp+arg_2]
push    [bp+arg_0]
push    word ptr ds:9A74h
mov     ax, [bp+arg_0]
or      ax, [bp+arg_2]
jz      short loc_22357
mov     ax, 52h ; 'R'
jmp     short loc_2235A

loc_22357:
mov     ax, 54h ; 'T'

loc_2235A:
push    ax
call    sub_312DE
add     sp, 8

loc_22363:
inc     word ptr ds:9A74h
jmp     short loc_2238E

loc_22369:
cmp     byte ptr [bp+arg_C], 0
jnz     short loc_2238E
push    [bp+arg_2]
push    [bp+arg_0]
mov     ax, [bp+arg_0]
or      ax, [bp+arg_2]
jz      short loc_22382
mov     ax, 57h ; 'W'
jmp     short loc_22385

loc_22382:
mov     ax, 56h ; 'V'

loc_22385:
push    ax
call    sub_312DE
add     sp, 6

loc_2238E:
mov     dx, word ptr [bp+arg_4+2]
mov     ax, word ptr [bp+arg_4]

loc_22394:
mov     sp, bp
pop     bp
retn    0Eh
sub_22239 endp



; Attributes: bp-based frame

sub_2239A proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah
arg_8= word ptr  0Ch
arg_A= word ptr  0Eh
arg_C= word ptr  10h

push    bp
mov     bp, sp
push    [bp+arg_C]
push    ss
lea     ax, [bp+arg_8]
push    ax
push    [bp+arg_6]
push    [bp+arg_4]
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_22239
mov     [bp+arg_6], dx
mov     [bp+arg_4], ax
mov     ax, [bp+arg_8]
or      ax, [bp+arg_A]
jz      short loc_223E0
push    [bp+arg_2]
push    [bp+arg_0]
mov     ax, [bp+arg_0]
or      ax, [bp+arg_2]
jz      short loc_223D5
mov     ax, 51h ; 'Q'
jmp     short loc_223D8

loc_223D5:
mov     ax, 50h ; 'P'

loc_223D8:
push    ax
call    sub_312DE
mov     sp, bp

loc_223E0:
mov     dx, [bp+arg_6]
mov     ax, [bp+arg_4]
pop     bp
retn    0Eh
sub_2239A endp

push    bp
mov     bp, sp
les     bx, [bp+4]
cmp     byte ptr es:[bx], 2
jnz     short loc_22405
mov     ax, es:[bx+6]
or      ax, es:[bx+8]
jnz     short loc_22405
mov     ax, 1
jmp     short loc_22407

loc_22405:
xor     ax, ax

loc_22407:
pop     bp
retn    4


; Attributes: bp-based frame

sub_2240B proc far

arg_0= dword ptr  6

push    bp
mov     bp, sp
push    si
cmp     byte ptr ds:9A63h, 3
jz      short loc_2244D
cmp     word ptr ds:0C072h, 0
jnz     short loc_2244D
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_22504
mov     si, ax
mov     ax, si
or      ax, ax
jz      short loc_2244D
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
les     bx, [bp+arg_0]
les     bx, es:[bx+2]
push    word ptr es:[bx+2]
push    word ptr es:[bx]
push    si
call    sub_2A980
push    dx
push    ax
call    sub_22452

loc_2244D:
pop     si
pop     bp
retf    4
sub_2240B endp



; Attributes: bp-based frame

sub_22452 proc near

arg_0= dword ptr  4
arg_4= dword ptr  8

push    bp
mov     bp, sp
mov     ax, word ptr [bp+arg_4]
or      ax, word ptr [bp+arg_4+2]
jnz     short loc_22460
jmp     loc_22500       ; jumptable 000224A1 cases 1-5,7

loc_22460:
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx+1], 0Bh
jz      short loc_2246D
jmp     loc_22500       ; jumptable 000224A1 cases 1-5,7

loc_2246D:
mov     dx, word ptr [bp+arg_0+2]
mov     ax, word ptr [bp+arg_0]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
les     bx, [bp+arg_0]
mov     al, es:[bx+4]
les     bx, [bp+arg_4]
mov     es:[bx+1], al
mov     al, es:[bx]
cbw
cmp     ax, 8
jnz     short loc_22495
jmp     loc_22500       ; jumptable 000224A1 cases 1-5,7

loc_22495:
jg      short loc_224B4
dec     ax              ; switch 7 cases
cmp     ax, 6
ja      short def_224A1 ; jumptable 000224A1 default case, case 6
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_224A1[bx] ; switch jump
jpt_224A1 dw offset loc_22500 ; jump table for switch statement
dw offset loc_22500
dw offset loc_22500
dw offset loc_22500
dw offset loc_22500
dw offset def_224A1
dw offset loc_22500

loc_224B4:
cmp     ax, 2Dh ; '-'
jz      short loc_22500 ; jumptable 000224A1 cases 1-5,7
jg      short loc_224CC
cmp     ax, 9
jz      short loc_22500 ; jumptable 000224A1 cases 1-5,7
cmp     ax, 2Bh ; '+'
jz      short loc_22500 ; jumptable 000224A1 cases 1-5,7
cmp     ax, 2Ch ; ','
jz      short loc_22500 ; jumptable 000224A1 cases 1-5,7
jmp     short def_224A1 ; jumptable 000224A1 default case, case 6

loc_224CC:
cmp     ax, 35h ; '5'
jz      short loc_22500 ; jumptable 000224A1 cases 1-5,7
cmp     ax, 38h ; '8'
jz      short loc_224EC
jmp     short $+2       ; jumptable 000224A1 default case, case 6

def_224A1:              ; jumptable 000224A1 default case, case 6
les     bx, [bp+arg_4]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_22452

loc_224EC:
les     bx, [bp+arg_4]
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_22452

loc_22500:              ; jumptable 000224A1 cases 1-5,7
pop     bp
retn    8
sub_22452 endp



; Attributes: bp-based frame

sub_22504 proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
push    si
mov     ax, word ptr [bp+arg_0]
or      ax, word ptr [bp+arg_0+2]
jnz     short loc_22513
jmp     loc_22642       ; jumptable 00022549 cases 1-5,7-9,23-25,43,45,53-55

loc_22513:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+1], 0Bh
jz      short loc_22520
jmp     loc_22642       ; jumptable 00022549 cases 1-5,7-9,23-25,43,45,53-55

loc_22520:
les     bx, es:[bx+2]
mov     al, es:[bx+5]
mov     ah, 0
and     ax, 7
cmp     ax, 6
jnz     short loc_22535
jmp     loc_22642       ; jumptable 00022549 cases 1-5,7-9,23-25,43,45,53-55

loc_22535:
les     bx, [bp+arg_0]
mov     al, es:[bx]
cbw
dec     ax              ; switch 56 cases
cmp     ax, 37h
jbe     short loc_22545
jmp     def_22549       ; jumptable 00022549 default case, cases 6,10-22,26-42,46-48,50-52

loc_22545:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_22549[bx] ; switch jump
jpt_22549 dw offset loc_22642, offset loc_22642, offset loc_22642 ; jump table for switch statement
dw offset loc_22642, offset loc_22642, offset def_22549
dw offset loc_22642, offset loc_22642, offset loc_22642
dw offset def_22549, offset def_22549, offset def_22549
dw offset def_22549, offset def_22549, offset def_22549
dw offset def_22549, offset def_22549, offset def_22549
dw offset def_22549, offset def_22549, offset def_22549
dw offset def_22549, offset loc_22642, offset loc_22642
dw offset loc_22642, offset def_22549, offset def_22549
dw offset def_22549, offset def_22549, offset def_22549
dw offset def_22549, offset def_22549, offset def_22549
dw offset def_22549, offset def_22549, offset def_22549
dw offset def_22549, offset def_22549, offset def_22549
dw offset def_22549, offset def_22549, offset def_22549
dw offset loc_22642, offset loc_225BE, offset loc_22642
dw offset def_22549, offset def_22549, offset def_22549
dw offset loc_2261C, offset def_22549, offset def_22549
dw offset def_22549, offset loc_22642, offset loc_22642
dw offset loc_22642, offset loc_2265E

loc_225BE:              ; jumptable 00022549 case 44
les     bx, [bp+arg_0]
les     bx, es:[bx+2]
mov     al, es:[bx+5]
mov     ah, 0
and     ax, 0Fh
cmp     ax, 6
jnz     short loc_225D6
jmp     loc_22642       ; jumptable 00022549 cases 1-5,7-9,23-25,43,45,53-55

loc_225D6:
les     bx, [bp+arg_0]
les     bx, es:[bx+6]
cmp     byte ptr es:[bx], 1
jnz     short loc_225FD
les     bx, [bp+arg_0]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
call    sub_39B68
or      ax, ax
jnz     short loc_22642 ; jumptable 00022549 cases 1-5,7-9,23-25,43,45,53-55
mov     ax, 7
jmp     loc_2266C

loc_225FD:
les     bx, [bp+arg_0]
les     bx, es:[bx+6]
cmp     byte ptr es:[bx], 36h ; '6'
jz      short loc_22642 ; jumptable 00022549 cases 1-5,7-9,23-25,43,45,53-55
les     bx, [bp+arg_0]
les     bx, es:[bx+6]
cmp     byte ptr es:[bx], 2Bh ; '+'
jz      short loc_22642 ; jumptable 00022549 cases 1-5,7-9,23-25,43,45,53-55
mov     ax, 3
jmp     short loc_2266C

loc_2261C:              ; jumptable 00022549 case 49
les     bx, [bp+arg_0]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
call    sub_22504
mov     si, ax
or      si, si
jz      short loc_22642 ; jumptable 00022549 cases 1-5,7-9,23-25,43,45,53-55
les     bx, [bp+arg_0]
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
call    sub_22504
cmp     ax, si
jz      short loc_2265A

loc_22642:              ; jumptable 00022549 cases 1-5,7-9,23-25,43,45,53-55
xor     ax, ax
jmp     short loc_2266C

def_22549:              ; jumptable 00022549 default case, cases 6,10-22,26-42,46-48,50-52
les     bx, [bp+arg_0]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
call    sub_22504
mov     si, ax
or      si, si
jz      short loc_2265E ; jumptable 00022549 case 56

loc_2265A:
mov     ax, si
jmp     short loc_2266C

loc_2265E:              ; jumptable 00022549 case 56
les     bx, [bp+arg_0]
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
call    sub_22504

loc_2266C:
pop     si
pop     bp
retn    4
sub_22504 endp



; Attributes: bp-based frame

sub_22671 proc near

arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah
arg_8= word ptr  0Ch
arg_A= word ptr  0Eh

push    bp
mov     bp, sp
mov     al, 0Dh
push    ax
push    [bp+arg_A]
push    [bp+arg_8]
push    [bp+arg_6]
push    [bp+arg_4]
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_29862
pop     bp
retn    0Ch
sub_22671 endp



; Attributes: bp-based frame

sub_22692 proc far

arg_0= dword ptr  6

push    bp
mov     bp, sp
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 5
jz      short loc_226B6
cmp     byte ptr es:[bx], 8
jz      short loc_226B6
cmp     byte ptr es:[bx], 7
jz      short loc_226B6
cmp     byte ptr es:[bx], 1
jz      short loc_226B6
cmp     byte ptr es:[bx], 2Bh ; '+'
jnz     short loc_226BB

loc_226B6:
mov     ax, 1
jmp     short loc_226BD

loc_226BB:
xor     ax, ax

loc_226BD:
pop     bp
retf    4
sub_22692 endp



; Attributes: bp-based frame

sub_226C1 proc near

var_4= dword ptr -4
arg_0= word ptr  4
arg_2= dword ptr  6

push    bp
mov     bp, sp
sub     sp, 4
push    si
mov     si, [bp+arg_0]
les     bx, [bp+arg_2]
les     bx, es:[bx+8]
les     bx, es:[bx+4]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
jmp     short loc_22701

loc_226DE:
les     bx, [bp+var_4]
les     bx, es:[bx+0Ch]
mov     al, es:[bx+5]
mov     ah, 0
test    ax, si
jz      short loc_226F4
mov     ax, 1
jmp     short loc_2270B

loc_226F4:
les     bx, [bp+var_4]
les     bx, es:[bx+4]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx

loc_22701:
mov     ax, word ptr [bp+var_4]
or      ax, word ptr [bp+var_4+2]
jnz     short loc_226DE
xor     ax, ax

loc_2270B:
pop     si
mov     sp, bp
pop     bp
retn    6
sub_226C1 endp

seg004 ends


; Segment type: Pure code
seg005 segment byte public 'CODE' use16
assume cs:seg005
;org 2
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing


; Attributes: bp-based frame

sub_22712 proc near

var_16= word ptr -16h
var_14= word ptr -14h
var_12= dword ptr -12h
var_E= dword ptr -0Eh
var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
sub     sp, 16h
push    si
push    di
mov     si, [bp+arg_0]
mov     ax, ds:0BE1Dh
mov     ds:0BFB4h, ax
call    sub_2AEAA
mov     ax, [bp+arg_2]
or      ax, [bp+arg_4]
jz      short loc_22733
jmp     loc_22D44

loc_22733:
mov     al, ds:0BED2h
mov     ah, 0
cmp     ax, 2Bh ; '+'
jnz     short loc_22740
jmp     loc_228D1

loc_22740:
jg      short loc_2278C
cmp     ax, 19h
jnz     short loc_2274A
jmp     loc_227E4

loc_2274A:
jg      short loc_22771
cmp     ax, 15h
jnz     short loc_22754
jmp     loc_22818

loc_22754:
jg      short loc_22769
cmp     ax, 1
jnz     short loc_2275E
jmp     loc_22A67

loc_2275E:
cmp     ax, 14h
jnz     short loc_22766
jmp     loc_2284C

loc_22766:              ; jumptable 0002279B default case, case 46
jmp     def_2279B

loc_22769:
cmp     ax, 16h
jz      short loc_227B0
jmp     def_2279B       ; jumptable 0002279B default case, case 46

loc_22771:
cmp     ax, 28h ; '('
jnz     short loc_22779
jmp     loc_22869

loc_22779:
cmp     ax, 29h ; ')'
jnz     short loc_22781
jmp     loc_2289D

loc_22781:
cmp     ax, 2Ah ; '*'
jnz     short loc_22789
jmp     loc_22971

loc_22789:              ; jumptable 0002279B default case, case 46
jmp     def_2279B

loc_2278C:              ; switch 8 cases
sub     ax, 2Ch ; ','
cmp     ax, 7
jbe     short loc_22797
jmp     def_2279B       ; jumptable 0002279B default case, case 46

loc_22797:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_2279B[bx] ; switch jump
jpt_2279B dw offset loc_22921 ; jump table for switch statement
dw offset loc_22CC8
dw offset def_2279B
dw offset loc_22B52
dw offset loc_22BD7
dw offset loc_22BFC
dw offset loc_22C14
dw offset loc_22B0B

loc_227B0:
call    sub_26945
xor     ax, ax
push    ax
push    ax
push    si
call    sub_22712
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
or      ax, dx
jnz     short loc_227CA
jmp     loc_22FFE

loc_227CA:
mov     ax, 2Bh ; '+'
push    ax
push    dx
push    word ptr [bp+var_12]
xor     ax, ax
push    ax
push    ax
call    sub_1FF72
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22DBA

loc_227E4:
call    sub_26945
xor     ax, ax
push    ax
push    ax
push    si
call    sub_22712
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
or      ax, dx
jnz     short loc_227FE
jmp     loc_22FFE

loc_227FE:
mov     ax, 2Ch ; ','
push    ax
push    dx
push    word ptr [bp+var_12]
xor     ax, ax
push    ax
push    ax
call    sub_1FF72
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22DBA

loc_22818:
call    sub_26945
xor     ax, ax
push    ax
push    ax
push    si
call    sub_22712
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
or      ax, dx
jnz     short loc_22832
jmp     loc_22FFE

loc_22832:
mov     ax, 28h ; '('
push    ax
push    dx
push    word ptr [bp+var_12]
xor     ax, ax
push    ax
push    ax
call    sub_1FF72
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22DBA

loc_2284C:
call    sub_26945
xor     ax, ax
push    ax
push    ax
push    si
call    sub_22712
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
or      ax, dx
jz      short loc_22866
jmp     loc_22DBA

loc_22866:
jmp     loc_22FFE

loc_22869:
call    sub_26945
xor     ax, ax
push    ax
push    ax
push    si
call    sub_22712
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
or      ax, dx
jnz     short loc_22883
jmp     loc_22FFE

loc_22883:
mov     ax, 2Ah ; '*'
push    ax
push    dx
push    word ptr [bp+var_12]
xor     ax, ax
push    ax
push    ax
call    sub_1FF72
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22DBA

loc_2289D:
call    sub_26945
xor     ax, ax
push    ax
push    ax
push    si
call    sub_22712
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
or      ax, dx
jnz     short loc_228B7
jmp     loc_22FFE

loc_228B7:
mov     ax, 29h ; ')'
push    ax
push    dx
push    word ptr [bp+var_12]
xor     ax, ax
push    ax
push    ax
call    sub_1FF72
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22DBA

loc_228D1:
call    sub_26945
xor     ax, ax
push    ax
push    ax
push    si
call    sub_22712
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
or      ax, dx
jnz     short loc_228EB
jmp     loc_22FFE

loc_228EB:
push    word ptr ds:0BD80h
push    word ptr ds:0BD7Eh
xor     dx, dx
mov     ax, 1
push    dx
push    ax
call    sub_29A88
mov     word ptr [bp+var_E+2], dx
mov     word ptr [bp+var_E], ax
mov     ax, 18h
push    ax
push    word ptr [bp+var_12+2]
push    word ptr [bp+var_12]
push    dx
push    word ptr [bp+var_E]
call    sub_1FF72
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22DBA

loc_22921:              ; jumptable 0002279B case 44
call    sub_26945
xor     ax, ax
push    ax
push    ax
push    si
call    sub_22712
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
or      ax, dx
jnz     short loc_2293B
jmp     loc_22FFE

loc_2293B:
push    word ptr ds:0BD80h
push    word ptr ds:0BD7Eh
xor     dx, dx
mov     ax, 1
push    dx
push    ax
call    sub_29A88
mov     word ptr [bp+var_E+2], dx
mov     word ptr [bp+var_E], ax
mov     ax, 19h
push    ax
push    word ptr [bp+var_12+2]
push    word ptr [bp+var_12]
push    dx
push    word ptr [bp+var_E]
call    sub_1FF72
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22DBA

loc_22971:
call    sub_26945
cmp     al, 1
jnz     short loc_229C9
call    sub_26945
mov     ah, 0
push    ax
call    sub_286AA
or      ax, ax
jz      short loc_229A0
call    sub_232DC
mov     [bp+var_2], dx
mov     [bp+var_4], ax
or      ax, dx
jnz     short loc_2299D
jmp     loc_22FFE

loc_2299D:
jmp     loc_22A20

loc_229A0:
xor     ax, ax
push    ax
push    ax
push    ax
push    ax
push    ax
push    ax
call    sub_2307D
mov     word ptr [bp+var_E+2], dx
mov     word ptr [bp+var_E], ax
or      ax, dx
jnz     short loc_229B8
jmp     loc_22FFE

loc_229B8:
cmp     byte ptr ds:0BED2h, 2
jz      short loc_229C2
jmp     def_2279B       ; jumptable 0002279B default case, case 46

loc_229C2:
call    sub_26945
jmp     short loc_229DE

loc_229C9:
xor     ax, ax
push    ax
push    ax
push    ax
call    sub_22712
mov     word ptr [bp+var_E+2], dx
mov     word ptr [bp+var_E], ax
or      ax, dx
jnz     short loc_229DE
jmp     loc_22FFE

loc_229DE:
les     bx, [bp+var_E]
cmp     byte ptr es:[bx], 2Ch ; ','
jnz     short loc_22A13
les     bx, es:[bx+6]
cmp     byte ptr es:[bx+1], 10h
jz      short loc_22A00
les     bx, [bp+var_E]
les     bx, es:[bx+6]
cmp     byte ptr es:[bx+1], 11h
jnz     short loc_22A13

loc_22A00:
les     bx, [bp+var_E]
les     bx, es:[bx+6]
les     bx, es:[bx+2]
mov     [bp+var_2], es
mov     [bp+var_4], bx
jmp     short loc_22A20

loc_22A13:
les     bx, [bp+var_E]
les     bx, es:[bx+2]
mov     [bp+var_2], es
mov     [bp+var_4], bx

loc_22A20:
push    [bp+var_2]
push    [bp+var_4]
call    sub_2A8BF
xor     dx, dx
mov     ds:0BEDAh, dx
mov     ds:0BED8h, ax
or      ax, dx
jnz     short loc_22A43
mov     ax, 40h ; '@'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_22A43:
mov     ax, 6
push    ax
xor     ax, ax
push    ax
call    sub_2A52D
push    dx
push    ax
push    word ptr ds:0BEDAh
push    word ptr ds:0BED8h
call    sub_29A88
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22DBA

loc_22A67:
call    sub_26945
mov     ah, 0
push    ax
call    sub_286AA
or      ax, ax
jz      short loc_22AE3
call    sub_232DC
mov     [bp+var_2], dx
mov     [bp+var_4], ax
or      ax, dx
jnz     short loc_22A8A
jmp     loc_22FFE

loc_22A8A:
cmp     byte ptr ds:9A63h, 3
jnz     short loc_22AAE
cmp     byte ptr ds:0BED2h, 2Fh ; '/'
jnz     short loc_22AAE
push    dx
push    [bp+var_4]
call    sub_40B5A
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
or      ax, dx
jz      short loc_22AAE
jmp     loc_22D2E

loc_22AAE:
xor     ax, ax
push    ax
push    ax
push    si
call    sub_22712
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
or      ax, dx
jnz     short loc_22AC3
jmp     loc_22FFE

loc_22AC3:
push    dx
push    word ptr [bp+var_12]
push    [bp+var_2]
push    [bp+var_4]
mov     ax, 1
push    ax
xor     ax, ax
push    ax
push    ax
call    sub_21215
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22DBA

loc_22AE3:
xor     ax, ax
push    ax
push    ax
push    ax
push    ax
push    ax
mov     ax, 1
push    ax
call    sub_2307D
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
or      ax, dx
jnz     short loc_22AFE
jmp     loc_22FFE

loc_22AFE:
cmp     byte ptr ds:0BED2h, 2
jnz     short loc_22B08
jmp     loc_22D2E

loc_22B08:              ; jumptable 0002279B default case, case 46
jmp     def_2279B

loc_22B0B:              ; jumptable 0002279B case 51
mov     ax, ds:9A70h
or      ax, ds:9A72h
jnz     short loc_22B1F
mov     ax, 65h ; 'e'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_22B1F:
mov     al, 9
push    ax
push    word ptr ds:0BD80h
push    word ptr ds:0BD7Eh
xor     ax, ax
push    ax
call    sub_298D7
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
mov     ax, 2Ch ; ','
push    ax
push    dx
push    word ptr [bp+var_12]
xor     ax, ax
push    ax
push    ax
call    sub_1FF72
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22D2E

loc_22B52:              ; jumptable 0002279B case 47
les     bx, ds:0BED8h
mov     [bp+var_6], es
mov     [bp+var_8], bx
call    sub_26945
cmp     al, 1
jnz     short loc_22BC3
cmp     byte ptr ds:9A63h, 3
jz      short loc_22BC3
push    [bp+var_6]
push    [bp+var_8]
call    sub_1F0E2
or      dx, ax
jnz     short loc_22BC3
cmp     byte ptr ds:0BEC3h, 0
jnz     short loc_22B94
push    [bp+var_6]
push    [bp+var_8]
mov     ax, 0BDh
push    ax
call    sub_31324
add     sp, 6

loc_22B94:
xor     di, di
cmp     byte ptr ds:22C5h, 0
jz      short loc_22BA0
mov     di, 80h

loc_22BA0:
cmp     byte ptr ds:0BE1Ah, 0
jz      short loc_22BAB
or      di, 100h

loc_22BAB:
push    [bp+var_6]
push    [bp+var_8]
mov     ax, 2
push    ax
push    word ptr ds:0BD88h
push    word ptr ds:0BD86h
push    di
call    sub_1F1E6

loc_22BC3:
push    [bp+var_6]
push    [bp+var_8]
call    sub_1FCC5
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22DBA

loc_22BD7:              ; jumptable 0002279B case 48
mov     al, ds:0BED3h
cbw
push    ax
xor     ax, ax
push    ax
call    sub_2A52D
push    dx
push    ax
push    word ptr ds:0BEDAh
push    word ptr ds:0BED8h
call    sub_29A88
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22D2E

loc_22BFC:              ; jumptable 0002279B case 49
push    ds
mov     ax, 0BED8h
push    ax
mov     al, ds:0BED3h
cbw
push    ax
call    sub_29AEA
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22D2E

loc_22C14:              ; jumptable 0002279B case 50
cmp     byte ptr ds:9A63h, 3
jnz     short loc_22C26
mov     ax, 3Bh ; ';'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_22C26:
call    dword ptr ds:0C044h
mov     di, ds:0BDCBh
mov     [bp+var_A], 0

loc_22C33:
push    si
call    sub_27C88
mov     ax, ds:0BED8h
add     [bp+var_A], ax
call    sub_26945
cmp     al, 32h ; '2'
jz      short loc_22C33
or      si, si
jz      short loc_22C54
xor     ax, ax
push    ax
call    sub_3B175

loc_22C54:
cmp     byte ptr ds:22C8h, 0
jz      short loc_22C63
push    di
call    sub_31435
mov     di, ax

loc_22C63:
call    dword ptr ds:0C048h
mov     ax, [bp+var_A]
inc     ax
push    ax
push    word ptr ds:0BD84h
push    word ptr ds:0BD82h
xor     ax, ax
push    ax
call    sub_2A549
mov     [bp+var_2], dx
mov     [bp+var_4], ax
push    dx
push    ax
push    ds
mov     ax, 67EBh
push    ax
call    sub_299B0
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
les     bx, [bp+var_12]
mov     es:[bx+0Ah], di
mov     al, 2Ch ; ','
push    ax
push    word ptr ds:0BD84h
push    word ptr ds:0BD82h
xor     ax, ax
push    ax
call    sub_2A771
push    dx
push    ax
push    word ptr [bp+var_12+2]
push    word ptr [bp+var_12]
xor     ax, ax
push    ax
push    ax
call    sub_29862
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22DBA

loc_22CC8:              ; jumptable 0002279B case 45
cmp     byte ptr ds:9A63h, 3
jnz     short def_2279B ; jumptable 0002279B default case, case 46
call    sub_26945
cmp     al, 2Fh ; '/'
jz      short loc_22CE3
mov     ax, 3Bh ; ';'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_22CE3:
les     bx, ds:0BED8h
mov     [bp+var_14], es
mov     [bp+var_16], bx
call    sub_26945
cmp     al, 2Dh ; '-'
jz      short loc_22D01
mov     ax, 3Bh ; ';'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_22D01:
call    sub_26945
cmp     al, 2Fh ; '/'
jz      short loc_22D15
mov     ax, 3Bh ; ';'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_22D15:
push    [bp+var_14]
push    [bp+var_16]
push    word ptr ds:0BEDAh
push    word ptr ds:0BED8h
call    sub_40927
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax

loc_22D2E:
call    sub_26945
jmp     loc_22DBA

def_2279B:              ; jumptable 0002279B default case, case 46
mov     ax, 3Bh ; ';'
push    ax
call    sub_28E99
inc     sp
inc     sp
jmp     loc_22FFE

loc_22D44:
cmp     byte ptr ds:0BED2h, 1
jnz     short loc_22DA9
cmp     byte ptr ds:9A63h, 3
jz      short loc_22DA9
push    [bp+arg_4]
push    [bp+arg_2]
call    sub_1F0E2
or      dx, ax
jnz     short loc_22DA9
cmp     byte ptr ds:0BEC3h, 0
jnz     short loc_22D7A
push    [bp+arg_4]
push    [bp+arg_2]
mov     ax, 0BDh
push    ax
call    sub_31324
add     sp, 6

loc_22D7A:
xor     di, di
cmp     byte ptr ds:22C5h, 0
jz      short loc_22D86
mov     di, 80h

loc_22D86:
cmp     byte ptr ds:0BE1Ah, 0
jz      short loc_22D91
or      di, 100h

loc_22D91:
push    [bp+arg_4]
push    [bp+arg_2]
mov     ax, 2
push    ax
push    word ptr ds:0BD88h
push    word ptr ds:0BD86h
push    di
call    sub_1F1E6

loc_22DA9:
push    [bp+arg_4]
push    [bp+arg_2]
call    sub_1FCC5
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax

loc_22DBA:
mov     al, ds:0BED2h
mov     ah, 0
cmp     ax, 2Ch ; ','
jz      short loc_22E0A
jg      short loc_22DDB
cmp     ax, 1
jnz     short loc_22DCE
jmp     loc_22E75

loc_22DCE:
cmp     ax, 3
jz      short loc_22E26
cmp     ax, 2Bh ; '+'
jz      short loc_22DEE
jmp     loc_23054

loc_22DDB:
cmp     ax, 2Dh ; '-'
jnz     short loc_22DE3
jmp     loc_22EF6

loc_22DE3:
cmp     ax, 2Eh ; '.'
jnz     short loc_22DEB
jmp     loc_22FEA

loc_22DEB:
jmp     loc_23054

loc_22DEE:
mov     ax, 2Eh ; '.'
push    ax
push    word ptr [bp+var_12+2]
push    word ptr [bp+var_12]
xor     ax, ax
push    ax
push    ax
call    sub_1FF72
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22D2E

loc_22E0A:
mov     ax, 2Fh ; '/'
push    ax
push    word ptr [bp+var_12+2]
push    word ptr [bp+var_12]
xor     ax, ax
push    ax
push    ax
call    sub_1FF72
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22D2E

loc_22E26:
call    sub_26945
xor     ax, ax
push    ax
push    ax
push    ax
push    ax
push    ax
mov     ax, 1
push    ax
call    sub_2307D
mov     word ptr [bp+var_E+2], dx
mov     word ptr [bp+var_E], ax
or      ax, dx
jnz     short loc_22E46
jmp     loc_22FFE

loc_22E46:
cmp     byte ptr ds:0BED2h, 4
jz      short loc_22E5B
mov     ax, 71h ; 'q'
push    ax
call    sub_28E99
inc     sp
inc     sp
jmp     loc_22FFE

loc_22E5B:
push    word ptr [bp+var_12+2]
push    word ptr [bp+var_12]
push    word ptr [bp+var_E+2]
push    word ptr [bp+var_E]
call    sub_21A60
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22D2E

loc_22E75:
cmp     byte ptr ds:9A63h, 3
jnz     short loc_22E87
mov     ax, 3Bh ; ';'
push    ax
call    sub_3129B
inc     sp
inc     sp

loc_22E87:
call    sub_26945
cmp     al, 2
jnz     short loc_22E9C
mov     word ptr [bp+var_E+2], 0
mov     word ptr [bp+var_E], 0
jmp     short loc_22ED1

loc_22E9C:
xor     ax, ax
push    ax
push    ax
push    ax
mov     ax, 1
push    ax
xor     ax, ax
push    ax
mov     ax, 1
push    ax
call    sub_2307D
mov     word ptr [bp+var_E+2], dx
mov     word ptr [bp+var_E], ax
or      ax, dx
jnz     short loc_22EBC
jmp     loc_22FFE

loc_22EBC:
cmp     byte ptr ds:0BED2h, 2
jz      short loc_22ED1
mov     ax, 72h ; 'r'
push    ax
call    sub_28E99
inc     sp
inc     sp
jmp     loc_22FFE

loc_22ED1:
mov     ax, ds:0BE1Dh
mov     ds:0BFB4h, ax
call    sub_2AEAA
push    word ptr [bp+var_12+2]
push    word ptr [bp+var_12]
push    word ptr [bp+var_E+2]
push    word ptr [bp+var_E]
call    sub_2208B
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22D2E

loc_22EF6:
call    sub_26945
cmp     al, 2Fh ; '/'
jz      short loc_22F0D
mov     ax, 73h ; 's'
push    ax
call    sub_28E99
inc     sp
inc     sp
jmp     loc_22FFE

loc_22F0D:
mov     ax, ds:0BE1Dh
mov     ds:0BFB4h, ax
call    sub_2AEAA
les     bx, [bp+var_12]
cmp     byte ptr es:[bx+1], 0
jnz     short loc_22F25
jmp     loc_22D2E

loc_22F25:
cmp     byte ptr es:[bx+1], 12h
jz      short loc_22F80
cmp     byte ptr ds:9A63h, 3
jnz     short loc_22F72
cmp     byte ptr es:[bx], 2Ch ; ','
jnz     short loc_22F72
les     bx, es:[bx+6]
cmp     byte ptr es:[bx], 1
jnz     short loc_22F72
les     bx, [bp+var_12]
les     bx, es:[bx+6]
cmp     byte ptr es:[bx+1], 11h
jnz     short loc_22F72
les     bx, [bp+var_12]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
push    word ptr ds:0BEDAh
push    word ptr ds:0BED8h
call    sub_40C7A
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22D2E

loc_22F72:
mov     ax, 4Ch ; 'L'
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_23046

loc_22F80:
les     bx, [bp+var_12]
cmp     byte ptr es:[bx], 36h ; '6'
jnz     short loc_22FB5
mov     al, 2Ch ; ','
push    ax
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
xor     ax, ax
push    ax
call    sub_2A980
push    dx
push    ax
push    word ptr [bp+var_12+2]
push    word ptr [bp+var_12]
xor     ax, ax
push    ax
push    ax
call    sub_29862
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     short loc_22FCE

loc_22FB5:
mov     ax, 2Ch ; ','
push    ax
push    word ptr [bp+var_12+2]
push    word ptr [bp+var_12]
xor     ax, ax
push    ax
push    ax
call    sub_1FF72
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax

loc_22FCE:
push    word ptr [bp+var_12+2]
push    word ptr [bp+var_12]
push    word ptr ds:0BEDAh
push    word ptr ds:0BED8h
call    sub_21F17
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22D2E

loc_22FEA:
call    sub_26945
cmp     al, 2Fh ; '/'
jz      short loc_23004
mov     ax, 74h ; 't'
push    ax
call    sub_28E99
inc     sp
inc     sp

loc_22FFE:
xor     dx, dx
mov     ax, dx
jmp     short loc_2305A

loc_23004:
mov     ax, ds:0BE1Dh
mov     ds:0BFB4h, ax
call    sub_2AEAA
les     bx, [bp+var_12]
cmp     byte ptr es:[bx+1], 0
jnz     short loc_2301C
jmp     loc_22D2E

loc_2301C:
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jz      short loc_2303B
mov     bx, word ptr [bp+var_12]
les     bx, es:[bx+2]
les     bx, es:[bx]
cmp     byte ptr es:[bx+4], 12h
jz      short loc_22FCE

loc_2303B:
mov     ax, 4Fh ; 'O'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_23046:
call    sub_29811
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     loc_22D2E

loc_23054:
mov     dx, word ptr [bp+var_12+2]
mov     ax, word ptr [bp+var_12]

loc_2305A:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    6
sub_22712 endp



; Attributes: bp-based frame

sub_23062 proc far

arg_0= word ptr  6
arg_2= word ptr  8
arg_4= word ptr  0Ah

push    bp
mov     bp, sp
xor     ax, ax
push    ax
push    [bp+arg_4]
push    [bp+arg_2]
push    [bp+arg_0]
push    ax
mov     ax, 1
push    ax
call    sub_2307D
pop     bp
retf    6
sub_23062 endp



; Attributes: bp-based frame

sub_2307D proc near

var_14= word ptr -14h
var_12= word ptr -12h
var_10= dword ptr -10h
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

push    bp
mov     bp, sp
sub     sp, 14h
push    si
push    di
mov     di, [bp+arg_A]
mov     ax, sp
mov     dx, ds
mov     bx, 0C4CCh
mov     cx, ds
cmp     ax, bx
jnb     short loc_230A0
mov     ax, 6
push    ax
call    sub_3129B
inc     sp
inc     sp

loc_230A0:
push    [bp+arg_8]
push    [bp+arg_6]
push    [bp+arg_0]
call    sub_22712
mov     [bp+var_12], dx
mov     [bp+var_14], ax
or      ax, dx
jnz     short loc_230B9
jmp     loc_23247

loc_230B9:
mov     al, [di+4B76h]
cbw
mov     [bp+var_8], ax

loc_230C1:
cmp     byte ptr ds:0BED2h, 27h ; '''
jbe     short loc_230CB
jmp     loc_232CE

loc_230CB:
cmp     [bp+arg_4], 4
jnz     short loc_230DB
cmp     byte ptr ds:0BED2h, 68h ; 'h'
jnz     short loc_230DB
jmp     loc_232CE

loc_230DB:
cmp     [bp+arg_4], 2
jnz     short loc_230EB
cmp     byte ptr ds:0BED2h, 8
jnz     short loc_230EB
jmp     loc_232CE

loc_230EB:
cmp     [bp+arg_4], 3
jnz     short loc_230FB
cmp     byte ptr ds:0BED2h, 1Fh
jnz     short loc_230FB
jmp     loc_232CE

loc_230FB:
mov     al, ds:0BED2h
mov     ah, 0
mov     bx, ax
mov     al, [bx+4B26h]
cbw
mov     si, ax
or      si, si
jnz     short loc_23110
jmp     loc_232CE

loc_23110:
mov     al, ds:0BED2h
mov     ah, 0
mov     bx, ax
mov     al, [bx+4B4Eh]
cbw
mov     [bp+var_2], ax
mov     ax, ds:0BE1Dh
mov     [bp+var_6], ax
mov     ds:0BFB4h, ax
call    sub_2AEAA
mov     ax, ds:0BFB6h
mov     [bp+var_4], ax
mov     ax, [bp+var_2]
cmp     ax, [bp+arg_2]
jz      short loc_2316E
cmp     di, 7
jl      short loc_2316E
cmp     si, 7
jl      short loc_2316E
cmp     di, 0Ch
jg      short loc_2314F
cmp     si, 0Ch
jle     short loc_23163

loc_2314F:
cmp     di, 0Dh
jnz     short loc_23159
cmp     si, 0Ch
jz      short loc_23163

loc_23159:
cmp     di, 0Ch
jnz     short loc_2316E
cmp     si, 0Dh
jnz     short loc_2316E

loc_23163:
mov     ax, 0B5h
push    ax
call    sub_31324
inc     sp
inc     sp

loc_2316E:
cmp     di, si
jle     short loc_23175
jmp     loc_232CE

loc_23175:
cmp     di, si
jnz     short loc_23182
cmp     [bp+var_8], 1
jnz     short loc_23182
jmp     loc_232CE

loc_23182:
cmp     [bp+var_2], 30h ; '0'
jz      short loc_2318B
jmp     loc_23227

loc_2318B:
call    sub_26945
xor     ax, ax
push    ax
push    ax
push    ax
mov     ax, 3
push    ax
xor     ax, ax
push    ax
push    [bp+arg_0]
call    sub_2307D
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
or      ax, dx
jnz     short loc_231AF
jmp     loc_23247

loc_231AF:
cmp     byte ptr ds:0BED2h, 1Fh
jz      short loc_231C4
mov     ax, 3Bh ; ';'
push    ax
call    sub_28E99
inc     sp
inc     sp
jmp     loc_23247

loc_231C4:
call    sub_26945
mov     al, ds:4B44h
cbw
push    ax
xor     ax, ax
push    ax
push    ax
push    [bp+arg_4]
push    ax
push    [bp+arg_0]
call    sub_2307D
mov     [bp+var_A], dx
mov     [bp+var_C], ax
or      ax, dx
jz      short loc_23247
mov     ax, [bp+var_6]
mov     ds:0BFB4h, ax
mov     ax, [bp+var_4]
mov     ds:0BFB6h, ax
mov     ax, 31h ; '1'
push    ax
push    word ptr [bp+var_10+2]
push    word ptr [bp+var_10]
push    dx
push    [bp+var_C]
call    sub_1FF72
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
mov     ax, 30h ; '0'
push    ax
push    [bp+var_12]
push    [bp+var_14]
push    dx
push    word ptr [bp+var_10]
call    sub_1FF72
mov     [bp+var_12], dx
mov     [bp+var_14], ax
jmp     loc_230C1

loc_23227:
call    sub_26945
push    si
xor     ax, ax
push    ax
push    ax
push    [bp+arg_4]
push    [bp+var_2]
push    [bp+arg_0]
call    sub_2307D
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
or      ax, dx
jnz     short loc_2324E

loc_23247:
xor     dx, dx
mov     ax, dx
jmp     loc_232D4

loc_2324E:
mov     ax, [bp+var_6]
mov     ds:0BFB4h, ax
mov     ax, [bp+var_4]
mov     ds:0BFB6h, ax
cmp     [bp+var_2], 38h ; '8'
jnz     short loc_232B1
cmp     [bp+arg_4], 1
jnz     short loc_2328B
mov     al, 39h ; '9'
push    ax
push    word ptr ds:0BD80h
push    word ptr ds:0BD7Eh
push    [bp+var_12]
push    [bp+var_14]
push    word ptr [bp+var_10+2]
push    word ptr [bp+var_10]
call    sub_29862
mov     [bp+var_12], dx
mov     [bp+var_14], ax
jmp     loc_230C1

loc_2328B:
mov     al, 38h ; '8'
push    ax
les     bx, [bp+var_10]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    [bp+var_12]
push    [bp+var_14]
push    word ptr [bp+var_10+2]
push    bx
call    sub_29862
mov     [bp+var_12], dx
mov     [bp+var_14], ax
jmp     loc_230C1

loc_232B1:
push    [bp+var_2]
push    [bp+var_12]
push    [bp+var_14]
push    word ptr [bp+var_10+2]
push    word ptr [bp+var_10]
call    sub_1FF72
mov     [bp+var_12], dx
mov     [bp+var_14], ax
jmp     loc_230C1

loc_232CE:
mov     dx, [bp+var_12]
mov     ax, [bp+var_14]

loc_232D4:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    0Ch
sub_2307D endp



; Attributes: bp-based frame

sub_232DC proc far

var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 8
call    sub_286D6
mov     [bp+var_6], dx
mov     [bp+var_8], ax
cmp     word ptr ds:0BF51h, 0
jz      short loc_232FF
mov     ax, 8Ch
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_232FF:
mov     ax, [bp+var_8]
or      ax, [bp+var_6]
jz      short loc_23328
call    sub_26025
mov     [bp+var_2], dx
mov     [bp+var_4], ax
or      ax, dx
jz      short loc_23328
cmp     byte ptr ds:0BED2h, 2
jz      short loc_2332E
mov     ax, 3Bh ; ';'
push    ax
call    sub_28E99
inc     sp
inc     sp

loc_23328:
xor     dx, dx
mov     ax, dx
jmp     short loc_23344

loc_2332E:
call    sub_26945
push    [bp+var_2]
push    [bp+var_4]
push    [bp+var_6]
push    [bp+var_8]
call    sub_2677A

loc_23344:
mov     sp, bp
pop     bp
retf
sub_232DC endp



; Attributes: bp-based frame

sub_23348 proc far

var_4= dword ptr -4
arg_0= word ptr  6

push    bp
mov     bp, sp
sub     sp, 4
mov     ax, [bp+arg_0]
dec     ax              ; switch 5 cases
cmp     ax, 4
jbe     short loc_2335A
jmp     def_2335E       ; jumptable 0002335E default case

loc_2335A:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_2335E[bx] ; switch jump
jpt_2335E dw offset loc_2336D ; jump table for switch statement
dw offset loc_2339E
dw offset loc_2345E
dw offset loc_233D9
dw offset loc_23413

loc_2336D:              ; jumptable 0002335E case 1
xor     ax, ax
push    ax
push    ax
push    ax
push    ax
push    ax
mov     ax, 1
push    ax
call    sub_2307D
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
cmp     byte ptr ds:0BED2h, 4
jz      short loc_23396
mov     ax, 76h ; 'v'
push    ax
call    sub_28E99
inc     sp
inc     sp
jmp     loc_23459

loc_23396:
call    sub_26945
jmp     def_2335E       ; jumptable 0002335E default case

loc_2339E:              ; jumptable 0002335E case 2
xor     ax, ax
push    ax
push    ax
push    ax
mov     ax, 2
push    ax
xor     ax, ax
push    ax
mov     ax, 1
push    ax
call    sub_2307D
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
cmp     byte ptr ds:0BED2h, 8
jnz     short loc_233C1
jmp     def_2335E       ; jumptable 0002335E default case

loc_233C1:
cmp     byte ptr ds:0BED2h, 7
jnz     short loc_233CB
jmp     def_2335E       ; jumptable 0002335E default case

loc_233CB:
mov     ax, 77h ; 'w'
push    ax
call    sub_28E99
inc     sp
inc     sp
jmp     loc_23459

loc_233D9:              ; jumptable 0002335E case 4
xor     ax, ax
push    ax
push    ax
push    ax
mov     ax, 2
push    ax
xor     ax, ax
push    ax
mov     ax, 1
push    ax
call    sub_2307D
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
cmp     byte ptr ds:0BED2h, 8
jnz     short loc_233FC
jmp     def_2335E       ; jumptable 0002335E default case

loc_233FC:
cmp     byte ptr ds:0BED2h, 6
jnz     short loc_23406
jmp     def_2335E       ; jumptable 0002335E default case

loc_23406:
mov     ax, 60h ; '`'
push    ax
call    sub_28E99
inc     sp
inc     sp
jmp     short loc_23459

loc_23413:              ; jumptable 0002335E case 5
mov     byte ptr ds:0BDB7h, 1
call    sub_26945
xor     ax, ax
push    ax
push    ax
push    ax
mov     ax, 4
push    ax
xor     ax, ax
push    ax
mov     ax, 1
push    ax
call    sub_2307D
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
mov     byte ptr ds:0BDB7h, 0
cmp     byte ptr ds:0BED2h, 68h ; 'h'
jz      short def_2335E ; jumptable 0002335E default case
mov     ax, 3Bh ; ';'
push    ax
call    sub_312DE
inc     sp
inc     sp
mov     word ptr ds:0BEDAh, 0
mov     word ptr ds:0BED8h, 0

loc_23459:
xor     ax, ax
jmp     loc_234DB

loc_2345E:              ; jumptable 0002335E case 3
xor     ax, ax
push    ax
push    ax
push    ax
mov     ax, 3
push    ax
xor     ax, ax
push    ax
mov     ax, 1
push    ax
call    sub_2307D
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
cmp     byte ptr ds:0BED2h, 1Fh
jz      short def_2335E ; jumptable 0002335E default case
mov     ax, 78h ; 'x'
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     short loc_234CC

def_2335E:              ; jumptable 0002335E default case
push    word ptr [bp+var_4+2]
push    word ptr [bp+var_4]
call    sub_237EA
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
les     bx, [bp+var_4]
cmp     byte ptr es:[bx+1], 0
jz      short loc_234CC
mov     bx, ax
cmp     byte ptr es:[bx], 2
jnz     short loc_234C1
mov     bx, ax
mov     dx, es:[bx+8]
mov     ax, es:[bx+6]
mov     ds:0BEDAh, dx
mov     ds:0BED8h, ax
jmp     short loc_234D8

loc_234C1:
mov     ax, 79h ; 'y'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_234CC:
mov     word ptr ds:0BEDAh, 0
mov     word ptr ds:0BED8h, 0

loc_234D8:
mov     ax, 1

loc_234DB:
mov     sp, bp
pop     bp
retf    2
sub_23348 endp

seg005 ends


; Segment type: Pure code
seg006 segment byte public 'CODE' use16
assume cs:seg006
;org 1
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing


; Attributes: bp-based frame

sub_234E1 proc far

arg_0= dword ptr  6

push    bp
mov     bp, sp
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 0
jnz     short loc_234F4
mov     dx, word ptr [bp+arg_0+2]
mov     ax, bx
jmp     short loc_23516

loc_234F4:
push    ss
lea     ax, [bp+arg_0]
push    ax
push    ss
lea     ax, [bp+arg_0]
push    ax
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
mov     ax, 3
push    ax
call    sub_2351A
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_237EA

loc_23516:
pop     bp
retf    4
sub_234E1 endp



; Attributes: bp-based frame

sub_2351A proc near

var_8= dword ptr -8
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= dword ptr  6
arg_6= dword ptr  0Ah
arg_A= dword ptr  0Eh

push    bp
mov     bp, sp
sub     sp, 8
push    si
mov     si, [bp+arg_0]

loc_23524:
les     bx, [bp+arg_2]
les     bx, es:[bx+6]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
les     bx, [bp+arg_2]
mov     al, es:[bx]
cbw
cmp     ax, 19h
jz      short loc_235AD ; jumptable 0002354C case 24
jg      short loc_23581
dec     ax              ; switch 24 cases
cmp     ax, 17h
jbe     short loc_23548
jmp     def_2354C       ; jumptable 0002354C default case, cases 6,8,10-23
                        ; jumptable 00023590 default case, cases 49,52,53,55

loc_23548:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_2354C[bx] ; switch jump
jpt_2354C dw offset loc_237E3 ; jump table for switch statement
dw offset loc_237E3
dw offset loc_237E3
dw offset loc_237E3
dw offset loc_237E3
dw offset def_2354C
dw offset loc_237E3
dw offset def_2354C
dw offset loc_237E3
dw offset def_2354C
dw offset def_2354C
dw offset def_2354C
dw offset def_2354C
dw offset def_2354C
dw offset def_2354C
dw offset def_2354C
dw offset def_2354C
dw offset def_2354C
dw offset def_2354C
dw offset def_2354C
dw offset def_2354C
dw offset def_2354C
dw offset def_2354C
dw offset loc_235AD

loc_23581:              ; switch 12 cases
sub     ax, 2Dh ; '-'
cmp     ax, 0Bh
jbe     short loc_2358C
jmp     def_2354C       ; jumptable 0002354C default case, cases 6,8,10-23
                        ; jumptable 00023590 default case, cases 49,52,53,55

loc_2358C:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_23590[bx] ; switch jump
jpt_23590 dw offset loc_23723 ; jump table for switch statement
dw offset loc_23662
dw offset loc_23662
dw offset loc_237E3
dw offset def_2354C
dw offset loc_237E3
dw offset loc_237E3
dw offset def_2354C
dw offset def_2354C
dw offset loc_237E3
dw offset def_2354C
dw offset loc_23746

loc_235AD:              ; jumptable 0002354C case 24
les     bx, [bp+arg_A]
mov     dx, es:[bx+2]
mov     ax, es:[bx]
cmp     dx, word ptr [bp+arg_2+2]
jnz     short loc_235C4
cmp     ax, word ptr [bp+arg_2]
jnz     short loc_235C4
jmp     def_2354C       ; jumptable 0002354C default case, cases 6,8,10-23
                        ; jumptable 00023590 default case, cases 49,52,53,55

loc_235C4:
test    si, 1
jnz     short loc_235CD
jmp     def_2354C       ; jumptable 0002354C default case, cases 6,8,10-23
                        ; jumptable 00023590 default case, cases 49,52,53,55

loc_235CD:
les     bx, [bp+var_8]
cmp     byte ptr es:[bx], 1
jge     short loc_235D9
jmp     def_2354C       ; jumptable 0002354C default case, cases 6,8,10-23
                        ; jumptable 00023590 default case, cases 49,52,53,55

loc_235D9:
cmp     byte ptr es:[bx], 9
jle     short loc_235E2
jmp     def_2354C       ; jumptable 0002354C default case, cases 6,8,10-23
                        ; jumptable 00023590 default case, cases 49,52,53,55

loc_235E2:
les     bx, [bp+arg_2]
mov     al, es:[bx]
push    ax
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    word ptr [bp+var_8+2]
push    word ptr [bp+var_8]
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
call    sub_29862
mov     [bp+var_2], dx
mov     [bp+var_4], ax
mov     ax, 10h
push    ax
call    sub_318B7
les     bx, [bp+arg_6]
mov     es:[bx+2], dx
mov     es:[bx], ax
les     bx, es:[bx]
push    es
push    bx
les     bx, [bp+var_8]
push    es
push    bx
mov     cx, 10h
call    sub_46BE5
mov     al, 38h ; '8'
push    ax
les     bx, [bp+arg_A]
les     bx, es:[bx]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    [bp+var_2]
push    [bp+var_4]
les     bx, [bp+arg_A]
push    word ptr es:[bx+2]
push    word ptr es:[bx]
call    sub_29862
les     bx, [bp+arg_A]
mov     es:[bx+2], dx
mov     es:[bx], ax
jmp     loc_237E3       ; jumptable 0002354C cases 1-5,7,9
                        ; jumptable 00023590 cases 48,50,51,54

loc_23662:              ; jumptable 00023590 cases 46,47
les     bx, [bp+arg_A]
mov     dx, es:[bx+2]
mov     ax, es:[bx]
cmp     dx, word ptr [bp+arg_2+2]
jnz     short loc_23679
cmp     ax, word ptr [bp+arg_2]
jnz     short loc_23679
jmp     def_2354C       ; jumptable 0002354C default case, cases 6,8,10-23
                        ; jumptable 00023590 default case, cases 49,52,53,55

loc_23679:
test    si, 2
jnz     short loc_23682
jmp     def_2354C       ; jumptable 0002354C default case, cases 6,8,10-23
                        ; jumptable 00023590 default case, cases 49,52,53,55

loc_23682:
les     bx, [bp+var_8]
cmp     byte ptr es:[bx], 1
jge     short loc_2368E
jmp     def_2354C       ; jumptable 0002354C default case, cases 6,8,10-23
                        ; jumptable 00023590 default case, cases 49,52,53,55

loc_2368E:
cmp     byte ptr es:[bx], 9
jle     short loc_23697
jmp     def_2354C       ; jumptable 0002354C default case, cases 6,8,10-23
                        ; jumptable 00023590 default case, cases 49,52,53,55

loc_23697:
les     bx, [bp+arg_2]
mov     al, es:[bx]
cbw
mov     bx, ax
push    word ptr [bx+4B58h]
mov     bx, word ptr [bp+arg_2]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    word ptr [bp+var_8+2]
push    word ptr [bp+var_8]
mov     bx, word ptr [bp+arg_2]
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
call    sub_29862
mov     [bp+var_2], dx
mov     [bp+var_4], ax
mov     ax, 10h
push    ax
call    sub_318B7
les     bx, [bp+arg_6]
mov     es:[bx+2], dx
mov     es:[bx], ax
les     bx, es:[bx]
push    es
push    bx
les     bx, [bp+var_8]
push    es
push    bx
mov     cx, 10h
call    sub_46BE5
mov     al, 37h ; '7'
push    ax
les     bx, [bp+arg_A]
les     bx, es:[bx]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
les     bx, [bp+arg_A]
push    word ptr es:[bx+2]
push    word ptr es:[bx]
push    [bp+var_2]
push    [bp+var_4]
call    sub_29862
les     bx, [bp+arg_A]
mov     es:[bx+2], dx
mov     es:[bx], ax
jmp     loc_237E3       ; jumptable 0002354C cases 1-5,7,9
                        ; jumptable 00023590 cases 48,50,51,54

loc_23723:              ; jumptable 00023590 case 45
push    word ptr [bp+arg_A+2]
push    word ptr [bp+arg_A]
mov     dx, word ptr [bp+arg_2+2]
mov     ax, word ptr [bp+arg_2]
add     ax, 6
push    dx
push    ax
les     bx, [bp+arg_2]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
push    si
call    sub_2351A
jmp     loc_237E3       ; jumptable 0002354C cases 1-5,7,9
                        ; jumptable 00023590 cases 48,50,51,54

loc_23746:              ; jumptable 00023590 case 56
test    si, 2
jz      short loc_2376F
push    word ptr [bp+arg_A+2]
push    word ptr [bp+arg_A]
mov     dx, word ptr [bp+arg_2+2]
mov     ax, word ptr [bp+arg_2]
add     ax, 0Ah
push    dx
push    ax
les     bx, [bp+arg_2]
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
mov     ax, 2
push    ax
call    sub_2351A

loc_2376F:
les     bx, [bp+arg_2]
add     bx, 6
mov     word ptr [bp+arg_A+2], es
mov     word ptr [bp+arg_A], bx
mov     word ptr [bp+arg_6+2], es
mov     word ptr [bp+arg_6], bx
mov     bx, word ptr [bp+arg_2]
les     bx, es:[bx+6]
mov     word ptr [bp+arg_2+2], es
mov     word ptr [bp+arg_2], bx
mov     si, 3
jmp     loc_23524

def_2354C:              ; jumptable 0002354C default case, cases 6,8,10-23
les     bx, [bp+arg_2]  ; jumptable 00023590 default case, cases 49,52,53,55
mov     ax, es:[bx+0Ah]
or      ax, es:[bx+0Ch]
jz      short loc_237BD
push    word ptr [bp+arg_A+2]
push    word ptr [bp+arg_A]
mov     dx, word ptr [bp+arg_2+2]
mov     ax, bx
add     ax, 0Ah
push    dx
push    ax
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
push    si
call    sub_2351A

loc_237BD:
les     bx, [bp+arg_2]
mov     ax, es:[bx+6]
or      ax, es:[bx+8]
jz      short loc_237E3 ; jumptable 0002354C cases 1-5,7,9
                        ; jumptable 00023590 cases 48,50,51,54
add     bx, 6
mov     word ptr [bp+arg_6+2], es
mov     word ptr [bp+arg_6], bx
mov     bx, word ptr [bp+arg_2]
les     bx, es:[bx+6]
mov     word ptr [bp+arg_2+2], es
mov     word ptr [bp+arg_2], bx
jmp     loc_23524

loc_237E3:              ; jumptable 0002354C cases 1-5,7,9
pop     si              ; jumptable 00023590 cases 48,50,51,54
mov     sp, bp
pop     bp
retn    0Eh
sub_2351A endp



; Attributes: bp-based frame

sub_237EA proc far

var_14= word ptr -14h
var_12= word ptr -12h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= word ptr -4
var_2= word ptr -2
arg_0= dword ptr  6

push    bp
mov     bp, sp
sub     sp, 14h
push    si
mov     ax, sp
mov     dx, ds
mov     bx, 0C4CCh
mov     cx, ds
cmp     ax, bx
jnb     short loc_23809
mov     ax, 6
push    ax
call    sub_3129B
inc     sp
inc     sp

loc_23809:
mov     ax, word ptr [bp+arg_0]
or      ax, word ptr [bp+arg_0+2]
jnz     short loc_23814
jmp     loc_23DC2

loc_23814:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 0
jnz     short loc_23820
jmp     loc_23DC2

loc_23820:
cmp     byte ptr es:[bx], 35h ; '5'
jnz     short loc_23829
jmp     loc_23DC2

loc_23829:
cmp     byte ptr ds:0BDB7h, 0
jz      short loc_2384A
cmp     byte ptr es:[bx], 1
jnz     short loc_2384A
push    word ptr ds:0BD80h
push    word ptr ds:0BD7Eh
xor     ax, ax
push    ax
push    ax
call    sub_29A88
jmp     loc_23EE0

loc_2384A:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 1
jl      short loc_2385C
cmp     byte ptr es:[bx], 9
jg      short loc_2385C
jmp     loc_23DC2

loc_2385C:
les     bx, [bp+arg_0]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
push    cs
call    near ptr sub_237EA
les     bx, [bp+arg_0]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
cmp     byte ptr es:[bx], 2Dh ; '-'
jnz     short loc_23885
jmp     loc_23DC2

loc_23885:
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
push    cs
call    near ptr sub_237EA
les     bx, [bp+arg_0]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
mov     word ptr [bp+var_C+2], dx
mov     word ptr [bp+var_C], ax
mov     al, es:[bx]
cbw
sub     ax, 0Dh         ; switch 46 cases
cmp     ax, 2Dh
jbe     short loc_238B1
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_238B1:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_238B5[bx] ; switch jump
jpt_238B5 dw offset loc_23BAB ; jump table for switch statement
dw offset loc_23CF4
dw offset loc_23916
dw offset loc_23A29
dw offset loc_23A9C
dw offset def_238B5
dw offset def_238B5
dw offset loc_23C7D
dw offset loc_23C7D
dw offset def_238B5
dw offset def_238B5
dw offset def_238B5
dw offset def_238B5
dw offset def_238B5
dw offset def_238B5
dw offset def_238B5
dw offset def_238B5
dw offset def_238B5
dw offset def_238B5
dw offset def_238B5
dw offset def_238B5
dw offset loc_23E59
dw offset loc_23E59
dw offset loc_23DCB
dw offset loc_23DCB
dw offset loc_23DCB
dw offset loc_23DCB
dw offset def_238B5
dw offset def_238B5
dw offset def_238B5
dw offset loc_23B1D
dw offset loc_23B7C
dw offset def_238B5
dw offset def_238B5
dw offset def_238B5
dw offset loc_23D93
dw offset def_238B5
dw offset def_238B5
dw offset def_238B5
dw offset def_238B5
dw offset def_238B5
dw offset def_238B5
dw offset def_238B5
dw offset def_238B5
dw offset def_238B5
dw offset loc_23CB5

loc_23916:              ; jumptable 000238B5 case 15
les     bx, [bp+var_10]
mov     al, es:[bx]
les     bx, [bp+arg_0]
cmp     al, es:[bx]
jnz     short loc_2393F
push    word ptr [bp+arg_0+2]
push    bx
push    word ptr [bp+var_10+2]
push    word ptr [bp+var_10]
push    word ptr [bp+var_C+2]
push    word ptr [bp+var_C]
call    sub_245C5
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
jmp     short loc_23990

loc_2393F:
les     bx, [bp+var_C]
mov     al, es:[bx]
les     bx, [bp+arg_0]
cmp     al, es:[bx]
jnz     short loc_23968
push    word ptr [bp+arg_0+2]
push    bx
push    word ptr [bp+var_C+2]
push    word ptr [bp+var_C]
push    word ptr [bp+var_10+2]
push    word ptr [bp+var_10]
call    sub_245C5
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
jmp     short loc_23990

loc_23968:
les     bx, [bp+var_10]
cmp     byte ptr es:[bx], 2
jnz     short loc_23990
mov     dx, word ptr [bp+var_C+2]
mov     ax, word ptr [bp+var_C]
les     bx, [bp+arg_0]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
mov     dx, word ptr [bp+var_10+2]
mov     ax, word ptr [bp+var_10]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax

loc_23990:
les     bx, [bp+arg_0]
les     bx, es:[bx+0Ah]
mov     word ptr [bp+var_C+2], es
mov     word ptr [bp+var_C], bx
les     bx, [bp+arg_0]
les     bx, es:[bx+6]
mov     word ptr [bp+var_10+2], es
mov     word ptr [bp+var_10], bx
les     bx, [bp+var_C]
cmp     byte ptr es:[bx], 2
jz      short loc_239B6
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_239B6:
cmp     word ptr es:[bx+8], 0
jl      short loc_23A03
jg      short loc_239C6
cmp     word ptr es:[bx+6], 0
jbe     short loc_23A03

loc_239C6:
les     bx, [bp+var_C]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
call    sub_249E8
mov     si, ax
or      si, si
jnz     short loc_239DF
jmp     loc_23D45

loc_239DF:
or      si, si
jg      short loc_239E6
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_239E6:
mov     ax, si
cwd
les     bx, [bp+var_C]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
mov     byte ptr es:[bx+1], 2
les     bx, [bp+arg_0]
mov     byte ptr es:[bx], 12h
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23A03:
les     bx, [bp+var_C]
mov     ax, es:[bx+6]
or      ax, es:[bx+8]
jz      short loc_23A13
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23A13:
les     bx, [bp+var_10]
cmp     byte ptr es:[bx], 2
jnz     short loc_23A1F
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23A1F:
les     bx, [bp+arg_0]
mov     byte ptr es:[bx], 38h ; '8'
jmp     loc_23DC2

loc_23A29:              ; jumptable 000238B5 case 16
les     bx, [bp+var_C]
cmp     byte ptr es:[bx], 2
jz      short loc_23A35
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23A35:
cmp     word ptr es:[bx+8], 0
jge     short loc_23A3F
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23A3F:
jg      short loc_23A4B
cmp     word ptr es:[bx+6], 0
ja      short loc_23A4B
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23A4B:
les     bx, [bp+var_C]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
call    sub_249E8
mov     si, ax
or      si, si
jnz     short loc_23A64
jmp     loc_23D45

loc_23A64:
or      si, si
jg      short loc_23A6B
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23A6B:
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 20h
jnz     short loc_23A7F
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23A7F:
mov     ax, si
cwd
les     bx, [bp+var_C]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
mov     byte ptr es:[bx+1], 2
les     bx, [bp+arg_0]
mov     byte ptr es:[bx], 13h
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23A9C:              ; jumptable 000238B5 case 17
les     bx, [bp+var_C]
cmp     byte ptr es:[bx], 2
jz      short loc_23AA8
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23AA8:
cmp     word ptr es:[bx+8], 0
jge     short loc_23AB2
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23AB2:
jg      short loc_23ABE
cmp     word ptr es:[bx+6], 0
ja      short loc_23ABE
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23ABE:
les     bx, [bp+var_C]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
call    sub_249E8
mov     si, ax
or      si, si
jnz     short loc_23AEB
les     bx, [bp+var_C]
mov     word ptr es:[bx+8], 0
mov     word ptr es:[bx+6], 0
mov     dx, word ptr [bp+var_C+2]
mov     ax, bx
jmp     loc_23EE0

loc_23AEB:
or      si, si
jg      short loc_23AF2
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23AF2:
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 20h
jnz     short loc_23B06
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23B06:
les     bx, [bp+var_C]
sub     word ptr es:[bx+6], 1
sbb     word ptr es:[bx+8], 0
les     bx, [bp+arg_0]
mov     byte ptr es:[bx], 14h
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23B1D:              ; jumptable 000238B5 case 43
push    word ptr [bp+var_10+2]
push    word ptr [bp+var_10]
call    sub_2240B
les     bx, [bp+var_10]
cmp     byte ptr es:[bx], 2Ch ; ','
jz      short loc_23B34
jmp     loc_23DC2

loc_23B34:
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
call    sub_22692
or      ax, ax
jnz     short loc_23B48
jmp     loc_23DC2

loc_23B48:
les     bx, [bp+var_10]
les     bx, es:[bx+6]
mov     word ptr [bp+var_10+2], es
mov     word ptr [bp+var_10], bx
les     bx, [bp+arg_0]
mov     dx, es:[bx+4]
mov     ax, es:[bx+2]
les     bx, [bp+var_10]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
les     bx, [bp+var_10]
mov     es:[bx+1], al
jmp     loc_23D45

loc_23B7C:              ; jumptable 000238B5 case 44
les     bx, [bp+var_10]
cmp     byte ptr es:[bx], 2Bh ; '+'
jz      short loc_23B88
jmp     loc_23DC2

loc_23B88:
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
les     bx, [bp+arg_0]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
mov     ax, 1
push    ax
xor     ax, ax
push    ax
push    ax
call    sub_21215
jmp     loc_23EE0

loc_23BAB:              ; jumptable 000238B5 case 13
les     bx, [bp+arg_0]
les     bx, es:[bx+2]
mov     [bp+var_2], es
mov     [bp+var_4], bx
les     bx, [bp+var_C]
cmp     byte ptr es:[bx], 2
jnz     short loc_23BE7
mov     ax, es:[bx+6]
or      ax, es:[bx+8]
jnz     short loc_23BE7
push    word ptr [bp+var_10+2]
push    word ptr [bp+var_10]
push    [bp+var_2]
push    [bp+var_4]
mov     ax, 1
push    ax
xor     ax, ax
push    ax
push    ax
call    sub_21215
jmp     loc_23EE0

loc_23BE7:
les     bx, [bp+var_10]
cmp     byte ptr es:[bx], 2Ch ; ','
jnz     short loc_23C34
les     bx, [bp+var_C]
cmp     byte ptr es:[bx], 2
jnz     short loc_23C34
les     bx, [bp+var_10]
les     bx, es:[bx+6]
cmp     byte ptr es:[bx], 1
jz      short loc_23C16
les     bx, [bp+var_10]
les     bx, es:[bx+6]
cmp     byte ptr es:[bx], 7
jz      short loc_23C16
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23C16:
les     bx, [bp+var_10]
les     bx, es:[bx+6]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
les     bx, [bp+var_C]
mov     ax, es:[bx+6]
les     bx, [bp+var_8]
add     es:[bx+0Ah], ax
jmp     loc_23D45

loc_23C34:
les     bx, [bp+var_10]
cmp     byte ptr es:[bx], 2
jz      short loc_23C43
cmp     byte ptr es:[bx], 2Ch ; ','
jnz     short loc_23C5E

loc_23C43:
les     bx, [bp+var_C]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
les     bx, [bp+var_10]
mov     word ptr [bp+var_C+2], es
mov     word ptr [bp+var_C], bx
les     bx, [bp+var_8]
mov     word ptr [bp+var_10+2], es
mov     word ptr [bp+var_10], bx

loc_23C5E:
mov     dx, word ptr [bp+var_C+2]
mov     ax, word ptr [bp+var_C]
les     bx, [bp+arg_0]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
mov     dx, word ptr [bp+var_10+2]
mov     ax, word ptr [bp+var_10]
mov     es:[bx+8], dx
mov     es:[bx+6], ax

loc_23C7D:              ; jumptable 000238B5 cases 20,21
les     bx, [bp+var_10]
mov     al, es:[bx]
les     bx, [bp+arg_0]
cmp     al, es:[bx]
jnz     short loc_23C8E
jmp     loc_23D7B

loc_23C8E:
les     bx, [bp+var_C]
mov     al, es:[bx]
les     bx, [bp+arg_0]
cmp     al, es:[bx]
jz      short loc_23C9F
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23C9F:
push    word ptr [bp+arg_0+2]
push    bx
push    word ptr [bp+var_C+2]
push    word ptr [bp+var_C]
push    word ptr [bp+var_10+2]
push    word ptr [bp+var_10]
call    sub_245C5
jmp     loc_23EE0

loc_23CB5:              ; jumptable 000238B5 case 58
les     bx, [bp+var_C]
cmp     byte ptr es:[bx], 2
jz      short loc_23CC1
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23CC1:
mov     ax, es:[bx+6]
or      ax, es:[bx+8]
jz      short loc_23CCE
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23CCE:
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
les     bx, [bp+var_10]
mov     es:[bx+1], al
les     bx, [bp+arg_0]
mov     dx, es:[bx+4]
mov     ax, es:[bx+2]
les     bx, [bp+var_10]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
jmp     short loc_23D45

loc_23CF4:              ; jumptable 000238B5 case 14
les     bx, [bp+var_C]
cmp     byte ptr es:[bx], 2
jz      short loc_23D00
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23D00:
mov     ax, es:[bx+6]
or      ax, es:[bx+8]
jz      short loc_23D45
les     bx, [bp+var_10]
cmp     byte ptr es:[bx], 2Ch ; ','
jnz     short loc_23D4E
les     bx, es:[bx+6]
cmp     byte ptr es:[bx], 1
jz      short loc_23D2A
les     bx, [bp+var_10]
les     bx, es:[bx+6]
cmp     byte ptr es:[bx], 7
jnz     short loc_23D4E

loc_23D2A:
les     bx, [bp+var_10]
les     bx, es:[bx+6]
mov     word ptr [bp+arg_0+2], es
mov     word ptr [bp+arg_0], bx
les     bx, [bp+var_C]
mov     ax, es:[bx+6]
les     bx, [bp+arg_0]
sub     es:[bx+0Ah], ax

loc_23D45:
mov     dx, word ptr [bp+var_10+2]
mov     ax, word ptr [bp+var_10]
jmp     loc_23EE0

loc_23D4E:
les     bx, [bp+var_C]
mov     dx, es:[bx+8]
mov     ax, es:[bx+6]
neg     dx
neg     ax
sbb     dx, 0
mov     es:[bx+8], dx
mov     es:[bx+6], ax
les     bx, [bp+arg_0]
mov     byte ptr es:[bx], 0Dh
les     bx, [bp+var_10]
cmp     byte ptr es:[bx], 0Dh
jz      short loc_23D7B
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23D7B:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
push    word ptr [bp+var_10+2]
push    word ptr [bp+var_10]
push    word ptr [bp+var_C+2]
push    word ptr [bp+var_C]
call    sub_245C5
jmp     loc_23EE0

loc_23D93:              ; jumptable 000238B5 case 48
les     bx, [bp+var_10]
cmp     byte ptr es:[bx], 2
jnz     short loc_23DC2
mov     ax, es:[bx+6]
or      ax, es:[bx+8]
jz      short loc_23DB4
les     bx, [bp+var_C]
mov     dx, es:[bx+8]
mov     ax, es:[bx+6]
jmp     loc_23EE0

loc_23DB4:
les     bx, [bp+var_C]
mov     dx, es:[bx+0Ch]
mov     ax, es:[bx+0Ah]
jmp     loc_23EE0

loc_23DC2:
mov     dx, word ptr [bp+arg_0+2]
mov     ax, word ptr [bp+arg_0]
jmp     loc_23EE0

loc_23DCB:              ; jumptable 000238B5 cases 36-39
les     bx, [bp+var_10]
cmp     byte ptr es:[bx+1], 0Bh
jz      short loc_23DD8
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23DD8:
les     bx, es:[bx+2]
mov     al, es:[bx+5]
mov     ah, 0
and     ax, 0Fh
cmp     ax, 5
jz      short loc_23DED
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23DED:
mov     ax, 6
push    ax
xor     ax, ax
push    ax
call    sub_2A52D
mov     [bp+var_12], dx
mov     [bp+var_14], ax
push    word ptr [bp+var_10+2]
push    word ptr [bp+var_10]
push    dx
push    ax
mov     ax, 1
push    ax
xor     ax, ax
push    ax
push    ax
call    sub_21215
les     bx, [bp+arg_0]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
push    word ptr [bp+var_C+2]
push    word ptr [bp+var_C]
push    [bp+var_12]
push    [bp+var_14]
mov     ax, 1
push    ax
xor     ax, ax
push    ax
push    ax
call    sub_21215
les     bx, [bp+arg_0]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
mov     dx, [bp+var_12]
mov     ax, [bp+var_14]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
mov     byte ptr es:[bx+1], 6
jmp     def_238B5       ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23E59:              ; jumptable 000238B5 cases 34,35
les     bx, [bp+var_C]
cmp     byte ptr es:[bx], 2
jnz     short loc_23E98
mov     ax, es:[bx+6]
or      ax, es:[bx+8]
jnz     short loc_23E98
push    word ptr [bp+var_10+2]
push    word ptr [bp+var_10]
call    sub_21101
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
les     bx, [bp+arg_0]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
les     bx, [bp+var_10]
mov     al, es:[bx+1]
les     bx, [bp+var_C]
mov     es:[bx+1], al
jmp     short def_238B5 ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57

loc_23E98:
les     bx, [bp+var_10]
cmp     byte ptr es:[bx], 2
jnz     short def_238B5 ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57
mov     ax, es:[bx+6]
or      ax, es:[bx+8]
jnz     short def_238B5 ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57
push    word ptr [bp+var_C+2]
push    word ptr [bp+var_C]
call    sub_21101
mov     word ptr [bp+var_C+2], dx
mov     word ptr [bp+var_C], ax
les     bx, [bp+arg_0]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
les     bx, [bp+var_C]
mov     al, es:[bx+1]
les     bx, [bp+var_10]
mov     es:[bx+1], al

def_238B5:              ; jumptable 000238B5 default case, cases 18,19,22-33,40-42,45-47,49-57
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_23EE7

loc_23EE0:
pop     si
mov     sp, bp
pop     bp
retf    4
sub_237EA endp



; Attributes: bp-based frame

sub_23EE7 proc far

var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= dword ptr  6

push    bp
mov     bp, sp
sub     sp, 10h
push    si
les     bx, [bp+arg_0]
les     bx, es:[bx+6]
mov     word ptr [bp+var_10+2], es
mov     word ptr [bp+var_10], bx
les     bx, [bp+arg_0]
les     bx, es:[bx+0Ah]
mov     word ptr [bp+var_C+2], es
mov     word ptr [bp+var_C], bx
les     bx, [bp+var_10]
cmp     byte ptr es:[bx], 3
jz      short loc_23F14
jmp     loc_240B6

loc_23F14:
mov     ax, word ptr [bp+var_C]
or      ax, word ptr [bp+var_C+2]
jz      short loc_23F28
les     bx, [bp+var_C]
cmp     byte ptr es:[bx], 3
jz      short loc_23F28
jmp     loc_240B6

loc_23F28:
les     bx, [bp+arg_0]
mov     al, es:[bx]
cbw
sub     ax, 0Dh         ; switch 28 cases
cmp     ax, 1Bh
jbe     short loc_23F3A
jmp     def_23F3E       ; jumptable 00023F3E default case, cases 17-33
                        ; jumptable 00024116 default case, cases 23-33,43-49,52-57

loc_23F3A:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_23F3E[bx] ; switch jump
jpt_23F3E dw offset loc_24032 ; jump table for switch statement
dw offset loc_24050
dw offset loc_2406E
dw offset loc_2408C
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset loc_23F7B
dw offset loc_23F7B
dw offset loc_23F7B
dw offset loc_23F7B
dw offset loc_23F7B
dw offset loc_23F7B
dw offset loc_240AA

loc_23F7B:              ; jumptable 00023F3E cases 34-39
mov     dx, word ptr [bp+var_10+2]
mov     ax, word ptr [bp+var_10]
add     ax, 6
push    dx
push    ax
mov     dx, word ptr [bp+var_C+2]
mov     ax, word ptr [bp+var_C]
add     ax, 6
push    dx
push    ax
call    sub_42CFC
mov     si, ax
les     bx, [bp+arg_0]
mov     al, es:[bx]
cbw
sub     ax, 22h ; '"'   ; switch 6 cases
cmp     ax, 5
jbe     short loc_23FAA
jmp     def_23FAE       ; jumptable 00023FAE default case

loc_23FAA:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_23FAE[bx] ; switch jump
jpt_23FAE dw offset loc_23FBF ; jump table for switch statement
dw offset loc_23FCE
dw offset loc_23FDD
dw offset loc_23FEC
dw offset loc_23FFB
dw offset loc_2400A

loc_23FBF:              ; jumptable 00023FAE case 34
or      si, si
jnz     short loc_23FC8
mov     ax, 1
jmp     short loc_23FCA

loc_23FC8:
xor     ax, ax

loc_23FCA:
mov     si, ax
jmp     short def_23FAE ; jumptable 00023FAE default case

loc_23FCE:              ; jumptable 00023FAE case 35
or      si, si
jz      short loc_23FD7
mov     ax, 1
jmp     short loc_23FD9

loc_23FD7:
xor     ax, ax

loc_23FD9:
mov     si, ax
jmp     short def_23FAE ; jumptable 00023FAE default case

loc_23FDD:              ; jumptable 00023FAE case 36
or      si, si
jle     short loc_23FE6
mov     ax, 1
jmp     short loc_23FE8

loc_23FE6:
xor     ax, ax

loc_23FE8:
mov     si, ax
jmp     short def_23FAE ; jumptable 00023FAE default case

loc_23FEC:              ; jumptable 00023FAE case 37
or      si, si
jge     short loc_23FF5
mov     ax, 1
jmp     short loc_23FF7

loc_23FF5:
xor     ax, ax

loc_23FF7:
mov     si, ax
jmp     short def_23FAE ; jumptable 00023FAE default case

loc_23FFB:              ; jumptable 00023FAE case 38
or      si, si
jl      short loc_24004
mov     ax, 1
jmp     short loc_24006

loc_24004:
xor     ax, ax

loc_24006:
mov     si, ax
jmp     short def_23FAE ; jumptable 00023FAE default case

loc_2400A:              ; jumptable 00023FAE case 39
or      si, si
jg      short loc_24013
mov     ax, 1
jmp     short loc_24015

loc_24013:
xor     ax, ax

loc_24015:
mov     si, ax

def_23FAE:              ; jumptable 00023FAE default case
push    word ptr ds:0BD80h
push    word ptr ds:0BD7Eh
mov     ax, si
cwd
push    dx
push    ax
call    sub_29A88
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
jmp     loc_245B8

loc_24032:              ; jumptable 00023F3E case 13
mov     dx, word ptr [bp+var_10+2]
mov     ax, word ptr [bp+var_10]
add     ax, 6
push    dx
push    ax
mov     dx, word ptr [bp+var_C+2]
mov     ax, word ptr [bp+var_C]
add     ax, 6
push    dx
push    ax
call    sub_42887
jmp     loc_245B8

loc_24050:              ; jumptable 00023F3E case 14
mov     dx, word ptr [bp+var_10+2]
mov     ax, word ptr [bp+var_10]
add     ax, 6
push    dx
push    ax
mov     dx, word ptr [bp+var_C+2]
mov     ax, word ptr [bp+var_C]
add     ax, 6
push    dx
push    ax
call    sub_428A1
jmp     loc_245B8

loc_2406E:              ; jumptable 00023F3E case 15
mov     dx, word ptr [bp+var_10+2]
mov     ax, word ptr [bp+var_10]
add     ax, 6
push    dx
push    ax
mov     dx, word ptr [bp+var_C+2]
mov     ax, word ptr [bp+var_C]
add     ax, 6
push    dx
push    ax
call    sub_428BB
jmp     loc_245B8

loc_2408C:              ; jumptable 00023F3E case 16
mov     dx, word ptr [bp+var_10+2]
mov     ax, word ptr [bp+var_10]
add     ax, 6
push    dx
push    ax
mov     dx, word ptr [bp+var_C+2]
mov     ax, word ptr [bp+var_C]
add     ax, 6
push    dx
push    ax
call    sub_42AA6
jmp     loc_245B8

loc_240AA:              ; jumptable 00023F3E case 40
les     bx, [bp+var_10]
xor     word ptr es:[bx+0Eh], 8000h
jmp     loc_245B8

loc_240B6:
les     bx, [bp+var_10]
cmp     byte ptr es:[bx], 2
jz      short loc_240C2
jmp     def_23F3E       ; jumptable 00023F3E default case, cases 17-33
                        ; jumptable 00024116 default case, cases 23-33,43-49,52-57

loc_240C2:
mov     ax, word ptr [bp+var_C]
or      ax, word ptr [bp+var_C+2]
jz      short loc_240D6
les     bx, [bp+var_C]
cmp     byte ptr es:[bx], 2
jz      short loc_240D6
jmp     def_23F3E       ; jumptable 00023F3E default case, cases 17-33
                        ; jumptable 00024116 default case, cases 23-33,43-49,52-57

loc_240D6:
les     bx, [bp+var_10]
mov     dx, es:[bx+8]
mov     ax, es:[bx+6]
mov     [bp+var_6], dx
mov     [bp+var_8], ax
mov     ax, word ptr [bp+var_C]
or      ax, word ptr [bp+var_C+2]
jz      short loc_24100
les     bx, [bp+var_C]
mov     dx, es:[bx+8]
mov     ax, es:[bx+6]
mov     [bp+var_2], dx
mov     [bp+var_4], ax

loc_24100:
les     bx, [bp+arg_0]
mov     al, es:[bx]
cbw
sub     ax, 0Dh         ; switch 46 cases
cmp     ax, 2Dh
jbe     short loc_24112
jmp     def_23F3E       ; jumptable 00023F3E default case, cases 17-33
                        ; jumptable 00024116 default case, cases 23-33,43-49,52-57

loc_24112:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_24116[bx] ; switch jump
jpt_24116 dw offset loc_24177 ; jump table for switch statement
dw offset loc_2453B
dw offset loc_24186
dw offset loc_241A0
dw offset loc_241ED
dw offset loc_24248
dw offset loc_2425F
dw offset loc_2429E
dw offset loc_242B3
dw offset loc_242C8
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset loc_24318
dw offset loc_24339
dw offset loc_243B1
dw offset loc_2435A
dw offset loc_2445F
dw offset loc_24408
dw offset loc_242EF
dw offset loc_24305
dw offset loc_242DD
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset loc_244B6
dw offset loc_244D3
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset def_23F3E
dw offset loc_244F0

loc_24177:              ; jumptable 00024116 case 13
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]
add     [bp+var_8], ax
adc     [bp+var_6], dx
jmp     loc_24578

loc_24186:              ; jumptable 00024116 case 15
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
mov     cx, [bp+var_2]
mov     bx, [bp+var_4]
call    sub_46A18
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_241A0:              ; jumptable 00024116 case 16
mov     ax, [bp+var_4]
or      ax, [bp+var_2]
jz      short loc_241F5
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 20h
jz      short loc_241D3
push    [bp+var_2]
push    [bp+var_4]
push    [bp+var_6]
push    [bp+var_8]
call    sub_1ED55
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_241D3:
push    [bp+var_2]
push    [bp+var_4]
push    [bp+var_6]
push    [bp+var_8]
call    sub_1ED51
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_241ED:              ; jumptable 00024116 case 17
mov     ax, [bp+var_4]
or      ax, [bp+var_2]
jnz     short loc_24203

loc_241F5:
mov     ax, 3Eh ; '>'
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_24578

loc_24203:
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 20h
jz      short loc_2422E
push    [bp+var_2]
push    [bp+var_4]
push    [bp+var_6]
push    [bp+var_8]
call    sub_1ED5F
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_2422E:
push    [bp+var_2]
push    [bp+var_4]
push    [bp+var_6]
push    [bp+var_8]
call    sub_1ED5A
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_24248:              ; jumptable 00024116 case 18
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
mov     cl, byte ptr [bp+var_4]
call    sub_1EDF6
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_2425F:              ; jumptable 00024116 case 19
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 20h
jz      short loc_24287
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
mov     cl, byte ptr [bp+var_4]
call    sub_1EE33
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_24287:
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
mov     cl, byte ptr [bp+var_4]
call    sub_1EE15
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_2429E:              ; jumptable 00024116 case 20
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
and     ax, [bp+var_4]
and     dx, [bp+var_2]
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_242B3:              ; jumptable 00024116 case 21
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
or      ax, [bp+var_4]
or      dx, [bp+var_2]
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_242C8:              ; jumptable 00024116 case 22
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
xor     ax, [bp+var_4]
xor     dx, [bp+var_2]
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_242DD:              ; jumptable 00024116 case 42
mov     ax, [bp+var_8]
neg     ax
sbb     ax, ax
inc     ax
cwd
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_242EF:              ; jumptable 00024116 case 40
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
neg     dx
neg     ax
sbb     dx, 0
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_24305:              ; jumptable 00024116 case 41
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
not     ax
not     dx
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_24318:              ; jumptable 00024116 case 34
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
cmp     dx, [bp+var_2]
jnz     short loc_2432D
cmp     ax, [bp+var_4]
jnz     short loc_2432D
mov     ax, 1
jmp     short loc_2432F

loc_2432D:
xor     ax, ax

loc_2432F:
cwd
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_24339:              ; jumptable 00024116 case 35
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
cmp     dx, [bp+var_2]
jnz     short loc_24349
cmp     ax, [bp+var_4]
jz      short loc_2434E

loc_24349:
mov     ax, 1
jmp     short loc_24350

loc_2434E:
xor     ax, ax

loc_24350:
cwd
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_2435A:              ; jumptable 00024116 case 37
les     bx, [bp+var_10]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 20h
jz      short loc_2438E
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
cmp     dx, [bp+var_2]
ja      short loc_24382
jb      short loc_2437D
cmp     ax, [bp+var_4]
jnb     short loc_24382

loc_2437D:
mov     ax, 1
jmp     short loc_24384

loc_24382:
xor     ax, ax

loc_24384:
cwd
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_2438E:
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
cmp     dx, [bp+var_2]
jg      short loc_243A5
jl      short loc_243A0
cmp     ax, [bp+var_4]
jnb     short loc_243A5

loc_243A0:
mov     ax, 1
jmp     short loc_243A7

loc_243A5:
xor     ax, ax

loc_243A7:
cwd
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_243B1:              ; jumptable 00024116 case 36
les     bx, [bp+var_10]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 20h
jz      short loc_243E5
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
cmp     dx, [bp+var_2]
jb      short loc_243D9
ja      short loc_243D4
cmp     ax, [bp+var_4]
jbe     short loc_243D9

loc_243D4:
mov     ax, 1
jmp     short loc_243DB

loc_243D9:
xor     ax, ax

loc_243DB:
cwd
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_243E5:
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
cmp     dx, [bp+var_2]
jl      short loc_243FC
jg      short loc_243F7
cmp     ax, [bp+var_4]
jbe     short loc_243FC

loc_243F7:
mov     ax, 1
jmp     short loc_243FE

loc_243FC:
xor     ax, ax

loc_243FE:
cwd
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_24408:              ; jumptable 00024116 case 39
les     bx, [bp+var_10]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 20h
jz      short loc_2443C
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
cmp     dx, [bp+var_2]
ja      short loc_24430
jnz     short loc_2442B
cmp     ax, [bp+var_4]
ja      short loc_24430

loc_2442B:
mov     ax, 1
jmp     short loc_24432

loc_24430:
xor     ax, ax

loc_24432:
cwd
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_2443C:
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
cmp     dx, [bp+var_2]
jg      short loc_24453
jnz     short loc_2444E
cmp     ax, [bp+var_4]
ja      short loc_24453

loc_2444E:
mov     ax, 1
jmp     short loc_24455

loc_24453:
xor     ax, ax

loc_24455:
cwd
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_2445F:              ; jumptable 00024116 case 38
les     bx, [bp+var_10]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 20h
jz      short loc_24493
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
cmp     dx, [bp+var_2]
jb      short loc_24487
jnz     short loc_24482
cmp     ax, [bp+var_4]
jb      short loc_24487

loc_24482:
mov     ax, 1
jmp     short loc_24489

loc_24487:
xor     ax, ax

loc_24489:
cwd
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_24493:
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
cmp     dx, [bp+var_2]
jl      short loc_244AA
jnz     short loc_244A5
cmp     ax, [bp+var_4]
jb      short loc_244AA

loc_244A5:
mov     ax, 1
jmp     short loc_244AC

loc_244AA:
xor     ax, ax

loc_244AC:
cwd
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_244B6:              ; jumptable 00024116 case 50
cmp     [bp+var_8], 0
jz      short loc_244C7
cmp     [bp+var_4], 0
jz      short loc_244C7
mov     ax, 1
jmp     short loc_244C9

loc_244C7:
xor     ax, ax

loc_244C9:
cwd
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_244D3:              ; jumptable 00024116 case 51
cmp     [bp+var_8], 0
jnz     short loc_244DF
cmp     [bp+var_4], 0
jz      short loc_244E4

loc_244DF:
mov     ax, 1
jmp     short loc_244E6

loc_244E4:
xor     ax, ax

loc_244E6:
cwd
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     loc_24578

loc_244F0:              ; jumptable 00024116 case 58
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+1], 7
jnz     short loc_24509
mov     ax, [bp+var_8]
sub     ax, [bp+var_4]
cwd
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     short loc_24578

loc_24509:
les     bx, [bp+arg_0]
les     bx, es:[bx+2]
test    byte ptr es:[bx+5], 6
jz      short loc_24549
mov     ax, [bp+var_6]
mov     cl, 0Ch
shl     ax, cl
add     ax, [bp+var_8]
xor     dx, dx
mov     [bp+var_6], dx
mov     [bp+var_8], ax
mov     ax, [bp+var_2]
mov     cl, 0Ch
shl     ax, cl
add     ax, [bp+var_4]
xor     dx, dx
mov     [bp+var_2], dx
mov     [bp+var_4], ax

loc_2453B:              ; jumptable 00024116 case 14
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]
sub     [bp+var_8], ax
sbb     [bp+var_6], dx
jmp     short loc_24578

loc_24549:
mov     dx, [bp+var_6]
mov     ax, [bp+var_8]
and     ax, 0FFFFh
and     dx, 0
mov     cx, [bp+var_2]
mov     bx, [bp+var_4]
and     bx, 0FFFFh
and     cx, 0
sub     ax, bx
sbb     dx, cx
mov     [bp+var_6], dx
mov     [bp+var_8], ax
jmp     short loc_24578

def_23F3E:              ; jumptable 00023F3E default case, cases 17-33
mov     dx, word ptr [bp+arg_0+2] ; jumptable 00024116 default case, cases 23-33,43-49,52-57
mov     ax, word ptr [bp+arg_0]
jmp     short loc_245BE

loc_24578:
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
les     bx, [bp+var_10]
mov     es:[bx+1], al
les     bx, [bp+arg_0]
mov     dx, es:[bx+4]
mov     ax, es:[bx+2]
les     bx, [bp+var_10]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
push    [bp+var_6]
push    [bp+var_8]
mov     al, es:[bx+1]
cbw
push    ax
call    sub_21DC9
les     bx, [bp+var_10]
mov     es:[bx+8], dx
mov     es:[bx+6], ax

loc_245B8:
mov     dx, word ptr [bp+var_10+2]
mov     ax, word ptr [bp+var_10]

loc_245BE:
pop     si
mov     sp, bp
pop     bp
retf    4
sub_23EE7 endp



; Attributes: bp-based frame

sub_245C5 proc near

var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  4
arg_4= dword ptr  8
arg_8= dword ptr  0Ch

push    bp
mov     bp, sp
sub     sp, 0Ch
push    si
les     bx, [bp+arg_8]
mov     al, es:[bx]
cbw
mov     si, ax
mov     dx, word ptr [bp+arg_4+2]
mov     ax, word ptr [bp+arg_4]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
mov     dx, word ptr [bp+arg_0+2]
mov     ax, word ptr [bp+arg_0]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
les     bx, [bp+arg_4]
les     bx, es:[bx+0Ah]
mov     word ptr [bp+var_C+2], es
mov     word ptr [bp+var_C], bx
cmp     byte ptr es:[bx], 2
jnz     short loc_24607
jmp     loc_246D3

loc_24607:
cmp     byte ptr es:[bx], 2Ch ; ','
jnz     short loc_24610
jmp     loc_246D3

loc_24610:
les     bx, [bp+arg_0]
mov     al, es:[bx]
cbw
cmp     ax, si
jz      short loc_2461E
jmp     loc_249DB

loc_2461E:
les     bx, [bp+arg_8]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 15h
jnz     short loc_24632
jmp     loc_249DB

loc_24632:
les     bx, [bp+arg_0]
les     bx, es:[bx+6]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
les     bx, [bp+arg_0]
les     bx, es:[bx+0Ah]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
les     bx, [bp+arg_4]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jnz     short loc_2466E
les     bx, [bp+var_4]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jz      short loc_24692

loc_2466E:
les     bx, [bp+arg_4]
mov     al, es:[bx+1]
les     bx, [bp+arg_0]
mov     es:[bx+1], al
les     bx, [bp+arg_4]
mov     dx, es:[bx+4]
mov     ax, es:[bx+2]
les     bx, [bp+arg_0]
mov     es:[bx+4], dx
mov     es:[bx+2], ax

loc_24692:
mov     dx, word ptr [bp+var_4+2]
mov     ax, word ptr [bp+var_4]
les     bx, [bp+arg_8]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
mov     dx, word ptr [bp+arg_0+2]
mov     ax, word ptr [bp+arg_0]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
mov     dx, word ptr [bp+var_8+2]
mov     ax, word ptr [bp+var_8]
les     bx, [bp+arg_0]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
mov     dx, word ptr [bp+arg_4+2]
mov     ax, word ptr [bp+arg_4]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
jmp     loc_249DB

loc_246D3:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 2
jz      short loc_246DF
jmp     loc_24764

loc_246DF:
les     bx, [bp+arg_8]
mov     al, es:[bx+1]
les     bx, [bp+arg_4]
mov     es:[bx+1], al
les     bx, [bp+arg_8]
mov     dx, es:[bx+4]
mov     ax, es:[bx+2]
les     bx, [bp+arg_4]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jnz     short loc_24738
les     bx, [bp+var_C]
mov     al, es:[bx+1]
les     bx, [bp+arg_8]
mov     es:[bx+1], al
les     bx, [bp+var_C]
mov     dx, es:[bx+4]
mov     ax, es:[bx+2]
les     bx, [bp+arg_8]
mov     es:[bx+4], dx
mov     es:[bx+2], ax

loc_24738:
mov     dx, word ptr [bp+var_C+2]
mov     ax, word ptr [bp+var_C]
les     bx, [bp+arg_8]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
push    word ptr [bp+arg_8+2]
push    bx
push    cs
call    near ptr sub_237EA
mov     word ptr [bp+arg_8+2], dx
mov     word ptr [bp+arg_8], ax
les     bx, [bp+arg_4]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
jmp     short loc_247CE

loc_24764:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 2Ch ; ','
jnz     short loc_247D7
les     bx, [bp+var_C]
cmp     byte ptr es:[bx], 2
jz      short loc_24779
jmp     loc_249DB

loc_24779:
mov     dx, word ptr [bp+var_C+2]
mov     ax, bx
les     bx, [bp+arg_8]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
mov     dx, word ptr [bp+arg_0+2]
mov     ax, word ptr [bp+arg_0]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
push    word ptr [bp+arg_8+2]
push    bx
push    cs
call    near ptr sub_237EA
les     bx, [bp+arg_4]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
les     bx, [bp+arg_8]
mov     al, es:[bx+1]
les     bx, [bp+arg_4]
mov     es:[bx+1], al
les     bx, [bp+arg_8]
mov     dx, es:[bx+4]
mov     ax, es:[bx+2]
les     bx, [bp+arg_4]
mov     es:[bx+4], dx
mov     es:[bx+2], ax

loc_247CE:
mov     dx, word ptr [bp+arg_4+2]
mov     ax, word ptr [bp+arg_4]
jmp     loc_249E1

loc_247D7:
les     bx, [bp+arg_0]
mov     al, es:[bx]
cbw
cmp     ax, si
jz      short loc_2483C
les     bx, [bp+var_C]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jnz     short loc_24804
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jz      short loc_24828

loc_24804:
les     bx, [bp+arg_0]
mov     al, es:[bx+1]
les     bx, [bp+arg_4]
mov     es:[bx+1], al
les     bx, [bp+arg_0]
mov     dx, es:[bx+4]
mov     ax, es:[bx+2]
les     bx, [bp+arg_4]
mov     es:[bx+4], dx
mov     es:[bx+2], ax

loc_24828:
mov     dx, word ptr [bp+arg_0+2]
mov     ax, word ptr [bp+arg_0]
les     bx, [bp+arg_4]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
jmp     loc_24917

loc_2483C:
les     bx, [bp+arg_0]
les     bx, es:[bx+6]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
les     bx, [bp+arg_0]
les     bx, es:[bx+0Ah]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
cmp     byte ptr es:[bx], 2
jnz     short loc_2485F
jmp     loc_2492B

loc_2485F:
cmp     byte ptr es:[bx], 2Ch ; ','
jnz     short loc_24868
jmp     loc_2492B

loc_24868:
les     bx, [bp+var_C]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jz      short loc_2489F
les     bx, [bp+var_8]
mov     al, es:[bx+1]
les     bx, [bp+arg_4]
mov     es:[bx+1], al
les     bx, [bp+var_8]
mov     dx, es:[bx+4]
mov     ax, es:[bx+2]
les     bx, [bp+arg_4]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
jmp     short loc_248D4

loc_2489F:
les     bx, [bp+arg_4]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jz      short loc_248D4
mov     bx, word ptr [bp+arg_4]
mov     al, es:[bx+1]
les     bx, [bp+arg_0]
mov     es:[bx+1], al
les     bx, [bp+arg_4]
mov     dx, es:[bx+4]
mov     ax, es:[bx+2]
les     bx, [bp+arg_0]
mov     es:[bx+4], dx
mov     es:[bx+2], ax

loc_248D4:
mov     dx, word ptr [bp+arg_4+2]
mov     ax, word ptr [bp+arg_4]
les     bx, [bp+arg_0]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
mov     dx, word ptr [bp+var_8+2]
mov     ax, word ptr [bp+var_8]
les     bx, [bp+arg_4]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
mov     dx, word ptr [bp+var_4+2]
mov     ax, word ptr [bp+var_4]
les     bx, [bp+arg_0]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
mov     dx, word ptr [bp+arg_0+2]
mov     ax, bx
les     bx, [bp+arg_8]
mov     es:[bx+8], dx
mov     es:[bx+6], ax

loc_24917:
mov     dx, word ptr [bp+var_C+2]
mov     ax, word ptr [bp+var_C]
les     bx, [bp+arg_8]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
jmp     loc_249DB

loc_2492B:
les     bx, [bp+var_4]
cmp     byte ptr es:[bx], 2
jnz     short loc_2498D
les     bx, [bp+arg_4]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jz      short loc_24956
les     bx, [bp+var_C]
mov     al, es:[bx+1]
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 14h
jz      short loc_2497A

loc_24956:
les     bx, [bp+var_8]
mov     al, es:[bx+1]
les     bx, [bp+arg_4]
mov     es:[bx+1], al
les     bx, [bp+var_8]
mov     dx, es:[bx+4]
mov     ax, es:[bx+2]
les     bx, [bp+arg_4]
mov     es:[bx+4], dx
mov     es:[bx+2], ax

loc_2497A:
mov     dx, word ptr [bp+var_C+2]
mov     ax, word ptr [bp+var_C]
les     bx, [bp+arg_0]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
jmp     short loc_249B5

loc_2498D:
les     bx, [bp+var_C]
cmp     byte ptr es:[bx], 2
jnz     short loc_249DB
mov     dx, word ptr [bp+var_4+2]
mov     ax, word ptr [bp+var_4]
les     bx, [bp+arg_0]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
mov     dx, word ptr [bp+var_C+2]
mov     ax, word ptr [bp+var_C]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax

loc_249B5:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
push    cs
call    near ptr sub_237EA
les     bx, [bp+arg_8]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
mov     dx, word ptr [bp+var_8+2]
mov     ax, word ptr [bp+var_8]
les     bx, [bp+arg_4]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax

loc_249DB:
mov     dx, word ptr [bp+arg_8+2]
mov     ax, word ptr [bp+arg_8]

loc_249E1:
pop     si
mov     sp, bp
pop     bp
retn    0Ch
sub_245C5 endp



; Attributes: bp-based frame

sub_249E8 proc far

arg_0= word ptr  6
arg_2= word ptr  8

push    bp
mov     bp, sp
push    si
mov     ax, [bp+arg_0]
or      ax, [bp+arg_2]
jz      short loc_24A2E
xor     si, si
jmp     short loc_24A09

loc_249F8:
mov     dx, [bp+arg_2]
mov     ax, [bp+arg_0]
shr     dx, 1
rcr     ax, 1
mov     [bp+arg_2], dx
mov     [bp+arg_0], ax
inc     si

loc_24A09:
mov     dx, [bp+arg_2]
mov     ax, [bp+arg_0]
and     ax, 1
and     dx, 0
or      dx, ax
jz      short loc_249F8
mov     dx, [bp+arg_2]
mov     ax, [bp+arg_0]
shr     dx, 1
rcr     ax, 1
mov     [bp+arg_2], dx
mov     [bp+arg_0], ax
or      ax, dx
jz      short loc_24A33

loc_24A2E:
mov     ax, 0FFFFh
jmp     short loc_24A35

loc_24A33:
mov     ax, si

loc_24A35:
pop     si
pop     bp
retf    4
sub_249E8 endp

seg006 ends


; Segment type: Pure code
seg007 segment byte public 'CODE' use16
assume cs:seg007
;org 0Ah
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing


; Attributes: bp-based frame

sub_24A3A proc far

var_A= dword ptr -0Ah
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  6

push    bp
mov     bp, sp
sub     sp, 0Ah
push    si
mov     si, [bp+arg_0]
les     bx, ds:9A70h
mov     word ptr [bp+var_A+2], es
mov     word ptr [bp+var_A], bx
mov     [bp+var_2], 0
mov     [bp+var_4], 0
call    sub_26945
mov     ah, 0
push    ax
call    sub_286AA
or      ax, ax
jnz     short loc_24A6C
jmp     loc_24B25

loc_24A6C:
or      si, si
jz      short loc_24A73
jmp     loc_24AFD

loc_24A73:
mov     ax, 15h
push    ax
call    sub_318B7
mov     word ptr [bp+var_A+2], dx
mov     word ptr [bp+var_A], ax
push    dx
push    ax
mov     ax, 15h
push    ax
mov     al, 0
push    ax
call    sub_46C10
mov     dx, ds:9A72h
mov     ax, ds:9A70h
les     bx, [bp+var_A]
mov     es:[bx+2], dx
mov     es:[bx], ax
or      ax, dx
jz      short loc_24AD8
les     bx, ds:9A70h
mov     ax, es:[bx+0Ch]
or      ax, es:[bx+0Eh]
jz      short loc_24AC6
mov     dx, es:[bx+0Eh]
mov     ax, es:[bx+0Ch]
les     bx, [bp+var_A]
mov     es:[bx+12h], dx
mov     es:[bx+10h], ax

loc_24AC6:
mov     dx, word ptr [bp+var_A+2]
mov     ax, word ptr [bp+var_A]
les     bx, ds:9A70h
mov     es:[bx+0Eh], dx
mov     es:[bx+0Ch], ax

loc_24AD8:
les     bx, [bp+var_A]
mov     word ptr ds:9A72h, es
mov     ds:9A70h, bx
mov     si, 1
cmp     byte ptr ds:22C0h, 0
jz      short loc_24AFD
push    word ptr ds:9A72h
push    bx
call    sub_2EDE8
mov     [bp+var_2], dx
mov     [bp+var_4], ax

loc_24AFD:
call    sub_28F70
cmp     byte ptr ds:0BED2h, 7
jz      short loc_24B14
mov     ax, 8Fh
push    ax
call    sub_28E99
inc     sp
inc     sp

loc_24B14:
call    sub_26945
mov     ah, 0
push    ax
call    sub_286AA
or      ax, ax
jnz     short loc_24AFD

loc_24B25:
mov     [bp+var_6], 1
jmp     short loc_24B3E

loc_24B2C:
call    sub_2693F
push    ss
lea     ax, [bp+var_6]
push    ax
call    sub_24BED
call    sub_26945

loc_24B3E:
cmp     byte ptr ds:0BED2h, 6
jz      short loc_24B4C
cmp     byte ptr ds:0BED2h, 0
jnz     short loc_24B2C

loc_24B4C:
mov     ax, ds:0BE1Dh
mov     ds:0BFB4h, ax
call    sub_2AEAA
cmp     byte ptr ds:0BED2h, 6
jz      short loc_24B69
mov     ax, 7Ah ; 'z'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_24B69:
or      si, si
jz      short loc_24B99
les     bx, [bp+var_A]
les     bx, es:[bx]
mov     word ptr ds:9A72h, es
mov     ds:9A70h, bx
push    word ptr [bp+var_A+2]
push    word ptr [bp+var_A]
call    sub_1FB9E
mov     ax, [bp+var_4]
or      ax, [bp+var_2]
jz      short loc_24B99
push    [bp+var_2]
push    [bp+var_4]
call    sub_2EE25

loc_24B99:
mov     ax, [bp+var_6]
pop     si
mov     sp, bp
pop     bp
retf    2
sub_24A3A endp




sub_24BA3 proc near
cmp     byte ptr ds:22C2h, 0
jz      short locret_24BBD
cmp     word ptr ds:0BDABh, 1FFFh
jg      short locret_24BBD
mov     ax, ds:0BDABh
mov     dx, 3
mul     dx
mov     ds:0BDABh, ax

locret_24BBD:
retn
sub_24BA3 endp




sub_24BBE proc near
cmp     word ptr ds:0BDABh, 1
jle     short locret_24BD1
mov     ax, ds:0BDABh
mov     bx, 3
cwd
idiv    bx
mov     ds:0BDABh, ax

locret_24BD1:
retn
sub_24BBE endp



; Attributes: bp-based frame

sub_24BD2 proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
les     bx, [bp+arg_0]
cmp     word ptr es:[bx], 0
jnz     short loc_24BE9
mov     ax, 0B2h
push    ax
call    sub_31324
mov     sp, bp

loc_24BE9:
pop     bp
retn    4
sub_24BD2 endp



; Attributes: bp-based frame

sub_24BED proc near

var_44= word ptr -44h
var_42= word ptr -42h
var_40= dword ptr -40h
var_3C= word ptr -3Ch
var_3A= word ptr -3Ah
var_38= dword ptr -38h
var_34= dword ptr -34h
var_30= dword ptr -30h
var_2C= word ptr -2Ch
var_2A= word ptr -2Ah
var_28= word ptr -28h
var_26= word ptr -26h
var_24= word ptr -24h
var_22= dword ptr -22h
var_1E= dword ptr -1Eh
var_1A= word ptr -1Ah
var_18= word ptr -18h
var_16= word ptr -16h
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
arg_0= dword ptr  4

push    bp
mov     bp, sp
sub     sp, 44h
push    si
push    di

loc_24BF5:
call    sub_1BA0B
mov     [bp+var_18], 0
mov     [bp+var_1A], 0
call    sub_26945
mov     ax, ds:0BE1Dh
mov     ds:0BFB4h, ax
call    sub_2AEAA
mov     ax, ds:0BED4h
mov     [bp+var_E], ax
mov     si, ds:0BED6h
mov     al, ds:0BED2h
mov     ah, 0
cmp     ax, 54h ; 'T'
jnz     short loc_24C2B
jmp     loc_24F7E

loc_24C2B:
jg      short loc_24C80
cmp     ax, 2Fh ; '/'
jnz     short loc_24C35
jmp     loc_258B3

loc_24C35:
jg      short loc_24C58
cmp     ax, 7           ; switch 8 cases
jbe     short loc_24C3F
jmp     def_24C43       ; jumptable 00024C43 default case, cases 1-4
                        ; jumptable 00024C8F default case

loc_24C3F:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_24C43[bx] ; switch jump
jpt_24C43 dw offset loc_24E28 ; jump table for switch statement
dw offset def_24C43
dw offset def_24C43
dw offset def_24C43
dw offset def_24C43
dw offset loc_2583D
dw offset loc_24E23
dw offset loc_25933

loc_24C58:
cmp     ax, 52h ; 'R'
jnz     short loc_24C60
jmp     loc_24E55

loc_24C60:
jg      short loc_24C75
cmp     ax, 34h ; '4'
jnz     short loc_24C6A
jmp     loc_24E36

loc_24C6A:
cmp     ax, 51h ; 'Q'
jnz     short loc_24C72
jmp     loc_25856

loc_24C72:              ; jumptable 00024C43 default case, cases 1-4
jmp     def_24C43       ; jumptable 00024C8F default case

loc_24C75:
cmp     ax, 53h ; 'S'
jnz     short loc_24C7D
jmp     loc_24E47

loc_24C7D:              ; jumptable 00024C43 default case, cases 1-4
jmp     def_24C43       ; jumptable 00024C8F default case

loc_24C80:              ; switch 8 cases
sub     ax, 55h ; 'U'
cmp     ax, 7
jbe     short loc_24C8B
jmp     def_24C43       ; jumptable 00024C43 default case, cases 1-4
                        ; jumptable 00024C8F default case

loc_24C8B:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_24C8F[bx] ; switch jump
jpt_24C8F dw offset loc_25336 ; jump table for switch statement
dw offset loc_2521A
dw offset loc_25476
dw offset loc_256B2
dw offset loc_255E2
dw offset loc_2564F
dw offset loc_24DAB
dw offset loc_24CA4

loc_24CA4:              ; jumptable 00024C8F case 92
les     bx, [bp+arg_0]
mov     word ptr es:[bx], 1
call    sub_26945
mov     ax, 3
push    ax
call    sub_23348
or      ax, ax
jnz     short loc_24CC1
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_24CC1:
call    sub_29B45
mov     [bp+var_42], dx
mov     [bp+var_44], ax
mov     ax, ds:0BDB1h
or      ax, ds:0BDB3h
jnz     short loc_24CE3
mov     ax, 7Bh ; '{'
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_24D9D

loc_24CE3:
les     bx, ds:0BDB1h
cmp     word ptr es:[bx+14h], 101h
jl      short loc_24CF2
jmp     loc_24D92

loc_24CF2:
les     bx, es:[bx+1Ah]
mov     word ptr [bp+var_1E+2], es
mov     word ptr [bp+var_1E], bx
jmp     short loc_24D2B

loc_24CFE:
les     bx, [bp+var_1E]
mov     ax, es:[bx+4]
cwd
cmp     dx, ds:0BEDAh
jnz     short loc_24D1F
cmp     ax, ds:0BED8h
jnz     short loc_24D1F
mov     ax, 7Ch ; '|'
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     short loc_24D33

loc_24D1F:
les     bx, [bp+var_1E]
les     bx, es:[bx]
mov     word ptr [bp+var_1E+2], es
mov     word ptr [bp+var_1E], bx

loc_24D2B:
mov     ax, word ptr [bp+var_1E]
or      ax, word ptr [bp+var_1E+2]
jnz     short loc_24CFE

loc_24D33:
mov     ax, word ptr [bp+var_1E]
or      ax, word ptr [bp+var_1E+2]
jz      short loc_24D3E
jmp     loc_24BF5

loc_24D3E:
mov     ax, 0Ah
push    ax
call    sub_318B7
mov     word ptr [bp+var_1E+2], dx
mov     word ptr [bp+var_1E], ax
les     bx, ds:0BDB1h
mov     dx, es:[bx+1Ch]
mov     ax, es:[bx+1Ah]
les     bx, [bp+var_1E]
mov     es:[bx+2], dx
mov     es:[bx], ax
mov     dx, word ptr [bp+var_1E+2]
mov     ax, bx
les     bx, ds:0BDB1h
mov     es:[bx+1Ch], dx
mov     es:[bx+1Ah], ax
inc     word ptr es:[bx+14h]
mov     dx, [bp+var_42]
mov     ax, [bp+var_44]
les     bx, [bp+var_1E]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
mov     ax, ds:0BED8h
mov     es:[bx+4], ax
jmp     short loc_24D9D

loc_24D92:
mov     ax, 7Dh ; '}'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_24D9D:
push    [bp+var_42]
push    [bp+var_44]
call    sub_2ED30
jmp     loc_24BF5

loc_24DAB:              ; jumptable 00024C8F case 91
les     bx, [bp+arg_0]
mov     word ptr es:[bx], 1
call    sub_26945
cmp     al, 1Fh
jz      short loc_24DCF
mov     ax, 7Eh ; '~'
push    ax
call    sub_312DE
inc     sp
inc     sp
call    sub_2693F
jmp     loc_24BF5

loc_24DCF:
mov     ax, ds:0BDB1h
or      ax, ds:0BDB3h
jnz     short loc_24DE6
mov     ax, 7Fh
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_24BF5

loc_24DE6:
les     bx, ds:0BDB1h
mov     ax, es:[bx+16h]
or      ax, es:[bx+18h]
jz      short loc_24E02
mov     ax, 80h
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_24BF5

loc_24E02:
call    sub_29B45
les     bx, ds:0BDB1h
mov     es:[bx+18h], dx
mov     es:[bx+16h], ax
push    word ptr es:[bx+18h]
push    word ptr es:[bx+16h]
call    sub_2ED30
jmp     loc_24BF5

loc_24E23:              ; jumptable 00024C43 case 6
call    sub_2693F

loc_24E28:              ; jumptable 00024C43 case 0
mov     ax, 8Bh
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_24E36:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_24BD2
call    sub_3B37D
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_24E47:
mov     ax, 81h
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_24BF5

loc_24E55:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_24BD2
mov     [bp+var_14], ds
mov     [bp+var_16], 4B88h
call    sub_26945
cmp     al, 1
jz      short loc_24E72
jmp     loc_25490

loc_24E72:
call    sub_26945
call    sub_29B45
mov     [bp+var_42], dx
mov     [bp+var_44], ax
xor     ax, ax
push    ax
push    ax
push    ax
call    sub_23062
mov     word ptr [bp+var_38+2], dx
mov     word ptr [bp+var_38], ax
or      ax, dx
jnz     short loc_24E99
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_24E99:
push    dx
push    word ptr [bp+var_38]
push    [bp+var_42]
push    [bp+var_44]
push    [bp+var_E]
push    si
push    word ptr ds:0BED4h
push    word ptr ds:0BED6h
call    sub_2E6C6
mov     [bp+var_4], ax
or      ax, ax
jl      short loc_24EC0
mov     ax, 1
jmp     short loc_24EC2

loc_24EC0:
xor     ax, ax

loc_24EC2:
les     bx, [bp+arg_0]
mov     es:[bx], ax
cmp     byte ptr ds:0BED2h, 2
jz      short loc_24ED2
jmp     loc_25507

loc_24ED2:
push    word ptr [bp+arg_0+2]
push    bx
call    sub_24BED
mov     ax, ds:0BED4h
mov     [bp+var_E], ax
mov     si, ds:0BED6h
call    sub_26945
cmp     al, 53h ; 'S'
jnz     short loc_24F5D
les     bx, [bp+arg_0]
mov     ax, es:[bx]
mov     [bp+var_2], ax
cmp     [bp+var_4], 0
jnz     short loc_24F02
mov     word ptr es:[bx], 0
jmp     short loc_24F0A

loc_24F02:
les     bx, [bp+arg_0]
mov     word ptr es:[bx], 1

loc_24F0A:
call    sub_29B45
mov     word ptr [bp+var_40+2], dx
mov     word ptr [bp+var_40], ax
push    dx
push    ax
push    [bp+var_E]
push    si
call    sub_2EC34
push    [bp+var_42]
push    [bp+var_44]
call    sub_2ED30
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_24BED
push    word ptr [bp+var_40+2]
push    word ptr [bp+var_40]
call    sub_2ED30
cmp     [bp+var_4], 0
jnz     short loc_24F51
mov     ax, [bp+var_2]
les     bx, [bp+arg_0]
mov     es:[bx], ax
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_24F51:
mov     ax, [bp+var_2]
les     bx, [bp+arg_0]
or      es:[bx], ax
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_24F5D:
cmp     [bp+var_4], 0
jz      short loc_24F6B
les     bx, [bp+arg_0]
mov     word ptr es:[bx], 1

loc_24F6B:
call    sub_2693F
push    [bp+var_42]
push    [bp+var_44]
call    sub_2ED30
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_24F7E:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_24BD2
mov     [bp+var_14], ds
mov     [bp+var_16], 4B8Bh
call    sub_26945
cmp     al, 1
jz      short loc_24F9B
jmp     loc_25490

loc_24F9B:
call    sub_26945
cmp     al, 7
jz      short loc_24FE3
xor     ax, ax
push    ax
push    ax
push    ax
call    sub_23062
mov     word ptr [bp+var_38+2], dx
mov     word ptr [bp+var_38], ax
or      ax, dx
jnz     short loc_24FBB
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_24FBB:
push    dx
push    word ptr [bp+var_38]
push    [bp+var_E]
push    si
push    word ptr ds:0BED4h
push    word ptr ds:0BED6h
call    sub_2E58A
mov     ax, ds:0BED4h
mov     [bp+var_E], ax
mov     si, ds:0BED6h
cmp     byte ptr ds:0BED2h, 7
jz      short loc_24FE8
jmp     short loc_2502C

loc_24FE3:
mov     [bp+var_E], 0

loc_24FE8:
call    sub_24BA3
call    sub_26945
cmp     al, 7
jnz     short loc_24FF7
jmp     loc_2506B

loc_24FF7:
mov     di, ds:0BED4h
mov     ax, ds:0BED6h
mov     [bp+var_C], ax
cmp     si, ax
jnz     short loc_2500E
mov     ax, [bp+var_E]
cmp     ax, di
jnz     short loc_2500E
xor     di, di

loc_2500E:
xor     ax, ax
push    ax
push    ax
push    ax
call    sub_23062
mov     word ptr [bp+var_38+2], dx
mov     word ptr [bp+var_38], ax
or      ax, dx
jnz     short loc_25025
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_25025:
cmp     byte ptr ds:0BED2h, 7
jz      short loc_25041

loc_2502C:
push    [bp+var_14]
push    [bp+var_16]
mov     ax, 84h
push    ax
call    sub_28E99
add     sp, 6
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_25041:
or      di, di
jz      short loc_25053
mov     ax, ds:0BED4h
mov     [bp+var_A], ax
mov     ax, ds:0BED6h
mov     [bp+var_8], ax
jmp     short loc_25058

loc_25053:
mov     [bp+var_A], 0

loc_25058:
push    word ptr [bp+var_38+2]
push    word ptr [bp+var_38]
call    sub_2E8D5
mov     word ptr [bp+var_38+2], dx
mov     word ptr [bp+var_38], ax
jmp     short loc_25075

loc_2506B:
mov     word ptr [bp+var_38+2], 0
mov     word ptr [bp+var_38], 0

loc_25075:
call    sub_26945
cmp     al, 2
jz      short loc_250F1
les     bx, ds:0BFACh
mov     [bp+var_10], es
mov     [bp+var_12], bx
call    sub_2AEAA
mov     ax, ds:0BFB6h
mov     [bp+var_6], ax
cmp     si, ds:0BED6h
jnz     short loc_250A2
mov     ax, [bp+var_E]
cmp     ax, ds:0BED4h
jz      short loc_250AE

loc_250A2:
mov     ax, ds:0BED4h
mov     [bp+var_E], ax
mov     si, ds:0BED6h
jmp     short loc_250B3

loc_250AE:
mov     [bp+var_E], 0

loc_250B3:
xor     ax, ax
push    ax
push    ax
push    ax
call    sub_23062
mov     word ptr [bp+var_34+2], dx
mov     word ptr [bp+var_34], ax
or      ax, dx
jnz     short loc_250CA
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_250CA:
cmp     byte ptr ds:0BED2h, 2
jz      short loc_250D4
jmp     loc_25507

loc_250D4:
push    dx
push    word ptr [bp+var_34]
push    [bp+var_E]
push    si
push    word ptr ds:0BED4h
push    word ptr ds:0BED6h
call    sub_2E600
mov     [bp+var_3A], dx
mov     [bp+var_3C], ax
jmp     short loc_250FB

loc_250F1:
mov     [bp+var_3A], 0
mov     [bp+var_3C], 0

loc_250FB:
les     bx, ds:0BDADh
mov     word ptr [bp+var_30+2], es
mov     word ptr [bp+var_30], bx
mov     bx, ss
mov     es, bx
lea     bx, [bp+var_30]
mov     word ptr ds:0BDAFh, es
mov     ds:0BDADh, bx
call    sub_29B45
mov     [bp+var_2A], dx
mov     [bp+var_2C], ax
call    sub_29B45
mov     [bp+var_26], dx
mov     [bp+var_28], ax
mov     [bp+var_24], 0
call    sub_29B45
mov     word ptr [bp+var_40+2], dx
mov     word ptr [bp+var_40], ax
mov     ax, word ptr [bp+var_38]
or      ax, word ptr [bp+var_38+2]
jz      short loc_25158
call    sub_29B45
mov     [bp+var_42], dx
mov     [bp+var_44], ax
push    dx
push    ax
xor     ax, ax
push    ax
push    ax
call    sub_2EC34

loc_25158:
mov     ax, word ptr [bp+var_38]
or      ax, word ptr [bp+var_38+2]
jz      short loc_2517D
les     bx, [bp+var_38]
cmp     byte ptr es:[bx], 2
jnz     short loc_2517D
mov     ax, es:[bx+6]
or      ax, es:[bx+8]
jnz     short loc_2517D
les     bx, [bp+arg_0]
mov     word ptr es:[bx], 0
jmp     short loc_25188

loc_2517D:
push    word ptr [bp+var_40+2]
push    word ptr [bp+var_40]
call    sub_2ED30

loc_25188:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_24BED
push    [bp+var_26]
push    [bp+var_28]
call    sub_2ED30
mov     ax, [bp+var_3C]
or      ax, [bp+var_3A]
jz      short loc_251B8
push    [bp+var_3A]
push    [bp+var_3C]
push    [bp+var_10]
push    [bp+var_12]
push    [bp+var_6]
call    sub_2E675

loc_251B8:
mov     ax, word ptr [bp+var_38]
or      ax, word ptr [bp+var_38+2]
jz      short loc_251F1
push    [bp+var_42]
push    [bp+var_44]
call    sub_2ED30
push    word ptr [bp+var_38+2]
push    word ptr [bp+var_38]
push    word ptr [bp+var_40+2]
push    word ptr [bp+var_40]
push    di
push    [bp+var_C]
push    [bp+var_A]
push    [bp+var_8]
call    sub_2E900
or      ax, ax
jl      short loc_25200
mov     [bp+var_24], 1
jmp     short loc_25200

loc_251F1:
push    word ptr [bp+var_40+2]
push    word ptr [bp+var_40]
xor     ax, ax
push    ax
push    ax
call    sub_2EC34

loc_25200:
call    sub_24BBE
mov     ax, [bp+var_24]
les     bx, [bp+arg_0]
mov     es:[bx], ax
les     bx, [bp+var_30]
mov     word ptr ds:0BDAFh, es
mov     ds:0BDADh, bx
jmp     loc_25468

loc_2521A:              ; jumptable 00024C8F case 86
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_24BD2
mov     [bp+var_14], ds
mov     [bp+var_16], 4B8Fh
les     bx, ds:0BDADh
mov     word ptr [bp+var_30+2], es
mov     word ptr [bp+var_30], bx
mov     bx, ss
mov     es, bx
lea     bx, [bp+var_30]
mov     word ptr ds:0BDAFh, es
mov     ds:0BDADh, bx
call    sub_29B45
mov     [bp+var_26], dx
mov     [bp+var_28], ax
call    sub_29B45
mov     [bp+var_2A], dx
mov     [bp+var_2C], ax
mov     [bp+var_24], 0
call    sub_29B45
mov     [bp+var_42], dx
mov     [bp+var_44], ax
push    dx
push    ax
call    sub_2ED30
call    sub_24BA3
les     bx, [bp+arg_0]
mov     word ptr es:[bx], 1
push    word ptr [bp+arg_0+2]
push    bx
call    sub_24BED
call    sub_26945
cmp     al, 55h ; 'U'
jz      short loc_2529A
mov     ax, 85h
push    ax
call    sub_28E99
inc     sp
inc     sp
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_2529A:
mov     ax, ds:0BED4h
mov     [bp+var_E], ax
mov     si, ds:0BED6h
call    sub_26945
cmp     al, 1
jz      short loc_252B0
jmp     loc_25490

loc_252B0:
call    sub_26945
les     bx, [bp+var_30]
mov     word ptr ds:0BDAFh, es
mov     ds:0BDADh, bx
push    [bp+var_26]
push    [bp+var_28]
call    sub_2ED30
xor     ax, ax
push    ax
push    ax
push    ax
call    sub_23062
mov     word ptr [bp+var_38+2], dx
mov     word ptr [bp+var_38], ax
or      ax, dx
jnz     short loc_252E2
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_252E2:
push    dx
push    word ptr [bp+var_38]
push    [bp+var_42]
push    [bp+var_44]
push    [bp+var_E]
push    si
push    word ptr ds:0BED4h
push    word ptr ds:0BED6h
call    sub_2E8AA
or      ax, ax
jl      short loc_25306
mov     [bp+var_24], 1

loc_25306:
call    sub_24BBE
mov     ax, [bp+var_24]
les     bx, [bp+arg_0]
mov     es:[bx], ax
push    [bp+var_2A]
push    [bp+var_2C]
call    sub_2ED30
cmp     byte ptr ds:0BED2h, 2
jz      short loc_25327
jmp     loc_25507

loc_25327:
call    sub_26945
cmp     al, 7
jnz     short loc_25333
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_25333:
jmp     loc_2502C

loc_25336:              ; jumptable 00024C8F case 85
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_24BD2
mov     [bp+var_14], ds
mov     [bp+var_16], 4B98h
call    sub_26945
cmp     al, 1
jz      short loc_25353
jmp     loc_25490

loc_25353:
call    sub_26945
les     bx, ds:0BDADh
mov     word ptr [bp+var_30+2], es
mov     word ptr [bp+var_30], bx
mov     bx, ss
mov     es, bx
lea     bx, [bp+var_30]
mov     word ptr ds:0BDAFh, es
mov     ds:0BDADh, bx
call    sub_29B45
mov     [bp+var_26], dx
mov     [bp+var_28], ax
call    sub_29B45
mov     [bp+var_2A], dx
mov     [bp+var_2C], ax
mov     [bp+var_24], 0
les     bx, [bp+arg_0]
mov     word ptr es:[bx], 1
xor     ax, ax
push    ax
push    ax
push    ax
call    sub_23062
mov     word ptr [bp+var_38+2], dx
mov     word ptr [bp+var_38], ax
or      ax, dx
jnz     short loc_253AB
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_253AB:
cmp     byte ptr ds:0BED2h, 2
jz      short loc_253B5
jmp     loc_25507

loc_253B5:
call    sub_24BA3
mov     ax, ds:0BED4h
mov     [bp+var_A], ax
mov     ax, ds:0BED6h
mov     [bp+var_8], ax
push    word ptr [bp+var_38+2]
push    word ptr [bp+var_38]
call    sub_2E8D5
mov     word ptr [bp+var_38+2], dx
mov     word ptr [bp+var_38], ax
push    [bp+var_26]
push    [bp+var_28]
xor     ax, ax
push    ax
push    ax
call    sub_2EC34
mov     word ptr [bp+var_40+2], dx
mov     word ptr [bp+var_40], ax
call    sub_29B45
mov     [bp+var_42], dx
mov     [bp+var_44], ax
push    dx
push    ax
call    sub_2ED30
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_24BED
call    sub_24BBE
mov     ax, ds:0BED6h
cmp     ax, si
jnz     short loc_25425
mov     ax, ds:0BED4h
cmp     ax, [bp+var_E]
jnz     short loc_25425
mov     al, byte ptr [bp+var_E]
les     bx, [bp+var_40]
mov     es:[bx+1], al
mov     es:[bx+12h], si

loc_25425:
les     bx, [bp+var_30]
mov     word ptr ds:0BDAFh, es
mov     ds:0BDADh, bx
push    [bp+var_26]
push    [bp+var_28]
call    sub_2ED30
push    word ptr [bp+var_38+2]
push    word ptr [bp+var_38]
push    [bp+var_42]
push    [bp+var_44]
push    [bp+var_E]
push    si
push    [bp+var_A]
push    [bp+var_8]
call    sub_2E900
or      ax, ax
jl      short loc_2545F
mov     [bp+var_24], 1

loc_2545F:
mov     ax, [bp+var_24]
les     bx, [bp+arg_0]
mov     es:[bx], ax

loc_25468:
push    [bp+var_2A]
push    [bp+var_2C]
call    sub_2ED30
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_25476:              ; jumptable 00024C8F case 87
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_24BD2
mov     [bp+var_14], ds
mov     [bp+var_16], 4B9Eh
call    sub_26945
cmp     al, 1
jz      short loc_254A5

loc_25490:
push    [bp+var_14]
push    [bp+var_16]
mov     ax, 82h
push    ax
call    sub_28E99
add     sp, 6
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_254A5:
call    sub_26945
xor     ax, ax
push    ax
push    ax
push    ax
call    sub_23062
mov     word ptr [bp+var_38+2], dx
mov     word ptr [bp+var_38], ax
or      ax, dx
jnz     short loc_254C1
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_254C1:
push    dx
push    word ptr [bp+var_38]
push    word ptr ds:0BD80h
push    word ptr ds:0BD7Eh
xor     ax, ax
push    ax
mov     ax, 6Bh ; 'k'
push    ax
mov     ax, 0A4h
push    ax
call    sub_21215
mov     word ptr [bp+var_38+2], dx
mov     word ptr [bp+var_38], ax
les     bx, ds:0BDB1h
mov     word ptr [bp+var_22+2], es
mov     word ptr [bp+var_22], bx
push    dx
push    ax
push    [bp+var_E]
push    si
push    word ptr ds:0BED4h
push    word ptr ds:0BED6h
call    sub_2EE80
cmp     byte ptr ds:0BED2h, 2
jz      short loc_2551C

loc_25507:
push    [bp+var_14]
push    [bp+var_16]
mov     ax, 83h
push    ax
call    sub_28E99
add     sp, 6
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_2551C:
call    sub_29B45
mov     [bp+var_2A], dx
mov     [bp+var_2C], ax
mov     ax, ds:0BDADh
or      ax, ds:0BDAFh
jz      short loc_25540
les     bx, ds:0BDADh
les     bx, es:[bx+8]
mov     [bp+var_26], es
mov     [bp+var_28], bx
jmp     short loc_2554A

loc_25540:
mov     [bp+var_26], 0
mov     [bp+var_28], 0

loc_2554A:
les     bx, ds:0BDADh
mov     word ptr [bp+var_30+2], es
mov     word ptr [bp+var_30], bx
mov     [bp+var_24], 0
mov     bx, ss
mov     es, bx
lea     bx, [bp+var_30]
mov     word ptr ds:0BDAFh, es
mov     ds:0BDADh, bx
les     bx, [bp+arg_0]
mov     word ptr es:[bx], 1
push    word ptr [bp+arg_0+2]
push    bx
call    sub_24BED
les     bx, ds:0BDB1h
mov     ax, es:[bx+16h]
or      ax, es:[bx+18h]
jnz     short loc_255A5
call    sub_29B45
les     bx, ds:0BDB1h
mov     es:[bx+18h], dx
mov     es:[bx+16h], ax
push    word ptr es:[bx+18h]
push    word ptr es:[bx+16h]
call    sub_2ED30
jmp     short loc_255AB

loc_255A5:
cmp     [bp+var_24], 0
jz      short loc_255B3

loc_255AB:
les     bx, [bp+arg_0]
mov     word ptr es:[bx], 1

loc_255B3:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_2EF24
push    [bp+var_2A]
push    [bp+var_2C]
call    sub_2ED30
les     bx, [bp+var_22]
mov     word ptr ds:0BDB3h, es
mov     ds:0BDB1h, bx
les     bx, [bp+var_30]
mov     word ptr ds:0BDAFh, es
mov     ds:0BDADh, bx
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_255E2:              ; jumptable 00024C8F case 89
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_24BD2
call    sub_26945
cmp     al, 7
jz      short loc_25608
push    ds
mov     ax, 4BA5h
push    ax
mov     ax, 84h
push    ax
call    sub_28E99
add     sp, 6
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_25608:
mov     ax, ds:0BDADh
or      ax, ds:0BDAFh
jz      short loc_2561F
les     bx, ds:0BDADh
mov     ax, es:[bx+4]
or      ax, es:[bx+6]
jnz     short loc_2562D

loc_2561F:
mov     ax, 88h
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_258A8

loc_2562D:
les     bx, ds:0BDADh
push    word ptr es:[bx+6]
push    word ptr es:[bx+4]
push    [bp+var_E]
push    si
call    sub_2EC34
les     bx, ds:0BDADh
mov     word ptr es:[bx+0Ch], 1
jmp     loc_258A8

loc_2564F:              ; jumptable 00024C8F case 90
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_24BD2
call    sub_26945
cmp     al, 7
jz      short loc_25675
push    ds
mov     ax, 4BABh
push    ax
mov     ax, 84h
push    ax
call    sub_28E99
add     sp, 6
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_25675:
mov     ax, ds:0BDADh
or      ax, ds:0BDAFh
jz      short loc_2568C
les     bx, ds:0BDADh
mov     ax, es:[bx+8]
or      ax, es:[bx+0Ah]
jnz     short loc_2569A

loc_2568C:
mov     ax, 89h
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_258A8

loc_2569A:
les     bx, ds:0BDADh
push    word ptr es:[bx+0Ah]
push    word ptr es:[bx+8]
push    [bp+var_E]
push    si
call    sub_2EC34
jmp     loc_258A8

loc_256B2:              ; jumptable 00024C8F case 88
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_24BD2
les     bx, [bp+arg_0]
mov     word ptr es:[bx], 0
call    sub_26945
cmp     al, 7
jnz     short loc_256CF
jmp     loc_257E7

loc_256CF:
xor     ax, ax
push    ax
push    ax
push    ax
call    sub_23062
mov     word ptr [bp+var_38+2], dx
mov     word ptr [bp+var_38], ax
or      ax, dx
jnz     short loc_256E6
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_256E6:
les     bx, ds:0BF0Fh
cmp     byte ptr es:[bx+4], 0Fh
jnz     short loc_256FE
mov     ax, 0ADh
push    ax
call    sub_31324
inc     sp
inc     sp
jmp     short loc_25717

loc_256FE:
push    word ptr [bp+var_38+2]
push    word ptr [bp+var_38]
push    word ptr ds:0BF11h
push    word ptr ds:0BF0Fh
call    sub_20D7E
mov     word ptr [bp+var_38+2], dx
mov     word ptr [bp+var_38], ax

loc_25717:
les     bx, [bp+var_38]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
call    sub_3B34A
or      ax, ax
jz      short loc_2579F
les     bx, [bp+var_38]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    ds
mov     ax, 67FEh
push    ax
call    sub_299B0
mov     word ptr [bp+var_34+2], dx
mov     word ptr [bp+var_34], ax
mov     ax, ds:0BF0Bh
les     bx, [bp+var_34]
mov     es:[bx+0Ah], ax
mov     ax, 17h
push    ax
push    dx
push    bx
push    word ptr [bp+var_38+2]
push    word ptr [bp+var_38]
call    sub_1FF72
mov     word ptr [bp+var_38+2], dx
mov     word ptr [bp+var_38], ax
push    dx
push    ax
push    [bp+var_E]
push    si
push    word ptr ds:0BED4h
push    word ptr ds:0BED6h
call    sub_2E58A
les     bx, [bp+var_38]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    ds
mov     ax, 67FEh
push    ax
call    sub_299B0
mov     word ptr [bp+var_38+2], dx
mov     word ptr [bp+var_38], ax
mov     ax, ds:0BF0Bh
les     bx, [bp+var_38]
mov     es:[bx+0Ah], ax

loc_2579F:
push    word ptr [bp+var_38+2]
push    word ptr [bp+var_38]
push    [bp+var_E]
push    si
push    word ptr ds:0BED4h
push    word ptr ds:0BED6h
call    sub_2EB1E
cmp     byte ptr ds:0BF13h, 1
jnz     short loc_257C8
mov     ax, 0AEh
push    ax
call    sub_31324
inc     sp
inc     sp

loc_257C8:
mov     byte ptr ds:0BF13h, 2
cmp     byte ptr ds:0BED2h, 7
jz      short loc_25829
push    ds
mov     ax, 4BB4h
push    ax
mov     ax, 84h
push    ax
call    sub_28E99
add     sp, 6
jmp     short loc_25829

loc_257E7:
mov     dx, ds:0BF11h
mov     ax, ds:0BF0Fh
cmp     dx, ds:0BD80h
jnz     short loc_257FA
cmp     ax, ds:0BD7Eh
jz      short loc_25812

loc_257FA:
les     bx, ds:0BF0Fh
cmp     byte ptr es:[bx+4], 0Fh
jz      short loc_25812
mov     ax, 0AFh
push    ax
call    sub_31324
inc     sp
inc     sp
jmp     short loc_25824

loc_25812:
cmp     byte ptr ds:0BF13h, 2
jnz     short loc_25824
mov     ax, 0AEh
push    ax
call    sub_31324
inc     sp
inc     sp

loc_25824:
mov     byte ptr ds:0BF13h, 1

loc_25829:
push    word ptr ds:0BF09h
push    word ptr ds:0BF07h
xor     ax, ax
push    ax
push    ax
call    sub_2EC34
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_2583D:              ; jumptable 00024C43 case 5
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_24BD2
xor     ax, ax
push    ax
push    cs
call    near ptr sub_24A3A
les     bx, [bp+arg_0]
mov     es:[bx], ax
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_25856:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_24BD2
call    sub_26945
cmp     al, 2Fh ; '/'
jz      short loc_25876
mov     ax, 8Ah
push    ax
call    sub_28E99
inc     sp
inc     sp
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_25876:
push    word ptr ds:0BEDAh
push    word ptr ds:0BED8h
call    sub_2DAF2
push    dx
push    ax
push    [bp+var_E]
push    si
call    sub_2EC34
call    sub_26945
cmp     al, 7
jz      short loc_258A8
push    ds
mov     ax, 4BBBh
push    ax
mov     ax, 84h
push    ax
call    sub_28E99
add     sp, 6

loc_258A8:
les     bx, [bp+arg_0]
mov     word ptr es:[bx], 0
jmp     loc_25933       ; jumptable 00024C43 case 7

loc_258B3:
les     bx, ds:0BED8h
mov     [bp+var_18], es
mov     [bp+var_1A], bx
call    sub_26945
cmp     al, 1Fh
jnz     short def_24C43 ; jumptable 00024C43 default case, cases 1-4
                        ; jumptable 00024C8F default case
push    [bp+var_18]
push    [bp+var_1A]
call    sub_2DB84
push    dx
push    ax
call    sub_2ED30
les     bx, [bp+arg_0]
mov     word ptr es:[bx], 1
jmp     loc_24BF5

def_24C43:              ; jumptable 00024C43 default case, cases 1-4
push    word ptr [bp+arg_0+2] ; jumptable 00024C8F default case
push    word ptr [bp+arg_0]
call    sub_24BD2
push    [bp+var_18]
push    [bp+var_1A]
xor     ax, ax
push    ax
call    sub_23062
mov     word ptr [bp+var_38+2], dx
mov     word ptr [bp+var_38], ax
or      ax, dx
jz      short loc_25933 ; jumptable 00024C43 case 7
push    dx
push    word ptr [bp+var_38]
push    [bp+var_E]
push    si
push    word ptr ds:0BED4h
push    word ptr ds:0BED6h
call    sub_2E58A
cmp     byte ptr ds:0BED2h, 7
jz      short loc_2592B
mov     ax, 8Bh
push    ax
call    sub_28E99
inc     sp
inc     sp

loc_2592B:
les     bx, [bp+arg_0]
mov     word ptr es:[bx], 1

loc_25933:              ; jumptable 00024C43 case 7
pop     di
pop     si
mov     sp, bp
pop     bp
retn    4
sub_24BED endp

seg007 ends


; Segment type: Pure code
seg008 segment byte public 'CODE' use16
assume cs:seg008
;org 0Bh
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing


; Attributes: bp-based frame

sub_2593B proc far

arg_0= word ptr  6
arg_2= word ptr  8

push    bp
mov     bp, sp
push    [bp+arg_2]
push    [bp+arg_0]
xor     ax, ax
push    ax
call    sub_467E6
mov     ds:4BC0h, ax
mov     word ptr ds:9A76h, 0BA78h
pop     bp
retf    4
sub_2593B endp



; Attributes: bp-based frame

sub_25959 proc far

arg_0= byte ptr  6

push    bp
mov     bp, sp
mov     al, [bp+arg_0]
mov     bx, ds:9A76h
mov     [bx], al
inc     word ptr ds:9A76h
cmp     word ptr ds:9A76h, 0BC78h
jb      short loc_25999
push    word ptr ds:4BC0h
push    ds
mov     ax, 0BA78h
push    ax
mov     ax, 200h
push    ax
call    sub_46F6F
cmp     ax, 200h
jz      short loc_25993
mov     ax, 7
push    ax
call    sub_3129B
mov     sp, bp

loc_25993:
mov     word ptr ds:9A76h, 0BA78h

loc_25999:
pop     bp
retf    2
sub_25959 endp




sub_2599D proc far
push    word ptr ds:4BC0h
push    ds
mov     ax, 0BA78h
push    ax
mov     ax, ds:9A76h
sub     ax, 0BA78h
push    ax
call    sub_46F6F
mov     dx, ds:9A76h
sub     dx, 0BA78h
cmp     ax, dx
jz      short loc_259C9
mov     ax, 7
push    ax
call    sub_3129B
inc     sp
inc     sp

loc_259C9:
push    word ptr ds:4BC0h
call    sub_467C8
mov     word ptr ds:4BC0h, 0FFFFh
retf
sub_2599D endp




sub_259D9 proc far
cmp     word ptr ds:4BC0h, 0
jl      short locret_259FC
push    word ptr ds:4BC0h
call    sub_467C8
mov     word ptr ds:4BC0h, 0FFFFh
push    word ptr ds:0BE2Fh
push    word ptr ds:0BE2Dh
call    sub_46F49

locret_259FC:
retf
sub_259D9 endp

seg008 ends


; Segment type: Pure code
seg009 segment byte public 'CODE' use16
assume cs:seg009
;org 0Dh
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing


; Attributes: bp-based frame

sub_259FD proc far

arg_0= word ptr  6
arg_2= word ptr  8

push    bp
mov     bp, sp
push    si
call    sub_317D1
mov     bx, 0BE35h
push    ds
push    bx
mov     bx, 22B0h
push    ds
push    bx
mov     cx, 5Ch ; '\'
call    sub_46BE5
push    ds
mov     ax, 0BE91h
push    ax
call    sub_469C1
mov     si, ax
or      si, si
jnz     short loc_25A2B
jmp     loc_25A99

loc_25A2B:
mov     ax, ds:0BF76h
or      ax, ds:0BF78h
jz      short loc_25A41

loc_25A34:
mov     ax, 1
push    ax
call    sub_2AD74
or      ax, ax
jnz     short loc_25A34

loc_25A41:
cmp     si, 1
jz      short loc_25A4B
cmp     si, 4
jnz     short loc_25A66

loc_25A4B:
call    sub_259D9
call    sub_317DE
cmp     si, 1
jnz     short loc_25A60

loc_25A5A:
mov     si, 2
jmp     loc_25AE1

loc_25A60:
mov     si, 3
jmp     loc_25AE1

loc_25A66:
cmp     si, 2
jnz     short loc_25A7A
call    sub_259D9
mov     al, 1
mov     ds:22CBh, al
mov     ds:22C9h, al
jmp     short loc_25A99

loc_25A7A:
call    sub_259D9
call    sub_317DE
dec     word ptr ds:0BFAAh
dec     word ptr ds:0BFA8h
mov     ax, 6
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     short loc_25A5A

loc_25A99:
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_25B11
call    sub_285DC
call    sub_1FA0F
call    dword ptr ds:0BFFCh
cmp     word ptr ds:0BFA8h, 0
jz      short loc_25AC1
call    sub_259D9
mov     si, 2
jmp     short loc_25ADC

loc_25AC1:
call    sub_2599D
cmp     word ptr ds:0BFAAh, 0
jz      short loc_25AD2
mov     si, 1
jmp     short loc_25AD4

loc_25AD2:
xor     si, si

loc_25AD4:
xor     ax, ax
push    ax
call    sub_1B476

loc_25ADC:
call    sub_317DE

loc_25AE1:
mov     bx, 22B0h
push    ds
push    bx
mov     bx, 0BE35h
push    ds
push    bx
mov     cx, 5Ch ; '\'
call    sub_46BE5
mov     word ptr ds:0BFAEh, 0
mov     word ptr ds:0BFACh, 0
mov     word ptr ds:0BE1Dh, 0
mov     byte ptr ds:9A63h, 0
mov     ax, si
pop     si
pop     bp
retf    4
sub_259FD endp



; Attributes: bp-based frame

sub_25B11 proc near

var_2C= dword ptr -2Ch
var_28= dword ptr -28h
var_24= dword ptr -24h
var_20= byte ptr -20h
var_16= byte ptr -16h
var_10= byte ptr -10h
arg_0= dword ptr  4

push    bp
mov     bp, sp
sub     sp, 2Ch
call    sub_31529
mov     ds:0BE33h, dx
mov     ds:0BE31h, ax
call    sub_25D5F
mov     byte ptr ds:0BE04h, 1
mov     word ptr ds:0BE23h, 18h
mov     byte ptr ds:9A63h, 1
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_31377
les     bx, [bp+arg_0]
mov     word ptr ds:0BFAEh, es
mov     ds:0BFACh, bx
push    word ptr [bp+arg_0+2]
push    bx
xor     ax, ax
push    ax
push    ax
push    ax
push    ax
push    ss
lea     ax, [bp+var_20]
push    ax
push    ss
lea     ax, [bp+var_16]
push    ax
call    sub_4654A
push    ss
lea     ax, [bp+var_10]
push    ax
xor     ax, ax
push    ax
push    ax
push    ax
push    ax
push    ss
lea     ax, [bp+var_20]
push    ax
push    ss
lea     ax, [bp+var_16]
push    ax
call    sub_46713
mov     word ptr ds:0BE2Bh, 0
mov     word ptr ds:0BE29h, 0
call    sub_2690E
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_2ABD3
mov     ax, ds:0BE29h
or      ax, ds:0BE2Bh
jnz     short loc_25BB6
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
mov     ax, 4
push    ax
call    sub_3129B
add     sp, 6

loc_25BB6:
push    ss
lea     ax, [bp+var_20]
push    ax
push    ss
lea     ax, [bp+var_10]
push    ax
call    sub_31D57
call    dword ptr ds:0C054h
les     bx, ds:2304h
mov     word ptr [bp+var_24+2], es
mov     word ptr [bp+var_24], bx
jmp     loc_25D2A

loc_25BD6:
mov     word ptr [bp+var_28+2], ds
mov     word ptr [bp+var_28], 0BC78h
jmp     short loc_25BF2

loc_25BE0:
les     bx, [bp+var_24]
mov     al, es:[bx]
les     bx, [bp+var_28]
mov     es:[bx], al
inc     word ptr [bp+var_24]
inc     word ptr [bp+var_28]

loc_25BF2:
les     bx, [bp+var_24]
cmp     byte ptr es:[bx], 0
jz      short loc_25C0C
cmp     byte ptr es:[bx], 3Bh ; ';'
jz      short loc_25C0C
cmp     byte ptr es:[bx], 3Dh ; '='
jnz     short loc_25BE0
jmp     short loc_25C0C

loc_25C09:
dec     word ptr [bp+var_28]

loc_25C0C:
mov     ax, 0BC78h
mov     dx, ds
cmp     ax, word ptr [bp+var_28]
jnb     short loc_25C20
les     bx, [bp+var_28]
dec     bx
cmp     byte ptr es:[bx], 20h ; ' '
jz      short loc_25C09

loc_25C20:
les     bx, [bp+var_28]
mov     byte ptr es:[bx], 0
mov     word ptr [bp+var_2C+2], ds
mov     word ptr [bp+var_2C], 0BC78h
jmp     short loc_25C34

loc_25C31:
inc     word ptr [bp+var_2C]

loc_25C34:
les     bx, [bp+var_2C]
cmp     byte ptr es:[bx], 20h ; ' '
jz      short loc_25C31
les     bx, [bp+var_24]
cmp     byte ptr es:[bx], 0
jz      short loc_25C4F
cmp     byte ptr es:[bx], 3Bh ; ';'
jnz     short loc_25C66
inc     word ptr [bp+var_24]

loc_25C4F:
push    word ptr [bp+var_2C+2]
push    word ptr [bp+var_2C]
push    ds
mov     ax, 4D96h
push    ax
mov     ax, 0FFFFh
push    ax
call    sub_2C313
jmp     loc_25D2A

loc_25C66:
inc     word ptr [bp+var_24]
mov     word ptr [bp+var_28+2], ds
mov     word ptr [bp+var_28], 9A78h
jmp     short loc_25CBA

loc_25C73:
les     bx, [bp+var_24]
mov     al, es:[bx]
les     bx, [bp+var_28]
mov     es:[bx], al
inc     word ptr [bp+var_24]
inc     word ptr [bp+var_28]
les     bx, [bp+var_24]
dec     bx
cmp     byte ptr es:[bx], 5Ch ; '\'
jnz     short loc_25CBA
mov     bx, word ptr [bp+var_24]
cmp     byte ptr es:[bx], 3Bh ; ';'
jnz     short loc_25CA2
les     bx, [bp+var_28]
dec     bx
mov     byte ptr es:[bx], 3Bh ; ';'
jmp     short loc_25CB7

loc_25CA2:
les     bx, [bp+var_24]
cmp     byte ptr es:[bx], 0
jz      short loc_25CCE
mov     al, es:[bx]
les     bx, [bp+var_28]
mov     es:[bx], al
inc     word ptr [bp+var_28]

loc_25CB7:
inc     word ptr [bp+var_24]

loc_25CBA:
les     bx, [bp+var_24]
cmp     byte ptr es:[bx], 0
jz      short loc_25CCE
cmp     byte ptr es:[bx], 3Bh ; ';'
jnz     short loc_25C73
jmp     short loc_25CCE

loc_25CCB:
dec     word ptr [bp+var_28]

loc_25CCE:
mov     ax, 9A78h
mov     dx, ds
cmp     ax, word ptr [bp+var_28]
jnb     short loc_25CE2
les     bx, [bp+var_28]
dec     bx
cmp     byte ptr es:[bx], 20h ; ' '
jz      short loc_25CCB

loc_25CE2:
les     bx, [bp+var_28]
mov     byte ptr es:[bx], 20h ; ' '
inc     word ptr [bp+var_28]
mov     bx, word ptr [bp+var_28]
mov     byte ptr es:[bx], 0
mov     word ptr [bp+var_28+2], ds
mov     word ptr [bp+var_28], 9A78h
jmp     short loc_25D00

loc_25CFD:
inc     word ptr [bp+var_28]

loc_25D00:
les     bx, [bp+var_28]
cmp     byte ptr es:[bx], 20h ; ' '
jz      short loc_25CFD
les     bx, [bp+var_24]
cmp     byte ptr es:[bx], 0
jz      short loc_25D15
inc     word ptr [bp+var_24]

loc_25D15:
push    word ptr [bp+var_2C+2]
push    word ptr [bp+var_2C]
push    word ptr [bp+var_28+2]
push    word ptr [bp+var_28]
mov     ax, 0FFFFh
push    ax
call    sub_2C313

loc_25D2A:
les     bx, [bp+var_24]
cmp     byte ptr es:[bx], 0
jz      short loc_25D36
jmp     loc_25BD6

loc_25D36:
mov     sp, bp
pop     bp
retn    4
sub_25B11 endp




sub_25D3C proc far
push    si
xor     si, si
jmp     short loc_25D58

loc_25D41:
mov     bx, si
shl     bx, 1
shl     bx, 1
add     bx, 4F62h
mov     ax, ds
mov     es, ax
mov     al, es:[bx+3]
mov     [si-415Ah], al
inc     si

loc_25D58:
cmp     si, 21h ; '!'
jle     short loc_25D41
pop     si
retf
sub_25D3C endp



; Attributes: bp-based frame

sub_25D5F proc near

var_4= dword ptr -4

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
mov     word ptr ds:0BFB2h, 0
mov     word ptr ds:0BFB0h, 0
mov     word ptr ds:0BFA8h, 0
mov     word ptr ds:0BFAAh, 0
push    cs
call    near ptr sub_25D3C
push    ds
mov     ax, 0AA78h
push    ax
mov     ax, 1000h
push    ax
mov     al, 0
push    ax
call    sub_46C10
push    ds
mov     ax, 9A78h
push    ax
mov     ax, 23B1h
push    ax
mov     al, 0
push    ax
call    sub_46C10
mov     word ptr ds:9A72h, 0
mov     word ptr ds:9A70h, 0
mov     word ptr ds:0BDABh, 1
mov     byte ptr ds:0BDB5h, 1
mov     al, ds:22B6h
cbw
mov     di, ax
jmp     short loc_25E0F

loc_25DC4:
mov     ax, di
mov     dx, 6
mul     dx
mov     bx, ax
add     bx, 4C7Fh
mov     ax, ds
mov     es, ax
les     bx, es:[bx]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
mov     ax, di
mov     dx, 6
mul     dx
mov     bx, ax
add     bx, 4C7Fh
mov     ax, ds
mov     es, ax
mov     si, es:[bx+4]
jmp     short loc_25E0A

loc_25DF5:
push    ds
les     bx, [bp+var_4]
push    word ptr es:[bx+2]
push    word ptr es:[bx]
call    sub_2A9CF
add     word ptr [bp+var_4], 4
dec     si

loc_25E0A:
or      si, si
jnz     short loc_25DF5
inc     di

loc_25E0F:
cmp     di, 3
jle     short loc_25DC4
mov     ax, 288h
push    ax
call    sub_3193F
mov     ds:0BD8Ch, dx
mov     ds:0BD8Ah, ax
mov     ds:0BD90h, dx
mov     ds:0BD8Eh, ax
les     bx, ds:0BD8Ah
mov     word ptr es:[bx+282h], 0
mov     word ptr es:[bx+280h], 0
mov     word ptr es:[bx+286h], 0
mov     word ptr es:[bx+284h], 0
mov     word ptr ds:0BD7Ch, es
mov     ds:0BD7Ah, bx
mov     ax, 5
push    ax
xor     ax, ax
push    ax
call    sub_2A52D
mov     ds:0BD80h, dx
mov     ds:0BD7Eh, ax
cmp     byte ptr ds:22B7h, 0
jz      short loc_25E72
mov     ax, 2
jmp     short loc_25E75

loc_25E72:
mov     ax, 1

loc_25E75:
push    ax
xor     ax, ax
push    ax
call    sub_2A52D
mov     ds:0BD84h, dx
mov     ds:0BD82h, ax
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_25D5F endp




sub_25E8B proc far
mov     byte ptr ds:9A63h, 3
call    sub_25D5F
retf
sub_25E8B endp



; Attributes: bp-based frame

sub_25E94 proc far

arg_0= dword ptr  6

push    bp
mov     bp, sp
mov     ax, word ptr [bp+arg_0]
or      ax, word ptr [bp+arg_0+2]
jz      short loc_25EC0
jmp     short loc_25EB7

loc_25EA1:
les     bx, [bp+arg_0]
mov     al, es:[bx]
cbw
push    ax
call    sub_46F25
les     bx, [bp+arg_0]
mov     es:[bx], al
inc     word ptr [bp+arg_0]

loc_25EB7:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 0
jnz     short loc_25EA1

loc_25EC0:
pop     bp
retf    4
sub_25E94 endp




sub_25EC4 proc far
mov     byte ptr ds:0BE04h, 1
retf
sub_25EC4 endp




sub_25ECA proc far
push    word ptr ds:2302h
push    word ptr ds:2300h
call    sub_25EF7
retf
sub_25ECA endp




sub_25ED6 proc far
cmp     byte ptr ds:9A63h, 1
jnz     short locret_25EF6
mov     ax, 9Fh
push    ax
call    sub_312DE
inc     sp
inc     sp
push    ds
mov     ax, 0BE91h
push    ax
mov     ax, 1
push    ax
call    sub_4698B

locret_25EF6:
retf
sub_25ED6 endp ; sp-analysis failed



; Attributes: bp-based frame

sub_25EF7 proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
push    si
jmp     loc_25F9B

loc_25EFE:
mov     si, 9A78h
jmp     short loc_25F0F

loc_25F03:
les     bx, [bp+arg_0]
mov     al, es:[bx]
mov     [si], al
inc     word ptr [bp+arg_0]
inc     si

loc_25F0F:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 0
jz      short loc_25F1E
cmp     byte ptr es:[bx], 3Bh ; ';'
jnz     short loc_25F03

loc_25F1E:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 3Bh ; ';'
jnz     short loc_25F2A
inc     word ptr [bp+arg_0]

loc_25F2A:
mov     byte ptr [si], 0
jmp     short loc_25F33

loc_25F2F:
dec     si
mov     byte ptr [si], 0

loc_25F33:
mov     ax, si
mov     dx, ds
mov     bx, 9A78h
mov     cx, ds
cmp     ax, bx
jbe     short loc_25F4C
cmp     byte ptr [si-1], 20h ; ' '
jz      short loc_25F2F
cmp     byte ptr [si-1], 9
jz      short loc_25F2F

loc_25F4C:
push    ds
mov     ax, 9A78h
push    ax
call    sub_46494
push    ds
mov     ax, 9A78h
push    ax
call    sub_46E60
mov     si, ax
add     si, 9A78h
push    ds
mov     ax, 9A78h
push    ax
push    cs
call    near ptr sub_25E94
push    ds
push    si
push    ds
mov     ax, 0BC78h
push    ax
call    sub_46D76
mov     si, 9A78h
jmp     short loc_25F81

loc_25F80:
inc     si

loc_25F81:
cmp     byte ptr [si], 20h ; ' '
jz      short loc_25F80
cmp     byte ptr [si], 9
jz      short loc_25F80
push    ds
push    si
call    sub_2ABD3
or      ax, ax
jz      short loc_25F9B
mov     ax, 1
jmp     short loc_25FA9

loc_25F9B:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 0
jz      short loc_25FA7
jmp     loc_25EFE

loc_25FA7:
xor     ax, ax

loc_25FA9:
pop     si
pop     bp
retn    4
sub_25EF7 endp

seg009 ends


; Segment type: Pure code
seg010 segment byte public 'CODE' use16
assume cs:seg010
;org 0Eh
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing


; Attributes: bp-based frame

sub_25FAE proc far

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  6

push    bp
mov     bp, sp
sub     sp, 4
push    [bp+arg_0]
mov     ax, 1
push    ax
call    sub_26130
mov     [bp+var_2], dx
mov     [bp+var_4], ax
or      ax, dx
jnz     short loc_25FCE
xor     dx, dx
mov     ax, dx
jmp     short loc_25FEC

loc_25FCE:
les     bx, ds:0BECAh
mov     word ptr ds:0BF49h, es
mov     ds:0BF47h, bx
mov     ax, ds:0BECEh
mov     ds:0BF4Fh, ax
mov     ax, ds:0BED0h
mov     ds:0BF53h, ax
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]

loc_25FEC:
mov     sp, bp
pop     bp
retf    2
sub_25FAE endp



; Attributes: bp-based frame

sub_25FF2 proc far

var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 4
xor     ax, ax
push    ax
push    ax
call    sub_26130
mov     [bp+var_2], dx
mov     [bp+var_4], ax
or      ax, dx
jnz     short loc_2600F
xor     dx, dx
mov     ax, dx
jmp     short loc_26021

loc_2600F:
les     bx, ds:0BECAh
mov     word ptr ds:0BF27h, es
mov     ds:0BF25h, bx
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]

loc_26021:
mov     sp, bp
pop     bp
retf
sub_25FF2 endp




sub_26025 proc far
xor     ax, ax
push    ax
mov     ax, 0FFFFh
push    ax
call    sub_26130
retf
sub_26025 endp



; Attributes: bp-based frame

sub_26030 proc near

var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
mov     [bp+var_4], 0
mov     [bp+var_2], 0

loc_26042:
xor     si, si
mov     di, si
mov     al, ds:0BED2h
mov     ah, 0
cmp     ax, 4Dh ; 'M'
jz      short loc_260A4
jg      short loc_26076
sub     ax, 45h ; 'E'   ; switch 8 cases
cmp     ax, 7
jbe     short loc_2605D
jmp     def_26061       ; jumptable 00026061 default case, cases 71-73

loc_2605D:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_26061[bx] ; switch jump
jpt_26061 dw offset loc_2609A ; jump table for switch statement
dw offset loc_26095
dw offset def_26061
dw offset def_26061
dw offset def_26061
dw offset loc_260B3
dw offset loc_260B8
dw offset loc_2609F

loc_26076:
cmp     ax, 69h ; 'i'
jz      short loc_26090
jg      short loc_26089
cmp     ax, 4Eh ; 'N'
jz      short loc_260A9
cmp     ax, 4Fh ; 'O'
jz      short loc_260AE
jmp     short def_26061 ; jumptable 00026061 default case, cases 71-73

loc_26089:
cmp     ax, 6Ah ; 'j'
jz      short loc_260BD
jmp     short def_26061 ; jumptable 00026061 default case, cases 71-73

loc_26090:
mov     di, 400h
jmp     short loc_260E7

loc_26095:              ; jumptable 00026061 case 70
mov     di, 100h
jmp     short loc_260E7

loc_2609A:              ; jumptable 00026061 case 69
mov     di, 300h
jmp     short loc_260E7

loc_2609F:              ; jumptable 00026061 case 76
mov     si, 2
jmp     short loc_260E7

loc_260A4:
mov     si, 4
jmp     short loc_260E7

loc_260A9:
mov     si, 1
jmp     short loc_260E7

loc_260AE:
mov     si, 3
jmp     short loc_260E7

loc_260B3:              ; jumptable 00026061 case 74
mov     si, 7
jmp     short loc_260E7

loc_260B8:              ; jumptable 00026061 case 75
mov     si, 5
jmp     short loc_260E7

loc_260BD:
mov     si, 6
jmp     short loc_260E7

def_26061:              ; jumptable 00026061 default case, cases 71-73
cmp     [bp+var_2], 0
jz      short loc_260DF
cmp     [bp+var_4], 0
jz      short loc_260DF
cmp     [bp+var_4], 1
jg      short loc_260DF
mov     ax, 9Bh
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_260DF:
mov     ax, [bp+var_2]
or      ax, [bp+var_4]
jmp     short loc_2612A

loc_260E7:
or      di, di
jz      short loc_260FF
cmp     [bp+var_2], 0
jz      short loc_260FC
mov     ax, 9Bh
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_260FC:
mov     [bp+var_2], di

loc_260FF:
or      si, si
jz      short loc_26117
cmp     [bp+var_4], 0
jz      short loc_26114
mov     ax, 9Bh
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_26114:
mov     [bp+var_4], si

loc_26117:
call    sub_26945
mov     ax, ds:0BE1Dh
mov     ds:0BFB4h, ax
call    sub_2AEAA
jmp     loc_26042

loc_2612A:
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_26030 endp



; Attributes: bp-based frame

sub_26130 proc near

var_12= dword ptr -12h
var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_A= dword ptr -0Ah
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 12h
push    si
push    di
mov     di, [bp+arg_2]
mov     ax, sp
mov     dx, ds
mov     bx, 0C4CCh
mov     cx, ds
cmp     ax, bx
jnb     short loc_26153
mov     ax, 6
push    ax
call    sub_3129B
inc     sp
inc     sp

loc_26153:
call    sub_26030
mov     si, ax
cmp     byte ptr ds:0BED2h, 16h
jnz     short loc_26195
call    sub_26945
call    sub_266B0
mov     [bp+var_6], ax
push    di
push    [bp+arg_0]
call    sub_26130
mov     [bp+var_2], dx
mov     [bp+var_4], ax
or      ax, dx
jnz     short loc_2617E
jmp     loc_2638F

loc_2617E:
mov     ax, 7
push    ax
xor     ax, ax
push    ax
push    [bp+var_6]
push    dx
push    [bp+var_4]
push    ax
push    ax
push    si
call    sub_266FF
jmp     loc_2643E

loc_26195:
mov     word ptr ds:0BECCh, 0
mov     word ptr ds:0BECAh, 0
cmp     byte ptr ds:0BED2h, 1
jnz     short loc_261ED
call    sub_26945
cmp     byte ptr ds:0BED2h, 2
jz      short loc_261C8
push    di
push    [bp+arg_0]
call    sub_26130
mov     [bp+var_2], dx
mov     [bp+var_4], ax
or      ax, dx
jnz     short loc_261E6
jmp     loc_2638F

loc_261C8:
cmp     [bp+arg_0], 0
jg      short loc_2621F
mov     ax, 11h
push    ax
xor     ax, ax
push    ax
push    ax
push    ax
push    ax
push    ax
push    ax
push    si
call    sub_266FF
mov     [bp+var_2], dx
mov     [bp+var_4], ax
xor     si, si

loc_261E6:
call    sub_26945
jmp     short loc_26240

loc_261ED:
cmp     byte ptr ds:0BED2h, 2Fh ; '/'
jnz     short loc_26219
cmp     [bp+arg_0], 0
jl      short loc_26219
les     bx, ds:0BED8h
mov     word ptr ds:0BECCh, es
mov     ds:0BECAh, bx
mov     ax, ds:0BED6h
mov     ds:0BECEh, ax
mov     ax, ds:0BED4h
mov     ds:0BED0h, ax
call    sub_26945
jmp     short loc_2622D

loc_26219:
cmp     [bp+arg_0], 0
jle     short loc_2622D

loc_2621F:
mov     ax, 91h
push    ax
call    sub_28E99
inc     sp
inc     sp
jmp     loc_2638F

loc_2622D:
xor     ax, ax
push    ax
push    ax
push    ax
push    ax
push    ax
push    ax
push    ax
push    si
call    sub_266FF
mov     [bp+var_2], dx
mov     [bp+var_4], ax

loc_26240:
mov     ax, ds:0BE1Dh
mov     ds:0BFB4h, ax
call    sub_2AEAA
cmp     byte ptr ds:0BED2h, 1
jnz     short loc_26255
jmp     loc_26424

loc_26255:
cmp     byte ptr ds:0BED2h, 3
jnz     short loc_2625F
jmp     loc_26424

loc_2625F:
test    si, 0FFh
jnz     short loc_26268
jmp     loc_26424

loc_26268:
mov     ax, si
and     ax, 0FFh
cmp     ax, 7
jnz     short loc_26275
jmp     loc_26424

loc_26275:
mov     ax, si
and     ax, 0FFh
cmp     ax, 5
jnz     short loc_26282
jmp     loc_26424

loc_26282:
mov     ax, 9Bh
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_26424

loc_26290:
cmp     byte ptr ds:0BED2h, 3
jnz     short loc_2629A
jmp     loc_26344

loc_2629A:
call    sub_26945
les     bx, ds:0BECAh
mov     word ptr [bp+var_12+2], es
mov     word ptr [bp+var_12], bx
mov     ax, ds:0BECEh
mov     [bp+var_E], ax
mov     ax, ds:0BED0h
mov     [bp+var_C], ax
push    di
call    sub_26446
mov     word ptr [bp+var_A+2], dx
mov     word ptr [bp+var_A], ax
les     bx, [bp+var_12]
mov     word ptr ds:0BECCh, es
mov     ds:0BECAh, bx
mov     ax, [bp+var_E]
mov     ds:0BECEh, ax
mov     ax, [bp+var_C]
mov     ds:0BED0h, ax
mov     ax, word ptr [bp+var_A]
or      ax, dx
jnz     short loc_262E0
jmp     loc_2638F

loc_262E0:
mov     ax, word ptr [bp+var_A]
mov     bx, 0BF29h
mov     cx, ds
cmp     dx, cx
jnz     short loc_262FA
cmp     ax, bx
jnz     short loc_262FA
xor     di, di
mov     word ptr [bp+var_A+2], di
mov     word ptr [bp+var_A], di
jmp     short loc_26323

loc_262FA:
les     bx, [bp+var_A]
cmp     byte ptr es:[bx+18h], 0
jz      short loc_26323
mov     ax, si
and     ax, 0FF00h
cmp     ax, 400h
jz      short loc_2631F
test    si, 0FF00h
jz      short loc_2631F
mov     ax, 9Bh
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_2631F:
or      si, 8000h

loc_26323:
mov     ax, 11h
push    ax
xor     ax, ax
push    ax
push    ax
push    [bp+var_2]
push    [bp+var_4]
push    word ptr [bp+var_A+2]
push    word ptr [bp+var_A]
push    si
call    sub_266FF
mov     [bp+var_2], dx
mov     [bp+var_4], ax
jmp     loc_26414

loc_26344:
test    si, 0FFh
jz      short loc_26369
mov     ax, si
and     ax, 0FFh
cmp     ax, 7
jz      short loc_26369
mov     ax, si
and     ax, 0FFh
cmp     ax, 5
jz      short loc_26369
mov     ax, 9Bh
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_26369:
call    sub_26945
cmp     byte ptr ds:0BED2h, 4
jnz     short loc_26378
jmp     loc_263FA

loc_26378:
les     bx, ds:0BECAh
mov     word ptr [bp+var_A+2], es
mov     word ptr [bp+var_A], bx
mov     ax, 1
push    ax
call    sub_23348
or      ax, ax
jnz     short loc_26396

loc_2638F:
xor     dx, dx
mov     ax, dx
jmp     loc_2643E

loc_26396:
les     bx, [bp+var_A]
mov     word ptr ds:0BECCh, es
mov     ds:0BECAh, bx
mov     dx, ds:0BEDAh
mov     ax, ds:0BED8h
cmp     dx, ds:73FCh
jb      short loc_263CB
jnz     short loc_263B6
cmp     ax, ds:73FAh
jb      short loc_263CB

loc_263B6:
mov     dx, ds:0BEDAh
mov     ax, ds:0BED8h
cmp     dx, ds:7400h
jb      short loc_263D6
ja      short loc_263CB
cmp     ax, ds:73FEh
jbe     short loc_263D6

loc_263CB:
mov     ax, 62h ; 'b'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_263D6:
mov     ax, 10h
push    ax
push    word ptr ds:0BED8h
xor     ax, ax
push    ax
push    [bp+var_2]
push    [bp+var_4]
push    ax
push    ax
push    ax
call    sub_266FF
mov     [bp+var_2], dx
mov     [bp+var_4], ax
call    sub_2693F
jmp     short loc_26414

loc_263FA:
mov     ax, 10h
push    ax
xor     ax, ax
push    ax
push    ax
push    [bp+var_2]
push    [bp+var_4]
push    ax
push    ax
push    si
call    sub_266FF
mov     [bp+var_2], dx
mov     [bp+var_4], ax

loc_26414:
call    sub_26945
mov     ax, ds:0BE1Dh
mov     ds:0BFB4h, ax
call    sub_2AEAA

loc_26424:
cmp     byte ptr ds:0BED2h, 1
jnz     short loc_2642E
jmp     loc_26290

loc_2642E:
cmp     byte ptr ds:0BED2h, 3
jnz     short loc_26438
jmp     loc_26290

loc_26438:
mov     dx, [bp+var_2]
mov     ax, [bp+var_4]

loc_2643E:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    4
sub_26130 endp



; Attributes: bp-based frame

sub_26446 proc near

var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 10h
cmp     byte ptr ds:0BED2h, 2
jnz     short loc_26456
jmp     loc_266A5

loc_26456:
mov     al, ds:0BED2h
mov     ah, 0
push    ax
call    sub_286AA
or      ax, ax
jnz     short loc_26468
jmp     loc_265D7

loc_26468:
mov     ax, 1Ah
push    ax
call    sub_3193F
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
les     bx, [bp+var_10]
mov     word ptr es:[bx+6], 0
mov     word ptr es:[bx+4], 0
mov     bx, ax
mov     word ptr es:[bx+16h], 0
mov     word ptr es:[bx+14h], 0
mov     bx, ax
mov     byte ptr es:[bx+18h], 0
mov     bx, ax
mov     word ptr es:[bx+12h], 0
mov     bx, ax
mov     word ptr es:[bx+10h], 0

loc_264AB:
call    sub_286D6
mov     [bp+var_2], dx
mov     [bp+var_4], ax
or      ax, dx
jnz     short loc_264BD
jmp     loc_2668D

loc_264BD:
cmp     word ptr ds:0BF51h, 0
jz      short loc_264D6
cmp     word ptr ds:0BF51h, 0Ah
jz      short loc_264DC
mov     ax, 8Ch
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_264D6:
mov     word ptr ds:0BF51h, 6

loc_264DC:
cmp     byte ptr ds:0BED2h, 8
jz      short loc_26512
cmp     byte ptr ds:0BED2h, 2
jz      short loc_26512
push    cs
call    near ptr sub_25FF2
mov     [bp+var_6], dx
mov     [bp+var_8], ax
or      ax, dx
jnz     short loc_264FB
jmp     loc_2668D

loc_264FB:
push    dx
push    [bp+var_8]
push    [bp+var_2]
push    [bp+var_4]
call    sub_2677A
mov     [bp+var_2], dx
mov     [bp+var_4], ax
jmp     short loc_2651E

loc_26512:
mov     word ptr ds:0BF27h, 0
mov     word ptr ds:0BF25h, 0

loc_2651E:
push    word ptr [bp+var_10+2]
push    word ptr [bp+var_10]
push    word ptr ds:0BF27h
push    word ptr ds:0BF25h
push    [bp+var_2]
push    [bp+var_4]
push    word ptr ds:0BF51h
mov     ax, 6
push    ax
call    sub_1F771
cmp     byte ptr ds:0BED2h, 8
jnz     short loc_26575
call    sub_26945
cmp     byte ptr ds:0BED2h, 33h ; '3'
jnz     short loc_26561
call    sub_26945
les     bx, [bp+var_10]
mov     byte ptr es:[bx+18h], 1
jmp     short loc_26575

loc_26561:
mov     al, ds:0BED2h
mov     ah, 0
push    ax
call    sub_286AA
or      ax, ax
jz      short loc_26573
jmp     loc_264AB

loc_26573:
jmp     short loc_2657C

loc_26575:
cmp     byte ptr ds:0BED2h, 2
jz      short loc_2658A

loc_2657C:
mov     ax, 91h
push    ax
call    sub_28E99
inc     sp
inc     sp
jmp     loc_2668D

loc_2658A:
les     bx, [bp+var_10]
les     bx, es:[bx+4]
mov     word ptr [bp+var_C+2], es
mov     word ptr [bp+var_C], bx
mov     ax, bx
or      ax, word ptr [bp+var_C+2]
jz      short loc_265CE
les     bx, es:[bx+0Ch]
cmp     byte ptr es:[bx+4], 0Fh
jnz     short loc_265CE
les     bx, [bp+var_C]
mov     ax, es:[bx+4]
or      ax, es:[bx+6]
jnz     short loc_265CE
mov     ax, es:[bx]
or      ax, es:[bx+2]
jnz     short loc_265CE
les     bx, [bp+var_10]
mov     word ptr es:[bx+6], 0
mov     word ptr es:[bx+4], 0

loc_265CE:
mov     dx, word ptr [bp+var_10+2]
mov     ax, word ptr [bp+var_10]
jmp     loc_266AA

loc_265D7:
cmp     [bp+arg_0], 0
jnz     short loc_265EB
mov     ax, 92h
push    ax
call    sub_28E99
inc     sp
inc     sp
jmp     loc_2668D

loc_265EB:
call    sub_297BF
mov     ax, 1Ah
push    ax
call    sub_318B7
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
les     bx, [bp+var_10]
mov     word ptr es:[bx+6], 0
mov     word ptr es:[bx+4], 0
mov     bx, ax
mov     word ptr es:[bx+16h], 0
mov     word ptr es:[bx+14h], 0
mov     bx, ax
mov     byte ptr es:[bx+18h], 0
mov     bx, ax
mov     word ptr es:[bx+12h], 0
mov     bx, ax
mov     word ptr es:[bx+10h], 0

loc_26633:
cmp     byte ptr ds:0BED2h, 2Fh ; '/'
jz      short loc_26647
mov     ax, 91h
push    ax
call    sub_28E99
inc     sp
inc     sp
jmp     short loc_26681

loc_26647:
push    word ptr [bp+var_10+2]
push    word ptr [bp+var_10]
push    word ptr ds:0BEDAh
push    word ptr ds:0BED8h
xor     ax, ax
push    ax
push    ax
push    ax
mov     ax, 7
push    ax
call    sub_1F771
call    sub_26945
cmp     byte ptr ds:0BED2h, 2
jz      short loc_2669A
cmp     byte ptr ds:0BED2h, 8
jz      short loc_26693
mov     ax, 94h
push    ax
call    sub_28E99
inc     sp
inc     sp

loc_26681:
mov     word ptr ds:9A72h, 0
mov     word ptr ds:9A70h, 0

loc_2668D:
xor     dx, dx
mov     ax, dx
jmp     short loc_266AA

loc_26693:
call    sub_26945
jmp     short loc_26633

loc_2669A:
les     bx, [bp+var_10]
mov     word ptr ds:0BF4Dh, es
mov     ds:0BF4Bh, bx

loc_266A5:
mov     ax, 0BF29h
mov     dx, ds

loc_266AA:
mov     sp, bp
pop     bp
retn    2
sub_26446 endp




sub_266B0 proc near
push    si
xor     si, si

loc_266B3:
mov     al, ds:0BED2h
mov     ah, 0
cmp     ax, 48h ; 'H'
jz      short loc_266C4
cmp     ax, 49h ; 'I'
jz      short loc_266DB
jmp     short loc_266F2

loc_266C4:
test    si, 40h
jz      short loc_266D5
mov     ax, 9Bh
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_266D5:
or      si, 40h
jmp     short loc_266F6

loc_266DB:
test    si, 80h
jz      short loc_266EC
mov     ax, 9Bh
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_266EC:
or      si, 80h
jmp     short loc_266F6

loc_266F2:
mov     ax, si
jmp     short loc_266FD

loc_266F6:
call    sub_26945
jmp     short loc_266B3

loc_266FD:
pop     si
retn
sub_266B0 endp



; Attributes: bp-based frame

sub_266FF proc near

var_4= dword ptr -4
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah
arg_8= word ptr  0Ch
arg_A= byte ptr  0Eh
arg_C= word ptr  10h
arg_E= byte ptr  12h

push    bp
mov     bp, sp
sub     sp, 4
mov     ax, ds:0BDC1h
or      ax, ds:0BDC3h
jz      short loc_26726
les     bx, ds:0BDC1h
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
les     bx, es:[bx+0Ah]
mov     word ptr ds:0BDC3h, es
mov     ds:0BDC1h, bx
jmp     short loc_26735

loc_26726:
mov     ax, 0Eh
push    ax
call    sub_3193F
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax

loc_26735:
mov     al, [bp+arg_E]
les     bx, [bp+var_4]
mov     es:[bx], al
mov     dx, [bp+arg_4]
mov     ax, [bp+arg_2]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
mov     ax, [bp+arg_C]
mov     es:[bx+2], ax
mov     al, [bp+arg_A]
mov     es:[bx+1], al
mov     dx, [bp+arg_8]
mov     ax, [bp+arg_6]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
mov     ax, [bp+arg_0]
mov     es:[bx+4], ax
mov     dx, word ptr [bp+var_4+2]
mov     ax, bx
mov     sp, bp
pop     bp
retn    10h
sub_266FF endp



; Attributes: bp-based frame

sub_2677A proc far

var_6= dword ptr -6
var_2= word ptr -2
arg_0= dword ptr  6
arg_4= dword ptr  0Ah

push    bp
mov     bp, sp
sub     sp, 6
push    si
push    di
mov     word ptr ds:0BF43h, 0
mov     word ptr ds:0BF45h, 0
jmp     loc_268DE

loc_26791:
les     bx, [bp+arg_4]
les     bx, es:[bx+0Ah]
mov     word ptr [bp+var_6+2], es
mov     word ptr [bp+var_6], bx
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx], 10h
jnz     short loc_267C5
push    word ptr es:[bx+2]
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
mov     al, es:[bx+1]
cbw
push    ax
call    sub_2A549
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
jmp     loc_268BB

loc_267C5:
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx], 11h
jz      short loc_267D1
jmp     loc_2684C

loc_267D1:
mov     si, es:[bx+4]
mov     ax, word ptr [bp+var_6]
or      ax, word ptr [bp+var_6+2]
jz      short loc_267FE
les     bx, [bp+var_6]
cmp     byte ptr es:[bx], 7
jnz     short loc_267FE
or      si, si
jnz     short loc_267F0
mov     si, es:[bx+4]
jmp     short loc_267FE

loc_267F0:
les     bx, [bp+var_6]
cmp     word ptr es:[bx+4], 0
jnz     short loc_267FE
mov     es:[bx+4], si

loc_267FE:
mov     di, si
mov     cl, 8
shr     di, cl
mov     ax, si
and     ax, 0FFh
mov     [bp+var_2], ax
cmp     ax, 5
jz      short loc_26823
cmp     ax, 6
jz      short loc_26829
cmp     ax, 7
jz      short loc_2681D
jmp     short loc_2682D

loc_2681D:
or      di, 10h
jmp     short loc_2682D

loc_26823:
or      di, 8
jmp     short loc_2682D

loc_26829:
or      di, 28h

loc_2682D:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
les     bx, [bp+arg_4]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
push    di
call    sub_2A5CF
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
jmp     short loc_268BB

loc_2684C:
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx], 7
jnz     short loc_26898
test    word ptr es:[bx+4], 0FF00h
jz      short loc_26872
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+4], 11h
jz      short loc_26872
mov     ax, 9Bh
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_26872:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
les     bx, [bp+arg_4]
mov     al, es:[bx+1]
cbw
mov     dx, es:[bx+4]
and     dx, 0FFh
or      ax, dx
push    ax
call    sub_2A771
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
jmp     short loc_268BB

loc_26898:
les     bx, [bp+arg_4]
mov     ax, es:[bx+4]
mov     cl, 8
sar     ax, cl
and     ax, 0FFh
mov     ds:0BF43h, ax
mov     ax, es:[bx+4]
and     ax, 0FFh
cmp     ax, 5
jnz     short loc_268BB
mov     word ptr ds:0BF45h, 5

loc_268BB:
mov     dx, ds:0BDC3h
mov     ax, ds:0BDC1h
les     bx, [bp+arg_4]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
mov     word ptr ds:0BDC3h, es
mov     ds:0BDC1h, bx
les     bx, [bp+var_6]
mov     word ptr [bp+arg_4+2], es
mov     word ptr [bp+arg_4], bx

loc_268DE:
mov     ax, word ptr [bp+arg_4]
or      ax, word ptr [bp+arg_4+2]
jz      short loc_268E9
jmp     loc_26791

loc_268E9:
mov     dx, word ptr [bp+arg_0+2]
mov     ax, word ptr [bp+arg_0]
pop     di
pop     si
mov     sp, bp
pop     bp
retf    8
sub_2677A endp



; Attributes: bp-based frame

sub_268F7 proc far

arg_0= dword ptr  6

push    bp
mov     bp, sp
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 0
jnz     short loc_26908
mov     ax, 1
jmp     short loc_2690A

loc_26908:
xor     ax, ax

loc_2690A:
pop     bp
retf    4
sub_268F7 endp

seg010 ends


; Segment type: Pure code
seg011 segment byte public 'CODE' use16
assume cs:seg011
;org 0Eh
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing



sub_2690E proc far
mov     word ptr ds:0BEE2h, 64A0h
mov     word ptr ds:0BF8Ch, 9A78h
mov     word ptr ds:0BF78h, 0
mov     word ptr ds:0BF76h, 0
mov     word ptr ds:0BF74h, 0
mov     word ptr ds:0BF72h, 0
mov     word ptr ds:0BF6Ch, 0
mov     word ptr ds:0BF6Ah, 0
retf
sub_2690E endp




sub_2693F proc far
mov     byte ptr ds:0BDB6h, 1
retf
sub_2693F endp



; Attributes: bp-based frame

sub_26945 proc far

var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 4
push    si
cmp     byte ptr ds:0BDB6h, 0
jz      short loc_2695E ; jumptable 0002699A case -9
mov     byte ptr ds:0BDB6h, 0
mov     al, ds:0BED2h
jmp     loc_26FF3

loc_2695E:              ; jumptable 0002699A case -9
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_2696E
call    sub_2B0D7
jmp     short loc_2697B

loc_2696E:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0

loc_2697B:
mov     [bp+var_4], ax

loc_2697E:
mov     bx, ds:0BEE2h
add     bx, [bp+var_4]
mov     al, [bx]
cbw
mov     [bp+var_2], ax
sub     ax, 0FFE0h      ; switch 33 cases
cmp     ax, 20h
jbe     short loc_26996
jmp     def_2699A       ; jumptable 0002699A default case, cases -24,-23,-21,-13

loc_26996:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_2699A[bx] ; switch jump
jpt_2699A dw offset loc_26EE2 ; jump table for switch statement
dw offset loc_26F6E
dw offset loc_26F15
dw offset loc_26F8F
dw offset loc_26EAB
dw offset loc_26F51
dw offset loc_26F0A
dw offset loc_26B2C
dw offset def_2699A
dw offset def_2699A
dw offset loc_26AA3
dw offset def_2699A
dw offset loc_26B43
dw offset loc_26E27
dw offset loc_26B17
dw offset loc_26DA3
dw offset loc_26D07
dw offset loc_26CA6
dw offset loc_26C91
dw offset def_2699A
dw offset loc_26C7D
dw offset loc_26B6F
dw offset loc_269E1
dw offset loc_2695E
dw offset loc_26C0C
dw offset loc_26C0C
dw offset loc_26C0C
dw offset loc_26B9F
dw offset loc_26C0C
dw offset loc_26C0C
dw offset loc_26C0C
dw offset loc_26C0C
dw offset loc_26C0C

loc_269E1:              ; jumptable 0002699A case -10
mov     ax, ds:0BE1Dh
mov     ds:0BED6h, ax
mov     ax, ds:0BE1Fh
mov     ds:0BED4h, ax
mov     byte ptr ds:0BE28h, 0
push    [bp+var_4]
call    sub_27195
mov     ax, ds:0BF8Ch
mov     dx, ds
mov     bx, 0AA77h
mov     cx, ds
push    ax
mov     al, ds:22BCh
cbw
sub     bx, ax
pop     ax
cmp     ax, bx
jnb     short loc_26A1D
mov     al, ds:22BCh
cbw
mov     bx, ax
add     bx, ds:0BF8Ch
mov     byte ptr [bx], 0

loc_26A1D:
mov     ax, ds:0BEE2h
mov     dx, ds
mov     bx, 65A0h
mov     cx, ds
cmp     dx, cx
jnz     short loc_26A2F
cmp     ax, bx
jz      short loc_26A7D

loc_26A2F:
call    sub_2720A
mov     [bp+var_4], ax
or      ax, ax
jl      short loc_26A3E
jmp     loc_2697E

loc_26A3E:
cmp     ax, 0FFFFh
jge     short loc_26A48
mov     ax, 1
jmp     short loc_26A4A

loc_26A48:
xor     ax, ax

loc_26A4A:
mov     ds:0BE27h, al
mov     ax, ds:0BEE2h
mov     dx, ds
mov     bx, 66A0h
mov     cx, ds
cmp     dx, cx
jnz     short loc_26A5F
cmp     ax, bx
jz      short loc_26A7D

loc_26A5F:
les     bx, ds:0BF84h
add     bx, 0Ah
mov     word ptr ds:0BEDAh, es
mov     ds:0BED8h, bx
mov     bx, ds:0BF84h
mov     ax, es:[bx+8]
mov     [bp+var_4], ax
or      ax, ax
jnz     short loc_26A85

loc_26A7D:
mov     al, 2Fh ; '/'
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26A85:
mov     al, byte ptr [bp+var_4]
mov     ds:0BED2h, al
jmp     loc_26FF3

def_2699A:              ; jumptable 0002699A default case, cases -24,-23,-21,-13
mov     ax, ds:0BE1Dh
mov     ds:0BED6h, ax
mov     ax, ds:0BE1Fh
mov     ds:0BED4h, ax
mov     al, byte ptr [bp+var_2]
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26AA3:              ; jumptable 0002699A case -22
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_26AB5
call    sub_2B0D7
mov     si, ax
jmp     short loc_26AC4

loc_26AB5:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0
mov     si, ax

loc_26AC4:
cmp     si, 0Dh
jnz     short loc_26AFA

loc_26AC9:
call    sub_2717C
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_26ADE
call    sub_2B0D7
jmp     short loc_26AEB

loc_26ADE:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0

loc_26AEB:
cmp     ax, 0Ah
jnz     short loc_26AF3
jmp     loc_2695E       ; jumptable 0002699A case -9

loc_26AF3:
dec     word ptr ds:0BF6Eh
jmp     loc_2695E       ; jumptable 0002699A case -9

loc_26AFA:
cmp     si, 3Fh ; '?'
jnz     short loc_26B13
mov     ax, ds:0BE1Dh
mov     ds:0BED6h, ax
mov     ax, ds:0BE1Fh
mov     ds:0BED4h, ax
mov     al, 1Eh
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26B13:
dec     word ptr ds:0BF6Eh

loc_26B17:              ; jumptable 0002699A case -18
push    [bp+var_4]
push    [bp+var_4]
mov     ax, 3Ah ; ':'
push    ax
call    sub_312DE
add     sp, 6
jmp     loc_2695E       ; jumptable 0002699A case -9

loc_26B2C:              ; jumptable 0002699A case -25
xor     ax, ax
push    ax
call    sub_2AD74
or      ax, ax
jz      short loc_26B3B
jmp     loc_2695E       ; jumptable 0002699A case -9

loc_26B3B:
mov     al, 0
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26B43:              ; jumptable 0002699A case -20
cmp     byte ptr ds:0BDB7h, 0
jz      short loc_26B4D
jmp     loc_26F88

loc_26B4D:
call    sub_2717C
mov     ax, 20h ; ' '
push    ax
call    sub_2B549
mov     [bp+var_4], ax
cmp     ax, 23h ; '#'
jnz     short loc_26AF3
mov     ax, 1
push    ax
call    sub_2B752
jmp     loc_2695E       ; jumptable 0002699A case -9

loc_26B6F:              ; jumptable 0002699A case -11
mov     ax, ds:0BE1Dh
mov     ds:0BED6h, ax
mov     ax, ds:0BE1Fh
mov     ds:0BED4h, ax
push    [bp+var_4]
call    sub_2744E
mov     [bp+var_2], ax
mov     ax, ds:0BEE2h
mov     dx, ds
mov     bx, 64A0h
mov     cx, ds
cmp     dx, cx
jz      short loc_26B95
jmp     loc_2695E       ; jumptable 0002699A case -9

loc_26B95:
cmp     ax, bx
jz      short loc_26B9C
jmp     loc_2695E       ; jumptable 0002699A case -9

loc_26B9C:
jmp     loc_26D4B

loc_26B9F:              ; jumptable 0002699A case -5
mov     ax, [bp+var_2]
neg     ax
mov     [bp+var_2], ax
mov     ax, ds:0BE1Dh
mov     ds:0BED6h, ax
mov     ax, ds:0BE1Fh
mov     ds:0BED4h, ax
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_26BC5
call    sub_2B0D7
mov     si, ax
jmp     short loc_26BD4

loc_26BC5:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0
mov     si, ax

loc_26BD4:
cmp     si, 2Ah ; '*'
jnz     short loc_26BDC
jmp     loc_26F3A

loc_26BDC:
cmp     byte ptr ds:649Ch, 0
jz      short loc_26BF1
cmp     si, [bp+var_4]
jnz     short loc_26BF1
mov     al, ds:649Ch
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26BF1:
cmp     si, 3Dh ; '='
jnz     short loc_26BFF
mov     al, ds:6493h
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26BFF:
dec     word ptr ds:0BF6Eh
mov     al, ds:648Ah
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26C0C:              ; jumptable 0002699A cases -8--6,-4-0
mov     ax, [bp+var_2]
neg     ax
mov     [bp+var_2], ax
mov     ax, ds:0BE1Dh
mov     ds:0BED6h, ax
mov     ax, ds:0BE1Fh
mov     ds:0BED4h, ax
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_26C32
call    sub_2B0D7
mov     si, ax
jmp     short loc_26C41

loc_26C32:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0
mov     si, ax

loc_26C41:
mov     bx, [bp+var_2]
cmp     byte ptr [bx+6497h], 0
jz      short loc_26C5A
cmp     si, [bp+var_4]
jnz     short loc_26C5A
mov     al, [bx+6497h]
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26C5A:
cmp     si, 3Dh ; '='
jnz     short loc_26C6C
mov     bx, [bp+var_2]
mov     al, [bx+648Eh]
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26C6C:
dec     word ptr ds:0BF6Eh
mov     bx, [bp+var_2]
mov     al, [bx+6485h]
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26C7D:              ; jumptable 0002699A case -12
mov     ax, ds:0BE1Dh
mov     ds:0BED6h, ax
mov     ax, ds:0BE1Fh
mov     ds:0BED4h, ax
mov     al, 32h ; '2'
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26C91:              ; jumptable 0002699A case -14
mov     ax, ds:0BE1Dh
mov     ds:0BED6h, ax
mov     ax, ds:0BE1Fh
mov     ds:0BED4h, ax
call    sub_2793F
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26CA6:              ; jumptable 0002699A case -15
mov     ax, ds:0BE1Dh
mov     ds:0BED6h, ax
mov     ax, ds:0BE1Fh
mov     ds:0BED4h, ax
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_26CC2
call    sub_2B0D7
jmp     short loc_26CCF

loc_26CC2:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0

loc_26CCF:
mov     [bp+var_4], ax
cmp     ax, 2Dh ; '-'
jnz     short loc_26CDF
mov     al, 2Ch ; ','
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26CDF:
cmp     [bp+var_4], 3Dh ; '='
jnz     short loc_26CED
mov     al, 0Bh
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26CED:
cmp     [bp+var_4], 3Eh ; '>'
jnz     short loc_26CFB
mov     al, 2Eh ; '.'
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26CFB:
dec     word ptr ds:0BF6Eh
mov     al, 15h
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26D07:              ; jumptable 0002699A case -16
mov     ax, ds:0BE1Dh
mov     ds:0BED6h, ax
mov     ax, ds:0BE1Fh
mov     ds:0BED4h, ax
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_26D23
call    sub_2B0D7
jmp     short loc_26D30

loc_26D23:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0

loc_26D30:
mov     [bp+var_4], ax
mov     bx, ds:0BEE2h
add     bx, ax
cmp     byte ptr [bx], 0F5h
jnz     short loc_26D57
dec     word ptr ds:0BF6Eh
mov     al, 2Eh ; '.'
push    ax
call    sub_2744E
mov     [bp+var_2], ax

loc_26D4B:
push    [bp+var_2]
call    sub_277AB
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26D57:
cmp     [bp+var_4], 2Eh ; '.'
jnz     short loc_26D97
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_26D6D
call    sub_2B0D7
jmp     short loc_26D7A

loc_26D6D:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0

loc_26D7A:
mov     [bp+var_4], ax
cmp     ax, 2Eh ; '.'
jz      short loc_26D8F
mov     ax, 45h ; 'E'
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     short loc_26D97

loc_26D8F:
mov     al, 33h ; '3'
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26D97:
dec     word ptr ds:0BF6Eh
mov     al, 2Dh ; '-'
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26DA3:              ; jumptable 0002699A case -17
mov     ax, ds:0BE1Dh
mov     ds:0BED6h, ax
mov     ax, ds:0BE1Fh
mov     ds:0BED4h, ax
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_26DBF
call    sub_2B0D7
jmp     short loc_26DCC

loc_26DBF:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0

loc_26DCC:
mov     [bp+var_4], ax
cmp     ax, 3Dh ; '='
jnz     short loc_26DDC
mov     al, 26h ; '&'
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26DDC:
cmp     [bp+var_4], 3Ch ; '<'
jnz     short loc_26E1B
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_26DF2
call    sub_2B0D7
jmp     short loc_26DFF

loc_26DF2:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0

loc_26DFF:
mov     [bp+var_4], ax
cmp     ax, 3Dh ; '='
jnz     short loc_26E0F
mov     al, 12h
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26E0F:
dec     word ptr ds:0BF6Eh
mov     al, 1Ch
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26E1B:
dec     word ptr ds:0BF6Eh
mov     al, 24h ; '$'
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26E27:              ; jumptable 0002699A case -19
mov     ax, ds:0BE1Dh
mov     ds:0BED6h, ax
mov     ax, ds:0BE1Fh
mov     ds:0BED4h, ax
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_26E43
call    sub_2B0D7
jmp     short loc_26E50

loc_26E43:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0

loc_26E50:
mov     [bp+var_4], ax
cmp     ax, 3Dh ; '='
jnz     short loc_26E60
mov     al, 27h ; '''
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26E60:
cmp     [bp+var_4], 3Eh ; '>'
jnz     short loc_26E9F
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_26E76
call    sub_2B0D7
jmp     short loc_26E83

loc_26E76:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0

loc_26E83:
mov     [bp+var_4], ax
cmp     ax, 3Dh ; '='
jnz     short loc_26E93
mov     al, 13h
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26E93:
dec     word ptr ds:0BF6Eh
mov     al, 1Dh
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26E9F:
dec     word ptr ds:0BF6Eh
mov     al, 25h ; '%'
mov     ds:0BED2h, al
jmp     loc_26FF3

loc_26EAB:              ; jumptable 0002699A case -28
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_26EBB
call    sub_2B0D7
jmp     short loc_26EC8

loc_26EBB:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0

loc_26EC8:
mov     [bp+var_4], ax
cmp     ax, 0Dh
jnz     short loc_26ED3
jmp     loc_26AC9

loc_26ED3:
dec     word ptr ds:0BF6Eh
mov     al, 5Ch ; '\'
push    ax
call    sub_27D32
jmp     loc_2695E       ; jumptable 0002699A case -9

loc_26EE2:              ; jumptable 0002699A case -32
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_26EF2
call    sub_2B0D7
jmp     short loc_26EFF

loc_26EF2:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0

loc_26EFF:
mov     [bp+var_4], ax
cmp     ax, 0Dh
jnz     short loc_26F0A ; jumptable 0002699A case -26
jmp     loc_26AC9

loc_26F0A:              ; jumptable 0002699A case -26
push    [bp+var_4]
call    sub_27D32
jmp     loc_2695E       ; jumptable 0002699A case -9

loc_26F15:              ; jumptable 0002699A case -30
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_26F25
call    sub_2B0D7
jmp     short loc_26F32

loc_26F25:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0

loc_26F32:
mov     [bp+var_4], ax
cmp     ax, 2Ah ; '*'
jnz     short loc_26F42

loc_26F3A:
call    sub_2B687
jmp     loc_2695E       ; jumptable 0002699A case -9

loc_26F42:
dec     word ptr ds:0BF6Eh
mov     al, 2Fh ; '/'
push    ax
call    sub_27D32
jmp     loc_2695E       ; jumptable 0002699A case -9

loc_26F51:              ; jumptable 0002699A case -27
push    [bp+var_4]
mov     ax, seg seg011
push    ax
mov     ax, 1432h
push    ax
mov     ax, 1
push    ax
call    sub_2B3F1
or      ax, ax
jz      short loc_26F6C
jmp     loc_2695E       ; jumptable 0002699A case -9

loc_26F6C:
jmp     short loc_26F88

loc_26F6E:              ; jumptable 0002699A case -31
push    [bp+var_4]
mov     ax, seg seg011
push    ax
mov     ax, 1432h
push    ax
xor     ax, ax
push    ax
call    sub_2B3F1
or      ax, ax
jz      short loc_26F88
jmp     loc_2695E       ; jumptable 0002699A case -9

loc_26F88:
mov     al, 68h ; 'h'
mov     ds:0BED2h, al
jmp     short loc_26FF3

loc_26F8F:              ; jumptable 0002699A case -29
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_26F9F
call    sub_2B0D7
jmp     short loc_26FAC

loc_26F9F:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0

loc_26FAC:
mov     [bp+var_4], ax
cmp     ax, 23h ; '#'
jnz     short loc_26FE2
jmp     short loc_26FBA

loc_26FB6:
dec     word ptr ds:0BF8Ch

loc_26FBA:
mov     ax, ds:0BF8Ch
mov     dx, ds
mov     bx, 9A78h
mov     cx, ds
cmp     ax, bx
jbe     short loc_26FD0
mov     bx, ax
cmp     byte ptr [bx-1], 20h ; ' '
jz      short loc_26FB6

loc_26FD0:
mov     al, 0FEh
push    ax
call    sub_27D09
mov     ax, 20h ; ' '
push    ax
call    sub_2B549
jmp     loc_26AF3

loc_26FE2:
mov     al, 0FDh
push    ax
call    sub_27D09
push    [bp+var_4]
call    sub_2B549
jmp     loc_26AF3

loc_26FF3:
pop     si
mov     sp, bp
pop     bp
retf
sub_26945 endp



; Attributes: bp-based frame

sub_26FF8 proc far

arg_0= word ptr  6
arg_2= word ptr  8
arg_4= word ptr  0Ah

push    bp
mov     bp, sp
push    si
cmp     [bp+arg_0], 0
jz      short loc_2700A
mov     word ptr ds:0BEE2h, 66A0h
jmp     short loc_27010

loc_2700A:
mov     word ptr ds:0BEE2h, 65A0h

loc_27010:
mov     bx, ds:0BF8Ch
mov     byte ptr [bx], 0
mov     byte ptr ds:0BDB7h, 1

loc_2701C:
push    cs
call    near ptr sub_26945
mov     ah, 0
or      ax, ax
jz      short loc_27063
cmp     ax, 2Fh ; '/'
jz      short loc_27032
cmp     ax, 68h ; 'h'
jz      short loc_2705F
jmp     short loc_2701C

loc_27032:
push    [bp+arg_4]
push    [bp+arg_2]
call    sub_2C520
mov     si, ax
mov     ax, si
or      ax, ax
jz      short loc_2704F
mov     ax, si
add     al, 80h
push    ax
call    sub_27D09
jmp     short loc_2701C

loc_2704F:
push    ds
push    word ptr ds:0BF8Ch
call    sub_46E60
add     ds:0BF8Ch, ax
jmp     short loc_2701C

loc_2705F:
dec     word ptr ds:0BF6Eh

loc_27063:
mov     word ptr ds:0BEE2h, 64A0h
mov     ax, ds:0BF8Ch
mov     dx, ds
mov     bx, 0AA77h
mov     cx, ds
cmp     ax, bx
jb      short loc_27082
mov     ax, 2Bh ; '+'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_27082:
mov     byte ptr ds:0BDB7h, 0
mov     word ptr ds:0BF8Ch, 9A78h
pop     si
pop     bp
retf    6
sub_26FF8 endp



; Attributes: bp-based frame

sub_27092 proc far

var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
mov     ax, ds:0BF8Ch
mov     [bp+var_2], ax
mov     bx, ax
mov     byte ptr [bx], 0
mov     ax, ds:0BEE2h
mov     [bp+var_4], ax
mov     word ptr ds:0BEE2h, 66A0h
xor     si, si

loc_270B3:
push    cs
call    near ptr sub_26945
mov     ah, 0
cmp     ax, 2
jz      short loc_27123
jg      short loc_270CE
or      ax, ax
jnz     short loc_270C7
jmp     loc_2714C

loc_270C7:
cmp     ax, 1
jz      short loc_27118
jmp     short loc_270B3

loc_270CE:
cmp     ax, 8
jz      short loc_27138
cmp     ax, 2Fh ; '/'
jz      short loc_270DA
jmp     short loc_270B3

loc_270DA:
cmp     byte ptr ds:0BE27h, 0
jz      short loc_27108
push    ds
push    word ptr ds:0BF8Ch
push    ds
mov     ax, ds:0BF8Ch
inc     ax
push    ax
push    ds
push    word ptr ds:0BF8Ch
call    sub_46E60
inc     ax
push    ax
call    sub_46A2C
mov     bx, ds:0BF8Ch
mov     byte ptr [bx], 0FCh
inc     word ptr ds:0BF8Ch

loc_27108:
push    ds
push    word ptr ds:0BF8Ch
call    sub_46E60
add     ds:0BF8Ch, ax
jmp     short loc_270B3

loc_27118:
inc     si
mov     al, 28h ; '('
push    ax
call    sub_27D32
jmp     short loc_270B3

loc_27123:
or      si, si
jg      short loc_2712C
mov     di, 29h ; ')'
jmp     short loc_2714F

loc_2712C:
dec     si
mov     al, 29h ; ')'
push    ax
call    sub_27D32
jmp     loc_270B3

loc_27138:
or      si, si
jle     short loc_27147
mov     al, 2Ch ; ','
push    ax
call    sub_27D32
jmp     loc_270B3

loc_27147:
mov     di, 2Ch ; ','
jmp     short loc_2714F

loc_2714C:
mov     di, 1Ah

loc_2714F:
mov     ax, ds:0BF8Ch
mov     dx, ds
mov     bx, 0AA77h
mov     cx, ds
cmp     ax, bx
jb      short loc_27168
mov     ax, 2Bh ; '+'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_27168:
mov     ax, [bp+var_4]
mov     ds:0BEE2h, ax
mov     ax, [bp+var_2]
mov     ds:0BF8Ch, ax
mov     ax, di
pop     di
pop     si
mov     sp, bp
pop     bp
retf
sub_27092 endp




sub_2717C proc far
inc     word ptr ds:0BE1Dh
inc     word ptr ds:0BEE4h
test    word ptr ds:0BEE4h, 3Fh
jnz     short locret_27194
xor     ax, ax
push    ax
call    sub_1B476

locret_27194:
retf
sub_2717C endp



; Attributes: bp-based frame

sub_27195 proc far

arg_0= word ptr  6

push    bp
mov     bp, sp
push    si
push    di
mov     di, ds:0BF8Ch
push    di
push    ds
pop     es
mov     bx, 64A0h
cld
mov     dx, [bp+arg_0]

loc_271A8:
cmp     di, 0AA77h
jnb     short loc_271B1
mov     al, dl
stosb

loc_271B1:
mov     cx, ds:0BF66h
lds     si, ds:0BF6Eh
sub     cx, si
jcxz    short loc_271D3

loc_271BD:
lodsb
xor     ah, ah
mov     dx, ax
xlat    byte ptr es:[bx]
cmp     al, 0F6h
jnz     short loc_271F2

loc_271C8:
cmp     di, 0AA77h
jnb     short loc_271D1
mov     al, dl
stosb

loc_271D1:
loop    loc_271BD

loc_271D3:
push    bx
push    cx
push    es
pop     ds
call    sub_2B0D7
push    ds
pop     es
pop     cx
pop     bx
cld
mov     dx, ax
xlat
cmp     al, 0F6h
jz      short loc_271A8
cmp     al, 0F5h
jz      short loc_271A8
mov     si, ds:0BF6Eh
jmp     short loc_271F6

loc_271F2:
cmp     al, 0F5h
jz      short loc_271C8

loc_271F6:
push    es
pop     ds
dec     si
mov     ds:0BF6Eh, si
xor     al, al
stosb
pop     word ptr ds:0BF8Ch
pop     di
pop     si
pop     bp
retf    2
sub_27195 endp




sub_2720A proc far
push    si
mov     al, ds:0BE26h
cbw
mov     si, ax
mov     byte ptr ds:0BE26h, 0
or      si, si
jz      short loc_27238
cmp     byte ptr ds:0BE28h, 0
jnz     short loc_27238
push    ds
push    word ptr ds:0BF8Ch
xor     ax, ax
push    ax
call    sub_2A9CF
mov     ds:0BF86h, dx
mov     ds:0BF84h, ax
jmp     loc_273B0

loc_27238:
push    ds
push    word ptr ds:0BF8Ch
call    sub_2C78D
dec     ax              ; switch 5 cases
cmp     ax, 4
jbe     short loc_2724B
jmp     def_2724F       ; jumptable 0002724F default case

loc_2724B:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_2724F[bx] ; switch jump
jpt_2724F dw offset loc_2728C ; jump table for switch statement
dw offset loc_2725E
dw offset loc_2726D
dw offset loc_27292
dw offset loc_272E6

loc_2725E:              ; jumptable 0002724F case 2
les     bx, ds:0BFACh
mov     word ptr ds:0BDBFh, es
mov     ds:0BDBDh, bx
jmp     loc_27356

loc_2726D:              ; jumptable 0002724F case 3
push    word ptr ds:0BE1Dh
push    ds
mov     ax, 0BC78h
push    ax
call    sub_472E0
push    ds
mov     ax, 0BC79h
push    ax
call    sub_2B0AB
mov     al, ds:0BC78h
cbw
jmp     loc_273B3

loc_2728C:              ; jumptable 0002724F case 1
mov     ax, 31h ; '1'
jmp     loc_273B3

loc_27292:              ; jumptable 0002724F case 4
push    ds
mov     al, ds:9872h
cbw
dec     ax
mov     dx, 3
mul     dx
add     ax, 63F6h
push    ax
push    ds
mov     ax, 0BC78h
push    ax
mov     ax, 3
push    ax
call    sub_46A2C
mov     byte ptr ds:0BC7Bh, 20h ; ' '
mov     al, ds:9871h
cbw
mov     bx, 0Ah
cwd
idiv    bx
add     al, 30h ; '0'
mov     ds:0BC7Ch, al
mov     al, ds:9871h
cbw
cwd
idiv    bx
add     dl, 30h ; '0'
mov     ds:0BC7Dh, dl
mov     byte ptr ds:0BC7Eh, 20h ; ' '
push    word ptr ds:986Fh
push    ds
mov     ax, 0BC7Fh
push    ax
call    sub_472E0
jmp     short loc_2734C

loc_272E6:              ; jumptable 0002724F case 5
mov     al, ds:9874h
mov     ah, 0
mov     bx, 0Ah
cwd
idiv    bx
add     al, 30h ; '0'
mov     ds:0BC78h, al
mov     al, ds:9874h
mov     ah, 0
cwd
idiv    bx
add     dl, 30h ; '0'
mov     ds:0BC79h, dl
mov     byte ptr ds:0BC7Ah, 3Ah ; ':'
mov     al, ds:9873h
mov     ah, 0
cwd
idiv    bx
add     al, 30h ; '0'
mov     ds:0BC7Bh, al
mov     al, ds:9873h
mov     ah, 0
cwd
idiv    bx
add     dl, 30h ; '0'
mov     ds:0BC7Ch, dl
mov     byte ptr ds:0BC7Dh, 3Ah ; ':'
mov     al, ds:9876h
mov     ah, 0
cwd
idiv    bx
add     al, 30h ; '0'
mov     ds:0BC7Eh, al
mov     al, ds:9876h
mov     ah, 0
cwd
idiv    bx
add     dl, 30h ; '0'
mov     ds:0BC7Fh, dl
mov     byte ptr ds:0BC80h, 0

loc_2734C:
mov     word ptr ds:0BDBFh, ds
mov     word ptr ds:0BDBDh, 0BC78h

loc_27356:
mov     ax, 22h ; '"'
jmp     short loc_273B3

def_2724F:              ; jumptable 0002724F default case
cmp     byte ptr ds:0BDB7h, 0
jz      short loc_2737A
push    ds
push    word ptr ds:0BF8Ch
push    ds
mov     ax, 67A0h
push    ax
call    sub_46D55
or      ax, ax
jnz     short loc_2737A
call    sub_273B5
jmp     short loc_273B3

loc_2737A:
call    sub_2C4D7
or      ax, ax
jz      short loc_273B0
call    sub_2C5A3
or      ax, ax
jnz     short loc_27391
mov     ax, 0FFFFh
jmp     short loc_273B3

loc_27391:
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_273A1
call    sub_2B0D7
jmp     short loc_273AE

loc_273A1:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0

loc_273AE:
jmp     short loc_273B3

loc_273B0:
mov     ax, 0FFFEh

loc_273B3:
pop     si
retf
sub_2720A endp



; Attributes: bp-based frame

sub_273B5 proc near

var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
mov     ax, 20h ; ' '
push    ax
call    sub_2B549
mov     [bp+var_2], ax
cmp     ax, 1Ah
jz      short loc_273F5
cmp     ax, 28h ; '('
jnz     short loc_273E9
mov     si, 1
mov     ax, 20h ; ' '
push    ax
call    sub_2B549
mov     [bp+var_2], ax
cmp     ax, 1Ah
jnz     short loc_273EB
jmp     short loc_273F5

loc_273E9:
xor     si, si

loc_273EB:
mov     bx, [bp+var_2]
cmp     byte ptr [bx+64A0h], 0F6h
jz      short loc_27402

loc_273F5:
mov     ax, 3Bh ; ';'
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     short loc_27445

loc_27402:
mov     di, ds:0BF8Ch
push    [bp+var_2]
push    cs
call    near ptr sub_27195
mov     ds:0BF8Ch, di
or      si, si
jz      short loc_27435
mov     ax, 20h ; ' '
push    ax
call    sub_2B549
mov     [bp+var_2], ax
cmp     ax, 29h ; ')'
jz      short loc_27435
mov     ax, 3Bh ; ';'
push    ax
call    sub_312DE
inc     sp
inc     sp
dec     word ptr ds:0BF6Eh

loc_27435:
push    ds
push    di
call    sub_2C486
or      ax, ax
jz      short loc_27445
mov     ax, 31h ; '1'
jmp     short loc_27448

loc_27445:
mov     ax, 30h ; '0'

loc_27448:
pop     di
pop     si
mov     sp, bp
pop     bp
retn
sub_273B5 endp



; Attributes: bp-based frame

sub_2744E proc near

var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di
mov     [bp+var_2], 0
xor     di, di
cmp     byte ptr [bp+arg_0], 30h ; '0'
jnz     short loc_274C5
mov     al, 30h ; '0'
push    ax
call    sub_27D32
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_2747B
call    sub_2B0D7
jmp     short loc_27486

loc_2747B:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]

loc_27486:
mov     byte ptr [bp+arg_0], al
cmp     byte ptr [bp+arg_0], 78h ; 'x'
jz      short loc_27495
cmp     byte ptr [bp+arg_0], 58h ; 'X'
jnz     short loc_274C0

loc_27495:
push    [bp+arg_0]
call    sub_27D32
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_274AD
call    sub_2B0D7
jmp     short loc_274B8

loc_274AD:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]

loc_274B8:
mov     byte ptr [bp+arg_0], al
mov     si, 10h
jmp     short loc_274C8

loc_274C0:
mov     si, 8
jmp     short loc_274C8

loc_274C5:
mov     si, 0Ah

loc_274C8:
mov     al, byte ptr [bp+arg_0]
cbw
sub     ax, 2Eh ; '.'   ; switch 72 cases
cmp     ax, 47h
jbe     short loc_274D7
jmp     def_274DB       ; jumptable 000274DB default case, cases 47,58-64,71-75,77-84,86-96,103-107,109-116

loc_274D7:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_274DB[bx] ; switch jump
jpt_274DB dw offset loc_2759E, offset def_274DB, offset loc_2766D ; jump table for switch statement
dw offset loc_2766D, offset loc_2766D, offset loc_2766D
dw offset loc_2766D, offset loc_2766D, offset loc_2766D
dw offset loc_2766D, offset loc_27570, offset loc_27570
dw offset def_274DB, offset def_274DB, offset def_274DB
dw offset def_274DB, offset def_274DB, offset def_274DB
dw offset def_274DB, offset loc_2769E, offset loc_2769E
dw offset loc_2769E, offset loc_2769E, offset loc_275DA
dw offset loc_276A6, offset def_274DB, offset def_274DB
dw offset def_274DB, offset def_274DB, offset def_274DB
dw offset loc_276BE, offset def_274DB, offset def_274DB
dw offset def_274DB, offset def_274DB, offset def_274DB
dw offset def_274DB, offset def_274DB, offset def_274DB
dw offset loc_2770E, offset def_274DB, offset def_274DB
dw offset def_274DB, offset def_274DB, offset def_274DB
dw offset def_274DB, offset def_274DB, offset def_274DB
dw offset def_274DB, offset def_274DB, offset def_274DB
dw offset loc_2769E, offset loc_2769E, offset loc_2769E
dw offset loc_2769E, offset loc_275DA, offset loc_276A6
dw offset def_274DB, offset def_274DB, offset def_274DB
dw offset def_274DB, offset def_274DB, offset loc_276BE
dw offset def_274DB, offset def_274DB, offset def_274DB
dw offset def_274DB, offset def_274DB, offset def_274DB
dw offset def_274DB, offset def_274DB, offset loc_2770E

loc_27570:              ; jumptable 000274DB cases 56,57
cmp     si, 8
jz      short loc_27578
jmp     loc_2766D       ; jumptable 000274DB cases 48-55

loc_27578:
mov     ax, ds:0BEE2h
mov     dx, ds
mov     bx, 64A0h
mov     cx, ds
cmp     dx, cx
jz      short loc_27589
jmp     loc_2766D       ; jumptable 000274DB cases 48-55

loc_27589:
cmp     ax, bx
jz      short loc_27590
jmp     loc_2766D       ; jumptable 000274DB cases 48-55

loc_27590:
mov     ax, 3Ch ; '<'
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_27782

loc_2759E:              ; jumptable 000274DB case 46
mov     ax, ds:0BEE2h
mov     dx, ds
mov     bx, 64A0h
mov     cx, ds
cmp     dx, cx
jnz     short loc_275D0
cmp     ax, bx
jnz     short loc_275D0
cmp     [bp+var_2], 0
jz      short loc_275C1
mov     ax, 66h ; 'f'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_275C1:
or      di, di
jz      short loc_275D0
mov     ax, 67h ; 'g'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_275D0:
mov     [bp+var_2], 1
xor     si, si
jmp     loc_2766D       ; jumptable 000274DB cases 48-55

loc_275DA:              ; jumptable 000274DB cases 69,101
cmp     si, 10h
jnz     short loc_275E2
jmp     loc_2766D       ; jumptable 000274DB cases 48-55

loc_275E2:
mov     ax, ds:0BEE2h
mov     dx, ds
mov     bx, 64A0h
mov     cx, ds
cmp     dx, cx
jnz     short loc_27603
cmp     ax, bx
jnz     short loc_27603
or      di, di
jz      short loc_27603
mov     ax, 68h ; 'h'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_27603:
mov     di, 1
xor     si, si
push    [bp+arg_0]
call    sub_27D32
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_27620
call    sub_2B0D7
jmp     short loc_2762B

loc_27620:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]

loc_2762B:
mov     byte ptr [bp+arg_0], al
cmp     byte ptr [bp+arg_0], 2Dh ; '-'
jz      short loc_2763A
cmp     byte ptr [bp+arg_0], 2Bh ; '+'
jnz     short loc_27660

loc_2763A:
push    [bp+arg_0]
call    sub_27D32
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_27652
call    sub_2B0D7
jmp     short loc_2765D

loc_27652:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]

loc_2765D:
mov     byte ptr [bp+arg_0], al

loc_27660:
mov     al, byte ptr [bp+arg_0]
cbw
mov     bx, ax
cmp     byte ptr [bx+64A0h], 0F5h
jnz     short loc_27678

loc_2766D:              ; jumptable 000274DB cases 48-55
push    [bp+arg_0]
call    sub_27D32
jmp     loc_27782

loc_27678:
mov     ax, ds:0BEE2h
mov     dx, ds
mov     bx, 64A0h
mov     cx, ds
cmp     dx, cx
jz      short loc_27689
jmp     loc_27768

loc_27689:
cmp     ax, bx
jz      short loc_27690
jmp     loc_27768

loc_27690:
mov     ax, 69h ; 'i'
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_27768

loc_2769E:              ; jumptable 000274DB cases 65-68,97-100
cmp     si, 10h
jz      short loc_2766D ; jumptable 000274DB cases 48-55
jmp     loc_27775

loc_276A6:              ; jumptable 000274DB cases 70,102
push    [bp+arg_0]
call    sub_27D32
cmp     si, 10h
jnz     short loc_276B6
jmp     loc_27782

loc_276B6:
mov     byte ptr ds:0BED3h, 0Ch
jmp     loc_27771

loc_276BE:              ; jumptable 000274DB cases 76,108
push    [bp+arg_0]
call    sub_27D32
cmp     [bp+var_2], 0
jnz     short loc_276D0
or      di, di
jz      short loc_276D8

loc_276D0:
mov     byte ptr ds:0BED3h, 0Eh
jmp     loc_27771

loc_276D8:
mov     byte ptr ds:0BED3h, 8
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_276ED
call    sub_2B0D7
jmp     short loc_276F8

loc_276ED:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]

loc_276F8:
mov     byte ptr [bp+arg_0], al
cmp     byte ptr [bp+arg_0], 75h ; 'u'
jz      short loc_2774F
cmp     byte ptr [bp+arg_0], 55h ; 'U'
jz      short loc_2774F

loc_27707:
dec     word ptr ds:0BF6Eh
jmp     short loc_2777E
align 2

loc_2770E:              ; jumptable 000274DB cases 85,117
cmp     [bp+var_2], 0
jnz     short loc_27768
or      di, di
jnz     short loc_27768
push    [bp+arg_0]
call    sub_27D32
mov     byte ptr ds:0BED3h, 6
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_27735
call    sub_2B0D7
jmp     short loc_27740

loc_27735:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]

loc_27740:
mov     byte ptr [bp+arg_0], al
cmp     byte ptr [bp+arg_0], 6Ch ; 'l'
jz      short loc_2774F
cmp     byte ptr [bp+arg_0], 4Ch ; 'L'
jnz     short loc_27707

loc_2774F:
mov     byte ptr ds:0BED3h, 9
push    [bp+arg_0]
call    sub_27D32
jmp     short loc_2777E

def_274DB:              ; jumptable 000274DB default case, cases 47,58-64,71-75,77-84,86-96,103-107,109-116
cmp     [bp+var_2], 0
jnz     short loc_27768
or      di, di
jz      short loc_27775

loc_27768:
dec     word ptr ds:0BF6Eh
mov     byte ptr ds:0BED3h, 0Dh

loc_27771:
xor     ax, ax
jmp     short loc_277A3

loc_27775:
dec     word ptr ds:0BF6Eh
mov     byte ptr ds:0BED3h, 5

loc_2777E:
mov     ax, si
jmp     short loc_277A3

loc_27782:
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_27792
call    sub_2B0D7
jmp     short loc_2779D

loc_27792:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]

loc_2779D:
mov     byte ptr [bp+arg_0], al
jmp     loc_274C8

loc_277A3:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_2744E endp



; Attributes: bp-based frame

sub_277AB proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
push    si
push    di
mov     word ptr ds:0BF8Ch, 9A78h
cmp     [bp+arg_0], 0
jnz     short loc_277D1
push    ds
mov     ax, 9A78h
push    ax
push    ds
mov     ax, 0BED8h
push    ax
call    sub_432B5
mov     ax, 31h ; '1'
jmp     loc_27939

loc_277D1:
mov     word ptr ds:0BEDAh, 0
mov     word ptr ds:0BED8h, 0
cmp     [bp+arg_0], 10h
jnz     short loc_277E8
mov     di, 9A7Ah
jmp     short loc_27836

loc_277E8:
mov     di, 9A78h
jmp     short loc_27836

loc_277ED:
mov     al, [di]
cbw
push    ax
call    sub_46F01
mov     si, ax
cmp     si, 6Ch ; 'l'
jz      short loc_2783B
cmp     si, 75h ; 'u'
jz      short loc_2783B
cmp     byte ptr [si+64A0h], 0F6h
jnz     short loc_2780E
add     si, 0FFA9h
jmp     short loc_27811

loc_2780E:
sub     si, 30h ; '0'

loc_27811:
mov     ax, [bp+arg_0]
cwd
mov     cx, ds:0BEDAh
mov     bx, ds:0BED8h
call    sub_46A18
push    dx
push    ax
mov     ax, si
cwd
pop     bx
pop     cx
add     bx, ax
adc     cx, dx
mov     ds:0BEDAh, cx
mov     ds:0BED8h, bx
inc     di

loc_27836:
cmp     byte ptr [di], 0
jnz     short loc_277ED

loc_2783B:
mov     al, ds:0BED3h
cbw
mov     si, ax
mov     al, ds:0BED3h
cbw
cmp     ax, 5
jz      short loc_2785D
cmp     ax, 6
jnz     short loc_27852
jmp     loc_278EE

loc_27852:
cmp     ax, 8
jnz     short loc_2785A
jmp     loc_27905

loc_2785A:
jmp     loc_2791F

loc_2785D:
cmp     [bp+arg_0], 0Ah
jnz     short loc_2789B
mov     dx, ds:0BEDAh
mov     ax, ds:0BED8h
cmp     dx, ds:7410h
jbe     short loc_27873
jmp     loc_2791A

loc_27873:
jnz     short loc_2787E
cmp     ax, ds:740Eh
jbe     short loc_2787E
jmp     loc_2791A

loc_2787E:
mov     dx, ds:0BEDAh
mov     ax, ds:0BED8h
cmp     dx, ds:73F8h
jnb     short loc_2788E
jmp     loc_2791F

loc_2788E:
ja      short loc_27899
cmp     ax, ds:73F6h
ja      short loc_27899
jmp     loc_2791F

loc_27899:
jmp     short loc_278CB

loc_2789B:
mov     dx, ds:0BEDAh
mov     ax, ds:0BED8h
cmp     dx, ds:7410h
jbe     short loc_278AB
jmp     short loc_2791A
db 90h

loc_278AB:
jnz     short loc_278B6
cmp     ax, ds:740Eh
jbe     short loc_278B6
jmp     short loc_2791A
align 2

loc_278B6:
mov     dx, ds:0BEDAh
mov     ax, ds:0BED8h
cmp     dx, ds:7400h
jb      short loc_278D2
ja      short loc_278CB
cmp     ax, ds:73FEh
jbe     short loc_278D2

loc_278CB:
mov     byte ptr ds:0BED3h, 8
jmp     short loc_2791F

loc_278D2:
mov     dx, ds:0BEDAh
mov     ax, ds:0BED8h
cmp     dx, ds:73F8h
jb      short loc_2791F
ja      short loc_278E7
cmp     ax, ds:73F6h
jbe     short loc_2791F

loc_278E7:
mov     byte ptr ds:0BED3h, 6
jmp     short loc_2791F

loc_278EE:
mov     dx, ds:0BEDAh
mov     ax, ds:0BED8h
cmp     dx, ds:7400h
jb      short loc_2791F
ja      short loc_27903
cmp     ax, ds:73FEh
jbe     short loc_2791F

loc_27903:
jmp     short loc_2791A

loc_27905:
mov     dx, ds:0BEDAh
mov     ax, ds:0BED8h
cmp     dx, ds:7410h
jb      short loc_2791F
ja      short loc_2791A
cmp     ax, ds:740Eh
jbe     short loc_2791F

loc_2791A:
mov     byte ptr ds:0BED3h, 9

loc_2791F:
cmp     byte ptr ds:0BED3h, 8
jl      short loc_27936
cmp     si, 8
jge     short loc_27936
mov     ax, 0A9h
push    ax
call    sub_31324
inc     sp
inc     sp

loc_27936:
mov     ax, 30h ; '0'

loc_27939:
pop     di
pop     si
pop     bp
retn    2
sub_277AB endp



; Attributes: bp-based frame

sub_2793F proc near

var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 6
push    si
mov     [bp+var_4], 0
xor     si, si
jmp     short loc_2795B

loc_2794F:
cmp     si, 2
jge     short loc_2795A
mov     al, byte ptr [bp+var_6]
mov     byte ptr [bp+si+var_4], al

loc_2795A:
inc     si

loc_2795B:
mov     al, 27h ; '''
push    ax
call    sub_279C2
mov     [bp+var_6], ax
cmp     ax, 0FFFFh
jnz     short loc_2794F
cmp     si, 2
jle     short loc_27979
mov     ax, 6Eh ; 'n'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_27979:
cmp     si, 1
jnz     short loc_2799F
cmp     byte ptr ds:22B7h, 0
jz      short loc_27994
mov     al, byte ptr [bp+var_4]
xor     ah, ah
xor     dx, dx
mov     [bp+var_2], dx
mov     [bp+var_4], ax
jmp     short loc_2799F

loc_27994:
mov     al, byte ptr [bp+var_4]
cbw
cwd
mov     [bp+var_2], dx
mov     [bp+var_4], ax

loc_2799F:
mov     ax, [bp+var_4]
cwd
push    dx
push    ax
mov     ax, 5
push    ax
call    sub_21DC9
mov     ds:0BEDAh, dx
mov     ds:0BED8h, ax
mov     byte ptr ds:0BED3h, 5
mov     ax, 30h ; '0'
pop     si
mov     sp, bp
pop     bp
retn
sub_2793F endp



; Attributes: bp-based frame

sub_279C2 proc near

var_2= word ptr -2
arg_0= byte ptr  4

push    bp
mov     bp, sp
sub     sp, 2
push    si
push    di

loc_279CA:
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_279DC
call    sub_2B0D7
mov     si, ax
jmp     short loc_279EB

loc_279DC:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0
mov     si, ax

loc_279EB:
cmp     si, 1Ah
jnz     short loc_279F3
jmp     loc_27ACF

loc_279F3:
cmp     si, 0Dh
jnz     short loc_279FB
jmp     loc_27ACF

loc_279FB:
mov     al, [bp+arg_0]
cbw
cmp     ax, si
jnz     short loc_27A06
jmp     loc_27AD2

loc_27A06:
cmp     si, 0Ah
jz      short loc_279CA
cmp     si, 5Ch ; '\'
jz      short loc_27A13
jmp     def_27A7E       ; jumptable 00027A7E default case
                        ; jumptable 00027A9A default case, cases 99-101,103-109,111-113,115,117,119

loc_27A13:
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_27A25
call    sub_2B0D7
mov     si, ax
jmp     short loc_27A34

loc_27A25:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0
mov     si, ax

loc_27A34:
mov     ax, si
cmp     ax, 37h ; '7'
jnz     short loc_27A3E
jmp     loc_27BD3       ; jumptable 00027A7E cases 51-54

loc_27A3E:
jg      short loc_27A8B
cmp     ax, 32h ; '2'
jnz     short loc_27A48
jmp     loc_27BD3       ; jumptable 00027A7E cases 51-54

loc_27A48:
jg      short loc_27A6F
cmp     ax, 30h ; '0'
jnz     short loc_27A52
jmp     loc_27BD3       ; jumptable 00027A7E cases 51-54

loc_27A52:
jg      short loc_27A64
cmp     ax, 0Dh
jnz     short loc_27A5C
jmp     loc_27BCC

loc_27A5C:
cmp     ax, 1Ah
jz      short loc_27ACF
jmp     def_27A7E       ; jumptable 00027A7E default case
                        ; jumptable 00027A9A default case, cases 99-101,103-109,111-113,115,117,119

loc_27A64:
cmp     ax, 31h ; '1'
jnz     short loc_27A6C
jmp     loc_27BD3       ; jumptable 00027A7E cases 51-54

loc_27A6C:              ; jumptable 00027A7E default case
jmp     def_27A7E       ; jumptable 00027A9A default case, cases 99-101,103-109,111-113,115,117,119

loc_27A6F:              ; switch 4 cases
sub     ax, 33h ; '3'
cmp     ax, 3
jbe     short loc_27A7A
jmp     def_27A7E       ; jumptable 00027A7E default case
                        ; jumptable 00027A9A default case, cases 99-101,103-109,111-113,115,117,119

loc_27A7A:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_27A7E[bx] ; switch jump
jpt_27A7E dw offset loc_27BD3 ; jump table for switch statement
dw offset loc_27BD3
dw offset loc_27BD3
dw offset loc_27BD3

loc_27A8B:              ; switch 24 cases
sub     ax, 61h ; 'a'
cmp     ax, 17h
jbe     short loc_27A96
jmp     def_27A7E       ; jumptable 00027A7E default case
                        ; jumptable 00027A9A default case, cases 99-101,103-109,111-113,115,117,119

loc_27A96:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_27A9A[bx] ; switch jump
jpt_27A9A dw offset loc_27AD8 ; jump table for switch statement
dw offset loc_27AEA
dw offset def_27A7E
dw offset def_27A7E
dw offset def_27A7E
dw offset loc_27AF6
dw offset def_27A7E
dw offset def_27A7E
dw offset def_27A7E
dw offset def_27A7E
dw offset def_27A7E
dw offset def_27A7E
dw offset def_27A7E
dw offset loc_27AE4
dw offset def_27A7E
dw offset def_27A7E
dw offset def_27A7E
dw offset loc_27AF0
dw offset def_27A7E
dw offset loc_27ADE
dw offset def_27A7E
dw offset loc_27AFC
dw offset def_27A7E
dw offset loc_27B02

loc_27ACF:
call    sub_27C7C

loc_27AD2:
mov     ax, 0FFFFh
jmp     loc_27C74

loc_27AD8:              ; jumptable 00027A9A case 97
mov     ax, 7
jmp     loc_27C74

loc_27ADE:              ; jumptable 00027A9A case 116
mov     ax, 9
jmp     loc_27C74

loc_27AE4:              ; jumptable 00027A9A case 110
mov     ax, 0Ah
jmp     loc_27C74

loc_27AEA:              ; jumptable 00027A9A case 98
mov     ax, 8
jmp     loc_27C74

loc_27AF0:              ; jumptable 00027A9A case 114
mov     ax, 0Dh
jmp     loc_27C74

loc_27AF6:              ; jumptable 00027A9A case 102
mov     ax, 0Ch
jmp     loc_27C74

loc_27AFC:              ; jumptable 00027A9A case 118
mov     ax, 0Bh
jmp     loc_27C74

loc_27B02:              ; jumptable 00027A9A case 120
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_27B14
call    sub_2B0D7
mov     si, ax
jmp     short loc_27B23

loc_27B14:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0
mov     si, ax

loc_27B23:
test    byte ptr [si-7EDFh], 12h
jnz     short loc_27B34
dec     word ptr ds:0BF6Eh
mov     ax, 78h ; 'x'
jmp     loc_27C74

loc_27B34:
xor     di, di
mov     [bp+var_2], 1

loc_27B3B:
mov     cl, 4
shl     di, cl
test    byte ptr [si-7EDFh], 2
jz      short loc_27B4F
mov     ax, si
add     ax, 0FFD0h
add     di, ax
jmp     short loc_27B5A

loc_27B4F:
push    si
call    sub_46F01
add     ax, 0FFA9h
add     di, ax

loc_27B5A:
mov     ax, di
cwd
cmp     dx, ds:73E0h
jl      short loc_27B83
jg      short loc_27B6B
cmp     ax, ds:73DEh
jbe     short loc_27B83

loc_27B6B:
mov     ax, ds:0BE1Dh
mov     ds:0BFB4h, ax
call    sub_2AEAA
mov     ax, 93h
push    ax
call    sub_312DE
inc     sp
inc     sp
xor     di, di

loc_27B83:
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_27B95
call    sub_2B0D7
mov     si, ax
jmp     short loc_27BA4

loc_27B95:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0
mov     si, ax

loc_27BA4:
test    byte ptr [si-7EDFh], 12h
jnz     short loc_27BC6
dec     word ptr ds:0BF6Eh
cmp     [bp+var_2], 2
jg      short loc_27BB8
jmp     loc_27C6E

loc_27BB8:
mov     ax, 0C0h
push    ax
call    sub_31324
inc     sp
inc     sp
jmp     loc_27C6E

loc_27BC6:
inc     [bp+var_2]
jmp     loc_27B3B

loc_27BCC:
push    cs
call    near ptr sub_2717C
jmp     loc_279CA

loc_27BD3:              ; jumptable 00027A7E cases 51-54
xor     di, di
mov     [bp+var_2], di
jmp     short loc_27C41
db 90h

loc_27BDB:
mov     ax, di
shl     ax, 1
shl     ax, 1
shl     ax, 1
add     ax, si
add     ax, 0FFD0h
mov     di, ax
mov     ax, di
cwd
cmp     dx, ds:73E0h
jl      short loc_27C13
jg      short loc_27BFB
cmp     ax, ds:73DEh
jbe     short loc_27C13

loc_27BFB:
mov     ax, ds:0BE1Dh
mov     ds:0BFB4h, ax
call    sub_2AEAA
mov     ax, 93h
push    ax
call    sub_312DE
inc     sp
inc     sp
xor     di, di

loc_27C13:
mov     ax, ds:0BF6Eh
cmp     ax, ds:0BF66h
jb      short loc_27C25
call    sub_2B0D7
mov     si, ax
jmp     short loc_27C34

loc_27C25:
les     bx, ds:0BF6Eh
inc     word ptr ds:0BF6Eh
mov     al, es:[bx]
mov     ah, 0
mov     si, ax

loc_27C34:
cmp     si, 30h ; '0'
jl      short loc_27C49
cmp     si, 37h ; '7'
jg      short loc_27C49
inc     [bp+var_2]

loc_27C41:
cmp     [bp+var_2], 3
jge     short loc_27C49
jmp     short loc_27BDB

loc_27C49:
cmp     [bp+arg_0], 27h ; '''
jnz     short loc_27C6A
cmp     si, 27h ; '''
jz      short loc_27C6A
mov     ax, ds:0BE1Dh
mov     ds:0BFB4h, ax
call    sub_2AEAA
mov     ax, 6Eh ; 'n'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_27C6A:
dec     word ptr ds:0BF6Eh

loc_27C6E:
mov     ax, di
jmp     short loc_27C74

def_27A7E:              ; jumptable 00027A7E default case
mov     ax, si          ; jumptable 00027A9A default case, cases 99-101,103-109,111-113,115,117,119

loc_27C74:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_279C2 endp




sub_27C7C proc near
mov     ax, 6Fh ; 'o'
push    ax
call    sub_312DE
inc     sp
inc     sp
retn
sub_27C7C endp



; Attributes: bp-based frame

sub_27C88 proc far

var_4= dword ptr -4
arg_0= word ptr  6

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
mov     di, [bp+arg_0]
mov     word ptr ds:0BED8h, 0
mov     ax, ds:0BDBDh
or      ax, ds:0BDBFh
jz      short loc_27CF2
les     bx, ds:0BDBDh
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
jmp     short loc_27CCD

loc_27CAE:
les     bx, [bp+var_4]
cmp     byte ptr es:[bx], 0FCh
jz      short loc_27CCA
inc     word ptr ds:0BED8h
or      di, di
jz      short loc_27CCA
mov     al, es:[bx]
mov     ah, 0
push    ax
call    sub_3B175

loc_27CCA:
inc     word ptr [bp+var_4]

loc_27CCD:
les     bx, [bp+var_4]
cmp     byte ptr es:[bx], 0
jnz     short loc_27CAE
mov     word ptr ds:0BDBFh, 0
mov     word ptr ds:0BDBDh, 0
jmp     short loc_27D01

loc_27CE4:
inc     word ptr ds:0BED8h
or      di, di
jz      short loc_27CF2
push    si
call    sub_3B175

loc_27CF2:
mov     al, 22h ; '"'
push    ax
call    sub_279C2
mov     si, ax
mov     ax, si
cmp     ax, 0FFFFh
jnz     short loc_27CE4

loc_27D01:
pop     di
pop     si
mov     sp, bp
pop     bp
retf    2
sub_27C88 endp



; Attributes: bp-based frame

sub_27D09 proc near

arg_0= byte ptr  4

push    bp
mov     bp, sp
mov     ax, ds:0BF8Ch
mov     dx, ds
mov     bx, 0AA77h
mov     cx, ds
cmp     ax, bx
jnb     short loc_27D27
mov     al, [bp+arg_0]
mov     bx, ds:0BF8Ch
mov     [bx], al
inc     word ptr ds:0BF8Ch

loc_27D27:
mov     bx, ds:0BF8Ch
mov     byte ptr [bx], 0
pop     bp
retn    2
sub_27D09 endp



; Attributes: bp-based frame

sub_27D32 proc far

arg_0= byte ptr  6

push    bp
mov     bp, sp
mov     ax, ds:0BF8Ch
mov     dx, ds
mov     bx, 0AA76h
mov     cx, ds
cmp     ax, bx
jnb     short loc_27D5F
test    [bp+arg_0], 80h
jz      short loc_27D52
mov     bx, ax
mov     byte ptr [bx], 0FFh
inc     word ptr ds:0BF8Ch

loc_27D52:
mov     al, [bp+arg_0]
mov     bx, ds:0BF8Ch
mov     [bx], al
inc     word ptr ds:0BF8Ch

loc_27D5F:
mov     bx, ds:0BF8Ch
mov     byte ptr [bx], 0
pop     bp
retf    2
sub_27D32 endp

seg011 ends


; Segment type: Pure code
seg012 segment byte public 'CODE' use16
assume cs:seg012
;org 0Ah
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing


; Attributes: bp-based frame

sub_27D6A proc near

var_14= dword ptr -14h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= dword ptr  8

push    bp
mov     bp, sp
sub     sp, 14h
push    si
push    di
cmp     byte ptr ds:0BED2h, 5
jnz     short loc_27D8A
mov     [bp+var_8], 1
mov     [bp+var_4], 0
call    sub_26945
jmp     short loc_27D8F

loc_27D8A:
mov     [bp+var_8], 0

loc_27D8F:
les     bx, [bp+arg_4]
mov     al, es:[bx+4]
cbw
sub     ax, 0Fh         ; switch 6 cases
cmp     ax, 5
jbe     short loc_27DA2
jmp     def_27DA6       ; jumptable 00027DA6 default case, case 19

loc_27DA2:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_27DA6[bx] ; switch jump
jpt_27DA6 dw offset loc_28331 ; jump table for switch statement
dw offset loc_27DB7
dw offset loc_28331
dw offset loc_27F9F
dw offset def_27DA6
dw offset loc_2828F

loc_27DB7:              ; jumptable 00027DA6 case 16
les     bx, [bp+arg_4]
cmp     word ptr es:[bx+0Ch], 0
jnz     short loc_27DC8
mov     [bp+var_6], 7D00h
jmp     short loc_27DD2

loc_27DC8:
les     bx, [bp+arg_4]
mov     ax, es:[bx+0Ch]
mov     [bp+var_6], ax

loc_27DD2:
les     bx, [bp+arg_4]
les     bx, es:[bx]
cmp     byte ptr es:[bx+4], 1
jz      short loc_27DEC
les     bx, [bp+arg_4]
les     bx, es:[bx]
cmp     byte ptr es:[bx+4], 2
jnz     short loc_27E4E

loc_27DEC:
cmp     byte ptr ds:0BED2h, 32h ; '2'
jnz     short loc_27E4E
xor     si, si

loc_27DF5:
mov     ax, 1
push    ax
call    sub_27C88
add     si, ds:0BED8h
call    sub_26945
cmp     al, 32h ; '2'
jz      short loc_27DF5
mov     [bp+var_4], 1
les     bx, [bp+arg_4]
cmp     word ptr es:[bx+0Ch], 0
jnz     short loc_27E23
xor     ax, ax
push    ax
call    sub_3B175
inc     si

loc_27E23:
cmp     si, [bp+var_6]
jbe     short loc_27E38
mov     ax, 96h
push    ax
call    sub_312DE
inc     sp
inc     sp
mov     [bp+var_6], 7D00h

loc_27E38:
cmp     [bp+var_8], 0
jnz     short loc_27E41
jmp     loc_27F23

loc_27E41:
cmp     byte ptr ds:0BED2h, 6
jz      short loc_27E4B
jmp     loc_2839C

loc_27E4B:
jmp     loc_27F1E

loc_27E4E:
cmp     [bp+var_8], 0
jz      short loc_27E57
jmp     loc_27EC3

loc_27E57:
cmp     [bp+arg_0], 0
jz      short loc_27E60
jmp     loc_2839C

loc_27E60:
mov     [bp+var_4], 1
xor     si, si
jmp     short loc_27EBC

loc_27E69:
les     bx, [bp+arg_4]
push    word ptr es:[bx+2]
push    word ptr es:[bx]
xor     ax, ax
push    ax
push    ax
call    sub_27D6A
or      dx, ax
jnz     short loc_27E81
jmp     loc_283A7

loc_27E81:
cmp     byte ptr ds:0BED2h, 8
jz      short loc_27E99
cmp     byte ptr ds:0BED2h, 7
jz      short loc_27E99
cmp     byte ptr ds:0BED2h, 6
jz      short loc_27E99
jmp     loc_2839C

loc_27E99:
inc     si
cmp     byte ptr ds:0BED2h, 8
jnz     short loc_27EAB
cmp     si, [bp+var_6]
jnb     short loc_27EAB
call    sub_26945

loc_27EAB:
cmp     byte ptr ds:0BED2h, 6
jnz     short loc_27EB5
jmp     loc_27F23

loc_27EB5:
cmp     byte ptr ds:0BED2h, 7
jz      short loc_27F23

loc_27EBC:
cmp     si, [bp+var_6]
jb      short loc_27E69
jmp     short loc_27F23

loc_27EC3:
xor     si, si
jmp     short loc_27F17

loc_27EC7:
cmp     si, [bp+var_6]
jb      short loc_27EDC
mov     ax, 96h
push    ax
call    sub_312DE
inc     sp
inc     sp
mov     [bp+var_6], 7D00h

loc_27EDC:
mov     [bp+var_4], 1
les     bx, [bp+arg_4]
push    word ptr es:[bx+2]
push    word ptr es:[bx]
xor     ax, ax
push    ax
push    ax
call    sub_27D6A
or      dx, ax
jnz     short loc_27EF9
jmp     loc_283A7

loc_27EF9:
cmp     byte ptr ds:0BED2h, 8
jz      short loc_27F0A
cmp     byte ptr ds:0BED2h, 6
jz      short loc_27F0A
jmp     loc_2839C

loc_27F0A:
cmp     byte ptr ds:0BED2h, 8
jnz     short loc_27F16
call    sub_26945

loc_27F16:
inc     si

loc_27F17:
cmp     byte ptr ds:0BED2h, 6
jnz     short loc_27EC7

loc_27F1E:
call    sub_26945

loc_27F23:
cmp     [bp+var_4], 0
jnz     short loc_27F34
mov     ax, 97h
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_27F34:
les     bx, [bp+arg_4]
cmp     word ptr es:[bx+0Ch], 0
jnz     short loc_27F72
cmp     [bp+arg_0], 0
jnz     short loc_27F52
mov     ax, 5Eh ; '^'
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_283B2

loc_27F52:
push    si
les     bx, [bp+arg_4]
push    word ptr es:[bx+2]
push    word ptr es:[bx]
mov     al, es:[bx+5]
mov     ah, 0
push    ax
call    sub_2A549
mov     word ptr [bp+arg_4+2], dx
mov     word ptr [bp+arg_4], ax
jmp     loc_283B2

loc_27F72:
les     bx, [bp+arg_4]
mov     ax, es:[bx+0Ch]
cmp     ax, si
ja      short loc_27F80
jmp     loc_283B2

loc_27F80:
push    word ptr es:[bx+2]
push    word ptr es:[bx]
call    sub_2A8BF
les     bx, [bp+arg_4]
mov     dx, es:[bx+0Ch]
sub     dx, si
mul     dx
push    ax
call    dword ptr ds:0BFF0h
jmp     loc_283B2

loc_27F9F:              ; jumptable 00027DA6 case 18
les     bx, [bp+arg_4]
les     bx, es:[bx+8]
mov     word ptr [bp+var_10+2], es
mov     word ptr [bp+var_10], bx
les     bx, es:[bx+4]
mov     word ptr [bp+var_C+2], es
mov     word ptr [bp+var_C], bx
mov     word ptr ds:0BDFFh, 0
mov     word ptr ds:0BDFDh, 0
les     bx, [bp+var_10]
cmp     byte ptr es:[bx+19h], 2
jnz     short loc_2802A
les     bx, [bp+var_C]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
xor     ax, ax
push    ax
push    ax
call    sub_27D6A
or      dx, ax
jnz     short loc_27FE5
jmp     loc_283A7

loc_27FE5:
mov     [bp+var_4], 1
cmp     byte ptr ds:0BED2h, 8
jz      short loc_28002
cmp     byte ptr ds:0BED2h, 7
jz      short loc_28002
cmp     byte ptr ds:0BED2h, 6
jz      short loc_28002
jmp     loc_2839C

loc_28002:
les     bx, [bp+var_C]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
call    sub_2A8BF
mov     si, ax
cmp     [bp+var_8], 0
jnz     short loc_2801D
jmp     loc_2823E

loc_2801D:
cmp     byte ptr ds:0BED2h, 6
jz      short loc_28027
jmp     loc_2839C

loc_28027:
jmp     loc_28239

loc_2802A:
cmp     [bp+var_8], 0
jz      short loc_28033
jmp     loc_28142

loc_28033:
cmp     [bp+arg_0], 0
jz      short loc_2803C
jmp     loc_2839C

loc_2803C:
mov     [bp+var_4], 1
xor     si, si
jmp     loc_28134

loc_28046:
cmp     word ptr ds:0BDFDh, 0
jz      short loc_2807B
jmp     short loc_28061

loc_2804F:
push    word ptr ds:0BDFFh
call    sub_283C0
mov     cl, 8
shr     word ptr ds:0BDFFh, cl
inc     word ptr ds:0BE01h
inc     si

loc_28061:
les     bx, [bp+var_C]
mov     ax, es:[bx+0Ah]
cmp     ax, ds:0BE01h
jnz     short loc_2804F
cmp     word ptr ds:0BDFFh, 0
jnz     short loc_2807B
mov     word ptr ds:0BDFDh, 0

loc_2807B:
les     bx, [bp+var_C]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
call    sub_2A954
mov     di, ax
cmp     byte ptr ds:22B4h, 0
jz      short loc_280B4
cmp     di, 1
jle     short loc_280B4
mov     ax, si
xor     dx, dx
div     di
or      dx, dx
jz      short loc_280B4
push    di
call    dword ptr ds:0C038h
mov     ax, si
xor     dx, dx
div     di
mov     ax, di
sub     ax, dx
add     si, ax

loc_280B4:
les     bx, [bp+var_C]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
xor     ax, ax
push    ax
call    sub_27D6A
or      dx, ax
jnz     short loc_280D0
jmp     loc_283A7

loc_280D0:
cmp     byte ptr ds:0BED2h, 8
jz      short loc_280E8
cmp     byte ptr ds:0BED2h, 7
jz      short loc_280E8
cmp     byte ptr ds:0BED2h, 6
jz      short loc_280E8
jmp     loc_2839C

loc_280E8:
les     bx, [bp+var_C]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
call    sub_2A8BF
add     si, ax
cmp     byte ptr ds:0BED2h, 8
jnz     short loc_28113
les     bx, [bp+var_C]
mov     ax, es:[bx+4]
or      ax, es:[bx+6]
jz      short loc_28113
call    sub_26945

loc_28113:
cmp     byte ptr ds:0BED2h, 7
jnz     short loc_2811D
jmp     loc_2823E

loc_2811D:
cmp     byte ptr ds:0BED2h, 6
jnz     short loc_28127
jmp     loc_2823E

loc_28127:
les     bx, [bp+var_C]
les     bx, es:[bx+4]
mov     word ptr [bp+var_C+2], es
mov     word ptr [bp+var_C], bx

loc_28134:
mov     ax, word ptr [bp+var_C]
or      ax, word ptr [bp+var_C+2]
jz      short loc_2813F
jmp     loc_28046

loc_2813F:
jmp     loc_2823E

loc_28142:
xor     si, si
jmp     loc_28212

loc_28147:
mov     [bp+var_4], 1
cmp     word ptr ds:0BDFDh, 0
jz      short loc_28181
jmp     short loc_28167

loc_28155:
push    word ptr ds:0BDFFh
call    sub_283C0
mov     cl, 8
shr     word ptr ds:0BDFFh, cl
inc     word ptr ds:0BE01h
inc     si

loc_28167:
les     bx, [bp+var_C]
mov     ax, es:[bx+0Ah]
cmp     ax, ds:0BE01h
ja      short loc_28155
cmp     word ptr ds:0BDFFh, 0
jnz     short loc_28181
mov     word ptr ds:0BDFDh, 0

loc_28181:
les     bx, [bp+var_C]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
call    sub_2A954
mov     di, ax
cmp     byte ptr ds:22B4h, 0
jz      short loc_281BA
cmp     di, 1
jle     short loc_281BA
mov     ax, si
xor     dx, dx
div     di
or      dx, dx
jz      short loc_281BA
push    di
call    dword ptr ds:0C038h
mov     ax, si
xor     dx, dx
div     di
mov     ax, di
sub     ax, dx
add     si, ax

loc_281BA:
les     bx, [bp+var_C]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
xor     ax, ax
push    ax
call    sub_27D6A
or      dx, ax
jnz     short loc_281D6
jmp     loc_283A7

loc_281D6:
cmp     byte ptr ds:0BED2h, 8
jz      short loc_281E7
cmp     byte ptr ds:0BED2h, 6
jz      short loc_281E7
jmp     loc_2839C

loc_281E7:
cmp     byte ptr ds:0BED2h, 8
jnz     short loc_281F3
call    sub_26945

loc_281F3:
les     bx, [bp+var_C]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
call    sub_2A8BF
add     si, ax
les     bx, [bp+var_C]
les     bx, es:[bx+4]
mov     word ptr [bp+var_C+2], es
mov     word ptr [bp+var_C], bx

loc_28212:
cmp     byte ptr ds:0BED2h, 6
jz      short loc_28224
mov     ax, word ptr [bp+var_C]
or      ax, word ptr [bp+var_C+2]
jz      short loc_28224
jmp     loc_28147

loc_28224:
cmp     byte ptr ds:0BED2h, 6
jz      short loc_28239
mov     ax, 96h
push    ax
call    sub_28E99
inc     sp
inc     sp
jmp     loc_283A7

loc_28239:
call    sub_26945

loc_2823E:
cmp     [bp+var_4], 0
jnz     short loc_2824F
mov     ax, 97h
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_2824F:
cmp     word ptr ds:0BDFDh, 0
jz      short loc_28273
jmp     short loc_28266

loc_28258:
push    word ptr ds:0BDFFh
call    sub_283C0
mov     cl, 8
shr     word ptr ds:0BDFFh, cl
inc     si

loc_28266:
cmp     word ptr ds:0BDFFh, 0
jnz     short loc_28258
mov     word ptr ds:0BDFDh, 0

loc_28273:
les     bx, [bp+var_10]
mov     ax, es:[bx+10h]
cmp     ax, si
ja      short loc_28281
jmp     loc_283B2

loc_28281:
mov     ax, es:[bx+10h]
sub     ax, si
push    ax
call    dword ptr ds:0BFF0h
jmp     loc_283B2

loc_2828F:              ; jumptable 00027DA6 case 20
xor     ax, ax
push    ax
push    ax
mov     ax, 2
push    ax
call    sub_23062
mov     word ptr [bp+var_14+2], dx
mov     word ptr [bp+var_14], ax
or      ax, dx
jnz     short loc_282A9
jmp     loc_283A7

loc_282A9:
push    dx
push    word ptr [bp+var_14]
les     bx, [bp+arg_4]
push    word ptr es:[bx+2]
push    word ptr es:[bx]
xor     ax, ax
push    ax
mov     ax, 6Bh ; 'k'
push    ax
mov     ax, 0A4h
push    ax
call    sub_21215
mov     word ptr [bp+var_14+2], dx
mov     word ptr [bp+var_14], ax
cmp     word ptr ds:0BDFDh, 0
jnz     short loc_282DA
mov     word ptr ds:0BDFFh, 0

loc_282DA:
mov     word ptr ds:0BDFDh, 1
les     bx, [bp+var_14]
cmp     byte ptr es:[bx], 2
jz      short loc_282F4
mov     ax, 95h
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_282F4:
les     bx, [bp+arg_4]
mov     cl, es:[bx+0Ch]
mov     ax, 1
shl     ax, cl
dec     ax
les     bx, [bp+var_14]
and     ax, es:[bx+6]
mov     [bp+var_2], ax
les     bx, [bp+arg_4]
mov     cl, es:[bx+6]
shl     ax, cl
add     ds:0BDFFh, ax
mov     ax, [bp+arg_2]
mov     ds:0BE01h, ax
cmp     [bp+var_8], 0
jnz     short loc_28327
jmp     loc_283B2

loc_28327:
cmp     byte ptr ds:0BED2h, 6
jnz     short loc_2839C
jmp     loc_283AD

loc_28331:              ; jumptable 00027DA6 cases 15,17
mov     ax, 95h
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_283B2

def_27DA6:              ; jumptable 00027DA6 default case, case 19
xor     ax, ax
push    ax
push    ax
mov     ax, 2
push    ax
call    sub_23062
mov     word ptr [bp+var_14+2], dx
mov     word ptr [bp+var_14], ax
or      ax, dx
jz      short loc_283A7
push    dx
push    word ptr [bp+var_14]
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
xor     ax, ax
push    ax
mov     ax, 6Bh ; 'k'
push    ax
mov     ax, 0A4h
push    ax
call    sub_21215
mov     word ptr [bp+var_14+2], dx
mov     word ptr [bp+var_14], ax
les     bx, [bp+var_14]
cmp     byte ptr es:[bx+1], 2
jle     short loc_28384
call    dword ptr ds:0C048h

loc_28384:
push    word ptr [bp+var_14+2]
push    word ptr [bp+var_14]
call    sub_3D105
cmp     [bp+var_8], 0
jz      short loc_283B2
cmp     byte ptr ds:0BED2h, 6
jz      short loc_283AD

loc_2839C:
mov     ax, 97h
push    ax
call    sub_28E99
inc     sp
inc     sp

loc_283A7:
xor     dx, dx
mov     ax, dx
jmp     short loc_283B8

loc_283AD:
call    sub_26945

loc_283B2:
mov     dx, word ptr [bp+arg_4+2]
mov     ax, word ptr [bp+arg_4]

loc_283B8:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    8
sub_27D6A endp



; Attributes: bp-based frame

sub_283C0 proc near

arg_0= word ptr  4

push    bp
mov     bp, sp
call    dword ptr ds:0C048h
push    [bp+arg_0]
call    dword ptr ds:0C01Ch
pop     bp
retn    2
sub_283C0 endp



; Attributes: bp-based frame

sub_283D2 proc far

arg_0= word ptr  6
arg_2= word ptr  8

push    bp
mov     bp, sp
cmp     byte ptr ds:0BED2h, 9
jnz     short loc_283E1
call    sub_26945

loc_283E1:
push    [bp+arg_2]
push    [bp+arg_0]
xor     ax, ax
push    ax
mov     ax, 1
push    ax
call    sub_27D6A
pop     bp
retf    4
sub_283D2 endp



; Attributes: bp-based frame

sub_283F5 proc far

var_E= dword ptr -0Eh
var_A= word ptr -0Ah
var_8= word ptr -8
var_6= dword ptr -6
var_2= word ptr -2
arg_0= dword ptr  6

push    bp
mov     bp, sp
sub     sp, 0Eh
push    si
push    di
les     bx, [bp+arg_0]
les     bx, es:[bx+0Ch]
mov     word ptr [bp+var_6+2], es
mov     word ptr [bp+var_6], bx
mov     di, ds:0BED4h
mov     ax, ds:0BED6h
mov     [bp+var_2], ax
cmp     byte ptr ds:0BED2h, 9
jnz     short loc_28420
call    sub_26945

loc_28420:
cmp     byte ptr ds:0BED2h, 5
jz      short loc_28431
cmp     byte ptr ds:0BED2h, 32h ; '2'
jz      short loc_28431
jmp     loc_28547

loc_28431:
les     bx, [bp+var_6]
cmp     byte ptr es:[bx+4], 10h
jz      short loc_28445
cmp     byte ptr es:[bx+4], 12h
jz      short loc_28445
jmp     loc_28547

loc_28445:
call    dword ptr ds:0C048h
push    word ptr [bp+var_6+2]
push    word ptr [bp+var_6]
call    sub_2A954
push    ax
call    dword ptr ds:0C038h
mov     si, ds:0BDC9h
push    word ptr [bp+var_6+2]
push    word ptr [bp+var_6]
push    cs
call    near ptr sub_283D2
mov     word ptr [bp+var_6+2], dx
mov     word ptr [bp+var_6], ax
or      ax, dx
jz      short loc_28481
mov     ax, word ptr [bp+var_6]
les     bx, [bp+arg_0]
mov     es:[bx+0Eh], dx
mov     es:[bx+0Ch], ax
jmp     short loc_2848E

loc_28481:
les     bx, [bp+arg_0]
les     bx, es:[bx+0Ch]
mov     word ptr [bp+var_6+2], es
mov     word ptr [bp+var_6], bx

loc_2848E:
les     bx, [bp+arg_0]
or      byte ptr es:[bx+9], 32h
push    word ptr [bp+var_6+2]
push    word ptr [bp+var_6]
push    ds
mov     ax, 67D8h
push    ax
call    sub_299B0
mov     word ptr [bp+var_E+2], dx
mov     word ptr [bp+var_E], ax
les     bx, [bp+var_E]
mov     es:[bx+0Ah], si
mov     al, 7
push    ax
push    word ptr [bp+var_6+2]
push    word ptr [bp+var_6]
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_29943
mov     [bp+var_8], dx
mov     [bp+var_A], ax
mov     al, 17h
push    ax
push    word ptr [bp+var_6+2]
push    word ptr [bp+var_6]
push    dx
push    [bp+var_A]
push    word ptr [bp+var_E+2]
push    word ptr [bp+var_E]
call    sub_29862
mov     word ptr [bp+var_E+2], dx
mov     word ptr [bp+var_E], ax
les     bx, [bp+var_6]
cmp     byte ptr es:[bx+4], 10h
jnz     short loc_28533
push    word ptr ds:0BD80h
push    word ptr ds:0BD7Eh
push    word ptr [bp+var_6+2]
push    bx
call    sub_2A8BF
xor     dx, dx
push    dx
push    ax
call    sub_29A88
mov     [bp+var_8], dx
mov     [bp+var_A], ax
mov     al, 34h ; '4'
push    ax
push    word ptr [bp+var_6+2]
push    word ptr [bp+var_6]
push    word ptr [bp+var_E+2]
push    word ptr [bp+var_E]
push    dx
push    [bp+var_A]
call    sub_29862
mov     word ptr [bp+var_E+2], dx
mov     word ptr [bp+var_E], ax

loc_28533:
push    word ptr [bp+var_E+2]
push    word ptr [bp+var_E]
xor     ax, ax
push    ax
push    ax
push    ax
push    ax
call    sub_2E58A
jmp     loc_285D4

loc_28547:
cmp     byte ptr ds:0BED2h, 5
jnz     short loc_28581
call    sub_26945
xor     ax, ax
push    ax
push    ax
mov     ax, 2
push    ax
call    sub_23062
mov     word ptr [bp+var_E+2], dx
mov     word ptr [bp+var_E], ax
cmp     byte ptr ds:0BED2h, 6
jz      short loc_2857A
mov     ax, 97h
push    ax
call    sub_28E99
inc     sp
inc     sp
jmp     short loc_28594

loc_2857A:
call    sub_26945
jmp     short loc_28594

loc_28581:
xor     ax, ax
push    ax
push    ax
mov     ax, 2
push    ax
call    sub_23062
mov     word ptr [bp+var_E+2], dx
mov     word ptr [bp+var_E], ax

loc_28594:
mov     al, 7
push    ax
push    word ptr [bp+var_6+2]
push    word ptr [bp+var_6]
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_29943
mov     [bp+var_8], dx
mov     [bp+var_A], ax
push    dx
push    ax
push    word ptr [bp+var_E+2]
push    word ptr [bp+var_E]
call    sub_20B97
mov     word ptr [bp+var_E+2], dx
mov     word ptr [bp+var_E], ax
push    dx
push    ax
push    di
push    [bp+var_2]
push    word ptr ds:0BED4h
push    word ptr ds:0BED6h
call    sub_2E58A

loc_285D4:
pop     di
pop     si
mov     sp, bp
pop     bp
retf    4
sub_283F5 endp

seg012 ends


; Segment type: Pure code
seg013 segment byte public 'CODE' use16
assume cs:seg013
;org 0Ch
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing


; Attributes: bp-based frame

sub_285DC proc far

var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 4

loc_285E2:
call    sub_1BA0B
call    sub_26945
or      al, al
jnz     short loc_285F3
jmp     loc_286A6

loc_285F3:
mov     ax, ds:0BE1Dh
mov     ds:0BFB4h, ax
call    sub_2AEAA
cmp     byte ptr ds:0BED2h, 34h ; '4'
jnz     short loc_2860D
call    sub_3B37D
jmp     loc_2869E

loc_2860D:
cmp     byte ptr ds:0BED2h, 6
jnz     short loc_28622
mov     ax, 91h
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     loc_2869E

loc_28622:
mov     al, ds:0BED2h
mov     ah, 0
push    ax
call    sub_286AA
or      ax, ax
jz      short loc_2866A
call    sub_286D6
mov     [bp+var_2], dx
mov     [bp+var_4], ax
or      ax, dx
jz      short loc_285E2
cmp     word ptr ds:0BF51h, 0
jnz     short loc_2864F

loc_28647:
mov     word ptr ds:0BF51h, 1
jmp     short loc_2867A

loc_2864F:
cmp     word ptr ds:0BF51h, 5
jz      short loc_2865D
cmp     word ptr ds:0BF51h, 0Ah
jnz     short loc_2867A

loc_2865D:
mov     ax, 8Ch
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     short loc_28647

loc_2866A:
mov     word ptr ds:0BF51h, 1
mov     [bp+var_2], 0
mov     [bp+var_4], 0

loc_2867A:
cmp     byte ptr ds:0BED2h, 7
jz      short loc_2869E
mov     word ptr ds:0BF4Dh, 0
mov     word ptr ds:0BF4Bh, 0
push    word ptr ds:0BF51h
push    [bp+var_2]
push    [bp+var_4]
mov     ax, 1
push    ax
call    sub_28FBB

loc_2869E:
call    sub_3181D
jmp     loc_285E2

loc_286A6:
mov     sp, bp
pop     bp
retf
sub_285DC endp



; Attributes: bp-based frame

sub_286AA proc far

arg_0= word ptr  6

push    bp
mov     bp, sp
mov     bx, [bp+arg_0]
test    byte ptr [bx+641Ah], 30h
jnz     short loc_286CB
cmp     bx, 2Fh ; '/'
jnz     short loc_286D0
push    word ptr ds:0BEDAh
push    word ptr ds:0BED8h
call    sub_28AB8
or      dx, ax
jz      short loc_286D0

loc_286CB:
mov     ax, 1
jmp     short loc_286D2

loc_286D0:
xor     ax, ax

loc_286D2:
pop     bp
retf    2
sub_286AA endp



; Attributes: bp-based frame

sub_286D6 proc far

var_12= dword ptr -12h
var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 12h
push    si
push    di
mov     word ptr [bp+var_12+2], 0
mov     word ptr [bp+var_12], 0
mov     [bp+var_A], 0
mov     [bp+var_8], 0
mov     [bp+var_6], 0
mov     [bp+var_4], 0
xor     si, si
mov     di, si
mov     ds:0BF51h, si

loc_28704:
mov     [bp+var_2], 0
mov     al, ds:0BED2h
mov     ah, 0
sub     ax, 2Fh ; '/'   ; switch 47 cases
cmp     ax, 2Eh
jbe     short loc_28719
jmp     def_2871D       ; jumptable 0002871D default case, cases 48-52,69-71,74-92

loc_28719:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_2871D[bx] ; switch jump
jpt_2871D dw offset loc_28934 ; jump table for switch statement
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset loc_28780
dw offset loc_2879B
dw offset loc_287B6
dw offset loc_287EC
dw offset loc_287D1
dw offset loc_2884C
dw offset loc_28861
dw offset loc_28881
dw offset loc_28871
dw offset loc_28869
dw offset loc_288AB
dw offset loc_28896
dw offset loc_288E1
dw offset loc_28903
dw offset loc_288C0
dw offset loc_28837
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset loc_28807
dw offset loc_2881F
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset def_2871D
dw offset loc_28879

loc_28780:              ; jumptable 0002871D case 53
cmp     word ptr ds:0BF51h, 0
jz      short loc_28792
mov     ax, 9Ah
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_28792:
mov     word ptr ds:0BF51h, 3
jmp     loc_2895C

loc_2879B:              ; jumptable 0002871D case 54
cmp     word ptr ds:0BF51h, 0
jz      short loc_287AD
mov     ax, 9Ah
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_287AD:
mov     word ptr ds:0BF51h, 2
jmp     loc_2895C

loc_287B6:              ; jumptable 0002871D case 55
cmp     word ptr ds:0BF51h, 0
jz      short loc_287C8
mov     ax, 9Ah
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_287C8:
mov     word ptr ds:0BF51h, 8
jmp     loc_2895C

loc_287D1:              ; jumptable 0002871D case 57
cmp     word ptr ds:0BF51h, 0
jz      short loc_287E3
mov     ax, 9Ah
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_287E3:
mov     word ptr ds:0BF51h, 5
jmp     loc_2895C

loc_287EC:              ; jumptable 0002871D case 56
cmp     word ptr ds:0BF51h, 0
jz      short loc_287FE
mov     ax, 9Ah
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_287FE:
mov     word ptr ds:0BF51h, 0Ah
jmp     loc_2895C

loc_28807:              ; jumptable 0002871D case 72
test    di, 40h
jz      short loc_28818
mov     ax, 9Bh
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_28818:
or      di, 40h
jmp     loc_2895C

loc_2881F:              ; jumptable 0002871D case 73
test    di, 80h
jz      short loc_28830
mov     ax, 9Bh
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_28830:
or      di, 80h
jmp     loc_2895C

loc_28837:              ; jumptable 0002871D case 68
or      si, si
jz      short loc_28846
mov     ax, 9Ch
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_28846:
mov     si, 0Fh
jmp     loc_2895C

loc_2884C:              ; jumptable 0002871D case 58
or      si, si
jz      short loc_2885B
mov     ax, 9Ch
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_2885B:
mov     si, 1
jmp     loc_2895C

loc_28861:              ; jumptable 0002871D case 59
mov     [bp+var_6], 1
jmp     loc_2895C

loc_28869:              ; jumptable 0002871D case 62
mov     [bp+var_4], 1
jmp     loc_2895C

loc_28871:              ; jumptable 0002871D case 61
mov     [bp+var_A], 1
jmp     loc_2895C

loc_28879:              ; jumptable 0002871D case 93
mov     [bp+var_8], 1
jmp     loc_2895C

loc_28881:              ; jumptable 0002871D case 60
or      si, si
jz      short loc_28890
mov     ax, 9Ch
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_28890:
mov     si, 5
jmp     loc_2895C

loc_28896:              ; jumptable 0002871D case 64
or      si, si
jz      short loc_288A5
mov     ax, 9Ch
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_288A5:
mov     si, 0Dh
jmp     loc_2895C

loc_288AB:              ; jumptable 0002871D case 63
or      si, si
jz      short loc_288BA
mov     ax, 9Ch
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_288BA:
mov     si, 0Ch
jmp     loc_2895C

loc_288C0:              ; jumptable 0002871D case 67
or      si, si
jz      short loc_288CF
mov     ax, 9Ch
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_288CF:
call    sub_28D0C
mov     [bp+var_C], dx
mov     [bp+var_E], ax
or      ax, dx
jz      short loc_28923
mov     si, 13h
jmp     short loc_2892D

loc_288E1:              ; jumptable 0002871D case 65
or      si, si
jz      short loc_288F0
mov     ax, 9Ch
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_288F0:
mov     ax, 1
push    ax
call    sub_28B05
mov     [bp+var_C], dx
mov     [bp+var_E], ax
or      ax, dx
jz      short loc_28923
jmp     short loc_2892A

loc_28903:              ; jumptable 0002871D case 66
or      si, si
jz      short loc_28912
mov     ax, 9Ch
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_28912:
mov     ax, 2
push    ax
call    sub_28B05
mov     [bp+var_C], dx
mov     [bp+var_E], ax
or      ax, dx
jnz     short loc_2892A

loc_28923:
xor     dx, dx
mov     ax, dx
jmp     loc_28AB2

loc_2892A:
mov     si, 12h

loc_2892D:
call    sub_2693F
jmp     short loc_2895C

loc_28934:              ; jumptable 0002871D case 47
or      si, si
jnz     short def_2871D ; jumptable 0002871D default case, cases 48-52,69-71,74-92
push    word ptr ds:0BEDAh
push    word ptr ds:0BED8h
call    sub_28AB8
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
or      ax, dx
jz      short def_2871D ; jumptable 0002871D default case, cases 48-52,69-71,74-92
mov     si, 0FFFFh
jmp     short loc_2895C

def_2871D:              ; jumptable 0002871D default case, cases 48-52,69-71,74-92
call    sub_2693F
mov     [bp+var_2], 1

loc_2895C:
call    sub_26945
mov     ax, ds:0BE1Dh
mov     ds:0BFB4h, ax
call    sub_2AEAA
cmp     [bp+var_2], 0
jnz     short loc_28975
jmp     loc_28704

loc_28975:
cmp     [bp+var_4], 0
jz      short loc_28981
cmp     [bp+var_6], 0
jnz     short loc_2898D

loc_28981:
cmp     [bp+var_8], 0
jz      short loc_28998
cmp     [bp+var_A], 0
jz      short loc_28998

loc_2898D:
mov     ax, 9Ch
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_28998:
mov     ax, si
inc     ax              ; switch 21 cases
cmp     ax, 14h
jbe     short loc_289A3
jmp     def_289A7       ; jumptable 000289A7 default case, cases 2-4,6-11,14-17

loc_289A3:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_289A7[bx] ; switch jump
jpt_289A7 dw offset loc_28A2B ; jump table for switch statement
dw offset loc_28A51
dw offset loc_289D6
dw offset def_289A7
dw offset def_289A7
dw offset def_289A7
dw offset loc_28A51
dw offset def_289A7
dw offset def_289A7
dw offset def_289A7
dw offset def_289A7
dw offset def_289A7
dw offset def_289A7
dw offset loc_289F7
dw offset loc_28A06
dw offset def_289A7
dw offset def_289A7
dw offset def_289A7
dw offset def_289A7
dw offset loc_28A15
dw offset loc_28A15

loc_289D6:              ; jumptable 000289A7 case 1
cmp     [bp+var_A], 0
jz      short loc_289E2

loc_289DC:
mov     si, 2
jmp     def_289A7       ; jumptable 000289A7 default case, cases 2-4,6-11,14-17

loc_289E2:
cmp     [bp+var_8], 0
jz      short loc_289EB
jmp     def_289A7       ; jumptable 000289A7 default case, cases 2-4,6-11,14-17

loc_289EB:
cmp     byte ptr ds:22B7h, 0
jnz     short loc_289F5
jmp     def_289A7       ; jumptable 000289A7 default case, cases 2-4,6-11,14-17

loc_289F5:
jmp     short loc_289DC

loc_289F7:              ; jumptable 000289A7 case 12
cmp     [bp+var_4], 0
jnz     short loc_28A00
jmp     def_289A7       ; jumptable 000289A7 default case, cases 2-4,6-11,14-17

loc_28A00:
mov     si, 0Dh
jmp     def_289A7       ; jumptable 000289A7 default case, cases 2-4,6-11,14-17

loc_28A06:              ; jumptable 000289A7 case 13
cmp     [bp+var_4], 0
jnz     short loc_28A0F
jmp     def_289A7       ; jumptable 000289A7 default case, cases 2-4,6-11,14-17

loc_28A0F:
mov     si, 0Eh
jmp     def_289A7       ; jumptable 000289A7 default case, cases 2-4,6-11,14-17

loc_28A15:              ; jumptable 000289A7 cases 18,19
push    si
push    [bp+var_C]
push    [bp+var_E]
push    di
call    sub_2A7EC
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     def_289A7       ; jumptable 000289A7 default case, cases 2-4,6-11,14-17

loc_28A2B:              ; jumptable 000289A7 case -1
or      di, di
jnz     short loc_28A32
jmp     def_289A7       ; jumptable 000289A7 default case, cases 2-4,6-11,14-17

loc_28A32:
push    word ptr [bp+var_12+2]
push    word ptr [bp+var_12]
les     bx, [bp+var_12]
mov     al, es:[bx+5]
mov     ah, 0
or      ax, di
push    ax
call    sub_2A500
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax
jmp     short def_289A7 ; jumptable 000289A7 default case, cases 2-4,6-11,14-17

loc_28A51:              ; jumptable 000289A7 cases 0,5
cmp     [bp+var_4], 0
jz      short loc_28A62
cmp     [bp+var_A], 0
jz      short loc_28A62
mov     si, 9
jmp     short def_289A7 ; jumptable 000289A7 default case, cases 2-4,6-11,14-17

loc_28A62:
cmp     [bp+var_4], 0
jz      short loc_28A6D
mov     si, 8
jmp     short def_289A7 ; jumptable 000289A7 default case, cases 2-4,6-11,14-17

loc_28A6D:
cmp     [bp+var_6], 0
jz      short loc_28A7E
cmp     [bp+var_A], 0
jz      short loc_28A7E
mov     si, 4
jmp     short def_289A7 ; jumptable 000289A7 default case, cases 2-4,6-11,14-17

loc_28A7E:
cmp     [bp+var_6], 0
jz      short loc_28A89
mov     si, 3
jmp     short def_289A7 ; jumptable 000289A7 default case, cases 2-4,6-11,14-17

loc_28A89:
cmp     [bp+var_A], 0
jz      short loc_28A94
mov     si, 6
jmp     short def_289A7 ; jumptable 000289A7 default case, cases 2-4,6-11,14-17

loc_28A94:
mov     si, 5

def_289A7:              ; jumptable 000289A7 default case, cases 2-4,6-11,14-17
mov     ax, word ptr [bp+var_12]
or      ax, word ptr [bp+var_12+2]
jnz     short loc_28AAC
push    si
push    di
call    sub_2A52D
mov     word ptr [bp+var_12+2], dx
mov     word ptr [bp+var_12], ax

loc_28AAC:
mov     dx, word ptr [bp+var_12+2]
mov     ax, word ptr [bp+var_12]

loc_28AB2:
pop     di
pop     si
mov     sp, bp
pop     bp
retf
sub_286D6 endp



; Attributes: bp-based frame

sub_28AB8 proc near

var_4= dword ptr -4
arg_0= word ptr  4
arg_2= word ptr  6

push    bp
mov     bp, sp
sub     sp, 4
cmp     byte ptr ds:9A63h, 3
jnz     short loc_28AD2
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_40BAB
jmp     short loc_28AFF

loc_28AD2:
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1F0E2
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
or      ax, dx
jz      short loc_28AFB
les     bx, [bp+var_4]
cmp     byte ptr es:[bx+8], 8
jnz     short loc_28AFB
mov     dx, es:[bx+0Eh]
mov     ax, es:[bx+0Ch]
jmp     short loc_28AFF

loc_28AFB:
xor     dx, dx
mov     ax, dx

loc_28AFF:
mov     sp, bp
pop     bp
retn    4
sub_28AB8 endp



; Attributes: bp-based frame

sub_28B05 proc near

var_C= dword ptr -0Ch
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4

push    bp
mov     bp, sp
sub     sp, 0Ch
push    si
push    di
mov     si, [bp+arg_0]
mov     di, ds:0BF51h
call    sub_26945
cmp     al, 2Fh ; '/'
jnz     short loc_28B2E
les     bx, ds:0BED8h
mov     [bp+var_2], es
mov     [bp+var_4], bx
call    sub_26945
jmp     short loc_28B38

loc_28B2E:
mov     [bp+var_2], 0
mov     [bp+var_4], 0

loc_28B38:
cmp     byte ptr ds:0BED2h, 5
jz      short loc_28B42
jmp     loc_28BF1

loc_28B42:
cmp     byte ptr ds:9A63h, 3
jnz     short loc_28B54
mov     ax, 40h ; '@'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_28B54:
push    [bp+var_2]
push    [bp+var_4]
push    si
call    sub_2D475
mov     word ptr [bp+var_C+2], dx
mov     word ptr [bp+var_C], ax
jmp     short loc_28BCC

loc_28B68:
push    cs
call    near ptr sub_286D6
mov     [bp+var_6], dx
mov     [bp+var_8], ax
cmp     word ptr ds:0BF51h, 0
jz      short loc_28B84
mov     ax, 8Ch
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_28B84:
cmp     byte ptr ds:0BED2h, 1Fh
jnz     short loc_28BAE
call    sub_26945
mov     ax, 2
push    ax
call    sub_23348
or      ax, ax
jz      short loc_28BC5
push    word ptr [bp+var_C+2]
push    word ptr [bp+var_C]
push    word ptr ds:0BED8h
call    sub_2D9FA
jmp     short loc_28BC5

loc_28BAE:
mov     ax, [bp+var_8]
or      ax, [bp+var_6]
jz      short loc_28BC5
push    [bp+var_6]
push    [bp+var_8]
push    word ptr [bp+var_C+2]
push    word ptr [bp+var_C]
call    sub_28C69

loc_28BC5:
cmp     byte ptr ds:0BED2h, 6
jz      short loc_28BDF

loc_28BCC:
call    sub_26945
cmp     al, 6
jz      short loc_28BDF
cmp     byte ptr ds:0BED2h, 0
jz      short loc_28BDF
jmp     loc_28B68

loc_28BDF:
call    sub_26945
push    word ptr [bp+var_C+2]
push    word ptr [bp+var_C]
call    sub_2DA99
jmp     short loc_28C57

loc_28BF1:
mov     ax, [bp+var_4]
or      ax, [bp+var_2]
jz      short loc_28C42
push    [bp+var_2]
push    [bp+var_4]
call    sub_2D3BB
mov     word ptr [bp+var_C+2], dx
mov     word ptr [bp+var_C], ax
or      ax, dx
jnz     short loc_28C22
push    [bp+var_2]
push    [bp+var_4]
push    si
call    sub_2D475
mov     word ptr [bp+var_C+2], dx
mov     word ptr [bp+var_C], ax
jmp     short loc_28C57

loc_28C22:
les     bx, [bp+var_C]
mov     al, es:[bx+19h]
cbw
cmp     ax, si
jz      short loc_28C57
push    [bp+var_2]
push    [bp+var_4]
mov     ax, 46h ; 'F'
push    ax
call    sub_312DE
add     sp, 6
jmp     short loc_28C57

loc_28C42:
mov     ax, 8Eh
push    ax
call    sub_28E99
inc     sp
inc     sp
mov     word ptr [bp+var_C+2], 0
mov     word ptr [bp+var_C], 0

loc_28C57:
mov     ds:0BF51h, di
mov     dx, word ptr [bp+var_C+2]
mov     ax, word ptr [bp+var_C]
pop     di
pop     si
mov     sp, bp
pop     bp
retn    2
sub_28B05 endp



; Attributes: bp-based frame

sub_28C69 proc near

var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
sub     sp, 8
push    si

loc_28C70:
xor     ax, ax
push    ax
call    sub_25FAE
mov     [bp+var_2], dx
mov     [bp+var_4], ax
or      ax, dx
jnz     short loc_28C85
jmp     loc_28D05

loc_28C85:
push    dx
push    [bp+var_4]
push    [bp+arg_6]
push    [bp+arg_4]
call    sub_2677A
mov     [bp+var_6], dx
mov     [bp+var_8], ax
cmp     byte ptr ds:0BED2h, 1Fh
jnz     short loc_28CC8
call    sub_26945
mov     ax, 2
push    ax
call    sub_23348
or      ax, ax
jz      short loc_28D05
mov     si, ds:0BED8h
or      si, si
jnz     short loc_28CCA
mov     ax, 8Eh
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     short loc_28CCA

loc_28CC8:
xor     si, si

loc_28CCA:
push    word ptr ds:0BF49h
push    word ptr ds:0BF47h
push    [bp+arg_2]
push    [bp+arg_0]
push    [bp+var_6]
push    [bp+var_8]
push    si
call    sub_2D718
cmp     byte ptr ds:0BED2h, 8
jnz     short loc_28CF3
call    sub_26945
jmp     loc_28C70

loc_28CF3:
cmp     byte ptr ds:0BED2h, 7
jz      short loc_28D05
mov     ax, 8Fh
push    ax
call    sub_28E99
inc     sp
inc     sp

loc_28D05:
pop     si
mov     sp, bp
pop     bp
retn    8
sub_28C69 endp



; Attributes: bp-based frame

sub_28D0C proc near

var_10= dword ptr -10h
var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= dword ptr -8
var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 10h
push    si
call    sub_26945
cmp     al, 2Fh ; '/'
jnz     short loc_28D2D
les     bx, ds:0BED8h
mov     [bp+var_2], es
mov     [bp+var_4], bx
call    sub_26945
jmp     short loc_28D37

loc_28D2D:
mov     [bp+var_2], 0
mov     [bp+var_4], 0

loc_28D37:
cmp     byte ptr ds:0BED2h, 5
jz      short loc_28D41
jmp     loc_28E49

loc_28D41:
push    [bp+var_2]
push    [bp+var_4]
mov     ax, 3
push    ax
call    sub_2D475
mov     [bp+var_A], dx
mov     [bp+var_C], ax
xor     si, si
jmp     loc_28E2F

loc_28D5B:
cmp     byte ptr ds:0BED2h, 2Fh ; '/'
jz      short loc_28D65
jmp     loc_28E3B

loc_28D65:
les     bx, ds:0BED8h
mov     [bp+var_2], es
mov     [bp+var_4], bx
call    sub_26945
cmp     byte ptr ds:0BED2h, 9
jnz     short loc_28D8D
call    sub_26945
mov     ax, 4
push    ax
call    sub_23348
mov     si, ds:0BED8h

loc_28D8D:
mov     ax, ds:9A70h
or      ax, ds:9A72h
jz      short loc_28DC4
push    [bp+var_2]
push    [bp+var_4]
mov     ax, 9
push    ax
mov     ax, 13h
push    ax
push    [bp+var_A]
push    [bp+var_C]
xor     ax, ax
push    ax
call    sub_2A7EC
push    dx
push    ax
xor     ax, ax
push    ax
call    sub_1F475
mov     word ptr [bp+var_8+2], dx
mov     word ptr [bp+var_8], ax
jmp     short loc_28DF0

loc_28DC4:
push    [bp+var_2]
push    [bp+var_4]
mov     ax, 9
push    ax
mov     ax, 13h
push    ax
push    [bp+var_A]
push    [bp+var_C]
xor     ax, ax
push    ax
call    sub_2A7EC
push    dx
push    ax
xor     ax, ax
push    ax
call    sub_1F1E6
mov     word ptr [bp+var_8+2], dx
mov     word ptr [bp+var_8], ax

loc_28DF0:
cmp     byte ptr ds:22C0h, 0
jz      short loc_28E20
push    [bp+var_2]
push    [bp+var_4]
push    [bp+var_A]
push    [bp+var_C]
push    word ptr ds:0BD80h
push    word ptr ds:0BD7Eh
xor     ax, ax
push    ax
call    sub_2D718
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
les     bx, [bp+var_10]
mov     es:[bx+0Ah], si

loc_28E20:
les     bx, [bp+var_8]
mov     es:[bx+0Ah], si
inc     si
cmp     byte ptr ds:0BED2h, 8
jnz     short loc_28E3B

loc_28E2F:
call    sub_26945
cmp     al, 6
jz      short loc_28E3B
jmp     loc_28D5B

loc_28E3B:
cmp     byte ptr ds:0BED2h, 6
jnz     short loc_28E7D
call    sub_26945
jmp     short loc_28E8E

loc_28E49:
mov     ax, [bp+var_4]
or      ax, [bp+var_2]
jz      short loc_28E7D
push    [bp+var_2]
push    [bp+var_4]
call    sub_2D3BB
mov     [bp+var_A], dx
mov     [bp+var_C], ax
or      ax, dx
jnz     short loc_28E8E
push    [bp+var_2]
push    [bp+var_4]
mov     ax, 3
push    ax
call    sub_2D475
mov     [bp+var_A], dx
mov     [bp+var_C], ax
jmp     short loc_28E8E

loc_28E7D:
mov     ax, 90h
push    ax
call    sub_28E99
inc     sp
inc     sp
xor     dx, dx
mov     ax, dx
jmp     short loc_28E94

loc_28E8E:
mov     dx, [bp+var_A]
mov     ax, [bp+var_C]

loc_28E94:
pop     si
mov     sp, bp
pop     bp
retn
sub_28D0C endp



; Attributes: bp-based frame

sub_28E99 proc far

arg_0= word ptr  6
arg_2= word ptr  8
arg_4= word ptr  0Ah

push    bp
mov     bp, sp
push    si
push    di
mov     ax, ds:0BE1Dh
mov     ds:0BFB4h, ax
call    sub_2AEAA
mov     al, ds:0BED2h
mov     ah, 0
mov     si, ax
push    [bp+arg_4]
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_312DE
add     sp, 6
cmp     byte ptr ds:0BDB7h, 0
jz      short loc_28EE2
jmp     short loc_28ED3

loc_28ECA:
call    sub_26945
mov     ah, 0
mov     si, ax

loc_28ED3:
or      si, si
jnz     short loc_28EDA
jmp     loc_28F6C

loc_28EDA:
cmp     si, 68h ; 'h'
jnz     short loc_28ECA
jmp     loc_28F6C

loc_28EE2:
cmp     si, 6
jz      short loc_28EEA
jmp     loc_28F51

loc_28EEA:
jmp     loc_28F67

loc_28EED:
cmp     si, 5
jnz     short loc_28F30
mov     di, 1

loc_28EF5:
call    sub_26945
mov     ah, 0
mov     si, ax
mov     ax, ds:0BE1Dh
mov     ds:0BFB4h, ax
call    sub_2AEAA
or      si, si
jz      short loc_28F6C
cmp     si, 6
jnz     short loc_28F19
dec     di
or      di, di
jle     short loc_28F3D
jmp     short loc_28EF5

loc_28F19:
cmp     si, 5
jnz     short loc_28F21
inc     di
jmp     short loc_28EF5

loc_28F21:
cmp     si, 32h ; '2'
jnz     short loc_28EF5
xor     ax, ax
push    ax
call    sub_27C88
jmp     short loc_28EF5

loc_28F30:
cmp     si, 32h ; '2'
jnz     short loc_28F3D
xor     ax, ax
push    ax
call    sub_27C88

loc_28F3D:
call    sub_26945
mov     ah, 0
mov     si, ax
mov     ax, ds:0BE1Dh
mov     ds:0BFB4h, ax
call    sub_2AEAA

loc_28F51:
or      si, si
jz      short loc_28F62
cmp     si, 7
jz      short loc_28F62
cmp     si, 6
jz      short loc_28F62
jmp     loc_28EED

loc_28F62:
cmp     si, 6
jnz     short loc_28F6C

loc_28F67:
call    sub_2693F

loc_28F6C:
pop     di
pop     si
pop     bp
retf
sub_28E99 endp



; Attributes: bp-based frame

sub_28F70 proc far

var_4= word ptr -4
var_2= word ptr -2

push    bp
mov     bp, sp
sub     sp, 4
push    cs
call    near ptr sub_286D6
mov     [bp+var_2], dx
mov     [bp+var_4], ax
or      ax, dx
jz      short loc_28FB7
cmp     word ptr ds:0BF51h, 0
jnz     short loc_28F93
mov     word ptr ds:0BF51h, 5
jmp     short loc_28FA0

loc_28F93:
cmp     word ptr ds:0BF51h, 3
jnz     short loc_28FA0
mov     word ptr ds:0BF51h, 4

loc_28FA0:
cmp     byte ptr ds:0BED2h, 7
jz      short loc_28FB7
push    word ptr ds:0BF51h
push    [bp+var_2]
push    [bp+var_4]
xor     ax, ax
push    ax
call    sub_28FBB

loc_28FB7:
mov     sp, bp
pop     bp
retf
sub_28F70 endp



; Attributes: bp-based frame

sub_28FBB proc near

var_16= word ptr -16h
var_14= word ptr -14h
var_12= word ptr -12h
var_10= word ptr -10h
var_E= dword ptr -0Eh
var_A= word ptr -0Ah
var_8= word ptr -8
var_6= dword ptr -6
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
sub     sp, 16h
push    si
push    di
cmp     [bp+arg_6], 0Ah
jnz     short loc_28FD5
mov     [bp+var_2], 40h ; '@'
mov     [bp+arg_6], 5
jmp     short loc_28FDA

loc_28FD5:
mov     [bp+var_2], 0

loc_28FDA:
mov     si, [bp+var_2]
push    [bp+arg_0]
call    sub_25FAE
mov     [bp+var_8], dx
mov     [bp+var_A], ax
or      ax, dx
jnz     short loc_28FF2
jmp     loc_2936F

loc_28FF2:
cmp     byte ptr ds:0BED2h, 7
jz      short loc_29007
cmp     byte ptr ds:0BED2h, 8
jz      short loc_29007
cmp     byte ptr ds:0BED2h, 9
jnz     short loc_29029

loc_29007:
mov     ax, [bp+arg_2]
or      ax, [bp+arg_4]
jnz     short loc_29029
push    [bp+var_8]
push    [bp+var_A]
call    sub_268F7
or      ax, ax
jz      short loc_29029
mov     ax, 42h ; 'B'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_29029:
mov     ax, [bp+arg_2]
or      ax, [bp+arg_4]
jnz     short loc_2903B
les     bx, ds:0BD7Eh
mov     [bp+arg_4], es
mov     [bp+arg_2], bx

loc_2903B:
push    [bp+var_8]
push    [bp+var_A]
push    [bp+arg_4]
push    [bp+arg_2]
call    sub_2677A
mov     word ptr [bp+var_E+2], dx
mov     word ptr [bp+var_E], ax
mov     di, [bp+arg_6]
cmp     di, 8
jnz     short loc_2909B
cmp     word ptr ds:0BF45h, 0
jz      short loc_2906C
mov     ax, 9Bh
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_2906C:
mov     ax, ds:9A70h
or      ax, ds:9A72h
jnz     short loc_29078
jmp     def_29142       ; jumptable 00029142 default case

loc_29078:
cmp     [bp+arg_0], 0
jnz     short loc_29081
jmp     def_29142       ; jumptable 00029142 default case

loc_29081:
mov     ax, 91h
push    ax
call    sub_312DE
inc     sp
inc     sp
mov     word ptr ds:9A72h, 0
mov     word ptr ds:9A70h, 0
jmp     def_29142       ; jumptable 00029142 default case

loc_2909B:
les     bx, [bp+var_E]
cmp     byte ptr es:[bx+4], 11h
jz      short loc_290A8
jmp     loc_29125

loc_290A8:
mov     ax, ds:9A70h
or      ax, ds:9A72h
jnz     short loc_290C3
cmp     [bp+arg_0], 0
jz      short loc_290C3
cmp     byte ptr ds:0BED2h, 5
jnz     short loc_290C3
call    sub_297BF

loc_290C3:
les     bx, [bp+var_E]
test    byte ptr es:[bx+5], 8
jz      short loc_290D1
or      si, 100h

loc_290D1:
les     bx, [bp+var_E]
mov     al, es:[bx+5]
mov     ah, 0
and     ax, 7
cmp     ax, 1
jnz     short loc_290E6
or      si, 80h

loc_290E6:
mov     ax, ds:9A70h
or      ax, ds:9A72h
jz      short loc_29105
cmp     [bp+arg_0], 0
jz      short loc_29105
push    [bp+arg_6]
push    word ptr [bp+var_E+2]
push    word ptr [bp+var_E]
push    si
call    sub_2937E
jmp     loc_29376

loc_29105:
cmp     [bp+arg_6], 4
jnz     short loc_29116
mov     ax, 8Ch
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_29116:
cmp     [bp+arg_6], 3
jnz     short loc_2911F
jmp     def_29142       ; jumptable 00029142 default case

loc_2911F:
mov     di, 2
jmp     def_29142       ; jumptable 00029142 default case

loc_29125:
les     bx, [bp+var_E]
cmp     byte ptr es:[bx+4], 12h
jnz     short loc_29133
and     si, 0FFBFh

loc_29133:
mov     ax, di
dec     ax              ; switch 5 cases
cmp     ax, 4
jbe     short loc_2913E
jmp     def_29142       ; jumptable 00029142 default case

loc_2913E:
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_29142[bx] ; switch jump
jpt_29142 dw offset loc_29191 ; jump table for switch statement
dw offset loc_29151
dw offset loc_291AA
dw offset loc_291AA
dw offset loc_291AA

loc_29151:              ; jumptable 00029142 case 2
cmp     word ptr ds:0BF45h, 0
jnz     short loc_2915F
cmp     word ptr ds:0C072h, 0
jz      short loc_29163

loc_2915F:
or      si, 100h

loc_29163:
cmp     word ptr ds:0BF43h, 1
jz      short loc_29178
cmp     word ptr ds:0BF43h, 0
jnz     short loc_2917C
cmp     byte ptr ds:22C5h, 0
jz      short loc_2917C

loc_29178:
or      si, 80h

loc_2917C:
cmp     byte ptr ds:0BED2h, 9
jnz     short def_29142 ; jumptable 00029142 default case
cmp     [bp+arg_0], 0
jnz     short loc_2918C
jmp     loc_29365

loc_2918C:
mov     di, 1
jmp     short loc_291C3

loc_29191:              ; jumptable 00029142 case 1
cmp     word ptr ds:0BF43h, 1
jz      short loc_291A6
cmp     word ptr ds:0BF43h, 0
jnz     short loc_291AA ; jumptable 00029142 cases 3-5
cmp     byte ptr ds:22C5h, 0
jz      short loc_291AA ; jumptable 00029142 cases 3-5

loc_291A6:
or      si, 80h

loc_291AA:              ; jumptable 00029142 cases 3-5
cmp     word ptr ds:0BF45h, 0
jz      short loc_291BC
mov     ax, 9Bh
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_291BC:
cmp     byte ptr ds:0BED2h, 9
jnz     short loc_291C9

loc_291C3:
or      si, 10h
jmp     short def_29142 ; jumptable 00029142 default case

loc_291C9:
push    word ptr [bp+var_E+2]
push    word ptr [bp+var_E]
call    sub_2A8BF
or      ax, ax
jnz     short def_29142 ; jumptable 00029142 default case
mov     ax, 5Eh ; '^'
push    ax
call    sub_312DE
inc     sp
inc     sp

def_29142:              ; jumptable 00029142 default case
mov     ax, ds:9A70h
or      ax, ds:9A72h
jz      short loc_29209
push    word ptr ds:0BF49h
push    word ptr ds:0BF47h
push    di
push    word ptr [bp+var_E+2]
push    word ptr [bp+var_E]
push    si
call    sub_1F475
mov     word ptr [bp+var_6+2], dx
mov     word ptr [bp+var_6], ax
jmp     short loc_29224

loc_29209:
push    word ptr ds:0BF49h
push    word ptr ds:0BF47h
push    di
push    word ptr [bp+var_E+2]
push    word ptr [bp+var_E]
push    si
call    sub_1F1E6
mov     word ptr [bp+var_6+2], dx
mov     word ptr [bp+var_6], ax

loc_29224:
cmp     byte ptr ds:0BED2h, 9
jz      short loc_2922E
jmp     loc_29312

loc_2922E:
cmp     di, 1
jz      short loc_29240
cmp     di, 3
jz      short loc_29240
cmp     di, 4
jz      short loc_29240
jmp     loc_292FB

loc_29240:
les     bx, [bp+var_6]
les     bx, es:[bx+0Ch]
test    byte ptr es:[bx+5], 40h
jz      short loc_29285
cmp     byte ptr ds:22C8h, 0
jz      short loc_29285
les     bx, [bp+var_6]
les     bx, es:[bx+0Ch]
cmp     byte ptr es:[bx+4], 10h
jnz     short loc_29285
les     bx, [bp+var_6]
les     bx, es:[bx+0Ch]
les     bx, es:[bx]
cmp     byte ptr es:[bx+4], 2
jg      short loc_29285
call    dword ptr ds:0C044h
mov     [bp+var_12], 1
mov     ax, ds:0BDCBh
mov     [bp+var_10], ax
jmp     short loc_292A3

loc_29285:
call    dword ptr ds:0C048h
les     bx, [bp+var_6]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
call    sub_2A954
push    ax
call    dword ptr ds:0C038h
mov     [bp+var_12], 0

loc_292A3:
push    word ptr [bp+var_6+2]
push    word ptr [bp+var_6]
call    dword ptr ds:0C034h
les     bx, [bp+var_6]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
call    sub_283D2
mov     [bp+var_14], dx
mov     [bp+var_16], ax
cmp     [bp+var_12], 0
jz      short loc_292D8
push    [bp+var_10]
call    sub_31435
les     bx, [bp+var_6]
mov     es:[bx+0Ah], ax

loc_292D8:
mov     ax, [bp+var_16]
or      ax, [bp+var_14]
jz      short loc_292F1
mov     dx, [bp+var_14]
mov     ax, [bp+var_16]
les     bx, [bp+var_6]
mov     es:[bx+0Eh], dx
mov     es:[bx+0Ch], ax

loc_292F1:
les     bx, [bp+var_6]
or      byte ptr es:[bx+9], 22h
jmp     short loc_2934F

loc_292FB:
cmp     di, 5
jz      short loc_29305
cmp     di, 0Ah
jnz     short loc_2934F

loc_29305:
push    word ptr [bp+var_6+2]
push    word ptr [bp+var_6]
call    sub_283F5
jmp     short loc_2934F

loc_29312:
cmp     di, 4
jnz     short loc_2934F
call    dword ptr ds:0C040h
les     bx, [bp+var_6]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
call    sub_2A954
push    ax
call    dword ptr ds:0C038h
push    word ptr [bp+var_6+2]
push    word ptr [bp+var_6]
call    dword ptr ds:0C034h
les     bx, [bp+var_6]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
call    sub_2A8BF
push    ax
call    dword ptr ds:0BFF0h

loc_2934F:
cmp     byte ptr ds:0BED2h, 8
jnz     short loc_2935E
call    sub_26945
jmp     loc_28FDA

loc_2935E:
cmp     byte ptr ds:0BED2h, 7
jz      short loc_29373

loc_29365:
mov     ax, 91h
push    ax
push    cs
call    near ptr sub_28E99
inc     sp
inc     sp

loc_2936F:
xor     ax, ax
jmp     short loc_29376

loc_29373:
mov     ax, 1

loc_29376:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    8
sub_28FBB endp



; Attributes: bp-based frame

sub_2937E proc near

var_14= word ptr -14h
var_12= word ptr -12h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= dword ptr  6
arg_6= word ptr  0Ah

push    bp
mov     bp, sp
sub     sp, 14h
push    si
push    di
mov     si, [bp+arg_6]
cmp     si, 2
jnz     short loc_29391
mov     si, 1

loc_29391:
push    word ptr ds:0BF49h
push    word ptr ds:0BF47h
push    si
push    word ptr [bp+arg_2+2]
push    word ptr [bp+arg_2]
mov     ax, [bp+arg_0]
or      ax, 10h
push    ax
call    sub_1F1E6
mov     word ptr [bp+var_10+2], dx
mov     word ptr [bp+var_10], ax
les     bx, [bp+var_10]
mov     word ptr ds:0BEFDh, es
mov     ds:0BEFBh, bx
mov     bx, ax
les     bx, es:[bx+0Ch]
les     bx, es:[bx]
mov     word ptr ds:0BF11h, es
mov     ds:0BF0Fh, bx
mov     word ptr ds:9A72h, ds
mov     word ptr ds:9A70h, 0BEE6h
mov     byte ptr ds:0BE04h, 1
les     bx, [bp+var_10]
les     bx, es:[bx]
mov     word ptr ds:0BFB2h, es
mov     ds:0BFB0h, bx
push    word ptr ds:0BF53h
push    word ptr ds:0BF4Fh
call    sub_2EDAE
les     bx, [bp+arg_2]
mov     ax, es:[bx+8]
or      ax, es:[bx+0Ah]
jz      short loc_29408
jmp     loc_294FD

loc_29408:
mov     ax, ds:0BF4Bh
or      ax, ds:0BF4Dh
jnz     short loc_29414
jmp     loc_294FD

loc_29414:
jmp     loc_294A2

loc_29417:
mov     al, ds:0BED2h
mov     ah, 0
push    ax
push    cs
call    near ptr sub_286AA
or      ax, ax
jz      short loc_29485
push    cs
call    near ptr sub_286D6
mov     [bp+var_12], dx
mov     [bp+var_14], ax
or      ax, dx
jnz     short loc_29436
jmp     loc_294A2

loc_29436:
cmp     word ptr ds:0BF51h, 0
jz      short loc_29456
cmp     word ptr ds:0BF51h, 0Ah
jz      short loc_2945C
cmp     word ptr ds:0BF51h, 8
jz      short loc_2945C
mov     ax, 8Ch
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_29456:
mov     word ptr ds:0BF51h, 6

loc_2945C:
cmp     byte ptr ds:0BED2h, 7
jz      short loc_2949D
push    word ptr ds:0BF51h
push    [bp+var_12]
push    [bp+var_14]
call    sub_29709
or      ax, ax
jnz     short loc_2949D
mov     word ptr ds:9A72h, 0
mov     word ptr ds:9A70h, 0
xor     ax, ax
jmp     loc_29609

loc_29485:
mov     ax, 91h
push    ax
push    cs
call    near ptr sub_28E99
inc     sp
inc     sp
cmp     byte ptr ds:0BED2h, 6
jnz     short loc_2949D
call    sub_2693F
jmp     short loc_294B3

loc_2949D:
call    sub_26945

loc_294A2:
cmp     byte ptr ds:0BED2h, 0
jz      short loc_294B3
cmp     byte ptr ds:0BED2h, 5
jz      short loc_294B3
jmp     loc_29417

loc_294B3:
mov     dx, ds:0BF4Dh
mov     ax, ds:0BF4Bh
mov     word ptr [bp+var_C+2], dx
mov     word ptr [bp+var_C], ax
push    dx
push    ax
call    sub_1F71E
les     bx, [bp+var_10]
les     bx, es:[bx+0Ch]
les     bx, es:[bx+8]
mov     [bp+var_6], es
mov     [bp+var_8], bx
mov     ax, bx
or      ax, [bp+var_6]
jz      short loc_2950A
push    word ptr [bp+var_10+2]
push    word ptr [bp+var_10]
push    word ptr es:[bx+6]
push    word ptr es:[bx+4]
les     bx, [bp+var_C]
push    word ptr es:[bx+6]
push    word ptr es:[bx+4]
call    sub_29611
jmp     short loc_2950A

loc_294FD:
les     bx, [bp+arg_2]
les     bx, es:[bx+8]
mov     word ptr [bp+var_C+2], es
mov     word ptr [bp+var_C], bx

loc_2950A:
mov     ax, word ptr [bp+var_C]
or      ax, word ptr [bp+var_C+2]
jz      short loc_29529
push    word ptr [bp+var_C+2]
push    word ptr [bp+var_C]
call    sub_1F8FA
les     bx, [bp+var_C]
mov     ax, es:[bx+12h]
mov     ds:0BF15h, ax
jmp     short loc_2952F

loc_29529:
mov     word ptr ds:0BF15h, 0

loc_2952F:
les     bx, ds:0BEFBh
les     bx, es:[bx+0Ch]
les     bx, es:[bx]
mov     [bp+var_12], es
mov     [bp+var_14], bx
push    [bp+var_12]
push    bx
call    sub_3B34A
or      ax, ax
jz      short loc_29573
call    dword ptr ds:0C040h
cmp     word ptr ds:0C064h, 0
jz      short loc_2955D
mov     ax, ds:0BDCDh
jmp     short loc_29560

loc_2955D:
mov     ax, ds:0BDC9h

loc_29560:
mov     ds:0BF0Bh, ax
push    [bp+var_12]
push    [bp+var_14]
call    sub_2A8BF
push    ax
call    dword ptr ds:0BFF0h

loc_29573:
cmp     byte ptr ds:22C0h, 0
jz      short loc_2958D
push    word ptr ds:9A72h
push    word ptr ds:9A70h
call    sub_2EDE8
mov     [bp+var_2], dx
mov     [bp+var_4], ax

loc_2958D:
mov     ax, 1
push    ax
call    sub_24A3A
mov     di, ax
push    word ptr ds:0BF09h
push    word ptr ds:0BF07h
call    sub_2ED30
call    sub_2DC3F
les     bx, [bp+arg_2]
mov     al, es:[bx+5]
mov     ds:0BF14h, al
or      di, di
jz      short loc_295E2
les     bx, ds:0BF0Fh
cmp     byte ptr es:[bx+4], 0Fh
jz      short loc_295D0
mov     ax, 0AFh
push    ax
call    sub_31324
inc     sp
inc     sp
jmp     short loc_295E2

loc_295D0:
cmp     byte ptr ds:0BF13h, 2
jnz     short loc_295E2
mov     ax, 0AEh
push    ax
call    sub_31324
inc     sp
inc     sp

loc_295E2:
push    [bp+var_2]
push    [bp+var_4]
push    word ptr ds:0BED4h
push    word ptr ds:0BED6h
call    sub_2ED5C
mov     word ptr ds:0BFB2h, 0
mov     word ptr ds:0BFB0h, 0
mov     byte ptr ds:0BE04h, 1
mov     ax, 1

loc_29609:
pop     di
pop     si
mov     sp, bp
pop     bp
retn    8
sub_2937E endp



; Attributes: bp-based frame

sub_29611 proc near

var_8= dword ptr -8
var_4= word ptr -4
var_2= word ptr -2
arg_0= dword ptr  4
arg_4= dword ptr  8
arg_8= dword ptr  0Ch

push    bp
mov     bp, sp
sub     sp, 8
push    si
jmp     loc_296C6

loc_2961B:
les     bx, [bp+arg_0]
les     bx, es:[bx+0Ch]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
mov     al, es:[bx+4]
cbw
mov     bx, ax
shl     bx, 1
mov     si, [bx+7BA2h]
or      si, si
jz      short loc_29679
push    si
mov     bx, word ptr [bp+var_8]
mov     al, es:[bx+5]
mov     ah, 0
push    ax
call    sub_2A52D
mov     [bp+var_2], dx
mov     [bp+var_4], ax
push    dx
push    ax
les     bx, [bp+arg_4]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
xor     ax, ax
push    ax
call    sub_2A221
or      ax, ax
jnz     short loc_296AC
les     bx, [bp+var_8]
mov     al, es:[bx+4]
cbw
mov     bx, ax
cmp     byte ptr [bx+7BCCh], 0
jnz     short loc_29696

loc_29679:
push    word ptr [bp+var_8+2]
push    word ptr [bp+var_8]
les     bx, [bp+arg_4]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
xor     ax, ax
push    ax
call    sub_2A221
or      ax, ax
jnz     short loc_296AC

loc_29696:
les     bx, [bp+arg_0]
push    word ptr es:[bx+2]
push    word ptr es:[bx]
mov     ax, 55h ; 'U'
push    ax
call    sub_312DE
add     sp, 6

loc_296AC:
les     bx, [bp+arg_0]
les     bx, es:[bx+4]
mov     word ptr [bp+arg_0+2], es
mov     word ptr [bp+arg_0], bx
les     bx, [bp+arg_4]
les     bx, es:[bx+4]
mov     word ptr [bp+arg_4+2], es
mov     word ptr [bp+arg_4], bx

loc_296C6:
mov     ax, word ptr [bp+arg_0]
or      ax, word ptr [bp+arg_0+2]
jz      short loc_296D9
mov     ax, word ptr [bp+arg_4]
or      ax, word ptr [bp+arg_4+2]
jz      short loc_296D9
jmp     loc_2961B

loc_296D9:
les     bx, [bp+arg_8]
les     bx, es:[bx+0Ch]
test    byte ptr es:[bx+5], 80h
jnz     short loc_296EF
mov     ax, word ptr [bp+arg_0]
or      ax, word ptr [bp+arg_0+2]
jnz     short loc_296F7

loc_296EF:
mov     ax, word ptr [bp+arg_4]
or      ax, word ptr [bp+arg_4+2]
jz      short loc_29702

loc_296F7:
mov     ax, 2Ah ; '*'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_29702:
pop     si
mov     sp, bp
pop     bp
retn    0Ch
sub_29611 endp



; Attributes: bp-based frame

sub_29709 proc near

var_8= dword ptr -8
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  4
arg_2= word ptr  6
arg_4= word ptr  8

push    bp
mov     bp, sp
sub     sp, 8
push    si
mov     si, [bp+arg_4]

loc_29713:
xor     ax, ax
push    ax
call    sub_25FAE
mov     [bp+var_2], dx
mov     [bp+var_4], ax
or      ax, dx
jnz     short loc_29728
jmp     loc_297B1

loc_29728:
push    dx
push    [bp+var_4]
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_2677A
mov     word ptr [bp+var_8+2], dx
mov     word ptr [bp+var_8], ax
les     bx, [bp+var_8]
cmp     byte ptr es:[bx+4], 11h
jnz     short loc_29757
push    dx
push    ax
xor     ax, ax
push    ax
call    sub_2A771
mov     word ptr [bp+var_8+2], dx
mov     word ptr [bp+var_8], ax

loc_29757:
cmp     si, 8
jnz     short loc_29775
push    word ptr ds:0BF49h
push    word ptr ds:0BF47h
push    si
push    word ptr [bp+var_8+2]
push    word ptr [bp+var_8]
xor     ax, ax
push    ax
call    sub_1F1E6
jmp     short loc_29791

loc_29775:
push    word ptr ds:0BF4Dh
push    word ptr ds:0BF4Bh
push    word ptr ds:0BF49h
push    word ptr ds:0BF47h
push    si
push    word ptr [bp+var_8+2]
push    word ptr [bp+var_8]
call    sub_1F630

loc_29791:
cmp     byte ptr ds:0BED2h, 8
jnz     short loc_297A0
call    sub_26945
jmp     loc_29713

loc_297A0:
cmp     byte ptr ds:0BED2h, 7
jz      short loc_297B5
mov     ax, 91h
push    ax
push    cs
call    near ptr sub_28E99
inc     sp
inc     sp

loc_297B1:
xor     ax, ax
jmp     short loc_297B8

loc_297B5:
mov     ax, 1

loc_297B8:
pop     si
mov     sp, bp
pop     bp
retn    6
sub_29709 endp




sub_297BF proc far
push    si
mov     ax, ds:9A70h
or      ax, ds:9A72h
jz      short loc_297D6
mov     ax, 92h
push    ax
call    sub_312DE
inc     sp
inc     sp
jmp     short loc_2980F

loc_297D6:
push    ds
mov     ax, 0BEE6h
push    ax
mov     ax, 3Fh ; '?'
push    ax
mov     al, 0
push    ax
call    sub_46C10
call    sub_29B45
mov     ds:0BF09h, dx
mov     ds:0BF07h, ax
mov     word ptr ds:0BDA9h, 0
mov     word ptr ds:9A72h, ds
mov     word ptr ds:9A70h, 0BEE6h
mov     word ptr ds:0BF4Dh, 0
mov     word ptr ds:0BF4Bh, 0

loc_2980F:
pop     si
retf
sub_297BF endp

seg013 ends


; Segment type: Pure code
seg014 segment byte public 'CODE' use16
assume cs:seg014
;org 1
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing


; Attributes: bp-based frame

sub_29811 proc far

var_4= dword ptr -4

push    bp
mov     bp, sp
sub     sp, 4
mov     ax, 10h
push    ax
call    sub_318B7
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
les     bx, [bp+var_4]
mov     byte ptr es:[bx+1], 0
mov     bx, ax
mov     word ptr es:[bx+4], 0
mov     word ptr es:[bx+2], 0
mov     bx, ax
mov     byte ptr es:[bx], 0
mov     bx, ax
mov     word ptr es:[bx+8], 0
mov     word ptr es:[bx+6], 0
mov     bx, ax
mov     word ptr es:[bx+0Ch], 0
mov     word ptr es:[bx+0Ah], 0
mov     sp, bp
pop     bp
retf
sub_29811 endp



; Attributes: bp-based frame

sub_29862 proc far

var_4= dword ptr -4
arg_0= word ptr  6
arg_2= word ptr  8
arg_4= word ptr  0Ah
arg_6= word ptr  0Ch
arg_8= dword ptr  0Eh
arg_C= byte ptr  12h

push    bp
mov     bp, sp
sub     sp, 4
mov     ax, 0Eh
push    ax
call    sub_318B7
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
mov     dx, word ptr [bp+arg_8+2]
mov     ax, word ptr [bp+arg_8]
les     bx, [bp+var_4]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
mov     al, [bp+arg_C]
mov     es:[bx], al
mov     ax, word ptr [bp+arg_8]
or      ax, dx
jz      short loc_298A5
les     bx, [bp+arg_8]
mov     al, es:[bx+4]
les     bx, [bp+var_4]
mov     es:[bx+1], al
jmp     short loc_298AD

loc_298A5:
les     bx, [bp+var_4]
mov     byte ptr es:[bx+1], 0

loc_298AD:
mov     dx, [bp+arg_6]
mov     ax, [bp+arg_4]
les     bx, [bp+var_4]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
mov     dx, [bp+arg_2]
mov     ax, [bp+arg_0]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
mov     dx, word ptr [bp+var_4+2]
mov     ax, bx
mov     sp, bp
pop     bp
retf    0Eh
sub_29862 endp



; Attributes: bp-based frame

sub_298D7 proc far

var_4= dword ptr -4
arg_0= word ptr  6
arg_2= dword ptr  8
arg_6= byte ptr  0Ch

push    bp
mov     bp, sp
sub     sp, 4
mov     ax, 0Ch
push    ax
call    sub_318B7
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
mov     dx, word ptr [bp+arg_2+2]
mov     ax, word ptr [bp+arg_2]
les     bx, [bp+var_4]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
mov     al, [bp+arg_6]
mov     es:[bx], al
mov     ax, word ptr [bp+arg_2]
or      ax, dx
jz      short loc_2991A
les     bx, [bp+arg_2]
mov     al, es:[bx+4]
les     bx, [bp+var_4]
mov     es:[bx+1], al
jmp     short loc_29922

loc_2991A:
les     bx, [bp+var_4]
mov     byte ptr es:[bx+1], 0

loc_29922:
mov     ax, [bp+arg_0]
les     bx, [bp+var_4]
mov     es:[bx+0Ah], ax
mov     word ptr es:[bx+8], 0
mov     word ptr es:[bx+6], 0
mov     dx, word ptr [bp+var_4+2]
mov     ax, bx
mov     sp, bp
pop     bp
retf    8
sub_298D7 endp



; Attributes: bp-based frame

sub_29943 proc far

var_4= dword ptr -4
arg_0= word ptr  6
arg_2= word ptr  8
arg_4= dword ptr  0Ah
arg_8= byte ptr  0Eh

push    bp
mov     bp, sp
sub     sp, 4
mov     ax, 0Ch
push    ax
call    sub_318B7
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
mov     dx, word ptr [bp+arg_4+2]
mov     ax, word ptr [bp+arg_4]
les     bx, [bp+var_4]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
mov     al, [bp+arg_8]
mov     es:[bx], al
mov     ax, word ptr [bp+arg_4]
or      ax, dx
jz      short loc_29986
les     bx, [bp+arg_4]
mov     al, es:[bx+4]
les     bx, [bp+var_4]
mov     es:[bx+1], al
jmp     short loc_2998E

loc_29986:
les     bx, [bp+var_4]
mov     byte ptr es:[bx+1], 0

loc_2998E:
mov     dx, [bp+arg_2]
mov     ax, [bp+arg_0]
les     bx, [bp+var_4]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
mov     word ptr es:[bx+0Ah], 0
mov     dx, word ptr [bp+var_4+2]
mov     ax, bx
mov     sp, bp
pop     bp
retf    0Ah
sub_29943 endp



; Attributes: bp-based frame

sub_299B0 proc far

var_4= dword ptr -4
arg_0= word ptr  6
arg_2= word ptr  8
arg_4= dword ptr  0Ah

push    bp
mov     bp, sp
sub     sp, 4
mov     ax, 0Ch
push    ax
call    sub_318B7
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
mov     dx, word ptr [bp+arg_4+2]
mov     ax, word ptr [bp+arg_4]
les     bx, [bp+var_4]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
mov     byte ptr es:[bx], 1
or      ax, dx
jz      short loc_299EE
les     bx, [bp+arg_4]
mov     al, es:[bx+4]
les     bx, [bp+var_4]
mov     es:[bx+1], al
jmp     short loc_299F6

loc_299EE:
les     bx, [bp+var_4]
mov     byte ptr es:[bx+1], 0

loc_299F6:
les     bx, [bp+var_4]
mov     word ptr es:[bx+0Ah], 0
mov     dx, [bp+arg_2]
mov     ax, [bp+arg_0]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
mov     dx, word ptr [bp+var_4+2]
mov     ax, bx
mov     sp, bp
pop     bp
retf    8
sub_299B0 endp



; Attributes: bp-based frame

sub_29A18 proc far

var_4= dword ptr -4
arg_0= byte ptr  6
arg_2= byte ptr  8
arg_4= word ptr  0Ah
arg_6= word ptr  0Ch
arg_8= dword ptr  0Eh

push    bp
mov     bp, sp
sub     sp, 4
mov     ax, 0Ch
push    ax
call    sub_318B7
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
mov     dx, word ptr [bp+arg_8+2]
mov     ax, word ptr [bp+arg_8]
les     bx, [bp+var_4]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
mov     byte ptr es:[bx], 2Dh ; '-'
or      ax, dx
jz      short loc_29A56
les     bx, [bp+arg_8]
mov     al, es:[bx+4]
les     bx, [bp+var_4]
mov     es:[bx+1], al
jmp     short loc_29A5E

loc_29A56:
les     bx, [bp+var_4]
mov     byte ptr es:[bx+1], 0

loc_29A5E:
mov     dx, [bp+arg_6]
mov     ax, [bp+arg_4]
les     bx, [bp+var_4]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
mov     al, [bp+arg_2]
mov     es:[bx+0Ah], al
mov     al, [bp+arg_0]
mov     es:[bx+0Bh], al
mov     dx, word ptr [bp+var_4+2]
mov     ax, bx
mov     sp, bp
pop     bp
retf    0Ch
sub_29A18 endp



; Attributes: bp-based frame

sub_29A88 proc far

var_4= dword ptr -4
arg_0= word ptr  6
arg_2= word ptr  8
arg_4= dword ptr  0Ah

push    bp
mov     bp, sp
sub     sp, 4
mov     ax, 0Ah
push    ax
call    sub_318B7
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
mov     dx, word ptr [bp+arg_4+2]
mov     ax, word ptr [bp+arg_4]
les     bx, [bp+var_4]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
mov     byte ptr es:[bx], 2
or      ax, dx
jz      short loc_29AC6
les     bx, [bp+arg_4]
mov     al, es:[bx+4]
les     bx, [bp+var_4]
mov     es:[bx+1], al
jmp     short loc_29ACE

loc_29AC6:
les     bx, [bp+var_4]
mov     byte ptr es:[bx+1], 0

loc_29ACE:
mov     dx, [bp+arg_2]
mov     ax, [bp+arg_0]
les     bx, [bp+var_4]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
mov     dx, word ptr [bp+var_4+2]
mov     ax, bx
mov     sp, bp
pop     bp
retf    8
sub_29A88 endp



; Attributes: bp-based frame

sub_29AEA proc far

var_4= dword ptr -4
arg_0= word ptr  6
arg_2= word ptr  8
arg_4= word ptr  0Ah

push    bp
mov     bp, sp
sub     sp, 4
mov     ax, 10h
push    ax
call    sub_318B7
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
push    [bp+arg_0]
xor     ax, ax
push    ax
call    sub_2A52D
les     bx, [bp+var_4]
mov     es:[bx+4], dx
mov     es:[bx+2], ax
mov     byte ptr es:[bx], 3
mov     al, byte ptr [bp+arg_0]
mov     es:[bx+1], al
push    [bp+arg_4]
push    [bp+arg_2]
mov     dx, word ptr [bp+var_4+2]
mov     ax, bx
add     ax, 6
push    dx
push    ax
mov     ax, 0Ah
push    ax
call    sub_46A2C
mov     dx, word ptr [bp+var_4+2]
mov     ax, word ptr [bp+var_4]
mov     sp, bp
pop     bp
retf    6
sub_29AEA endp



; Attributes: bp-based frame

sub_29B45 proc far

var_4= dword ptr -4

push    bp
mov     bp, sp
sub     sp, 4
mov     ax, 16h
push    ax
call    sub_318B7
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
push    dx
push    ax
mov     ax, 16h
push    ax
mov     al, 0
push    ax
call    sub_46C10
les     bx, [bp+var_4]
mov     byte ptr es:[bx], 5
mov     ax, ds:0BD92h
mov     es:[bx+12h], ax
inc     word ptr ds:0BD92h
mov     dx, word ptr [bp+var_4+2]
mov     ax, bx
mov     bx, ax
mov     es:[bx+10h], dx
mov     es:[bx+0Eh], ax
mov     bx, ax
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
mov     sp, bp
pop     bp
retf
sub_29B45 endp



; Attributes: bp-based frame

sub_29B97 proc far

var_4= dword ptr -4

push    bp
mov     bp, sp
sub     sp, 4
push    cs
call    near ptr sub_29B45
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
mov     ax, 2
push    ax
call    sub_3193F
les     bx, [bp+var_4]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
mov     dx, word ptr [bp+var_4+2]
mov     ax, bx
mov     sp, bp
pop     bp
retf
sub_29B97 endp



; Attributes: bp-based frame

sub_29BC4 proc far

var_10= dword ptr -10h
var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= dword ptr -8
var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  6
arg_2= word ptr  8
arg_4= dword ptr  0Ah
arg_8= word ptr  0Eh

push    bp
mov     bp, sp
sub     sp, 10h
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_29EB7
or      ax, ax
jnz     short loc_29BDA
jmp     loc_29CD6

loc_29BDA:
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx], 2Dh ; '-'
jnz     short loc_29BEF
les     bx, es:[bx+6]
mov     word ptr [bp+var_10+2], es
mov     word ptr [bp+var_10], bx
jmp     short loc_29BF8

loc_29BEF:
les     bx, [bp+arg_4]
mov     word ptr [bp+var_10+2], es
mov     word ptr [bp+var_10], bx

loc_29BF8:
les     bx, [bp+var_10]
les     bx, es:[bx+6]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
xor     ax, ax
push    ax
push    ax
mov     ax, 5
push    ax
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
mov     ax, 1
push    ax
call    sub_1F475
mov     [bp+var_2], dx
mov     [bp+var_4], ax
mov     al, 7
push    ax
les     bx, [bp+var_8]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    dx
push    [bp+var_4]
push    cs
call    near ptr sub_29943
mov     [bp+var_A], dx
mov     [bp+var_C], ax
mov     al, 7
push    ax
les     bx, [bp+var_8]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    [bp+var_2]
push    [bp+var_4]
push    cs
call    near ptr sub_29943
les     bx, [bp+var_10]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
mov     ax, 17h
push    ax
push    [bp+var_A]
push    [bp+var_C]
push    word ptr [bp+var_8+2]
push    word ptr [bp+var_8]
call    sub_1FF72
mov     [bp+var_A], dx
mov     [bp+var_C], ax
mov     ax, [bp+arg_8]
add     ax, 0FFF5h
push    ax
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_29F7C
push    dx
push    ax
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1FF72
mov     [bp+arg_2], dx
mov     [bp+arg_0], ax
mov     ax, 17h
push    ax
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
push    dx
push    [bp+arg_0]
call    sub_1FF72
mov     word ptr [bp+var_8+2], dx
mov     word ptr [bp+var_8], ax
mov     al, 38h ; '8'
push    ax
les     bx, [bp+var_8]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    [bp+var_A]
push    [bp+var_C]
push    dx
push    bx
push    cs
call    near ptr sub_29862
jmp     short loc_29D09

loc_29CD6:
mov     ax, 17h
push    ax
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_2A00F
push    dx
push    ax
mov     ax, [bp+arg_8]
add     ax, 0FFF5h
push    ax
push    word ptr [bp+arg_4+2]
push    word ptr [bp+arg_4]
call    sub_29F7C
push    dx
push    ax
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_1FF72
push    dx
push    ax
call    sub_1FF72

loc_29D09:
mov     sp, bp
pop     bp
retf    0Ah
sub_29BC4 endp



; Attributes: bp-based frame

sub_29D0F proc far

var_10= word ptr -10h
var_E= word ptr -0Eh
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= word ptr -4
var_2= word ptr -2
arg_0= dword ptr  6
arg_4= word ptr  0Ah

push    bp
mov     bp, sp
sub     sp, 10h
push    si
mov     si, [bp+arg_4]
push    ds
mov     ax, 67A8h
push    ax
mov     ax, 0Ch
push    ax
push    cs
call    near ptr sub_29AEA
mov     [bp+var_E], dx
mov     [bp+var_10], ax
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_29EB7
or      ax, ax
jnz     short loc_29D3C
jmp     loc_29E38

loc_29D3C:
cmp     si, 2Eh ; '.'
jnz     short loc_29D46
mov     si, 0Dh
jmp     short loc_29D49

loc_29D46:
mov     si, 0Eh

loc_29D49:
les     bx, [bp+arg_0]
les     bx, es:[bx+6]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
xor     ax, ax
push    ax
push    ax
mov     ax, 5
push    ax
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
mov     ax, 1
push    ax
call    sub_1F475
mov     [bp+var_2], dx
mov     [bp+var_4], ax
mov     al, 7
push    ax
les     bx, [bp+var_8]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    dx
push    [bp+var_4]
push    cs
call    near ptr sub_29943
mov     word ptr [bp+var_C+2], dx
mov     word ptr [bp+var_C], ax
mov     al, 7
push    ax
les     bx, [bp+var_8]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    [bp+var_2]
push    [bp+var_4]
push    cs
call    near ptr sub_29943
les     bx, [bp+arg_0]
mov     es:[bx+8], dx
mov     es:[bx+6], ax
mov     ax, 17h
push    ax
push    word ptr [bp+var_C+2]
push    word ptr [bp+var_C]
push    word ptr [bp+var_8+2]
push    word ptr [bp+var_8]
call    sub_1FF72
mov     word ptr [bp+var_C+2], dx
mov     word ptr [bp+var_C], ax
mov     ax, 2Bh ; '+'
push    ax
push    dx
push    word ptr [bp+var_C]
xor     ax, ax
push    ax
push    ax
call    sub_1FF72
mov     word ptr [bp+var_C+2], dx
mov     word ptr [bp+var_C], ax
push    si
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_29F7C
push    dx
push    ax
push    [bp+var_E]
push    [bp+var_10]
call    sub_1FF72
mov     [bp+var_E], dx
mov     [bp+var_10], ax
mov     ax, 17h
push    ax
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
push    dx
push    [bp+var_10]
call    sub_1FF72
mov     word ptr [bp+var_8+2], dx
mov     word ptr [bp+var_8], ax
mov     al, 37h ; '7'
push    ax
les     bx, [bp+var_C]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    word ptr [bp+var_C+2]
push    bx
push    dx
push    word ptr [bp+var_8]
push    cs
call    near ptr sub_29862
jmp     short loc_29EB0

loc_29E38:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_29F7C
mov     word ptr [bp+var_C+2], dx
mov     word ptr [bp+var_C], ax
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_2A00F
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
cmp     si, 2Eh ; '.'
jnz     short loc_29E60
mov     si, 0Dh
jmp     short loc_29E63

loc_29E60:
mov     si, 0Eh

loc_29E63:
mov     ax, 17h
push    ax
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_2A00F
push    dx
push    ax
push    si
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_29F7C
push    dx
push    ax
push    [bp+var_E]
push    [bp+var_10]
call    sub_1FF72
push    dx
push    ax
call    sub_1FF72
mov     [bp+var_E], dx
mov     [bp+var_10], ax
mov     al, 37h ; '7'
push    ax
les     bx, [bp+var_C]
push    word ptr es:[bx+4]
push    word ptr es:[bx+2]
push    word ptr [bp+var_C+2]
push    bx
push    dx
push    [bp+var_10]
push    cs
call    near ptr sub_29862

loc_29EB0:
pop     si
mov     sp, bp
pop     bp
retf    6
sub_29D0F endp



; Attributes: bp-based frame

sub_29EB7 proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
mov     ax, word ptr [bp+arg_0]
or      ax, word ptr [bp+arg_0+2]
jz      short loc_29F01 ; jumptable 00029EDA cases 1-4
les     bx, [bp+arg_0]
mov     al, es:[bx]
cbw
cmp     ax, 5
jz      short loc_29F01 ; jumptable 00029EDA cases 1-4
jg      short loc_29EE7
dec     ax              ; switch 4 cases
cmp     ax, 3
ja      short def_29EDA ; jumptable 00029EDA default case
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_29EDA[bx] ; switch jump
jpt_29EDA dw offset loc_29F01 ; jump table for switch statement
dw offset loc_29F01
dw offset loc_29F01
dw offset loc_29F01

loc_29EE7:
cmp     ax, 2Dh ; '-'
jz      short loc_29F05
jg      short loc_29EFA
cmp     ax, 7
jz      short loc_29F01 ; jumptable 00029EDA cases 1-4
cmp     ax, 8
jz      short loc_29F01 ; jumptable 00029EDA cases 1-4
jmp     short def_29EDA ; jumptable 00029EDA default case

loc_29EFA:
cmp     ax, 36h ; '6'
jz      short loc_29F15
jmp     short def_29EDA ; jumptable 00029EDA default case

loc_29F01:              ; jumptable 00029EDA cases 1-4
xor     ax, ax
jmp     short loc_29F45

loc_29F05:
les     bx, [bp+arg_0]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
call    sub_29EB7
jmp     short loc_29F45

loc_29F15:
mov     ax, 1
jmp     short loc_29F45

def_29EDA:              ; jumptable 00029EDA default case
les     bx, [bp+arg_0]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
call    sub_29EB7
or      ax, ax
jnz     short loc_29F3E
les     bx, [bp+arg_0]
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
call    sub_29EB7
or      ax, ax
jz      short loc_29F43

loc_29F3E:
mov     ax, 1
jmp     short loc_29F45

loc_29F43:
xor     ax, ax

loc_29F45:
pop     bp
retn    4
sub_29EB7 endp



; Attributes: bp-based frame

sub_29F49 proc near

var_4= dword ptr -4
arg_0= dword ptr  4

push    bp
mov     bp, sp
sub     sp, 4
mov     ax, 10h
push    ax
call    sub_318B7
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
les     bx, [bp+var_4]
push    es
push    bx
les     bx, [bp+arg_0]
push    es
push    bx
mov     cx, 10h
call    sub_46BE5
mov     dx, word ptr [bp+var_4+2]
mov     ax, word ptr [bp+var_4]
mov     sp, bp
pop     bp
retn    4
sub_29F49 endp



; Attributes: bp-based frame

sub_29F7C proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
mov     ax, word ptr [bp+arg_0]
or      ax, word ptr [bp+arg_0+2]
jnz     short loc_29F8E
xor     dx, dx
mov     ax, dx
jmp     loc_2A00B

loc_29F8E:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_29F49
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 1
jl      short loc_29FAE
mov     bx, ax
cmp     byte ptr es:[bx], 9
jle     short loc_2A005

loc_29FAE:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 2Dh ; '-'
jz      short loc_29FEC
cmp     byte ptr es:[bx], 2Eh ; '.'
jz      short loc_29FC3
cmp     byte ptr es:[bx], 2Fh ; '/'
jnz     short loc_29FD3

loc_29FC3:
les     bx, [bp+arg_0]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
call    sub_29F7C
jmp     short loc_2A00B

loc_29FD3:
les     bx, [bp+arg_0]
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
call    sub_29F7C
les     bx, [bp+arg_0]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax

loc_29FEC:
les     bx, [bp+arg_0]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
call    sub_29F7C
les     bx, [bp+arg_0]
mov     es:[bx+8], dx
mov     es:[bx+6], ax

loc_2A005:
mov     dx, word ptr [bp+arg_0+2]
mov     ax, word ptr [bp+arg_0]

loc_2A00B:
pop     bp
retn    4
sub_29F7C endp



; Attributes: bp-based frame

sub_2A00F proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
mov     ax, word ptr [bp+arg_0]
or      ax, word ptr [bp+arg_0+2]
jnz     short loc_2A021
xor     dx, dx
mov     ax, dx
jmp     loc_2A09B

loc_2A021:
push    word ptr [bp+arg_0+2]
push    word ptr [bp+arg_0]
call    sub_29F49
mov     word ptr [bp+arg_0+2], dx
mov     word ptr [bp+arg_0], ax
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 1
jl      short loc_2A041
mov     bx, ax
cmp     byte ptr es:[bx], 9
jle     short loc_2A095

loc_2A041:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx], 2Dh ; '-'
jz      short loc_2A07C
cmp     byte ptr es:[bx], 17h
jl      short loc_2A063
cmp     byte ptr es:[bx], 21h ; '!'
jg      short loc_2A063
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
call    sub_2A00F
jmp     short loc_2A09B

loc_2A063:
les     bx, [bp+arg_0]
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
call    sub_2A00F
les     bx, [bp+arg_0]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax

loc_2A07C:
les     bx, [bp+arg_0]
push    word ptr es:[bx+8]
push    word ptr es:[bx+6]
call    sub_2A00F
les     bx, [bp+arg_0]
mov     es:[bx+8], dx
mov     es:[bx+6], ax

loc_2A095:
mov     dx, word ptr [bp+arg_0+2]
mov     ax, word ptr [bp+arg_0]

loc_2A09B:
pop     bp
retn    4
sub_2A00F endp

seg014 ends


; Segment type: Pure code
seg015 segment byte public 'CODE' use16
assume cs:seg015
;org 0Fh
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing


; Attributes: bp-based frame

sub_2A09F proc near

var_8= dword ptr -8
var_4= dword ptr -4
arg_0= byte ptr  4
arg_2= dword ptr  6
arg_6= byte ptr  0Ah
arg_8= dword ptr  0Ch
arg_C= word ptr  10h
arg_E= byte ptr  12h

push    bp
mov     bp, sp
sub     sp, 8
push    si
push    di
mov     al, [bp+arg_E]
mov     ds:0BF5Ah, al
mov     ax, [bp+arg_C]
mov     ds:0BF62h, ax
mov     al, [bp+arg_0]
mov     ds:0BF5Bh, al
les     bx, [bp+arg_2]
mov     word ptr ds:0BF58h, es
mov     ds:0BF56h, bx
mov     al, [bp+arg_6]
mov     ds:0BF5Ch, al
les     bx, [bp+arg_8]
mov     word ptr ds:0BF60h, es
mov     ds:0BF5Eh, bx
cld
les     bx, ds:0BD8Ah
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
jmp     short loc_2A114

loc_2A0E2:
les     bx, [bp+var_4]

loc_2A0E5:
cmp     bx, 280h
jnb     short loc_2A106
lea     si, ds:0BF56h
mov     di, bx
mov     cx, 7
repe cmpsw
jnz     short loc_2A101
mov     word ptr [bp+var_8], bx
mov     word ptr [bp+var_8+2], es
jmp     loc_2A213

loc_2A101:
add     bx, 10h
jmp     short loc_2A0E5

loc_2A106:
les     bx, [bp+var_4]
les     bx, es:[bx+280h]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx

loc_2A114:
mov     dx, word ptr [bp+var_4+2]
mov     ax, word ptr [bp+var_4]
cmp     dx, ds:0BD90h
jnz     short loc_2A0E2
cmp     ax, ds:0BD8Eh
jnz     short loc_2A0E2
les     bx, [bp+var_4]

loc_2A129:
cmp     bx, ds:0BD7Ah
jnb     short loc_2A14A
lea     si, ds:0BF56h
mov     di, bx
mov     cx, 7
repe cmpsw
jnz     short loc_2A145
mov     word ptr [bp+var_8], bx
mov     word ptr [bp+var_8+2], es
jmp     loc_2A213

loc_2A145:
add     bx, 10h
jmp     short loc_2A129

loc_2A14A:
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
mov     dx, word ptr [bp+var_4+2]
mov     ax, word ptr [bp+var_4]
add     ax, 280h
cmp     ax, ds:0BD7Ah
jbe     short loc_2A170
les     bx, ds:0BD7Ah
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
add     word ptr ds:0BD7Ah, 10h
jmp     short loc_2A1CF

loc_2A170:
mov     ax, 288h
push    ax
call    sub_3193F
les     bx, [bp+var_4]
mov     es:[bx+282h], dx
mov     es:[bx+280h], ax
les     bx, es:[bx+280h]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
mov     dx, ds:0BD90h
mov     ax, ds:0BD8Eh
mov     es:[bx+286h], dx
mov     es:[bx+284h], ax
mov     word ptr ds:0BD90h, es
mov     ds:0BD8Eh, bx
les     bx, [bp+var_4]
mov     word ptr es:[bx+282h], 0
mov     word ptr es:[bx+280h], 0
add     bx, 10h
mov     word ptr ds:0BD7Ch, es
mov     ds:0BD7Ah, bx
mov     bx, word ptr [bp+var_4]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx

loc_2A1CF:
mov     al, ds:0BF5Ah
cbw
mov     bx, ax
test    byte ptr [bx+6810h], 3
jz      short loc_2A1EC
mov     al, ds:0BF5Ah
cbw
mov     bx, ax
mov     al, [bx+6824h]
cbw
mov     ds:0BF64h, ax
jmp     short loc_2A201

loc_2A1EC:
cmp     byte ptr ds:0BF5Ah, 0Fh
jnz     short loc_2A1FB
mov     word ptr ds:0BF64h, 1
jmp     short loc_2A201

loc_2A1FB:
mov     word ptr ds:0BF64h, 0

loc_2A201:
les     bx, [bp+var_8]
push    es
push    bx
mov     bx, 0BF56h
push    ds
push    bx
mov     cx, 10h
call    sub_46BE5

loc_2A213:
mov     dx, word ptr [bp+var_8+2]
mov     ax, word ptr [bp+var_8]
pop     di
pop     si
mov     sp, bp
pop     bp
retn    10h
sub_2A09F endp



; Attributes: bp-based frame

sub_2A221 proc far

var_12= dword ptr -12h
var_E= dword ptr -0Eh
var_A= dword ptr -0Ah
var_6= dword ptr -6
var_2= word ptr -2
arg_0= word ptr  6
arg_2= dword ptr  8
arg_6= dword ptr  0Ch

push    bp
mov     bp, sp
sub     sp, 12h
push    si
push    di
cmp     [bp+arg_0], 0FFFFh
jnz     short loc_2A23B
mov     [bp+arg_0], 1
mov     [bp+var_2], 1
jmp     short loc_2A240

loc_2A23B:
mov     [bp+var_2], 0

loc_2A240:
mov     dx, word ptr [bp+arg_6+2]
mov     ax, word ptr [bp+arg_6]
cmp     dx, word ptr [bp+arg_2+2]
jnz     short loc_2A256
cmp     ax, word ptr [bp+arg_2]
jnz     short loc_2A256
mov     ax, 1
jmp     loc_2A4F8

loc_2A256:
les     bx, [bp+arg_6]
mov     al, es:[bx+4]
les     bx, [bp+arg_2]
cmp     al, es:[bx+4]
jz      short loc_2A269
jmp     loc_2A4A7

loc_2A269:
les     bx, [bp+arg_6]
mov     al, es:[bx+6]
les     bx, [bp+arg_2]
cmp     al, es:[bx+6]
jz      short loc_2A27C
jmp     loc_2A4A7

loc_2A27C:
les     bx, [bp+arg_6]
cmp     byte ptr es:[bx+4], 11h
jz      short loc_2A2E1
cmp     [bp+arg_0], 0
jnz     short loc_2A29C
mov     al, es:[bx+5]
les     bx, [bp+arg_2]
cmp     al, es:[bx+5]
jz      short loc_2A2E1
jmp     loc_2A4A7

loc_2A29C:
cmp     [bp+arg_0], 2
jnz     short loc_2A2E1
les     bx, [bp+arg_6]
mov     al, es:[bx+5]
mov     ah, 0
and     ax, 40h
les     bx, [bp+arg_2]
mov     dl, es:[bx+5]
mov     dh, 0
and     dx, 40h
cmp     ax, dx
jle     short loc_2A2C1
jmp     loc_2A4A7

loc_2A2C1:
les     bx, [bp+arg_6]
mov     al, es:[bx+5]
mov     ah, 0
and     ax, 80h
les     bx, [bp+arg_2]
mov     dl, es:[bx+5]
mov     dh, 0
and     dx, 80h
cmp     ax, dx
jle     short loc_2A2E1
jmp     loc_2A4A7

loc_2A2E1:
les     bx, [bp+arg_6]
mov     al, es:[bx+4]
cbw
cmp     ax, 10h
jz      short loc_2A2FB
cmp     ax, 11h
jz      short loc_2A34B
cmp     ax, 12h
jz      short loc_2A32B
jmp     loc_2A4AB

loc_2A2FB:
les     bx, [bp+arg_6]
mov     ax, es:[bx+0Ch]
les     bx, [bp+arg_2]
cmp     ax, es:[bx+0Ch]
jnz     short loc_2A30E
jmp     loc_2A4AB

loc_2A30E:
les     bx, [bp+arg_6]
cmp     word ptr es:[bx+0Ch], 0
jnz     short loc_2A31B
jmp     loc_2A4AB

loc_2A31B:
les     bx, [bp+arg_2]
cmp     word ptr es:[bx+0Ch], 0
jnz     short loc_2A328
jmp     loc_2A4AB

loc_2A328:
jmp     loc_2A4A7

loc_2A32B:
les     bx, [bp+arg_6]
mov     dx, es:[bx+0Ah]
mov     ax, es:[bx+8]
les     bx, [bp+arg_2]
cmp     dx, es:[bx+0Ah]
jnz     short loc_2A348
cmp     ax, es:[bx+8]
jnz     short loc_2A348
jmp     loc_2A4AB

loc_2A348:
jmp     loc_2A4A7

loc_2A34B:
les     bx, [bp+arg_6]
mov     al, es:[bx+5]
mov     ah, 0
and     ax, 0FF7Fh
les     bx, [bp+arg_2]
mov     dl, es:[bx+5]
mov     dh, 0
and     dx, 0FF7Fh
cmp     ax, dx
jz      short loc_2A36B
jmp     loc_2A4A7

loc_2A36B:
les     bx, [bp+arg_6]
mov     ax, es:[bx+8]
or      ax, es:[bx+0Ah]
jnz     short loc_2A37B
jmp     loc_2A4AB

loc_2A37B:
les     bx, [bp+arg_2]
mov     ax, es:[bx+8]
or      ax, es:[bx+0Ah]
jnz     short loc_2A38B
jmp     loc_2A4AB

loc_2A38B:
les     bx, [bp+arg_6]
mov     al, es:[bx+5]
les     bx, [bp+arg_2]
cmp     al, es:[bx+5]
jz      short loc_2A39E
jmp     loc_2A4A7

loc_2A39E:
les     bx, [bp+arg_6]
les     bx, es:[bx+8]
mov     word ptr [bp+var_12+2], es
mov     word ptr [bp+var_12], bx
les     bx, [bp+arg_2]
les     bx, es:[bx+8]
mov     word ptr [bp+var_E+2], es
mov     word ptr [bp+var_E], bx
les     bx, [bp+var_12]
mov     al, es:[bx+18h]
les     bx, [bp+var_E]
cmp     al, es:[bx+18h]
jz      short loc_2A3CB
jmp     loc_2A4A7

loc_2A3CB:
les     bx, [bp+var_12]
les     bx, es:[bx+4]
mov     word ptr [bp+var_A+2], es
mov     word ptr [bp+var_A], bx
les     bx, [bp+var_E]
les     bx, es:[bx+4]
mov     word ptr [bp+var_6+2], es
mov     word ptr [bp+var_6], bx
jmp     loc_2A484

loc_2A3E8:
cmp     [bp+var_2], 0
jz      short loc_2A449
les     bx, [bp+var_A]
les     bx, es:[bx+0Ch]
mov     al, es:[bx+4]
cbw
mov     si, ax
test    byte ptr [si+6810h], 14h
jz      short loc_2A449
les     bx, [bp+var_6]
les     bx, es:[bx+0Ch]
mov     al, es:[bx+4]
cbw
cmp     ax, si
jnz     short loc_2A449
les     bx, [bp+var_A]
les     bx, es:[bx+0Ch]
les     bx, es:[bx]
mov     al, es:[bx+4]
cbw
mov     si, ax
les     bx, [bp+var_6]
les     bx, es:[bx+0Ch]
les     bx, es:[bx]
mov     al, es:[bx+4]
cbw
mov     di, ax
cmp     si, 0Fh
jnz     short loc_2A43F
cmp     di, 1
jz      short loc_2A46A

loc_2A43F:
cmp     si, 1
jnz     short loc_2A449
cmp     di, 0Fh
jz      short loc_2A46A

loc_2A449:
les     bx, [bp+var_A]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
les     bx, [bp+var_6]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
xor     ax, ax
push    ax
push    cs
call    near ptr sub_2A221
or      ax, ax
jz      short loc_2A4A7

loc_2A46A:
les     bx, [bp+var_A]
les     bx, es:[bx+4]
mov     word ptr [bp+var_A+2], es
mov     word ptr [bp+var_A], bx
les     bx, [bp+var_6]
les     bx, es:[bx+4]
mov     word ptr [bp+var_6+2], es
mov     word ptr [bp+var_6], bx

loc_2A484:
mov     ax, word ptr [bp+var_A]
or      ax, word ptr [bp+var_A+2]
jz      short loc_2A497
mov     ax, word ptr [bp+var_6]
or      ax, word ptr [bp+var_6+2]
jz      short loc_2A497
jmp     loc_2A3E8

loc_2A497:
mov     dx, word ptr [bp+var_A+2]
mov     ax, word ptr [bp+var_A]
cmp     dx, word ptr [bp+var_6+2]
jnz     short loc_2A4A7
cmp     ax, word ptr [bp+var_6]
jz      short loc_2A4AB

loc_2A4A7:
xor     ax, ax
jmp     short loc_2A4F8

loc_2A4AB:
les     bx, [bp+arg_6]
les     bx, es:[bx]
mov     word ptr [bp+arg_6+2], es
mov     word ptr [bp+arg_6], bx
les     bx, [bp+arg_2]
les     bx, es:[bx]
mov     word ptr [bp+arg_2+2], es
mov     word ptr [bp+arg_2], bx
cmp     [bp+arg_0], 1
jnz     short loc_2A4CE
mov     [bp+arg_0], 2

loc_2A4CE:
mov     ax, word ptr [bp+arg_6]
or      ax, word ptr [bp+arg_6+2]
jz      short loc_2A4E1
mov     ax, word ptr [bp+arg_2]
or      ax, word ptr [bp+arg_2+2]
jz      short loc_2A4E1
jmp     loc_2A240

loc_2A4E1:
mov     dx, word ptr [bp+arg_6+2]
mov     ax, word ptr [bp+arg_6]
cmp     dx, word ptr [bp+arg_2+2]
jnz     short loc_2A4F6
cmp     ax, word ptr [bp+arg_2]
jnz     short loc_2A4F6
mov     ax, 1
jmp     short loc_2A4F8

loc_2A4F6:
xor     ax, ax

loc_2A4F8:
pop     di
pop     si
mov     sp, bp
pop     bp
retf    0Ah
sub_2A221 endp



; Attributes: bp-based frame

sub_2A500 proc far

arg_0= word ptr  6
arg_2= dword ptr  8

push    bp
mov     bp, sp
les     bx, [bp+arg_2]
mov     al, es:[bx+4]
push    ax
push    word ptr es:[bx+0Ch]
push    word ptr es:[bx+0Ah]
push    word ptr es:[bx+8]
mov     al, es:[bx+6]
push    ax
push    word ptr es:[bx+2]
push    word ptr es:[bx]
push    [bp+arg_0]
call    sub_2A09F
pop     bp
retf    6
sub_2A500 endp



; Attributes: bp-based frame

sub_2A52D proc far

arg_0= word ptr  6
arg_2= word ptr  8

push    bp
mov     bp, sp
push    [bp+arg_2]
xor     ax, ax
push    ax
push    ax
push    ax
mov     al, 0
push    ax
xor     ax, ax
push    ax
push    ax
push    [bp+arg_0]
call    sub_2A09F
pop     bp
retf    4
sub_2A52D endp



; Attributes: bp-based frame

sub_2A549 proc far

var_4= word ptr -4
var_2= word ptr -2
arg_0= word ptr  6
arg_2= dword ptr  8
arg_6= word ptr  0Ch

push    bp
mov     bp, sp
sub     sp, 4
les     bx, [bp+arg_2]
cmp     byte ptr es:[bx+4], 11h
jz      short loc_2A567
cmp     byte ptr es:[bx+4], 14h
jz      short loc_2A567
cmp     byte ptr es:[bx+4], 0Fh
jnz     short loc_2A56A

loc_2A567:
call    sub_2A8B3

loc_2A56A:
push    word ptr [bp+arg_2+2]
push    word ptr [bp+arg_2]
call    sub_2A8BF
xor     dx, dx
mov     [bp+var_2], dx
mov     [bp+var_4], ax
mov     ax, [bp+arg_6]
xor     dx, dx
mov     cx, [bp+var_2]
mov     bx, [bp+var_4]
call    sub_46A18
or      dx, dx
jl      short loc_2A5A3
jg      short loc_2A598
cmp     ax, 0FFFFh
jbe     short loc_2A5A3

loc_2A598:
mov     ax, 62h ; 'b'
push    ax
call    sub_312DE
inc     sp
inc     sp

loc_2A5A3:
les     bx, [bp+arg_2]
mov     al, es:[bx+5]
mov     ah, 0
and     ax, 0E0h
or      [bp+arg_0], ax
mov     al, 10h
push    ax
push    [bp+arg_6]
xor     ax, ax
push    ax
push    ax
mov     al, 0
push    ax
push    word ptr [bp+arg_2+2]
push    bx
push    [bp+arg_0]
call    sub_2A09F
mov     sp, bp
pop     bp
retf    8
sub_2A549 endp



; Attributes: bp-based frame

sub_2A5CF proc far

var_4= dword ptr -4
arg_0= word ptr  6
arg_2= word ptr  8
arg_4= word ptr  0Ah
arg_6= dword ptr  0Ch

push    bp
mov     bp, sp
sub     sp, 4
les     bx, [bp+arg_6]
mov     al, es:[bx+4]
cbw
cmp     ax, 10h
jz      short loc_2A5EE
cmp     ax, 11h
jz      short loc_2A5EE
cmp     ax, 14h
jz      short loc_2A5EE
jmp     short loc_2A5F1

loc_2A5EE:
call    sub_2A8B3

loc_2A5F1:
mov     ax, [bp+arg_0]
and     ax, 7
cmp     ax, 3
jnz     short loc_2A602
and     [bp+arg_0], 0FFC7h
jmp     short loc_2A633

loc_2A602:
test    [bp+arg_0], 7
jnz     short loc_2A61A
cmp     byte ptr ds:22C5h, 0
jz      short loc_2A616
or      [bp+arg_0], 1
jmp     short loc_2A61A

loc_2A616:
or      [bp+arg_0], 4

loc_2A61A:
test    [bp+arg_0], 38h
jnz     short loc_2A63D
cmp     byte ptr ds:22B1h, 5
jnz     short loc_2A62C
or      [bp+arg_0], 20h

loc_2A62C:
cmp     byte ptr ds:0BE1Ah, 0
jz      short loc_2A639

loc_2A633:
or      [bp+arg_0], 8
jmp     short loc_2A63D

loc_2A639:
or      [bp+arg_0], 10h

loc_2A63D:
mov     ax, [bp+arg_2]
or      ax, [bp+arg_4]
jz      short loc_2A6AE
cmp     byte ptr ds:9A63h, 3
jnz     short loc_2A65D
mov     ax, 10h
push    ax
call    sub_318B7
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
jmp     short loc_2A66C

loc_2A65D:
mov     ax, 10h
push    ax
call    sub_3193F
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax

loc_2A66C:
les     bx, [bp+var_4]
mov     byte ptr es:[bx+4], 11h
mov     al, byte ptr [bp+arg_0]
mov     es:[bx+5], al
mov     dx, word ptr [bp+arg_6+2]
mov     ax, word ptr [bp+arg_6]
mov     es:[bx+2], dx
mov     es:[bx], ax
mov     word ptr es:[bx+0Ch], 0
mov     word ptr es:[bx+0Eh], 0
mov     byte ptr es:[bx+6], 0
mov     dx, [bp+arg_4]
mov     ax, [bp+arg_2]
mov     es:[bx+0Ah], dx
mov     es:[bx+8], ax
mov     dx, word ptr [bp+var_4+2]
mov     ax, bx
jmp     short loc_2A6C5

loc_2A6AE:
mov     al, 11h
push    ax
xor     ax, ax
push    ax
push    ax
push    ax
mov     al, 0
push    ax
push    word ptr [bp+arg_6+2]
push    word ptr [bp+arg_6]
push    [bp+arg_0]
call    sub_2A09F

loc_2A6C5:
mov     sp, bp
pop     bp
retf    0Ah
sub_2A5CF endp



; Attributes: bp-based frame

sub_2A6CB proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= dword ptr  4
arg_4= dword ptr  8

push    bp
mov     bp, sp
sub     sp, 4
push    si
push    di
les     bx, [bp+arg_0]
mov     si, es:[bx]
mov     ax, si
and     ax, 0C0h
mov     [bp+var_2], ax
mov     ax, si
and     ax, 0Fh
mov     si, ax
mov     ax, si
dec     ax              ; switch 7 cases
cmp     ax, 6
ja      short def_2A6F4 ; jumptable 0002A6F4 default case
mov     bx, ax
shl     bx, 1
jmp     cs:jpt_2A6F4[bx] ; switch jump
jpt_2A6F4 dw offset loc_2A71B ; jump table for switch statement
dw offset loc_2A71B
dw offset loc_2A71B
dw offset loc_2A71B
dw offset loc_2A716
dw offset loc_2A716
dw offset loc_2A707

loc_2A707:              ; jumptable 0002A6F4 case 7
mov     di, 7
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx+4], 11h
jz      short loc_2A742
jmp     short loc_2A759

loc_2A716:              ; jumptable 0002A6F4 cases 5,6
mov     di, 0Bh
jmp     short loc_2A75C

loc_2A71B:              ; jumptable 0002A6F4 cases 1-4
mov     di, 7
jmp     short loc_2A75C

def_2A6F4:              ; jumptable 0002A6F4 default case
les     bx, [bp+arg_4]
cmp     byte ptr es:[bx+4], 11h
jnz     short loc_2A747
mov     al, es:[bx+5]
mov     ah, 0
mov     [bp+var_4], ax
cmp     byte ptr ds:0BE1Ah, 0
jnz     short loc_2A74E
test    ax, 8
jnz     short loc_2A74E
mov     di, 7

loc_2A742:
mov     si, 2
jmp     short loc_2A75C

loc_2A747:
cmp     byte ptr ds:0BE1Bh, 0
jz      short loc_2A756

loc_2A74E:
mov     di, 0Bh
mov     si, 5
jmp     short loc_2A75C

loc_2A756:
mov     di, 7

loc_2A759:
mov     si, 4

loc_2A75C:
mov     ax, si
or      ax, [bp+var_2]
les     bx, [bp+arg_0]
mov     es:[bx], ax
mov     ax, di
pop     di
pop     si
mov     sp, bp
pop     bp
retn    8
sub_2A6CB endp



; Attributes: bp-based frame

sub_2A771 proc far

var_2= word ptr -2
arg_0= word ptr  6
arg_2= word ptr  8
arg_4= word ptr  0Ah

push    bp
mov     bp, sp
sub     sp, 2
push    [bp+arg_4]
push    [bp+arg_2]
push    ss
lea     ax, [bp+arg_0]
push    ax
call    sub_2A6CB
mov     [bp+var_2], ax
push    ax
xor     ax, ax
push    ax
push    ax
push    ax
mov     al, 0
push    ax
push    [bp+arg_4]
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_2A09F
mov     sp, bp
pop     bp
retf    6
sub_2A771 endp



; Attributes: bp-based frame

sub_2A7A3 proc far

arg_0= word ptr  6
arg_2= dword ptr  8
arg_6= word ptr  0Ch
arg_8= word ptr  0Eh

push    bp
mov     bp, sp
les     bx, [bp+arg_2]
cmp     byte ptr es:[bx+4], 5
jz      short loc_2A7CF
cmp     byte ptr es:[bx+4], 6
jz      short loc_2A7CF
cmp     byte ptr es:[bx+4], 3
jz      short loc_2A7CF
cmp     byte ptr es:[bx+4], 4
jz      short loc_2A7CF
cmp     byte ptr es:[bx+4], 13h
jz      short loc_2A7CF
call    sub_2A8B3

loc_2A7CF:
mov     al, 14h
push    ax
push    [bp+arg_8]
xor     ax, ax
push    ax
push    ax
push    [bp+arg_6]
push    word ptr [bp+arg_2+2]
push    word ptr [bp+arg_2]
push    [bp+arg_0]
call    sub_2A09F
pop     bp
retf    0Ah
sub_2A7A3 endp



; Attributes: bp-based frame

sub_2A7EC proc far

var_4= dword ptr -4
arg_0= word ptr  6
arg_2= dword ptr  8
arg_6= word ptr  0Ch

push    bp
mov     bp, sp
sub     sp, 4
cmp     [bp+arg_0], 0
jz      short loc_2A7FB
jmp     loc_2A894

loc_2A7FB:
les     bx, [bp+arg_2]
mov     ax, es:[bx+8]
or      ax, es:[bx+0Ah]
jz      short loc_2A813
les     bx, es:[bx+8]
cmp     byte ptr es:[bx+5], 0
jz      short loc_2A887

loc_2A813:
cmp     byte ptr ds:9A63h, 3
jnz     short loc_2A82B
mov     ax, 10h
push    ax
call    sub_318B7
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
jmp     short loc_2A83A

loc_2A82B:
mov     ax, 10h
push    ax
call    sub_3193F
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax

loc_2A83A:
mov     al, byte ptr [bp+arg_6]
les     bx, [bp+var_4]
mov     es:[bx+4], al
mov     al, byte ptr [bp+arg_0]
mov     es:[bx+5], al
mov     word ptr es:[bx+0Ch], 0
mov     word ptr es:[bx+2], 0
mov     word ptr es:[bx], 0
mov     word ptr es:[bx+0Eh], 0
mov     byte ptr es:[bx+6], 0
mov     dx, word ptr [bp+arg_2+2]
mov     ax, word ptr [bp+arg_2]
mov     es:[bx+0Ah], dx
mov     es:[bx+8], ax
mov     dx, word ptr [bp+var_4+2]
mov     ax, bx
les     bx, [bp+arg_2]
mov     es:[bx+0Ah], dx
mov     es:[bx+8], ax
jmp     short loc_2A8AD

loc_2A887:
les     bx, [bp+arg_2]
mov     dx, es:[bx+0Ah]
mov     ax, es:[bx+8]
jmp     short loc_2A8AD

loc_2A894:
push    [bp+arg_6]
xor     ax, ax
push    ax
push    word ptr [bp+arg_2+2]
push    word ptr [bp+arg_2]
mov     al, 0
push    ax
xor     ax, ax
push    ax
push    ax
push    [bp+arg_0]
call    sub_2A09F

loc_2A8AD:
mov     sp, bp
pop     bp
retf    8
sub_2A7EC endp




sub_2A8B3 proc near
mov     ax, 40h ; '@'
push    ax
call    sub_312DE
inc     sp
inc     sp
retn
sub_2A8B3 endp



; Attributes: bp-based frame

sub_2A8BF proc far

arg_0= dword ptr  6

push    bp
mov     bp, sp
push    si
push    di
mov     ax, word ptr [bp+arg_0]
or      ax, word ptr [bp+arg_0+2]
jnz     short loc_2A8D2
mov     ax, 1
jmp     short loc_2A94E
align 2

loc_2A8D2:
mov     si, 1
jmp     short loc_2A8EB

loc_2A8D7:
les     bx, [bp+arg_0]
mov     ax, es:[bx+0Ch]
mul     si
mov     si, ax
les     bx, es:[bx]
mov     word ptr [bp+arg_0+2], es
mov     word ptr [bp+arg_0], bx

loc_2A8EB:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+4], 10h
jz      short loc_2A8D7
mov     al, es:[bx+4]
cbw
cmp     ax, 12h
jz      short loc_2A901
jmp     short loc_2A93A

loc_2A901:
les     bx, [bp+arg_0]
les     bx, es:[bx+8]
mov     di, es:[bx+10h]
or      di, di
jnz     short loc_2A94A
les     bx, [bp+arg_0]
les     bx, es:[bx+8]
push    word ptr es:[bx+0Eh]
push    word ptr es:[bx+0Ch]
mov     ax, 99h
push    ax
call    sub_312DE
add     sp, 6
les     bx, [bp+arg_0]
les     bx, es:[bx+8]
mov     word ptr es:[bx+12h], 1
jmp     short loc_2A94A

loc_2A93A:
les     bx, [bp+arg_0]
mov     al, es:[bx+4]
cbw
mov     bx, ax
shl     bx, 1
mov     di, [bx+7BE1h]

loc_2A94A:
mov     ax, si
mul     di

loc_2A94E:
pop     di
pop     si
pop     bp
retf    4
sub_2A8BF endp



; Attributes: bp-based frame

sub_2A954 proc far

arg_0= dword ptr  6

push    bp
mov     bp, sp
jmp     short loc_2A965

loc_2A959:
les     bx, [bp+arg_0]
les     bx, es:[bx]
mov     word ptr [bp+arg_0+2], es
mov     word ptr [bp+arg_0], bx

loc_2A965:
les     bx, [bp+arg_0]
cmp     byte ptr es:[bx+4], 10h
jz      short loc_2A959
mov     al, es:[bx+4]
cbw
mov     bx, ax
shl     bx, 1
mov     ax, [bx+7C0Bh]
pop     bp
retf    4
sub_2A954 endp



; Attributes: bp-based frame

sub_2A980 proc far

var_6= dword ptr -6
var_2= word ptr -2
arg_0= byte ptr  6
arg_2= word ptr  8
arg_4= word ptr  0Ah

push    bp
mov     bp, sp
sub     sp, 6
push    [bp+arg_4]
push    [bp+arg_2]
push    ss
lea     ax, [bp+arg_0]
push    ax
call    sub_2A6CB
mov     [bp+var_2], ax
mov     ax, 6
push    ax
call    sub_318B7
mov     word ptr [bp+var_6+2], dx
mov     word ptr [bp+var_6], ax
mov     al, byte ptr [bp+var_2]
les     bx, [bp+var_6]
mov     es:[bx+4], al
mov     al, [bp+arg_0]
mov     es:[bx+5], al
mov     dx, [bp+arg_4]
mov     ax, [bp+arg_2]
mov     es:[bx+2], dx
mov     es:[bx], ax
mov     dx, word ptr [bp+var_6+2]
mov     ax, bx
mov     sp, bp
pop     bp
retf    6
sub_2A980 endp

seg015 ends


; Segment type: Pure code
seg016 segment byte public 'CODE' use16
assume cs:seg016
;org 0Fh
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing


; Attributes: bp-based frame

sub_2A9CF proc far

var_8= dword ptr -8
var_4= dword ptr -4
arg_0= word ptr  6
arg_2= dword ptr  8

push    bp
mov     bp, sp
sub     sp, 8
push    si
push    word ptr [bp+arg_2+2]
push    word ptr [bp+arg_2]
call    sub_46E60
mov     si, ax
mov     ax, si
mov     cl, 5
shl     ax, cl
les     bx, [bp+arg_2]
mov     dl, es:[bx]
mov     dh, 0
add     ax, dx
add     bx, si
dec     bx
mov     dl, es:[bx]
mov     dh, 0
shl     dx, 1
shl     dx, 1
add     ax, dx
and     ax, 3FFh
mov     si, ax
mov     bx, si
shl     bx, 1
shl     bx, 1
mov     ax, [bx-5588h]
or      ax, [bx-5586h]
jnz     short loc_2AA79
push    word ptr [bp+arg_2+2]
push    word ptr [bp+arg_2]
call    sub_46E60
add     ax, 0Bh
push    ax
call    sub_3193F
mov     word ptr [bp+var_8+2], dx
mov     word ptr [bp+var_8], ax
mov     bx, si
shl     bx, 1
shl     bx, 1
mov     [bx-5586h], dx
mov     [bx-5588h], ax
les     bx, [bp+var_8]
mov     word ptr es:[bx+2], 0
mov     word ptr es:[bx], 0
mov     bx, ax
mov     word ptr es:[bx+6], 0
mov     word ptr es:[bx+4], 0
mov     ax, [bp+arg_0]
mov     bx, word ptr [bp+var_8]
mov     es:[bx+8], ax
mov     ax, word ptr [bp+var_8]
add     ax, 0Ah
push    dx
push    ax
push    word ptr [bp+arg_2+2]
push    word ptr [bp+arg_2]
call    sub_46D76
jmp     short loc_2AAA3

loc_2AA79:
mov     bx, si
shl     bx, 1
shl     bx, 1
les     bx, [bx-5588h]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx

loc_2AA89:
mov     dx, word ptr [bp+var_8+2]
mov     ax, word ptr [bp+var_8]
add     ax, 0Ah
push    dx
push    ax
push    word ptr [bp+arg_2+2]
push    word ptr [bp+arg_2]
call    sub_46D55
or      ax, ax
jnz     short loc_2AAAB

loc_2AAA3:
mov     dx, word ptr [bp+var_8+2]
mov     ax, word ptr [bp+var_8]
jmp     short loc_2AB25

loc_2AAAB:
les     bx, [bp+var_8]
mov     ax, es:[bx]
or      ax, es:[bx+2]
jz      short loc_2AAC2
les     bx, es:[bx]
mov     word ptr [bp+var_8+2], es
mov     word ptr [bp+var_8], bx
jmp     short loc_2AA89

loc_2AAC2:
push    word ptr [bp+arg_2+2]
push    word ptr [bp+arg_2]
call    sub_46E60
add     ax, 0Bh
push    ax
call    sub_3193F
mov     word ptr [bp+var_4+2], dx
mov     word ptr [bp+var_4], ax
les     bx, [bp+var_8]
mov     es:[bx+2], dx
mov     es:[bx], ax
les     bx, [bp+var_4]
mov     word ptr es:[bx+2], 0
mov     word ptr es:[bx], 0
mov     bx, ax
mov     word ptr es:[bx+6], 0
mov     word ptr es:[bx+4], 0
mov     ax, [bp+arg_0]
mov     bx, word ptr [bp+var_4]
mov     es:[bx+8], ax
mov     ax, word ptr [bp+var_4]
add     ax, 0Ah
push    dx
push    ax
push    word ptr [bp+arg_2+2]
push    word ptr [bp+arg_2]
call    sub_46D76
mov     dx, word ptr [bp+var_4+2]
mov     ax, word ptr [bp+var_4]

loc_2AB25:
pop     si
mov     sp, bp
pop     bp
retf    6
sub_2A9CF endp

seg016 ends


; Segment type: Pure code
seg017 segment byte public 'CODE' use16
assume cs:seg017
;org 0Ch
assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing


; Attributes: bp-based frame

sub_2AB2C proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
les     bx, [bp+arg_0]
mov     word ptr ds:0BE2Bh, es
mov     ds:0BE29h, bx
les     bx, es:[bx+6]
push    es
push    bx
les     bx, [bp+arg_0]
pop     ax
pop     dx
add     ax, es:[bx+4]
mov     ds:0BF70h, dx
mov     ds:0BF6Eh, ax
les     bx, es:[bx+6]
push    es
push    bx
les     bx, [bp+arg_0]
pop     ax
pop     dx
add     ax, es:[bx+2]
mov     ds:0BF68h, dx
mov     ds:0BF66h, ax
pop     bp
retn    4
sub_2AB2C endp



; Attributes: bp-based frame

sub_2AB6A proc near

arg_0= dword ptr  4

push    bp
mov     bp, sp
mov     ax, ds:0BE29h
or      ax, ds:0BE2Bh
jz      short loc_2AB89
les     bx, ds:0BE29h
mov     ax, ds:0BF6Eh
mov     dx, es:[bx+6]
sub     ax, dx
sbb     dx, dx
mov     es:[bx+4], ax

loc_2AB89:
mov     dx, ds:0BE2Bh
mov     ax, ds:0BE29h
les     bx, [bp+arg_0]
mov     es:[bx+0Ch], dx
mov     es:[bx+0Ah], ax
mov     word ptr ds:0BE2Bh, es
mov     ds:0BE29h, bx
les     bx, es:[bx+6]
push    es
push    bx
les     bx, [bp+arg_0]
pop     ax
pop     dx
add     ax, es:[bx+4]
mov     ds:0BF70h, dx
mov     ds:0BF6Eh, ax
les     bx, es:[bx+6]
push    es
push    bx
les     bx, [bp+arg_0]
pop     ax
pop     dx
add     ax, es:[bx+2]
mov     ds:0BF68h, dx
mov     ds:0BF66h, ax
pop     bp
retn    4
sub_2AB6A endp



; Attributes: bp-based frame

sub_2ABD3 proc far

var_8= dword ptr -8
var_4= dword ptr -4
arg_0= word ptr  6
arg_2= word ptr  8

push    bp
mov     bp, sp
sub     sp, 8
push    si
push    [bp+arg_2]
push    [bp+arg_0]
call    sub_11C48
or      ax, ax
jz      short loc_2AC3F
les     bx, ds:0BE29h
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx
jmp     short loc_2AC08

loc_2ABF5:
les     bx, [bp+var_4]
cmp     word ptr es:[bx], 0FFFFh
jz      short loc_2AC53
les     bx, es:[bx+0Ah]
mov     word ptr [bp+var_4+2], es
mov     word ptr [bp+var_4], bx

loc_2AC08:
mov     ax, word ptr [bp+var_4]
or      ax, word ptr [bp+var_4+2]
jnz     short loc_2ABF5
mov     ax, 1Ch
push    ax
call    sub_31B55
mov     word ptr [bp+var_8+2], dx
mov     word ptr [bp+var_8], ax
les     bx, [bp+var_8]
mov     word ptr es:[bx], 0FFFFh
mov     ax, ds:99B3h
mov     es:[bx+2], ax
mov     dx, ds:9919h
mov     ax, ds:9917h
mov     es:[bx+8], dx
mov     es:[bx+6], ax
jmp     short loc_2AC83

loc_2AC3F:
push    [bp+arg_2]
push    [bp+arg_0]
xor     ax, ax
push    ax
call    sub_46A81
mov     si, ax
or      si, si
jge     short loc_2AC58

loc_2AC53:
xor     ax, ax
jmp     loc_2AD4C

loc_2AC58:
mov     ax, 41Ch
push    ax
call    sub_31B55
mov     word ptr [bp+var_8+2], dx
mov     word ptr [bp+var_8], ax
les     bx, [bp+var_8]
mov     es:[bx], si
mov     bx, ax
mov     word ptr es:[bx+2], 0
add     ax, 1Ch
mov     bx, word ptr [bp+var_8]
mov     es:[bx+8], dx
mov     es:[bx+6], ax

loc_2AC83:
les     bx, [bp+var_8]
mov     word ptr es:[bx+4], 0
mov     dx, ds:0BFAEh
mov     ax, ds:0BFACh