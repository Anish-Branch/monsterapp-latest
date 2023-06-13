//
//  ProductListing.swift
//  monsterapp
//
//  Created by Zubair Nagori on 13/06/23.
//

import SwiftUI

class ProductListingViewModel: ObservableObject {
    @Published var products = Product.testProducts
    @Published var searchText = ""
}
struct ProductListing: View {
    @StateObject var viewModel = ProductListingViewModel()

    var body: some View {
        VStack {
            SearchField(searchTerm: $viewModel.searchText)
                .padding()
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.products) { product in
                    VStack {
                        ProductView(product: product)
                    }
                }
            }.padding(.horizontal)
        }
        .background(Constants.Colors.appBackground)
    }
}

struct SearchField: View {
    @Binding var searchTerm: String
    var body: some View {
        HStack {
            TextField("Search", text: $searchTerm)
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.gray, lineWidth: 1)
        }
    }
}


struct ProductListing_Previews: PreviewProvider {
    static var previews: some View {
        ProductListing()
    }
}
