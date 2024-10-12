
import Foundation

let N = Int(readLine()!)!

var nums:[Int] = Array(readLine()!.split(separator:" ").map {Int($0)!})

var leftIdx = 0
var rightIdx = N - 1

if nums[N-1] <= 0 {
    print("\(nums[N-2]) \(nums[N-1])")
}
else if nums[0] >= 0 {
    print("\(nums[0]) \(nums[1])")
}
else {
    
    var zerosCount:Int = 0
    for num in nums {
        if num == 0 {zerosCount += 1}
    }
    
    if zerosCount >= 2 {
        print("0 0")
    } else {
        
        
        var leftVal = nums.first!
        var rightVal = nums.last!
        var minVal = rightVal - leftVal
        
        for _ in 1...nums.count-1 {
//            let val = nums[0]
            let num = nums.removeFirst()
            let idx = binarySearch(nums, num)
            let val = abs(nums[idx] + num)
            if minVal > val {
                leftVal = num
                rightVal = nums[idx]
                minVal = val
            }
        }

        print("\(leftVal) \(rightVal)")
        

        
    }
    

    

    
}

func binarySearch(_ arr:[Int], _ target: Int) -> Int {
    
    var leftIdx = 0
    var rightIdx = arr.count - 1
    var minIdx:Int = (leftIdx + rightIdx) / 2
    var minVal:Int = max(abs(target + arr.first!), abs(target + arr.last!))
    
    while leftIdx <= rightIdx {
        let midIdx = (leftIdx + rightIdx) / 2
        let val = abs(target + arr[midIdx])
        
        if val <= minVal {
            minVal = val
            minIdx = midIdx
        }
        if target + arr[midIdx] < 0 {
            leftIdx = midIdx + 1
        } else if target + arr[midIdx] > 0 {
            rightIdx = midIdx - 1
        } else {
            return midIdx
        }
        
    }
    return minIdx
    
}


// 사실 두 포인터를 쓰는 것이 더 빠르다...(O(N))
