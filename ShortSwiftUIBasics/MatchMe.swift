//
//  MatchMe.swift
//  ShortSwiftUIBasics
//
//  Created by taha on 12/10/22.
//

import SwiftUI

struct Criteria: OptionSet {
  let rawValue: Int
  
  static let beauty = Criteria(rawValue: 1 << 0)
  static let money = Criteria(rawValue: 1 << 1)
  static let intelligence = Criteria(rawValue: 1 << 2)
  static let kindness = Criteria(rawValue: 1 << 2)
  
  static let all: [Criteria] = [.beauty, .money, .intelligence, .kindness]
}

class MatchViewModel: ObservableObject {
  @Published var state: State
  @Published var currentStep: Step = .ageRange
  
  init(state: State) {
    self.state = state
  }
  
  struct State {
    enum AgeRange {
      static let tier1 = 18...29
      static let tier2 = 30...39
      static let tier3 = 40...49
      static let tier4 = 50...
    }
    var ageRange: AgeRange?
    var maximumDistance: Double?
    var criterias: [Criteria] = []
  }
  
  enum Step: Int {
    case ageRange = 1
    case maximumDistance = 2
    case criterias = 3
  }
  
  func titleForStep(step: Step) -> String {
    switch step {
      case .ageRange:
        return "Age preference"
      case .maximumDistance:
        return "Maximum distance"
      case .criterias:
        return "Criterias"
    }
  }
}

struct MatchMe: View {
  @ObservedObject var viewModel: MatchViewModel
  
  var body: some View {
    ZStack {
      Color.init(red: 0.996, green: 0.972, blue: 0.955)
        .ignoresSafeArea()
      VStack {
        Text(self.viewModel.currentStep.rawValue.formatted())
          .font(.caption)
          .frame(width: 20, height: 20)
          .foregroundColor(.white)
          .background {
            Circle()
              .fill(.black)
          }
        Text(self.viewModel.titleForStep(step: self.viewModel.currentStep))

        Spacer()
      }
    }
  }
}

struct MatchMe_Previews: PreviewProvider {
  static var previews: some View {
    MatchMe(viewModel: MatchViewModel(state: .init()))
  }
}
