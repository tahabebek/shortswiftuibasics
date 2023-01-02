



import SwiftUI

struct HowToUseFocusedState: View {
  
  enum Field {
    case username, password
  }
  @FocusState var focus: Field?
  @State var usernameText = ""
  @State var passwordText = ""
  
  var body: some View {
    VStack {
      TextField("Enter username", text: $usernameText)
        .focused($focus, equals: Field.username)
      
      SecureField("Enter password", text: $passwordText)
        .focused($focus, equals: Field.password)
      Spacer()
    }
    .onSubmit {
      if focus == Field.username {
        focus = Field.password
      } else {
        focus = nil
      }
    }
    .font(.largeTitle)
    .padding()
  }
}




























struct HowToUseFocusedState_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseFocusedState()
  }
}
