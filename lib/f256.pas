
// SPDX-FileName: f256.pas
// SPDX-FileCopyrightText: Copyright 2023 Scott Giese
// SPDX-License-Identifier: MIT

unit f256;

interface

const
    mmuPage0            = $00;
    mmuPage1            = $01;
    mmuPage2            = $02;
    mmuPage3            = $03;
    mmuEditPage0        = $00;
    mmuEditPage1        = $10;
    mmuEditPage2        = $20;
    mmuEditPage3        = $30;
    mmuEditMode         = $80;

    iopPage0            = $00           // system
    iopPage1            = $01           // charset, gfx LUT
    iopPage2            = $02           // text map
    iopPage3            = $03           // text color map
    iopDisable          = $04

var

//  Foenix F256 Registers

    MMU_CTRL:               byte absolute $0000;
    IOPAGE_CTRL:            byte absolute $0001;

    MMU_Block0:             byte absolute $0008;
    MMU_Block1:             byte absolute $0009;
    MMU_Block2:             byte absolute $000A;
    MMU_Block3:             byte absolute $000B;
    MMU_Block4:             byte absolute $000C;
    MMU_Block5:             byte absolute $000D;
    MMU_Block6:             byte absolute $000E;
    MMU_Block7:             byte absolute $000F;

//-----------------------------------------------
//  IO Bank 01

    FONT_MEMORY_BANK0:      byte absolute $C000;
    FONT_MEMORY_BANK1:      byte absolute $C800;

    GRPH_LUT0_PTR:          byte absolute $D000;
    GRPH_LUT1_PTR:          byte absolute $D400;
    GRPH_LUT2_PTR:          byte absolute $D800;
    GRPH_LUT3_PTR:          byte absolute $DC00;


//-----------------------------------------------
//  IO Bank 02

    CS_TEXT_MEM_PTR:        byte absolute $C000;


//-----------------------------------------------
//  IO Bank 03

    CS_COLOR_MEM_PTR:       byte absolute $C000;


//-----------------------------------------------
//  IO Bank 00

    MASTER_CTRL_L:          byte absolute $D000;
    MASTER_CTRL_H:          byte absolute $D001;

    LAYER_ORDER_CTRL_0:     byte absolute $D002;
    LAYER_ORDER_CTRL_1:     byte absolute $D003;

    BORDER_CTRL:            byte absolute $D004;
    BORDER_COLOR_B:         byte absolute $D005;
    BORDER_COLOR_G:         byte absolute $D006;
    BORDER_COLOR_R:         byte absolute $D007;
    BORDER_SIZE_X:          byte absolute $D008;
    BORDER_SIZE_Y:          byte absolute $D009;

    BACKGROUND_COLOR_B:     byte absolute $D00D;
    BACKGROUND_COLOR_G:     byte absolute $D00E;
    BACKGROUND_COLOR_R:     byte absolute $D00F;

    CURSOR_CTRL:            byte absolute $D010;
    CURSOR_CHAR_CODE:       byte absolute $D012;
    CURSOR_X:               word absolute $D014;
    CURSOR_Y:               word absolute $D016;

    LINE_IRQ_CTRL:          byte absolute $D018;
    LINE_IRQ_VALUE:         byte absolute $D019;

    RASTER_X:               word absolute $D018;
    RASTER_Y:               word absolute $D01A;

    BITMAP0_CTRL:           byte absolute $D100;
    BITMAP0_ADDR:           word absolute $D101;
    BITMAP1_CTRL:           byte absolute $D108;
    BITMAP1_ADDR:           word absolute $D109;
    BITMAP2_CTRL:           byte absolute $D110;
    BITMAP2_ADDR:           word absolute $D111;

    TILE0_CTRL:             byte absolute $D200;
    TILE0_ADDR:             word absolute $D201;
    TILE0_SIZE_X:           word absolute $D204;
    TILE0_SIZE_Y:           word absolute $D206;
    TILE0_SCROLL_X:         word absolute $D208;
    TILE0_SCROLL_Y:         word absolute $D20A;

    TILE1_CTRL:             byte absolute $D20C;
    TILE1_ADDR:             word absolute $D20D;
    TILE1_SIZE_X:           word absolute $D210;
    TILE1_SIZE_Y:           word absolute $D212;
    TILE1_SCROLL_X:         word absolute $D214;
    TILE1_SCROLL_Y:         word absolute $D216;

    TILE2_CTRL:             byte absolute $D218;
    TILE2_ADDR:             word absolute $D219;
    TILE2_SIZE_X:           word absolute $D21C;
    TILE2_SIZE_Y:           word absolute $D21E;
    TILE2_SCROLL_X:         word absolute $D220;
    TILE2_SCROLL_Y:         word absolute $D222;

    TILESET0_ADDR:          word absolute $D280;
    TILESET0_ADDR_CFG:      byte absolute $D283;
    TILESET1_ADDR:          word absolute $D284;
    TILESET1_ADDR_CFG:      byte absolute $D287;
    TILESET2_ADDR:          word absolute $D288;
    TILESET2_ADDR_CFG:      byte absolute $D28B;
    TILESET3_ADDR:          word absolute $D28C;
    TILESET3_ADDR_CFG:      byte absolute $D28F;
    TILESET4_ADDR:          word absolute $D290;
    TILESET4_ADDR_CFG:      byte absolute $D293;
    TILESET5_ADDR:          word absolute $D294;
    TILESET5_ADDR_CFG:      byte absolute $D297;
    TILESET6_ADDR:          word absolute $D298;
    TILESET6_ADDR_CFG:      byte absolute $D29B;
    TILESET7_ADDR:          word absolute $D29C;
    TILESET7_ADDR_CFG:      byte absolute $D29F;

    XY_BASE_ADDR:           word absolute $D301;
    XY_POS_X:               word absolute $D304;
    XY_POS_Y:               word absolute $D306;
    XY_OFFSET:              word absolute $D308;
    XY_BANK:                byte absolute $D30A;
    XY_ADDR:                word absolute $D30B;

implementation

end.
