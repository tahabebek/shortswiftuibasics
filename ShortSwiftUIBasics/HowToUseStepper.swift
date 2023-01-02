
//Created by taha on 12/29/22.
//

import SwiftUI

struct HowToUseStepper: View {
  @State var age = 18
  var body: some View {
    VStack {
      Text(age.formatted())
        .font(.largeTitle)
      Stepper("Enter your age", onIncrement: {
        age += 1
      }, onDecrement: {
        age -= 1
      })
      .padding()
      Spacer()
    }
  }
}











struct HowToUseStepper_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseStepper()
  }
}
