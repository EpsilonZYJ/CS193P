//
//  MemorizeGame.swift
//  Memorize
//
//  Created on 2024/11/17.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2,numberOfPairsOfCards){
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
//    var indexOfTheOneAndOnlyFaceUpCard: Int? {
//        get{
//            var faceUpCardIndices = [Int]()
//            for index in cards.indices{
//                if cards[index].isFaceUp{
//                    faceUpCardIndices.append(index)
//                }
//            }
//            if faceUpCardIndices.count == 1{
//                return faceUpCardIndices.first
//            }else{
//                return nil
//            }
//        }
//        set{
//            for index in cards.indices{
//                if index == newValue{
//                    cards[index].isFaceUp == true
//                } else{
//                    cards[index].isFaceUp = false
//                }
//            }
//        }
//    }
  
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get{
//            var faceUpCardIndices = cards.indices.filter{ index in cards[index].isFaceUp }
//            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
//            return cards.indices.filter{ index in cards[index].isFaceUp }.only
            cards.indices.filter{ index in cards[index].isFaceUp }.only
        }
        set{
//            return cards.indices.forEach{ cards[$0].isFaceUp = (newValue == $0) }
            cards.indices.forEach{ cards[$0].isFaceUp = (newValue == $0) }
        }
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}){
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched{
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                }else{
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                
                
                
                cards[chosenIndex].isFaceUp = true
            }
            
        }
    }
    
//    private func index(of card: Card) -> Int? {
//        for index in cards.indices {
//            if cards[index].id == card.id{
//                return index
//            }
//        }
//        return nil    // FIXME: bogus!
//    }
    
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
//        static func == (lhs: Card, rhs: Card) -> Bool {
//            return lhs.isFaceUp == rhs.isFaceUp &&
//            lhs.isMatched == rhs.isMatched &&
//            lhs.content == rhs.content
//        }
        
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "up" : "down")\(isMatched ? "matched" : "")"
        }
    }
}

extension Array{
    var only: Element?{
        return count == 1 ? first : nil
    }
}
