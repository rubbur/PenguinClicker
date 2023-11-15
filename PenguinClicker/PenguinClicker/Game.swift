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
            Image("penguin") // image file is named "penguin.png"
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150) 
                .onTapGesture {
                    clickCount += 1
                }

            Text("Coins: \(clickCount)")
                .font(.headline)
                .padding()

            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(label: "Go Back"))
    }
}

struct CustomBackButton: View {
    var label: String

    var body: some View {
        Button(action: {
        }) {
            HStack {
                Image(systemName: "arrow.left.circle.fill") 
                Text(label)
            }
        }
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
    }
}
