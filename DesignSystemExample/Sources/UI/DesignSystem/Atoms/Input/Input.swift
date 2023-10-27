//
//  Input.swift
//
//
//  Created by Chechelski Ernest on 26/09/2023.
//

import SwiftUI

extension TextFieldStyle where Self == InputTextStyle {
  static func inputText(
    value: String,
    placeholder: String
  ) -> InputTextStyle {
    .init(
      styleConfiguration: .init(
        status: .normal,
        value: value,
        placeholder: placeholder
      )
    )
  }

  static func inputText(
    styleConfiguration: TextFieldStyleConfiguration
  ) -> InputTextStyle {
    .init(
      styleConfiguration: styleConfiguration
    )
  }
}

extension InputStatus {
  var overridingColor: Color? {
    switch self {
    case .normal:
      return nil
    case .success:
      return Colors.Main.Success.color500
    case .warning:
      return Colors.Main.Warning.color500
    case .danger:
      return Colors.Main.Danger.color500
    }
  }
}

struct InputTextStyle: TextFieldStyle {
  @Environment(\.isEnabled) private var isEnabled

  var styleConfiguration: TextFieldStyleConfiguration

  func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .padding(Constants.swiftUITextFieldPlaceholderPadding)
      .foregroundColor(isEnabled ? Colors.Main.Grays.color300 : Colors.Main.Grays.color500)
      .background(isEnabled ? Colors.Main.Base.white : Colors.Main.Grays.color400)
      .cornerRadius(Radius.SM.value)
      .overlay(
        RoundedRectangle(cornerRadius: Radius.SM.rawValue)
          .stroke(
            isEnabled ? (styleConfiguration.status.overridingColor ?? Colors.Main.Grays.color300) : Colors.Main.Grays.color300,
            lineWidth: 1
          )
      )
      .shadow(color: .gray, radius: 1)
      .placeholder(styleConfiguration.placeholder, when: styleConfiguration.value.isEmpty)
  }
}

struct InputDemo_Previews: PreviewProvider {
  static var previews: some View {
    ScrollView(.vertical) {
      InputDemo()
        .padding(20)
    }
  }
}

struct InputDemo: View {
  @State var text: String = ""
  @State var isDisabled = false

  var body: some View {
    VStack {
      Toggle(isOn: $isDisabled) {
        Text("Disable")
      }
      VStack {
        TextField(text: $text, axis: .vertical)
          .textFieldStyle(
            .inputText(
              value: text,
              placeholder: "Placeholder"
            )
          )

        TextField(text: $text, axis: .vertical)
          .textFieldStyle(
            .inputText(
              value: text,
              placeholder: "Placeholder"
            )
          )

        TextField(text: $text)
          .textFieldStyle(
            InputTextStyle(
              styleConfiguration: .init(
                status: .success,
                value: text,
                placeholder: "Placeholder"
              )
            )
          )

        TextField(text: $text)
          .textFieldStyle(
            InputTextStyle(
              styleConfiguration: .init(
                status: .warning,
                value: text,
                placeholder: "Placeholder"
              )
            )
          )

        TextField(text: $text, axis: .vertical)
          .textFieldStyle(
            InputTextStyle(
              styleConfiguration: .init(
                status: .danger,
                value: text,
                placeholder: "Placeholder"
              )
            )
          )
      }
      .disabled(isDisabled)
    }
  }
}

extension TextField {
  public init(text: Binding<String>, axis: Axis = .horizontal) where Label == Text {
    self.init(text: text, axis: axis, label: { Text("") })
  }
}

extension View {
  func placeholder<Content: View>(
    when shouldShow: Bool,
    alignment: Alignment = .topLeading,
    @ViewBuilder placeholder: @escaping () -> Content
  ) -> some View {
    modifier(Placeholder(shouldShow: shouldShow, placeholder: placeholder))
  }

  func placeholder(
    _ text: String,
    foregroundColor: Color = Colors.Main.Grays.color300,
    when shouldShow: Bool,
    alignment: Alignment = .leading
  ) -> some View {
    placeholder(when: shouldShow, alignment: alignment) {
      Text(text).foregroundColor(foregroundColor)
    }
  }
}

private struct TextFieldWidthPreferenceKey: PreferenceKey {
  static let defaultValue: CGFloat = 0

  static func reduce(
    value: inout CGFloat,
    nextValue: () -> CGFloat
  ) {
    value = max(value, nextValue())
  }
}

private enum Constants {
  static let swiftUITextFieldPlaceholderPadding: CGFloat = 10
}

private struct Placeholder<PlaceholderContent: View>: ViewModifier {
  var shouldShow: Bool
  var alignment: Alignment = .topLeading

  @State private var buttonMaxWidth: CGFloat?

  @ViewBuilder var placeholder: () -> PlaceholderContent

  func body(content: Content) -> some View {
    ZStack(alignment: alignment) {
      content
        .background(GeometryReader { geometry in
          Color.clear.preference(
            key: TextFieldWidthPreferenceKey.self,
            value: geometry.size.height
          )
        })
      placeholder().opacity(shouldShow ? 1 : 0)
        .padding(Constants.swiftUITextFieldPlaceholderPadding)
        .allowsHitTesting(false)
        .frame(height: buttonMaxWidth)
    }
    .onPreferenceChange(TextFieldWidthPreferenceKey.self) {
      buttonMaxWidth = $0
    }
  }
}
