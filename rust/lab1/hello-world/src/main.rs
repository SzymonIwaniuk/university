// const LENGHT: u16 = 3;
use std::io;


fn game(board, symbol, num) -> bool {
    let row: u16 = num / 3;
    let col: u16 = num % 3;
    
    if board[row][col] !=  " ":

}

fn main() {
    let mut win: bool = true;
    let mut symbol = "X";
    let mut board = [[' '; 3]; 3];
    board[0][0] = 'x';
    board[0][1] = 'o';

    while win {
        println!("Gracz {}, Twój ruch (wprowadź numer pola od 1 do 9):", symbol)
        player = !player
        let mut user_input = String::new();
        let mut cmd: char;

        println!("Type your command:");
        let _ = io::stdin().read_line(&mut user_input); // get string from the user input
        cmd = user_input.chars().nth(0).unwrap(); // get the first char from the given string
        game(cmd)

    }

    let mut user_input = String::new();
    let mut cmd : char;

    let board_vis = {
        let mut i = 0;
        while i < 3 {
            println!("{:?}", board[i]);
            i += 1;
        };
    };

    println!("{:?}", board_vis);

}
