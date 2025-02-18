; --------------------------------------------------------------------------------------------------------------------- ;
; Castles of Dr Creep - creepload.prg
; --------------------------------------------------------------------------------------------------------------------- ;
                            * = $c000
; --------------------------------------------------------------------------------------------------------------------- ;
; compiler settings
; --------------------------------------------------------------------------------------------------------------------- ;
                            .cpu "6502"                     ; standard 65xx processor
                            
Mem                         .include "../../inc/c64.MEM.asm"; Memory layout (includes found via -I cmd line option)"
; --------------------------------------------------------------------------------------------------------------------- ;
CLZ_TextScreenPtr           = $14                           ; 
CLZ_TextScreenPtr_Lo          = $14                         ; 
CLZ_TextScreenPtr_Hi          = $15                         ; 
        
CLZ_ColorRamPtr             = $16                           ; 
CLZ_ColorRamPtr_Lo            = $16                         ; 
CLZ_ColorRamPtr_Hi            = $17                         ; 
; --------------------------------------------------------------------------------------------------------------------- ;
; in/out pointer for the pre graphic text screen
; --------------------------------------------------------------------------------------------------------------------- ;
CLZ_TextDataInPtr           = $14                           ; 
CLZ_TextDataInPtr_Lo          = $14                         ; 
CLZ_TextDataInPtr_Hi          = $15                         ; 
        
CLZ_TextDataOutPtr          = $16                           ; 
CLZ_TextDataOutPtr_Lo         = $16                         ; 
CLZ_TextDataOutPtr_Hi         = $17                         ; 
; --------------------------------------------------------------------------------------------------------------------- ;
; in/out pointer for the different koala picture data sections
; --------------------------------------------------------------------------------------------------------------------- ;
CLZ_KoalaDataInPtr          = $14                           ; 
CLZ_KoalaDataInPtr_Lo         = $14                         ; 
CLZ_KoalaDataInPtr_Hi         = $15                         ; 
        
CLZ_KoalaDataOutPtr         = $16                           ; 
CLZ_KoalaDataOutPtr_Lo        = $16                         ; 
CLZ_KoalaDataOutPtr_Hi        = $17                         ; 
; --------------------------------------------------------------------------------------------------------------------- ;
GameStart                   = $0800                         ; start address game code
; --------------------------------------------------------------------------------------------------------------------- ;
ScreenMultiColor            = $cc00                         ; target title picture screen color info
ScreenBitMap                = $e000                         ; target title picture bitmap info
; --------------------------------------------------------------------------------------------------------------------- ;
KoalaDataLoadAdr            = $0800                         ; load address koala picture
KoalaBitmap                 = KoalaDataLoadAdr              ; pic offset: $0000 --> $0800 - $2f3f - koala pic bitmap
KoalaMultiColors            = KoalaDataLoadAdr + $1f40      ; pic offset: $1f40 --> $2740 - $2b27 - koala pic color video ram
KoalaColorRam               = KoalaMultiColors + $03e8      ; pic offset: $2328 --> $2b28 - $2f0f - koala pic color ram 
KoalaColorBkgr              = KoalaColorBkgr   + $03e8      ; pic offset: $2710 --> $2f10         - koala pic color background
; --------------------------------------------------------------------------------------------------------------------- ;
                            
; ´ ------------------------------------------------------------------------------------------------------------------- ;
;                           Does    : display the load text screen
;                           Expects : 
;                           Returns : 
; --------------------------------------------------------------------------------------------------------------------- ;
DiplayTextStartScreen      .block                           ; 
; --------------------------------------------------------------------------------------------------------------------- ;
; set text screen and coloram pointers
; --------------------------------------------------------------------------------------------------------------------- ;
                            lda #<VICSCN                    ; 
                            sta CLZ_TextScreenPtr_Lo        ; 
                            lda #>VICSCN                    ; 
                            sta CLZ_TextScreenPtr_Hi        ; 
                            
                            lda #<COLORAM                   ; 
                            sta CLZ_ColorRamPtr_Lo          ; 
                            lda #>COLORAM                   ; 
                            sta CLZ_ColorRamPtr_Hi          ; 
; --------------------------------------------------------------------------------------------------------------------- ;
; clear text screen and colorram
; --------------------------------------------------------------------------------------------------------------------- ;
                            ldy #$00                        ; ini page offset
GetNextClearChar            lda #" "                        ; 
ClrNextScreenPos            sta (CLZ_TextScreenPtr),y       ; 
                            sta (CLZ_ColorRamPtr),y         ; 
                            
                            iny                             ; inc page offset
                            bne ClrNextScreenPos            ; check: max reached - no: continue
                            
                            inc CLZ_TextScreenPtr_Hi        ; inc screen page pointers
                            inc CLZ_ColorRamPtr_Hi          ; 
                            
                            lda CLZ_TextScreenPtr_Hi        ; 
                            cmp #>VICSCN + $0400            ; test max $04 pages
                            bne GetNextClearChar            ; check: NE - yes: continue
; --------------------------------------------------------------------------------------------------------------------- ;
; init load screen text pointer
; --------------------------------------------------------------------------------------------------------------------- ;
                            lda #<TabScreenText             ; 
                            sta CLZ_TextDataInPtr_Lo        ; 
                            lda #>TabScreenText             ; 
                            sta CLZ_TextDataInPtr_Hi        ; 
; --------------------------------------------------------------------------------------------------------------------- ;
; get header of screen text line - set in/out pointers
; --------------------------------------------------------------------------------------------------------------------- ;
GetNextTextLineHeader       ldy #$00                        ; 
                            lda (CLZ_TextDataInPtr),y       ; get next text line char
                            bmi DiplayKoalaStartPicture     ; check: flag end of text lines - yes: show start graphic
                            
                            ldy #$01                        ; get row number offset
                            lda (CLZ_TextDataInPtr),y       ; get text row number from header
                            asl a                           ; *2
                            tax                             ; set offset screen row address table
                            
                            lda TabScreenRowAdr + $00,x     ; get screen row address table
                            sta CLZ_TextDataOutPtr_Lo       ; 
                            lda TabScreenRowAdr + $01,x     ; 
                            sta CLZ_TextDataOutPtr_Hi       ; 
; --------------------------------------------------------------------------------------------------------------------- ;
; add column number to row address
; --------------------------------------------------------------------------------------------------------------------- ;
                            dey                             ; get col number offset
                            
                            clc                             ; 
                            lda CLZ_TextDataOutPtr_Lo       ; 
                            adc (CLZ_TextDataInPtr),y       ; add col number
                            sta CLZ_TextDataOutPtr_Lo       ; 
                            
                            lda CLZ_TextDataOutPtr_Hi       ; 
                            adc #$00                        ; add carry
                            sta CLZ_TextDataOutPtr_Hi       ; 
; --------------------------------------------------------------------------------------------------------------------- ;
; add text header length
; --------------------------------------------------------------------------------------------------------------------- ;
                            clc                             ; 
                            lda CLZ_TextDataInPtr_Lo        ; 
                            adc #$02                        ; add header lenght - point to text line start
                            sta CLZ_TextDataInPtr_Lo        ; 
                            
                            lda CLZ_TextDataInPtr_Hi        ; 
                            adc #$00                        ; add carry
                            sta CLZ_TextDataInPtr_Hi        ; 
                            
                            ldy #$00                        ; in offset text line
GetNextTextLineChar         lda (CLZ_TextDataInPtr),y       ; 
                            bmi OutLastLineChar             ; check: end of line - yes: prepare new line
                            
                            sta (CLZ_TextDataOutPtr),y      ; 
                            
                            iny                             ; inc text line offset
                            jmp GetNextTextLineChar         ; 
; --------------------------------------------------------------------------------------------------------------------- ;
OutLastLineChar             and #$7f                        ; .####### - clear char bit7
                            sta (CLZ_TextDataOutPtr),y      ; out last line char
; --------------------------------------------------------------------------------------------------------------------- ;
; add offset of header new line to input text pointer
; --------------------------------------------------------------------------------------------------------------------- ;
                            iny                             ; set offset to header of next line
                            
                            tya                             ; 
                            clc                             ; 
                            adc CLZ_TextDataInPtr_Lo        ; 
                            sta CLZ_TextDataInPtr_Lo        ; 
                            
                            lda CLZ_TextDataInPtr_Hi        ; 
                            adc #$00                        ; add carry
                            sta CLZ_TextDataInPtr_Hi        ; 
                            
                            jmp GetNextTextLineHeader       ; 
                           .bend                            ; 
; ` ------------------------------------------------------------------------------------------------------------------- ;
                            
; ´ ------------------------------------------------------------------------------------------------------------------- ;
;                           Does    : load and display the start picture
;                           Expects : 
;                           Returns : 
; --------------------------------------------------------------------------------------------------------------------- ;
DiplayKoalaStartPicture    .block                           ; 
; --------------------------------------------------------------------------------------------------------------------- ;
; load picture and game code files 
; --------------------------------------------------------------------------------------------------------------------- ;
                            lda #YELLOW                     ; 
                            sta EXTCOL                      ; VIC($D020) Border Color
                            sta BGCOL0                      ; VIC($D021) Background Color 0
                            
                            lda #VMCSB_VM_0400 | VMCSB_CB_1800 ; Video Matrix=$0400-$07e7 / Charset=$1800-$1fff
                            sta VMCSB                       ; VIC($D018) VIC Chip Memory Control
; --------------------------------------------------------------------------------------------------------------------- ;
; load the kola picture data file
; --------------------------------------------------------------------------------------------------------------------- ;
                            lda #$02                        ; get logical file number
                            ldx #$08                        ; get device number
                            ldy #$00                        ; get secondary command number ($00 = new load address)
                            jsr SETLFS                      ; Kernal($FFBA) Set logical file parameters ($FE00)
                            
                            lda #TabFileName_Picture_Len    ; 
                            ldx #<TabFileName_Picture       ; pic a title
                            ldy #>TabFileName_Picture       ; 
                            jsr SETNAM                      ; Kernal($FFBD) Set filename parameters ($FDF9)
                            
                            lda #$00                        ; get flag: load
                            ldx #<KoalaDataLoadAdr          ; alternate start address
                            ldy #>KoalaDataLoadAdr          ; 
                            jsr LOAD                        ; Kernal($FFD5) Load from device (via $330 to $F49E)
; --------------------------------------------------------------------------------------------------------------------- ;
; copy koala multi color data from KoalaDataLoadAdr + KoalaMultiColors
; --------------------------------------------------------------------------------------------------------------------- ;
                            lda #<KoalaMultiColors          ; 
                            sta CLZ_KoalaDataInPtr_Lo       ; 
                            lda #>KoalaMultiColors          ; 
                            sta CLZ_KoalaDataInPtr_Hi       ; 
                            
                            lda #<ScreenMultiColor          ; 
                            sta CLZ_KoalaDataOutPtr_Lo      ; 
                            lda #>ScreenMultiColor          ; 
                            sta CLZ_KoalaDataOutPtr_Hi      ; 
                            
                            ldy #$00                        ; 
GetNextKoalaMultiColorByte  lda (CLZ_KoalaDataInPtr),y      ; 
                            sta (CLZ_KoalaDataOutPtr),y     ; 
                            
                            iny                             ; inc page offset
                            bne GetNextKoalaMultiColorByte  ; check: whole page processed - no: continue
                            
                            inc CLZ_KoalaDataInPtr_Hi       ; inc multi color page pointers
                            inc CLZ_KoalaDataOutPtr_Hi      ; 
                            
                            lda CLZ_KoalaDataOutPtr_Hi      ; 
                            cmp #$d0                        ; test max
                            bne GetNextKoalaMultiColorByte  ; check: NE - yes: continue
; --------------------------------------------------------------------------------------------------------------------- ;
; copy koala bitmap data from KoalaDataLoadAdr + KoalaBitmap
; --------------------------------------------------------------------------------------------------------------------- ;
                            lda #<KoalaBitmap               ; 
                            sta CLZ_KoalaDataInPtr_Lo       ; 
                            lda #>KoalaBitmap               ; 
                            sta CLZ_KoalaDataInPtr_Hi       ; 
                            
                            lda #<ScreenBitMap              ; 
                            sta CLZ_KoalaDataOutPtr_Lo      ; 
                            lda #>ScreenBitMap              ; 
                            sta CLZ_KoalaDataOutPtr_Hi      ; 
                            
                            ldy #$00                        ; 
GetNextKoalaBitmapByte      lda (CLZ_KoalaDataInPtr),y      ; 
                            sta (CLZ_KoalaDataOutPtr),y     ; 
                            
                            iny                             ; inc page offset
                            bne GetNextKoalaBitmapByte      ; check: whole page processed - no: continue
                            
                            inc CLZ_KoalaDataInPtr_Hi       ; inc bitmap page pointers
                            inc CLZ_KoalaDataOutPtr_Hi      ; 
                            
                            lda CLZ_KoalaDataOutPtr_Hi      ; 
                            cmp #$00                        ; test max
                            bne GetNextKoalaBitmapByte      ; check: NE - yes: contimue
; --------------------------------------------------------------------------------------------------------------------- ;
; copy koala coloram data from KoalaDataLoadAdr + KoalaColorRam
; --------------------------------------------------------------------------------------------------------------------- ;
                            lda #<KoalaColorRam             ; 
                            sta CLZ_KoalaDataInPtr_Lo       ; 
                            lda #>KoalaColorRam             ; 
                            sta CLZ_KoalaDataInPtr_Hi       ; 
                            
                            lda #<COLORAM                   ; 
                            sta CLZ_KoalaDataOutPtr_Lo      ; 
                            lda #>COLORAM                   ; 
                            sta CLZ_KoalaDataOutPtr_Hi      ; 
                            
                            ldy #$00                        ; ini coloram page offset
GetNextKoalaColoramByte     lda (CLZ_KoalaDataInPtr),y      ; 
                            sta (CLZ_KoalaDataOutPtr),y     ; 
                            
                            iny                             ; inc coloram page offset
                            bne GetNextKoalaColoramByte     ; check: whole page processed - no: continue
                            
                            inc CLZ_KoalaDataInPtr_Hi       ; inc coloram page pointers
                            inc CLZ_KoalaDataOutPtr_Hi      ; 
                            
                            lda CLZ_KoalaDataOutPtr_Hi      ; 
                            cmp #>COLORAM + $0400           ; test max $04 pages
                            bne GetNextKoalaColoramByte     ; check: NE - yes: continue
; --------------------------------------------------------------------------------------------------------------------- ;
; set koala VIC2 values
; --------------------------------------------------------------------------------------------------------------------- ;
                            lda CI2DDRA                     ; CIA2($DD02) Data Dir A
                            ora #CI2DDRB_DPB1 | CI2DDRB_DPB0; ......##
                            sta CI2DDRA                     ; CIA2($DD02) Data Dir A
                            
                            lda CI2PRA                      ; CIA2($DD00) Data Port A - Bits 0-1 = VIC mem bank
                            and #~CI2PRA_VIC_BANK           ; ######.. - 00=$c000-$ffff - bank 3
                            sta CI2PRA                      ; CIA2($DD00) Data Port A - Bits 0-1 = VIC mem bank
                            
                            lda #SCROLY_BMM_ON | SCROLY_DEN_ON | SCROLY_RSEL_25 | SCROLY_YSCROLL_INIT_25 ; ..###.##
                            sta SCROLY                      ; VIC($D011) VIC Control Register 1 (Vert Fine Scroll)
                            
                            lda #SCROLX_MCM_ON | SCROLX_CSEL_40 ; ...##...
                            sta SCROLX                      ; VIC($D016) VIC Control Register 2 (Horiz Fine Scroll)
                            
                            lda #VMCSB_VM_0C00 | VMCSB_CB_2000 ; Video Matrix=$0c00-$0fe7 / Charset=$2000-$27ff
                            sta VMCSB                       ; VIC($D018) VIC Chip Memory Control
                            
                            lda #YELLOW                     ; 
                            sta EXTCOL                      ; VIC($D020) Border Color
                            
                            lda #WHITE                      ; 
                            sta BGCOL0                      ; VIC($D021) Background Color 0
                           .bend                            ; 
; ` ------------------------------------------------------------------------------------------------------------------- ;
                            
; ´ ------------------------------------------------------------------------------------------------------------------- ;
;                           Does    : load game code and start the game
;                           Expects : 
;                           Returns : 
; --------------------------------------------------------------------------------------------------------------------- ;
LoadAndStartGame           .block                           ; 
                            lda #$02                        ; get logical file number
                            ldx #$08                        ; get device number
                            ldy #$00                        ; get secondary command number ($00 = new load address)
                            jsr SETLFS                      ; Kernal($FFBA) Set logical file parameters ($FE00)
                            
                            lda #TabFileName_Object_Len     ; 
                            ldx #<TabFileName_Object        ; 
                            ldy #>TabFileName_Object        ; 
                            jsr SETNAM                      ; Kernal($FFBD) Set filename parameters ($FDF9)
                            
                            lda #$00                        ; get flag: load
                            ldx #<GameStart                 ; alternate start address
                            ldy #>GameStart                 ; 
                            jsr LOAD                        ; Kernal($FFD5) Load from device (via $330 to $F49E)
                            
                            jmp GameStart                   ; start Castles Of Dr Creep
                           .bend                            ; 
; ` ------------------------------------------------------------------------------------------------------------------- ;
                            
; --------------------------------------------------------------------------------------------------------------------- ;
TabFileName_Picture         = *       ; 
                            .byte $81 ; 
                            .byte "p" ; 
                            .byte "i" ; 
                            .byte "c" ; 
                            .byte " " ; 
                            .byte "a" ; 
                            .byte " " ; 
                            .byte "t" ; 
                            .byte "i" ; 
                            .byte "t" ; 
                            .byte "l" ; 
                            .byte "e" ; 
                            .byte " " ; 
                            .byte " " ; 
                            .byte " " ; 
TabFileName_Picture_Len     = * - TabFileName_Picture ; 
; --------------------------------------------------------------------------------------------------------------------- ;
TabFileName_Object          = *       ; 
                            .byte "o" ; 
                            .byte "b" ; 
                            .byte "j" ; 
                            .byte "e" ; 
                            .byte "c" ; 
                            .byte "t" ; 
TabFileName_Object_Len     = * - TabFileName_Object ; 
; --------------------------------------------------------------------------------------------------------------------- ;
TabScreenRowAdr             = *         ; 
                            .word $0400 ; address text screen row 01
                            .word $0428 ; address text screen row 02
                            .word $0450 ; address text screen row 03
                            .word $0478 ; address text screen row 04
                            .word $04a0 ; address text screen row 05
                            .word $04c8 ; address text screen row 06
                            .word $04f0 ; address text screen row 07
                            .word $0518 ; address text screen row 08
                            .word $0540 ; address text screen row 09
                            .word $0568 ; address text screen row 10
                            .word $0590 ; address text screen row 11
                            .word $05b8 ; address text screen row 12
                            .word $05e0 ; address text screen row 13
                            .word $0608 ; address text screen row 14
                            .word $0630 ; address text screen row 15
                            .word $0658 ; address text screen row 16
                            .word $0680 ; address text screen row 17
                            .word $06a8 ; address text screen row 18
                            .word $06d0 ; address text screen row 19
                            .word $06f8 ; address text screen row 20
                            .word $0720 ; address text screen row 21
                            .word $0748 ; address text screen row 22
                            .word $0770 ; address text screen row 23
                            .word $0798 ; address text screen row 24
                            .word $07c0 ; address text screen row 25
; --------------------------------------------------------------------------------------------------------------------- ;
; load screen info text lines data
; --------------------------------------------------------------------------------------------------------------------- ;
TabScreenText               = *       ; 
; --------------------------------------------------------------------------------------------------------------------- ;
TabScreenTextCol_01         .byte $06 ; header
TabScreenTextRow_01         .byte $01 ; 
                            
TabScreenText_01            .byte "b" ; text
                            .byte "r" ; 
                            .byte "0" ; 
                            .byte "d" ; 
                            .byte "e" ; 
                            .byte "r" ; 
                            .byte "b" ; 
                            .byte "u" ; 
                            .byte "n" ; 
                            .byte "d" ; 
                            .byte " " ; 
                            .byte "s" ; 
                            .byte "o" ; 
                            .byte "f" ; 
                            .byte "t" ; 
                            .byte "w" ; 
                            .byte "a" ; 
                            .byte "r" ; 
                            .byte "e" ; 
                            .byte " " ; 
                            .byte "p" ; 
                            .byte "r" ; 
                            .byte "e" ; 
                            .byte "s" ; 
                            .byte "e" ; 
                            .byte "n" ; 
                            .byte "t" ; 
                            .byte "s" | $80 ; end of line
; --------------------------------------------------------------------------------------------------------------------- ;
TabScreenTextCol_02         .byte $06 ; header
TabScreenTextRow_02         .byte $0a ; 
                            
TabScreenText_02            .byte """"; " text
                            .byte "t" ; 
                            .byte "h" ; 
                            .byte "e" ; 
                            .byte " " ; 
                            .byte "c" ; 
                            .byte "a" ; 
                            .byte "s" ; 
                            .byte "t" ; 
                            .byte "l" ; 
                            .byte "e" ; 
                            .byte "s" ; 
                            .byte " " ; 
                            .byte "o" ; 
                            .byte "f" ; 
                            .byte " " ; 
                            .byte "d" ; 
                            .byte "o" ; 
                            .byte "c" ; 
                            .byte "t" ; 
                            .byte "o" ; 
                            .byte "r" ; 
                            .byte " " ; 
                            .byte "c" ; 
                            .byte "r" ; 
                            .byte "e" ; 
                            .byte "e" ; 
                            .byte "p" ; 
                            .byte """" |$80 ; end of line
; --------------------------------------------------------------------------------------------------------------------- ;
TabScreenTextCol_03         .byte $0f ; header
TabScreenTextRow_03         .byte $0d ; 
                            
TabScreenText_03            .byte "b" ; text
                            .byte "y" ; 
                            .byte " " ; 
                            .byte "e" ; 
                            .byte "d" ; 
                            .byte " " ; 
                            .byte "h" ; 
                            .byte "o" ; 
                            .byte "b" ; 
                            .byte "b" ; 
                            .byte "s" | $80 ; end of line
; --------------------------------------------------------------------------------------------------------------------- ;
TabScreenTextCol_05         .byte $02 ; header
TabScreenTextRow_05         .byte $17 ; 
                            
TabScreenText_05            .byte "p" ; text
                            .byte "l" ; 
                            .byte "e" ; 
                            .byte "a" ; 
                            .byte "s" ; 
                            .byte "e" ; 
                            .byte " " ; 
                            .byte "a" ; 
                            .byte "l" ; 
                            .byte "l" ; 
                            .byte "o" ; 
                            .byte "w" ; 
                            .byte " " ; 
                            .byte "t" ; 
                            .byte "w" ; 
                            .byte "o" ; 
                            .byte " " ; 
                            .byte "m" ; 
                            .byte "i" ; 
                            .byte "n" ; 
                            .byte "u" ; 
                            .byte "t" ; 
                            .byte "e" ; 
                            .byte "s" ; 
                            .byte " " ; 
                            .byte "f" ; 
                            .byte "o" ; 
                            .byte "r" ; 
                            .byte " " ; 
                            .byte "l" ; 
                            .byte "o" ; 
                            .byte "a" ; 
                            .byte "d" ; 
                            .byte "i" ; 
                            .byte "n" ; 
                            .byte "g" | $80 ;  end of line
; --------------------------------------------------------------------------------------------------------------------- ;
TabScreenTextCol_04         .byte $05 ; header
TabScreenTextRow_04         .byte $0f ; 
                            
TabScreenText_04            .byte "(" ; text
                            .byte "c" ; 
                            .byte ")" ; 
                            .byte " " ; 
                            .byte "1" ; 
                            .byte "9" ; 
                            .byte "8" ; 
                            .byte "4" ; 
                            .byte " " ; 
                            .byte "b" ; 
                            .byte "r" ; 
                            .byte "0" ; 
                            .byte "d" ; 
                            .byte "e" ; 
                            .byte "r" ; 
                            .byte "b" ; 
                            .byte "u" ; 
                            .byte "n" ; 
                            .byte "d" ; 
                            .byte " " ; 
                            .byte "s" ; 
                            .byte "o" ; 
                            .byte "f" ; 
                            .byte "t" ; 
                            .byte "w" ; 
                            .byte "a" ; 
                            .byte "r" ; 
                            .byte "e" | $80 ; end of line
; --------------------------------------------------------------------------------------------------------------------- ;
                            .byte $80 ; end of text
; --------------------------------------------------------------------------------------------------------------------- ;
                            .byte $00 ; 
                            .byte $00 ; 
                            .byte $00 ; 
; --------------------------------------------------------------------------------------------------------------------- ;
