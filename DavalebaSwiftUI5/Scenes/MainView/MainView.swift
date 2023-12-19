//
//  MainView.swift
//  DavalebaSwiftUI5
//
//  Created by Lika Nozadze on 12/17/23.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var viewModel: MainViewModel
    @State var path = NavigationPath()

    
    private let gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                HeaderComponentView()
                navigationStack
                BalanceComponentView()
                    .background(.white)
                
            }
            
        }
        .alert(isPresented: $viewModel.successAlert) {
            print("Presenting success alert")
            return Alert(title: Text("Success"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
        }
        .alert(isPresented: $viewModel.errorAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    // MARK: - Destinations Grid
    
    private var destinationGrid: some View {
        LazyVGrid(columns: gridLayout) {
            ForEach(viewModel.products) { product in
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
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
                .environmentObject(MainViewModel())
        }
    }
    
}
