/* pad int with zeros or other value for a fixed length */

using System.IO;
using System;

class Program
{
    static void Main()
    {
        int i = 51;
        // String.Format("{0:<NUMBER of Values>}", <INT>);
		var f = String.Format("{0:0000}", i);  
		Console.WriteLine(i.ToString("D4"));
        Console.WriteLine(f);
    }
}