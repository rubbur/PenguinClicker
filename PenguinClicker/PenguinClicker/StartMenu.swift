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
            ZStack {
                Color.blue
                    .ignoresSafeArea() // Extend the background color
                
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
                        .frame(width: 200, height: 200)
                        .onTapGesture {
                            isGameViewPresented = true
                        }
                    
                    Text("Click the penguin to start collecting coins!")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    // Other content
                    
                    // Footer
                    Text("Michael Mathews - CSC680-01")
                        .font(.footnote)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black)
                }
                .navigationBarHidden(true)
                .navigationTitle("")
            }
        }
    }
}

struct StartMenu_Previews: PreviewProvider {
    static var previews: some View {
        StartMenu()
    }
}
