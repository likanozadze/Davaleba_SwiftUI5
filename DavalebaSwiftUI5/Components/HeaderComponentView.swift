//
//  HeaderComponentView.swift
//  DavalebaSwiftUI5
//
//  Created by Lika Nozadze on 12/18/23.
//

import SwiftUI

struct HeaderComponentView: View {
    @EnvironmentObject var viewmodel: MainViewModel
    var body: some View {
        HStack() {
            Spacer()
            Image(systemName: "cart")
                .font(.title)
                .foregroundStyle(Color(red: 0.26, green: 0.35, blue: 0.52))
        }
        .overlay(alignment: .bottomTrailing) {
            Circle()
                .frame(width: 20)
                .foregroundStyle(.red)
                .offset(x: 5,y: 5)
            
            Text("\(viewmodel.cart.count)")
                .font(.system(size: 12))
                .foregroundStyle(.white)
                .offset(x: 5,y: 5)
        }
        .padding()
    }
}

#Preview {
    HeaderComponentView()
}
