
program textscroll;

uses crt;

var Index : integer;

begin
    ClrScr;

    TextAttr := $10;

    for Index := 1 to 70 do
        Writeln('line #',Index:3);
end.
