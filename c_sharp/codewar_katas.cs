/* Compare Strings by Sum of Chars */
using System;
using System.Linq;
using System.Text;

public static class Kata
{
  public static bool Compare(string s1, string s2)
  { 
       var s = s1 == null ? "" : s1.ToUpper() ;
       var ss = s2 == null ? "" : s2.ToUpper();
       if (!s.All(char.IsLetter))
            { s = ""; }
       if (!ss.All(char.IsLetter))
            { ss = ""; }
       int r = 0;
       int rr = 0;
       Byte[] bytes = ASCIIEncoding.ASCII.GetBytes(s);
       foreach (Byte b in bytes)
       {
         int e = Convert.ToInt32(b);
         r += e;
        }
       Byte[] bytess = ASCIIEncoding.ASCII.GetBytes(ss);
       foreach (Byte b in bytess)
       {
         int e = Convert.ToInt32(b);
         rr += e;
       }
       var result = r == rr ? true : false;
       return result;
       }
}

/* Growth of a Population */
using System;

class Arge {
    
    public static int NbYear(int p0, double percent, int aug, int p) {
            int _nbYear = 1; 
            if (percent == 0)
             { _nbYear = 0;}
            
            int anotherYear;  
            int result = Convert.ToInt32(p0 + (p0 * (percent / 100)) + aug);
             
            while (result <= p)
            {
                anotherYear = Convert.ToInt32(result + (result * (percent / 100)) + aug);
                result = anotherYear;
                _nbYear++;
            }
                
                return _nbYear;
    }
}

/* Removing Elements */ 
using System.Linq;
using System;
using System.Collections.Generic;

  public static class Kata
    {
        public static object[] RemoveEveryOther(object[] arr)
        {
            object[] filteredObject = arr.Where((c, index) => index % 2 == 0).ToArray();
            return filteredObject;
        }
    }
    
/*  Convert number to reversed array of digits */   
using System;
using System.Collections.Generic;
using System.Linq;

namespace Solution
{
  class Digitizer
  {
    public static long[] Digitize(long n)
    {
      // Code goes here
          var input = n.ToString();
          string[] parsed = input.ToCharArray().Select(c => c.ToString()).Reverse().ToArray();
          long[] longArray = new long[parsed.Length];
          for (int i = 0; i < parsed.Length; i++ )
          {
             longArray.SetValue(Convert.ToInt64(parsed[i]), i);
          }
      return longArray;
    }
  }
}  

/* Highest Scoring Word */
/// Given a string of words, you need to find the highest scoring word.
/// Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.
/// You need to return the highest scoring word as a string.
/// If two words score the same, return the word that appears earliest in the original string.
/// All letters will be lowercase and all inputs will be valid.
using System;
using System.Linq;

public class Kata
{
  public static string High(string s)
  {
    int highScore = 0; 
		string highWord = string.Empty; 
		var words = s.Split(' ');
		words.ToList().ForEach(x =>
		   {
			   int Score = 0;
			   foreach (char c in x)
			   {
					Score += char.ToUpper(c)-64;
			   }
			   if (Score > highScore)
			   {
				   highWord = x;
				   highScore = Score;
				 }
		   });
		 return highWord;
    }
  
}

/* 
Complete the method/function so that it converts dash/underscore delimited words into camel casing. 
The first word within the output should be capitalized only if the original word was capitalized.

Examples
Kata.ToCamelCase("the-stealth-warrior") // returns "theStealthWarrior"

Kata.ToCamelCase("The_Stealth_Warrior") // returns "TheStealthWarrior"
*/

using System;
using System.Globalization;

public class Program
{
	  public static string ToCamelCase(string str)
	  {
		try
		{
		string[] split_list_to_array = str.Split(new Char [] {'_' , '-' });	
		string[] output = new string[split_list_to_array.Length];
		  Console.WriteLine(split_list_to_array.Length);
		for (int i = 0; i < split_list_to_array.Length; i++)
		  {
			
			Console.WriteLine(i);
			if (char.IsLower(split_list_to_array[i][0]) && i == 0)				
			  {
				output[i] = split_list_to_array[i];
			  }
			else
			  {
				output[i] = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(split_list_to_array[i]);
			  }
			  
		  }
		return String.Concat(output);
		}
		  catch ( Exception ex)
                {
                    Console.WriteLine(ex.Message.ToString());
				  return str;
                }
	  }
	
	public static void Main()
	{
		//var result = ToCamelCase("ldwidglncv_noyarnapxl-lcvkgtgiuu");
		var result = ToCamelCase("ABC");
		//var result = ToCamelCase("The_Stealth_Warrior");
		//oeeknnqlrxNbjuwbhttxBtcypijsun
		//oeeknnqlrxNbjuwbhttx-Btcypijsun
		//var result = ToCamelCase("The_Stealth_Warrior");
		Console.WriteLine(result);
	}
}

/* 
Create a function taking a positive integer as its parameter and returning a string containing the Roman Numeral representation of that integer.

Modern Roman numerals are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero. In Roman numerals 1990 is rendered: 1000=M, 900=CM, 90=XC; resulting in MCMXC. 2008 is written as 2000=MM, 8=VIII; or MMVIII. 1666 uses each Roman symbol in descending order: MDCLXVI.

Example:

RomanConvert.Solution(1000) -- should return "M"
*/
