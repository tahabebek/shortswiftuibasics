//
// LIKE IF YOU WANT TO LEARN SWIFTUI

import SwiftUI

struct VStackHStackZStack: View {
  var body: some View {
    //VStack -> Vertical
    //HStack -> Horizontal
    //ZStack -> Back to front
    ZStack (alignment: .center){
      VStack {
        Text("Carrot")
          .font(.largeTitle)
          .frame(width: 120, height: 120)
          .background(.blue)
        Text("Carrot")
          .font(.largeTitle)
          .frame(width: 100, height: 100)
          .background(.red)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.orange)
    .font(.largeTitle)
  }
}

struct VStackHStackZStack_Previews: PreviewProvider {
  static var previews: some View {
    VStackHStackZStack()
  }
}
