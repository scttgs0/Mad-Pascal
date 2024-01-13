
Unit F256Lib;
interface
{$include 'f256.pas'}

const
	// commodore 64 colors
	BLACK=0;
	WHITE=1;
	RED=2;
	CYAN=3;
	PURPLE=4;
	GREEN=5;
	BLUE=6;
	YELLOW=7;
	ORANGE=8;
	BROWN=9;
	LIGHT_RED=10;
	DARK_GREY=11;
	GREY=12;
	LIGHT_GREEN=13;
	LIGHT_BLUE=14;
	LIGHT_GREY=15;

var
	CommandLine: string='';

// debug spinner in top left corner @C000
procedure Spinner; assembler;

// initializes all f256lib variables, call first
procedure Init;

// print a character code to the screen
procedure PrintCh(a: char); assembler; inline;

// move cursor to screen column and row - topleft is 0x0, gotoxy topleft is 1,1
procedure CursorAt(col, row: byte); assembler;

// print a string to the screen
procedure Print(s: string);// assembler;

// print a string to the screen starting at column and row
procedure PrintAt(s: string; col, row:byte);

// set only foreground color of text to be printed
//procedure TextColor(fgcolor: byte); overload; assembler; inline;

// set both foreground and background color of text to be printed
procedure TextColors(fgcolor, bgcolor: byte); assembler; inline;

// clears the screen with blank spaces
procedure ClrScreen; overload;

// clears the screen with a character code
procedure ClrScreen(b: char); overload;

// prints the hexadecimal value of a byte value on the screen
procedure PrintHexByte(b: byte);

// prints the hexadecimal value of a word value on the screen
procedure PrintHexWord(w: word);

// prints the hexadecimal value of a long 24bit value on the screen
procedure PrintHexLong(dw: word);

// get a key from the keyboard, does not wait for input
function GetKey: char;

// waits for a key from the keyboard
function GetKeyW: char;

implementation
uses
	kernel_f256;

const
	HexChars: array [0..15] of char=('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F');

(* same as crt.TextColor

procedure TextColor(fgcolor: byte); overload; assembler; inline;
asm
;	lda fgcolor ; last byte parameter is loaded in .A
	asl
	asl
	asl
	asl
	sta CursorColor
end;
*)

procedure TextColors(fgcolor,bgcolor: byte); assembler; inline;
asm
	lda fgcolor
	asl
	asl
	asl
	asl
	ora bgcolor
	sta CursorColor
end;

procedure PrintCh(a: char); assembler; inline;
asm
	jsr @putchar
end;

procedure CursorAt(col, row: byte); assembler;
asm
    opt c+

	lda row
	sta MULU_A
	stz MULU_A+1

	lda system.ScreenWidth
	sta MULU_B
	stz MULU_B+1

	clc
	lda MULU_RESULT
	adc col
	sta scrnCursor
	lda MULU_RESULT+1		// TODO:
	adc #>CS_TEXT_MEM_PTR
	sta scrnCursor+1

    opt c-
end;

procedure Print(s: string);// assembler;
var b: byte;
begin
	for b:=1 to length(s) do
	  PrintCh(s[b]);
end;

procedure PrintAt(s: string; col, row:byte);
begin
	CursorAt(col,row);
	Print(s);
end;


procedure ClrScreen; overload;
begin
	IOPAGE_CTRL:=iopPage2;
	fillchar(CS_TEXT_MEM_PTR,ScreenWidth*ScreenHeight,32);
	IOPAGE_CTRL:=iopPage0;
end;


procedure ClrScreen(b: char); overload;
begin
	IOPAGE_CTRL:=iopPage2;
	fillchar(CS_TEXT_MEM_PTR,ScreenWidth*ScreenHeight,byte(b));
	IOPAGE_CTRL:=iopPage0;
end;


procedure PrintHexByte(b: byte);
begin
	PrintCh(HexChars[(b shr 4) and 15]);
	PrintCh(HexChars[b and 15]);
end;


procedure PrintHexWord(w: word);
begin
	PrintCh(HexChars[(w shr 12) and 15]);
	PrintCh(HexChars[(w shr 8) and 15]);
	PrintCh(HexChars[(w shr 4) and 15]);
	PrintCh(HexChars[w and 15]);
end;


procedure PrintHexLong(dw: word);
begin
	PrintCh(HexChars[(dw shr 20) and 15]);
	PrintCh(HexChars[(dw shr 16) and 15]);
	PrintCh(HexChars[(dw shr 12) and 15]);
	PrintCh(HexChars[(dw shr 8) and 15]);
	PrintCh(HexChars[(dw shr 4) and 15]);
	PrintCh(HexChars[dw and 15]);
end;


function GetKey: char;
var ev: kernel_event_type;
var	w: word;
	c: char;
begin
	GetKey:=#0;
	if (kernel_args_events_pending and $80=$80) then
	begin
//		w:=kernel_args_events;
//		kernel_args_events:=word(@ev[0]);
		if Kernel.NextEvent then
		begin
			if (Kernel.KEvent[kernel_event_event_t_type]=kernel_event_key_PRESSED) then
			begin
				GetKey:=char(KEvent[kernel_event_event_t_key_ascii]);
			end;
		end;
//		kernel_args_events:=w;
	end;
end;


function GetKeyW: char;
var c: char;
begin
	repeat
//		Kernel.Yield;
		c:=GetKey;
	until (c<>#0);
	GetKeyW:=c;
end;


(*

*** not working

procedure SaveCommandLine;
var args_buf: word;
	args_buflen: byte;
var b: byte;
	s: string[1]=#0;
	ss: string;
begin
	asm
		mwa kernel_args_ext args_buf
		mva	kernel_args_extlen args_buflen
	end;

	CommandLine:='';
	b:=0;
	while (b<args_buflen) do
	begin
		s[1]:=chr(peek(args_buf+b));
		CommandLine := CommandLine + s;
		inc(b);
	end;
	ss:=hexstr(args_buf,4);
	CommandLine:=CommandLine+ss;
end;
*)


procedure Init;
begin
	// save the executing command line
// not working	SaveCommandLine;

	asm
	// use main i/o page 0
		lda #iopPage0
		sta IOPAGE_CTRL

	// set cursor screen pointer to top left corner
		mwa #CS_TEXT_MEM_PTR scrnCursor

		lda #0
		sta CursorColumn
		sta CursorRow

	// set f256lib cursor color to
		lda #WHITE<<4
		sta CursorColor

	// enable hardware random number generator
		lda #1
		sta RNG_CTRL
	end;
end;


procedure Spinner; assembler;
asm
	lda IOPAGE_CTRL
	pha

	lda #iopPage2
	sta IOPAGE_CTRL

	inc CS_TEXT_MEM_PTR
	inc IOPAGE_CTRL
	inc CS_COLOR_MEM_PTR

	pla
	sta IOPAGE_CTRL
end;

end.
