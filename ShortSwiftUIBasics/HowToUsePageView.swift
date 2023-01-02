
//  Created by taha on 12/30/22.
//

import SwiftUI

struct HowToUsePageView: View {
  var body: some View {
    TabView {
      Image("User1")
      Image("User2")
      Image("User3")
    }
    .tabViewStyle(PageTabViewStyle())
    .ignoresSafeArea()
  }
}












struct HowToUsePageView_Previews: PreviewProvider {
  static var previews: some View {
    HowToUsePageView()
  }
}
