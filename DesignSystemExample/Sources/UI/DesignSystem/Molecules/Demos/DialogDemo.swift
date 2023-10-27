import SwiftUI

struct DialogDemo: View {
  let statuses: [Dialog.Configuration.Status] = [
    .default,
    .success,
    .warning,
    .danger,
  ]

  var body: some View {
    VStack {
      ForEach(statuses, id: \.hashValue) { status in
        Dialog(configuration: .init(
          image: Image(systemName: "face.smiling.inverse"),
          status: status,
          title: "Dialog \(status)",
          description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Purus faucibus sit sit facilisis dictumst bibendum.",
          primaryButton: .init(title: "Button", status: .normal, onTap: {}),
          secondaryButton: .init(title: "Button", status: .normal, onTap: {}),
          onClose: {}
        ))
      }
    }
    .padding(20)
    .navigationTitle("DialogDemo")
  }
}

struct Dialog_Previews: PreviewProvider {
  static var previews: some View {
    DialogDemo()
  }
}
