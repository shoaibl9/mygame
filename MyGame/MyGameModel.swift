//
//  File.swift
//  MyGame
//
//  Created by Shoaib Laghari on 10/27/21.
//

import Foundation

struct MyGameModel<KeyContent> where KeyContent: Equatable {
    private(set) var keys: Array<Key>
    
    // will need to generate words from dictionary sooner or later
    private(set) var word = "word"
    
    private var indexOfCurrentKey: Int?
    private var indexOfPreviousKey: Int?
    private var indexOfNextCorrectKey: Int?
    
    mutating func select(_ key: Key) {
        let index = key.id
        
        if (indexOfPreviousKey != nil) {
            keys[indexOfPreviousKey!].isCurrentKey.toggle()
        }
        indexOfPreviousKey = index
        
        keys[index].isCurrentKey.toggle()
    }
    
    // will need to replace content with letters, characters a-z
    init(max: Int, createKeyContent: (Int) -> KeyContent) {
        keys = []
        
        for count in 0..<max {
            let content = createKeyContent(count)
            keys.append(Key(content: content, id: count))
        }
    }
    
    // will need logic for if key's content is next in word
    struct Key: Identifiable {
        var isCurrentKey = false
        var isNextCorrectKey = false
        let content: KeyContent
        let id: Int
    }
}
