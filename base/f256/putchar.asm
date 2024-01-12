
.proc   @putchar (.byte a) .reg
        opt c+

        phx
        phy
        tay

        lda IOPAGE_CTRL
        pha

        tya
        cmp #eol
        bne _1

        stz CursorColumn
        inc CursorRow
        bra @+

_1      ldx #@iopagectrl(iopPage2)
        stx IOPAGE_CTRL

        tya
        sta (ScreenPointer)

        inc IOPAGE_CTRL

        lda #$10 ;CursorColor HACK:
        sta (ScreenPointer)

        inc ScreenPointer
        bne @+

        inc ScreenPointer+1
        lda ScreenPointer+1             ; lazy check for overrun
        cmp #>(CS_TEXT_MEM_PTR+80*60)
        bne @+

        stz ScreenPointer
        stz ScreenPointer+1

@       pla
        sta IOPAGE_CTRL

        ply
        plx
        rts

        opt c-
.endp
