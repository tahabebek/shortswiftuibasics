
//  Created by taha bebek on 12/27/22.

import SwiftUI

struct FlightApp: View {
  var size: CGSize
  var safeArea: EdgeInsets
  @State var offsetY: CGFloat = 0
  @State var currentCardIndex: CGFloat = 0
  
  var body: some View {
    VStack(spacing: 0) {
      HeaderView()
        .overlay(alignment: .bottomTrailing) {
          Button {
            //
          } label: {
            Image(systemName: "plus")
              .font(.title3)
              .fontWeight(.semibold)
              .foregroundColor(.gray)
              .frame(width: 40, height: 40)
              .background {
                Circle()
                  .fill(.white)
                  .shadow(color: .black.opacity(0.35), radius: 5, x: 5, y: 5)
              }
          }
          .offset(x: -15, y: -15)
        }
        .zIndex(1)
      PaymentCardsView()
        .zIndex(0)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background {
      Color("BG")
        .ignoresSafeArea()
    }
  }
  
  @ViewBuilder
  func PaymentCardsView() -> some View {
    VStack {
      Text("SELECT PAYMENTS METHOD")
        .font(.caption)
        .fontWeight(.semibold)
        .foregroundColor(.gray)
        .padding(.vertical)
      
      GeometryReader { _ in
        VStack(spacing: 0) {
          ForEach(sampleCards.indices, id: \.self) { index in
            CardView(index: index)
          }
        }
        .padding(.horizontal, 30)
        .offset(y: offsetY)
        .offset(y: currentCardIndex + -200)
        
        Rectangle()
          .fill(.linearGradient(colors: [
            .clear,
            .clear,
            .clear,
            .clear,
            .white.opacity(0.1),
            .white.opacity(0.75),
            .white
          ], startPoint: .top, endPoint: .bottom))
          .allowsHitTesting(false)
        
        Button {
          
        } label: {
          Text("Confirm $1,536.00")
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(.horizontal, 30)
            .padding(.vertical, 10)
            .background {
              Capsule()
                .fill(
                  Color("BlueTop").gradient
                )
            }
        }
        .frame(minWidth: .infinity, maxWidth: .infinity, alignment: .bottom)
        .padding(.bottom, safeArea.bottom == 0 ? 15 : safeArea.bottom)
      }
      .coordinateSpace(name: "SCROLL")
    }
    .contentShape(Rectangle())
    .gesture(
      DragGesture()
        .onChanged({ value in
          offsetY = value.translation.height * 0.3
        })
        .onEnded({ value in
          let translation = value.translation.height
          withAnimation {
            if translation > 0 && translation > 100 && currentCardIndex > 0 {
              currentCardIndex -= 1
            }
            
            if translation < 0 && -translation > 100 && currentCardIndex < CGFloat(sampleCards.count - 1) {
              currentCardIndex += 1
            }
            
            offsetY = .zero
          }
        })
    )
    .background {
      Color.white.ignoresSafeArea()
    }
  }
  
  @ViewBuilder
  func CardView(index: Int) -> some View {
    GeometryReader { proxy in
      let size = proxy.size
      let minY = proxy.frame(in: .named("SCROLL")).minY
      let progress = minY / size.height
      let constrainedProgress = progress > 1 ? 1 : progress < 0 ? 0 : progress
      
      Image(sampleCards[index].cardImage)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: size.width, height: size.height)
        .shadow(color: .black.opacity(0.14), radius: 8, x: 6, y: 6)
        .rotation3DEffect(.init(degrees: constrainedProgress * 40.0), axis: (x: 1, y: 0, z: 0), anchor: .bottom)
        .padding(.top, progress * -160.0)
        .offset(y: progress < 0 ? progress * 250 : 0)
    }
    .frame(height: 200)
    .zIndex(Double(sampleCards.count - index))
  }
  
  @ViewBuilder
  func HeaderView() -> some View {
    VStack {
      Image("Logo")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: size.width * 0.4)
        .frame(maxWidth: .infinity, alignment: .leading)
      HStack {
        FlightDetailsView(place: "Los Angeles", code: "LAD", timing: "27 Dec, 6:50")
        
        VStack(spacing: 8) {
          Image(systemName:"chevron.right")
            .font(.title2)
          Text("4h 15m")
            .font(.caption)
        }
        .fontWeight(.semibold)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        
        FlightDetailsView(place: "New York", code: "NYC", timing: "27 Dec, 10:50")
        
      }
      .padding(.top, 20)
      
      Image("Airplane")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(height: 160)
        .padding(.bottom, -20)
 
    }
    .padding([.horizontal, .top], 15)
    .padding(.top, safeArea.top)
    .background {
      Rectangle()
        .fill(.linearGradient(colors: [Color("BlueTop"), Color("BlueTop"), Color("BlueBottom")], startPoint: .top, endPoint: .bottom)
        )
    }
  }
}

struct FlightDetailsView: View {
  var alignment: HorizontalAlignment = .leading
  var place: String
  var code: String
  var timing: String
  
  var body: some View {
    VStack(alignment: alignment, spacing: 6) {
      Text(place)
        .font(.caption)
        .foregroundColor(.white.opacity(0.8))
      Text(code)
        .font(.title)
        .foregroundColor(.white.opacity(0.8))
      Text(timing)
        .font(.caption)
        .foregroundColor(.white.opacity(0.8))
    }
    .frame(maxWidth: .infinity)
  }
}

struct FlightApp_Previews: PreviewProvider {
  static var previews: some View {
    
    GeometryReader {
      let size = $0.size
      let safeArea = $0.safeAreaInsets
      FlightApp(size: size, safeArea: safeArea)
        .ignoresSafeArea(.container, edges: .vertical)
    }
  }
}

struct CreditCard: Identifiable {
  var id: UUID = .init()
  var cardImage: String
}

var sampleCards: [CreditCard] = [
  .init(cardImage: "Card 1"),
  .init(cardImage: "Card 2"),
  .init(cardImage: "Card 3"),
  .init(cardImage: "Card 4"),
  .init(cardImage: "Card 5"),
  .init(cardImage: "Card 6"),
  .init(cardImage: "Card 7"),
  .init(cardImage: "Card 8"),
  .init(cardImage: "Card 9"),
  .init(cardImage: "Card 10")
]
