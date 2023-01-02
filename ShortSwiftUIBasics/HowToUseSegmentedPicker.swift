
//  Created by taha on 12/27/22.
//

import SwiftUI

struct HowToUseSegmentedPicker: View {
  @State var selection: String = "Most Recent"
  
  let options: [String] = [
    "Most Recent", "Most Popular", "Most Liked"
  ]
  
  var body: some View {
    NavigationStack {
      VStack {
        Picker(selection: $selection, label: Text("Picker")) {
          ForEach(options.indices) { index in
            Text(options[index])
              .tag(options[index])
          }
        }
        .pickerStyle(SegmentedPickerStyle())
        Spacer()
      }
      .navigationTitle(selection)
    }
  }
}

struct HowToUseSegmentedPicker_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseSegmentedPicker()
  }
}
