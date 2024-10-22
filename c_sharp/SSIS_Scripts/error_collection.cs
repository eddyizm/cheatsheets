
/* SSIS collect error info to send via email if task fails */
"Package:                              "+ (DT_WSTR, 100)  @[System::PackageName] +"\n"+
"Time:                                      " + (DT_WSTR, 50) @[System::StartTime]+"\n"+ 
"Task:                                       "+  (DT_WSTR, 300) @[System::SourceName]  +"\n"+
"Error Description:                " + (DT_STR, 3000,1252)  @[System::ErrorDescription]