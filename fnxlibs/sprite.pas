
unit sprite;


// ------------------------------------
interface
// ------------------------------------

uses f256;

type
    TSprite = record
        ctrl: byte;
        addr: array[0..2] of byte;
        xPos: word;
        yPos: word;
    end;

procedure Init(idx, ctrl: byte; addr: dword);
procedure Show(idx: byte);
procedure Hide(idx: byte);
procedure Pos(idx: byte; xPos, yPos: word);

(*
procedure SetAttrib(idx: byte; name: string; value: object);
function GetAttrib(idx: byte; name: string): object;
procedure DelAttrib(idx: byte; name: string);

procedure CheckCollisions;
function GetHitIndex(idx: byte): byte;

procedure InitAnimation(idx, animID: byte; autoplay: boolean);
procedure DoAnimation(animID: byte);
procedure EndAnimation(animID: byte);
*)


// ------------------------------------
implementation
// ------------------------------------

procedure Init(idx, ctrl: byte; addr: dword);
var spr: ^TSprite absolute $D900;
begin
	IOPAGE_CTRL := iopPage0;

    spr[idx].ctrl := ctrl;
    spr[idx].addr[0] := byte(addr AND $FF);
    spr[idx].addr[1] := byte((addr shr 8) AND $FF);
    spr[idx].addr[2] := byte((addr shr 16) AND $FF);
    spr[idx].xPos := 0;
    spr[idx].yPos := 0;
end;


procedure Show(idx: byte);
var spr: ^TSprite absolute $D900;
begin
	IOPAGE_CTRL := iopPage0;

    spr[idx].ctrl := spr[idx].ctrl or spritectrl.scEnable;
end;


procedure Hide(idx: byte);
var spr: ^TSprite absolute $D900;
begin
	IOPAGE_CTRL := iopPage0;

    spr[idx].ctrl := spr[idx].ctrl and not spritectrl.scEnable;
end;


procedure Pos(idx: byte; xPos, yPos: word);
var spr: ^TSprite absolute $D900;
begin
	IOPAGE_CTRL := iopPage0;

    spr[idx].xPos := xPos;
    spr[idx].yPos := yPos;
end;


(*
procedure SetAttrib(idx: byte; name: string; value: object);
begin

end;


function GetAttrib(idx: byte; name: string): object;
begin

end;


procedure DelAttrib(idx: byte; name: string);
begin

end;


procedure CheckCollisions;
begin

end;


function GetHitIndex(idx: byte): byte;
begin
    result := 0;
end;


procedure InitAnimation(idx, animID: byte; autoplay: boolean);
begin

end;


procedure DoAnimation(animID: byte);
begin

end;


procedure EndAnimation(animID: byte);
begin

end;
*)

end.
