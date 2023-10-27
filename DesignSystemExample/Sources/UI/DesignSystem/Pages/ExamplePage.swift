//
//  ExamplePage.swift
//  
//
//  Created by Chechelski Ernest on 28/09/2023.
//

import SwiftUI

struct PageBottomSlotDemo: View {

  var body: some View {
    PageBottomSlot {
      VStack(alignment: .leading) {
        ForEach(0..<125) { index in
          Text(
            "Lorem ipsum 12312 123 1231 212 3123123 123 31231 1231 123 1 12379 123981 378912 3879123 981378 1\(index)"
          )
        }
      }
    } bottomSlot: {
      Button {

      } label: {
        Text("Lorem ipsum")
      }
      .buttonStyle(
        .buttonPrimaryLG
      )
    }
    .navigationTitle("Example")
  }
}

struct PageBottomSlotDemo_Previews: PreviewProvider {
  static var previews: some View {
    TabView {
      NavigationStack {
        PageBottomSlotDemo()
      }
      .tabItem {
        VStack {
          Image(systemName: "chart.bar.fill")
          Text("Tab")
        }
      }
    }
  }
}

struct PageBottomSlot<PageSlot: View, BottomSlot: View>: View {
  let pageSlot: () -> PageSlot
  let bottomSlot: () -> BottomSlot

  var body: some View {
    ScrollView {
      pageSlot()
        .padding(Spacing.spacing1.value)
        .frame(maxWidth: .infinity)
    }
    .safeAreaInset(edge: .bottom) {
      bottomSlot()
        .padding(.bottom, Spacing.spacing1.value)
        .padding(.horizontal, Spacing.spacing1.value)
    }
  }
}
