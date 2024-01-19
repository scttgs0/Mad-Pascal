
program fonttest;

uses crt, font, f256;

var
    font00: array[0..1024] of byte = ({$BIN2CSV goth.set});

begin
    // InitGraph(ord(masterctrll(mcGraphicsOn+mcBitmapOn)),ord(masterctrlh.mcVideoMode240));
    IOPAGE_CTRL := iopPage0;

    MASTER_CTRL_L := ord(masterctrll(mcTextOn));
    MASTER_CTRL_H := ord(masterctrlh.mcVideoMode240);

    font.Init(0, @font00);

    ClrScr;

    TextAttr := $10;
    writeln('Hello World!');
end.
