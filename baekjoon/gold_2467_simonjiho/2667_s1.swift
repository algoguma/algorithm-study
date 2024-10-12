
import Foundation


let numOfLines = Int(readLine()!)!
var isHouse:[[Bool]] = Array(repeating: [], count: numOfLines)
var visited:[[Bool]] = Array(repeating: Array(repeating:false, count:numOfLines), count: numOfLines)
var houseCount = 0
for i in 0..<numOfLines {
    let input = readLine()!
    for elm in input {
        if elm == "0" {
            isHouse[i].append(false)
        } else if elm == "1" {
            isHouse[i].append(true)
        }
    }
}

var numOfGroups:Int = 0
var numOfHouses:[Int] = []

for i in 0..<numOfLines {
    for j in 0..<numOfLines {
        if isHouse[i][j] && !visited[i][j] {
            numOfGroups += 1
            houseCount = 0
            dfs(i,j)
            numOfHouses.append(houseCount)
        }
    }
}

func dfs(_ r:Int, _ c:Int) {
    
    if visited[r][c] || !isHouse[r][c] { return }
    
    visited[r][c] = true
    houseCount += 1
    
    if r+1 < numOfLines { dfs(r+1,c) }
    if r-1 >= 0 { dfs(r-1,c) }
    if c+1 < numOfLines { dfs(r,c+1) }
    if c-1 >= 0 { dfs(r,c-1) }

    
}

print(numOfGroups)
numOfHouses.sort()
for num in numOfHouses {
    print(num)
}


//print(isHouse)
