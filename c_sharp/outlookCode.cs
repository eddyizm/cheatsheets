using System;
using System.Collections.Generic;//List
using System.Linq;//Array
//using System.Text;
//using System.Threading.Tasks;
using System.Diagnostics;//Process
using System.Runtime.InteropServices;//Marshal
using System.Data;//DataTable
using System.Reflection;//Missing
// using Microsoft.Office.Interop.Outlook;//.OST files, needs Microsoft.Office.Interop.Outlook.dll

//TO DO: If you use the Microsoft Outlook 11.0 Object Library, uncomment the following line.
using Outlook = Microsoft.Office.Interop.Outlook;

namespace WatchOutlookMails
{
    class StoreFormat
    {
        public DataTable GetInboxItems(DateTime dtpStartDate, DateTime dtpEndDate)
        {
            DataTable inboxTable;
            string filter = string.Format("[ReceivedTime] >= '{0:dd/MM/yyyy 12:00 AM}' and [ReceivedTime] <= '{1:dd/MM/yyyy 11:59 PM}'", dtpStartDate, dtpEndDate);
            Outlook.Application outlookApp = GetApplicationObject();
#if false//only needed if you want to select another folder
            Outlook.Folder root = outlookApp.Session.DefaultStore.GetRootFolder() as Outlook.Folder;
            EnumerateFolders(root);
#endif
            //inbox
            Outlook.MAPIFolder inboxFolder = outlookApp.Session.GetDefaultFolder(Outlook.OlDefaultFolders.olFolderInbox);
            inboxTable = CreateTable();
            if (inboxFolder.Items.Count > 0)
            {
                Items restrictedItems = inboxFolder.Items.Restrict(filter);
                const bool SortDescending = true;
                restrictedItems.Sort("[ReceivedTime]", SortDescending);
                foreach (var item in restrictedItems)//item is a "COM Object" (?)
                {
                    MailItem mail = item as Outlook.MailItem;
                    if (mail != null)
                    {
                        //try
                        //{
                        DataRow row = inboxTable.NewRow();
                        //row["sn"] = (++count).ToString();
                        row["sn"] = mail.EntryID + " " + mail.ReceivedByEntryID;
                        row["MailType"] = "Inbox";
                        row["SenderName"] = mail.SenderName;
                        row["SenderEmail"] = mail.SenderEmailAddress;
                        row["ReceivedDate"] = mail.ReceivedTime;
                        row["Subject"] = mail.Subject;
                        row["Body"] = mail.Body != null ? (mail.Body.Length > 25 ? mail.Body.Substring(0, 25) : mail.Body) : null;
                        //row["Body"] = mail.Body != null ? mail.Body : "";
                        row["MailSize"] = mail.Size.ToString();
                        int AttachmentSize = 0;
                        foreach (Outlook.Attachment attachment in mail.Attachments)
                        {
                            if (attachment != null)
                                AttachmentSize += attachment.Size;
                        }
                        row["AttachmentCount"] = mail.Attachments.Count;
                        row["AttachmentSize"] = AttachmentSize;
                        inboxTable.Rows.Add(row);
                        //catch (Exception ex)
                        //{
                        //    break;
                        //}
                    }
                }
            }
            return inboxTable;
        }

        private DataTable CreateTable()
        {
            DataTable T = new DataTable();
            T.Columns.Add("sn", typeof(string));
            T.Columns.Add("MailType", typeof(string));
            T.Columns.Add("SenderName", typeof(string));
            T.Columns.Add("SenderEmail", typeof(string));
            T.Columns.Add("ReceivedDate", typeof(string));
            T.Columns.Add("Subject", typeof(string));
            T.Columns.Add("Body", typeof(string));
            T.Columns.Add("MailSize", typeof(int));
            T.Columns.Add("AttachmentCount", typeof(int));
            T.Columns.Add("AttachmentSize", typeof(int));
            return T;
        }

        private void EnumerateFoldersInDefaultStore()
        {
            Outlook.Application outlookApp = GetApplicationObject();
            Outlook.Folder root = outlookApp.Session.DefaultStore.GetRootFolder() as Outlook.Folder;
            EnumerateFolders(root);
            return;
        }

        private void EnumerateFolders(Outlook.Folder folder)
        {
            Outlook.Folders childFolders = folder.Folders;
            if (childFolders.Count > 0)
            {
                foreach (Outlook.Folder childFolder in childFolders)
                {
                    // Write the folder path.
                    //Debug.WriteLine(childFolder.FolderPath);
                    // Call EnumerateFolders using childFolder.
                    // Uses recursion to enumerate Outlook subfolders.
                    EnumerateFolders(childFolder);
                }
            }
            return;
        }

        /// <summary>
        /// obtain an Application object that represents an active instance of Microsoft Outlook, 
        /// if there is one running on the local computer, or to create a new instance of Outlook, 
        /// log on to the default profile, and return that instance of Outlook
        /// </summary>
        /// <returns></returns>
        private Outlook.Application GetApplicationObject()
        {
            // source: https://msdn.microsoft.com/en-us/library/ff462097.aspx
            Outlook.Application application = null;

            // Check whether there is an Outlook process running.
            if (Process.GetProcessesByName("OUTLOOK").Count() > 0)
            {

                // If so, use the GetActiveObject method to obtain the process and cast it to an Application object.
                application = Marshal.GetActiveObject("Outlook.Application") as Outlook.Application;
            }
            else
            {

                // If not, create a new instance of Outlook and log on to the default profile.
                application = new Outlook.Application();
                Outlook.NameSpace nameSpace = application.GetNamespace("MAPI");
                nameSpace.Logon("", "", Missing.Value, Missing.Value);
                nameSpace = null;
            }

            // Return the Outlook Application object.
            return application;
        }
    }//end class
}//end ns