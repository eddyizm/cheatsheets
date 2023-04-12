/* grab and copy files to current date folder */

string FileName = Path.GetFileName(Dts.Variables["User::varFile"].Value.ToString());
string incomingFile = Dts.Variables["User::varRptInbox"].Value.ToString()+FileName;
var folderDate = DateTime.Now.ToString("MMddyyyy");
string mainPath = Dts.Variables["User::varFolderDestination"].Value.ToString()+folderDate; 
	if (!Directory.Exists(mainPath))
	{
		Directory.CreateDirectory(mainPath);
	}
FileName = mainPath +"\\"+FileName;
File.Copy(incomingFile, FileName, true);

/* file extension rename and replacing . in string */

// original file
string file = "<FILENAME>"; // sample replace dumb dumb! 
// renamed file
var newfile = file.Replace('.', '_') + ".xlsx";
// move or copy file? 
        public void Main()
        {
            // TODO: Add your code here
            string succMessage ="";
        
            // assign error list to mail message source.

            succMessage = "The  Missing Members Report has been completed successfully." + Environment.NewLine + Environment.NewLine;
            succMessage = succMessage + "Package Name:  " + Dts.Variables["System::PackageName"].Value.ToString() + Environment.NewLine + Environment.NewLine;
            //succMessage = succMessage + "Start Time:  " + Dts.Variables.Item("User::pkgStartTime").Value.ToString() + Environment.NewLine + Environment.NewLine;
            //succMessage = succMessage + "End Time:  " + Now().ToString() + Environment.NewLine + Environment.NewLine;
            //succMessage = succMessage + "Process Time:  " + timeTaken.ToString() + " Min(s) Or " + timeTakenSecs.ToString() + " Sec(s)" + Environment.NewLine + Environment.NewLine;
            succMessage = succMessage + Environment.NewLine;
            succMessage = succMessage + "Please contact  if you have any questions or concerns." + Environment.NewLine;
            Dts.Variables["User::MailMessage"].Value = succMessage;
		    //Dts.TaskResult = ScriptResults.Success

            Dts.TaskResult = (int)ScriptResults.Success;
        }

/* mail script
SMTP Connection Manager

*/
var mailDate = DateTime.Now.ToString("MM/dd/yyyy");
string mailSubject = "Consumer Initiated Change Files for " + mailDate;
string mailMessage = "Hi all,\n\nHere are the Consumer Initiated Changes files: \n";
mailMessage += "\n" + Dts.Variables["User::FolderDestination"].Value +"\n";
mailMessage += "\n" + "Please let me know if there are any issues. Thank you.";
Dts.Variables["User::MailMessage"].Value = mailMessage;
Dts.Variables["User::MailSubject"].Value = mailSubject;
