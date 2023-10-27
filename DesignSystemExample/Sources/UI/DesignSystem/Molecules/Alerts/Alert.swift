//
//  File.swift
//  
//
//  Created by Chechelski Ernest on 27/09/2023.
//

import SwiftUI

enum AlertCommons {
  enum Status {
    case `default`
    case success
    case warning
    case danger

    var buttonStatus: ButtonStatus {
      switch self {
      case .default:
        return .normal
      case .success:
        return .success
      case .warning:
        return .warning
      case .danger:
        return .danger
      }
    }
  }
}

enum AlertHelpers {
  static func closeButton(onTapped: @escaping ()-> Void) -> some View {
    Button {
      onTapped()
    } label: {
      Image(systemName: "xmark").resizable().frame(width: 8, height: 8)
    }
    .foregroundColor(Colors.Main.Grays.color900)
  }
}

// MARK: - Alert

struct Alert: View {
  struct Configuration {
    let image: any ImageAsset
    let status: AlertCommons.Status
    let title: String
    let description: String
    let button: ButtonConfiguration
    let componentType: ComponentType
    let onClose: () -> Void

    enum ComponentType {
      case standard
      case plain
    }
  }

  let configuration: Configuration

  var body: some View {
    AlertLayout(
      configuration: .init(
        leftRectColor: configuration.status.colorMain,
        overridingBackgroundColor: configuration.componentType == .plain ? configuration.status.colorBackground : nil
      ),
      topImage: {
        configuration.image.asImage
          .renderingMode(.template)
          .resizable()
      },
      topTrailingContent: {
        AlertHelpers.closeButton(
          onTapped: configuration.onClose
        )
      },
      title: {
        Text(configuration.title)
          .typography(Typography.Paragraps.md(weight: .semibold))
      },
      description: {
        Text(configuration.description)
          .typography(Typography.Paragraps.md(weight: .regular))
          .foregroundColor(
            configuration.componentType == .plain ?
            configuration.status.colorForeground :
              Colors.Main.Grays.color500
          )
      },
      bottomContent: {
        Button {
          configuration.button.onTap()
        } label: {
          Text(configuration.button.title)
        }
        .typography(Typography.Paragraps.md(weight: .regular))
      }
    )
  }
}

// MARK: - AlertSlotBottom

struct AlertSlotBottom<SlotBottom: View>: View {
  struct Configuration {
    let image: any ImageAsset
    let status: AlertCommons.Status
    let title: String
    let description: String
    let componentType: ComponentType
    let onClose: () -> Void

    enum ComponentType {
      case standard
      case plain
    }
  }

  let configuration: Configuration

  let slotBottom: () -> SlotBottom

  var body: some View {
    AlertLayout(
      configuration: .init(
        leftRectColor: configuration.status.colorMain,
        overridingBackgroundColor: configuration.componentType == .plain ? configuration.status.colorBackground : nil
      ),
      topImage: {
        configuration.image.asImage
          .renderingMode(.template)
          .resizable()
      },
      topTrailingContent: {
        AlertHelpers.closeButton(
          onTapped: configuration.onClose
        )
      },
      title: {
        Text(configuration.title)
          .typography(Typography.Paragraps.md(weight: .semibold))
      },
      description: {
        Text(configuration.description)
          .typography(Typography.Paragraps.md(weight: .regular))
          .foregroundColor(
            configuration.componentType == .plain ?
            configuration.status.colorForeground :
              Colors.Main.Grays.color500
          )
      },
      bottomContent: slotBottom
    )
  }
}

// MARK: - AlertCloseIcon

struct AlertCloseIcon: View {
  struct Configuration {
    let image: any ImageAsset
    let status: AlertCommons.Status
    let title: String
    let onClose: () -> Void
  }

  let configuration: Configuration

  var body: some View {
    AlertLayout(
      configuration: .init(
        leftRectColor: configuration.status.colorMain,
        overridingBackgroundColor: nil
      ),
      topImage: {
        configuration.image.asImage
          .renderingMode(.template)
          .resizable()
      },
      topTrailingContent: {
        AlertHelpers.closeButton(
          onTapped: configuration.onClose
        )
      },
      title: {
        Text(configuration.title)
          .typography(Typography.Paragraps.md(weight: .semibold))
      },
      description: {
        EmptyView()
      },
      bottomContent: {
        EmptyView()
      }
    )
  }
}

// MARK: - AlertIcon

struct AlertIcon: View {
  struct Configuration {
    let image: any ImageAsset
    let status: AlertCommons.Status
    let title: String
  }

  let configuration: Configuration

  var body: some View {
    AlertLayout(
      configuration: .init(
        leftRectColor: configuration.status.colorMain,
        overridingBackgroundColor: nil
      ),
      topImage: {
        configuration.image.asImage
          .renderingMode(.template)
          .resizable()
      },
      topTrailingContent: {
        EmptyView()
      },
      title: {
        Text(configuration.title)
          .typography(Typography.Paragraps.md(weight: .semibold))
      },
      description: {
        EmptyView()
      },
      bottomContent: {
        EmptyView()
      }
    )
  }
}

// MARK: - AlertBase

struct AlertBase: View {
  struct Configuration {
    let status: AlertCommons.Status
    let title: String
  }

  let configuration: Configuration

  var body: some View {
    AlertLayout(
      configuration: .init(
        leftRectColor: configuration.status.colorMain,
        overridingBackgroundColor: nil
      ),
      topImage: {
        EmptyView()
      },
      topTrailingContent: {
        EmptyView()
      },
      title: {
        Text(configuration.title)
          .typography(Typography.Paragraps.md(weight: .semibold))
      },
      description: {
        EmptyView()
      },
      bottomContent: {
        EmptyView()
      }
    )
  }
}


import UIKit

private extension AlertCommons.Status {
  var colorMain: Color {
    switch self {
    case .default: return Colors.Main.Primary.color500
    case .success: return Colors.Main.Success.color500
    case .warning: return Colors.Main.Warning.color500
    case .danger: return Colors.Main.Danger.color500
    }
  }

  var colorBackground: Color {
    switch self {
    case .default: return Colors.Main.Primary.color100
    case .success: return Colors.Main.Success.color100
    case .warning: return Colors.Main.Warning.color100
    case .danger: return Colors.Main.Danger.color100
    }
  }

  var colorForeground: Color {
    switch self {
    case .default: return Colors.Main.Primary.color900
    case .success: return Colors.Main.Success.color900
    case .warning: return Colors.Main.Warning.color900
    case .danger: return Colors.Main.Danger.color900
    }
  }
}

private struct AlertLayout<
  TopImage: View,
  TopTrailingContent: View,
  Title: View,
  Description: View,
  BottomContent: View
>: View {
  struct Configuration {
    let leftRectColor: Color
    let overridingBackgroundColor: Color?
  }

  let configuration: Configuration
  let topImage: () -> TopImage
  let topTrailingContent: () -> TopTrailingContent
  let title: () -> Title
  let description: () -> Description
  let bottomContent: () -> BottomContent

  var body: some View {
    GroupBox {
      HStack(alignment: .top, spacing: 0) {
        Rectangle()
          .fill(configuration.leftRectColor)
          .frame(width: 4)

        HStack(alignment: .top, spacing: 12) {
          topImage()
            .frame(width: 12, height: 12)
            .padding(.top, Spacing.spacing0_5.value)
            .foregroundColor(configuration.leftRectColor)

          VStack(alignment: .leading, spacing: Spacing.spacing1.value) {
            HStack {
              title()

              Spacer()

              topTrailingContent()
            }

            description()

            bottomContent()
          }
        }
        .padding(10)
      }
    }
    .groupBoxStyle(
      .plain(
        overridingBackgroundColor: configuration.overridingBackgroundColor
      )
    )
  }
}
