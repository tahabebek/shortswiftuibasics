//Twitter @_tahabebek
//Twitter @swiftuicomps
//I am Taha Bebek
//PLEASE LIKE & SUBSCRIBE!

import SwiftUI
import Shimmer

struct Lottery {
  let image: Image
  let name: String
  let prize: Int
  var winningNumbers: Set<Int> {
    var numbers = Set<Int>()
    while numbers.count < 6 {
      numbers.insert(Int.random(in: 1...99))
    }
    return numbers
  }
}

class LotteryStore: ObservableObject {
  @State var lottery = Lottery(image: Image("mega_million_icon"), name: "Mega Millions", prize: 400_000_000)
  
  @Published var showResults = false
  
  func guessTheLotteryRight() {
    self.showResults = true
  }
}

struct MegaMillionsView: View {
  @ObservedObject var lotteryStore: LotteryStore
  
  init(lotteryStore: LotteryStore) {
    self.lotteryStore = lotteryStore
  }
  
  var body: some View {
    VStack {
      self.lotteryStore.lottery.image
        .resizable()
        .frame(width: 200, height: 100)
      Text(self.lotteryStore.lottery.name)
        .font(.title)
      Text(self.lotteryStore.lottery.prize, format: .currency(code: "USD"))
      Group {
        if self.lotteryStore.showResults {
          ResultView(winningNumbers:Array( self.lotteryStore.lottery.winningNumbers))
            .padding()
        } else {
          Spacer()
            .frame(height: 100)
            .background(.gray)
        }
      }
      Button {
        self.lotteryStore.guessTheLotteryRight()
      } label: {
        Text("Guess the lottery right")
          .font(.title)
      }
      .buttonStyle(.bordered)

      Spacer()
    }
  }
}

struct ResultView: View {
  let winningNumbers: [Int]
  
  var body: some View {
    HStack {
      ForEach(winningNumbers, id: \.self) { number in
        Text(number.formatted())
          .font(.caption)
          .foregroundColor(.white)
          .padding()
          .background {
            Circle()
              .fill(.blue)
              .frame(minWidth: 60)
          }
      }
    }
  }
}


struct MegaMillionsView_Previews:
  PreviewProvider {
  static var previews: some View {
    MegaMillionsView(lotteryStore: LotteryStore())
      .font(.system(size: 36))  .padding()
  }
}























