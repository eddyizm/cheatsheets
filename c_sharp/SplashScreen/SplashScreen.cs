using System.Drawing;
using System.Windows.Forms;

namespace MyDotNetApp
{
    public partial class SplashScreen : Form
    {
         public SplashScreen()
        {
            InitializeComponent();
            // matching image background color, leaving border.
            pictureBoxSplash.BackColor = Color.FromArgb(250, 52, 71);
            // if a text is needed, make sure it matches the background
            labelSplashWelcome.BackColor = Color.FromArgb(250, 52, 71);
        }

    }
}
