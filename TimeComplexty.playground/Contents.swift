
/*
 ___ _         ___    _  _     _        _   _
| _ |_)__ _   / _ \  | \| |___| |_ __ _| |_(_)___ _ _
| _ \ / _` | | (_) | | .` / _ \  _/ _` |  _| / _ \ ' \
|___/_\__, |  \___/  |_|\_\___/\__\__,_|\__|_\___/_||_|
      |___/
 */


// Linear Big 0(n)
func linearComplexity(_ array : [Int]) -> Int {
    for i in 0..<array.count {
        
        if array[i] == 0 {
            return 0
        }
    }
    return 1
}



// Constant Time 0(1) :- Evaluate in constant time quickly
func constantTimeComplexity(_ n: Int) -> Int {
    
    return n * n
    
}

print("Constant Complex -> \(constantTimeComplexity(16))")


// Logarithmatic Time 0(log n)
// Binary Search Tree
// Log2 (n) :-  Suppose n =128    { 64 , 32 , 16, 8 , 4 , 2, 1 }
func lograthmaticTimeComplexity(_ n: Int) -> Int {

    var N = n
    var result = 0
    
    while N > 1 {
        
        N /= 2
        result += 1
    }
    
    return result
}
lograthmaticTimeComplexity(256)

// Quadratic time O(n^2)

func Quadratic(_ n: Int) -> Int {
   
    var result = 0
    
    for i in 0..<n {
        for j in 0..<n{

            result += 1
            print("\(i) \(j)")
        }
    }
    print("Main Result :\(result)")
    return result
}

Quadratic(16)

