<#
The universe of the Game of Life is a grid of square cells, each of which is either alive ("#") or dead ("."). Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:

* Any dead cell with exactly three live neighbours becomes a live cell.
* All other dead cells stay dead.
* Any live cell with two or three live neighbours survives.
* All other live cells die.
Given a 32×32 grid, output the state in the next step. Assume that every cell outside the grid is dead.

# Example Input                     # Example Output  
................................    ......###....#..........#....#..
..##.#####..###......#.###..###.    ..#...#####.###...#...##..###.#.
.#......#.###..#.###..#.###.###.    ..#.##.........###.#............
.....#..######.#..##.##.######..    .......##....#.#.....##.........
.#......#.###..#.###..#.#.##.#..    .#.####.#......#......#.#....##.
.####.##......#.##..#..#..##..#.    ##.#...##....##.....###.#.....#.
.#......#.###..#.###..#.#..###..    .#.####.#......#......#.#....##.
.....#..######.#..##.##.#.##.#..    ....##..#....#.#..............#.
....##...###.#.##.#####...####..    ....####..............#.......#.
.##...#.#..##.##.#.#....#.#.#.#.    .##.....#..#.....#.....##...#.#.
..######.#...##.#...##.#.##...#.    ............#.....######......##
.####.##......#.##..#..#.#.####.    ........#.........#...#....##.#.
.##.#.#....#..####.##....##..#..    #...#.#.#..#.##....####.........
.#.#...##.#.#....##...###.#.##..    .#......#####.....#...##..#####.
..######.#...##.#...##.#.#....#.    .........#...##.#.####...###..#.
.####.##......#.##..#..#...#.#..    .#...........##...#.#..#..#.###.
.#.##..#..#.....###.#.##.#..#.#.    .#.......#....#.#.###....#....#.
..##.#####..###......#.##.#####.    .#.#.##.....####....##.........#
.#......#.###..#.###..#.####.##.    .#.###....#....##.##...........#
.##..#..#.#.#.##...########.###.    .#..#..##.....##......#.........
..###..#.###.#...##.#...##.###..    ....##.......#.#.#.........#....
..#.#....##..#.#.####..##....##.    .#...#................#....#..#.
..###..#.###...#..####.##...#...    .#.....#.............#...#..#.#.
.#.#.####..#######.#..##.#...#..    .#...#.......#.#......#..##..#..
..###..#.###.#...##.#...#.####..    .#.....#............###...##..#.
..#.#....##..#.#.####..##...##..    ..#.#......#.#.#....#..#......#.
....#.#..#...#.#####...#.###..#.    ..#.##.#.......#.....##...#...#.
..##...########..#..#.#.#.#.##..    ..###.....##........#...#.#.....
.#...##.#...#.###..#.###....###.    .#........#....#####..........#.
..#.####.....#...#..#.#.####....    .##......###.....#.........#..#.
..#.####.###.#####.##..###.#..#.    ....#..##.#.##########.#...#....
................................    .....##...#...###.......#.......

#>

$level = @"
................................
..##.#####..###......#.######...
.#......#.###..#.###..#.#.#..##.
.....#..######.#..##.##.###.#...
.#......#.###..#.###..#.#..####.
.####.##......#.##..#..#.###....
.#......#.###..#.###..#.##.##.#.
.....#..######.#..##.##.###..#..
....##...###.#.##.#####....#..#.
.##...#.#..##.##.#.#....#.#.###.
..######.#...##.#...##.#..#.###.
.####.##......#.##..#..#...#..#.
.##.#.#....#..####.##.......#.#.
.#.#...##.#.#....##...#####.##..
..######.#...##.#...##.#.##...#.
.####.##......#.##..#..#..#..#..
.#.##..#..#.....###.#.##........
..##.#####..###......#.##.#.#.#.
.#......#.###..#.###..#.#..###..
.##..#..#.#.#.##...######..#..#.
..###..#.###.#...##.#...#####.#.
..#.#....##..#.#.####..##.##.##.
..###..#.###...#..####.##.##....
.#.#.####..#######.#..##.#.#..#.
..###..#.###.#...##.#...#.#..##.
..#.#....##..#.#.####..##..##.#.
....#.#..#...#.#####...#.#..#...
..##...########..#..#.#.#####...
.#...##.#...#.###..#.###.#.####.
...#.##.#.##.#.###..#..#..#.###.
..######.#.....#.#.##..###.###..
................................
"@
# . = 46 % 2 = 0
# # = 35 % 2 = 1



$map = $level -split "`n"
$step=@{}
0..32|?{
    $r=$_
    $step[$r]=@{}
    0..32|?{
        
        $t = 0+$map[$r-1][$_-1] + $map[($r+1)%32][$_-1] + $map[$r-1][($_+1)%32] + $map[($r+1)%32][($_+1)%32]
        $step[$r][$_]= $t -eq 105 ? '#' : ($t -eq 162 ? $map[$r][$_] : ".") 
}}
0..32|%{
    $step[$_].values -join ''
}