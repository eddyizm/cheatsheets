using System;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MyDotNetApp
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            var splash = new SplashScreen();
            splash.Show();
            // continue gui process
            Application.DoEvents();
            // create new main form
            var main = new frmMain();
            Application.DoEvents();
            // create event to make sure form is ready to show before closing slpash
            main.Shown += (sender, args) =>
            {
                splash.Close();
            };

            Application.Run(mainForm);
        }
    }
}
