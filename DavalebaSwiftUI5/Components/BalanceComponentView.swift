//
//  BalanceComponentView.swift
//  DavalebaSwiftUI5
//
//  Created by Lika Nozadze on 12/18/23.
//

import SwiftUI

struct BalanceComponentView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Balance")
                    .font(.headline)
                Text("$\(viewModel.balance)")
                    .font(.title)
                    .foregroundColor(.black)
            }
            Spacer()
            if viewModel.ProcessingPurchase {
                ProgressView("Processing")
                    .progressViewStyle(CircularProgressViewStyle(tint: .green))
                    .foregroundColor(.green)
                    .padding()
            } else {
                
                
                Button(action: {
                    viewModel.checkout()
                }) {
                    Text("Checkout")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                }
                .padding()
                .background(.green)
                .cornerRadius(10)
            }
        }
        .padding()
            }
        }
        
#Preview {
    BalanceComponentView()
        .environmentObject(MainViewModel())
}
