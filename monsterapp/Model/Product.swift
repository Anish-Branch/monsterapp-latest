//
//  Product.swift
//  monsterapp
//
//  Created by Anish Somani on 10/06/2023.
//

import SwiftUI

import SwiftUI

// Product Model....
struct Product: Identifiable,Hashable {
    var id = UUID().uuidString
    var type: ProductType
    var title: String
    var subtitle: String
    var description: String = ""
    var price: String = ""
    var productImage: String = ""
    var quantity: Int = 1
    var productId: String = ""
    var sellingPrice: NSDecimalNumber = 1.00

    static var testProducts = [
        Product(type: .ECOMMERCE,
                title: "Nothing Ear 1",
                subtitle: "Ohr (stick) hibernates these hordes. That is a technique that ever does not work. Zodat je al het andere kunt beleven. Shaped for exceptional comfort Powerful authentic sound with our innovative custom driver, bass lock and clear voice technology, all in a unique, compact housing. This is a technique that you don't feel. So you can experience everything else. Ohr (stock) overcomes these hurdles. This is a technique that you don't feel. So you can experience everything else. Ohr (stick) overcomes these obstacles. It is a technique that you don't feel. Thanks to this, you can experience everything else. It is recommended that you adjust the position of the earplugs when wearing them, hold the earplug shaft at a 45° angle and adjust it to the face. NOTE- Place the binaural headset in the charging box, change the cover, or pair it again to restore it; 2) Guide the user through cleaning the headset outlet hole. You can clean the headset with the hair dryer or the ear ball/dust blower.",
               productImage: "ECOMMERCE-1"),
        Product(type: .ENTERTAINMENT,
                title: "iPhone 14 Pro",
                subtitle: "Ohr (stick) hibernates these hordes. That is a technique that ever does not work. Zodat je al het andere kunt beleven. Shaped for exceptional comfort Powerful authentic sound with our innovative custom driver, bass lock and clear voice technology, all in a unique, compact housing. This is a technique that you don't feel. So you can experience everything else. Ohr (stock) overcomes these hurdles. This is a technique that you don't feel. So you can experience everything else. Ohr (stick) overcomes these obstacles. It is a technique that you don't feel. Thanks to this, you can experience everything else. It is recommended that you adjust the position of the earplugs when wearing them, hold the earplug shaft at a 45° angle and adjust it to the face. NOTE- Place the binaural headset in the charging box, change the cover, or pair it again to restore it; 2) Guide the user through cleaning the headset outlet hole. You can clean the headset with the hair dryer or the ear ball/dust blower.",
               productImage: "ENTERTAINMENT-1"),
        Product(type: .FINANCE,
                title: "iPhone 14 Pro Max",
                subtitle: "Ohr (stick) hibernates these hordes. That is a technique that ever does not work. Zodat je al het andere kunt beleven. Shaped for exceptional comfort Powerful authentic sound with our innovative custom driver, bass lock and clear voice technology, all in a unique, compact housing. This is a technique that you don't feel. So you can experience everything else. Ohr (stock) overcomes these hurdles. This is a technique that you don't feel. So you can experience everything else. Ohr (stick) overcomes these obstacles. It is a technique that you don't feel. Thanks to this, you can experience everything else. It is recommended that you adjust the position of the earplugs when wearing them, hold the earplug shaft at a 45° angle and adjust it to the face. NOTE- Place the binaural headset in the charging box, change the cover, or pair it again to restore it; 2) Guide the user through cleaning the headset outlet hole. You can clean the headset with the hair dryer or the ear ball/dust blower.",
               productImage: "FINANCE-1"),
        Product(type: .FINTECH,
                title: "Android Nexus",
                subtitle: "Ohr (stick) hibernates these hordes. That is a technique that ever does not work. Zodat je al het andere kunt beleven. Shaped for exceptional comfort Powerful authentic sound with our innovative custom driver, bass lock and clear voice technology, all in a unique, compact housing. This is a technique that you don't feel. So you can experience everything else. Ohr (stock) overcomes these hurdles. This is a technique that you don't feel. So you can experience everything else. Ohr (stick) overcomes these obstacles. It is a technique that you don't feel. Thanks to this, you can experience everything else. It is recommended that you adjust the position of the earplugs when wearing them, hold the earplug shaft at a 45° angle and adjust it to the face. NOTE- Place the binaural headset in the charging box, change the cover, or pair it again to restore it; 2) Guide the user through cleaning the headset outlet hole. You can clean the headset with the hair dryer or the ear ball/dust blower.",
               productImage: "FINTECH-1")]

}


let lightBlue = Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
let darkBlue = Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))

let lightYellow = Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
let darkYellow = Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))

let lightGreen = Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
let darkGreen = Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1))

let lightPink = Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
let darkPink = Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))

// Product Types...
enum ProductType: String,CaseIterable{
    
    /*
    case Astronaut = "Astronaut"
    case Baby = "Baby"
    case Bear = "Bear"
    case Bird = "Bird"
    case Blue = "Blue"
    case Cute = "Cute"
    case Fluff = "Fluff"
    case Gears = "Gears"
    */

    case ECOMMERCE = "ECOMMERCE"
    case ENTERTAINMENT = "ENTERTAINMENT"
    case FINANCE = "FINANCE"
    case FINTECH = "FINTECH"
    case LIFESTYLE = "LIFESTYLE"
    case QSR = "QSR"
    case RETAIL = "RETAIL"
    case TRAVEL = "TRAVEL"
    
    var color: Color {
        switch self {
        case .ECOMMERCE:
            return Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        case .ENTERTAINMENT:
            return Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))
        case .FINANCE:
            return Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1))
        case .FINTECH:
            return Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
        default:
            return Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        }
    }
    
}
