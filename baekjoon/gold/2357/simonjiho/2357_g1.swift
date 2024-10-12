
import Foundation

struct Num {
    let val:Int
    let idx:Int
    
    init(_ val: Int, idx:Int) {
        self.val = val
        self.idx = idx
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (input[0], input[1])

var inputArray:[Int] = []
var nums:[Num] = []
for _ in 0...N-1 {
    inputArray.append(Int(readLine()!)!)
}

var maxSegTree:[Int] = Array(repeating:0,count:Int(round(pow(2,ceil(log2(Double(N))+1)))))
var minSegTree:[Int] = Array(repeating:Int.max,count:Int(round(pow(2,ceil(log2(Double(N))+1)))))


var start = 0
var end = inputArray.count - 1

_ = createMaxSegTree(0,end,1)
_ = createMinSegTree(0,end,1)

func createMaxSegTree(_ start:Int, _ end:Int, _ index:Int) -> Int {
    if start == end {
        maxSegTree[index] = inputArray[start]
        return maxSegTree[index]
    }
    let mid = (start + end) / 2
    maxSegTree[index] = max(createMaxSegTree(start,mid,index*2), createMaxSegTree(mid+1,end,index*2+1))
    return maxSegTree[index]
}

func createMinSegTree(_ start:Int, _ end:Int, _ index:Int) -> Int {
    if start == end {
        minSegTree[index] = inputArray[start]
        return maxSegTree[index]
    }
    let mid = (start + end) / 2
    minSegTree[index] = min(createMinSegTree(start,mid,index*2), createMinSegTree(mid+1,end,index*2+1))
    return minSegTree[index]
}



var searchRanges:[(Int,Int)] = []
for _ in 1...M {
    let input3 = readLine()!.split(separator: " ").map { Int($0)! }
    searchRanges.append((input3[0]-1,input3[1]-1))
}

for (a,b) in searchRanges {
    let maxVal = findMax(a, b, start, end, 1)
    let minVal = findMin(a, b, start , end, 1)
    print("\(minVal) \(maxVal)")
}


func findMax(_ a:Int, _ b:Int, _ start:Int, _ end:Int, _ index:Int) -> Int {
    if (a > end) || (b < start) {
        return 0
    }
    if ( a <= start ) && ( b >= end ) {
        return maxSegTree[index]
    }
    
    let mid = (start + end)/2
    return max(findMax(a,b,start,mid,index*2),findMax(a,b,mid+1,end,index*2+1))
}
func findMin(_ a:Int, _ b:Int, _ start:Int, _ end:Int, _ index:Int) -> Int {
    if (a > end) || (b < start) {
        return Int.max
    }
    if ( a <= start ) && ( b >= end ) {
        return minSegTree[index]
    }
    let mid = (start + end)/2
    
    return min(findMin(a,b,start,mid,index*2),findMin(a,b,mid+1,end,index*2+1))
}
