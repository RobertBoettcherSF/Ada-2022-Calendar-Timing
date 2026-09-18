pragma Ada_2022;

with Ada.Assertions; use Ada.Assertions;
with Ada.Calendar;
with Ada.Real_Time;
with Ada.Text_IO; use Ada.Text_IO;
with Time_Demo;

procedure Tests is
   use type Ada.Calendar.Time;
   use type Ada.Real_Time.Time_Span;
   Now   : constant Ada.Calendar.Time := Ada.Calendar.Clock;
   Later : constant Ada.Calendar.Time := Now + 2.5;
   Span  : constant Ada.Real_Time.Time_Span :=
     Ada.Real_Time.Milliseconds (20);
   Measured : Ada.Real_Time.Time_Span;
begin
   Assert (abs (Time_Demo.Seconds_Between (Now, Later) - 2.5) < 0.001);
   Put_Line ("PASS Calendar Time difference");

   Assert (Time_Demo.Same_Civil_Day (Now, Now));
   Put_Line ("PASS Same_Civil_Day / Split");

   Assert
     (abs
        (Time_Demo.Elapsed_To_Duration (Span)
         - 0.020)
      < 0.001);
   Put_Line ("PASS Real_Time.To_Duration");

   Measured := Time_Demo.Measure_Sleep (Span);
   Assert (Measured >= Span);
   Put_Line ("PASS delay until + measured elapsed");

   Put_Line ("All Calendar & Timing topic tests passed.");
end Tests;
