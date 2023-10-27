import SwiftUI

struct DesignSystemDemo: View {
  var body: some View {
    NavigationView {
      List {
        Section {
          NavigationLink(
            destination: ScrollView([.horizontal, .vertical]) {
              ButtonStylesDemo()
            },
            label: { Text("Button Styles") }
          )
        } header: {
          Text("Atoms")
        }

        Section {
          NavigationLink(
            destination: ScrollView([.horizontal, .vertical]) {
              ColorsDemo()
            },
            label: { Text("Colors Demo") }
          )

          NavigationLink(
            destination: ScrollView([.horizontal, .vertical]) {
              TypographyDemo()
            },
            label: { Text("Typography Demo") }
          )

          NavigationLink(
            destination: ScrollView([.horizontal, .vertical]) {
              DimensionsDemo()
            },
            label: { Text("Dimensions Demo") }
          )
        } header: {
          Text("Tokens")
        }

        Section {
          NavigationLink(
            destination: ScrollView([.horizontal, .vertical]) {
              DialogDemo().frame(width: 350)
            },
            label: { Text("Dialog Demo") }
          )

          NavigationLink(
            destination: ScrollView([.horizontal, .vertical]) {
              AlertDemo().frame(width: 360)
            },
            label: { Text("Alert Demo") }
          )
        } header: {
          Text("Molecules")
        }

        Section {
          NavigationLink(
            destination: PageBottomSlotDemo(),
            label: { Text("PageBottomSlot Demo") }
          )
        } header: {
          Text("Pages")
        }
      }
    }
  }
}

struct ButtonPrimary_Previews: PreviewProvider {
  static var previews: some View {
    DesignSystemDemo()
  }
}

