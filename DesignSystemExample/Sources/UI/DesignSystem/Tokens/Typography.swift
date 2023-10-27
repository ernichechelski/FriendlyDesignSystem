import SwiftUI

protocol TypographyStyle {
  var font: Font { get }
}

extension View {
  func typography(_ typographyStyle: TypographyStyle) -> some View {
    modifier(
      TypographyStyleViewModifier(style: typographyStyle)
    )
  }
}

public enum Typography {
  public enum Headings: TypographyStyle {
    case h1Bold
    case h2Bold
    case h3Bold
    case h4Bold

    var font: Font {
      switch self {
      case .h1Bold:
        return Font.system(size: 27, weight: 500)
      case .h2Bold:
        return Font.system(size: 24, weight: 500)
      case .h3Bold:
        return Font.system(size: 20, weight: 500)
      case .h4Bold:
        return Font.system(size: 18, weight: 500)
      }
    }
  }

  public enum Paragraps: TypographyStyle {
    case lg(weight: Font.Weight)
    case md(weight: Font.Weight)
    case sm(weight: Font.Weight)
    case xd(weight: Font.Weight)

    var font: Font {
      switch self {
      case let .lg(weight):
        return Font.system(size: 16, weight: weight)
      case let .md(weight):
        return Font.system(size: 14, weight: weight)
      case let .sm(weight):
        return Font.system(size: 12, weight: weight)
      case let .xd(weight):
        return Font.system(size: 10, weight: weight)
      }
    }
  }
}
extension Font.Weight: RawRepresentable {
  private enum DesignSystemFontWeights: Int {
    case ultraLight = 100
    case thin = 200
    case light = 300
    case regular = 400
    case medium = 500
    case semibold = 600
    case bold = 700
    case heavy = 800
    case black = 900

    var weight: Font.Weight {
      switch self {
      case .ultraLight: return .ultraLight
      case .thin: return .thin
      case .light: return .light
      case .regular: return .regular
      case .medium: return .medium
      case .semibold: return .semibold
      case .bold: return .bold
      case .heavy: return .heavy
      case .black: return .black
      }
    }
  }

  private var weight: DesignSystemFontWeights {
    switch self {
    case .ultraLight: return .ultraLight
    case .thin: return .thin
    case .light: return .light
    case .regular: return .regular
    case .medium: return .medium
    case .semibold: return .semibold
    case .bold: return .bold
    case .heavy: return .heavy
    case .black: return .black
    default: return .regular
    }
  }

  public init?(rawValue: Int) {
    if let weight = DesignSystemFontWeights(rawValue: rawValue)?.weight {
      self = weight
    } else {
      return nil
    }
  }

  public var rawValue: Int {
    weight.rawValue
  }
}

extension Font.Weight: ExpressibleByIntegerLiteral {
  public init(integerLiteral value: Int) {
    self.init(rawValue: value)!
  }

  public typealias IntegerLiteralType = Int
}

private struct TypographyStyleViewModifier: ViewModifier {
  var style: TypographyStyle

  func body(content: Content) -> some View {
    content.font(style.font)
  }
}
