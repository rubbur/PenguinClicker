//
//  ContentView.swift
//  PenguinClicker
//
//  Created by Michael Mathews on 11/14/23.
//

import SwiftUI
import AVFoundation

struct StartMenu: View {
    @State private var isGameViewPresented = false
    @State private var showAlert = false
    @State private var penguinAnimation: Bool = false
    @State private var player: AVAudioPlayer?
    
    //var player: AVAudioPlayer?
    //@ObservedObject private var audioPlayer = AudioPlayer.shared

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
                        .scaleEffect(penguinAnimation ? 1.2 : 1)
                        .animation(.easeInOut(duration:0.2))
                        .onTapGesture {
                            withAnimation {
                                penguinAnimation.toggle()
                            }
                            isGameViewPresented = true
                        }
                    
                    Text("Click the penguin to start collecting coins!")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    // Other content
                    
                    Text("CLICK TO RESET ALL PROGRESS")
                        .padding()
                        .onTapGesture {
                            showAlert = true
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Reset Progress"),
                                message: Text("Are you sure you want to reset all progress?"),
                                primaryButton: .destructive(Text("Reset")) {
                                    resetProgress()
                                },
                                secondaryButton: .cancel()
                            )
                        }

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
            .onAppear(){
                playSound()
            }
            .onDisappear(){
                penguinAnimation = false
            }
        }
    }
    
    private func resetProgress() {
                UserDefaults.standard.set(0, forKey: "coinCount")
                UserDefaults.standard.set(1, forKey: "clickRate")
                UserDefaults.standard.set(0, forKey: "passiveRate")
    }

    func playSound() {
        guard let path = Bundle.main.path(forResource: "music", ofType: "mp3") else {
            return
        }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }

    func stopSound() {
        player?.stop()
        player = nil
    }
}



struct StartMenu_Previews: PreviewProvider {
    static var previews: some View {
        StartMenu()
    }
}
