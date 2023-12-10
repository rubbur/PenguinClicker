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
        get { UserDefaults.standard.integer(forKey: "coinCount") }
        set { UserDefaults.standard.set(newValue, forKey: "coinCount") }
    }

    var clickRate: Int {
        get { UserDefaults.standard.integer(forKey: "clickRate") }
        set { UserDefaults.standard.set(newValue, forKey: "clickRate") }
    }

    var passiveRate: Int {
        get { UserDefaults.standard.integer(forKey: "passiveRate") }
        set { UserDefaults.standard.set(newValue, forKey: "passiveRate") }
    }
}

struct Game: View {
    @State private var clickCount: Int = 0
    @State private var clickRate: Int = 1
    @State private var passiveRate: Int = 0
    @State private var showNotEnoughCoinsAlert = false
    @State private var timer: Timer?
    @ObservedObject private var userDataManager = UserDataManager.shared
    @ObservedObject private var audioPlayer = AudioPlayer.shared
    @State private var soundEffectPlayer = SoundEffectPlayer.shared
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Image("penguin")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .onTapGesture {
                    clickCount += clickRate
                    userDataManager.coinCount += clickRate
                }

            Text("Coins: \(clickCount)")
                .font(.headline)
                .padding()
            
            Text("Buy a Pickaxe (25 Coins)")
                .padding()
                .onTapGesture {
                    if(userDataManager.coinCount>=25 &&
                        clickCount>=25){
                        clickCount-=25
                        userDataManager.coinCount-=25
                        clickRate+=1
                        userDataManager.clickRate+=1
                        soundEffectPlayer.playCoinSound()
                    } else {
                        showNotEnoughCoinsAlert = true
                    }
                }
                .alert(isPresented: $showNotEnoughCoinsAlert) {
                    Alert(
                        title: Text("Could not purchase"),
                        message: Text("You need more coins."),
                        dismissButton: .default(Text("OK"))
                    )
                }
            
            Text("Hire Grandpa (100 Coins)")
                .padding()
                .onTapGesture {
                    if(userDataManager.coinCount>=100 &&
                        clickCount>=100){
                        clickCount-=100
                        userDataManager.coinCount-=100
                        passiveRate+=1
                        userDataManager.passiveRate+=1
                        soundEffectPlayer.playCoinSound()
                    } else {
                        showNotEnoughCoinsAlert = true
                    }
                }
                .alert(isPresented: $showNotEnoughCoinsAlert) {
                    Alert(
                        title: Text("Could not purchase"),
                        message: Text("You need more coins."),
                        dismissButton: .default(Text("OK"))
                    )
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
            clickRate = userDataManager.clickRate
            passiveRate = userDataManager.passiveRate
            startPassiveIncomeTimer()
        }
        .onDisappear {
            stopPassiveIncomeTimer()
        }
    }
    
    private func startPassiveIncomeTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                clickCount += passiveRate
                userDataManager.coinCount += passiveRate
            }
        }

    private func stopPassiveIncomeTimer() {
            timer?.invalidate()
            timer = nil
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
