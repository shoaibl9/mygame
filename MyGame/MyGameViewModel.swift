//
//  MyGameViewModel.swift
//  MyGame
//
//  Created by Shoaib Laghari on 10/27/21.
//

import SwiftUI

class MyGameViewModel: ObservableObject {
    
    private static let alphabet = ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "a", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m"]
    
    private static func createGameModel(count: Int, keys: Array<String>) -> MyGameModel<String> {
        return MyGameModel<String>(max: count){ index in
            alphabet[index]
        }
    }
    
    @Published private var model: MyGameModel<String> = createGameModel(count: alphabet.count, keys: alphabet)
    
    var keys: Array<MyGameModel<String>.Key> {
        return model.keys
    }
    
    var word: String {
        return model.word
    }
    
    //MARK: - Intent(s)
    
    func select(_ key: MyGameModel<String>.Key) {
        model.select(key)
    }
}
