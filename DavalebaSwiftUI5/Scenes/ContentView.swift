//
//  ContentView.swift
//  DavalebaSwiftUI5
//
//  Created by Lika Nozadze on 12/18/23.
//
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Main", systemImage: "house")
                }

            CategoriesView()
                .tabItem {
                    Label("Categories", systemImage: "list.bullet")
                }
        }
    }
}
