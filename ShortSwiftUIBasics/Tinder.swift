//
//  Tinder.swift
//  ShortSwiftUIBasics
//
//  Created by taha on 12/20/22.
//

import SwiftUI

struct Tinder: View {
  var body: some View {
    VStack {
      NavigationSection()
      CardsSection()
      FooterSection()
    }
  }
}

struct Tinder_Previews: PreviewProvider {
  static var previews: some View {
    Tinder()
  }
}

struct FooterSection: View {
  var body: some View {
    HStack(spacing:0) {
      Button {
        //
      } label: {
        Image("refresh")
      }
      Button {
        //
      } label: {
        Image("dismiss")
      }
      Button {
        //
      } label: {
        Image("super_like")
      }
      Button {
        //
      } label: {
        Image("like")
      }
      Button {
        //
      } label: {
        Image("boost")
      }
    }
  }
}

struct CardsSection: View {
  var body: some View {
    ZStack {
      ForEach(Card.data.reversed()) { card in
        CardView(card: card)
      }
    }
    .padding(8)
    .zIndex(1.0)
  }
}

struct NavigationSection: View {
  var body: some View {
    HStack {
      Button {
        //
      } label: {
        Image("profile")
      }
      Spacer()
      Button {
        //
      } label: {
        Image("tinder-icon")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(height: 45)
      }
      Spacer()
      Button {
        //
      } label: {
        Image("chats")
      }
    }
    .padding([.horizontal, .bottom])
  }
}

struct CardView: View {
  @State var card: Card
  
  let cardGradient = Gradient(colors: [
    Color.black.opacity(0.0),
    Color.black.opacity(0.5)
  ])
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      Image(card.imageName)
        .resizable()
        .clipped()
      
      LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom)
      VStack {
        Spacer()
        VStack(alignment: .leading) {
          HStack {
            Text(card.name)
              .font(.largeTitle)
              .fontWeight(.bold)
            Text(String(card.age))
              .font(.title)
          }
          Text(card.bio)
            .font(.body)
        }
      }
      .padding()
      .foregroundColor(.white)
      
      HStack {
        Image("yes")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 150)
          .opacity(Double(card.x/10 - 1))
        Spacer()
        Image("nope")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 150)
          .opacity(Double(card.x/10 * -1 - 1))
      }
    }
    .cornerRadius(8)
    .offset(x: card.x, y: card.y)
    .rotationEffect(.init(degrees: card.degree))
    .gesture(
      DragGesture()
        .onChanged { value in
          withAnimation (.default) {
            card.x = value.translation.width
            
            card.y = value.translation.height
            
            card.degree = 7 * (value.translation.width > 0 ? 1 : -1)
          }
        }
        .onEnded { value in
          withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
            switch value.translation.width {
              case 0...100:
                card.x = 0
                card.degree = 0
                card.y = 0
              case let x where x > 100:
                card.x = 500
                card.degree = 12
              case (-100)...(-1):
                card.x = -500
                card.degree = -12
                card.y = 0
              case let x where x < -100:
                card.x = -500
                card.degree = -12
              default:
                card.x = 0
                card.degree = 0
            }
          }
        }
    )
  }
}

struct Card: Identifiable {
  let id = UUID()
  let name: String
  let imageName: String
  let age: Int
  let bio: String
  
  var x: CGFloat = 0.0
  var y: CGFloat = 0.0
  var degree: Double = 0.0
  
  static var data: [Card] {
    [
      Card(name: "Rosie", imageName: "p0", age: 21, bio: "Insta - rooox"),
      Card(name: "Betty", imageName: "p1", age: 23, bio: "Like exercising, going out, pub, working."),
      Card(name: "Abigail", imageName: "p2", age: 26, bio: "hi, let's be friends"),
      Card(name: "Zoe", imageName: "p3", age: 20, bio: "Law grad"),
      Card(name: "Tilly", imageName: "p4", age: 21, bio: "Follow me on IG"),
      Card(name: "Penny", imageName: "p5", age: 24, bio: "J'aime la vie le vin")
    ]
  }
}
