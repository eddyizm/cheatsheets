//  StringBuilder removing blank spaces. 

string toomanyspaces = "Now is the time for all good men to come to";
System.Text.StringBuilder  sbTemp = new System.Text.StringBuilder(toomanyspaces);
for(int count = 0; count < sbTemp.Length; count++)
	{
		if (sbTemp[count] == ' ')
		{
			sbTemp.Remove(count,1);
		}
	}
string lessspaces = sbTemp.ToString();
