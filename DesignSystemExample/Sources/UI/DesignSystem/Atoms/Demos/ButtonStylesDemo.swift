//
//  File.swift
//
//
//  Created by Ernest Chechelski on 16/09/2023.
//

import SwiftUI

struct ButtonStylesDemo: View {
  var body: some View {
    VStack(alignment: .leading) {
      ForEach(ButtonStatus.allCases, id: \.self) { status in
        Button { } label: { Text("Button") }.buttonStyle(ButtonPrimaryMD(buttonStyleConfiguration: .init(status: .normal)))
        Button { } label: { Text("Button") }.buttonStyle(ButtonPrimaryLG(buttonStyleConfiguration: .init(status: .normal)))
        Button { } label: { Text("Button") }.buttonStyle(ButtonSecondaryMD(buttonStyleConfiguration: .init(status: .normal)))
      }
    }
    .padding(20)
    .navigationTitle("Design system buttons")
  }
}

struct ButtonStylesDemo_Previews: PreviewProvider {
  static var previews: some View {
    ScrollView {
      ButtonStylesDemo()
    }
  }
}
