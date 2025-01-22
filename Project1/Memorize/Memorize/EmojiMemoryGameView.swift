//
//  ContentView.swift
//  Memorize
//
//  Created by EpsilonZYJ on 2024/11/10.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
                    CardView(card)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
        }
        .foregroundColor(Color.orange)
    }
    
        
        
//        func gridItemWidthThatFits(
//            count: Int,
//            size: CGSize,
//            atAspectRatio aspectRatio: CGFloat
//        ) -> CGFloat {
//            let count = CGFloat(count)
//            var columnCount = 1.0
//            repeat{
//                let width = size.width / columnCount
//                let height = width / aspectRatio
//                
//                let rowCount = (count / columnCount).rounded(.up)
//                if rowCount * height < size.height{
//                    return (size.width / columnCount).rounded(.down)
//                }
//                columnCount += 1
//            } while columnCount < count
//            return min(size.width / count, size.height * aspectRatio).rounded(.down)
//        }


    
//    var cardCountAdjusters: some View {
//        HStack {
//            cardRemover
//            Spacer()
//            cardAdder
//        }
//        .imageScale(.large)
//        .font(.largeTitle)
//    }
//    
//    func cardCountAjuster(by offset: Int, symbol: String) -> some View {
//        Button {
//            cardCount += offset
//        } label: {
//            Image(systemName: symbol)
//        }
//        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
//    }
//    
//    var cardRemover: some View {
//        return cardCountAjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
//    }
//    
//    var cardAdder: some View {
//        return cardCountAjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
//    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}












//#Preview {
//    EmojiMemoryGameView()
//}

struct EmojiMemoryGameView_Previews: PreviewProvider{
    static var previews: some View{
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

