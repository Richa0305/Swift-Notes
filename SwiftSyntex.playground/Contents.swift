// Swift Syntex


// Store Property

var counter: Int = 10
let myConst: Int = 11


// Computed Property
print("=== Computed Property ===")
print("")
var a: String {
    return "a"
}


var b: String {
    get {
        return "b"
    }
}
print(a)
print(b)

print("-------------")
var _a:String?
var myA: String {
    get {
        return _a ?? "not set"
    }
    set(myNewVal) { // myNewVal can be any name we want
        _a = myNewVal
    }
}

myA = "X"
print(_a ?? "")
print(myA)
print("-------------")


var _b:String?
var myB: String {
    get {
        return _b ?? "not set"
    }
    set { // newVal set by default
        _b = newValue
    }
}

myB = "Y"
print(_b ?? "")
print(myB)
print("-------------")

print("")
// Property Observer
print("===Property Observer ===")
print("")
class MyCounter {
    var counter: Int = 0 {
        willSet{
            print("Counter values \(newValue)")
        }
        didSet {
            if (counter > oldValue) {
                print("Added new values in counter \(counter - oldValue)")
            }
        }
    }
    
}

var myCounter = MyCounter()
myCounter.counter = 10
myCounter.counter = 40
myCounter.counter = 100


print("")
print("==== Clouser ====")
print("")


/**
 
 { (params) -> returnType in
    statements
 }
 
 
 { (Int) -> Int in
    print("helloo")
 }
 
 */
// func implementation
func addNumber(num1: Int, num2: Int) -> Int {
    return num1 + num2
}
addNumber(num1: 5, num2: 8)


// closuer implementation
var addNums : (Int, Int) -> Int = { (num1: Int, num2: Int) -> Int in
    return num1 + num2
}
addNums(2,3)


// shorthand of closuer
var shortHand : (Int, Int) -> Int = {
    return $0 + $1
}
shortHand(2,4)


// super shorthand of closuer
var superShortHand: (Int, Int) -> Int = {$0 + $1}
superShortHand(8,9)


// Inferred type closuer
var inferredClosuer = {(x:Int, y:Int) -> Int in x + y}

// trailing closuer
func makeSquareOf(digit: Int, onCompletion: (Int) -> Void) {
    let square = digit * digit;
    onCompletion(square)
}

makeSquareOf(digit : 9) { (result) in
    print(result)
}
