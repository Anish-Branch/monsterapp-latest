//
//  ContentView.swift
//  Shared
//
//  Created by Anish Somani on 10/06/2023.
//

import SwiftUI
import BranchSDK
import AppTrackingTransparency
import AdSupport


struct ContentView: View {
    // Log Status..
    @EnvironmentObject var sharedData: SharedDataModel
    @EnvironmentObject var loginData: LoginPageModel
    @AppStorage("log_Status") var log_Status: Bool = false
    var body: some View {
        Group {
            if log_Status {
                MainPage()
            }
            else{
                OnBoardingPage()
            }
        }.onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
            ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                if (status == .authorized) {
                    let idfa = ASIdentifierManager.shared().advertisingIdentifier
                    print("IDFA: " + idfa.uuidString)
                } else {
                    print("Failed to get IDFA")
                }
                // Branch.io - Track ATT Opt-In and Opt-Out
                Branch.getInstance().handleATTAuthorizationStatus(status.rawValue)
            })
        }
        .onAppear {
            NotificationCenter.default.addObserver(forName: Notification.Name("HANDLEDEEPLINK"), object: nil, queue: nil) { notification in
                guard let userInfo = notification.userInfo as? Dictionary<String, Any> else {return}
                
                if let canonicalUrl = userInfo["canonicalUrl"] as? String {
                    sharedData.selectedProduct = nil
                    let deepLinkUrl = canonicalUrl.replacingOccurrences(of: "https://monster-site.github.io/", with: "")
                    if deepLinkUrl.isEmpty {
                        log_Status = true
                        sharedData.currentTab = .Home
                    } else if deepLinkUrl == DeepLinkEnum.productListView.value {
                        log_Status = true
                        sharedData.currentTab = .Menu
                    } else if deepLinkUrl == DeepLinkEnum.profileView.value {
                        log_Status = true
                        sharedData.currentTab = .Profile
                    } else if deepLinkUrl.contains("id=") {
                        let productId = canonicalUrl.replacingOccurrences(of: "https://monster-site.github.io/shop/item-detail.html?id=", with: "")
                        print("ProductId = \(productId)")
                        showDetailsView(of: productId)
                    } else if deepLinkUrl == DeepLinkEnum.loginView.value {
                        // MARK: navigate to login view
                        loginData.Logout()
                        sharedData.logInTypeSelection = .login
                    } else if deepLinkUrl == DeepLinkEnum.createAccountView.value {
                        // MARK: navigate to create acount view
                        loginData.Logout()
                        sharedData.logInTypeSelection = .register
                    }
                }
            }
        }
    }
    
    private func showDetailsView(of productId: String) {
        let homeViewModel = HomeViewModel()
        let filteredProduct = homeViewModel.products.first { $0.productId == productId }
        if let product = filteredProduct {
            log_Status = true
            sharedData.currentTab = .Menu
            sharedData.selectedProduct = product
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

