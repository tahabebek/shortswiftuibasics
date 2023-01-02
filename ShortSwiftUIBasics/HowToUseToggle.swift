
//  Created by taha on 12/28/22.
//

import SwiftUI

struct HowToUseToggle: View {
  
  @State var showDevices = false
  var body: some View {
    List {
      Section {
        Toggle(isOn: $showDevices) {
          Text("Bluetooth")
        }
      }
      if showDevices {
        Section("Devices") {
          Text("iPhone")
          Text("Airpods")
          Text("Apple Watch")
        }
      }
    }
  }
}










struct HowToUseToggle_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseToggle()
  }
}
