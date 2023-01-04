


import SwiftUI

struct HowToUseViewModifier: View {
  var body: some View {
    VStack {
      Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        .modifier(Title())
      Text("Login")
        .modifier(Title())
      Text("Signup")
        .modifier(Title())
      Spacer()
    }
  }
}

struct Title: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundColor(.blue)
      .font(.title)
      .fontWeight(.regular)
      .padding(.horizontal, 20)
      .padding(.vertical, 12)
      .lineLimit(1)
      .frame(width: 340, height: 44)
      .overlay {
        RoundedRectangle(cornerRadius: 12)
          .stroke(Color.blue, lineWidth: 1.5)
      }
  }
}







struct HowToUseViewModifier_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseViewModifier()
  }
}
