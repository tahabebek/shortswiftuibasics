import SwiftUI

struct HowToUseBinding: View {
  
  //If you will update a variable, you need to declare it with @State
  //If you will update it from a subview, you need to declare it as @Binding, and pass it to the subview with $
  
  @State var bgColor = Color.red
  var body: some View {
    VStack {
      ZStack {
        bgColor
          .ignoresSafeArea()
        ButtonView(bgColor: $bgColor)
      }
      Spacer()
    }
  }
}

struct ButtonView: View {
  @Binding var bgColor: Color
  
  var body: some View {
    Button {
      bgColor = .blue
    } label: {
      Text("Change to blue")
    }
  }
}

struct HowToUseBinding_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseBinding()
  }
}
