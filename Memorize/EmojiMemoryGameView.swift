//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by sri veda aryan on 06/03/25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    @State private var showAlert = false

    var body: some View {
        VStack {
            Text("Memorize the Brain")
                .font(.title)
                .bold()
            
            Text(viewModel.theme.name)
                .font(.headline)
                .foregroundColor(viewModel.theme.color)
            
            ScrollView {
                cards
                    .animation(.easeInOut(duration: 0.5), value: viewModel.cards)
            }
            
            HStack {
                Button(action: {
                    withAnimation {
                        viewModel.newGame()
                    }
                }, label: {
                    VStack(spacing: 5) {
                        Image(systemName: "plus.circle.fill").font(.largeTitle)
                        Text("New Game")
                    }
                })
                
                Spacer()
                
                Text("Accuracy: \(viewModel.score)")
                    .font(.title)
                    .foregroundColor(.black)
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        viewModel.shuffle()
                    }
                }, label: {
                    VStack(spacing: 5) {
                        Image(systemName: "shuffle.circle.fill").font(.largeTitle)
                        Text("Shuffle")
                    }
                })
            }
            .tint(viewModel.theme.color) // Updated from accentColor
            
            Button("About") {
                showAlert = true
            }
            .padding()
            .tint(.blue)
            .alert("Emoji Memory Game\nCreated by Aryan Pallapu", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            viewModel.choose(card)
                        }
                    }
            }
        }
        .foregroundColor(viewModel.theme.color)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
                .rotation3DEffect(
                    .degrees(card.isFaceUp ? 0 : 180),
                    axis: (x: 0, y: 1, z: 0)
                )
                .animation(.easeInOut(duration: 0.5), value: card.isFaceUp)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        .animation(.easeInOut(duration: 0.5), value: card.isMatched)
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
