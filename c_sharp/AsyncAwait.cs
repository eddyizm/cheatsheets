// add async with picture loading box
public async void LargeMethod()
{
    pictureLoadingBox.BringToFront();
    pictureLoadingBox.Show();
    pictureLoadingBox.Update();
    
    await Task.Run(() => {
        // call long running method here 
    });
    
    pictureLoadingBox.Hide();
}