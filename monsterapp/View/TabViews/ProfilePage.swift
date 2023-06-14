//
//  ProfilePage.swift
//  monsterapp
//
//  Created by Anish Somani on 10/06/2023.
//

import SwiftUI
import BranchSDK
import UserNotifications

struct ProfilePage: View {
    @State private var showReferAFriendView = false
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                    .frame(height: 50)
                Text("Hello, \(userName ?? "")")
                    .font(.system(size: 25, weight: .bold))
                Spacer().frame(height: 40)
                Image(systemName: "person.circle.fill")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .foregroundColor(Color(UIColor.lightGray))
                    .scaledToFit()
                Text(userName ?? "")
                    .font(.system(size: 18, weight: .medium))

                ThemeButton(title: "Refer a friend") {
                    //Show refer a friend screen
                    //showReferAFriendView = true
                }
                ThemeButton(title: "Logout") {
                    loginData.Logout()
                }
                Spacer()
            }
            .ignoresSafeArea()
            .padding()
            .frame(maxWidth: .infinity)
            .background(Constants.Colors.appBackground)
            .navigationDestination(isPresented: $showReferAFriendView) {
                ReferAFriendView()
            }
        }
    }

    var userName: String? {
        loginData.loggedInUserName
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}

