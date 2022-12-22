//
// LIKE IF YOU WANT TO LEARN SWIFTUI

import SwiftUI

struct HowToLoadImage: View {
  let url = URL(string: "https://placekitten.com/200/300")
  
  var body: some View {
    VStack {
      AsyncImage(url: url) { phase in
        switch phase {
          case .empty:
            ProgressView()
          case .success(let image):
            image.resizable()
              .aspectRatio(1, contentMode: .fit)
          case .failure:
            Image(systemName: "photo")
        }
      }
      Spacer()
    }
  }
}






struct HowToLoadImage_Previews: PreviewProvider {
  static var previews: some View {
    HowToLoadImage()
  }
}
