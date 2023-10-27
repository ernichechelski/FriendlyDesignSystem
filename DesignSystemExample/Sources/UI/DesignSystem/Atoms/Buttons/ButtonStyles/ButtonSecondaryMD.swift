import SwiftUI

struct ButtonSecondaryMD: ButtonStyle {
  var buttonStyleConfiguration: ButtonStyleConfiguration = .init(status: .normal)

  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding(.vertical, 6.5)
      .padding(.horizontal, 16)
      .typography(Typography.Paragraps.sm(weight: .semibold))
      .background(buttonStyleConfiguration.status.overridingColor ?? Colors.Main.Primary.color100)
      .foregroundStyle(buttonStyleConfiguration.status.foregroundOverridingColor ?? Colors.Main.Base.white)
      .clipShape(
        RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
      )
      .overlay(
        RoundedRectangle(cornerRadius: 4)
          .stroke(Colors.Main.Primary.color200, lineWidth: 1)
      )
      .scaleEffect(configuration.isPressed ? 1.2 : 1)
      .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
  }
}

extension ButtonStyle where Self == ButtonSecondaryMD {
  static var buttonSecondaryMD: ButtonSecondaryMD { ButtonSecondaryMD() }
}
