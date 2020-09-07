//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by danielle kefford on 9/6/20.
//  Copyright © 2020 danielle kefford. All rights reserved.
//

import SwiftUI

// Specialized class for the emoji-based `MemoryGame`
class EmojiMemoryGame {
    private var gameModel: MemoryGame<String>
    
    static func makeMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(numberOfPairs: emojis.count) { index in
            emojis[index]
        }
    }
    
    init() {
        self.gameModel = EmojiMemoryGame.makeMemoryGame()
    }

    var cards: Array<MemoryGame<String>.Card> {
        gameModel.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        gameModel.choose(card: card)
    }
}
