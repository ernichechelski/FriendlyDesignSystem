//
//  Dimensions.swift
//  
//
//  Created by Ernest Chechelski on 16/09/2023.
//

import Foundation

protocol Dimension {
  var value: CGFloat { get }
}

enum Spacing: CGFloat, NamespacingEnum, Dimension {
  /// 2px
  case spacing0_25 = 2
  /// 4px
  case spacing0_5 = 4
  /// 8px
  case spacing1 = 8
  /// 12px
  case spacing1_5 = 12
  /// 16px
  case spacing2 = 16
  /// 24px
  case spacing3 = 24
  /// 32px
  case spacing4 = 32
  /// 40px
  case spacing5 = 40
  /// 48px
  case spacing6 = 48
  /// 56px
  case spacing7 = 56
  /// 64px
  case spacing8 = 64
  /// 72px
  case spacing9 = 72
  /// 80px
  case spacing0 = 80
  /// 96px
  case spacing12 = 96
  /// 112px
  case spacing14 = 112
  /// 128px
  case spacing16 = 128
  /// 144px
  case spacing18 = 144
  /// 160px
  case spacing20 = 160
  /// 200px
  case spacing24 = 200
  /// 240px
  case spacing30 = 240
  /// 320px
  case spacing40 = 320
  /// 400px
  case spacing50 = 400
}

enum Sizing: CGFloat, NamespacingEnum, Dimension {
  /// 2px
  case sizing0_25 = 2
  /// 4px
  case sizing0_5 = 4
  /// 8px
  case sizing1 = 8
  /// 12px
  case sizing1_5 = 12
  /// 16px
  case sizing2 = 16
  /// 24px
  case sizing3 = 24
  /// 32px
  case sizing4 = 32
  /// 40px
  case sizing5 = 40
  /// 48px
  case sizing6 = 48
  /// 56px
  case sizing7 = 56
  /// 64px
  case sizing8 = 64
  /// 72px
  case sizing9 = 72
  /// 80px
  case sizing0 = 80
  /// 96px
  case sizing12 = 96
  /// 112px
  case sizing14 = 112
  /// 128px
  case sizing16 = 128
  /// 144px
  case sizing18 = 144
  /// 160px
  case sizing20 = 160
  /// 200px
  case sizing24 = 200
  /// 240px
  case sizing30 = 240
  /// 320px
  case sizing40 = 320
  /// 400px
  case sizing50 = 400
}

enum Radius: CGFloat, CaseIterable, Dimension {
  /// 4px
  case SM = 4
  /// 8px
  case MD = 8
  /// 12px
  case LG = 12
  /// 19px
  case XL = 19
}

protocol NamespacingEnum: CaseIterable, RawRepresentable {
  var name: String { get }
}

extension RawRepresentable where Self: Dimension, RawValue == CGFloat {
  var value: CGFloat { rawValue }
}
