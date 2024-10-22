fn process_str(s: String) {}
fn process_simple(input: u32) {}


fn longest_word<'a>(x: &'a String, y: &'a String) -> &'a String {
    // Make sure to declare generic lifetime parameters inside angle brackets, and add the declaration between the parameter list and the function name.
    if x.len() > y.len() {
        x
    } else {
        y
    }
}

#[derive(Debug)]
struct Highlight<'document>(&'document str);

pub fn annotated_lifetimes_in_types() {
    let text = String::from("The quick brown fox jumps over the lazy dog.");
    let fox = Highlight(&text[4..19]);
    let dog = Highlight(&text[35..43]);
    println!("{:?}", fox);
    println!("{:?}", dog);
}

fn print_greeting(message: &String) {
    println!("Greeting: {}", message);
  }


fn change(text: &mut String) {
    text.push_str(", world");
    println!("{}", text)
    // With & borrows, known as "immutable borrows," we can read the data but we can't change it. 
    // With &mut borrows, known as "mutable borrows," we can both read and change the data.
}

pub fn ownership_ex(){
    
    { // scope
        let mascot = String::from("ferris");
        // transfer ownership of mascot to the variable ferris.
        let ferris = mascot;
        println!("{}", ferris)
    }
    
    let n = 1u32;
    process_simple(n); // Ownership of the number in `n` copied into `process`
    process_simple(n); // `n` can be used again because it wasn't moved, it was copied.

    // Copying types that don't implement Copy
    let s = String::from("Hello, world!");
    process_str(s.clone()); // Passing another value, cloned from `s`.
    process_str(s); // s was never moved and so it can still be used.

    // ferris is dropped here. The string data memory will be freed here.
    // let greeting = String::from("hello");
    // let greeting_reference = &greeting; // We borrow `greeting` but the string data is still owned by `greeting`
    // println!("Greeting: {}", greeting); // We can still use `greeting`

    let greeting = String::from("Hello");
    print_greeting(&greeting); // `print_greeting` takes a `&String` not an owned `String` so we borrow `greeting` with `&`
    print_greeting(&greeting); // Since `greeting` didn't move into `print_greeting` we can use it again

    let mut greeting = String::from("hello");
    change(&mut greeting);

}