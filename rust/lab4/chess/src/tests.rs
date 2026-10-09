use super::*;

#[test]
fn test_pawn_move() {
    let mut white_pawn = Chessman::Pawn {
        position: Position { x: 1, y: 2 },
        color: Color::White,
    };
    assert_eq!(white_pawn.move_to(Position { x: 1, y: 3 }), true);
    assert_eq!(white_pawn.move_to(Position { x: 1, y: 5 }), false);

    let mut black_pawn = Chessman::Pawn {
        position: Position { x: 5, y: 6 },
        color: Color::Black,
    };
    assert_eq!(black_pawn.move_to(Position { x: 5, y: 5 }), true);
    assert_eq!(black_pawn.move_to(Position { x: 5, y: 6 }), false);
}

#[test]
fn test_knight_move() {
    let mut knight = Chessman::Knight {
        position: Position { x: 3, y: 3 },
        color: Color::White,
    };
    assert_eq!(knight.move_to(Position { x: 4, y: 5 }), true);
    assert_eq!(knight.move_to(Position { x: 5, y: 5 }), false);
    assert_eq!(knight.move_to(Position { x: 2, y: 4 }), true);
}

#[test]
fn test_bishop_move() {
    let mut bishop = Chessman::Bishop {
        position: Position { x: 3, y: 3 },
        color: Color::Black,
    };
    assert_eq!(bishop.move_to(Position { x: 6, y: 6 }), true);
    assert_eq!(bishop.move_to(Position { x: 6, y: 7 }), false);
    assert_eq!(bishop.move_to(Position { x: 1, y: 1 }), true);
}

#[test]
fn test_rook_move() {
    let mut rook = Chessman::Rook {
        position: Position { x: 3, y: 3 },
        color: Color::White,
    };
    assert_eq!(rook.move_to(Position { x: 3, y: 7 }), true);
    assert_eq!(rook.move_to(Position { x: 7, y: 7 }), true);
    assert_eq!(rook.move_to(Position { x: 5, y: 5 }), false);
}

#[test]
fn test_queen_move() {
    let mut queen = Chessman::Queen {
        position: Position { x: 3, y: 3 },
        color: Color::White,
    };
    assert_eq!(queen.move_to(Position { x: 7, y: 3 }), true);
    assert_eq!(queen.move_to(Position { x: 4, y: 6 }), true);
    assert_eq!(queen.move_to(Position { x: 5, y: 8 }), false);
}

#[test]
fn test_king_move() {
    let mut king = Chessman::King {
        position: Position { x: 3, y: 3 },
        color: Color::Black,
    };
    assert_eq!(king.move_to(Position { x: 4, y: 4 }), true);
    assert_eq!(king.move_to(Position { x: 5, y: 4 }), true);
    assert_eq!(king.move_to(Position { x: 5, y: 6 }), false);
}
