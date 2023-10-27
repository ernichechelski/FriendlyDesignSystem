import SwiftUI

struct AlertDemo: View {
  let statuses: [AlertCommons.Status] = [
    .default,
    .success,
    .warning,
    .danger,
  ]

  var body: some View {
    ScrollView {
      VStack {
        ForEach(statuses, id: \.hashValue) { status in
          Alert(configuration: .init(
            image: Image(systemName: "face.smiling.inverse"),
            status: status,
            title: "Dialog \(status)",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Purus faucibus sit sit facilisis dictumst bibendum.",
            button: .init(title: "Link", status: .normal, onTap: {}),
            componentType: .standard,
            onClose: {}
          ))
        }

        ForEach(statuses, id: \.hashValue) { status in
          Alert(configuration: .init(
            image: Image(systemName: "face.smiling.inverse"),
            status: status,
            title: "Dialog \(status)",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Purus faucibus sit sit facilisis dictumst bibendum.",
            button: .init(title: "Link", status: .normal, onTap: {}),
            componentType: .plain,
            onClose: {}
          ))
        }

        ForEach(statuses, id: \.hashValue) { status in
          AlertCloseIcon(configuration: .init(
            image: Image(systemName: "face.smiling.inverse"),
            status: status,
            title: "Dialog \(status)",
            onClose: {}
          ))
        }

        ForEach(statuses, id: \.hashValue) { status in
          AlertIcon(configuration: .init(
            image: Image(systemName: "face.smiling.inverse"),
            status: status,
            title: "Dialog \(status)"
          ))
        }

        ForEach(statuses, id: \.hashValue) { status in
          AlertBase(configuration: .init(
            status: status,
            title: "Dialog \(status)"
          ))
        }

        ForEach(statuses, id: \.hashValue) { status in
          AlertSlotBottom(configuration: .init(
            image: Image(systemName: "face.smiling.inverse"),
            status: status,
            title: "Dialog \(status)",
            description: "Lorem ipsum dolor sit amet elit.",
            componentType: .standard,
            onClose: {}
          )) {
            HStack {
              Button {} label: {
                Text("Slot button")
              }
              .buttonStyle(.buttonSecondaryMD)
              Spacer()
              Button {} label: {
                Text("Slot button")
              }
              .buttonStyle(ButtonSecondaryMD(buttonStyleConfiguration: .init(status: .danger)))
            }
          }
        }
      }
      .padding(20)
    }
    .navigationTitle("Alert Demo")
  }
}

struct Alert_Previews: PreviewProvider {
  static var previews: some View {
    AlertDemo()
  }
}
