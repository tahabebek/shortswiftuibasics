//
// LIKE IF YOU WANT TO LEARN SWIFTUI

import SwiftUI

struct HowToUseScrollView: View {
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ForEach(0..<10) { index in
          Text("\(index)")
            .foregroundColor(.white)
            .frame(width: 100, height: 100)
            .background {
              Circle()
                .fill(.purple)
            }
        }
      }
      .frame(maxWidth: .infinity)
    }
    .font(.largeTitle)
  }
}











struct HowToUseScrollView_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseScrollView()
  }
}
