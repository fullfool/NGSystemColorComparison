//
//  ContentView.swift
//  NGSystemColorComparison
//
//  Created by Noah Gilmore on 6/9/19.
//  Copyright © 2019 Noah Gilmore. All rights reserved.
//

import SwiftUI

extension Color {
    init(uiColor: UIColor) {
        self.init(red: Double(uiColor.red), green: Double(uiColor.green), blue: Double(uiColor.blue))
    }
}

struct ContentView : View {
    let colors: [SystemColor]
    var body: some View {
        List(colors, id: \.name) { color in
            HStack {
                Color(uiColor: color.lightColor)
                    .frame(width: 30, height: 30)

                Color(uiColor: color.darkColor)
                    .frame(width: 30, height: 30)

                VStack(alignment: .leading, spacing: 4) {
                    Text(color.name)
                    HStack {
                        Text(color.lightHexDescription)
                            .font(.subheadline)

                        Text(color.darkHexDescription)
                            .font(.subheadline)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(colors: SystemColor.colors)
        }
    }
}
#endif
