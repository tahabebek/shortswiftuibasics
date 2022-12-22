//
// LIKE IF YOU WANT TO LEARN SWIFTUI

import SwiftUI

struct HowToAddGradient: View {
  
  let gradient = Gradient(colors: [.red, .yellow, .green, .blue, .purple])
  
  var body: some View {
    VStack {
      Text("Tiramisu")
        .font(.largeTitle)
        .frame(width: 200, height: 200)
        .background {
          Circle()
            .fill(
              AngularGradient(gradient: gradient, center: .center)
            )
        }
      Spacer()
    }
    .padding()
  }
}












struct HowToAddGradient_Previews: PreviewProvider {
  static var previews: some View {
    HowToAddGradient()
  }
}
