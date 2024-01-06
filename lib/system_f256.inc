
procedure Pause; assembler; overload;
(*
@description:
Delay program execution (1/50 second).
*)
asm
{
};
end;


procedure Pause(n: word); assembler; overload;
(*
@description:
Delay program execution (N * 1/50 second).

@param: N - number of '1/50 second'
*)
asm
{
};
end;

procedure Randomize; assembler;
(*
@description:
Initialize random number generator
*)
asm
    opt c+

    lda #@rngctrl(rcEnable)
    sta RNG_CTRL

    lda RNG_DAT
    sta RndSeed
    stz RndSeed+1

    opt c-
end;


function Random: Real; overload;
(*
@description:
Generate random number

@returns: Real (Q24.8)
*)
begin
    asm
        opt c+

        lda RNG_DAT
        eor RNG_DAT+1
        eor RNG_DAT
        adc RNG_DAT+1
        sta Result

        stz Result+1
        stz Result+2
        stz Result+3

        opt c-
    end;

    Result:= 1 - Result;
end;


function RandomF: Float;
(*
@description:
Generate random number

@returns: Float (Single)
*)
begin
    asm
        opt c+

        lda RNG_DAT
        eor RNG_DAT+1
        eor RNG_DAT
        sta Result+1

        adc RNG_DAT+1
        and #$7f
        sta Result+2

        stz Result
        lda #$3f
        sta Result+3

        opt c-
    end;

    Result:= 1 - Result;
end;


function RandomF16: Float16;
(*
@description:
Generate random number

@returns: Float (Single)
*)
var a: word;
begin
    asm
        lda RNG_DAT
        eor RNG_DAT+1
        eor RNG_DAT
        sta a

        adc RNG_DAT+1
        and #$7f
        sta a+1
    end;

    Result:= a * (1/32767);
end;


function Random(range: byte): byte; assembler; overload;
(*
@description:
Generate random number

@param: range (0..range-1)

@returns: byte
*)
asm
    opt c+

    lda range
    bne _retry

    ldy RNG_DAT
    bra _done

_retry:
    ldy RNG_DAT
    cpy range
    bcs _retry

_done:
    sty Result

    opt c-
end;


function Random(range: smallint): smallint; overload;
(*
@description:
Generate random number

@param: range (0..range-1), (-range..0)

@returns: smallint
*)
begin
    if range = 0 then
    begin
        Result := 0;
    end
    else
    begin
        RndSeed := $4595 * RndSeed;
        Result := RndSeed mod range;
        asm
            lda range+1
            bpl _plus

            lda Result+1
            bmi _ok
            bpl _sign

        _plus:
            lda Result+1
            bpl _ok

        _sign:
            lda #0
            sub Result
            sta Result

            lda #0
            sbc Result+1
            sta Result+1
        _ok:
        end;
    end;
end;


function ParamCount: byte; assembler;
(*
@description:
Return number of command-line parameters passed to the program.

@returns: byte
*)
asm

end;


function ParamStr(i: byte): TString; assembler;
(*
@description:
Return value of a command-line argument.

@param: i - of a command-line argument

@returns: string[32]
*)
asm

end;
