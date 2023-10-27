//
//  File.swift
//
//
//  Created by Ernest Chechelski on 16/09/2023.
//

import SwiftUI

/// https://www.figma.com/file/hKXXIkoLyH0dtFt2vkvKgB/%F0%9F%A4%97--Friendly-UI-kit-(Community)?type=design&node-id=517-14822&mode=design

protocol ImageAsset: Equatable {
  var asImage: Image { get }
}

extension Image: ImageAsset {
  var asImage: Image { self }
}
