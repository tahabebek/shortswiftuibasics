//
// LIKE IF YOU WANT TO LEARN SWIFTUI

import SwiftUI

struct HowToUseAGrid: View {
  
  let columns: [GridItem] = [
    GridItem(.flexible(), spacing: 16, alignment: .center),
    GridItem(.flexible(), spacing: 16, alignment: .center),
    GridItem(.flexible(), spacing: 16, alignment: .center)
  ]
  
  var body: some View {
    ScrollView {
      LazyVGrid(
        columns: columns,
        alignment: .center,
        spacing: 8,
        pinnedViews: [.sectionHeaders],
        content: {
          Section(header:
                    Text("Section 1")
            .font(.largeTitle)
            .background(.red)
          )
          {
            ForEach(0..<30) { index in
              Rectangle()
                .fill(.purple)
                .frame(height: 44)
              Rectangle()
                .fill(.purple)
                .frame(height: 44)
              Rectangle()
                .fill(.purple)
                .frame(height: 44)
            }
          }
        }
      )
      .padding()
      
    }
  }
}







struct HowToUseAGrid_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseAGrid()
  }
}
