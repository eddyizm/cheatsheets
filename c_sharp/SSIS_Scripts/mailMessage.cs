public void Main()
{
    string mailSubject = "";
    string mailMessage = "";

    mailMessage = "Return File has been successfully generated.\n\n";
    mailMessage = mailMessage + "DataBase | Package Name:  " + Dts.Variables["User::varDatabase"].Value.ToString()+" | "+
                    Dts.Variables["System::PackageName"].Value.ToString()+"\n";
    mailMessage = mailMessage + "State:  " + Dts.Variables["User::varState"].Value.ToString()+"\n";
    mailMessage = mailMessage + "Batch ID:  " + Dts.Variables["User::varBatchID"].Value.ToString()+"\n";
    mailMessage = mailMessage + "Records processed:  " + Dts.Variables["User::varSuccessCount"].Value.ToString()+"\n";
    mailMessage = mailMessage + "Please contact IT group if you have any questions or concerns.";
    Dts.Variables["User::varMailMessage"].Value = mailMessage;
    mailSubject = "<SUBJECT> "+Dts.Variables["User::varState"].Value.ToString()+" completed successfully";
    Dts.Variables["User::varMailSubject"].Value = mailSubject;

    Dts.TaskResult = (int)ScriptResults.Success;
}