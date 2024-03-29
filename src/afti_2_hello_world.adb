with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure AFTI_2_Hello_World is
   Two : String := 2 * " World";
begin
    Put ('H');
    Put ('e');
    Put ( 2 * 'l');
    Put ('o');
    Put (Two);
end AFTI_2_Hello_World;