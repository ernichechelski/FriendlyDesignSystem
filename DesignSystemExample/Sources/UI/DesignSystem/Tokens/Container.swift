//
//  Container.swift
//  
//
//  Created by Chechelski Ernest on 28/09/2023.
//

import SwiftUI

extension GroupBoxStyle where Self == PlainGroupBoxStyle {
  static func plain(overridingBackgroundColor: Color? = nil) -> Self {
    PlainGroupBoxStyle(
      backgroundColor: overridingBackgroundColor ?? Colors.Main.Grays.color100
    )
  }
}

struct PlainGroupBoxStyle: GroupBoxStyle {
  var backgroundColor: Color
  var borderColor: Color = Colors.Main.Primary.color200
  var radius: Radius = .MD
  var borderWidth: CGFloat = 1

  func makeBody(configuration: Configuration) -> some View {
    VStack(alignment: .leading) {
      configuration.label
      configuration.content
    }
    .background(
      backgroundColor
    )
    .clipShape(
      RoundedRectangle(
        cornerSize: CGSize(
          width: radius.value,
          height: radius.value
        )
      )
    )
    .overlay(
      RoundedRectangle(cornerRadius: radius.value)
        .stroke(
          borderColor,
          lineWidth: borderWidth
        )
    )
  }
}
