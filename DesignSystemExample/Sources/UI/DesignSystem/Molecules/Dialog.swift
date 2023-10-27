//
//  Dialog.swift
//
//
//  Created by Ernest Chechelski on 16/09/2023.
//

import SwiftUI

struct Dialog: View {
  struct Configuration {
    let image: any ImageAsset
    let status: Status
    let title: String
    let description: String
    let primaryButton: ButtonConfiguration
    let secondaryButton: ButtonConfiguration
    let onClose: () -> Void

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

      var buttonStyleConfiguration: ButtonStyleConfiguration {
        .init(status: buttonStatus)
      }
    }
  }

  let configuration: Configuration

  var body: some View {
    DialogBase(
      configuration: .init(onClose: configuration.onClose),
      topImage: {
        ZStack {
          Circle().fill(configuration.status.colorThird).frame(width: 40, height: 40)
          Circle().fill(configuration.status.colorSecond).frame(width: 30, height: 30)
          Circle().fill(configuration.status.colorFirst).frame(width: 20, height: 20)
          configuration.image.asImage
            .renderingMode(.template)
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(configuration.status.colorMain)
        }
      },
      title: {
        Text(configuration.title)
          .typography(
            Typography.Paragraps.md(
              weight: .semibold
            )
          )
          .foregroundStyle(
            Colors.Main.Grays.color900
          )
      },
      description: {
        Text(configuration.description)
          .typography(
            Typography.Paragraps.md(
              weight: .regular
            )
          )
          .foregroundStyle(
            Colors.Main.Grays.color500
          )
      },
      primaryButton: {
        Button {
          configuration.primaryButton.onTap()

        } label: {
          Text(configuration.primaryButton.title)
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(
          ButtonPrimaryLG(
            buttonStyleConfiguration: configuration.status.buttonStyleConfiguration
          )
        )
      },
      secondaryButton: {
        Button {
          configuration.secondaryButton.onTap()
        } label: {
          Text(configuration.secondaryButton.title)
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.buttonSecondaryMD)
      }
    )
  }
}

import UIKit

private extension Dialog.Configuration.Status {
  var colorMain: Color {
    switch self {
    case .default: return Colors.Main.Primary.color600
    case .success: return Colors.Main.Success.color600
    case .warning: return Colors.Main.Warning.color600
    case .danger: return Colors.Main.Danger.color600
    }
  }

  var colorFirst: Color {
    switch self {
    case .default: return Colors.Main.Primary.color400
    case .success: return Colors.Main.Success.color400
    case .warning: return Colors.Main.Warning.color400
    case .danger: return Colors.Main.Danger.color400
    }
  }

  var colorSecond: Color {
    switch self {
    case .default: return Colors.Main.Primary.color300
    case .success: return Colors.Main.Success.color300
    case .warning: return Colors.Main.Warning.color300
    case .danger: return Colors.Main.Danger.color300
    }
  }

  var colorThird: Color {
    switch self {
    case .default: return Colors.Main.Primary.color200
    case .success: return Colors.Main.Success.color200
    case .warning: return Colors.Main.Warning.color200
    case .danger: return Colors.Main.Danger.color200
    }
  }
}

private struct DialogBase<
  TopImage: View,
  Title: View,
  Description: View,
  PrimaryButton: View,
  SecondaryButton: View
>: View {
  struct Configuration {
    let onClose: () -> Void
  }

  let configuration: Configuration
  let topImage: () -> TopImage
  let title: () -> Title
  let description: () -> Description
  let primaryButton: () -> PrimaryButton
  let secondaryButton: () -> SecondaryButton

  var body: some View {
    VStack(alignment: .leading) {
      VStack(alignment: .leading, spacing: 12) {
        HStack(alignment: .top) {
          topImage()

          Spacer()

          Button {
            configuration.onClose()
          } label: {
            Image(systemName: "xmark")
              .resizable()
              .frame(
                width: 10,
                height: 10
              )
          }
          .foregroundColor(
            Colors.Main.Grays.color600
          )
        }

        VStack(alignment: .leading, spacing: 4) {
          title()
          description()
        }

        VStack {
          primaryButton()
          secondaryButton()
        }
      }
      .padding(24)
    }
    .background(
      Colors.Main.Base.white
    )

    .clipShape(
      RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
    )
    .overlay( /// apply a rounded border
      RoundedRectangle(cornerRadius: 8)
        .stroke(Colors.Main.Primary.color200, lineWidth: 1)
    )
  }
}
