with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Numerics.Big_Numbers.Big_Integers; use  Ada.Numerics.Big_Numbers.Big_Integers;

procedure AFTI_4_Integer_Types is

    -- IMPORTANT:
    -- The following is the tandard Ada Integer definition on my machine
    -- type Integer is range -(2 ** 31) .. +(2 ** 31 - 1);

    -- TYPE DECLARATIONS --

    type Dozen is new Integer range 1 .. 12;  
    -- A variable of type Dozen CANNOT be mixed with a variable of type Integer
    -- Doing so would not compile
    -- Because it is a DIFFERENT `type` than Integer

    subtype Decade is Integer range 1 .. 10;
    -- A variable of type Decade CAN be mixed with a variable of type Integer
    -- Because it is a `SUBTYPE` of Integer

    type Century is range 1 .. 100 with size => 7;
    -- A variable of type Century will have a SIZE of 7 BITS on the machine

    type UInt8_1 is mod 2**8;
    -- A variable of type UInt8_1 can take values from 0 to 255
    -- Type UInt8_1 is called a MODULAR type
    -- A variable of type UInt8_1 will WRAP AROUND to 0 at 255 + 1 
    -- A variable of type UInt8_1 will have a SIZE of 8 BITS (2**8) on the machine

    type UInt8_2 is range 0 .. 255 with size => 18;
    -- A variable of type UInt8_2 will NOT WRAP AROUND to 0 at 255 + 1
    -- A variable of type UInt8_2 will have a SIZE of 18 BITS on the machine

    type UInt8_3 is range 2 .. 257 with size => 24;
    -- A variable of type UInt8_3 will NOT WRAP AROUND to 2 at 257 + 1
    -- A variable of type UInt8_3 will have a SIZE of 24 BITS on the machine

    type Bit is range 0 .. 1 with size => 1;
    -- A variable of type Bit will NOT WRAP AROUND to 0 at 1+
    -- A variable of type Bit will have a SIZE of 1 BIT on the machine

    type Trit is mod 3;
    -- A variable of type Trit can take values from 0 to 2
    -- A variable of type Trit will WRAP AROUND to 0 at 2 + 1
    -- A variable of type Trit will have a SIZE of 2 BIT on the machine
    -- Because you need minimum 2 bits (xx) to represent 0 -> (00), 1 -> (01), 2 -> (10)

    -- VARIABLE DECLARATIONS --

    Min : Integer := Integer'First;
    -- Initialized to smallest Integer on Machine

    Max : Long_Long_Long_Integer := Long_Long_Long_Integer'Last;
    -- Initialized to biggest Long_Long_Long_Integer on Machine

    Very_Big : Big_Integer := 2**999;
    -- Like ... Very Big

    Bad_Dozen_1 : Integer; 
    -- Uninitialized, maybe 0 ...
    -- Dont be surprised if you have garbage data inside Bad_Dozen_1

    Bad_Dozen_2 : Integer := -1_000_000; 
    -- WILL compile but, bad semantic attracts broken computations
    -- Here the variable Bad_Dozen_2 is mapped to -1 million! 
    -- Why would a dozen ever contains more than 12 "things"?

    -- Dozen_1 : Dozen := -1000000; 
    -- WILL NOT compile
    -- Dozen_1 is of type Dozen
    -- Type Dozen CANNOT map to less than 1 "thing"
    -- Type Dozen CANNOT map to more than 12 "things"

    Dozen_2 : Dozen := 6 + 6; 
    -- Initialized to 12, good

    Dec1 : Decade := 2 * 5;
    -- Initialized to 10, good

    Dec2 : Decade := Decade'First; 
    -- Initialised to 1, good

    Cen : Century := Century'Last;
    -- Initialised to 100, good

    U81 : UInt8_1 := UInt8_1'Succ (UInt8_1'Last/2);
    -- Initialised to (255 / 2) + 1

    U82 : UInt8_2 := 2#1111_1111#;
    -- Initialised to 255

    U83 : UInt8_3 := UInt8_3'Pred (UInt8_3'Last/2);
    -- Initialised to (257 / 2) - 1

    B : Bit := Bit'Last;
    -- Initialized to 1

    T : Trit := Trit'Last + 1;
    -- Initialized to 2 + 1, WRAP AROUND to 0

    Separator : String := 26 * "*";
    -- A String of 26 "stars"

begin
    Put_Line ("Dozen first value:    " & Dozen'First'Image);
    Put_Line ("Dozen last value:     " & Dozen'Last'Image);
    Put_Line ("Dozen size (bits):    " & Dozen'Size'Image);
    Put_Line (Separator);

    Put_Line ("Decade first value:   " & Decade'First'Image);
    Put_Line ("Decade last value:    " & Decade'Last'Image);
    Put_Line ("Decade size (bits):   " & Decade'Size'Image);
    Put_Line (Separator);

    Put_Line ("UInt8_1 first value:  " & UInt8_1'First'Image);
    Put_Line ("UInt8_1 last value:   " & UInt8_1'Last'Image);
    Put_Line ("UInt8_1 size (bits):  " & UInt8_1'Size'Image);
    Put_Line (Separator);

    Put_Line ("UInt8_2 first value:  " & UInt8_2'First'Image);
    Put_Line ("UInt8_2 last value:   " & UInt8_2'Last'Image);
    Put_Line ("UInt8_2 size (bits):  " & UInt8_2'Size'Image);
    Put_Line (Separator);

    Put_Line ("UInt8_3 first value:  " & UInt8_3'First'Image);
    Put_Line ("UInt8_3 last value:   " & UInt8_3'Last'Image);
    Put_Line ("UInt8_3 size (bits):  " & UInt8_3'Size'Image);
    Put_Line (Separator);

    Put_Line ("Bit first value:      " & Bit'First'Image);
    Put_Line ("Bit last value:       " & Bit'Last'Image);
    Put_Line ("Bit size (bits):      " & Bit'Size'Image);
    Put_Line (Separator);

    Put_Line ("Trit first value:     " & Trit'First'Image);
    Put_Line ("Trit last value:      " & Trit'Last'Image);
    Put_Line ("Trit size (bits):     " & Trit'Size'Image);
    Put_Line (Separator);

    Put_Line ("Min:                  " & Min'Image);
    Put_Line ("Min size (bits):      " & Min'Size'Image);
    Put_Line ("Max:                  " & Max'Image);
    Put_Line ("Max size (bits):      " & Max'Size'Image);
    Put_Line ("Very_Big:             " & Very_Big'Image);
    Put_Line ("Bad_Dozen_1:          " & Bad_Dozen_1'Image);
    Put_Line ("Bad_Dozen_2:          " & Bad_Dozen_2'Image);
    Put_Line ("Dozen_2:              " & Dozen_2'Image);
    Put_Line ("Dec1:                 " & Dec1'Image);
    Put_Line ("Dec2:                 " & Dec2'Image);
    Put_Line ("Cen:                  " & Cen'Image);
    Put_Line ("U81:                  " & U81'Image);
    Put_Line ("U82:                  " & U82'Image);
    Put_Line ("U83:                  " & U83'Image);
    Put_Line ("B:                    " & B'Image);
    Put_Line ("T:                    " & T'Image);
    
end AFTI_4_Integer_Types;