pub fn hw() {
	println!("Hello, world!");
	// shadowing
	// Declare first variable binding with name "shadow_num"
	let shadow_num = 5;

	// Declare second variable binding, shadows existing variable "shadow_num" 
	let shadow_num = shadow_num + 5; 

	// Declare third variable binding, shadows second binding of variable "shadow_num"
	let shadow_num = shadow_num * 2; 

	println!("The number is {}.", shadow_num);

	// Addition, Subtraction, and Multiplication
	println!("1 + 2 = {} and 8 - 5 = {} and 15 * 3 = {}", 1u32 + 2, 8i32 - 5, 15 * 3);

	// Integer and Floating point division
	println!("9 / 2 = {} but 9.0 / 2.0 = {}", 9u32 / 2, 9.0 / 2.0);

	// Declare variable to store result of "greater than" test, Is 1 > 4? -- false
	let is_bigger = 1 > 4;
	println!("Is 1 > 4? {}", is_bigger);

	// Specify the data type "char"
	let character_1: char = 'S';
	let character_2: char = 'f';
	
	// Compiler interprets a single item in quotations as the "char" data type
	let smiley_face = '😃';

	// Compiler interprets a series of items in quotations as a "str" data type and creates a "&str" reference
	let string_1 = "miley ";

	// Specify the data type "str" with the reference syntax "&str"
	let string_2: &str = "ace";

	println!("{} is a {}{}{}{}.", smiley_face, character_1, string_1, character_2, string_2);

	// Declare a tuple of three elements
	let tuple_e = ('E', 5i32, true);

	// Use tuple indexing and show the values of the elements in the tuple
	println!("Is '{}' the {}th letter of the alphabet? {}", tuple_e.0, tuple_e.1, tuple_e.2);

	// Classic struct with named fields
	struct Student { name: String, level: u8, remote: bool }

	// Tuple struct with data types only
	struct Grades(char, char, char, char, f32);

	// Unit struct
	struct Unit;

	// Instantiate classic struct, specify fields in random order, or in specified order
	let user_1 = Student { name: String::from("Constance Sharma"), remote: true, level: 2 };
	let user_2 = Student { name: String::from("Dyson Tan"), level: 5, remote: false };

	// Instantiate tuple structs, pass values in same order as types defined
	let mark_1 = Grades('A', 'A', 'B', 'A', 3.75);
	let mark_2 = Grades('B', 'A', 'A', 'C', 3.25);

	println!("{}, level {}. Remote: {}. Grades: {}, {}, {}, {}. Average: {}", 
			user_1.name, user_1.level, user_1.remote, mark_1.0, mark_1.1, mark_1.2, mark_1.3, mark_1.4);
	println!("{}, level {}. Remote: {}. Grades: {}, {}, {}, {}. Average: {}", 
			user_2.name, user_2.level, user_2.remote, mark_2.0, mark_2.1, mark_2.2, mark_2.3, mark_2.4);


	let _user_2 = Student { name: String::from("Dyson Tan"), level: 5, remote: false };

}
