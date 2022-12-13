// get last 3 characters of string

string substr = str.Substring(str.Length - 3);

// check if string is a number and greater than 0 ie. positive)
int result;
if (int.TryParse(field.Text, out result) && result > 0)
 

// string interpolation 
var_one = "12345"
var_two = "the code will display this text"
var code_item = $"Code: {var_one} | Description: {var_two}";
Console.WriteLine(code_item)
Code: 12345 | Description: the code will display this text

// remove space and and new lines 
using System.Text.RegularExpressions;

	cleaned_string = Regex.Replace(cleaned_string, @"\s+", string.Empty);

// split string to array string array by space
string[] split_list_to_array = text_blob.Split(' ');	

// join list with delimiter 
String delimitedList = String.Join(",", yourList);

// string array to string  
string[] theArray = new string[]{"Apples", "Bananas", "Cherries"};
string s = string.Join(",",theArray);

//regex split string into chunks to list. 
//this example is split into sets of 5

  var example ="20180423920213300008201810098202133002002018897";
  
  List<string> test = new List<string>(Regex.Split(example, @"(?<=\G.{5})", RegexOptions.Singleline));
        test.ForEach(x => 
            Console.WriteLine(x)
            );
			
//output 	
20180
42392
02133
00008
20181
00982
02133
00200
20188
97		

// replace all empty spaces and new lines
 var result = Regex.Replace(string_to_parse, @"\s+")
 // strip all chars except numbers
 var result = Regex.Replace(string_to_parse, @"[^\d]")
 
        