using System.Text.RegularExpressions;
		
    // remove special characters method. 
    public string RemoveSpecialCharacters(string str)
    {
        return Regex.Replace(str, "[^a-zA-Z0-9_]+", "", RegexOptions.Compiled);
    }
