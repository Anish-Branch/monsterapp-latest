//
//  LoginPage.swift
//  monsterapp
//
//  Created by Anish Somani on 10/06/2023.
//

import SwiftUI
import BranchSDK

struct LoginPage: View {
    @StateObject var loginData: LoginPageModel
    @Environment (\.dismiss) var dismiss
    let uuid = UUID().uuidString
    
    var body: some View {
        VStack {
            HStack {
                dismissButton
                Spacer()
            }.padding()
            Spacer()
                .frame(height: 100)
            AppLogo()
            Spacer()
                .frame(height: 50)
            VStack(spacing: 20) {
                ThemeTextField(placeholder: "username", isSecure: false, text: $loginData.email)
                ThemeTextField(placeholder: "password", isSecure: true, text: $loginData.password)
                ThemeButton(title: loginData.registerUser ? "Create account" : "Login") {
                    if loginData.registerUser {
                        loginData.Register()
                    }
                    else {
                        loginData.Login()
                        branchEventLogin()
                        Branch.getInstance().setIdentity(uuid)
                        print("The Branch user setIdentity is \(uuid)")
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal)
        .background(Constants.Colors.appBackground)
        .navigationBarBackButtonHidden()
    }

    @ViewBuilder
    var dismissButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "arrow.left")
                .font(.title2)
                .foregroundColor(Color.black.opacity(0.7))
        }
    }
}

// Branch.io - Track Event - User Login
func branchEventLogin(){
    // Create a BranchUniversalObject with your content data:
    let branchUniversalObject = BranchUniversalObject.init()

    // Create a BranchEvent:
    let event = BranchEvent.standardEvent(.login)

    // Add the BranchUniversalObject with the content (do not add an empty branchUniversalObject):
    event.contentItems     = [ branchUniversalObject ]

    // Add relevant event data:
    event.alias            = "User Login"
    event.eventDescription = "User has logged in"
    event.logEvent() // Log the event.
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage(loginData: LoginPageModel(registerUser: true))
    }
}

struct ThemeTextField: View {
    let placeholder: String
    let isSecure: Bool
    @Binding var text: String
    var body: some View {
        if isSecure {
            SecureField(placeholder, text: $text)
                .padding()
                .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.gray, lineWidth: 1)
                    )
        }
        else {
            TextField(placeholder, text: $text)
                .textInputAutocapitalization(.never)
                .padding()
                .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.gray, lineWidth: 1)
                    )
        }
    }
}
