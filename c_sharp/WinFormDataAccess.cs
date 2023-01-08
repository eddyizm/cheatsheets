// Lock form size
// code
this.MaximumSize = this.Size;
this.MinimumSize = this.Size;
// designer 
// Lock form
this.FormBorderStyle = FormBorderStyle.FixedDialog;

// disable maximize, minimize or close controls
In Properties, set

Control Box -> False
Minimize Box -> False
Maximize Box -> False
You'll do this in the designer.

// set up ADO.NET Entity Data Model for win forms. 
1. Add New ITEM > (visual c# items) Data > ADO.NET Entity Data Model
2. Name Model
3. Choose Model Contents > EF Designer from database
4. Set database connection
5. Choose entity framework version
6. Select objects (tables, views, stored procs)

// populate combobox

/* DAL CLASS */
    class DAL
    {
        public List<User> GetUserList()
        {
            try
            {
                using (Entities db = new Entities())
                {
                    var userlist = db.Users.Where(r => r.isAdmin == 0).ToList();
                    return userlist;
                }
            }
            catch (Exception ex)
            {
                return new List<User>();
            }
            
        }
    
    // entity object to combo box    
     
     private void LoadUsers()
        {
            DAL users = new DAL();
            var results = users.GetUserList().OrderBy(c => c.first_name);
            cbUsers.DataSource = results.ToList();
            cbUsers.ValueMember = "AD";
            cbUsers.DisplayMember = "first_name";
            cbUsers.SelectedItem = null;
            cbUsers.SelectedText = "< Select a User >";
            // verify in console first.
            results.ToList().ForEach(s =>
            {
                Console.WriteLine(s.AD);
                
            }
                );
            
        }
    }

       
/* If you want to react only when the user change the selected item in the combo box, then it is better to subscribe to SelectionChangeCommitted.        */

// entity object (table) to datagridview

// pull up column row value from datagridview

private void DgPartD_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
    {
        DataGridViewRow row = datagridview.CurrentRow;
        var sample = row.Cells["ColumnName"].Value.ToString();
        MessageBox.Show($"Row Clicked: {e.RowIndex}\nColumn: {sample}");
    }
    
.// set divider line in form using a label

Add a Label control to your form.
Set Label Text to empty.
Set BorderStyle to Fixed3D.
Set AutoSize to false.
Set Height to 2 (most easily accomplished by typing 2 into the Size/Height field under Label Properties).    

//To display an animated image on your Form,do the following;

1.)Drop a PictureBox on your Form.

2.)In the Properties Window of designer,change the image property so it contains the path to your image.

3.)Resize it as per your needs.