with Ada.Text_IO; use Ada.Text_IO;

procedure AFTI_6_Enumeration_Types is

    type Days_1 is (Mon, Tue, Wed, Thr, Fri, Sat, Sun);
    type Days_2 is (Mon, Tue, Wed, Thr, Fri, Sat, Sun) with size => 3;
    subtype Business_Day is Days_1 range Mon .. Fri;
    subtype Weekend_Day is Days_1 range Sat .. Sun;

begin
    null;
end AFTI_6_Enumeration_Types;