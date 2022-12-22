//
// LIKE IF YOU WANT TO LEARN SWIFTUI

import SwiftUI

struct HowToDrawShapes: View {
  var body: some View {
    VStack {
      Rectangle()
        .fill(.purple)
        .frame(width: 100, height: 100)
      RoundedRectangle(cornerRadius: 26)
        .fill(.blue)
        .frame(width: 200, height: 100)
      Circle()
        .fill(.yellow)
        .frame(width: 100, height: 100)
      Capsule()
        .fill(.orange)
        .frame(width: 100, height: 200)
      Spacer()
    }
  }
}









struct HowToDrawShapes_Previews: PreviewProvider {
  static var previews: some View {
    HowToDrawShapes()
  }
}
