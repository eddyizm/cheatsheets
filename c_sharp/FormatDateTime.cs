using System.IO;
using System;

class Program
{
    static void Main()
    {
        DateTime today = DateTime.Now;    
        Console.WriteLine(today.ToString("yyyyMMdd"));
		// OUTPUT 
		// 20171021
		
		// format to 24 time
		Console.WriteLine(today.ToString("HH:mm"));
		// OUTPUT 
		// 13:45
        
    }
}

// extract date from datetime variable 

string date = Convert.ToDateTime(variable.ToString()).ToShortDateString()

// stop watch 

var watch = new System.Diagnostics.Stopwatch();
            
watch.Start();

for (int i = 0; i < 1000; i++)
{
    Console.Write(i);
}

watch.Stop();

Console.WriteLine($"Execution Time: {watch.ElapsedMilliseconds} ms");
	