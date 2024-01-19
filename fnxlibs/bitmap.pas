
unit bitmap;


// ------------------------------------
interface
// ------------------------------------

uses f256;

type
    TBitmap = record
        ctrl: byte;
        addr: array[0..2] of byte;
        filler: array[0..3] of byte;
    end;

procedure Init(idx, ctrl: byte; addr: dword);
procedure Show(idx: byte);
procedure Hide(idx: byte);


// ------------------------------------
implementation
// ------------------------------------

procedure Init(idx, ctrl: byte; addr: dword);
var bmap: ^TBitmap absolute $D100;
begin
	IOPAGE_CTRL := iopPage0;

    bmap := bmap + idx;

    bmap.ctrl := ctrl;
    bmap.addr[0] := byte(addr AND $FF);
    bmap.addr[1] := byte((addr shr 8) AND $FF);
    bmap.addr[2] := byte((addr shr 16) AND $FF);
end;


procedure Show(idx: byte);
var bmap: ^TBitmap absolute $D100;
begin
	IOPAGE_CTRL := iopPage0;

    bmap := bmap + idx;

    bmap.ctrl := bmap.ctrl or bitmapctrl.bmcEnable;
end;


procedure Hide(idx: byte);
var bmap: ^TBitmap absolute $D100;
begin
	IOPAGE_CTRL := iopPage0;

    bmap := bmap + idx;

    bmap.ctrl := bmap.ctrl and not bitmapctrl.bmcEnable;
end;

end.
