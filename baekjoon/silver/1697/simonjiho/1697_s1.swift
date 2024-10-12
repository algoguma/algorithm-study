import Foundation


let input = readLine()!.split(separator:" ").map { Int($0)! }
var N:Int = input[0]
let K:Int = input[1]

var nums:[Int?] = Array(repeating:nil,count:100001)

var ans:Int = 0
nums[N] = ans


var curQueue: Set<Int> = [N]

while nums[K] == nil {
    var nextQueue: Set<Int> = []
    ans += 1
    for idx in curQueue {
        if idx+1 <= 100000 {
            if nums[idx+1] == nil {
                nums[idx+1] = ans
                nextQueue.insert(idx+1)
            }
        }
        if idx-1 >= 0 {
            if nums[idx-1] == nil {
                nums[idx-1] = ans
                nextQueue.insert(idx-1)
            }
        }
        if idx*2 <= 100000 {
            if nums[idx*2] == nil {
                nums[idx*2] = ans
                nextQueue.insert(idx*2)
            }
        }
    }
    curQueue = nextQueue
}

print(nums[K]!)
