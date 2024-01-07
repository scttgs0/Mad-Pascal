program helloworldtest;
uses
	crt, f256lib, kernel;

var
	quit: boolean;
	c: char;

procedure Show_Joysticks;
begin
	TextColors(WHITE,BLACK);
	PrintAt('Joystick 0: ',0,0);
	PrintHexByte(KEvent[kernel_event_event_t_joystick_joy0]);
	PrintAt('Joystick 1: ',0,2);
	PrintHexByte(KEvent[kernel_event_event_t_joystick_joy1]);
end;

// failed attempt
procedure PrintCommandLine;
var i: byte;
begin
	CursorAt(0,7);
	TextColor(WHITE);
	write(hexstr(word(kernel_args_ext),4),'   ',kernel_args_extlen);
	CursorAt(0,8);
	for i:=1 to kernel_args_extlen do
	begin
		PrintCh(chr(peek(word(kernel_args_ext)+i-1)));
	end;
end;

procedure Show_Font_Set;
var x,y: byte;
begin
	TextColors(YELLOW,BLACK);
	for y:=0 to 15 do
	begin
		GotoXY(1,15+y);	// top left is 1,1
//		CursorAt(0,14+y);	// top left is 0,0
		for x:=0 to 15 do
			PrintCh(char(x+y*16));
	end;
end;

begin
	Kernel.Init;
	F256Lib.Init;
	TextMode(CO40);
	randomize;
	TextColor(LIGHT_RED);	// set foreground text color only
	TextBackground(BLACK);	// set background text color only
	ClrScr;
	GotoXY(3,1);	// top left is 1,1
	write('   columns:',system.ScreenWidth,' / rows:',system.screenheight);
	PrintAt('press a key',0,2);
	write(GetKeyW);
	TextColors(LIGHT_BLUE,BLUE);
	CursorAt(4,3);	// top left is 0,0
	write('Hello World!');
	Print('Goodbye');
//	PrintAt('Hello World!',4,3);

	write(ord(true));
	write(ord(false));
	TextColors(LIGHT_GREEN,PURPLE);
	PrintAt('Light Green on Purple',5,4);
	write('abc');
	write(WhereX,' ',WhereY);
	Show_Font_Set;

//	kernel_args_events:=word(@event[0]);
	quit:=false;
	cursoron;
	repeat
		Spinner;
		c:=GetKey;
		if (c<>#0) then
		begin
			if (c=' ') then quit:=true
			else
			if (ord(c)>=33) and (ord(c)<=127) then
			begin
				CursorAt(2,1);
				TextColor(WHITE);
				PrintHexByte(ord(c));
				PrintCh(c);
			end;
		end;

//		Kernel.Yield;
//		if Kernel.NextEvent then
//		Kernel.NextEvent;
//		begin
//			CursorAt(0,12);
//			PrintHexByte(KEvent[0]);
//			PrintHexByte(KEvent[1]);
//			PrintHexByte(KEvent[2]);
//			PrintHexByte(KEvent[3]);
//			PrintHexByte(KEvent[4]);
//			PrintHexByte(KEvent[5]);
//			PrintHexByte(KEvent[6]);
//			PrintHexByte(KEvent[7]);
//			case event[kernel_event_event_t_type] of
//				kernel_event_key_PRESSED:
//					if (chr(KEvent[kernel_event_event_t_key_ascii])=#13) then quit:=true;
//				kernel_event_key_RELEASED: ;
//				kernel_event_JOYSTICK: Show_Joysticks;
//				kernel_event_mouse_DELTA: ;
//				kernel_event_mouse_CLICKS: ;
//			end;
//		end;
//		CursorAt(0,10);
//		write(random(32767));
//		clreol;
	until quit;
	TextMode(CO80);
	cursoroff;
end.
