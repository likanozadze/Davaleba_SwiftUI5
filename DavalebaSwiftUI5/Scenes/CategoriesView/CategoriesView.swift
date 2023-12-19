//
//  CategoriesView.swift
//  DavalebaSwiftUI5
//
//  Created by Lika Nozadze on 12/18/23.
//

import SwiftUI

struct CategoriesView: View {
    @ObservedObject var categoriesViewModel = CategoriesViewModel()
    

    var body: some View {
        NavigationView {
            List(categoriesViewModel.categories, id: \.self) { category in
                NavigationLink(destination: ProductsView(selectedCategory: category)) {
                    Text(category)
                }
            }
            .navigationBarTitle("Categories")

            if let error = categoriesViewModel.error {
                Text("Error: \(error)")
            }
        }
        .onAppear {
            
            categoriesViewModel.fetchCategories {
            
            }
        }
    }
}
