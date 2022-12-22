//
// LIKE IF YOU WANT TO LEARN SWIFTUI

import SwiftUI

struct HowToShowImages: View {
  
  let deviceWidth = UIScreen.main.bounds.width
  let deviceHeight = UIScreen.main.bounds.height
  
  
  var body: some View {
    Image("coffee")
      .resizable(resizingMode: .tile)
      .aspectRatio(1, contentMode: .fill)
      .frame(width: deviceWidth, height: deviceHeight)
      .ignoresSafeArea()
  }
}









struct HowToShowImages_Previews: PreviewProvider {
  static var previews: some View {
    HowToShowImages()
  }
}
