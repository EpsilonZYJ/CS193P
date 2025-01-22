//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created on 2024/11/17.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🤓", "😊", "🥸", "😡", "🤲", "🤝", "🥶", "🤯", "👻", "😈", "🤡"]

    @Published private var model = EmojiMemoryGame.createMemoryGame()

    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 100){ pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }

    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }

    // MARK: - Intents

    func shuffle(){
        model.shuffle()
    }

    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
