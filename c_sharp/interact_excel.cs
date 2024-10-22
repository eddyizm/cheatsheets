/* interacting with excel files */
// import using as an alias
using XL = Microsoft.Office.Interop.Excel;


// refreshing excel 

 /// <summary>
        /// Open Excel file and refresh all data sources.
        /// </summary>
        /// <param name="incomingFile"></param>
        private static void RefreshExcel(string incomingFile)
        {
            try
            {
                if (File.Exists(incomingFile))
                {
                    Logger.Info($"Refreshing All Data - {incomingFile}");
                    XL.Application xlapp = new XL.Application();
                    xlapp.Visible = false;
                    XL.Workbook wb = xlapp.Workbooks.Open(incomingFile);
                    wb.RefreshAll();
                    System.Threading.Thread.Sleep(5000);
                    wb.Save();
                    wb.Close();
                    xlapp.Quit();
                    wb = null;
                    Logger.Info($"Excel refreshed and closed - {incomingFile}");
                }
                else
                {
                    Logger.Error($"Excel file not found! - {incomingFile}");
                }
                
                
            }
            catch (Exception ex)
            {
                Logger.Error(ex, "Error in RefreshingExcel");
            }
            
        }

          /* settings to block pop ups */
          // adjust properties to ignore pop ups link updates 
          XL.Application xlapp = new XL.Application();
          xlapp.Application.AskToUpdateLinks = false;
          xlapp.DisplayAlerts = false;
          xlapp.Interactive = false;
      
      private static void CopyWorkSheet(string sourceFile, string destFile)
      {
        XL.Application xlapp = new XL.Application();
        // open source
        XL.Workbook wb = xlapp.Workbooks.Open(sourceFile);
        // thread sleep to wait for opening large files
        System.Threading.Thread.Sleep(5000);
                        
        // open destination
        XL.Workbook new_wb = xlapp.Workbooks.Open(destFile);
        System.Threading.Thread.Sleep(5000);
        XL.Worksheet origin_sheet = wb.Worksheets[1];

        origin_sheet.Copy(missing, new_wb.Worksheets[1]);
        
        // save and close workbooks
        wb.Save();
        wb.Close();
        new_wb.Save();
        new_wb.Close();
        xlapp.Quit();
        xlapp = null;
      }