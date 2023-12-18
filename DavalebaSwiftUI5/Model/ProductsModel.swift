//
//  ProductsModel.swift
//  DavalebaSwiftUI5
//
//  Created by Lika Nozadze on 12/17/23.
//

import Foundation

struct ProductsData: Decodable, Hashable {
    var products: [Product]
}

struct Product: Decodable, Identifiable, Hashable {
    var id: Int
    var title: String
    var description: String
    var price: Double
    var discountPercentage: Double
    var rating: Double
    var stock: Int
    var brand: String
    var category: String
    var thumbnail: String
    var images: [String]
    
}
struct cartItem {
    var product: Product
    var quantity: Int
}
