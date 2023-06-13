//
//  ProductDetails.swift
//  monsterapp
//
//  Created by Zubair Nagori on 13/06/23.
//

import SwiftUI
import BranchSDK

struct ProductDetails: View {
    
    @Environment(\.dismiss) var dismiss

    let product: Product

    internal var buo = BranchUniversalObject()
    internal var lp = BranchLinkProperties()

    // Shared Data Model...
    @EnvironmentObject var sharedData: SharedDataModel
    @EnvironmentObject var homeData: HomeViewModel


    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                dismissButton
                   // .padding()
                productType
                productTitle
                productImage
                buttonsStack
                Spacer()
                    .frame(height: 20)
                productSubTitle
                Spacer()
            }
            .padding()
        }
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
    @ViewBuilder
    var productImage: some View {
        Image(product.productImage)
            .resizable()
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .cornerRadius(20)
    }

    @ViewBuilder
    var productType: some View {
        Text(product.type.rawValue)
            .padding()
            .background(
                Capsule()
                    .fill(.bar)
                    .frame(maxHeight: 30)
            )
    }

    @ViewBuilder
    var productTitle: some View {
        Text(product.title)
            .font(.title)
            .fontWeight(.semibold)

    }

    @ViewBuilder
    var productSubTitle: some View {
        Text(product.subtitle)
    }

    @ViewBuilder
    var buttonsStack: some View {
        HStack(spacing: 12) {
            ThemeButton(title: "Add to cart", fontSize: 18, weight: .medium) {
                addToCart()
                branchEventAddToCart()
            }
            .disabled(true)

            ThemeButton(title: "Buy now", fontSize: 18, weight: .medium) {
            }

            Button {
                didTapShareDeepLink()
            } label: {
                Image(systemName: "square.and.arrow.up")
                    .renderingMode(.template)
                    .foregroundColor(Constants.Colors.themeBlue)
                    .font(.title)
            }

            Button {

            } label: {
                Image(systemName: "bell.fill")
                    .renderingMode(.template)
                    .foregroundColor(Constants.Colors.themeBlue)
                    .font(.title)
            }
        }
        .padding(.horizontal)
    }


    func isLiked()->Bool{

        return sharedData.likedProducts.contains { product in
            return self.product.id == product.id
        }
    }

    func isAddedToCart()->Bool{

        return sharedData.cartProducts.contains { product in
            return self.product.id == product.id
        }
    }

    func addToLiked(){

        if let index = sharedData.likedProducts.firstIndex(where: { product in
            return self.product.id == product.id
        }){
            // Remove from liked....
            sharedData.likedProducts.remove(at: index)
        }
        else{
            // add to liked
            sharedData.likedProducts.append(product)
        }
    }

    func addToCart(){

        if let index = sharedData.cartProducts.firstIndex(where: { product in
            return self.product.id == product.id
        }){
            // Remove from liked....
            sharedData.cartProducts.remove(at: index)
        }
        else{
            // add to liked
            sharedData.cartProducts.append(product)
        }
    }
    // Branch.io - Track Event - Add To Cart
    func branchEventAddToCart(){
        // Create a BranchUniversalObject with your content data:
        let branchUniversalObject = BranchUniversalObject.init()

        // ...add data to the branchUniversalObject as needed...
        branchUniversalObject.title               = product.title

        branchUniversalObject.contentMetadata.contentSchema     = .commerceProduct
        branchUniversalObject.contentMetadata.quantity          = 1
        branchUniversalObject.contentMetadata.price             = product.sellingPrice
        branchUniversalObject.contentMetadata.currency          = .USD
        branchUniversalObject.contentMetadata.productName       = product.title
        branchUniversalObject.contentMetadata.productVariant    = product.subtitle

        // Create a BranchEvent:
        let event = BranchEvent.standardEvent(.addToCart)

        // Add the BranchUniversalObject with the content (do not add an empty branchUniversalObject):
        event.contentItems     = [ branchUniversalObject ]

        // Add relevant event data:
        event.alias            = "Add To Cart"
        event.currency         = .USD
        event.eventDescription = "Monster Added to Cart"
        event.logEvent() // Log the event.
    }

    // Branch.io - Set Branch Universal Object for product
    func didTapShareDeepLink() {
        // Set BUO (Branch Universal Object) Properties
        buo.title = product.title
        buo.contentDescription = product.subtitle
        buo.imageUrl = "https://branch.io/img/logo-dark.svg"
        buo.publiclyIndex = true
        buo.locallyIndex = true
        buo.canonicalUrl = "https://www.branch.io/\(product.productId)"

        // Branch.io - Set Deep Link Properties

        lp.channel = "In-app"
        lp.feature = "sharing"
        lp.campaign = "messaging"
        lp.addControlParam("$desktop_url", withValue: "https://help.branch.io/")
        lp.addControlParam("$ios_url", withValue: "https://help.branch.io/developers-hub/docs/ios-sdk-overview")
        lp.addControlParam("$android_url", withValue: "https://help.branch.io/developers-hub/docs/android-sdk-overview")
        lp.addControlParam("$canonical_url", withValue: "https://www.branch.io/\(product.productId)")

        buo.getShortUrl(with: lp) { url, error in
                print(url ?? "")
            }

        // Branch.io - Call Share Sheet
        buo.showShareSheet(with: lp, andShareText: "Check out this Branch Monster", from: UIApplication.shared.windows.first?.rootViewController) { (string, bool, error) in
            guard error == nil else { return }
            // String = Sharing Method (Messages || CopyToPasteboard || Mail || etc)
            // Bool = Share Completed/Not Completed
            // Error = Sharing Error
            // String = Sharing Method (Messages || CopyToPasteboard || Mail || etc)
            // Bool = Share Completed/Not Completed
            // Error = Sharing Error
            if bool {
                // Share Sheet sent
                print("Share Sheet Completed")
            }
        }
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(product: Product(type: .ECOMMERCE, title: "Branch Product", subtitle: "This is a test product", productImage: "ECOMMERCE-1"))
            .environmentObject(SharedDataModel())
    }
}
