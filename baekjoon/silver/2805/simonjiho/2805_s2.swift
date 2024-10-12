import Foundation

let input = readLine()!.split(separator:" ").map { Int($0)! }
let N:Int = input[0]
let M:Int = input[1]



//var trees:[Int] = []
let trees:[Int] = Array(readLine()!.split(separator:" ").map { Int($0)! })
let trees_sorted:[Int] = trees.sorted()


var leftVal:Int = 0
var rightVal:Int = trees_sorted.last!

var maxVal:Int = 0

while leftVal <= rightVal {
    let mid = leftVal + (rightVal-leftVal) / 2
    if let idx = trees_sorted.firstIndex(where:{$0 >= mid}) {
        let returnSum:Int = trees_sorted[idx...].reduce(0,+) - (N - idx)*mid
        
        if returnSum <= M {
            rightVal = mid - 1
            if returnSum == M {maxVal = max(mid,maxVal)}
        } else {
            maxVal = max(mid,maxVal)
            leftVal = mid + 1
        }
    }
    else {
        break
    }
}

print(maxVal)
