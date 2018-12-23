;
; LZ48 cruncher by roudoudou / Flower Corp.
; inspired by LZ4 block format (Yann Collet)
;
; modifications
; - first byte in the encoded flux is a literal out of block sequence
; - no literal byte minimum in the first block instead of 4
; - end of file comes with offset zero instead of minimum 5 literals and zero offset
; - offsets are 8bits instead of 16btis
; - offset are encoded 'value-1' to optimise decrunch
; - can crunch data of less than 4 bytes
;
;
; known limitations
; - data adress to crunch must be > #100
;

org #9000


; CALL #9000,adresse,taille

; init
di
; push_byte init
ld a,#C4
ld (push_bank),a
ld hl,#4000
ld (push_offset),hl

; parameters
ld h,(ix+3)
ld l,(ix+2)
ld d,(ix+1)
ld e,(ix+0)

; first byte is always literal but ouf of block sequence
ld (startadr_cpy1+1),hl
ld (startadr_cpy2+1),hl

ld a,(hl)
inc hl
dec de
call LZ48_push_byte


ld (curadr),hl
ld (curliteraladr),hl
ld (curlength),de
add hl,de
ld (endadrcpy+1),hl
ld (endadrcpy2+1),hl
ld (endadrcpy3+1),hl ; endadress is a constant
dec hl
dec hl
dec hl
ld (endadrcpy1m3+1),hl
ld (endadrcpy2m3+1),hl

inc d
dec d
jr nz,bigsizetocrunch
ld a,e
cp 5
jr nc,bigsizetocrunch
; want to crunch less than 5 bytes data! OK boy!
ld a,e
add a
add a
add a
add a
call LZ48_push_byte
smallcrunch
ld a,(hl)
inc hl
call LZ48_push_byte
dec e
jr nz,smallcrunch
ld a,#FF
call LZ48_push_byte
ret

bigsizetocrunch
xor a
ld (lz48_failed),a
ld hl,0
ld (literal),hl


;------------- inner compression loop ------
crunch_data
; do we have a match?
call LZ48_get_match
or a
jr nz,encode_block
; no! raise literral counter
ld hl,(literal)
inc hl
ld (literal),hl
ld hl,(curadr)
inc hl
ld (curadr),hl
endadrcpy1m3: ld de,#1234
xor a
sbc hl,de
jr z,encode_block3 ; force encode block because end of file
jr nc,encode_block21
jr crunch_data


; LZ48 block is (similar to LZ4 format)
; 1 byte descriptor
; n byte for extended lenght of literals
; n byte for literals
; 1 byte special offset (instead of 2 for LZ4)
; n byte for extended length of copy

; we are in the last 3 bytes, and maybe there is no more byte to crunch!
encode_block21
endadrcpy3:ld de,#1234
ld hl,(curadr)
encode_block21_loop
sbc hl,de
jr z,encode_block
ld hl,(curadr)
inc hl
ld (curadr),hl
jr encode_block21_loop


jr encode_block21

encode_block3
ld hl,(literal)
inc hl
inc hl
inc hl
ld (literal),hl

encode_block
call LZ48_newblock
; encode block with litterals+offset
ld hl,(literal)
inc h
dec h
jr nz,literal_extended
ld a,l
cp 15
jr nc,literal_extended
add a
add a
add a
add a
call LZ48_blockheaderfusion
inc l
dec l
jr z,encode_block_offset ; no literal to encode
jr push_literals

literal_extended
xor a
ld de,15
sbc hl,de
ld a,#F0
call LZ48_blockheaderfusion
literal_extended_redo
; is hl>255?
inc h
dec h
jr z,literal_extended_last_byte
ld de,255
xor a
sbc hl,de
ld a,255
call LZ48_push_byte
jr literal_extended_redo

literal_extended_last_byte
ld a,l
cp 255
jr nz,really_the_last_extended
call LZ48_push_byte
xor a
really_the_last_extended
call LZ48_push_byte


push_literals
ld de,(literal)
ld hl,(curliteraladr)


push_literals_loop
ld a,(hl)
inc hl
call LZ48_push_byte
dec de
ld a,d
or e
jr nz,push_literals_loop

;--- encode offset length in block ---
encode_block_offset

encode_offsetlength
ld a,lx
or a
jr z,encode_block_end ; nothing to do for the last block
; length of copy
ld hl,(maxmatch+1)
dec hl
dec hl
dec hl
inc h
dec h
jr nz,encode_offsetlength_extended
ld a,l
cp 15
jr nc,encode_offsetlength_extended
call LZ48_blockheaderfusion
jr encode_offset

encode_offsetlength_extended
xor a
ld de,15
sbc hl,de
ld a,#F
call LZ48_blockheaderfusion
encode_offsetlength_redo
; is hl>255?
inc h
dec h
jr z,encode_offsetlength_last_byte
ld de,255
xor a
sbc hl,de
ld a,255
call LZ48_push_byte
jr encode_offsetlength_redo

encode_offsetlength_last_byte
ld a,l
cp 255
jr nz,really_the_last
call LZ48_push_byte
xor a
really_the_last
call LZ48_push_byte

;--- encode offset translation in block ---
encode_offset
ld hl,(curadr)
maxoffset: ld de,#1234
xor a
sbc hl,de
ld a,l
dec a ; special byte offset  FF->EOF
call LZ48_push_byte

; add offset to current adress
ld hl,(maxmatch+1)
ld de,(curadr)
add hl,de
ld (curadr),hl

; reset counters
xor a
ld h,a
ld l,a
ld (literal),hl

; again?
ld hl,(curadr)
ld (curliteraladr),hl ; reset literal position
endadrcpy2: ld de,#1234
sbc hl,de
jp nz,crunch_data
jr lastpushbyte

;
; if last byte is literal, offset to zero [coded #FF) mean EOF
; else we need to add two extra bytes to encode zero literal and offset 0 
;
encode_block_end
ld a,#FF
call LZ48_push_byte
jr lz48end

lastpushbyte ld a,#12
inc a
jr z,lz48end
xor a
call LZ48_push_byte
dec a
call LZ48_push_byte
lz48end

ld hl,msgout
ld a,(hl)
displayendmsg
inc hl
call #BB5A
ld a,(hl)
or a
jr nz,displayendmsg

ld hl,(push_offset)
ld de,#4000
xor a
sbc hl,de
ld a,(push_bank)
sub #C4
add a
add a
add a
add a
add a
add a
add h
call displayhexdigit
ld a,l
call displayhexdigit

ld a,10
call #bb5A
ld a,13
call #bb5A

ei
ret

digit16 defw 0

displayhexdigit
push af
and #F0
rrca
rrca
rrca
rrca
cp 10
jr c,putdigit
add 'A'-10
call #BB5A
jr lowhexdigit

putdigit
add '0'
call #BB5A

lowhexdigit
pop af
and #F
cp 10
jr c,putdigit2
add 'A'-10
call #BB5A
ret

putdigit2
add '0'
call #BB5A
ret

;------------------- END -

msgout        defb 'compressed in #',0

curadr        defw 0 ; current adress of data
curlength     defw 0 ; lenght of data
;
literal       defw 0 ; counter of literal data to push
curliteraladr defw 0 ; adress of first literal data
;
;
; key scan from current adress -255 bytes to current adress -1 byte
;
LZ48_get_match
xor a
ld h,a
ld l,a
ld (maxmatch+1),hl
ld lx,a ; matchflag
ld hl,(curadr)
ld de,255
sbc hl,de
ld (startscan+1),hl
startadr_cpy1:ld de,#1234
sbc hl,de
jr nc,LZ4_get_match_compute_start
jr z,LZ4_get_match_compute_start
startadr_cpy2:ld hl,#1234
ld (startscan+1),hl
LZ4_get_match_compute_start

ld hl,(curadr)
ld (curadrcpy+1),hl
ld (curadrcpy2+1),hl

endadrcpy2m3: ld de,#1234
xor a
sbc hl,de
;----- if the previous key end in the last 3 bytes, we must manage this particular case...
ret nc

endadrcpy: ld hl,#1234
ld a,l
ld (matchcp1+1),a
ld a,h
ld (matchcp2+1),a
xor a
;------------- looking for 3 repetitions or more ------------------------
LZ48_get_match_rescan
ld bc,3
startscan: ld de,#1234
curadrcpy: ld hl,#1234
; we are looking for a key with 3 repetitions or more
ld a,(de)
cp (hl)
jr nz,LZ48_get_match_inc_scan
inc hl
inc de
ld a,(de)
cp (hl)
jr nz,LZ48_get_match_inc_scan
inc hl
inc de
ld a,(de)
cp (hl)
jr nz,LZ48_get_match_inc_scan
inc hl
inc de

LZ48_get_match_scan
ld a,(de)
cp (hl)
jr nz,LZ48_get_match_scan_is_best
inc bc
inc hl
inc de
ld a,l
matchcp1:cp #12
jr nz,LZ48_get_match_scan ; until the end of data, if data match!
ld a,h
matchcp2:cp #12
jr nz,LZ48_get_match_scan ; until the end of data, if data match!

;--------------------

LZ48_get_match_scan_is_best
; found something?
maxmatch:ld hl,#1234
xor a
sbc hl,bc
jr nc,LZ48_get_match_inc_scan
; this is the best match so far
ld (maxmatch+1),bc
ld hl,(startscan+1)
ld (maxoffset+1),hl
jr LZ48_get_match_inc_scan_next

LZ48_get_match_inc_scan
ld hl,(startscan+1)
LZ48_get_match_inc_scan_next
inc hl
ld (startscan+1),hl

xor a
curadrcpy2:ld de,#1234
sbc hl,de
jr nz,LZ48_get_match_rescan ; until we reach the current adress BUT endadr-3!

; do we have a match?
ld hl,(maxmatch+1)
ld a,h
or l
ret z
; yes! set match flag / A is already != 0
inc lx
ret


lz48_failed defb 0

push_bank   defb 0
push_offset defw 0

blockadr   defw 0
blockbnk   defb 0

; save memory position and push 0
LZ48_newblock
push af
push bc
push hl
ld a,(push_bank)
ld (blockbnk),a
ld hl,(push_offset)
ld (blockadr),hl
xor a
call LZ48_push_byte
pop hl
pop bc
pop af
ret

LZ48_blockheaderfusion
push bc
push hl
push af
ld b,#7F
ld a,(blockbnk)
out (c),a
pop af
ld hl,(blockadr)
or (hl)
ld (hl),a
ld c,#C0
out (c),c
pop hl
pop bc
ret

LZ48_push_byte
push af
push bc
push hl
push af

ld a,(push_bank)
ld b,#7F
out (c),a
ld hl,(push_offset)
pop af
ld (hl),a
ld (lastpushbyte+1),a
inc hl
ld a,h
cp #80
jr nz,push_lz48_byte_exit
ld hl,#4000
ld a,(push_bank)
inc a
cp #C8
call z,LZ48_overmem
ld (push_bank),a
push_lz48_byte_exit
ld (push_offset),hl
; central ram again
ld bc,#7FC0
out (c),c
pop hl
pop bc
pop af
ret

LZ48_overmem
ld a,1
ld (lz48_failed),a
ld a,#C4
ret

