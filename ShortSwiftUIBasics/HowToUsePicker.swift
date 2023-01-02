
//  Created by taha on 12/26/22.
//

import SwiftUI

struct HowToUsePicker: View {
  @State var selection = ""
  var body: some View {
    VStack {
      HStack {
        Text("Age")
        Text(selection)
      }
      Picker(selection: $selection, label: Text("Picker")) {
        ForEach(18..<100) { number in
          Text(number.formatted())
            .tag("\(number)")
        }
      }
      .pickerStyle(WheelPickerStyle())
      .font(.largeTitle)
      Spacer()
    }
  }
}

struct HowToUsePicker_Previews: PreviewProvider {
  static var previews: some View {
    HowToUsePicker()
  }
}
