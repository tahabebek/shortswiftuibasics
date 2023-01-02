
//  Created by taha on 12/31/22.
//

import SwiftUI

struct HowToUseTapGesture: View {
  @State var followText = "Follow"
  @State var likeText = "Like"
  
  var body: some View {
    VStack (spacing: 16) {
      Text(followText)
        .font(.largeTitle)
        .padding()
        .foregroundColor(.white)
        .background(.blue)
        .onTapGesture {
          followText = "Followed"
        }
      
      Text(likeText)
        .font(.largeTitle)
        .padding()
        .foregroundColor(.white)
        .background(.blue)
        .onTapGesture(count: 2) {
          likeText = "Liked"
        }
      Spacer()
    }
    .padding()
  }
}




















struct HowToUseTapGesture_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseTapGesture()
  }
}
