//
// LIKE IF YOU WANT TO LEARN SWIFTUI

import SwiftUI

struct ShapeOperations: View {
  var body: some View {
    VStack {
      Rectangle()
        .trim(from: 0, to: 0.5)
        .rotation(.degrees(45))
        .scale(1.5)
        .stroke(.purple, lineWidth: 5)
        .frame(width: 100, height: 200)
      Spacer()
    }
  }
}






struct ShapeOperations_Previews: PreviewProvider {
  static var previews: some View {
    ShapeOperations()
  }
}
