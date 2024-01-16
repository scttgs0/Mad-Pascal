
unit font;


// ------------------------------------
interface
// ------------------------------------

uses f256;

procedure Init(idx: byte; addr: dword);


// ------------------------------------
implementation
// ------------------------------------

procedure Init(idx: byte; addr: dword);
begin
	IOPAGE_CTRL := iopPage1;

    if idx = 0 then begin
        FONT_MEMORY_BANK0[0] := byte(addr AND $FF);
        FONT_MEMORY_BANK0[1] := byte((addr shr 8) AND $FF);
        FONT_MEMORY_BANK0[2] := byte((addr shr 16) AND $FF);
    end else begin
        FONT_MEMORY_BANK1[0] := byte(addr AND $FF);
        FONT_MEMORY_BANK1[1] := byte((addr shr 8) AND $FF);
        FONT_MEMORY_BANK1[2] := byte((addr shr 16) AND $FF);
    end;
end;

end.
