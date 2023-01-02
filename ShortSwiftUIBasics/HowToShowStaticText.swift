
//  Created by taha on 12/29/22.
//

import SwiftUI

struct HowToShowStaticText: View {
  var body: some View {
    VStack {
      //Let's put longer text
      //if we want to have a specific number of lines, we can set with lineLimit
      //what if we want to truncate from middle?
      //what if we want to reserve space for the second line?
      Text("Canes lemon candy.")
        .lineLimit(2, reservesSpace: true)
        .truncationMode(.middle)
        .font(.largeTitle)
        .foregroundColor(.white)
        .background(.purple)
        .padding()
      Spacer()
    }
  }
}








struct HowToShowStaticText_Previews: PreviewProvider {
  static var previews: some View {
    HowToShowStaticText()
  }
}
