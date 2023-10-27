import SwiftUI

struct ButtonPrimaryMD: ButtonStyle {
  var buttonStyleConfiguration: ButtonStyleConfiguration = .init(status: .normal)

  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding(.vertical, 6.5)
      .padding(.horizontal, 16)
      .typography(Typography.Paragraps.sm(weight: .semibold))
      .foregroundStyle(Colors.Main.Base.white)
      .background(buttonStyleConfiguration.status.overridingColor?.asLinearGradient ?? Colors.Main.Primary.color500Gradient)
      .clipShape(RoundedRectangle(cornerSize: CGSize(width: 4, height: 4)))
      .scaleEffect(configuration.isPressed ? 1.2 : 1)
      .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
  }
}

extension ButtonStyle where Self == ButtonPrimaryMD {
  static var buttonPrimaryMD: ButtonPrimaryMD { ButtonPrimaryMD() }
}
