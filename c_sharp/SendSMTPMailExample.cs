using System;
using System.Diagnostics;
using System.IO;
using System.Net.Mail;

namespace smtpmail
      
	  // send mail example in console app
	  static void sendMail(string message)
        {
            MailMessage mMailMessage = new MailMessage();
            SmtpClient client = new SmtpClient(<smtpmail server address>);
            mMailMessage.Subject = message;
            mMailMessage.Body = "\"Believe only half of what you see and nothing that you hear.\" ― Edgar Allan Poe";
            mMailMessage.From = new MailAddress(<from email address>);
            mMailMessage.To.Add(new MailAddress(<to address>));
            mMailMessage.To.Add(new MailAddress(<additional addresses>));
            client.Send(mMailMessage);
        }
