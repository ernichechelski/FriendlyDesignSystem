//
//  Colors.swift
//
//
//  Created by Ernest Chechelski on 16/09/2023.
//

import SwiftUI
import UIKit

extension Color {
  var asLinearGradient: LinearGradient {
    LinearGradient(
      colors: [
        self,
      ],
      startPoint: .center,
      endPoint: .center
    )
  }
}

enum Colors {
  enum Main {
    enum Base {
      static let white = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
      static let black = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
      static let background = Color(#colorLiteral(red: 0.9830656648, green: 0.9898479581, blue: 0.9932337403, alpha: 1))
      static let backgroundOpacity = Color(#colorLiteral(red: 0.9830656648, green: 0.9898479581, blue: 0.9932337403, alpha: 0.3974302178))
      static let transparent = Color(#colorLiteral(red: 0.9830656648, green: 0.9898479581, blue: 0.9932337403, alpha: 0))
    }

    enum Primary {
      static let color100 = Color(#colorLiteral(red: 0.8487191796, green: 0.9112572074, blue: 0.9999937415, alpha: 1))
      static let color200 = Color(#colorLiteral(red: 0.6805320382, green: 0.785240531, blue: 0.9999875426, alpha: 1))
      static let color300 = Color(#colorLiteral(red: 0.4874944687, green: 0.6511262655, blue: 0.9999822974, alpha: 1))
      static let color400 = Color(#colorLiteral(red: 0.2823529412, green: 0.4901960784, blue: 1, alpha: 1))
      static let color500 = Color(#colorLiteral(red: 0.1607843137, green: 0.4392156863, blue: 1, alpha: 1))
      static let color600 = Color(#colorLiteral(red: 0.01842319779, green: 0.2859964967, blue: 0.9728540778, alpha: 1))
      static let color700 = Color(#colorLiteral(red: 0, green: 0.2462885976, blue: 0.9592328668, alpha: 1))
      static let color800 = Color(#colorLiteral(red: 0, green: 0.2053571641, blue: 0.7923206687, alpha: 1))
      static let color900 = Color(#colorLiteral(red: 0, green: 0.1185374632, blue: 0.4279438257, alpha: 1))

      static let color500Gradient = LinearGradient(.bottomLeading, .topTrailing) {
        color500A
        color500B
      }

      private static let color500A = Color(#colorLiteral(red: 0.1607843137, green: 0.4392156863, blue: 1, alpha: 1))
      private static let color500B = Color(#colorLiteral(red: 0, green: 0.2509803922, blue: 0.7568627451, alpha: 1))
    }

    enum Grays {
      static let color100 = Color(#colorLiteral(red: 0.9694738984, green: 0.9796736836, blue: 0.989846766, alpha: 1))
      static let color200 = Color(#colorLiteral(red: 0.914696753, green: 0.9250224233, blue: 0.94217062, alpha: 1))
      static let color300 = Color(#colorLiteral(red: 0.8135786653, green: 0.8347135186, blue: 0.8696764112, alpha: 1))
      static let color400 = Color(#colorLiteral(red: 0.587572217, green: 0.6362877488, blue: 0.7097489238, alpha: 1))
      static let color500 = Color(#colorLiteral(red: 0.3913847804, green: 0.4400049448, blue: 0.5303351283, alpha: 1))
      static let color600 = Color(#colorLiteral(red: 0.2684326768, green: 0.3289117515, blue: 0.4117816985, alpha: 1))
      static let color700 = Color(#colorLiteral(red: 0.1913526952, green: 0.2507241964, blue: 0.3373598456, alpha: 1))
      static let color800 = Color(#colorLiteral(red: 0.1031582579, green: 0.1629051268, blue: 0.2282238603, alpha: 1))
      static let color900 = Color(#colorLiteral(red: 0.05482982844, green: 0.09276194125, blue: 0.1628980935, alpha: 1))
    }

    enum Success {
      static let color100 = Color(#colorLiteral(red: 0.855704844, green: 0.9898523688, blue: 0.9112538695, alpha: 1))
      static let color200 = Color(#colorLiteral(red: 0.5799353719, green: 0.9524411559, blue: 0.7530810833, alpha: 1))
      static let color300 = Color(#colorLiteral(red: 0.2187740803, green: 0.9009121656, blue: 0.6176511645, alpha: 1))
      static let color400 = Color(#colorLiteral(red: 0, green: 0.8135972619, blue: 0.4678686857, alpha: 1))
      static let color500 = Color(#colorLiteral(red: 0, green: 0.7206471562, blue: 0.3541717827, alpha: 1))
      static let color600 = Color(#colorLiteral(red: 0, green: 0.5875944495, blue: 0.2816155553, alpha: 1))
      static let color700 = Color(#colorLiteral(red: 0, green: 0.4678680301, blue: 0.2417760193, alpha: 1))
      static let color800 = Color(#colorLiteral(red: 0, green: 0.3708063364, blue: 0.2006988227, alpha: 1))
      static let color900 = Color(#colorLiteral(red: 0, green: 0.2903162241, blue: 0.1532324553, alpha: 1))
    }

    enum Warning {
      static let color100 = Color(#colorLiteral(red: 1, green: 0.9660689235, blue: 0.8452425599, alpha: 1))
      static let color200 = Color(#colorLiteral(red: 1, green: 0.8731487393, blue: 0.4797411561, alpha: 1))
      static let color300 = Color(#colorLiteral(red: 1, green: 0.7780942321, blue: 0.1085915044, alpha: 1))
      static let color400 = Color(#colorLiteral(red: 1, green: 0.6805405021, blue: 0.0005237204605, alpha: 1))
      static let color500 = Color(#colorLiteral(red: 1, green: 0.5456870198, blue: 0.0004640333063, alpha: 1))
      static let color600 = Color(#colorLiteral(red: 0.9250876307, green: 0.3748824894, blue: 0.0003516106517, alpha: 1))
      static let color700 = Color(#colorLiteral(red: 0.7674617767, green: 0.2417066097, blue: 0.0002203342301, alpha: 1))
      static let color800 = Color(#colorLiteral(red: 0.6251642108, green: 0.1819122136, blue: 0.0001387633674, alpha: 1))
      static let color900 = Color(#colorLiteral(red: 0.4279893339, green: 0.1031340286, blue: 6.0396349e-05, alpha: 1))
    }

    enum Danger {
      static let color100 = Color(#colorLiteral(red: 1, green: 0.9318864346, blue: 0.9284593463, alpha: 1))
      static let color200 = Color(#colorLiteral(red: 1, green: 0.7958776355, blue: 0.7852399945, alpha: 1))
      static let color300 = Color(#colorLiteral(red: 1, green: 0.6138803363, blue: 0.5951470733, alpha: 1))
      static let color400 = Color(#colorLiteral(red: 1, green: 0.3954336047, blue: 0.3708401024, alpha: 1))
      static let color500 = Color(#colorLiteral(red: 1, green: 0.1723070443, blue: 0.15819332, alpha: 1))
      static let color600 = Color(#colorLiteral(red: 0.925095737, green: 0, blue: 0.003475361038, alpha: 1))
      static let color700 = Color(#colorLiteral(red: 0.7674660087, green: 0, blue: 0.0002027782903, alpha: 1))
      static let color800 = Color(#colorLiteral(red: 0.6176979542, green: 0.0439767018, blue: 0.04428168386, alpha: 1))
      static let color900 = Color(#colorLiteral(red: 0.411821723, green: 0.03158235177, blue: 0.003219473176, alpha: 1))
    }
  }

  enum Extended {
    enum Yellow {
      static let color100 = Color(#colorLiteral(red: 1, green: 0.9864560962, blue: 0.8347221613, alpha: 1))
      static let color200 = Color(#colorLiteral(red: 1, green: 0.9353125691, blue: 0.5303800106, alpha: 1))
      static let color300 = Color(#colorLiteral(red: 1, green: 0.8870409131, blue: 0.3584053516, alpha: 1))
      static let color400 = Color(#colorLiteral(red: 1, green: 0.7673860192, blue: 0.0005713430583, alpha: 1))
      static let color500 = Color(#colorLiteral(red: 0.9593068957, green: 0.6584787965, blue: 0.0004795405257, alpha: 1))
      static let color600 = Color(#colorLiteral(red: 0.8347612023, green: 0.5109583735, blue: 0.0003275850613, alpha: 1))
      static let color700 = Color(#colorLiteral(red: 0.673271358, green: 0.3457544446, blue: 0.000187553218, alpha: 1))
      static let color800 = Color(#colorLiteral(red: 0.5572413802, green: 0.2772091925, blue: 0.0001228730689, alpha: 1))
      static let color900 = Color(#colorLiteral(red: 0.411821723, green: 0.03158235177, blue: 0.003219473176, alpha: 1))
    }

    enum Orange {
      static let color100 = Color(#colorLiteral(red: 1, green: 0.942168355, blue: 0.8870564103, alpha: 1))
      static let color200 = Color(#colorLiteral(red: 0.9966465831, green: 0.8557186723, blue: 0.6622084975, alpha: 1))
      static let color300 = Color(#colorLiteral(red: 1, green: 0.6878640056, blue: 0.4360339046, alpha: 1))
      static let color400 = Color(#colorLiteral(red: 1, green: 0.5031568408, blue: 0.1773553789, alpha: 1))
      static let color500 = Color(#colorLiteral(red: 1, green: 0.3665849566, blue: 0.0004094435426, alpha: 1))
      static let color600 = Color(#colorLiteral(red: 0.9490858912, green: 0.2506210208, blue: 0.0003461884044, alpha: 1))
      static let color700 = Color(#colorLiteral(red: 0.7852940559, green: 0.1579687893, blue: 0.000221416165, alpha: 1))
      static let color800 = Color(#colorLiteral(red: 0.6251652837, green: 0.1433832943, blue: 0.03496656194, alpha: 1))
      static let color900 = Color(#colorLiteral(red: 0.3955255747, green: 0.07135283202, blue: 0.009549548849, alpha: 1))
    }

    enum Melon {
      static let color100 = Color(#colorLiteral(red: 1, green: 0.9112488627, blue: 0.9284587502, alpha: 1))
      static let color200 = Color(#colorLiteral(red: 1, green: 0.7923294306, blue: 0.8382262588, alpha: 1))
      static let color300 = Color(#colorLiteral(red: 1, green: 0.617623508, blue: 0.7024889588, alpha: 1))
      static let color400 = Color(#colorLiteral(red: 1, green: 0.3872382939, blue: 0.549572289, alpha: 1))
      static let color500 = Color(#colorLiteral(red: 1, green: 0.09245081991, blue: 0.3955237269, alpha: 1))
      static let color600 = Color(#colorLiteral(red: 0.9695520997, green: 0, blue: 0.3161846697, alpha: 1))
      static let color700 = Color(#colorLiteral(red: 0.8207040429, green: 0, blue: 0.27288118, alpha: 1))
      static let color800 = Color(#colorLiteral(red: 0.6879404187, green: 0, blue: 0.259634912, alpha: 1))
      static let color900 = Color(#colorLiteral(red: 0.4320133924, green: 0, blue: 0.1677139401, alpha: 1))
    }

    enum Pink {
      static let color100 = Color(#colorLiteral(red: 1, green: 0.9421697259, blue: 0.9864577651, alpha: 1))
      static let color200 = Color(#colorLiteral(red: 1, green: 0.7958800793, blue: 0.9421698451, alpha: 1))
      static let color300 = Color(#colorLiteral(red: 1, green: 0.387245208, blue: 0.7958878279, alpha: 1))
    }

    enum Purple {}
    enum Azure {}
    enum Aloha {}
    enum Lime {}
    enum Warm {}
  }
}

private extension LinearGradient {
  init(_ startPoint: UnitPoint, _ endPoint: UnitPoint, @ArrayBuilder<Color> colors: () -> [Color]) {
    self.init(colors: colors(), startPoint: startPoint, endPoint: endPoint)
  }
}
