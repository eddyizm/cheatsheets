		public void Main()
		{
            
            var source_dir = @"\\source directory\";
            var dest_dir = @"\\destination directory\";
            string[] files = Directory.GetFiles(source_dir, "*.xls");

            foreach (string file in files)
            {
                // get filename from full file path
                var fileCheck = Path.GetFileName(file);
                // logic to check starts with and ends with
                if ((fileCheck.StartsWith("ABC") || fileCheck.StartsWith("XYZ") 
                    || fileCheck.StartsWith("STU") ) && fileCheck.EndsWith(".xls"))
                {
                    File.Copy(file, dest_dir + fileCheck , true);
                }

            }

         
		}