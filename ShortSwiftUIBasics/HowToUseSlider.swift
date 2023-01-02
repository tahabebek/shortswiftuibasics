
//  Created by taha on 12/29/22.
//

import SwiftUI

struct HowToUseSlider: View {
  @State var value: Double = 3
  var body: some View {
    VStack {
      Text("Rating")
      Text(String(format: "%0.f", value))
        .font(.largeTitle)
      Slider(value: $value, in: 0...5, label: {
        Text("Title")
      }, minimumValueLabel: {
        Text("Min")
      }, maximumValueLabel: {
        Text("Max")
      }, onEditingChanged: { _ in
        
      })
        .padding()
      Spacer()
    }
  }
}








struct HowToUseSlider_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseSlider()
  }
}
