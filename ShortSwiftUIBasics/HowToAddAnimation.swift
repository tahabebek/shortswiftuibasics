
import SwiftUI

struct HowToAddAnimation: View {
  
  @State var didMove = false
  
  var body: some View {
    VStack {
      HStack {
        if didMove {
          Spacer()
        }
        Rectangle()
          .fill(didMove ? .red : .blue)
          .frame(width: 50, height: 50)
        if !didMove {
          Spacer()
        }
      }
      .padding()
      .animation(.spring(response: 2,
                         dampingFraction: 1,
                         blendDuration: 1),
                 value: didMove)
      Button {
        didMove.toggle()
      } label: {
        Text("Move")
      }
      .buttonStyle(.borderedProminent)

      Spacer()
    }
  }
}

















struct HowToAddAnimation_Previews: PreviewProvider {
  static var previews: some View {
    HowToAddAnimation()
  }
}
