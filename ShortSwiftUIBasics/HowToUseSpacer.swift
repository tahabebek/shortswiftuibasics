//
// LIKE IF YOU WANT TO LEARN SWIFTUI

import SwiftUI

struct HowToUseSpacer: View {
  var body: some View {
    VStack {
      HStack (spacing: -18) {
        Circle()
          .fill(.purple)
          .frame(width: 64, height: 64)
        Circle()
          .fill(.red)
          .frame(width: 64, height: 64)
        Circle()
          .fill(.blue)
          .frame(width: 64, height: 64)
        Circle()
          .fill(.yellow)
          .frame(width: 64, height: 64)
        Spacer()
      }
      Spacer()
    }
  }
}








struct HowToUseSpacer_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseSpacer()
  }
}
