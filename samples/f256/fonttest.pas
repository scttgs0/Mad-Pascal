
program fonttest;

uses crt, font, f256;

var
    font00: array of byte = [{$BIN2CSV goth.set}];


begin
    // InitGraph(ord(masterctrll(mcGraphicsOn+mcBitmapOn)),ord(masterctrlh.mcVideoMode240));
    IOPAGE_CTRL := iopPage0;

    MASTER_CTRL_L := ord(masterctrll(mcTextOn));
    MASTER_CTRL_H := ord(masterctrlh.mcVideoMode240);

    font.Init(0, @font00);

    ClrScr;

    TextAttr := $10;
    Writeln;
    Writeln('Hail and Well met! Shall I find thee a Goodly character, or Hast thou brought one with thee?');
    Writeln;
    Writeln('Art but Passing through the Inn and wish to return to the Dunjon?');

end.
