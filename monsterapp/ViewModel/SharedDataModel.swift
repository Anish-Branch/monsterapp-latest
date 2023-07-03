//
//  SharedDataModel.swift
//  monsterapp
//
//  Created by Anish Somani on 10/06/2023.
//

import SwiftUI

class SharedDataModel: ObservableObject {
    
    // Detail Product Data....
    @Published var detailProduct: Product?
    @Published var showDetailProduct: Bool = false
    @Published var selectedProduct: Product?
    
    //Home view selected tab
    @Published var currentTab: Tab = .Home
    
    // OnBoarding View Login Type
    @Published var logInTypeSelection: SelectionType?
    
    // matched Geoemtry Effect from Search page...
    @Published var fromSearchPage: Bool = false
    
    // Liked Products...
    @Published var likedProducts: [Product] = []
    
    // basket Products...
    @Published var cartProducts: [Product] = []
    
    // calculating Total price...
    func getTotalPrice()->String{
        
        var total: Int = 0
        
        cartProducts.forEach { product in
            
            let price = product.price.replacingOccurrences(of: "$", with: "") as NSString
            
            let quantity = product.quantity
            let priceTotal = quantity * price.integerValue
            
            total += priceTotal
        }
        
        return "$\(total)"
    }
}

