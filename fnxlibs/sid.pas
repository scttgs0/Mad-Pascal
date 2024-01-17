
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

    case idx of
        $00: begin
            sid[0].channel[0].freq := 0;
            sid[0].channel[0].pulse := 0;
            sid[0].channel[0].ctrl := 0;
            sid[0].channel[0].atdcy := 0;
            sid[0].channel[0].surel := 0;
            sid[0].channel[1].freq := 0;
            sid[0].channel[1].pulse := 0;
            sid[0].channel[1].ctrl := 0;
            sid[0].channel[1].atdcy := 0;
            sid[0].channel[1].surel := 0;
            sid[0].channel[2].freq := 0;
            sid[0].channel[2].pulse := 0;
            sid[0].channel[2].ctrl := 0;
            sid[0].channel[2].atdcy := 0;
            sid[0].channel[2].surel := 0;
            sid[0].cutoff := 0;
            sid[0].reson := 0;
            sid[0].sigvol := 0;
            sid[0].random := 0;
            sid[0].env3 := 0;
        end;
        $01: begin
            sid[1].channel[0].freq := 0;
            sid[1].channel[0].pulse := 0;
            sid[1].channel[0].ctrl := 0;
            sid[1].channel[0].atdcy := 0;
            sid[1].channel[0].surel := 0;
            sid[1].channel[1].freq := 0;
            sid[1].channel[1].pulse := 0;
            sid[1].channel[1].ctrl := 0;
            sid[1].channel[1].atdcy := 0;
            sid[1].channel[1].surel := 0;
            sid[1].channel[2].freq := 0;
            sid[1].channel[2].pulse := 0;
            sid[1].channel[2].ctrl := 0;
            sid[1].channel[2].atdcy := 0;
            sid[1].channel[2].surel := 0;
            sid[1].cutoff := 0;
            sid[1].reson := 0;
            sid[1].sigvol := 0;
            sid[1].random := 0;
            sid[1].env3 := 0;
        end;
    end;
end;


procedure ResetChannel(idx, chan: byte);
var sid: ^TSID absolute $D400;
begin
    IOPAGE_CTRL := iopPage0;

    case idx of
        $00: begin
            case chan of
                $00: begin
                    sid[0].channel[0].freq := 0;
                    sid[0].channel[0].pulse := 0;
                    sid[0].channel[0].ctrl := 0;
                    sid[0].channel[0].atdcy := 0;
                    sid[0].channel[0].surel := 0;
                end;
                $01: begin
                    sid[0].channel[1].freq := 0;
                    sid[0].channel[1].pulse := 0;
                    sid[0].channel[1].ctrl := 0;
                    sid[0].channel[1].atdcy := 0;
                    sid[0].channel[1].surel := 0;
                end;
                $01: begin
                    sid[0].channel[2].freq := 0;
                    sid[0].channel[2].pulse := 0;
                    sid[0].channel[2].ctrl := 0;
                    sid[0].channel[2].atdcy := 0;
                    sid[0].channel[2].surel := 0;
                end;
            end;
        end;
        $01: begin
            case chan of
                $00: begin
                    sid[1].channel[0].freq := 0;
                    sid[1].channel[0].pulse := 0;
                    sid[1].channel[0].ctrl := 0;
                    sid[1].channel[0].atdcy := 0;
                    sid[1].channel[0].surel := 0;
                end;
                $01: begin
                    sid[1].channel[1].freq := 0;
                    sid[1].channel[1].pulse := 0;
                    sid[1].channel[1].ctrl := 0;
                    sid[1].channel[1].atdcy := 0;
                    sid[1].channel[1].surel := 0;
                end;
                $01: begin
                    sid[1].channel[2].freq := 0;
                    sid[1].channel[2].pulse := 0;
                    sid[1].channel[2].ctrl := 0;
                    sid[1].channel[2].atdcy := 0;
                    sid[1].channel[2].surel := 0;
                end;
            end;
        end;
    end;
end;

end.
