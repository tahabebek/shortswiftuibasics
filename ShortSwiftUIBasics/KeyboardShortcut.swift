//
//  KeyboardShortcut.swift
//  ShortSwiftUIBasics
//
//  Created by taha on 12/15/22.
//

import SwiftUI

struct KeyboardShortcut: View {
  @State var bgColor = Color.black
  
  var body: some View {
    VStack {
      Text("This keyboard shortcut is a lifesaver. Use cmd + option + [ or ] to move a block of code up or down. ")
        .foregroundColor(.white)
        .font(.title)
        .padding()
      Circle()
        .fill(self.bgColor)
        .frame(width: 100, height: 100)
      HStack {
        Button("Blue") {
          self.bgColor = .blue
        }
        Button("Red") {
          self.bgColor = .red
        }
        Button("Purple") {
          self.bgColor = .purple
        }
      }
      Spacer()
    }
  }
}

struct KeyboardShortcut_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardShortcut()
    }
}
