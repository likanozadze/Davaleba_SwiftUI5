//
//  ProductCardComponentView.swift
//  DavalebaSwiftUI5
//
//  Created by Lika Nozadze on 12/18/23.
//

import SwiftUI

struct ProductCardComponentView: View {
    @EnvironmentObject var viewModel: MainViewModel
    var product: Product
    

    // MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            productImageView
            titleView
            priceView
            addToCartButton
        }
        .frame(maxWidth: 200)
        .padding()
        
        .clipShape(RoundedRectangle(cornerRadius: 25))
        
    }
    
    // MARK: - ImageView
    private var productImageView: some View {
        AsyncImage(url: URL(string: product.images[0])) { image in
            image
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .frame(height: 150)
                .frame(width: 150)
        } placeholder: {
            
        }
        
    }
    
    
    // MARK: - Title
    private var titleView: some View {
        Text(product.title)
            .font(.system(size: 14))
            .font(.headline)
            .foregroundColor(.primary)
        
    }
    // MARK: - Price
    private var priceView: some View {
        Text("$\(product.price, specifier: "%.2f")")
            .font(.system(size: 12))
            .font(.headline)
            .foregroundColor(.primary)
    }
    // MARK: - Button
    private var addToCartButton: some View {
        Button(action: {
            viewModel.addToCart(product)
        }) {
            Text("Add to Cart")
                .font(.system(size: 12))
                .fontWeight(.bold)
                .frame(width: 80, height: 10)
                .padding()
                .background(.green)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

struct ProductCardComponentView_Previews: PreviewProvider {
    static var previews: some View {
        let product = Product(id: 1, title: "Test Product", description: "Test Description", price: 99.99, discountPercentage: 0.0, rating: 4.5, stock: 10, brand: "Test Brand", category: "Test Category", thumbnail: "", images: [""])
        ProductCardComponentView(product: product)
    }
}
