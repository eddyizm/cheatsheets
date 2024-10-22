/* get version number */
using System.Reflection;
string version = Assembly.GetExecutingAssembly().GetName().Version.ToString();
// returns 1.0.0.0