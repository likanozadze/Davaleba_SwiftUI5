//
//  ProductsView.swift
//  DavalebaSwiftUI5
//
//  Created by Lika Nozadze on 12/18/23.
//

import SwiftUI


struct ProductsView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @State var path = NavigationPath()
    var selectedCategory: String
    
    private let gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderComponentView()
                navigationStack
                BalanceComponentView()
                    .background(Color.white)
            }
        }
        .onAppear {
            viewModel.selectedCategory = selectedCategory
            viewModel.filterProductsByCategory()
            
        }
    }
    
    
    // MARK: - Destinations Grid
    
    private var destinationGrid: some View {
        LazyVGrid(columns: gridLayout) {
            ForEach(viewModel.filteredProducts) { product in
                productLink(product)
            }
        }
    }
    // MARK: - Navigation Stack
    private var navigationStack: some View {
        NavigationStack(path: $path) {
            ScrollView(.vertical, showsIndicators: false) {
                destinationGrid
            }
        }
    }
    
    // MARK: - ProductLink
    
    private func productLink(_ product: Product) -> some View {
        NavigationLink(value: product) {
            ProductCardComponentView(product: product)
        }
        .navigationDestination(for: Product.self, destination: { product in
            ProductDetailView(product: product)
        })
    }
}
    
    extension MainViewModel {
        func filterProductsByCategory() {
            if let selectedCategory = selectedCategory {
                filteredProducts = products.filter { $0.category == selectedCategory }
            } else {
                filteredProducts = products
            }
        }
    }

