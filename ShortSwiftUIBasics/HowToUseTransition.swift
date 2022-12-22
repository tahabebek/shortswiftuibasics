
import SwiftUI

struct HowToUseTransition: View {
  
  //transition means entering or exiting the view
  @State var showRectangle = false
  
  var body: some View {
    VStack {
      Button {
        showRectangle.toggle()
      } label: {
        Text("Toggle Rectangle")
      }
      .buttonStyle(.borderedProminent)
      .padding()

      if showRectangle {
        Rectangle()
          .fill(.purple)
          .frame(width: 100, height: 100)
          .transition(AnyTransition.asymmetric(insertion: .slide, removal: .scale))
      }
      Spacer()
    }
    .animation(.default.speed(0.5), value: showRectangle)
  }
}

struct HowToUseTransition_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseTransition()
  }
}
