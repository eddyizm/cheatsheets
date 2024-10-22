pub fn if_else() {
    if 1 == 2 {
        println!("True, the numbers are equal."); //
    } else {
        println!("False, the numbers are not equal.");
    }
}

pub fn as_expression() {
    let formal = true;
    let greeting = if formal {
        // if used here as an expression
        "Good day to you." // return a String
    } else {
        "Hey!" // return a String
    };
    println!("{}", greeting) // prints "Good day to you."
}

pub fn declare_and_set() {
    let formal = true;
    let greeting: &str;

    if formal {
        greeting = "Good day to you.";
    } else {
        greeting = "Hey!";
    };

    println!("{}", greeting) // prints "Good day to you."
}

pub fn multiple_conditions() {
    let num = 500; // num variable can be set at some point in the program
    let out_of_range: bool;
    if num < 0 {
        out_of_range = true;
    } else if num == 0 {
        out_of_range = true;
    } else if num > 512 {
        out_of_range = true;
    } else {
        out_of_range = false;
    }
}
