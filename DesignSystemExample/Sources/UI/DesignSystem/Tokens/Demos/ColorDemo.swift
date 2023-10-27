import SwiftUI

struct ColorsDemo: View {
  var firstRow: some View {
    VStack {
      HStack {
        Group {
          ColorCard(color: Colors.Main.Primary.color100)
          ColorCard(color: Colors.Main.Primary.color200)
          ColorCard(color: Colors.Main.Primary.color300)
          ColorCard(color: Colors.Main.Primary.color400)
          ColorCard(color: Colors.Main.Primary.color500)
          ColorCard(color: Colors.Main.Primary.color600)
          ColorCard(color: Colors.Main.Primary.color700)
          ColorCard(color: Colors.Main.Primary.color800)
          ColorCard(color: Colors.Main.Primary.color900)
        }
      }
      HStack {
        Group {
          ColorCard(color: Colors.Main.Grays.color100)
          ColorCard(color: Colors.Main.Grays.color200)
          ColorCard(color: Colors.Main.Grays.color300)
          ColorCard(color: Colors.Main.Grays.color400)
          ColorCard(color: Colors.Main.Grays.color500)
          ColorCard(color: Colors.Main.Grays.color600)
          ColorCard(color: Colors.Main.Grays.color700)
          ColorCard(color: Colors.Main.Grays.color800)
          ColorCard(color: Colors.Main.Grays.color900)
        }
      }
    }
  }

  var secondRow: some View {
    VStack {
      HStack {
        Group {
          ColorCard(color: Colors.Main.Success.color100)
          ColorCard(color: Colors.Main.Success.color200)
          ColorCard(color: Colors.Main.Success.color300)
          ColorCard(color: Colors.Main.Success.color400)
          ColorCard(color: Colors.Main.Success.color500)
          ColorCard(color: Colors.Main.Success.color600)
          ColorCard(color: Colors.Main.Success.color700)
          ColorCard(color: Colors.Main.Success.color800)
          ColorCard(color: Colors.Main.Success.color900)
        }
      }
      HStack {
        Group {
          ColorCard(color: Colors.Main.Warning.color100)
          ColorCard(color: Colors.Main.Warning.color200)
          ColorCard(color: Colors.Main.Warning.color300)
          ColorCard(color: Colors.Main.Warning.color400)
          ColorCard(color: Colors.Main.Warning.color500)
          ColorCard(color: Colors.Main.Warning.color600)
          ColorCard(color: Colors.Main.Warning.color700)
          ColorCard(color: Colors.Main.Warning.color800)
          ColorCard(color: Colors.Main.Warning.color900)
        }
      }
    }
  }

  var thirdRow: some View {
    HStack {
      Group {
        ColorCard(color: Colors.Main.Danger.color100)
        ColorCard(color: Colors.Main.Danger.color200)
        ColorCard(color: Colors.Main.Danger.color300)
        ColorCard(color: Colors.Main.Danger.color400)
        ColorCard(color: Colors.Main.Danger.color500)
        ColorCard(color: Colors.Main.Danger.color600)
        ColorCard(color: Colors.Main.Danger.color700)
        ColorCard(color: Colors.Main.Danger.color800)
        ColorCard(color: Colors.Main.Danger.color900)
      }
    }
  }

  var body: some View {
    VStack(alignment: .leading) {
      firstRow
      secondRow
      thirdRow
    }
    .padding(20)
    .navigationTitle("Design system colors")
  }

  struct Card<Content: View>: View {
    @ViewBuilder var content: () -> Content

    var body: some View {
      VStack {
        content()
      }
    }
  }

  struct ColorCard: View {
    var color: Color

    var body: some View {
      VStack(alignment: .leading, spacing: 0) {
        color
        Color.gray
          .frame(height: 1)
        VStack(alignment: .leading, spacing: 10) {
          Text(UIColor(color).accessibilityName)
            .fontWeight(.bold)
          Text(hex)
            .fontWeight(.light)
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 30)
      }
      .frame(width: 320, height: 240)
      .overlay(
        RoundedRectangle(cornerRadius: 20)
          .stroke(Color.gray, lineWidth: 4)
      )
      .cornerRadius(20)
    }

    private var hex: String {
      let components = UIColor(color).cgColor.components
      let r: CGFloat = components?[0] ?? 0.0
      let g: CGFloat = components?[1] ?? 0.0
      let b: CGFloat = components?[2] ?? 0.0

      let hexString = String(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
      return hexString
    }
  }
}

struct ColorsDemo_Previews: PreviewProvider {
  static var previews: some View {
    ColorsDemo()
  }
}
