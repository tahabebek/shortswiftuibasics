
import SwiftUI

struct HowToUseSheet: View {
  @State var showSheet = false
  var body: some View {
    ZStack {
      Button {
        showSheet = true
      } label: {
        Text("Show Sheet")
      }
      .buttonStyle(.borderedProminent)
    }
    .sheet(isPresented: $showSheet) {
      SecondView()
    }
  }
}

struct SecondView: View {
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    ZStack {
      Color.purple
        .ignoresSafeArea()
      VStack {
        HStack {
          Button {
            presentationMode.wrappedValue.dismiss()
          } label: {
            Text("X")
          }
          .frame(width: 50, height: 50)
          .buttonStyle(.borderedProminent)
          Spacer()
        }
        Spacer()
        Text("This is the sheet view")
          .font(.largeTitle)
        Spacer()
      }
    }
  }
}







struct HowToUseSheet_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseSheet()
  }
}
