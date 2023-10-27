import SwiftUI

struct TypographyDemo: View {
  let typographies: [TypographyStyle] = [
    Typography.Headings.h1Bold,
    Typography.Headings.h2Bold,
    Typography.Headings.h3Bold,
    Typography.Headings.h4Bold,

    Typography.Paragraps.lg(weight: .ultraLight),
    Typography.Paragraps.lg(weight: .thin),
    Typography.Paragraps.lg(weight: .light),
    Typography.Paragraps.lg(weight: .regular),
    Typography.Paragraps.lg(weight: .medium),
    Typography.Paragraps.lg(weight: .semibold),
    Typography.Paragraps.lg(weight: .bold),
    Typography.Paragraps.lg(weight: .heavy),
    Typography.Paragraps.lg(weight: .black),

    Typography.Paragraps.md(weight: .ultraLight),
    Typography.Paragraps.md(weight: .thin),
    Typography.Paragraps.md(weight: .light),
    Typography.Paragraps.md(weight: .regular),
    Typography.Paragraps.md(weight: .medium),
    Typography.Paragraps.md(weight: .semibold),
    Typography.Paragraps.md(weight: .bold),
    Typography.Paragraps.md(weight: .heavy),
    Typography.Paragraps.md(weight: .black),

    Typography.Paragraps.sm(weight: .ultraLight),
    Typography.Paragraps.sm(weight: .thin),
    Typography.Paragraps.sm(weight: .light),
    Typography.Paragraps.sm(weight: .regular),
    Typography.Paragraps.sm(weight: .medium),
    Typography.Paragraps.sm(weight: .semibold),
    Typography.Paragraps.sm(weight: .bold),
    Typography.Paragraps.sm(weight: .heavy),
    Typography.Paragraps.sm(weight: .black),

    Typography.Paragraps.xd(weight: .ultraLight),
    Typography.Paragraps.xd(weight: .thin),
    Typography.Paragraps.xd(weight: .light),
    Typography.Paragraps.xd(weight: .regular),
    Typography.Paragraps.xd(weight: .medium),
    Typography.Paragraps.xd(weight: .semibold),
    Typography.Paragraps.xd(weight: .bold),
    Typography.Paragraps.xd(weight: .heavy),
    Typography.Paragraps.xd(weight: .black)
  ]

  var body: some View {
    VStack(alignment: .leading) {
      ForEach(typographies, id: \.font) { typography in
        Text("Text").typography(typography)
      }
    }
    .padding(20)
    .navigationTitle("Design system typography")
  }
}
