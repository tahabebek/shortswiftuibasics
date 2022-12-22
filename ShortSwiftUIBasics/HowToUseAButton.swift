//
//  HowToUseAButton.swift
//  ShortSwiftUIBasics
//
//  Created by taha on 12/14/22.
//

import SwiftUI

struct HowToUseAButton: View {
  // If a variable wil be updated, we need to put @State in front of it
  @State var count: Int = 0
  
  var body: some View {
    VStack {
      Text(count.formatted())
        .font(.largeTitle)
      
      Button {
        count = count + 1
      } label: {
        Image("coffee")
      }

      Spacer()
    }
  }
}





struct HowToUseAButton_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseAButton()
  }
}
