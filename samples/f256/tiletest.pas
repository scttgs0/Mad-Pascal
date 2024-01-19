
program tiletest;

uses tile, f256;

var
    tileset00: array[0..8191] of byte = ({$BIN2CSV tile.bin});
    tilemap00: array[0..4299] of byte = ({$BIN2CSV map.bin});

begin
    // InitGraph(ord(masterctrll(mcGraphicsOn+mcTileMapOn)),ord(masterctrlh.mcVideoMode240));
    IOPAGE_CTRL := iopPage0;

    MASTER_CTRL_L := ord(masterctrll(mcGraphicsOn+mcTileMapOn));
    MASTER_CTRL_H := ord(masterctrlh.mcVideoMode240);

    tile.SetInit(0,ord(tilesetctrl.tsVertical),@tileset00);
    tile.MapInit(0,ord(tilemapctrl(tcEnable+tcSmallTiles)),50,43,@tilemap00);
end.
