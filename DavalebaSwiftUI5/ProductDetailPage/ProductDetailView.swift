//
//  ProductDetailView.swift
//  DavalebaSwiftUI5
//
//  Created by Lika Nozadze on 12/18/23.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var viewModel: MainViewModel
    var product: Product
    
    
    // MARK: - Properties
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                AsyncImage(url: URL(string: product.thumbnail)) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: "photo")
                }
                .aspectRatio(contentMode: .fill)
                .cornerRadius(10)
                
                
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(product.brand)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text("$\(product.price, specifier: "%.2f")")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    }
                    Text(product.category)
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                    
                    
                    Text(product.description)
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                    
                }
                
                
                .padding()
                .background(.black)
                .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Button(action: {
                   
                }) {
                    Text("Return to Categories")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)

                }
                .padding()
                .background(.black)
                .cornerRadius(10)
            }
            }
            .padding(.vertical)
            .padding(.horizontal)
        }
    }
