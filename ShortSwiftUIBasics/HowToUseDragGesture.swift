

//  Created by tahabebek on 1/1/23.
//

import SwiftUI

struct HowToUseDragGesture: View {
  @State var location = CGPoint(x: 50, y: 50)
  
  var body: some View {
    RoundedRectangle(cornerRadius: 10)
      .foregroundColor(.purple)
      .frame(width: 100, height: 100)
      .position(location)
      .gesture(
        DragGesture()
          .onChanged({ value in
            self.location = value.location
          })
      )
  }
}



















struct HowToUseDragGesture_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseDragGesture()
  }
}
