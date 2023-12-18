//
//  CategoriesViewModel.swift
//  DavalebaSwiftUI5
//
//  Created by Lika Nozadze on 12/18/23.
//

import SwiftUI

class CategoriesViewModel: ObservableObject {
    @Published var categories: [String] = []
    @Published var error: String?

    func fetchCategories(completion: @escaping () -> Void) {
        let urlString = "https://dummyjson.com/products"
        guard let url = URL(string: urlString) else { return }

        NetworkManager.shared.fetchDecodableData(from: url, responseType: ProductsData.self) { result in
            switch result {
            case .success(let data):
               
                self.categories = Array(Set(data.products.map { $0.category }))
            case .failure(let error):
                self.error = error.localizedDescription
            }
            completion()
        }
    }
}
