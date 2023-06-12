//
//  ThemeButton.swift
//  monsterapp
//
//  Created by Zubair Nagori on 12/06/23.
//

import SwiftUI

struct ThemeButton: View {
    let title: String
    let action: () -> Void
    var body: some View {
        Button(title) {
            action()
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .foregroundColor(.white)
        .font(.system(size: 20, weight: .bold))
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
