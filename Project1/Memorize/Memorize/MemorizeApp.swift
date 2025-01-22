//
//  MemorizeApp.swift
//  Memorize
//
//  Created by EpsilonZYJ on 2024/11/10.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
