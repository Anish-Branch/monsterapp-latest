//
//  ReferAFriendView.swift
//  monsterapp
//
//  Created by Zubair Nagori on 14/06/23.
//

import SwiftUI

struct ReferAFriendView: View {
    @Environment (\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            BackButton { dismiss() }
            Spacer()
                .frame(height: 20)
            HStack {
                Spacer()
                AppLogo()
                Spacer()
            }
            Spacer()
                .frame(height: 30)
            Text("Lorem ipsum sit, amet coetur")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod")
            ThemeButton(title: "Refer a friend") {
                //TODO: Add action
            }
            Spacer()
        }
        .ignoresSafeArea()
        .padding(.horizontal, 30)
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .background(Constants.Colors.appBackground)
        .navigationBarBackButtonHidden()
    }

}

struct ReferAFriendView_Previews: PreviewProvider {
    static var previews: some View {
        ReferAFriendView()
    }
}
