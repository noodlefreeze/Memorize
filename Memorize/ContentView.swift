//
//  ContentView.swift
//  Memorize
//
//  Created by noodlefreeze on 2025/2/20.
//

import SwiftUI

struct ContentView: View {
  let messages = [
    "microphone", "line.diagonal.arrow", "text.bubble", "phone", "video.slash",
    "envelope", "recordingtape", "waveform",
  ]
  let figures = [
    "figure.stand.line.dotted.figure.stand", "accessibility", "voiceover",
    "cursorarrow.rays", "cursorarrow.click.badge.clock", "circle.hexagonpath",
    "quote.bubble.fill", "eye.slash.circle.fill",
  ]
  let games = [
    "flag.2.crossed", "house", "arcade.stick.console.fill", "l.joystick.fill",
    "l.joystick.tilt.up", "dpad.up.filled", "paddleshifter.right",
    "button.horizontal.fill",
  ]
  @State var emojis: [String] = []

  var body: some View {
    VStack {
      Text("Memorize!")
        .font(.largeTitle)

      ScrollView {
        cards
      }

      themeSelectors
    }
    .padding()
  }

  func themeSelector(iconName: String, iconDesc: String, themeIcons: [String])
    -> some View
  {
    Button(
      action: {
        emojis = themeIcons
      },
      label: {
        VStack {
          Image(systemName: iconName).imageScale(.large)
          Text(iconDesc).font(.caption)
        }
      }
    )
  }

  var themeSelectors: some View {
    HStack(alignment: .bottom, spacing: 30) {
      themeSelector(
        iconName: "message", iconDesc: "Messages", themeIcons: messages)
      themeSelector(
        iconName: "figure", iconDesc: "Figures", themeIcons: figures)
      themeSelector(
        iconName: "gamecontroller", iconDesc: "Games", themeIcons: games)
    }
  }

  var cards: some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
      var pairs = emojis.shuffled() + emojis.shuffled()
      
      ForEach(pairs.indices, id: \.self) { index in
        CardView(content: pairs[index])
          .aspectRatio(2 / 3, contentMode: .fit)
      }
    }
    .foregroundStyle(.orange)
  }
}

struct CardView: View {
  let content: String
  @State var isFaceUp = true

  var body: some View {
    ZStack {
      let base = RoundedRectangle(cornerRadius: 12)

      Group {
        base
          .fill(.white)
        base
          .strokeBorder(lineWidth: 2)
        Image(systemName: content)
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
//
