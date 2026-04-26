use std::ops::{Add, Sub};

#[derive(Debug)]
struct Vec2D {
    x: f32,
    y: f32,
}

impl Vec2D {
    fn unit_vector() -> Vec2D {
        Vec2D { x: 1.0, y: 0.0 }
    }
}

impl PartialEq for Vec2D {
    fn eq(&self, other: &Self) -> bool {
        self.x == other.x && self.y == other.y
    }
}

impl Add for Vec2D {
    type Output = Self;

    fn add(self, other: Vec2D) -> Self {
        Self {
            x: self.x + other.x,
            y: self.y + other.y,
        }
    }
}

impl Sub for Vec2D {
    type Output = Self;

    fn sub(self, other: Vec2D) -> Self {
        Self {
            x: self.x - other.x,
            y: self.y - other.y,
        }
    }
}

fn main() {
    let v1 = Vec2D { x: 3.0, y: 4.0 };
    let v2 = Vec2D { x: 4.0, y: 5.0 };
    let unit_v = Vec2D::unit_vector();

    println!("{:?}", v1);
    println!("{:?}", v2);
    println!("{:?}", unit_v);

    let v3 = v1 + v2;
    println!("{:?}", v3);

    let v4 = v3 - unit_v;
    println!("{:?}", v4);

    let v5 = Vec2D { x: 3.0, y: 4.0 };
    let v6 = Vec2D { x: 3.0, y: 4.0 };

    if v5 == v6 {
        println!("vectors are equal");
    }
}
