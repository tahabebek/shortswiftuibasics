//
// LIKE IF YOU WANT TO LEARN SWIFTUI

import SwiftUI

struct HowToAddBackground: View {
  var body: some View {
    VStack {
      Text("Sugar brownie jujubes lollipop croissant roll fruitcake sugar.")
        .foregroundColor(.white)
        .font(.largeTitle)
        .padding()
        .background {
          Image("coffee")
            .resizable()
            .aspectRatio(1, contentMode: .fill)
        }
        .clipped()
      Spacer()
    }
  }
}









struct HowToAddBackground_Previews: PreviewProvider {
  static var previews: some View {
    HowToAddBackground()
  }
}
