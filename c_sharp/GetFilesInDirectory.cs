/* get file name from path */

string fullPath = @"C:\Temp\archive.zip";
string fileName = System.IO.Path.GetFileName(fullPath);      // "archive.zip"
string nameOnly = System.IO.Path.GetFileNameWithoutExtension(fullPath); // "archive"
string extension = System.IO.Path.GetExtension(fullPath);    // ".zip"

/* Get files by directory
*/

string[] array1 = Directory.GetFiles(@"C:\");

     // Display all files.
        Console.WriteLine("--- Files: ---");
        foreach (string name in array1)
        {
            Console.WriteLine(name);
        }
    /* Check if file exists */
    // Returns bool
    File.Exists(<PATH>)
    
    File.Delete(<PATH>)
    
    // move and copy fail if file exists. 
    File.Move(<FULLFILEPATH>)
    
    File.Copy(<FULLFILEPATH>)
    
/* copy or move directory files */
        private static void CopyDirectory(string source_dir, string dest_dir, bool move=true)
        {
            string[] files = Directory.GetFiles(source_dir);
            foreach (var f in files)
            {
                var newFile = Path.GetFileName(f);
                if (move)
                {
                    File.Move(f, Path.Combine(dest_dir, newFile));
                    Logger.Info($"Moving file...{f}");
                }
                else
                {
                    File.Copy(f, Path.Combine(dest_dir, newFile));
                    Logger.Info($"Copying file...{f}");
                }
                
            }
        }
        
/* order by last write time */
directory.GetFiles().OrderByDescending(f => f.LastWriteTime).First()        