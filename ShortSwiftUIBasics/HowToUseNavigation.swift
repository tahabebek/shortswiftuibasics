//
//  HowToUseNavigation.swift
//  ShortSwiftUIBasics
//
//  Created by taha on 12/21/22.
//

import SwiftUI

struct HowToUseNavigation: View {
  var groups: [MenuGroup]
  
  var body: some View {
    NavigationStack {
      List(groups) { group in
        NavigationLink(group.name) {
          MenuGroupView(group: group)
        }
      }
      .navigationTitle("Menu")
    }
  }
}

struct MenuGroupView: View {
  var group: MenuGroup
  
  var body: some View {
    List(group.dishes) { dish in
      Text(dish.name)
    }
    .navigationTitle(group.name)
  }
}

struct Dish: Identifiable {
  let name: String
  var id: String { name }
}

struct MenuGroup: Identifiable {
  let name: String
  let dishes: [Dish]
  
  var id: String { name }
}

let menu = [
  MenuGroup(
    name: "Zurgers",
    dishes: [
      Dish(name: "Hamburger"),
      Dish(name: "Cheeseburger"),
      Dish(name: "Bacon Burger")
    ]
  ),
  MenuGroup(
    name: "Sandwiches",
    dishes: [
      Dish(name: "Veggie Sandwich"),
      Dish(name: "Grilled Cheese"),
      Dish(name: "BLT")
    ]
  ),
  MenuGroup(
    name: "Drinks",
    dishes: [
      Dish(name: "Soda"),
      Dish(name: "Milk Shake")
    ]
  )
]

struct HowToUseNavigation_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseNavigation(groups: menu)
  }
}
