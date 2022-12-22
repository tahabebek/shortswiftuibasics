//
// LIKE IF YOU WANT TO LEARN SWIFTUI

import SwiftUI

struct HowToIgnoreSafeArea: View {
  var body: some View {
    Text("Donut lollipop")
      .font(.largeTitle)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .foregroundColor(.white)
      .background(.purple)
  }
}















struct HowToIgnoreSafeArea_Previews: PreviewProvider {
  static var previews: some View {
    HowToIgnoreSafeArea()
  }
}
