//
//  MyGameApp.swift
//  MyGame
//
//  Created by Shoaib Laghari on 10/27/21.
//

import SwiftUI

@main
struct MyGameApp: App {
    private let game = MyGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
