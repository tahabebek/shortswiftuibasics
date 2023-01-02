//
//  HowToUseObservableObject.swift
//  ShortSwiftUIBasics
//
//  Created by taha on 12/25/22.
//

import SwiftUI

//if you haven't watched my video named "how to use observable object", please watch that first. This video builds on top of that.

//here we have an observable object. Sometimes we want to pass down this object to many different views in the view hierarchy. We use EnvironmentObjects to achive that. Let's create two views.

//if we want to show count in detail view and sheet view, we can pass it by using @EnvironmentObject

struct DetailView: View {
  @EnvironmentObject var game: Game
  @State var showSheet = false
  
  var body: some View {
    VStack {
      Text("detail view")
      Text(game.count.formatted())
        .font(.largeTitle)
      Button {
        showSheet = true
      } label: {
        Text("show sheet")
      }
      .buttonStyle(.borderedProminent)
      .sheet(isPresented: $showSheet) {
        SheetView()
      }
      Spacer()
    }
  }
}

struct SheetView: View {
  @EnvironmentObject var game: Game
  var body: some View {
    VStack {
      Text(game.count.formatted())
        .font(.largeTitle)
      Text("sheet view")
      Spacer()
    }
  }
}

class Game: ObservableObject {
  @Published var count = 0
  
  init() {
    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
      self.count = self.count + 1
    }
  }
}

struct HowToUseObservableObject: View {
  @ObservedObject var game: Game
  
  var body: some View {
    VStack {
      NavigationStack {
        NavigationLink {
          DetailView()
        } label: {
          Text(game.count.formatted())
            .font(.largeTitle)
        }
        Spacer()
      }
      .environmentObject(game)
      //this is how we set the environment object. all the subviews in the hierarchy can access this by using @EnvironmentObject
    }
  }
}




struct HowToUseObservableObject_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseObservableObject(game: Game())
  }
}
