const
digit0: array [0..24] of byte = (
%00000111, %00000111, %00000111, %00000111, %00000111,
%00000101, %00000101, %00000101, %00000101, %00000101,
%00000101, %00000101, %00000101, %00000101, %00000101,
%00000101, %00000101, %00000101, %00000101, %00000101,
%00000111, %00000111, %00000111, %00000111, %00000111
);

digit1: array [0..24] of byte = (
%00000001, %00000001, %00000001, %00000001, %00000001,
%00000001, %00000001, %00000001, %00000001, %00000001,
%00000001, %00000001, %00000001, %00000001, %00000001,
%00000001, %00000001, %00000001, %00000001, %00000001,
%00000001, %00000001, %00000001, %00000001, %00000001
);

digit2: array [0..24] of byte = (
%00000111, %00000111, %00000111, %00000111, %00000111,
%00000001, %00000001, %00000001, %00000001, %00000001,
%00000111, %00000111, %00000111, %00000111, %00000111,
%00000100, %00000100, %00000100, %00000100, %00000100,
%00000111, %00000111, %00000111, %00000111, %00000111
);

digit3: array [0..24] of byte = (
%00000111, %00000111, %00000111, %00000111, %00000111,
%00000001, %00000001, %00000001, %00000001, %00000001,
%00000111, %00000111, %00000111, %00000111, %00000111,
%00000001, %00000001, %00000001, %00000001, %00000001,
%00000111, %00000111, %00000111, %00000111, %00000111
);

digit4: array [0..24] of byte = (
%00000101, %00000101, %00000101, %00000101, %00000101,
%00000101, %00000101, %00000101, %00000101, %00000101,
%00000111, %00000111, %00000111, %00000111, %00000111,
%00000001, %00000001, %00000001, %00000001, %00000001,
%00000001, %00000001, %00000001, %00000001, %00000001
);

digit5: array [0..24] of byte = (
%00000111, %00000111, %00000111, %00000111, %00000111,
%00000100, %00000100, %00000100, %00000100, %00000100,
%00000111, %00000111, %00000111, %00000111, %00000111,
%00000001, %00000001, %00000001, %00000001, %00000001,
%00000111, %00000111, %00000111, %00000111, %00000111
);

digit6: array [0..24] of byte = (
%00000111, %00000111, %00000111, %00000111, %00000111,
%00000100, %00000100, %00000100, %00000100, %00000100,
%00000111, %00000111, %00000111, %00000111, %00000111,
%00000101, %00000101, %00000101, %00000101, %00000101,
%00000111, %00000111, %00000111, %00000111, %00000111
);

digit7: array [0..24] of byte = (
%00000111, %00000111, %00000111, %00000111, %00000111,
%00000001, %00000001, %00000001, %00000001, %00000001,
%00000001, %00000001, %00000001, %00000001, %00000001,
%00000001, %00000001, %00000001, %00000001, %00000001,
%00000001, %00000001, %00000001, %00000001, %00000001
);

digit8: array [0..24] of byte = (
%00000111, %00000111, %00000111, %00000111, %00000111,
%00000101, %00000101, %00000101, %00000101, %00000101,
%00000111, %00000111, %00000111, %00000111, %00000111,
%00000101, %00000101, %00000101, %00000101, %00000101,
%00000111, %00000111, %00000111, %00000111, %00000111
);

digit9: array [0..24] of byte = (
%00000111, %00000111, %00000111, %00000111, %00000111,
%00000101, %00000101, %00000101, %00000101, %00000101,
%00000111, %00000111, %00000111, %00000111, %00000111,
%00000001, %00000001, %00000001, %00000001, %00000001,
%00000111, %00000111, %00000111, %00000111, %00000111
);

digit10: array [0..24] of byte = (
%00010111, %00010111, %00010111, %00010111, %00010111,
%00010101, %00010101, %00010101, %00010101, %00010101,
%00010101, %00010101, %00010101, %00010101, %00010101,
%00010101, %00010101, %00010101, %00010101, %00010101,
%00010111, %00010111, %00010111, %00010111, %00010111
);

digit11: array [0..24] of byte = (
%00010001, %00010001, %00010001, %00010001, %00010001,
%00010001, %00010001, %00010001, %00010001, %00010001,
%00010001, %00010001, %00010001, %00010001, %00010001,
%00010001, %00010001, %00010001, %00010001, %00010001,
%00010001, %00010001, %00010001, %00010001, %00010001
);

digit12: array [0..24] of byte = (
%00010111, %00010111, %00010111, %00010111, %00010111,
%00010001, %00010001, %00010001, %00010001, %00010001,
%00010111, %00010111, %00010111, %00010111, %00010111,
%00010100, %00010100, %00010100, %00010100, %00010100,
%00010111, %00010111, %00010111, %00010111, %00010111
);

digit13: array [0..24] of byte = (
%00010111, %00010111, %00010111, %00010111, %00010111,
%00010001, %00010001, %00010001, %00010001, %00010001,
%00010111, %00010111, %00010111, %00010111, %00010111,
%00010001, %00010001, %00010001, %00010001, %00010001,
%00010111, %00010111, %00010111, %00010111, %00010111
);

digit14: array [0..24] of byte = (
%00010101, %00010101, %00010101, %00010101, %00010101,
%00010101, %00010101, %00010101, %00010101, %00010101,
%00010111, %00010111, %00010111, %00010111, %00010111,
%00010001, %00010001, %00010001, %00010001, %00010001,
%00010001, %00010001, %00010001, %00010001, %00010001
);

digit15: array [0..24] of byte = (
%00010111, %00010111, %00010111, %00010111, %00010111,
%00010100, %00010100, %00010100, %00010100, %00010100,
%00010111, %00010111, %00010111, %00010111, %00010111,
%00010001, %00010001, %00010001, %00010001, %00010001,
%00010111, %00010111, %00010111, %00010111, %00010111
);

digits: array [0..15] of pointer = ( @digit0, @digit1, @digit2, @digit3, @digit4, @digit5, @digit6, @digit7, @digit8, @digit9, @digit10, @digit11, @digit12, @digit13, @digit14, @digit15 );