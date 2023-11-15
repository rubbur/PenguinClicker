//
//  ContentView.swift
//  PenguinClicker
//
//  Created by Michael Mathews on 11/14/23.
//

import SwiftUI
import CoreData

struct StartMenu: View {
    var body: some View {
        VStack {
            Text("Welcome to Penguin Clicker")
                .font(.title)
                .padding()

            Spacer()

            Button(action: {
                // navigate to game
            }) {
                Text("Start")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()

            Spacer()
        }
    }
}

struct StartMenu_Previews: PreviewProvider {
    static var previews: some View {
        StartMenu()
    }
}