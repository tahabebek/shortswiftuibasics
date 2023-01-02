//
//
//


import SwiftUI

struct HowToUseFollowedState: View {
  
  enum Field {
    case username, password
  }
  
  @FocusState var focus: Field?
  @State var username = ""
  @State var password = ""
  
  var body: some View {
    VStack {
      TextField("Enter username", text: $username)
        .focused($focus, equals: .username)
      
      SecureField("Enter password", text: $password)
        .focused($focus, equals: .password)
      Spacer()
    }
    .onSubmit {
      if focus == .username {
        focus = .password
      } else {
        focus = nil
      }
    }
    .padding()
    .font(.largeTitle)
  }
}
















struct HowToUseFollowedState_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseFollowedState()
  }
}
