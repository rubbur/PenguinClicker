//
//  Game.swift
//  PenguinClicker
//
//  Created by Michael Mathews on 11/15/23.
//

import SwiftUI

class UserDataManager: ObservableObject {
    static let shared = UserDataManager()

    private init() {}

    var coinCount: Int {
        get {
            UserDefaults.standard.integer(forKey: "coinCount")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "coinCount")
        }
    }
}

struct Game: View {
    @State private var clickCount: Int = 0
    @ObservedObject private var userDataManager = UserDataManager.shared
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Image("penguin")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .onTapGesture {
                    clickCount += 1
                    userDataManager.coinCount += 1
                }

            Text("Coins: \(clickCount)")
                .font(.headline)
                .padding()
            
            Text("Click here to buy a Pickaxe (25 Coins)")
                .padding()
                .onTapGesture {
                    if(userDataManager.coinCount>=25 &&
                        clickCount>=25){
                        clickCount-=25
                        userDataManager.coinCount-=25
                    }
                }
            
            Text("Click here to hire Grandpa (100 Coins)")
                .padding()
                .onTapGesture {
                    if(userDataManager.coinCount>=100 &&
                        clickCount>=100){
                        clickCount-=100
                        userDataManager.coinCount-=100
                    }
                }
            
            Spacer()

            Text("Michael Mathews - CSC680-01")
                .font(.footnote)
                .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
        .onAppear {
            clickCount = userDataManager.coinCount
        }
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
                Text("Main Menu")
            }
        }
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
    }
}
