	/* 
	Simple delete file based on date ie. a file clean up script
	*/
	

	//using System.IO; 
		
	string[] files = Directory.GetFiles(dirName);
	
		
		foreach (string file in files)
		{
		   FileInfo fi = new FileInfo(file);
		   if (fi.LastAccessTime < DateTime.Now.AddMonths(-3))
			  fi.Delete();
		}
	/*
	search directory and files recursively
	in the example below, it finds and processes files older than 7 days with a .pdf extension
*/	

  class Recursive
    {

        public Recursive()
        {

        }

        public int DeleteFiles()
        {
            int delCount = 0;

            Console.WriteLine("Enter full directory path to process:");
            string dirName = Console.ReadLine();

            string[] files = Directory.GetFiles(dirName, "*.pdf", SearchOption.AllDirectories);


            foreach (string file in files)
            {
                FileInfo fi = new FileInfo(file);
                if (fi.CreationTime < DateTime.Now.AddDays(-7))
                {
                    Console.Write(fi.CreationTime.ToShortDateString()+'\n');//fi.Delete();
                    delCount++;
                }
            }
            Console.WriteLine(DateTime.Now.AddDays(-7).ToShortDateString());

            return delCount;
        }
    }