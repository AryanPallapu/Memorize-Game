//
//  MemorizeApp.swift
//  Memorize
//
//  Created by sri veda aryan on 06/03/25.
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
