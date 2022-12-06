using System;
using System.IO;
using System.Net;

/* 
Call SSRS report from C# and output response file to directory 
*/

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            string url, destination;
            string fileDate = DateTime.Now.ToString("yyyyMMdd");
            var _reportFolder = "Demo";
            
            var _reportName = "<REPORT_NAME>";
            var format = "PDF";
            var Param = "<VALUE>";
            var directory = @"C:\<PATH_TO_DOWNLOAD>\";
            destination = directory +"\\" + _reportName+"\\"+ fileDate + "\\" + fileDate + "_"+ _reportName + "_" + Param + "." + format;
            url = @"http://<SERVER>/ReportServer/Pages/ReportViewer.aspx?%2f" + _reportFolder + "%2f" + _reportName + "&rs:Format=" + format + "&rs:Command=Render&Param=" + Param;
            SaveFile(url, destination);
            
        }

        static void SaveFile(string url, string localpath)
        {
            HttpWebRequest loRequest;
            HttpWebResponse loResponse;
            Stream loResponseStream;
            Directory.CreateDirectory(Path.GetDirectoryName(localpath));
            FileStream loFileStream = new FileStream(localpath, FileMode.Create, FileAccess.Write);
            byte[] laBytes = new byte[256];
            int liCount = 1;
            try
            {

                loRequest = (System.Net.HttpWebRequest)System.Net.WebRequest.Create(url);
                loRequest.Credentials = System.Net.CredentialCache.DefaultCredentials;
                loRequest.Timeout = 600000;
                loRequest.Method = "GET";
                loResponse = (System.Net.HttpWebResponse)loRequest.GetResponse();
                loResponseStream = loResponse.GetResponseStream();
                while (liCount > 0)
                {
                    liCount = loResponseStream.Read(laBytes, 0, 256);

                    loFileStream.Write(laBytes, 0, liCount);
                }

                loFileStream.Flush();
                loFileStream.Close();
            }
            catch (Exception ex)
            {
            }
        }


    }
}
