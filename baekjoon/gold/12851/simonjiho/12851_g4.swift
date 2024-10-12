//
//import Foundation
//
//
//let input = readLine()!.split(separator:" ").map { Int($0)! }
//var N:Int = input[0]
//let K:Int = input[1]
//
//var nums:[Int?] = Array(repeating:nil,count:100001)
//
//var ans:Int = 0
//nums[N] = ans
//
//
//var curQueue: [Int] = [N]
//var curQueue2: [Int] = Array(repeating:0,count:100001)
//curQueue2[N] = 1
//
//let NisBigger: Bool = N > K
//
//if NisBigger {
//    print(N-K)
//    print(1)
//}
//
//else {
//    while nums[K] == nil {
//        var nextQueue: [Int] = []
//        var nextQueue2: [Int] = Array(repeating:0,count:100001)
//        ans += 1
//        for idx in curQueue {
//            if idx+1 <= 100000 {
//                if nums[idx+1] == nil {
//                    nums[idx+1] = ans
//                    nextQueue.append(idx+1)
//                }
//                nextQueue2[idx+1] += curQueue2[idx]
//            }
//            if idx-1 >= 0 {
//                if nums[idx-1] == nil {
//                    nums[idx-1] = ans
//                    nextQueue.append(idx-1)
//                }
//                nextQueue2[idx-1] += curQueue2[idx]
//            }
//            if idx*2 <= 100000 {
//                if nums[idx*2] == nil {
//                    nums[idx*2] = ans
//                    nextQueue.append(idx*2)
//                }
//                nextQueue2[idx*2] += curQueue2[idx]
//            }
//        }
//        curQueue = nextQueue
//        curQueue2 = nextQueue2
//    }
//    
//    print(nums[K]!)
//    print(curQueue2[K])
//}
//
//
//
