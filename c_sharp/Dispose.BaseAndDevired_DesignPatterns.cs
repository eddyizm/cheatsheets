// An example of a base class and derived class using Dispose() and Finalize() is below:
// Design pattern for a base class.
public class Base: IDisposable
	{
		//Implement IDisposable.
		public void Dispose() 
			{
			Dispose(true);
			GC.SuppressFinalize(this); 
			}

			protected virtual void Dispose(bool disposing) 
				{
				if (disposing) 
				{
				// Free other state (managed objects).
				}
				// Free your own state (unmanaged objects).
				// Set large fields to null.
				}

		// Use C# destructor syntax for finalization code.
		~Base()
			{
			// Simply call Dispose(false).
			Dispose (false);
			}
	}


// Design pattern for a derived class.
public class Derived: Base
	{   
		protected override void Dispose(bool disposing) 
			{
			if (disposing) 
			{
			// Release managed resources.
			}
			// Release unmanaged resources.
			// Set large fields to null.
			// Call Dispose on your base class.
			base.Dispose(disposing);
			}

		// The derived class does not have a Finalize method
		// or a Dispose method with parameters because it inherits
		// them from the base class.
	}
