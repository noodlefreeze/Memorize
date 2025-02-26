//
//  ContentView.swift
//  Memorize
//
//  Created by noodlefreeze on 2025/2/20.
//

import SwiftUI

struct ContentView: View {
  let emojis = [
    "🥳", "🙈", "💁", "🤩", "⚽️", "🛹", "⛷️", "⛷️", "⛷️", "⛷️", "⛷️", "⛷️", "⛷️",
  ]
  @State var cardCount = 4

  var body: some View {
    VStack {
      ScrollView {
        cards
      }
      Spacer()
      cardCountAdjusters
    }
    .padding()
  }

  var cardCountAdjusters: some View {
    HStack {
      cardAdder
      Spacer()
      cardRemover
    }
    .imageScale(.large)
  }

  func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
    Button(
      action: {
        cardCount += offset
      },
      label: {
        Image(systemName: symbol)
      }
    )
    .disabled(cardCount + offset > emojis.count || cardCount + offset < 1)
  }

  var cardAdder: some View {
    cardCountAdjuster(by: 1, symbol: "folder.badge.plus")

  }

  var cardRemover: some View {
    cardCountAdjuster(by: -1, symbol: "folder.badge.minus")
  }

  var cards: some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
      ForEach(0..<cardCount, id: \.self) { index in
        CardView(content: emojis[index])
          .aspectRatio(2 / 3, contentMode: .fit)
      }
    }
    .foregroundStyle(.orange)
  }
}

struct CardView: View {
  let content: String
  @State var isFaceUp = false

  var body: some View {
    ZStack {
      let base = RoundedRectangle(cornerRadius: 12)

      Group {
        base
          .fill(.white)
        base
          .strokeBorder(lineWidth: 2)
        Text(content)
          .font(.largeTitle)
      }
      .opacity(isFaceUp ? 1 : 0)
      base.fill().opacity(isFaceUp ? 0 : 1)
    }
    .onTapGesture {
      isFaceUp.toggle()
    }
  }
}

#Preview {
  ContentView()
}
