//
//  OnBoardingPage.swift
//  monsterapp
//
//  Created by Anish Somani on 10/06/2023.
//

import SwiftUI

// To Use the custom font on all pages..
let customFont = "Raleway-Regular"

struct OnBoardingPage: View {
    // Showing Login Page...
    @State var showLoginPage: Bool = false
    var body: some View {
        
//        VStack(alignment: .leading){
//
//            GeometryReader { geometry in
//                VStack {
//                    Image("monster-store-logo-light-bkg")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: min(geometry.size.width, geometry.size.height) * 0.8)
//
//
//                }
//
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//            }
//
//            Button {
//                withAnimation{
//                    showLoginPage = true
//                }
//            } label: {
//
//                Text("Create Account")
//                    .font(.custom(customFont, size: 18))
//                    .fontWeight(.semibold)
//                    .padding(.vertical,18)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.white)
//                    .cornerRadius(20)
//                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 5, y: 5)
//                    .foregroundColor(Color("Purple"))
//            }
//
//
//            .padding(.horizontal,30)
//            // Adding Some Adjustments only for larger displays...
//            .offset(y: getRect().height < 750 ? 20 : 0)
//
//            Spacer()
//        }
//
//
//
//        .padding()
//        .padding(.top,getRect().height < 750 ? 0 : 20)
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(
//
//            Color.white
//        )
//        .overlay(
//
//            Group{
//                if showLoginPage{
//                    LoginPage()
//                        .transition(.move(edge: .bottom))
//                }
//            }
//        )

        VStack {
            Text("**Monster**App")
                .font(.system(size: 40))
                .padding(.top, 70)
            Spacer()
                .frame(height: 100)

            VStack {
                Text("Existing User?")
                ThemeButton(title: "Login") {

                }
                .padding(.horizontal, 20)
            }
            Spacer()
                .frame(height: 50)
            VStack {
                Text("New User?")
                ThemeButton(title: "Create account") {

                }
                .padding(.horizontal, 20)
            }

            Spacer()
            Button("Continue as guest") {

            }
            .fontWeight(.bold)
            .foregroundColor(Constants.Colors.themeBlue)
        }
        .background(Constants.Colors.appBackground)
    }
}

struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage()
    }
}

// Extending View to get Screen Bounds..
extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
