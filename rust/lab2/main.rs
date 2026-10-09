fn main() {
    let n = 5;
    
    process_number(n);
    process_number(n+1);
 
    let text = String::from("sample");
    
    process_text(&text);
    process_text(&text);
}
 
fn process_text(s : &String) {
    println!("Processing text: {}", s);
}
 
fn process_number(n : i32) {
    println!("Processing number: {}", n)
}
