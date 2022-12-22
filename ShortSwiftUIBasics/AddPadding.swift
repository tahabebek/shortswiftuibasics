//
// LIKE IF YOU WANT TO LEARN SWIFTUI

import SwiftUI

struct AddPadding: View {
  var body: some View {
    VStack {
      Text("Ice apple brownie chupa tiramisu brownie pie lollipop jelly powder cream bear toffee dragée.")
        .font(.largeTitle)
        .background(.purple)
        .padding(.top, 40)
        .padding(.horizontal, 16)
      Spacer()
    }
  }
}










struct AddPadding_Previews: PreviewProvider {
  static var previews: some View {
    AddPadding()
  }
}
