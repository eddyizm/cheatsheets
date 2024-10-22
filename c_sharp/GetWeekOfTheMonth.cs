using System;
/* method to gets a day and returns what week of the month it is 
 * 
 *
 */
namespace WeekOfMonth
{
    class Program
    {
        static void Main(string[] args)
        {
            DateTime time = DateTime.Now;
            var d = time.Day;
            var x = time.Date;
            Console.WriteLine($"day: {d}, date: {x}");
            var run_report = GetWeek(d);
            Console.WriteLine(run_report);
            Console.Read();
        }

        private static bool GetWeek(int day)
        {
            if (day >= 1 && day <= 7)
            {
                return false;
            }
            else if (day >= 8 && day <= 14)
            {
                return true;
            }
            else if (day >= 15 && day <= 21)
            {
                return false;
            }
            else // catch all for long months! 
            {
                return true;
            }
        }
    }
}
