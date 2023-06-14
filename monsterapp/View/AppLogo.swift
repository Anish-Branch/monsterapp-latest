//
//  AppLogo.swift
//  monsterapp
//
//  Created by Anish Somani on 12/06/23.
//

import SwiftUI

struct AppLogo: View {
    var body: some View {
        Image("monster_app_logo")
            .resizable()
            .frame(width: 300, height: 50)
            .scaledToFit()

    }
}

struct AppLogo_Previews: PreviewProvider {
    static var previews: some View {
        AppLogo()
    }
}
