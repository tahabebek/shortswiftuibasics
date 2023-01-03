//
//  ShortSwiftUIBasicsApp.swift
//  ShortSwiftUIBasics
//
//  Created by taha on 12/6/22.
//

import SwiftUI

@main
struct ShortSwiftUIBasicsApp: App {
    var body: some Scene {
        WindowGroup {
          HowToUseAppStorage()
        }
    }
}

struct Previews_ShortSwiftUIBasicsApp_Previews: PreviewProvider {
  static var previews: some View {
    /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
  }
}
