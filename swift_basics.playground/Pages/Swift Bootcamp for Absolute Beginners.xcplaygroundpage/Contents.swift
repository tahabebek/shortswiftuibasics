
import Foundation

func printTT(_ str: String) {
  print(">>>>>>> \(str)")
}

func printTT(_ int: Int) {
  
  print(">>>>>>> \(int.formatted())")
}

func printTT(_ int: UInt16) {
  
  print(">>>>>>> \(int.formatted())")
}







//assignment operator
let a = 1
let b = 2

//addition operator
let c = a + b

//arithmetic operators
let d = 1 + 3
let e = 6 - a
let f = Double(e * d)
let g = Double(f / 100)

//printTT("d: \(d)")
//printTT("e: \(e)")
//printTT("f: \(f)")
//printTT("g: \(g)")

//remainder operator
let h = e % 2

//printTT("h: \(h)")

//unary minus operator
let i = -h

//printTT("i: \(i)")

//addition assigment operator

var j = 1
j += 1

//printTT("j: \(j)")

//printTT("a: \(a)")
//printTT("b: \(b)")


//comparison operators
if a == b {
  //printTT("a is equal to b")
}
if a != b {
  //printTT("a is not equal to b")
}
if a > b {
  //printTT("a is greater than b")
}
if a < b {
  //printTT("a is less than b")
}
if a >= b {
  //printTT("a is greater than or equal to b")
}
if a <= b {
  //printTT("a is less than or equal to b")
}



//ternary conditional operator
let hasHeader = true
let height = hasHeader ?
  80 : 60

let hasSideBar = false
let width = hasSideBar ? 280 : 320

//printTT("height : \(height)")
//printTT("width : \(width)")

import SwiftUI



//nil-coalescing operator
let defaultColor = Color.purple

var selectedColor: Color? = nil

let color = selectedColor ?? defaultColor

//printTT(String(describing: color))


//closed range operator
for index in 1...5 {
  //printTT(index)
}

//half open range operator
for index in 5..<10 {
  //printTT(index)
}

let names = ["Alex", "Brian", "Jack"]

//one-sided ranges
for name in names[1...] {
  //printTT(name)
}

//logical NOT operator
let allowedEntry = false
if !allowedEntry {
  //printTT("Access Denied")
}

//logical AND operator
let enteredCode = true
let passedScan = false
if enteredCode && passedScan {
  //printTT("Welcome to Work")
}

//logical OR operator
let hasDoorKey = false
let knowsPassword = true
if hasDoorKey || knowsPassword {
  //printTT("Welcome Home")
}




let possibleNumberOne: String = "123"

let possibleNumberTwo: String = "Hello World"

let numberOne: Int? = Int(possibleNumberOne)

let numberTwo: Int? = Int(possibleNumberTwo)

let numberThree: Int? = nil


//printTT(numberOne?.formatted() ?? "numberOne is nil")
//printTT(numberTwo?.formatted() ?? "numberTwo is nil")
//
//printTT(numberThree?.formatted() ?? "numberThree is nil")



let http404Error = (404, "Not Found")

let code = http404Error.0

//printTT(code)


let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
  //printTT("tasty turnips")
} else {
  //printTT("turnips are horrible")
}




// == equal to operator
// != not equal to operator

let possibleNumber: String = "123"
let convertedNumber = Int(possibleNumber)

if convertedNumber != nil {
  
  //forced unwrapping with !
  let forceUnwrappedNumber = convertedNumber!
  
  print(">>> forceUnwrappedNumber is \(forceUnwrappedNumber)")
}
















































































typealias AudioSample = UInt16

var amplitude = AudioSample.min

printTT(amplitude)











