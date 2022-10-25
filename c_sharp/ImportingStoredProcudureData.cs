/*
Grabbing all the data from a stored procedure into C# data

just construct your SELECT's and you will have a DataSet filled with all tables.
*/

using (System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(myConnString))
{
    using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand())
    {
        cmd.CommandText = "myMultipleTablesSP";
        cmd.Connection = conn;
        cmd.CommandType = CommandType.StoredProcedure;

        conn.Open();

        System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter(cmd);

        DataSet ds = new DataSet();
        adapter.Fill(ds);

        conn.Close();
    }
}
/*
if for example you return 2 tables in your SP, like:

SELECT * FROM [TableA];
SELECT * FROM [TableB];
you would access this tables as:
*/
DataTable tableA = ds.Tables[0];
DataTable tableB = ds.Tables[1];