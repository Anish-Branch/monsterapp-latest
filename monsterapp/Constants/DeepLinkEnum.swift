//
//  DeepLinkEnum.swift
//  monsterapp
//
//  Created by Ayan Ansari on 03/07/23.
//

import Foundation

enum DeepLinkEnum {
    case homeView
    case productListView
    case productDetailView(id: Int)
    case profileView
    case loginView
    case createAccountView
    
    var value: String {
        switch self {
        case .homeView:
            return ""
        case .productListView:
            return "shop/items.html"
        case .productDetailView(let id):
            return "shop/item-detail.html?id=\(id)"
        case .profileView:
            return "profile/user.html"
        case .loginView:
            return "profile/login.html"
        case .createAccountView:
            return "profile/create-account.html"
        }
    }
}
