// cast datasource to list and grab distinct values
var distinctValues = (dataGridView1.DataSource as List<YourClass>)?.Select(x => x.PropertyName).Distinct().ToList();

// select particular columns from object 
using (var context = new StackOverflowContext())
{
    var posts = context.Posts
                       .Where(p => p.Tags == "<sql-server>")
                       .Select(p => new {p.Id, p.Title});
 
    // Do something;
}


// inserting record
try
{
    using (eduardo_Entities db = new eduardo_Entities())
    {
        CallLog Call = new CallLog();
        Call.Subscriber_ID = _sub_id;
        Call.Status = _status;
        Call.call_notes = _call_notes;
        Call.create_date = DateTime.Now;
        Call.created_by = _ADUser;
        db.CallLogs.Add(Call);
        db.SaveChanges();
    }

}
catch (Exception)
{

    throw;
}

// filter list by field using case lower/upper
Where(x => x.FieldName.ToLower().ToContains(search_term)).ToList();

// filter list by field using case lower/upper - Dealing with null records in field using null operator
Where(x => (x.FieldName ?? "").ToLower().ToContains(search_term)).ToList();


// Get list of public properties of class/model
var listOfFieldNames = typeof(<Model>).GetProperties().Select(f => f.Name).ToList();

//define database/table context
 XMLTableDataContext db = new XMLTableDataContext();
 
//get max value from column (stagings is the table) 
var batchID = db.XMLReturnStagings.Max(x => x.batchID);

// same as above except with a condition (WHERE CLAUSE) 
var batchID = db.XMLReturnStagings.Where(r => r.status == 0).Max(m => m.batchID);

// same as above using different syntax SQL FRIENDLY
var batchID = (from i in db.XMLReturnStagings
               where i.status == 0
               select i.batchID).Max();
			   
// get first result from query with a condition (WHERE CLAUSE) Subquery on original data set <query>
var familyGroup = query.Where(f => f.status != 1).First(); /* If you expect that your query will not return any results, use FirstOrDefault() */

/// <summary>
///     Replacing a for each loop with linq statement. 
/// </summary>
students.ToList().ForEach(s => 
	{
		Console.WriteLine(s.ToString());
	});

	// take top 10 
	var batchID = db.XMLReturnStagings.Where(r => r.status == 0).Take(10)

/*
check if a value is in list 
returns boolean 
*/
var resultSet = students.ToList()
var testValue = "Hello"
var resultSet = checks.Contains(testValue);
Console.Write(resultSet.ToString());
	
// Order by multiple columns

var movies = _db.Movies.OrderBy(c => c.Category).ThenBy(n => n.Name)	

// Order by desc 
var studentsInDescOrder = studentList.OrderByDescending(s => s.StudentName);

// get count of query. 
 items.Where(x => x.ColumnCheck == null).ToList().Count;
 
 // distinct values (remove dupes)
var distinctItems = items.Distinct();

// select distinct column values
var result = EFContext.TestAddresses.Select(m => m.Name).Distinct();

// split array into chunks
string[] large_array 
int i = 0;
int chunkSize = 190;
string[][] result_chunk = large_array.GroupBy(s => i++ / chunkSize).Select(g => g.ToArray()).ToArray();

// filter list by extension (looking for zip files in this example)
var zips = fileList.Where(f => f.ToLower().EndsWith(".zip"));

// update multiple records against another list.
// list of datagridviewRowCollection 
DataGridViewRowCollection rows
 var object = db.EntityTable.Where(x => rows.Contains(x.ID)).ToList();
object.ForEach(s => s.field = <UpdateValue>);
db.SaveChanges();

// run raw update query 
using (yourDbEntities db = new yourDbEntities())
{
    db.Database.ExecuteSqlCommand("UPDATE <YourTABLE> SET Quantity = {0} WHERE Id = {1}", quantity, id);
}