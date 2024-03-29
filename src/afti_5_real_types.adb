with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Numerics; use Ada.Numerics;

procedure  is
AFTI_5_Real_Types
    -- IMPORTANT
    -- The following is the standard Ada Float definition on my machine:
    -- type Float is digits 6 range -16#0.FFFF_FF#E+32 .. 16#0.FFFF_FF#E+32;

    type Amplitude_1 is new Float range -1.0 .. 1.0;
    -- A variable of type Amplitude_3 CANNOT be mixed with a variable of type Float
    -- Doing so would not compile
    -- Because it is a DIFFERENT `type` than Amplitude_3

    subtype Amplitude_2 is Float range -1.0 .. 1.0;
    -- A variable of type Amplitude_2 CAN be mixed with a variable of type Float
    -- Because it is a `SUBTYPE` of Float

    type Amplitude_3 is digits 3 range -1.0 .. 1.0 with size => 64;
    -- This is a Decimal Fixed-Point Type
    -- Size of 64 bits on the machine

    type Decimal_Fixed_1 is delta 10.0 ** (-3) digits 2;
    -- Is has an additional DELTA attribute

    type Decimal_Fixed_2 is delta 10.0 ** (-4) digits 4 range 0.0 .. 1.0 - 10.0 ** (-4);
    -- Is has an additional DELTA attribute
    -- We specify the range

    D1 : constant := 10.0 ** (-3);
    type Decimal_Fixed_3 is delta D1 digits 3 range -1.0 + D1 .. 0.0 with size => 32;
    -- Is has an additional DELTA attribute
    -- Delta value can be a constant

    D2 : constant := 1.0;
    type Degree_1 is delta D2 range 0.0 .. 360.0 - D2;
        for Degree_1'Small use 1.0 / 360.0;
    -- This is a Ordinary Fixed-Point Type

    type Degree_2 is delta D2 range 0.0 .. 360.0 - D2;
        for Degree_2'Small use D2;
    -- This is a Ordinary Fixed-Point Type

    D3 : constant := 1.0 / 3600.0;
    type Degree_3 is delta D3 range 0.0 .. 360.0 - D3;
        for Degree_3'Small use D3;
    
    D4 : constant := Pi / 2.0 ** 31;
    type Radian_1 is delta 2*D4 range -Pi .. Pi;
        for Radian_1'Small use D4;

    -- VARIABLE DECLARATIONS --

    Min : Float := Float'First;
    -- Initialized to smallest Float on Machine

    Max : Long_Long_Float := Long_Long_Float'Last;
    -- Initialized to biggest Long_Long_Float on Machine

    Amp1 : Amplitude_1 := -0.5;
    -- Initialized to -0.5, good

    Amp2 : Amplitude_2 := -0.5 * (-0.5);
    -- Initialized to 

    Amp3 : Amplitude_3 := -0.5 * (-0.5);
    -- Initialized to 

    Dec1 : Decimal_Fixed_1 := Decimal_Fixed_1'Last;
    -- Initialized to 

    Dec2 : Decimal_Fixed_2 := Decimal_Fixed_2'Last;
    -- Initialized to 

    Dec3 : Decimal_Fixed_3 := Decimal_Fixed_3'Pred (Decimal_Fixed_3'Last);
    -- Initialized to 

    Deg1 : Degree_1 := Degree_1'Pred (Degree_1'Last);
    -- Initialized to 

    Deg2 : Degree_2 := Degree_2'Pred (Degree_2'Last);
    -- Initialized to

    Deg3 : Degree_3 := Degree_3'Pred (Degree_3'Last);
    -- Initialized to

    Rad1 : Radian_1 := Radian_1'Succ (Radian_1'First + Radian_1'Last);
    -- Initialized to

    Separator : String := 26 * "*";
    -- A String of 26 "stars"
begin
    Put_Line ("Amplitude_1 first value:      " & Amplitude_1'First'Image);
    Put_Line ("Amplitude_1 last value:       " & Amplitude_1'Last'Image);
    Put_Line ("Amplitude_1 size (bits):      " & Amplitude_1'Size'Image);
    Put_Line (Separator);  
  
    Put_Line ("Amplitude_2 first value:      " & Amplitude_2'First'Image);
    Put_Line ("Amplitude_2 last value:       " & Amplitude_2'Last'Image);
    Put_Line ("Amplitude_2 size (bits):      " & Amplitude_2'Size'Image);
    Put_Line (Separator);  
  
    Put_Line ("Amplitude_3 first value:      " & Amplitude_3'First'Image);
    Put_Line ("Amplitude_3 last value:       " & Amplitude_3'Last'Image);
    Put_Line ("Amplitude_3 size (bits):      " & Amplitude_3'Size'Image);
    Put_Line (Separator);

    Put_Line ("Decimal_Fixed_1 first value:  " & Decimal_Fixed_1'First'Image);
    Put_Line ("Decimal_Fixed_1 last value:   " & Decimal_Fixed_1'Last'Image);
    Put_Line ("Decimal_Fixed_1 delta value:  " & Decimal_Fixed_1'Delta'Image);
    Put_Line ("Decimal_Fixed_1 size (bits):  " & Decimal_Fixed_1'Size'Image);
    Put_Line (Separator);

    Put_Line ("Decimal_Fixed_2 first value:  " & Decimal_Fixed_2'First'Image);
    Put_Line ("Decimal_Fixed_2 last value:   " & Decimal_Fixed_2'Last'Image);
    Put_Line ("Decimal_Fixed_2 delta value:  " & Decimal_Fixed_2'Delta'Image);
    Put_Line ("Decimal_Fixed_2 size (bits):  " & Decimal_Fixed_2'Size'Image);
    Put_Line (Separator);

    Put_Line ("Decimal_Fixed_3 first value:  " & Decimal_Fixed_3'First'Image);
    Put_Line ("Decimal_Fixed_3 last value:   " & Decimal_Fixed_3'Last'Image);
    Put_Line ("Decimal_Fixed_3 delta value:  " & Decimal_Fixed_3'Delta'Image);
    Put_Line ("Decimal_Fixed_3 size (bits):  " & Decimal_Fixed_3'Size'Image);
    Put_Line (Separator);

    Put_Line ("Degree_1 first value:  " & Degree_1'First'Image);
    Put_Line ("Degree_1 last value:   " & Degree_1'Last'Image);
    Put_Line ("Degree_1 delta value:  " & Degree_1'Delta'Image);
    Put_Line ("Degree_1 small value:  " & Degree_1'Small'Image);
    Put_Line ("Degree_1 size (bits):  " & Degree_1'Size'Image);
    Put_Line (Separator);

    Put_Line ("Degree_2 first value:  " & Degree_2'First'Image);
    Put_Line ("Degree_2 last value:   " & Degree_2'Last'Image);
    Put_Line ("Degree_2 delta value:  " & Degree_2'Delta'Image);
    Put_Line ("Degree_2 small value:  " & Degree_2'Small'Image);
    Put_Line ("Degree_2 size (bits):  " & Degree_2'Size'Image);
    Put_Line (Separator);

    Put_Line ("Radian_1 first value:  " & Radian_1'First'Image);
    Put_Line ("Radian_1 last value:   " & Radian_1'Last'Image);
    Put_Line ("Radian_1 delta value:  " & Radian_1'Delta'Image);
    Put_Line ("Radian_1 small value:  " & Radian_1'Small'Image);
    Put_Line ("Radian_1 size (bits):  " & Radian_1'Size'Image);
    Put_Line (Separator);

    Put_Line ("Min:                  " & Min'Image);
    Put_Line ("Min size (bits):      " & Min'Size'Image);
    Put_Line ("Max:                  " & Max'Image);
    Put_Line ("Max size (bits):      " & Max'Size'Image);
    Put_Line ("Amp1:                 " & Amp1'Image);
    Put_Line ("Amp2:                 " & Amp2'Image);
    Put_Line ("Amp3:                 " & Amp3'Image);
    Put_Line ("Dec1:                 " & Dec1'Image);
    Put_Line ("Dec2:                 " & Dec2'Image);
    Put_Line ("Dec3:                 " & Dec3'Image);
    Put_Line ("Deg1:                 " & Deg1'Image);
    Put_Line ("Deg2:                 " & Deg2'Image);
    Put_Line ("Deg3:                 " & Deg3'Image);
    Put_Line ("Rad1:                 " & Rad1'Image);

end AFTI_5_Real_Types;