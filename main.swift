/*
Flood Fill
One pixel on a grayscale image changes color. Recolor all the adjacent pixels of the same color to the same new color.

Grayscale colors are simply numbers.
*/

func flood_fill(pixel_row: Int, pixel_column: Int, new_color: Int, image: [[Int]]) -> [[Int]] {
    var image = image
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: image[0].count), count: image.count)
    var queue: [[Int]] = []
    let color = image[pixel_row][pixel_column]
    queue.append([pixel_row, pixel_column])
    image[pixel_row][pixel_column] = new_color
    visited[pixel_row][pixel_column] = true
    
    func getNeighbors(_ root: [Int]) -> [[Int]] {
        let rowAdd = [1, 0, -1, 0]
        let colAdd = [0, 1, 0, -1]
        var neighbors: [[Int]] = []
        for i in 0..<4 {
            let row = rowAdd[i] + root[0]
            let col = colAdd[i] + root[1]
            if row < 0 || row > image.count - 1 || col < 0 || col > image[0].count - 1 {
                continue
            }
            neighbors.append([row, col])
        }
        return neighbors
    }
    
    while queue.count > 0 {
        let v = queue.removeFirst()
        
        for n in getNeighbors(v) {
            if !visited[n[0]][n[1]], image[n[0]][n[1]] == color {
                visited[n[0]][n[1]] = true
                image[n[0]][n[1]] = new_color
                queue.append(n)
            }
        }
    }
    
    return image
}
