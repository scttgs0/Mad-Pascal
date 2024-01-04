
.proc   @putchar (.byte a) .reg
        pha
        phx

        ldx #@iopagectrl(iopPage2)
        stx IOPAGE_CTRL

        sta (ScreenPointer)

        inc IOPAGE_CTRL

        lda CursorColor
        sta (ScreenPointer)

        stz IOPAGE_CTRL

        inc ScreenPointer

        bne @+
        inc ScreenPointer+1
        lda ScreenPointer+1             ; lazy check for overrun
        cmp #>(CS_TEXT_MEM_PTR+80*60)
        bne @+

        stz ScreenPointer
        stz ScreenPointer+1

@       plx
        pla
        rts
.endp
