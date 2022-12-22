//
// LIKE IF YOU WANT TO LEARN SWIFTUI

import SwiftUI

struct Student: Identifiable {
  let id: String
  let name: String
}

struct HowToUseForEach: View {
  
  let students = [Student(id: "1", name: "Alex"), Student(id: "2", name: "Tom")]
  
  var body: some View {
    VStack {
      ForEach(students) { student in
        Text(student.name)
      }
      Spacer()
    }
  }
}

struct HowToUseForEach_Previews: PreviewProvider {
  static var previews: some View {
    HowToUseForEach()
  }
}
