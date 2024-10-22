#[derive(PartialEq, Debug)]
struct Car {
    color: String,
    motor: Transmission,
    roof: bool,
    age: (Age, u32),
}

#[derive(PartialEq, Debug)]
enum Transmission {
    Manual,
    SemiAuto,
    Automatic,
}

#[derive(PartialEq, Debug)]
enum Age {
    New,
    Used,
}

// Get the car quality by testing the value of the input argument
// - miles (u32)
// Return tuple with car age ("New" or "Used") and mileage
fn car_quality(miles: u32) -> (Age, u32) {
    // Check if car has accumulated miles
    // Return tuple early for Used car
    if miles > 0 {
        return (Age::Used, miles);
    }

    // Return tuple for New car, no need for "return" keyword or semicolon
    (Age::New, miles)
}

// Build "Car" using input arguments
fn car_factory(order: i32, miles: u32) -> Car {
    let colors = ["Blue", "Green", "Red", "Silver"];

    // Prevent panic: Check color index, reset as needed
    // If color = 1, 2, 3, or 4 - no change needed
    // If color > 4, reduce to color to a valid index
    let mut color = order as usize;
    while color > 4 {
        color = color - 4;
    }

    // Add variety to orders for motor type and roof type
    let mut motor = Transmission::Manual;
    let mut roof = true;
    if order % 3 == 0 {
        // 3, 6, 9
        motor = Transmission::Automatic;
    } else if order % 2 == 0 {
        // 2, 4, 8, 10
        motor = Transmission::SemiAuto;
        roof = false;
    } // 1, 5, 7, 11

    // Return requested "Car"
    Car {
        color: String::from(colors[(color - 1) as usize]),
        motor: motor,
        roof: roof,
        age: car_quality(miles),
    }
}

pub fn create_cars() {
    // Initialize a hash map for the car orders
    // - Key: Car order number, i32
    // - Value: Car order details, Car struct
    use std::collections::HashMap;
    let mut orders: HashMap<i32, Car> = HashMap::new();

    // // Declare a car as mutable "Car" struct
    let mut car: Car;

    let mut miles = 0;

    for order in 1..12 {
        // Call car_factory to fulfill order
        // Add order <K, V> pair to "orders" hash map
        // Call println! to show order details from the hash map
        car = car_factory(order, miles);
        orders.insert(order, car);
        println!("Car order {}: {:?}", order, orders.get(&order));

        // Reset miles for order variety
        if miles == 2100 {
            miles = 0;
        } else {
            miles = miles + 700;
        }
    }

    // // Initialize counter variable
    // let mut order = 1;
    // // Declare a car as mutable "Car" struct
    // let mut car: Car;

    // // Order 6 cars, increment "order" for each request
    // // Car order #1: Used, Hard top
    // car = car_factory(order, 1000);
    // orders.insert(order, car);
    // println!("Car order {}: {:?}", order, orders.get(&order));

    // // Car order #2: Used, Convertible
    // order = order + 1;
    // car = car_factory(order, 2000);
    // orders.insert(order, car);
    // println!("Car order {}: {:?}", order, orders.get(&order));

    // // Car order #3: New, Hard top
    // order = order + 1;
    // car = car_factory(order, 0);
    // orders.insert(order, car);
    // println!("Car order {}: {:?}", order, orders.get(&order));

    // // Car order #4: New, Convertible
    // order = order + 1;
    // car = car_factory(order, 0);
    // orders.insert(order, car);
    // println!("Car order {}: {:?}", order, orders.get(&order));

    // // Car order #5: Used, Hard top
    // order = order + 1;
    // car = car_factory(order, 3000);
    // orders.insert(order, car);
    // println!("Car order {}: {:?}", order, orders.get(&order));

    // // Car order #6: Used, Hard top
    // order = order + 1;
    // car = car_factory(order, 4000);
    // orders.insert(order, car);
    // println!("Car order {}: {:?}", order, orders.get(&order));
}
