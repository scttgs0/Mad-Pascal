
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
var tset: ^TTileSet;
begin
	IOPAGE_CTRL := iopPage0;

    if idx <= 7 then begin
        tset[idx].ctrl := ctrl;
        tset[idx].addr[0] := byte(addr AND $FF);
        tset[idx].addr[1] := byte((addr shr 8) AND $FF);
        tset[idx].addr[2] := byte((addr shr 16) AND $FF);
    end;
end;


procedure MapInit(idx, ctrl: byte; xSize, ySize: word; addr: dword);
var tmap: ^TTileMap;
begin
	IOPAGE_CTRL := iopPage0;

    if idx <= 2 then begin
        tmap[idx].ctrl := ctrl;
        tmap[idx].addr[0] := byte(addr AND $FF);
        tmap[idx].addr[1] := byte((addr shr 8) AND $FF);
        tmap[idx].addr[2] := byte((addr shr 16) AND $FF);
        tmap[idx].xSize := xSize;
        tmap[idx].ySize := ySize;
        tmap[idx].xScroll := 0;
        tmap[idx].yScroll := 0;
    end;
end;


procedure Show(idx: byte);
var tmap: ^TTileMap;
begin
	IOPAGE_CTRL := iopPage0;

    if idx <= 2 then
        tmap[idx].ctrl := tmap[idx].ctrl or tilemapctrl.tcEnable;
end;


procedure Hide(idx: byte);
var tmap: ^TTileMap;
begin
	IOPAGE_CTRL := iopPage0;

    if idx <= 2 then
        tmap[idx].ctrl := tmap[idx].ctrl and not tilemapctrl.tcEnable;
end;


procedure Scroll(idx: byte; xScroll, yScroll: smallint);
var tmap: ^TTileMap;
begin
	IOPAGE_CTRL := iopPage0;

    if idx <= 2 then begin
        tmap[idx].xScroll := xScroll;
        tmap[idx].yScroll := yScroll;
    end;
end;

end.
