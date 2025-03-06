//
//  Themes.swift
//  Memorize
//
//  Created by sri veda aryan on 06/03/25.
//

import SwiftUI

struct Theme {
    var name: String
    var emojis: [String]
    var color: Color
    var tint: Color 
    var noOfPairs: Int?
}

let themes: [Theme] = [
    Theme(
        name: "Halloween",
        emojis: ["👻","🎃","🕷","🧟‍♂️","🧛🏼‍♀️","☠️","👽","🦹‍♀️","🦇","🌘","⚰️","🔮"],
        color: .orange,
        tint: .black,
        noOfPairs: 8),
    
    Theme(
        name: "Flags",
        emojis: ["🇮🇳","🇯🇵","🇺🇸","🇬🇧","🇦🇺","🇩🇪","🇫🇷","🇳🇿","🇵🇭"],
        color: .blue,
        tint: .white,
        noOfPairs: 8),
    
    Theme(
        name: "Animals",
        emojis: ["🦑","🦧","🦃","🦚","🐫","🦉","🦕","🦥","🐸","🐼","🐺","🦈"],
        color: .green,
        tint: .brown,
        noOfPairs: 8),
    
    Theme(
        name: "Places",
        emojis: ["🗽","🗿","🗼","🎢","🌋","🏝","🏜","⛩","🕍","🕋","🏯","🏟"],
        color: .cyan,
        tint: .gray,
        noOfPairs: 8),
    
    Theme(
        name: "Wander Lust",
        emojis: ["🥊","🏑","🏏","⚽️","🏀","⛳️","🛹","🏓"],
        color: .purple,
        tint: .yellow,
        noOfPairs: 8),
    
    Theme(
        name: "Foodie",
        emojis: ["🌮","🍕","🍝","🍱","🍪","🍩","🥨","🥖","🍟","🍙","🍢","🍿"],
        color: .red,
        tint: .orange,
        noOfPairs: 8)
]
