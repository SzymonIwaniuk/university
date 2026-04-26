#![allow(dead_code)]
#[cfg(test)]
mod tests;

const KNIGHT_MOVES: [(i8, i8); 8] = [
    (-1, -2),
    (-1, 2),
    (1, -2),
    (1, 2),
    (-2, -1),
    (-2, 1),
    (2, -1),
    (2, 1),
];

const KING_MOVES: [(i8, i8); 8] = [
    (0, -1),
    (0, 1),
    (-1, 0),
    (1, 0),
    (-1, -1),
    (-1, 1),
    (1, -1),
    (1, 1),
];

enum Chessman {
    Pawn { position: Position, color: Color },
    Knight { position: Position, color: Color },
    Bishop { position: Position, color: Color },
    Rook { position: Position, color: Color },
    Queen { position: Position, color: Color },
    King { position: Position, color: Color },
}

#[derive(Copy, Clone)]
enum Color {
    White,
    Black,
}

#[derive(Copy, Clone)]
struct Position {
    x: u8,
    y: u8,
}

impl Chessman {
    fn move_to(&mut self, new_position: Position) -> bool {
        let is_valid = match self {
            Chessman::Pawn { position, color } => {
                Self::is_valid_pawn_move(*position, new_position, *color)
            }
            Chessman::Knight { position, .. } => {
                Self::is_valid_knight_move(*position, new_position)
            }
            Chessman::Bishop { position, .. } => {
                Self::is_valid_bishop_move(*position, new_position)
            }
            Chessman::Rook { position, .. } => Self::is_valid_rook_move(*position, new_position),
            Chessman::Queen { position, .. } => Self::is_valid_queen_move(*position, new_position),
            Chessman::King { position, .. } => Self::is_valid_king_move(*position, new_position),
        };

        if is_valid {
            match self {
                Chessman::Pawn { position, .. }
                | Chessman::Knight { position, .. }
                | Chessman::Bishop { position, .. }
                | Chessman::Rook { position, .. }
                | Chessman::Queen { position, .. }
                | Chessman::King { position, .. } => {
                    *position = new_position;
                }
            }
        }

        is_valid
    }

    fn is_valid_pawn_move(cur: Position, next: Position, color: Color) -> bool {
        match color {
            Color::White => cur.x == next.x && cur.y + 1 == next.y,
            Color::Black => cur.x == next.x && next.y + 1 == cur.y,
        }
    }

    fn is_valid_knight_move(cur: Position, next: Position) -> bool {
        for (x, y) in KNIGHT_MOVES {
            if (cur.x as i8 + x) == (next.x as i8) && (cur.y as i8 + y) == (next.y as i8) {
                return true;
            }
        }
        false
    }

    fn is_valid_bishop_move(cur: Position, next: Position) -> bool {
        if cur.x == next.x && cur.y == next.y {
            return false;
        }
        cur.x.abs_diff(next.x) == cur.y.abs_diff(next.y)
    }

    fn is_valid_rook_move(cur: Position, next: Position) -> bool {
        let x_abs = cur.x.abs_diff(next.x);
        let y_abs = cur.y.abs_diff(next.y);
        (x_abs == 0) ^ (y_abs == 0)
    }

    fn is_valid_queen_move(cur: Position, next: Position) -> bool {
        Self::is_valid_bishop_move(cur, next) || Self::is_valid_rook_move(cur, next)
    }

    fn is_valid_king_move(cur: Position, next: Position) -> bool {
        for (x, y) in KING_MOVES {
            if (cur.x as i8 + x) == (next.x as i8) && (cur.y as i8 + y) == (next.y as i8) {
                return true;
            }
        }
        false
    }
}

fn main() {
    println!("Chess");
}
