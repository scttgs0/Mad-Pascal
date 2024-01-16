
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
var bmap: ^TBitmap;
begin
	IOPAGE_CTRL := iopPage0;

    bmap[idx].ctrl := ctrl;
    bmap[idx].addr[0] := byte(addr AND $FF);
    bmap[idx].addr[1] := byte((addr shr 8) AND $FF);
    bmap[idx].addr[2] := byte((addr shr 16) AND $FF);
end;


procedure Show(idx: byte);
var bmap: ^TBitmap;
begin
	IOPAGE_CTRL := iopPage0;

    bmap[idx].ctrl := bmap[idx].ctrl or bitmapctrl.bmcEnable;
end;


procedure Hide(idx: byte);
var bmap: ^TBitmap;
begin
	IOPAGE_CTRL := iopPage0;

    bmap[idx].ctrl := bmap[idx].ctrl and not bitmapctrl.bmcEnable;
end;

end.
