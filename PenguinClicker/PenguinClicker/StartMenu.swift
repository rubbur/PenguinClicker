//
//  ContentView.swift
//  PenguinClicker
//
//  Created by Michael Mathews on 11/14/23.
//

import SwiftUI

struct StartMenu: View {
    @State private var isGameViewPresented = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Penguin Clicker")
                    .font(.title)
                    .padding()

                NavigationLink(destination: Game(), isActive: $isGameViewPresented) {
                    EmptyView()
                }
                .hidden()

                Image("penguin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .onTapGesture {
                        isGameViewPresented = true
                    }

                Text("Click the penguin to start the game!")
                    .font(.headline)
                    .padding()

                Spacer()

                Button(action: {
                    // Navigate to game
                    isGameViewPresented = true
                }) {
                    Text("Start")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .frame(width: 200, height: 50)
                .padding()

                Spacer()
            }
            .navigationTitle("Penguin Clicker")
        }
    }
}

struct StartMenu_Previews: PreviewProvider {
    static var previews: some View {
        StartMenu()
    }
}
