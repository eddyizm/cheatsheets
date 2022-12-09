/* singleton example */

// constructor in form 
namespace DesignPatternDemos.Singleton
class HelpForm : Form
{
   private static HelpForm _instance;
   public static HelpForm GetInstance()
   {
     if(_instance == null) _instance = new HelpForm();
     return _instance; 
   }
   
	private Letters()
		{
			InitializeComponent();
		}
		
   // added to deal with crash after x'ing window.
   private void intanceFormClosed(object sender, FormClosedEventArgs e)
	{
		_instance = null;
	}
}


// how to call form from above

private void heToolStripMenuItem_Click(object sender, EventArgs e)
{
     HelpForm form = HelpForm.GetInstance();
		if (!form.Visible)
		{
		   form.Show();
		   form.BringToFront();
		}
		else
		{
		    form.WindowState = FormWindowState.Normal;
			form.BringToFront();
			form.Focus();
        }
}