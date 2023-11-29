//
//  Game.swift
//  PenguinClicker
//
//  Created by Michael Mathews on 11/15/23.
//

import SwiftUI
import CoreData

struct Game: View {
    @State private var clickCount: Int = 0
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Image("penguin")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .onTapGesture {
                    clickCount += 1
                    saveCoinCount()
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
        .onAppear {
            loadCoinCount()
        }
    }

    private func saveCoinCount() {
        do {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
            let players = try viewContext.fetch(request) as! [Player]

            if let player = players.first {
                player.coinCount = Int16(clickCount)
            } else {
                let newPlayer = Player(context: viewContext)
                newPlayer.coinCount = Int16(clickCount)
            }

            try viewContext.save()
        } catch {
            print("Error saving coin count: \(error.localizedDescription)")
        }
    }

    private func loadCoinCount() {
        do {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
            let players = try viewContext.fetch(request) as! [Player]

            if let player = players.first {
                clickCount = Int(player.coinCount)
            }
        } catch {
            print("Error loading coin count: \(error.localizedDescription)")
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
                Text("Go Back")
            }
        }
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
