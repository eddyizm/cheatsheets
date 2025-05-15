// create an editable DataGridView without validation until saving
dgv.CausesValidation = false;

// change cell/row formatting based on data on prepaint instead of looping through dgv after being rendered

this.dataGridView1.RowPrePaint 
    += new System.Windows.Forms.DataGridViewRowPrePaintEventHandler(
        this.dataGridView1_RowPrePaint);

private void dataGridView1_RowPrePaint(object sender, DataGridViewRowPrePaintEventArgs e)
{
    if (Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells[7].Text) < Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells[10].Text)) 
    {
        dataGridView1.Rows[e.RowIndex].DefaultCellStyle.BackColor = Color.Beige;
    }
}
        

// change order of columns [programmatically.

private void AdjustColumnOrder()
{
    customersDataGridView.Columns["CustomerID"].Visible = false;
    customersDataGridView.Columns["ContactName"].DisplayIndex = 0;
    customersDataGridView.Columns["ContactTitle"].DisplayIndex = 1;
    customersDataGridView.Columns["City"].DisplayIndex = 2;
    customersDataGridView.Columns["Country"].DisplayIndex = 3;
    customersDataGridView.Columns["CompanyName"].DisplayIndex = 4;
}]

// change data grid column namespace

dataGridView1.Columns[0].HeaderCell.Value = "Created";

/* populate datagrid with array */

int[] theData = new int[] { 14, 17, 5, 11, 2 };
dataGridView1.DataSource = theData.Where(x => x>0).Select((x, index) =>
    new { RecNo = index + 1, ColumnName = x }).OrderByDescending(x => x.ColumnName).ToList();
	
// using a class to binding list is cleaner.  
Class Person()
// where persons is the class model objects. 

var list = new BindingList<Person>(persons);
myGrid.DataSource = list;

// clean up ui quickly 
// where datagridview is dgv
dgv.RowHeadersVisible = false;

dgv.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;
dgv.AutoGenerateColumns = false;
dgv.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

dgv.AllowUserToAddRows = false;
dgv.AllowUserToDeleteRows = false;
dgv.AllowUserToResizeColumns = true;
dgv.AllowUserToResizeRows = false;
dgv.ReadOnly = true; // this will do the trick for removing any editing to the cells.



// loop through all rows in datagrid

foreach (DataGridViewRow row in datagridviews.Rows)
{
   currQty += row.Cells["qty"].Value;
   //More code here
}

// remove red x 
ControlBox = false; // available in GUI

