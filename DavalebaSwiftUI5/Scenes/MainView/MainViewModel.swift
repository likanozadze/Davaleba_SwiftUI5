//
//  MainViewModel.swift
//  DavalebaSwiftUI5
//
//  Created by Lika Nozadze on 12/17/23.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var products: [Product] = []
    @Published var error: String?
    @Published var balance =  8000
    @Published var cart: [cartItem] = []
    @Published var ProcessingPurchase = false
    @Published var successAlert = false
    @Published var errorAlert = false
    @Published var alertMessage = ""
    @Published var selectedCategory: String?
    @Published var CheckoutSuccessful = false
    
    // MARK: - Initialization
    init() {
        fetchProducts()
    }
    
    // MARK: - Network Call
    func fetchProducts() {
        
        let urlString = "https://dummyjson.com/products"
        guard let URL = URL(string: urlString) else { return }
        
        NetworkManager.shared.fetchDecodableData(from: URL, responseType: ProductsData.self, completion: { result in
            
            switch result {
            case .success(let data):
                print("Fetched products: \(self.products)")
                self.products = data.products
            case .failure(let error):
                self.error = error.localizedDescription
            }
        })
        
    }
    func addToCart(_ product: Product) {
        
        ProcessingPurchase = true
        
        self.ProcessingPurchase = false
        
        if self.balance >= Int(product.price) {
            self.cart.append(cartItem(product: product, quantity: 1))
            self.balance -= Int(product.price)
            self.showSuccessAlert(message: "Item added to cart. New balance: \(self.balance)")
        } else {
            self.showErrorAlert(message: "Insufficient balance. Unable to add to cart.")
        }
    }
    
    func showSuccessAlert(message: String) {
        alertMessage = message
        successAlert = true
    }
    
    func showErrorAlert(message: String) {
        alertMessage = message
        errorAlert = true
    }
    
    func checkout() {
        
        if cart.isEmpty {
            showErrorAlert(message: "Your cart is empty. Add items before checking out.")
        } else {
            
            ProcessingPurchase = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
                self.ProcessingPurchase = false
                let totalAmount = cart.reduce(0) { $0 + Int($1.product.price) * $1.quantity }
                if self.balance >= totalAmount {
                    self.balance -= totalAmount
                    self.cart = []
                    self.showSuccessAlert(message: "Checkout successful! Thank you for your purchase.")
                } else {
                    self.showErrorAlert(message: "Insufficient balance. Unable to complete the purchase.")
                }
            }
        }
    }
}


