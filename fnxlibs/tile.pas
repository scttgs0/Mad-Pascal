
unit tile;


// ------------------------------------
interface
// ------------------------------------

uses f256;

type
    TTileMap = record
        ctrl: byte;
        addr: array[0..2] of byte;
        xSize: word;
        ySize: word;
        xScroll: smallint;
        yScroll: smallint;
    end;

    TTileSet = record
        addr: array[0..2] of byte;
        ctrl: byte;
    end;

procedure SetInit(idx, ctrl: byte; addr: dword);

procedure MapInit(idx, ctrl: byte; xSize, ySize: word; addr: dword);
procedure Show(idx: byte);
procedure Hide(idx: byte);
procedure Scroll(idx: byte; xScroll, yScroll: smallint);


// ------------------------------------
implementation
// ------------------------------------

procedure SetInit(idx, ctrl: byte; addr: dword);
var tset: ^TTileSet absolute $D280;
begin
    IOPAGE_CTRL := iopPage0;

    if idx <= 7 then
        tset := tset + idx;

    tset.ctrl := ctrl;
    tset.addr[0] := byte(addr AND $FF);
    tset.addr[1] := byte((addr shr 8) AND $FF);
    tset.addr[2] := byte((addr shr 16) AND $FF);
end;


procedure MapInit(idx, ctrl: byte; xSize, ySize: word; addr: dword);
var tmap: ^TTileMap absolute $D200;
begin
    IOPAGE_CTRL := iopPage0;

    if idx <= 2 then
        tmap := tmap + idx;

    tmap.ctrl := ctrl;
    tmap.addr[0] := byte(addr AND $FF);
    tmap.addr[1] := byte((addr shr 8) AND $FF);
    tmap.addr[2] := byte((addr shr 16) AND $FF);
    tmap.xSize := xSize;
    tmap.ySize := ySize;
    tmap.xScroll := 0;
    tmap.yScroll := 0;
end;


procedure Show(idx: byte);
var tmap: ^TTileMap absolute $D200;
begin
    IOPAGE_CTRL := iopPage0;

    if idx <= 2 then begin
        tmap := tmap + idx;
        tmap.ctrl := tmap.ctrl or tilemapctrl.tcEnable;
    end;
end;


procedure Hide(idx: byte);
var tmap: ^TTileMap absolute $D200;
begin
    IOPAGE_CTRL := iopPage0;

    if idx <= 2 then begin
        tmap := tmap + idx;
        tmap.ctrl := tmap.ctrl and not tilemapctrl.tcEnable;
    end;
end;


procedure Scroll(idx: byte; xScroll, yScroll: smallint);
var tmap: ^TTileMap absolute $D200;
begin
    IOPAGE_CTRL := iopPage0;

    if idx <= 2 then begin
        tmap := tmap + idx;
        tmap.xScroll := xScroll;
        tmap.yScroll := yScroll;
    end;
end;

end.
