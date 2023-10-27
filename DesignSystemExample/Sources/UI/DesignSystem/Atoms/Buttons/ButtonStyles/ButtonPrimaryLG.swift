import SwiftUI

struct ButtonPrimaryLG: ButtonStyle {
  var buttonStyleConfiguration: ButtonStyleConfiguration = .init(status: .normal)

  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding(.vertical, 9)
      .padding(.horizontal, 24)
      .typography(Typography.Paragraps.sm(weight: .semibold))
      .background(buttonStyleConfiguration.status.overridingColor?.asLinearGradient ?? Colors.Main.Primary.color500Gradient)
      .foregroundStyle(Colors.Main.Base.white)
      .clipShape(RoundedRectangle(cornerSize: CGSize(width: 4, height: 4)))
      .scaleEffect(configuration.isPressed ? 1.2 : 1)
      .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
  }
}

extension ButtonStyle where Self == ButtonPrimaryLG {
  static var buttonPrimaryLG: ButtonPrimaryLG { ButtonPrimaryLG() }
}
