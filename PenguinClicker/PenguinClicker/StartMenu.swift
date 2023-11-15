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

                Text("Click the penguin to start collecting coins!")
                    .font(.headline)
                    .padding()

                Spacer()

                Text("Michael Mathews - CSC680-01")
                    .font(.footnote)
                    .padding()
            }
            .navigationBarHidden(true)
            .navigationTitle("")
        }
    }
}

struct StartMenu_Previews: PreviewProvider {
    static var previews: some View {
        StartMenu()
    }
}
