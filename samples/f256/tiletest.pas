
program tiletest;

uses tile, f256;

var
    x, y, d: smallint;

    palette: array of byte = [$00,$00,$00,$00,$20,$74,26,$00,$6f,$71,$73,$00,$78,$2d,$20,$00,$20,$74,$75,$00,$75,20,$46,$00];
    tilemap00: array of byte = [{$BIN2CSV map.bin}];
    tileset00: array of byte = [{$BIN2CSV tile.bin}];


begin
    IOPAGE_CTRL := iopPage1;

    for x := 0 to 23 do
        Poke($D000+x, palette[x]);

    // InitGraph(ord(masterctrll(mcGraphicsOn+mcTileMapOn)),ord(masterctrlh.mcVideoMode240));
    IOPAGE_CTRL := iopPage0;

    MASTER_CTRL_L := ord(masterctrll(mcGraphicsOn+mcTileMapOn));
    MASTER_CTRL_H := ord(masterctrlh.mcVideoMode240);

    tile.SetInit(0,ord(tilesetctrl.tsVertical),@tileset00);
    tile.MapInit(0,ord(tilemapctrl(tcEnable+tcSmallTiles)),50,43,@tilemap00);

    for x := 0 to 9*16 do begin
        tile.Scroll(0,x,0);

        for y := 0 to 150 do begin  // delay
            d := y * 3;
            if d mod 5 = 0 then
                d := d + 1;
        end;
    end;

    for y := 0 to 13*16 do begin
        tile.Scroll(0,9*16,y);

        for x := 0 to 150 do begin  // delay
            d := x * 3;
            if d mod 5 = 0 then
                d := d + 1;
        end;
    end;

    for x := 0 to 9*16 do begin
        tile.Scroll(0,9*16-x,13*16);

        for y := 0 to 150 do begin  // delay
            d := y * 3;
            if d mod 5 = 0 then
                d := d + 1;
        end;
    end;

    for y := 0 to 13*16 do begin
        tile.Scroll(0,0,13*16-y);

        for x := 0 to 150 do begin  // delay
            d := x * 3;
            if d mod 5 = 0 then
                d := d + 1;
        end;
    end;
end.
