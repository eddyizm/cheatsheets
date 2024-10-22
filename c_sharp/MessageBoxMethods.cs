// set message with title
string message = "Simple MessageBox";  
string title = "Title";  
MessageBox.Show(message, title); 

// yes no buttons
string message = "Do you want to close this window?";  
string title = "Close Window";  
MessageBoxButtons buttons = MessageBoxButtons.YesNo;  
DialogResult result = MessageBox.Show(message, title, buttons);  
if (result == DialogResult.Yes) {  
    this.Close();  
} else {  
    // Do something  
}  

// message box with title, icon
string message = "Do you want to abort this operation?";  
string title = "Close Window";  
MessageBoxButtons buttons = MessageBoxButtons.AbortRetryIgnore;  
DialogResult result = MessageBox.Show(message, title, buttons, MessageBoxIcon.Warning);  
if (result == DialogResult.Abort) {  
    this.Close();  
}  
elseif(result == DialogResult.Retry) {  
    // Do nothing  
}  
else {  
    // Do something  
}  

// message box with title , message, icon and default buttonsstring message = "Do you want to abort this operation?";  
string title = "Close Window";  
MessageBoxButtons buttons = MessageBoxButtons.AbortRetryIgnore;  
DialogResult result = MessageBox.Show(message, title, buttons, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2);  
if (result == DialogResult.Abort) {  
    this.Close();  
}  
elseif(result == DialogResult.Retry) {  
    // Do nothing  
}  
else {  
    // Do something  
}  