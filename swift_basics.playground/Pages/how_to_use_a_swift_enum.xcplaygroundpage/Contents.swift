import Foundation



//how to use a swift enum
//enum is a common type for a group of related values. let's see it with an example

enum Direction: String {
  case forward = "move forward"
  case back = "move back"
  case left = "move left"
  case right = "move right"
}

//now we can use it like this

var movement = Direction.forward

//switch statements chooses the logic based on the enum value

switch movement {
    
  case .forward:
    print("forward")
  case .back:
    print("back")
  case .left:
    print("left")
  case .right:
    print("right")
}

//we can use this in a function, like this:

func move(direction: Direction) {
  switch direction {
    case .forward:
      print("move forward")
    case .back:
      print("move back")
    case .left:
      print("move left")
    case .right:
      print("move right")
  }
}

move(direction: .back)

//enums can have predefined raw values

var direction = Direction.left
print(direction.rawValue)

//enums can hold values

enum Document: CaseIterable {
  static var allCases: [Document] {
    return [.book(numOfPages: 100), .photo(timeStamp: Date())]
  }
  
  case book(numOfPages: Int)
  case photo(timeStamp: Date)
}

func lookAtDocument(document: Document) {
  switch document {
    case .book(numOfPages: let numOfPages):
      print("book is \(numOfPages) pages")
    case .photo(timeStamp: let timeStamp):
      print("photo is taken \(timeStamp)")
  }
}

lookAtDocument(document: .book(numOfPages: 120))
lookAtDocument(document: .photo(timeStamp: Date()))

//enums can be made iterable
print(Document.allCases)

//we can check if a book is more than 1000 pages like this:

func checkIfBookIsMoreThen1000Pages(document: Document) {
  switch document {
    case .book(let numberOfpages) where numberOfpages > 1000:
      print("book is more than 1000 pages")
    default:
      print("it is either not a book, or it is a book but less than or equal to 1000 pages")
  }
}

checkIfBookIsMoreThen1000Pages(document: .book(numOfPages: 5000))

checkIfBookIsMoreThen1000Pages(document: .book(numOfPages: 999))

checkIfBookIsMoreThen1000Pages(document: .photo(timeStamp: .now))
