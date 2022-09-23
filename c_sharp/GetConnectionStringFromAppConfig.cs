// Get connection string from app.config file
string ss = ConfigurationManager.ConnectionStrings["DatabaseConnectionName"].ConnectionString;
System.Data.EntityClient.EntityConnectionStringBuilder e = new System.Data.EntityClient.EntityConnectionStringBuilder(ss);
string ProviderConnectionString = e.ProviderConnectionString;
