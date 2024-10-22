
/* Count Input Validation Sample */
    private void txBxCount_KeyDown(object sender, KeyEventArgs e)
    {
        // allow delete, backspace, TAB, and Enter Key
        if (e.KeyValue == 46 || e.KeyValue == 8 || e.KeyValue == 9 || e.KeyValue == 13)
        {
            e.SuppressKeyPress = false;
        }
        
        // restrict all other NON Number keys
        else if (e.KeyData < Keys.D0 || e.KeyData > Keys.D9)
        {
            if (e.KeyData < Keys.NumPad0 || e.KeyData > Keys.NumPad9)
            { 
                 e.SuppressKeyPress = true;
            } 
        }
        else
        {
            e.SuppressKeyPress = false;
        }
    }