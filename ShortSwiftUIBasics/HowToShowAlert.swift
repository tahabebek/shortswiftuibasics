//
//  HowToShowAlert.swift
//  ShortSwiftUIBasics
//
//  Created by taha on 12/23/22.
//

import SwiftUI

struct HowToShowAlert: View {
  
  @State var showAlert = false
  @State var bgColor = Color.yellow
  var body: some View {
    ZStack {
      bgColor.ignoresSafeArea()
      Button {
        showAlert = true
      } label: {
        Text("Tap me")
      }
      .buttonStyle(.borderedProminent)
      .alert(isPresented: $showAlert) {
        Alert(title: Text("Are you sure?"),
              message: Text("This can't be undone"), primaryButton: .destructive(Text("DELETE"), action: {
          bgColor = .red
        }), secondaryButton: .cancel()
        )
      }
    }
  }
}













struct HowToShowAlert_Previews: PreviewProvider {
  static var previews: some View {
    HowToShowAlert()
  }
}
