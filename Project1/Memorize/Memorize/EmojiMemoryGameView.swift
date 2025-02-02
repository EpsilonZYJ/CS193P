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
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
                    .foregroundColor(viewModel.color)
            }
            Button("Shuffle"){
                withAnimation {
                    viewModel.shuffle()
                }
            }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
                    CardView(card)
                        .padding(spacing)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 3)){
                                viewModel.choose(card)
                            }
                        }
        }
        .foregroundColor(viewModel.color)
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













//#Preview {
//    EmojiMemoryGameView()
//}

struct EmojiMemoryGameView_Previews: PreviewProvider{
    static var previews: some View{
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

