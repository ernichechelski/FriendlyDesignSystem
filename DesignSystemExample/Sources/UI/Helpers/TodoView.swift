//
//  TodoView.swift
//  
//
//  Created by Chechelski Ernest on 26/09/2023.
//

import SwiftUI

struct TodoView: View {
  let text: String

  var body: some View {
    Text("TODO - \(text)")
      .foregroundColor(Colors.Main.Danger.color700)
  }
}
