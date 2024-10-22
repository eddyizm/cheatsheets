/* remove all empty subdirectories 
* https://stackoverflow.com/questions/2811509/c-sharp-remove-all-empty-subdirectories
*
*/ 
static void Main(string[] args)
{
    processDirectory(@"c:\temp");
}

private static void processDirectory(string startLocation)
{
    foreach (var directory in Directory.GetDirectories(startLocation))
    {
        processDirectory(directory);
        //if (Directory.GetFileSystemEntries(directory).Length == 0)
        //if (!Directory.EnumerateFileSystemEntries(directory).Any())
        if (Directory.GetFiles(directory).Length == 0 && 
            Directory.GetDirectories(directory).Length == 0)
        {
            Directory.Delete(directory, false);
        }
    }
}