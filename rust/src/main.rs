// mod hello_world;
// mod break_sample;
// mod main_loops;
// mod error_handling_sample;
// mod hash_map_sample;
// mod build_name;
// mod enum_sample;
// mod if_else_sample;
// mod result_sample;
// mod vector_sample;
// mod ownership_example;


// TODO: modify only this function.
fn copy_and_return<'a>(vector: &'a mut Vec<String>, value: &'a str) -> &'a str {
    vector.push(String::from(value));
    return value

}

fn main(){
    let name1 = "Joe";
    let name2 = "Chris";
    let name3 = "Anne";

    let mut names = Vec::new();

    assert_eq!("Joe", copy_and_return(&mut names, &name1));
    assert_eq!("Chris", copy_and_return(&mut names, &name2));
    assert_eq!("Anne", copy_and_return(&mut names, &name3));

    assert_eq!(
        names,
        vec!["Joe".to_string(), "Chris".to_string(), "Anne".to_string()]
    )

    // ownership_example::annotated_lifetimes_in_types();
    // vector_sample::main_vector();
    // result_sample::main_division_example()
    // if_else_sample::as_expression();
    // if_else_sample::multiple_conditions();
    // if_else_sample::declare_and_set();
    // if_else_sample::if_else();
    //enum_sample::enum_exercise();
    //build_name::name_exercise();
    //hash_map_sample::hash_sample();
    //error_handling_sample::er_sample();
    //main_loops::create_cars()
    //break_sample::main();
    //hello_world::hw();
}