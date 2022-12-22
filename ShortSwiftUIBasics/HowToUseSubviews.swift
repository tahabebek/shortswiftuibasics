//
// LIKE IF YOU WANT TO LEARN SWIFTUI

import SwiftUI

struct HowToUseSubviews: View {
  var body: some View {
    VStack (alignment: .leading) {
      title
      studentView(name: "Tom", id: "1")
      studentView(name: "Alex", id: "2")
      Footer()
      Spacer()
    }
  }
}

//Subview method 3 - create custom view

struct Footer: View {
  var body: some View {
    Text("Total 2")
      .font(.footnote)
  }
}

//Subview method 2 - create function

func studentView(name: String, id: String) ->
some View {
  Label {
    Text(name)
  } icon: {
    Text(id)
  }
}

// Subview method 1 - create variable

var title: some View {
  Text("Student list")
    .font(.largeTitle)
}







struct HowToUseSubviews_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseSubviews()
  }
}
