//
//  MemoryGame.swift
//  Memorize
//
//  Created by danielle kefford on 9/6/20.
//  Copyright © 2020 danielle kefford. All rights reserved.
//

import Foundation

// Pure model class for the memory game
struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numberOfPairs: Int, cardContentMaker: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairs {
            let content = cardContentMaker(pairIndex)
            for whichCardOfPair in 0...1 {
                cards.append(Card(id: pairIndex*2 + whichCardOfPair, isFaceUp: true, isMatched: false, content: content))
            }
        }
    }
    
    func choose(card: Card) {
        print("Card chosen: \(card)")
    }
    
    // Pure model class for a card
    struct Card: Identifiable {
        // Required by `Identifiable` protocol
        var id: Int

        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
