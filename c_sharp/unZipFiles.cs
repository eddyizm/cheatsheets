/* unzipping files and password files */
/* DotNetZip */

using Ionic.Zip;

using (ZipFile zArchive = new ZipFile(_zipFilePath))

     {
            // Unzipping password protected files...
            zArchive.Password = <PASSWORD>;
            zArchive.ExtractAll(outDirectory);
     }
