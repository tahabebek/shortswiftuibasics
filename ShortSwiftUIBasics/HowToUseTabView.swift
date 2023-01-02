
//  Created by taha on 12/30/22.
//

import SwiftUI

struct HowToUseTabView: View {
  var body: some View {
    TabView {
      ZStack {
        Color.yellow.ignoresSafeArea()
        Text("Home")
          .font(.largeTitle)
          .foregroundColor(.white)
      }
      .tabItem {
        Image(systemName: "house")
        Text("Home")
      }
      
      ZStack {
        Color.red.ignoresSafeArea()
        Text("Now")
          .font(.largeTitle)
          .foregroundColor(.white)
      }
      .tabItem {
        Image(systemName: "timer")
        Text("Now")
      }
      
      ZStack {
        Color.blue.ignoresSafeArea()
        Text("Profile")
          .font(.largeTitle)
          .foregroundColor(.white)
      }
      .tabItem {
        Image(systemName: "person")
        Text("Profile")
      }
    }
    .accentColor(.white)
  }
}

















struct HowToUseTabView_Previews: PreviewProvider {
  static var previews: some View {
    
    HowToUseTabView()
  }
}
