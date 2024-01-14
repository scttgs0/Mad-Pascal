
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

    iopPage0            = $00;          // system
    iopPage1            = $01;          // charset, gfx LUT
    iopPage2            = $02;          // text map
    iopPage3            = $03;          // text color map
    iopDisable          = $04;

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

    GRPH_LUT0_PTR:          array [0..1023] of byte absolute $D000;
    GRPH_LUT1_PTR:          array [0..1023] of byte absolute $D400;
    GRPH_LUT2_PTR:          array [0..1023] of byte absolute $D800;
    GRPH_LUT3_PTR:          array [0..1023] of byte absolute $DC00;


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
    BITMAP0_ADDR:           array [0..2] of byte absolute $D101;
    BITMAP1_CTRL:           byte absolute $D108;
    BITMAP1_ADDR:           array [0..2] of byte absolute $D109;
    BITMAP2_CTRL:           byte absolute $D110;
    BITMAP2_ADDR:           array [0..2] of byte absolute $D111;

    TILE0_CTRL:             byte absolute $D200;
    TILE0_ADDR:             array [0..2] of byte absolute $D201;
    TILE0_SIZE_X:           word absolute $D204;
    TILE0_SIZE_Y:           word absolute $D206;
    TILE0_SCROLL_X:         word absolute $D208;
    TILE0_SCROLL_Y:         word absolute $D20A;

    TILE1_CTRL:             byte absolute $D20C;
    TILE1_ADDR:             array [0..2] of byte absolute $D20D;
    TILE1_SIZE_X:           word absolute $D210;
    TILE1_SIZE_Y:           word absolute $D212;
    TILE1_SCROLL_X:         word absolute $D214;
    TILE1_SCROLL_Y:         word absolute $D216;

    TILE2_CTRL:             byte absolute $D218;
    TILE2_ADDR:             array [0..2] of byte absolute $D219;
    TILE2_SIZE_X:           word absolute $D21C;
    TILE2_SIZE_Y:           word absolute $D21E;
    TILE2_SCROLL_X:         word absolute $D220;
    TILE2_SCROLL_Y:         word absolute $D222;

    TILESET0_ADDR:          array [0..2] of byte absolute $D280;
    TILESET0_ADDR_CFG:      byte absolute $D283;
    TILESET1_ADDR:          array [0..2] of byte absolute $D284;
    TILESET1_ADDR_CFG:      byte absolute $D287;
    TILESET2_ADDR:          array [0..2] of byte absolute $D288;
    TILESET2_ADDR_CFG:      byte absolute $D28B;
    TILESET3_ADDR:          array [0..2] of byte absolute $D28C;
    TILESET3_ADDR_CFG:      byte absolute $D28F;
    TILESET4_ADDR:          array [0..2] of byte absolute $D290;
    TILESET4_ADDR_CFG:      byte absolute $D293;
    TILESET5_ADDR:          array [0..2] of byte absolute $D294;
    TILESET5_ADDR_CFG:      byte absolute $D297;
    TILESET6_ADDR:          array [0..2] of byte absolute $D298;
    TILESET6_ADDR_CFG:      byte absolute $D29B;
    TILESET7_ADDR:          array [0..2] of byte absolute $D29C;
    TILESET7_ADDR_CFG:      byte absolute $D29F;

    XY_BASE_ADDR:           array [0..2] of byte absolute $D301;
    XY_POS_X:               word absolute $D304;
    XY_POS_Y:               word absolute $D306;
    XY_OFFSET:              word absolute $D308;
    XY_BANK:                byte absolute $D30A;
    XY_ADDR:                array [0..2] of byte absolute $D30B;

    SID1_BASE:              byte absolute $D400;
    SID1_FREQ1:             word absolute $D400;
    SID1_PULSE1:            word absolute $D402;
    SID1_CTRL1:             byte absolute $D404;
    SID1_ATDCY1:            byte absolute $D405;
    SID1_SUREL1:            byte absolute $D406;

    SID1_FREQ2:             word absolute $D407;
    SID1_PULSE2:            word absolute $D409;
    SID1_CTRL2:             byte absolute $D40B;
    SID1_ATDCY2:            byte absolute $D40C;
    SID1_SUREL2:            byte absolute $D40D;

    SID1_FREQ3:             word absolute $D40E;
    SID1_PULSE3:            word absolute $D410;
    SID1_CTRL3:             byte absolute $D412;
    SID1_ATDCY3:            byte absolute $D413;
    SID1_SUREL3:            byte absolute $D414;

    SID1_CUTOFF:            word absolute $D415;
    SID1_RESON:             byte absolute $D417;
    SID1_SIGVOL:            byte absolute $D418;
    SID1_RANDOM:            byte absolute $D41B;
    SID1_ENV3:              byte absolute $D41C;

    SID2_BASE:              byte absolute $D500;
    SID2_FREQ1:             word absolute $D500;
    SID2_PULSE1:            word absolute $D502;
    SID2_CTRL1:             byte absolute $D504;
    SID2_ATDCY1:            byte absolute $D505;
    SID2_SUREL1:            byte absolute $D506;

    SID2_FREQ2:             word absolute $D507;
    SID2_PULSE2:            word absolute $D509;
    SID2_CTRL2:             byte absolute $D50B;
    SID2_ATDCY2:            byte absolute $D50C;
    SID2_SUREL2:            byte absolute $D50D;

    SID2_FREQ3:             word absolute $D50E;
    SID2_PULSE3:            word absolute $D510;
    SID2_CTRL3:             byte absolute $D512;
    SID2_ATDCY3:            byte absolute $D513;
    SID2_SUREL3:            byte absolute $D514;

    SID2_CUTOFF:            word absolute $D515;
    SID2_RESON:             byte absolute $D517;
    SID2_SIGVOL:            byte absolute $D518;
    SID2_RANDOM:            byte absolute $D51B;
    SID2_ENV3:              byte absolute $D51C;

    PSG1_BASE:              byte absolute $D600;
    PSG2_BASE:              byte absolute $D610;
    PSG_DUAL_BASE:          byte absolute $D608;

    UART_DATA:              byte absolute $D630;
    UART_IER:               byte absolute $D631;
    UART_ISR:               byte absolute $D632;
    UART_FCR:               byte absolute $D632;
    UART_LCR:               byte absolute $D633;
    UART_MCR:               byte absolute $D634;
    UART_LSR:               byte absolute $D635;
    UART_MSR:               byte absolute $D636;
    UART_SPR:               byte absolute $D637;

    UART_DLL:               byte absolute $D630;
    UART_DLH:               byte absolute $D631;
    UART_PSD:               byte absolute $D632;

    PS2_CTRL:               byte absolute $D640;
    PS2_OUT:                byte absolute $D641;
    PS2_KEYBD_IN:           byte absolute $D642;
    PS2_MOUSE_IN:           byte absolute $D643;
    PS2_STATUS:             byte absolute $D644;

    TIMER0_CTRL:            byte absolute $D650;
    TIMER0_STATUS:          byte absolute $D650;
    TIMER0_VALUE:           array [0..2] of byte absolute $D651;
    TIMER0_CMP_CTRL:        byte absolute $D654;
    TIMER0_CMP:             array [0..2] of byte absolute $D655;

    TIMER1_CTRL:            byte absolute $D658;
    TIMER1_STATUS:          byte absolute $D658;
    TIMER1_VALUE:           array [0..2] of byte absolute $D659;
    TIMER1_CMP_CTRL:        byte absolute $D65C;
    TIMER1_CMP:             array [0..2] of byte absolute $D65D;

    INT_PENDING_REG0:       byte absolute $D660;
    INT_PENDING_REG1:       byte absolute $D661;
    INT_PENDING_REG2:       byte absolute $D662;

    INT_POL_REG0:           byte absolute $D664;
    INT_POL_REG1:           byte absolute $D665;
    INT_POL_REG2:           byte absolute $D666;

    INT_EDGE_REG0:          byte absolute $D668;
    INT_EDGE_REG1:          byte absolute $D669;
    INT_EDGE_REG2:          byte absolute $D66A;

    INT_MASK_REG0:          byte absolute $D66C;
    INT_MASK_REG1:          byte absolute $D66D;
    INT_MASK_REG2:          byte absolute $D66E;

    DIP_SWITCH:             byte absolute $D670;

    IEC_PORT_IN:            byte absolute $D680;
    IEC_PORT_OUT:           byte absolute $D681;

    RTC_SEC:                byte absolute $D690;
    RTC_SEC_ALARM:          byte absolute $D691;
    RTC_MIN:                byte absolute $D692;
    RTC_MIN_ALARM:          byte absolute $D693;
    RTC_HRS:                byte absolute $D694;
    RTC_HRS_ALARM:          byte absolute $D695;
    RTC_DAY:                byte absolute $D696;
    RTC_DAY_ALARM:          byte absolute $D697;
    RTC_DOW:                byte absolute $D698;
    RTC_MON:                byte absolute $D699;
    RTC_YEAR:               byte absolute $D69A;
    RTC_RATE:               byte absolute $D69B;
    RTC_EN:                 byte absolute $D69C;
    RTC_FLAG:               byte absolute $D69D;
    RTC_CTRL:               byte absolute $D69E;
    RTC_CENT:               byte absolute $D69F;

    RNG_DAT:                word absolute $D6A4;
    RNG_SEED:               word absolute $D6A4;
    RNG_CTRL:               byte absolute $D6A6;

    MACHINE_ID:             byte absolute $D6A7;

    LED_POWER_B:            byte absolute $D6A7;
    LED_POWER_G:            byte absolute $D6A8;
    LED_POWER_R:            byte absolute $D6A9;

    LED_MEDIA_B:            byte absolute $D6AA;
    LED_MEDIA_G:            byte absolute $D6AB;
    LED_MEDIA_R:            byte absolute $D6AC;

    LED_SHIFTLOCK_B:        byte absolute $D6AD;
    LED_SHIFTLOCK_G:        byte absolute $D6AE;
    LED_SHIFTLOCK_R:        byte absolute $D6AF;

    MOUSE_CTRL:             byte absolute $D6E0;
    MOUSE_X:                word absolute $D6E2;
    MOUSE_Y:                word absolute $D6E4;
    MOUSE_PACKET:           array [0..2] of byte absolute $D6E6;

    C256F_MODEL_MAJOR:      byte absolute $D70B;
    C256F_MODEL_MINOR:      byte absolute $D70C;

    FG_CHAR_LUT_PTR:        byte absolute $D800;
    BG_CHAR_LUT_PTR:        byte absolute $D840;

    SPRITE_BASE:            byte absolute $D900;

    VIA1_IO_PORTB:          byte absolute $DB00;
    VIA1_IO_PORTA:          byte absolute $DB01;
    VIA1_DD_PORTB:          byte absolute $DB02;
    VIA1_DD_PORTA:          byte absolute $DB03;
    VIA1_COUNT_TIMER1:      word absolute $DB04;
    VIA1_LATCH_TIMER1:      word absolute $DB06;
    VIA1_COUNT_TIMER2:      word absolute $DB08;
    VIA1_SDR:               byte absolute $DB0A;
    VIA1_ACR:               byte absolute $DB0B;
    VIA1_PCR:               byte absolute $DB0C;
    VIA1_IFR:               byte absolute $DB0D;
    VIA1_IER:               byte absolute $DB0E;
    VIA1_IO2_PORTA:         byte absolute $DB0F;

    VIA0_IO_PORTB:          byte absolute $DC00;
    VIA0_IO_PORTA:          byte absolute $DC01;
    VIA0_DD_PORTB:          byte absolute $DC02;
    VIA0_DD_PORTA:          byte absolute $DC03;
    VIA0_COUNT_TIMER1:      word absolute $DC04;
    VIA0_LATCH_TIMER1:      word absolute $DC06;
    VIA0_COUNT_TIMER2:      word absolute $DC08;
    VIA0_SDR:               byte absolute $DC0A;
    VIA0_ACR:               byte absolute $DC0B;
    VIA0_PCR:               byte absolute $DC0C;
    VIA0_IFR:               byte absolute $DC0D;
    VIA0_IER:               byte absolute $DC0E;
    VIA0_IO2_PORTA:         byte absolute $DC0F;

    JOYSTICK0:              byte absolute $DC00;
    JOYSTICK1:              byte absolute $DC01;

    SDC_CTRL:               byte absolute $DD00;
    SDC_DATA:               byte absolute $DD01;

    MULU_A:                 word absolute $DE00;
    MULU_B:                 word absolute $DE02;
    MULU_RESULT:            array [0..3] of byte absolute $DE10;

    DIVU_DENOM:             word absolute $DE04;
    DIVU_NUMR:              word absolute $DE06;
    DIVU_RESULT:            array [0..3] of byte absolute $DE14;
    DIVU_RESULT_Q:          word absolute $DE14;
    DIVU_RESULT_R:          word absolute $DE16;

    ADD_A:                  array [0..3] of byte absolute $DE08;
    ADD_B:                  array [0..3] of byte absolute $DE0C;
    ADD_RESULT:             array [0..3] of byte absolute $DE18;

    DMA_CTRL:               byte absolute $DF00;
    DMA_STATUS:             byte absolute $DF01;
    DMA_FILL_VAL:           byte absolute $DF01;
    DMA_SRC_ADDR:           byte absolute $DF04;
    DMA_DST_ADDR:           byte absolute $DF08;
    DMA_COUNT:              array [0..2] of byte absolute $DF0C;
    DMA_WIDTH:              word absolute $DF0C;
    DMA_HEIGHT:             word absolute $DF0E;
    DMA_STRIDE_SRC:         word absolute $DF10;
    DMA_STRIDE_DST:         word absolute $DF12;

implementation

end.
