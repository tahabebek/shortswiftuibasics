//
//  HowToUseList.swift
//  ShortSwiftUIBasics
//
//  Created by taha on 12/22/22.
//

import SwiftUI

struct HowToUseList: View {
  
  @State var items = [
    "Icing",
    "Macaroon",
    "Croissant",
    "Soufflé"
  ]
  var body: some View {
    NavigationStack {
      List {
        Section(header: Text("Items")) {
          ForEach(items, id: \.self) { item in
            Text(item)
          }
          .onDelete { indexSet in
            items.remove(atOffsets: indexSet)
          }
          .onMove { indexSet, offset in
            items.move(fromOffsets: indexSet, toOffset: offset)
          }
        }
      }
      .listStyle(.sidebar)
      .navigationTitle("Menu")
      .toolbar {
        EditButton()
      }
    }
    .accentColor(.purple)
  }
}









struct HowToUseList_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseList()
  }
}
