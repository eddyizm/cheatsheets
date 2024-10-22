#[derive(Debug)]
struct Counter {
    length: usize,
    count: usize,
}

impl Counter {
    fn new(length: usize) -> Counter {
	    Counter {
	        count: 0,
	        length,
	    }
    }
}

impl Iterator for Counter {
    type Item = usize;

    fn next(&mut self) -> Option<Self::Item> {
    
        self.count += 1;
        if self.count <= self.length {
            Some(self.count)
        } else {
            None
        }
    }
}

pub fn main() {
    for number in Counter::new(10) {
        println!("{}", number);
    }

    let sum_until_10: usize = Counter::new(10).sum();
    assert_eq!(sum_until_10, 55);

    let powers_of_2: Vec<usize> = Counter::new(8).map(|n| 2usize.pow(n as u32)).collect();
    assert_eq!(powers_of_2, vec![2, 4, 8, 16, 32, 64, 128, 256]);
    
    // let mut counter = Counter::new(6);
    // println!("Counter just created: {:#?}", counter);

    // assert_eq!(counter.next(), Some(1));
    // assert_eq!(counter.next(), Some(2));
    // assert_eq!(counter.next(), Some(3));
    // assert_eq!(counter.next(), Some(4));
    // assert_eq!(counter.next(), Some(5));
    // assert_eq!(counter.next(), Some(6));
    // assert_eq!(counter.next(), None);
    // assert_eq!(counter.next(), None);  // further calls to `next` will return `None`
    // assert_eq!(counter.next(), None);

    // println!("Counter exhausted: {:#?}", counter);
}