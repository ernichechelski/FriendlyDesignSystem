import SwiftUI

extension ButtonStatus {
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

  var foregroundOverridingColor: Color? {
    switch self {
    case .normal:
      return Colors.Main.Primary.color500
    case .success:
      return nil
    case .warning:
      return nil
    case .danger:
      return nil
    }
  }
}
