// for loops

//for loops
int[] fibarray = new int[] { 0, 1, 1, 2, 3, 5, 8, 13 };
// Compare the previous loop to a similar for loop.
for (int i = 0; i < fibarray.Length; i++)
{
    System.Console.WriteLine(fibarray[i]);
}
System.Console.WriteLine();
// Output:
// 0
// 1
// 1
// 2
// 3
// 5
// 8
// 13


// foreach
int[] fibarray = new int[] { 0, 1, 1, 2, 3, 5, 8, 13 };
foreach (int element in fibarray)
{
    System.Console.WriteLine(element);
}
System.Console.WriteLine();
// Output:
// 0
// 1
// 1
// 2
// 3
// 5
// 8
// 13

// update list with another list
var data = List<string>
            foreach (var x in data)
            {
                var check_value = x.value;
                foreach(var n in second_list)
                {
                    if (n.value_second_list == check)
                    {
                        x.value = n.otherfield;
                    }
                }
            }