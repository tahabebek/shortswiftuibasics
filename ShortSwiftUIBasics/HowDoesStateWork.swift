//
// LIKE IF YOU WANT TO LEARN SWIFTUI

import SwiftUI

struct HowDoesStateWork: View {
  
  //If we want to modify a variable in a SwiftUI view, we need to add @State in front of it.
  
  @State var bgColor = Color.black
  
  var body: some View {
    VStack {
      Circle()
        .fill(self.bgColor)
        .frame(width: 100, height: 100)
      HStack {
        Button("Blue") {
          self.bgColor = .blue
        }
        Button("Red") {
          self.bgColor = .red
        }
        Button("Purple") {
          self.bgColor = .purple
        }
      }
      Spacer()
    }
  }
}

struct HowDoesStateWork_Previews: PreviewProvider {
  static var previews: some View {
    HowDoesStateWork()
  }
}
