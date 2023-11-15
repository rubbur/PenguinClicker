//
//  Game.swift
//  PenguinClicker
//
//  Created by Michael Mathews on 11/15/23.
//

import SwiftUI

struct Game: View {
    @State private var clickCount = 0

    var body: some View {
        VStack {
            Text("Penguin Clicker Game")
                .font(.title)
                .padding()

            Image("penguin") // image file is named "penguin.png"
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150) 
                .onTapGesture {
                    clickCount += 1
                }

            Text("Click Count: \(clickCount)")
                .font(.headline)
                .padding()

            Spacer()
        }
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
    }
}
