//
//  DavalebaSwiftUI5App.swift
//  DavalebaSwiftUI5
//
//  Created by Lika Nozadze on 12/17/23.
//

import SwiftUI

@main
struct YourApp: App {
    @State var viewModel = MainViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MainViewModel())
        }
    }
}
