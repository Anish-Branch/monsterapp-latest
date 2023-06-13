//
//  ThemeButton.swift
//  monsterapp
//
//  Created by Zubair Nagori on 12/06/23.
//

import SwiftUI

struct ThemeButton: View {
    let title: String
    let height: CGFloat
    let fontSize: CGFloat
    let weight: Font.Weight
    let action: () -> Void

    init(title: String, fontSize: CGFloat = 20, height: CGFloat = 50, weight: Font.Weight = .bold , action: @escaping () -> Void) {
        self.title = title
        self.height = height
        self.fontSize = fontSize
        self.weight = weight
        self.action = action
    }

    var body: some View {
        Button(title) {
            action()
        }
        .frame(maxWidth: .infinity, maxHeight: height)
        .foregroundColor(.white)
        .font(.system(size: fontSize, weight: weight))
        .background(Constants.Colors.themeBlue)
        .clipShape(
            Capsule()
        )
    }
}

struct ThemeButton_Previews: PreviewProvider {
    static var previews: some View {
        ThemeButton(title: "Hit me!") {}
    }
}
