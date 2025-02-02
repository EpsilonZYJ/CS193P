//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created on 2024/11/17.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🤓", "😊", "🥸", "😡", "🤲", "🤝", "🥶", "🤯", "👻", "😈", "🤡"]

    @Published private var model = EmojiMemoryGame.createMemoryGame()

    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 2){ pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }

    var cards: Array<Card>{
        return model.cards
    }
    
    var color: Color{
        return .orange
    }
    
    var score: Int{
        model.score
    }

    // MARK: - Intents

    func shuffle(){
        model.shuffle()
    }

    func choose(_ card: Card){
        model.choose(card)
    }
}
