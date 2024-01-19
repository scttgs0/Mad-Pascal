
unit font;

// ------------------------------------
interface
// ------------------------------------

uses f256;

procedure Init(idx: byte; addr: word); assembler;


// ------------------------------------
implementation
// ------------------------------------

procedure Init(idx: byte; addr: word); assembler;
// var
//     fnt: ^byte absolute $C000;
//     src: ^byte;
//     i: word;
// begin
//     IOPAGE_CTRL := iopPage1;

//     src := pointer(addr);

//     if idx = 1 then
//         fnt := fnt + $800;

//     for i := 0 to 1023 do begin
//         fnt^ := src^;
//         inc(fnt);
//         inc(src);
//     end;
// end;
asm
        phx
        phy

        ldy IOPAGE_CTRL
        phy

        ldx #@iopagectrl(iopPage1)
        stx IOPAGE_CTRL

        lda #>addr
        sta tempzp+1
        lda #<addr
        sta tempzp

        lda #>$C000
        sta tempzp+3
        lda #<$C000
        sta tempzp+2

        ldx #$03
_1      ldy #$FF
_2      lda (tempzp),Y
        sta (tempzp+2),Y

        dey
        cpy #$FF
        bne _2

        dex
        bpl _1

        ply
        sty IOPAGE_CTRL

        ply
        plx
end;

end.
