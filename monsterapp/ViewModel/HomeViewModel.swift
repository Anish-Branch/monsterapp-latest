//
//  HomeViewModel.swift
//  monsterapp
//
//  Created by Anish Somani on 10/06/2023.
//

import SwiftUI

// Using Combine to monitor search field and if user leaves for .5 secs then starts searching...
// to avoid memory issue...
import Combine

class HomeViewModel: ObservableObject {

    @Published var productType: ProductType = .ECOMMERCE
    
    // Sample Products...
    @Published var products: [Product] = [
    
        /*
        Product(type: .Astronaut, title: "Astrocreep", subtitle: "Astronaut Monster", price: "$5", productImage: "astronaut-1", productId: "astronaut-1", sellingPrice: 5.00),
        Product(type: .Astronaut, title: "Starbeast", subtitle: "Astronaut Monster", price: "$5", productImage: "astronaut-2", productId: "astronaut-2", sellingPrice: 5.00),
        Product(type: .Astronaut, title: "Cosmic Critter", subtitle: "Astronaut Monster", price: "$5", productImage: "astronaut-3", productId: "astronaut-3", sellingPrice: 5.00),
        Product(type: .Astronaut, title: "Galaxy Gobbler", subtitle: "Astronaut Monster", price: "$5", productImage: "astronaut-4", productId: "astronaut-4", sellingPrice: 5.00),
        Product(type: .Baby, title: "Cuddlekins", subtitle: "Baby Monster", price: "$5", productImage: "baby-1", productId: "baby-1", sellingPrice: 5.00),
        Product(type: .Baby, title: "Pipsqueak", subtitle: "Baby Monster", price: "$5", productImage: "baby-2", productId: "baby-2", sellingPrice: 5.00),
        Product(type: .Baby, title: "Snugglebug", subtitle: "Baby Monster", price: "$5", productImage: "baby-3", productId: "baby-3", sellingPrice: 5.00),
        Product(type: .Baby, title: "Little Critter", subtitle: "Baby Monster", price: "$5", productImage: "baby-4", productId: "baby-4", sellingPrice: 5.00),
        Product(type: .Bear, title: "Grizzlygeist", subtitle: "Bear Monster", price: "$5", productImage: "bear-1", productId: "bear-1", sellingPrice: 5.00),
        Product(type: .Bear, title: "Kodiakiller", subtitle: "Bear Monster", price: "$5", productImage: "bear-2", productId: "bear-2", sellingPrice: 5.00),
        Product(type: .Bear, title: "Polar Predator", subtitle: "Bear Monster", price: "$5", productImage: "bear-3", productId: "bear-3", sellingPrice: 5.00),
        Product(type: .Bear, title: "Fuzzy Fury", subtitle: "Bear Monster", price: "$5", productImage: "bear-4", productId: "bear-4", sellingPrice: 5.00),
        Product(type: .Bird, title: "Talon Terror", subtitle: "Bird Monster", price: "$5", productImage: "bird-1", productId: "bird-1", sellingPrice: 5.00),
        Product(type: .Bird, title: "Winged Warrior", subtitle: "Bird Monster", price: "$5", productImage: "bird-2", productId: "bird-2", sellingPrice: 5.00),
        Product(type: .Bird, title: "Beak Beast", subtitle: "Bird Monster", price: "$5", productImage: "bird-3", productId: "bird-3", sellingPrice: 5.00),
        Product(type: .Bird, title: "Flapping Fury", subtitle: "Bird Monster", price: "$5", productImage: "bird-4", productId: "bird-4", sellingPrice: 5.00),
        Product(type: .Blue, title: "Blue Bolt", subtitle: "Blue Monster", price: "$5", productImage: "blue-1", productId: "blue-1", sellingPrice: 5.00),
        Product(type: .Blue, title: "Azure Avenger", subtitle: "Blue Monster", price: "$5", productImage: "blue-2", productId: "blue-2", sellingPrice: 5.00),
        Product(type: .Blue, title: "Blue Banshee", subtitle: "Blue Monster", price: "$5", productImage: "blue-3", productId: "blue-3", sellingPrice: 5.00),
        Product(type: .Blue, title: "Blueback Beast", subtitle: "Blue Monster", price: "$5", productImage: "blue-4", productId: "blue-4", sellingPrice: 5.00),
        Product(type: .Cute, title: "Adorable Abomination", subtitle: "Cute Monster", price: "$5", productImage: "cute-1", productId: "cute-1", sellingPrice: 5.00),
        Product(type: .Cute, title: "Cuddlebug", subtitle: "Cute Monster", price: "$5", productImage: "cute-2", productId: "cute-2", sellingPrice: 5.00),
        Product(type: .Cute, title: "Sweetheart Slasher", subtitle: "Cute Monster", price: "$5", productImage: "cute-3", productId: "cute-3", sellingPrice: 5.00),
        Product(type: .Cute, title: "Cutesy Crawler", subtitle: "Cute Monster", price: "$5", productImage: "cute-4", productId: "cute-4", sellingPrice: 5.00),
        Product(type: .Fluff, title: "Fluffernutter", subtitle: "Fluff Monster", price: "$5", productImage: "fluff-1", productId: "fluff-1", sellingPrice: 5.00),
        Product(type: .Fluff, title: "Fuzzball", subtitle: "Fluff Monster", price: "$5", productImage: "fluff-2", productId: "fluff-2", sellingPrice: 5.00),
        Product(type: .Fluff, title: "Puff Puff", subtitle: "Fluff Monster", price: "$5", productImage: "fluff-3", productId: "fluff-3", sellingPrice: 5.00),
        Product(type: .Fluff, title: "Furry Fuzz", subtitle: "Fluff Monster", price: "$5", productImage: "fluff-4", productId: "fluff-4", sellingPrice: 5.00),
        Product(type: .Gears, title: "Cog Crusher", subtitle: "Gears Monster", price: "$5", productImage: "gears-1", productId: "gears-1", sellingPrice: 5.00),
        Product(type: .Gears, title: "Gear Grinder", subtitle: "Gears Monster", price: "$5", productImage: "gears-2", productId: "gears-2", sellingPrice: 5.00),
        Product(type: .Gears, title: "Piston Punisher", subtitle: "Gears Monster", price: "$5", productImage: "gears-3", productId: "gears-3", sellingPrice: 5.00),
        Product(type: .Gears, title: "Gearhead Ghoul", subtitle: "Gears Monster", price: "$5", productImage: "gears-4", productId: "gears-4", sellingPrice: 5.00),
        */
        Product(type: .ECOMMERCE, title: "Little Critter", subtitle: "ECOMMERCE", price: "$5", productImage: "ECOMMERCE-1", productId: "ECOMMERCE-1", sellingPrice: 5.00),
        Product(type: .ENTERTAINMENT, title: "Snugglebug", subtitle: "ENTERTAINMENT", price: "$5", productImage: "ENTERTAINMENT-1", productId: "ENTERTAINMENT-1", sellingPrice: 5.00),
        Product(type: .FINANCE, title: "Cuddlekins", subtitle: "FINANCE", price: "$5", productImage: "FINANCE-1", productId: "FINANCE-1", sellingPrice: 5.00),
        Product(type: .FINTECH, title: "Cosmic Critter", subtitle: "FINTECH", price: "$5", productImage: "FINTECH-1", productId: "FINTECH-1", sellingPrice: 5.00),
        Product(type: .LIFESTYLE, title: "Galaxy Gobbler", subtitle: "LIFESTYLE", price: "$5", productImage: "LIFESTYLE-1", productId: "LIFESTYLE-1", sellingPrice: 5.00),
        Product(type: .QSR, title: "Pipsqueak", subtitle: "QSR", price: "$5", productImage: "QSR-1", productId: "QSR-1", sellingPrice: 5.00),
        Product(type: .RETAIL, title: "Starbeast", subtitle: "RETAIL", price: "$5", productImage: "RETAIL-1", productId: "RETAIL-1", sellingPrice: 5.00),
        Product(type: .TRAVEL, title: "Astrocreep", subtitle: "TRAVEL", price: "$5", productImage: "TRAVEL-1", productId: "TRAVEL-1", sellingPrice: 5.00),
    ]
    
    // Filtered Products...
    @Published var filteredProducts: [Product] = []
    
    // More products on the type..
    @Published var showMoreProductsOnType: Bool = false
    
    // Search Data...
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false
    @Published var searchedProducts: [Product]?
    
    var searchCancellable: AnyCancellable?
    
    init(){
        filterProductByType()
        
        searchCancellable = $searchText.removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                if str != ""{
                    self.filterProductBySearch()
                }
                else{
                    self.searchedProducts = nil
                }
            })
    }
    
    func filterProductByType(){
        
        // Filtering Product By Product Type...
        DispatchQueue.global(qos: .userInteractive).async {
            
            let results = self.products
            // Since it will require more memory so were using lazy to perform more...
                .lazy
                .filter { product in
                    
                    return product.type == self.productType
                }
            // Limiting result...
                .prefix(4)
            
            DispatchQueue.main.async {
                
                self.filteredProducts = results.compactMap({ product in
                    return product
                })
            }
        }
    }
    
    func filterProductBySearch(){
        
        // Filtering Product By Product Type...
        DispatchQueue.global(qos: .userInteractive).async {
            
            let results = self.products
            // Since it will require more memory so were using lazy to perform more...
                .lazy
                .filter { product in
                    
                    return product.title.lowercased().contains(self.searchText.lowercased())
                }
            
            DispatchQueue.main.async {
                
                self.searchedProducts = results.compactMap({ product in
                    return product
                })
            }
        }
    }
}
