//
//  ContentView.swift
//  Memorize
//
//  Created by noodlefreeze on 2025/2/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      HStack {
        CardView(isFaceUp: true)
        CardView()
        CardView()
      }
    }
}

struct CardView: View {
  var isFaceUp = false
  
  var body: some View {
    ZStack{
      if isFaceUp {
        RoundedRectangle(cornerRadius: 12)
          .foregroundColor(.white)
        RoundedRectangle(cornerRadius: 12)
          .strokeBorder(lineWidth: 2)
        Text("🥹")
          .font(.largeTitle)
      } else {
        RoundedRectangle(cornerRadius: 12)
      }
    }
    .foregroundColor(.orange)
    .padding()
  }
}

#Preview {
    ContentView()
}
