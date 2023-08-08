fn main(mut public_grid : pub [Field; 81], solution : [Field; 81]) {
    for row in 0..9 {
        for col in 0..9 {
            let index = 9*row+col;
            if public_grid[index] == 0 {
                public_grid[index] = solution[index];
            }
        }
    }

    // check rows
    for row in 0..9 {
        let mut sum = 0;
        let mut product = 1;
        for col in 0..9 {
            let index = 9*row+col;
            sum += public_grid[index];
            product *= public_grid[index];
        }
        assert(sum == 45);
        assert(product == 362880);
    }

    // check columns
    for col in 0..9 {
        let mut sum = 0;
        let mut product = 1;
        for row in 0..9 {
            let index = 9*row+col;
            sum += public_grid[index];
            product *= public_grid[index];
        }
        assert(sum == 45);
        assert(product == 362880);
    }

    // check squares
    for square_row in 0..3 {
        for square_col in 0..3 {
            let mut sum = 0;
            let mut product = 1;
            for row in 0..3 {
                for col in 0..3 {
                    let index = 9*(3*square_row+row) + 3*square_col+col;
                    sum += public_grid[index];
                    product *= public_grid[index];
                }
            }
            assert(sum == 45);
            assert(product == 362880);
        }
    }
}

#[test]
fn test_main() {
    // noir doesn't support nested arrays yet, so we have to flatten the grid
    let public_grid = [
        0, 0, 1, 0, 0, 4, 0, 9, 0,
        4, 0, 0, 0, 0, 0, 1, 0, 7,
        0, 8, 0, 7, 0, 0, 0, 0, 4,
        9, 0, 0, 0, 1, 0, 8, 0, 0,
        0, 0, 0, 8, 0, 7, 0, 0, 0,
        0, 0, 8, 0, 6, 0, 0, 0, 1,
        8, 0, 0, 0, 0, 5, 0, 1, 0,
        6, 0, 5, 0, 0, 0, 0, 0, 9,
        0, 1, 0, 9, 0, 0, 4, 0, 0
    ];

    let solution = [
        5, 7, 0, 6, 2, 0, 3, 0, 8,
        0, 2, 6, 3, 8, 9, 0, 5, 0,
        3, 0, 9, 0, 5, 1, 2, 6, 0,
        0, 5, 7, 4, 0, 2, 0, 3, 6,
        1, 6, 3, 0, 9, 0, 5, 4, 2,
        2, 4, 0, 5, 0, 3, 9, 7, 0,
        0, 9, 4, 2, 7, 0, 6, 0, 3,
        0, 3, 0, 1, 4, 8, 7, 2, 0,
        7, 0, 2, 0, 3, 6, 0, 8, 5,
    ];
    
    main(public_grid, solution);
}
