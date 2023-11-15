//
//  Game.swift
//  PenguinClicker
//
//  Created by Michael Mathews on 11/15/23.
//

import SwiftUI

struct Game: View {
    @State private var clickCount = 0
    @Environment(\.presentationMode) var presentationMode

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

            Text("Michael Mathews - CSC680-01")
                    .font(.footnote)
                    .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
    }
}

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action: {
            // Go back to the StartMenu view
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.left.circle.fill")
                Text("Go Back")
            }
        }
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
    }
}

