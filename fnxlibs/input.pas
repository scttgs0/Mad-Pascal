
unit input;


// ------------------------------------
interface
// ------------------------------------

uses f256;

type
    TMousePos = record
        xPos: word;
        xPos: word;
    end;

function ReadDIP; byte;

function ReadGamePad(idx: byte); byte;
function ReadJoystick(idx: byte); byte;

function ReadKey; byte;

procedure InitMouse(ctrl: byte);
function ReadMouse; TMousePos;
procedure SetMouseImage(addr: dword);
procedure ShowMouse;
procedure HideMouse;


// ------------------------------------
implementation
// ------------------------------------

function ReadDIP; byte;
begin
    IOPAGE_CTRL := iopPage0;

    result := DIP_SWITCH;
end;


function ReadGamePad(idx: byte); byte;
begin
    result := 0;
end;


function ReadJoystick(idx: byte); byte;
begin
    IOPAGE_CTRL := iopPage0;

    case idx of
        $00: result := JOYSTICK0;
        $01: result := JOYSTICK1;
    end;
end;


function ReadKey(idx: byte); byte;
begin
    result := 0;
end;


procedure InitMouse(ctrl: byte);
begin
    IOPAGE_CTRL := iopPage0;

    MOUSE_CTRL := ctrl;
end;


function ReadMouse; TMousePos;
var pos: TMousePos;
begin
    IOPAGE_CTRL := iopPage0;

    pos.xPos := MOUSE_X;
    pos.yPos := MOUSE_Y;

    result := pos;
end;


procedure SetMouseImage(addr: dword);
var i: byte;
begin
    IOPAGE_CTRL := iopPage0;

    for i := 0 to 255 do
        MOUSE_IMAGE+i := pointer(addr)[i];
end;


procedure ShowMouse;
begin
    IOPAGE_CTRL := iopPage0;

    MOUSE_CTRL := MOUSE_CTRL or mousectrl.mcEnable;
end;


procedure HideMouse;
begin
    IOPAGE_CTRL := iopPage0;

    MOUSE_CTRL := MOUSE_CTRL and not mousectrl.mcEnable;
end;

end.
