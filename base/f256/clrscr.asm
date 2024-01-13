
; unit CRT: TextMode

.proc	@ClrScr
        opt c+

        phx
        phy

        lda IOPAGE_CTRL
        pha

        lda #@iopagectrl(iopPage2)
        sta IOPAGE_CTRL

        ldx #$00                                ; text color (black:black)
        stz CursorColumn
        stz CursorRow

        lda #>CS_TEXT_MEM_PTR
        sta scrnCursor+1
        lda #<CS_TEXT_MEM_PTR
        sta scrnCursor

        lda MASTER_CTRL_H
        and #@masterctrlh(mcTextDoubleX)        ; check screen mode for double-x (40 or 80 columns)
        beq _in640x480

;   40x30=$04B0
_in320x240:
        lda #>(CS_TEXT_MEM_PTR+$04B0)
        sta tempzp+1
        lda #<(CS_TEXT_MEM_PTR+$04B0)

        bra _1

;   80x60=$12C0
_in640x480:
        lda #>(CS_TEXT_MEM_PTR+$12C0)
        sta tempzp+1
        lda #<(CS_TEXT_MEM_PTR+$12C0)

_1      tay
        stz tempzp

_loop:
        lda #' '
        sta (tempzp),Y

        inc IOPAGE_CTRL
        txa                 ; text color
        sta (tempzp),Y

        dec IOPAGE_CTRL

        dey
        cpy #$FF
        bne _loop

        dec tempzp+1
        lda tempzp+1
        cmp scrnCursor+1
        bcs _loop

_skip:
        pla
        sta IOPAGE_CTRL

        ply
        plx
        rts

        opt c-
.endp
