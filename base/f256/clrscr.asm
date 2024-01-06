
; unit CRT: TextMode

.proc	@ClrScr
        opt c+

        phx
        phy

        lda IOPAGE_CTRL
        pha

        lda #@iopagectrl(iopPage2)
        sta IOPAGE_CTRL

        ldx CursorColor
        stz tempzp
        stz ScreenPointer

        lda #>CS_TEXT_MEM_PTR
        sta tempzp+1
        sta ScreenPointer+1

;   assuming 80x60=$12c0
        ldy #>(CS_TEXT_MEM_PTR+(80*60))
        lda MASTER_CTRL_H
        and #@masterctrlh(mcTextDoubleX)        ; check screen mode for double x (40 or 80 columns)
        beq _in640x480

;   assuming 40x30=$04b0
        ldy #>(CS_TEXT_MEM_PTR+(40*30))

_in640x480:
        sty tempzp+2

        ldy #0
_loop:
        lda #' '
        sta (tempzp),y

        inc IOPAGE_CTRL
        txa                 ; cursor color
        sta (tempzp),y

        dec IOPAGE_CTRL

        iny
        bne _loop

        inc tempzp+1
        lda tempzp+1
        cmp tempzp+2
        bne _loop

_skip:
        pla
        sta IOPAGE_CTRL

        ply
        plx
        rts

        opt c-
.endp
