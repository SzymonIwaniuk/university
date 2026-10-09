use std::collections::HashSet;
use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    let digits: HashSet<char> = HashSet::from(['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']);
    let symbol: char = '-';
    let mut i: u32 = 10;
    let mut summ: u32 = 0;

    for c in args[1].chars() {
        if digits.contains(&c) {
            if i == 0 {
                println!("Wrong isbn number");
                return;
            }
            let num = c.to_digit(10).unwrap();
            summ = summ + num * i;
            i = i - 1;
        } else if c != symbol {
            println!("Wrong isbn number");
            return;
        }
    }

    if i != 0 {
        println!("Wrong isbn number");
        return;
    }

    if summ % 11 == 0 {
        println!("Correct isbn number");
    } else {
        println!("Wrong isbn number");
    }
}
