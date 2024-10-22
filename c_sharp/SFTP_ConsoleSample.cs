using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using System.IO;
/* Requires Renci SSHNET DLL */
using Renci.SshNet;


namespace sftp_uploadApp
{
    class Program
    {
              // Set path
        static string uploadPath = @"\\uploadpath\";
        static void Main(string[] args)
        {
                        // Setup Credentials and Server Information
            ConnectionInfo ConnNfo = new ConnectionInfo("sftp.webURL.com", 827, "UserAccount",
                new AuthenticationMethod[]{

                // Pasword based Authentication
                new PasswordAuthenticationMethod("UserName","Password"),
                }
            );

            // Upload A File
            using (var sftp = new SftpClient(ConnNfo))
            {


                // Set File Name                 
                string uploadfn = "FileName";
                
                // append current date and csv extensi
                uploadfn += DateTime.Now.ToString("MMddyyyy") + ".csv";

                // used for debugging...
                //Debug.WriteLine(uploadPath + uploadfn);
                //Debug.WriteLine(uploadPath);

                try
                {
                    // Connect to FTP
                    sftp.Connect();

                    // Change directory
                    sftp.ChangeDirectory("/inbound");


                    using (var uplfileStream = File.OpenRead(uploadPath + uploadfn))
                    {
                        sftp.UploadFile(uplfileStream, uploadfn, true);
                    }
                    
                    sftp.Disconnect();

                }
                catch ( Exception ex)
                {
                    
                    writeToLog(ex.Message.ToString());
                }

            }
        }
        
        static void writeToLog(string message)
        {
           
            DateTime today = DateTime.Now;
            File.AppendAllText(uploadPath+"//Template//log.txt", "\n" + today + "Error Log: " + message);
        }
	
        }
    }

