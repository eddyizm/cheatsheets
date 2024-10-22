/******************************************************************
Polymorphism Overloading example
Polymorphism is a concept, which allows us to redefine the way something works, by either changing how it is done or by changing the parts used to get it done. This can be done in two ways, overloading and overriding.

*******************************************************************/
If we walk using our hands, and not legs, here we will change the parts used to perform something. Hence this is called Overloading.
*/

using System; 

namespace polymorphismExample 
{ 
  public class Numbers 
  {
    public void addition(int a, int b)
    {
      Console.WriteLine(a + b);
    }
    public void addition(int a, int b, int c)
    {
      Console.WriteLine(a + b + c );
    } 
  } 
  
  public class Display
  {
    static void Main(string[] args) 
    { 
      Numbers obj = new Numbers();
      obj.addition(3, 7);
      obj.addition(9, 4, 2);
      Console.ReadKey(); 
    } 
  }
}

/******************************************************************


Polymorphism Overide example


*******************************************************************/

using System; 

namespace polymorphismExample 
{ 
  public class parentClass 
  {
    public virtual void Display()
    {
      Console.WriteLine("Hello! My name is Yann!");
    }
  } 
  
  public class childClass:parentClass 
  {
    public override void Display()
    {
      Console.WriteLine("Hello! Nice to meet you!");
    }
  } 
  
  public class Program
  {
    static void Main(string[] args) 
    { 
      parentClass obj = new childClass();
      obj.Display()
      Console.ReadKey(); 
    } 
  }
}