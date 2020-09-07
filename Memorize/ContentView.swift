//
//  ContentView.swift
//  Memorize
//
//  Created by danielle on 9/6/20.
//  Copyright © 2020 danielle kefford. All rights reserved.
//

import SwiftUI

// Responsible for the view of the entire set of cards
struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    // Reqired by the `View` protocol
    var body: some View {
        HStack {
            // ForEach works here because `MemoryGame.Card` implements the `Identifiable` protocol
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
    }
}

// Responsible for the view of a _single_ card
struct CardView: View {
    var card: MemoryGame<String>.Card

    // Reqired by the `View` protocol
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke()
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
            }
        }
    }
}

// This struct is specifically for the fancy SwiftUI preview in XCode >=11.4
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
