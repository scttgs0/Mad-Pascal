
program tiletest;

uses tile, f256;

var
    x, y, d: smallint;
    tileset00: array[0..8191] of byte = ({$BIN2CSV tile.bin});
    tilemap00: array[0..4299] of byte = ({$BIN2CSV map.bin});

begin
    // InitGraph(ord(masterctrll(mcGraphicsOn+mcTileMapOn)),ord(masterctrlh.mcVideoMode240));
    IOPAGE_CTRL := iopPage0;

    MASTER_CTRL_L := ord(masterctrll(mcGraphicsOn+mcTileMapOn));
    MASTER_CTRL_H := ord(masterctrlh.mcVideoMode240);

    tile.SetInit(0,ord(tilesetctrl.tsVertical),@tileset00);
    tile.MapInit(0,ord(tilemapctrl(tcEnable+tcSmallTiles)),50,43,@tilemap00);

    for x := 0 to 9*16 do begin
        tile.Scroll(0,x,0);

        for y := 0 to 200 do begin  // delay
            d := y * 3;
            if d mod 5 = 0 then
                d := d + 1;
        end;
    end;

    for y := 0 to 13*16 do begin
        tile.Scroll(0,9*16,y);

        for x := 0 to 200 do begin  // delay
            d := x * 3;
            if d mod 5 = 0 then
                d := d + 1;
        end;
    end;

    for x := 0 to 9*16 do begin
        tile.Scroll(0,9*16-x,13*16);

        for y := 0 to 200 do begin  // delay
            d := y * 3;
            if d mod 5 = 0 then
                d := d + 1;
        end;
    end;

    for y := 0 to 13*16 do begin
        tile.Scroll(0,0,13*16-y);

        for x := 0 to 200 do begin  // delay
            d := x * 3;
            if d mod 5 = 0 then
                d := d + 1;
        end;
    end;
end.
