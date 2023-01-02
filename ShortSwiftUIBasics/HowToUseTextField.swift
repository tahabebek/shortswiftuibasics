//  Created by taha on 12/24/22.
//

import SwiftUI

struct HowToUseTextField: View {
  
  @State var textInput: String = ""
  
  var body: some View {
    VStack {
      TextField("Enter Address", text: $textInput)
        .textFieldStyle(.roundedBorder)
        .padding()
        .background(.purple)
        .cornerRadius(2)
        .foregroundColor(.purple)
        .font(.headline)
      Label {
        Text(textInput)
      } icon: {
        Image(systemName: "house")
      }

      Spacer()
    }
  }
}












struct HowToUseTextField_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseTextField()
  }
}
