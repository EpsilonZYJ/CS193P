//
//  Cardify.swift
//  Memorize
//
//  Created by EpsilonZYJ on 2025/1/23.
//

import SwiftUI

struct Cardify: ViewModifier{
    let isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            Group {
                
                base.strokeBorder(lineWidth: Constants.lineWidth)
                    .background(base.fill(.white))
                    .overlay(content)
            }
                .opacity(isFaceUp ? 1 : 0)
            base.fill()
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(isFaceUp ? 0 : 180), axis: (0, 1, 0))
    }
    
    
    private struct Constants{
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
}

extension View{
    func cardify(isFaceUp: Bool) -> some View{
        return modifier(Cardify(isFaceUp: isFaceUp))
    }
}
