
unit sid;


// ------------------------------------
interface
// ------------------------------------

uses f256;

type
    TSIDChannel = record
        freq: word;
        pulse: word;
        ctrl: byte;
        atdcy: byte;
        surel: byte
    end;

    TSID = record
        channel: array[0..2] of TSIDChannel;
        cutoff: word;
        reson: byte;
        sigvol: byte;
        random: byte;
        env3: dword;
    end;

procedure Init(idx: byte);
procedure ResetChannel(idx, chan: byte);


// ------------------------------------
implementation
// ------------------------------------

procedure Init(idx: byte);
var sid: ^TSID absolute $D400;
begin
    IOPAGE_CTRL := iopPage0;

    if idx = 1 then
        sid := sid + $100;

    sid.channel[0].freq := 0;
    sid.channel[0].pulse := 0;
    sid.channel[0].ctrl := 0;
    sid.channel[0].atdcy := 0;
    sid.channel[0].surel := 0;

    sid.channel[1].freq := 0;
    sid.channel[1].pulse := 0;
    sid.channel[1].ctrl := 0;
    sid.channel[1].atdcy := 0;
    sid.channel[1].surel := 0;

    sid.channel[2].freq := 0;
    sid.channel[2].pulse := 0;
    sid.channel[2].ctrl := 0;
    sid.channel[2].atdcy := 0;
    sid.channel[2].surel := 0;

    sid.cutoff := 0;
    sid.reson := 0;
    sid.sigvol := 0;
    sid.random := 0;
    sid.env3 := 0;
end;


procedure ResetChannel(idx, chan: byte);
var sid: ^TSID absolute $D400;
begin
    IOPAGE_CTRL := iopPage0;

    if idx = 1 then
        sid := sid + $100;

    if chan <= 2 then begin
        sid.channel[chan].freq := 0;
        sid.channel[chan].pulse := 0;
        sid.channel[chan].ctrl := 0;
        sid.channel[chan].atdcy := 0;
        sid.channel[chan].surel := 0;
    end;
end;

end.
