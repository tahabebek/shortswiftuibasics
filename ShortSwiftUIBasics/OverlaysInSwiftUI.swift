//
// LIKE IF YOU WANT TO LEARN SWIFTUI

import SwiftUI

struct OverlaysInSwiftUI: View {
  var body: some View {
    VStack {
      Image("coffee")
        .overlay {
          Circle()
            .fill(.purple)
            .frame(width: 200, height: 200, alignment: .center)
            .overlay {
              Text("Tootsie")
                .font(.largeTitle)
                .foregroundColor(.white)
            }
        }
      Spacer()
    }
  }
}

struct OverlaysInSwiftUI_Previews: PreviewProvider {
  static var previews: some View {
    OverlaysInSwiftUI()
  }
}
