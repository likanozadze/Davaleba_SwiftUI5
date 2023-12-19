//
//  ParentView.swift
//  DavalebaSwiftUI5
//
//  Created by Lika Nozadze on 12/19/23.
//

import SwiftUI

struct ParentView: View {
    var condition: Bool
    var body: some View {
        NavigationStack {
            if condition {
                MainView()
                    .navigationDestination(for: Product.self, destination: { product in
                        ProductDetailView(product: product)
                    })
            } else {
                ProductsView()
                    .navigationDestination(for: Product.self, destination: { product in
                        ProductDetailView(product: product)
                    })
            }
        }
        
        struct MainView: View {
            // MARK: - ProductLink
            private func productLink(_ product: Product) -> some View {
                NavigationLink(value: product) {
                    ProductCardComponentView(product: product)
                }
                
            }
        }
        
        struct ProductsView: View {
            private func productLink(_ product: Product) -> some View {
                NavigationLink(value: product) {
                    ProductCardComponentView(product: product)
                }
                
            }
        }
    }
}
