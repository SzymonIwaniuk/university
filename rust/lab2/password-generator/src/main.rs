#![allow(dead_code)]
use rand::Rng;

const LOWERCASE: &[u8] = b"abcdefghijklmnopqrstuvwxyz";
const UPPERCASE: &[u8] = b"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
const DIGITS: &[u8] = b"0123456789";
const SPECIAL: &[u8] = b"!@#$%^&*()-_=+[]{}|;:',.<>?/";
const EMPTY: &[u8] = b"";

// I would do it like privigiles to fiels/dirs rwx and we can achieve all combinations
//
fn main() {
    let n: usize = 12;
    let password: String = generate_password(n, [LOWERCASE, UPPERCASE, EMPTY, EMPTY]);
    println!("{}", password);
}

fn generate_password(mut len: usize, charsets: [&[u8]; 4]) -> String {
    let mut rng = rand::rng();
    let mut password = String::with_capacity(len);
    let mut lenghts = [0usize; 4];

    for i in 0..4 {
        let lenght = charsets[i].len();
        lenghts[i] = lenght;
    }

    loop {
        let rand_n1 = rng.random_range(0..4);
        if lenghts[rand_n1] != 0 {
            let rand_n2 = rng.random_range(0..lenghts[rand_n1]);
            password.push(charsets[rand_n1][rand_n2] as char);
            len = len - 1;
        }
        if len == 0 {
            break;
        }
    }
    return password;
}
