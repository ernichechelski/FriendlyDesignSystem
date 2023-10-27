import SwiftUI

struct DimensionsDemo: View {
  var body: some View {
    HStack(alignment: .top, spacing: 160) {
      SpacingDemo()
      SizingDemo()
      RadiusDemo()
    }
    .padding(40)
  }
}

struct RadiusDemo: View {
  var body: some View {
    TokenDemo(
      configuration: .init(
        title: "Radius",
        image: Image(systemName: "circle")
      )
    ) {
      RadiusGrid()
    }
  }

  struct RadiusGrid: View {
    var body: some View {
      HStack(spacing: 40) {
        ForEach(Radius.allCases, id: \.rawValue) { radius in
          VStack {
            VStack(alignment: .leading) {
              RoundedRectangle(cornerSize: .init(width: radius.rawValue, height: radius.rawValue))
                .fill(Colors.Main.Base.white)
                .frame(width: 300, height: 300)
            }
            HStack {
              Text("\(String(describing: radius))")
                .typography(Typography.Paragraps.lg(weight: .semibold))
              Spacer()
              Text("\(radius.rawValue.displayable)px")
                .typography(Typography.Paragraps.md(weight: .regular))
            }
          }
        }
      }
    }
  }
}

struct SizingDemo: View {
  var body: some View {
    TokenDemo(
      configuration: .init(
        title: "Sizing",
        image:  Image(systemName: "arrowshape.turn.up.backward.circle")
      )
    ) {
      SizingGrid()
    }
  }

  struct SizingGrid: View {
    var body: some View {
      Grid(alignment: .leading, horizontalSpacing: 80, verticalSpacing: 32) {
        ForEach(Sizing.allCases, id: \.rawValue) { sizing in
          GridRow {
            Text("\(sizing.name)")
              .typography(Typography.Paragraps.lg(weight: .semibold))
            Text("\(sizing.rawValue.displayable)px")
              .typography(Typography.Paragraps.md(weight: .regular))
            VStack(alignment: .leading) {
              ZStack(alignment: .leading) {
                RoundedRectangle(cornerSize: .init(width: 2, height: 2))
                  .fill(Colors.Main.Primary.color100)
                  .frame(width: sizing.rawValue, height: 20)
                Text("\(sizing.rawValue.displayable)px")
                  .foregroundColor(Colors.Main.Primary.color500)
                  .typography(Typography.Paragraps.md(weight: .regular))
                  .padding(.horizontal, 4)
              }
            }
          }
        }
      }
    }
  }
}

struct TokenDemo<Content: View>: View {
  struct Configuration {
    let title: String
    let image: any ImageAsset
  }

  let configuration: Configuration
  let content: () -> Content

  var body: some View {
    VStack(alignment: .leading) {
      HStack(spacing: 32) {
        configuration.image.asImage
          .resizable()
          .renderingMode(.template)
          .frame(width: 40, height: 40)
          .foregroundColor(Colors.Main.Primary.color500)

        Text(configuration.title)
          .font(Font.system(size: 40, weight: 500))

        TodoView(text: "Stability Token")
      }
      .padding(80)
      VStack(alignment: .leading, spacing: 65) {
        Text(configuration.title)
          .typography(Typography.Headings.h1Bold)
        content()
      }
      .padding(80)
      .background(Colors.Main.Grays.color100)
      HStack(spacing: 32) {
        Text("Friendly UI Kit 🤗")
          .typography(Typography.Headings.h3Bold)
      }
      .padding(80)
    }
    .cornerRadius(40)
    .overlay(
      RoundedRectangle(cornerRadius: 20)
        .stroke(
          Colors.Main.Grays.color100,
          lineWidth: 1
        )
    )
    .padding(40)
  }
}

struct SpacingDemo: View {

  var body: some View {
    TokenDemo(
      configuration: .init(
        title: "Spacing",
        image:  Image(systemName: "arrowshape.turn.up.backward.circle")
      )
    ) {
      SpacingGrid()
    }
  }

  struct SpacingGrid: View {
    var body: some View {
      Grid(alignment: .leading, horizontalSpacing: 80, verticalSpacing: 32) {
        ForEach(Spacing.allCases, id: \.rawValue) { spacing in
          GridRow {
            Text(spacing.name)
              .typography(Typography.Paragraps.lg(weight: .semibold))
            Text("\(spacing.rawValue.displayable)px")
              .typography(Typography.Paragraps.md(weight: .regular))
            VStack(alignment: .leading) {
              ZStack(alignment: .leading) {
                RoundedRectangle(cornerSize: .init(width: 2, height: 2))
                  .fill(Colors.Main.Primary.color100)
                  .frame(width: spacing.rawValue, height: 20)
                Text("\(spacing.rawValue.displayable)px")
                  .foregroundColor(Colors.Main.Primary.color500)
                  .typography(Typography.Paragraps.md(weight: .regular))
                  .padding(.horizontal, 4)
              }
            }
          }
        }
      }
    }
  }
}

fileprivate extension CGFloat {
  var displayable: String {
    String(format: "%.0f", Double(self))
  }
}

struct DimensionsDemo_Previews: PreviewProvider {
  static var previews: some View {
    ScrollView([.horizontal, .vertical]) {
      DimensionsDemo()
    }
  }
}

/// TODO: - Write a stencil based test for all NamespacingEnum conformations.
extension NamespacingEnum {
  var name: String {
    String(describing:self)
      .replacingOccurrences(
        of: "\(type(of: self))".lowercased(),
        with: ""
      )
  }
}
