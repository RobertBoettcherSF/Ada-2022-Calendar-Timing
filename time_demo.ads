--  Ada 2022 topic: Ada.Calendar and Ada.Real_Time basics.
pragma Ada_2022;

with Ada.Calendar;
with Ada.Real_Time;

package Time_Demo is

   function Seconds_Between
     (T0, T1 : Ada.Calendar.Time) return Duration;

   function Same_Civil_Day
     (T0, T1 : Ada.Calendar.Time) return Boolean;

   function Elapsed_To_Duration
     (Span : Ada.Real_Time.Time_Span) return Duration;

   --  Busy-wait-free short sleep via Real_Time delay until.
   procedure Sleep_At_Least (Span : Ada.Real_Time.Time_Span);

   function Measure_Sleep
     (Span : Ada.Real_Time.Time_Span) return Ada.Real_Time.Time_Span;
   --  Sleep then return measured elapsed Real_Time span.

end Time_Demo;
