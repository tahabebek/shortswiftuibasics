

import SwiftUI

struct HowToUseAppStorage: View {
  @AppStorage("name") var userName: String?
  
  @State var textFieldText: String = ""
  
  var body: some View {
    VStack {
      Text("Welcome \(userName ?? "Guest")")
        .font(.largeTitle)
      TextField("Set username", text: $textFieldText)
        .onChange(of: textFieldText) { newValue in
          userName = newValue
        }
      Spacer()
    }
  }
}




struct HowToUseAppStorage_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseAppStorage()
  }
}
