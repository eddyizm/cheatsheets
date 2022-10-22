/* ftp upload / download */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.IO;
using System.Net.Mail;
using System.Diagnostics;

namespace ftpDownload
{
    class Program
    {
        // adding a email notification to notify us when concur fails to send a file.
        static string emailMessage;

        static void Main(string[] args)
        {
            DateTime date = DateTime.Today.Date;
            DateTime goLive = new DateTime(2016, 04, 22);
            // march 27th 3/27/2016 - go live date 
            // Delete files after this date. 
            int check = 0;
            check = date.CompareTo(goLive);

            // get directory list. Why isn't this in a using statement? 
            FtpWebRequest ftpRequest = (FtpWebRequest)WebRequest.Create("ftp://<FTP ADDRESS_PATH/");
            ftpRequest.Credentials = new NetworkCredential("<USERNAME>", "<PASSWORD>");
            ftpRequest.Method = WebRequestMethods.Ftp.ListDirectory;
            FtpWebResponse response = (FtpWebResponse)ftpRequest.GetResponse();
            StreamReader streamReader = new StreamReader(response.GetResponseStream());
            List<string> directories = new List<string>();

            string line = streamReader.ReadLine();
            while (!string.IsNullOrEmpty(line))
            {
                directories.Add(line);
                line = streamReader.ReadLine();
            }
            streamReader.Close();

									
            using (WebClient ftpClient = new WebClient())
            {
                ftpClient.Credentials = new System.Net.NetworkCredential("<USERNAME>", "<PASSWORD>");

                int fileExists = 0;
                for (int i = 0; i <= directories.Count - 1; i++)
                {
                    if (directories[i].Contains("."))
                    {
                        fileExists++;
                        string path = "<FTP_PATH>" + directories[i].ToString();
                        string trnsfrpth = @"\\<Server>\FTPDownload\" + directories[i].ToString();
                        ftpClient.DownloadFile(path, trnsfrpth);
                    }
                    
                }
				// email message if no files exist
                if (fileExists == 0)
                {
                    emailMessage = "No files downloaded from <VENDOR> " + DateTime.Today.ToString("yyyy-MM-dd");
                    Debug.WriteLine(emailMessage);
                    sendMail(emailMessage);
                }
				// this check is unnecessary and was only used for testing before production
                if (check > 0)
                {

				using (WebClient ftpClient2 = new WebClient())
                    {
                        ftpClient2.Credentials = new System.Net.NetworkCredential("<USERNAME>", "<PASSWORD>");
					// delete files
                  for (int i = 0; i <= directories.Count - 1; i++)
                        {
                            if (directories[i].Contains("."))
                            {
                                string path = "<FTP URL>" + directories[i].ToString();
                                string _UserName = "<USERNAME>";  //User Name of the FTP server
                                string _Password = "<PASSWORD>";      //Password of the FTP server
                                DeleteFile(_UserName, _Password, path);
                            }
                        }
                    }
                }
                
            }

        }

        static void DeleteFile(string UserName, string Password, string FileName)
        {
            FtpWebRequest ftpRequest = (FtpWebRequest)WebRequest.Create(FileName);
            ftpRequest.Credentials = new NetworkCredential(UserName, Password);
            ftpRequest.Method = WebRequestMethods.Ftp.DeleteFile;
            FtpWebResponse responseFileDelete = (FtpWebResponse)ftpRequest.GetResponse();
        }
        
        static void sendMail(string message)
        {
            MailMessage mMailMessage = new MailMessage();
            SmtpClient client = new SmtpClient("<SMTP_SERVER>");
            mMailMessage.Subject = message;
            mMailMessage.Body = "\"Believe only half of what you see and nothing that you hear.\" ― Edgar Allan Poe";
            mMailMessage.From = new MailAddress("postmaster@DOMAIN.com");
            mMailMessage.To.Add(new MailAddress("USER@DOMAIN.com"));
            mMailMessage.To.Add(new MailAddress("OTHERUSER@DOMAIN.com"));
            client.Send(mMailMessage);
        }

    }

}