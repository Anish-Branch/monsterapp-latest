//
//  MainPage.swift
//  monsterapp
//
//  Created by Anish Somani on 10/06/2023.
//

import SwiftUI
import BranchSDK

struct MainPage: View {
    
    // Current Tab...
    @EnvironmentObject var sharedData: SharedDataModel
    @EnvironmentObject var loginData: LoginPageModel
    
    // Animation Namespace...
    @Namespace var animation
    
    // Hiding Tab Bar...
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        VStack {
            // Tab View...
            TabView(selection: $sharedData.currentTab) {
                ReferAFriendView()
                    .tag(Tab.Home)

                ProductListing()
                    .tag(Tab.Menu)

                ProfilePage()
                    .tag(Tab.Profile)

                /* Old Code
                LikedPage()
                    .environmentObject(sharedData)
                    .tag(Tab.Liked)
                CartPage()
                    .environmentObject(sharedData)
                    .tag(Tab.Cart)
                 */
            }

            TabBarView(currentTab: $sharedData.currentTab)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .fullScreenCover(item: $sharedData.selectedProduct) { product in
            ProductDetailsPage(product: product)
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

// Making Case Iteratable...
// Tab Cases...
enum Tab: String,CaseIterable{
    
    // Raw Value must be image Name in asset..
    case Home = "Home"
    case Profile = "Profile"
    case Menu = "Menu"
    
    /* Old Code
    //case Liked = "Liked"
    //case Cart = "Cart"
    */
    
     }

struct TabBarView: View {
    @Binding var currentTab: Tab
    var body: some View {
        HStack(spacing: 0){
            ForEach(Tab.allCases,id: \.self){ tab in

                Button {
                    // updating tab...
                    currentTab = tab
                } label: {

                    Image(tab.rawValue)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 22, height: 22)
                    // Applying little shadow at bg...
                        .background(

                            Color("ThemeButtonColor")
                                .opacity(0.1)
                                .cornerRadius(5)
                            // blurring...
                                .blur(radius: 5)
                            // Making little big...
                                .padding(-7)
                                .opacity(currentTab == tab ? 1 : 0)

                        )
                        .frame(maxWidth: .infinity)
                        .foregroundColor(currentTab == tab ? Color("ThemeButtonColor") : Color.black.opacity(0.3))
                }
            }
        }
    }
}
