//
// LIKE IF YOU WANT TO LEARN SWIFTUI

import SwiftUI

struct FramesAndAlignments: View {
  var body: some View {
    VStack {
      Text("Soufflé brownie apple")
        .background(.red)
        .frame(height: 100)
        .background(.blue)
        .frame(width: 150)
        .background(.purple)
        .frame(maxWidth: .infinity)
        .background(.yellow)
        .frame(maxHeight: .infinity)
        .background(.pink)
      Spacer()
    }
    .padding()
  }
}









struct FramesAndAlignments_Previews: PreviewProvider {
  static var previews: some View {
    FramesAndAlignments()
  }
}
