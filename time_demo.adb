pragma Ada_2022;

package body Time_Demo is

   function Seconds_Between
     (T0, T1 : Ada.Calendar.Time) return Duration
   is
      use type Ada.Calendar.Time;
   begin
      return T1 - T0;
   end Seconds_Between;

   function Same_Civil_Day
     (T0, T1 : Ada.Calendar.Time) return Boolean
   is
      Y0, Y1 : Ada.Calendar.Year_Number;
      M0, M1 : Ada.Calendar.Month_Number;
      D0, D1 : Ada.Calendar.Day_Number;
      S0, S1 : Ada.Calendar.Day_Duration;
   begin
      Ada.Calendar.Split (T0, Y0, M0, D0, S0);
      Ada.Calendar.Split (T1, Y1, M1, D1, S1);
      return Y0 = Y1 and then M0 = M1 and then D0 = D1;
   end Same_Civil_Day;

   function Elapsed_To_Duration
     (Span : Ada.Real_Time.Time_Span) return Duration
   is
   begin
      return Ada.Real_Time.To_Duration (Span);
   end Elapsed_To_Duration;

   procedure Sleep_At_Least (Span : Ada.Real_Time.Time_Span) is
      use type Ada.Real_Time.Time;
      Deadline : constant Ada.Real_Time.Time :=
        Ada.Real_Time.Clock + Span;
   begin
      delay until Deadline;
   end Sleep_At_Least;

   function Measure_Sleep
     (Span : Ada.Real_Time.Time_Span) return Ada.Real_Time.Time_Span
   is
      use type Ada.Real_Time.Time;
      T0 : constant Ada.Real_Time.Time := Ada.Real_Time.Clock;
   begin
      Sleep_At_Least (Span);
      return Ada.Real_Time.Clock - T0;
   end Measure_Sleep;

end Time_Demo;
