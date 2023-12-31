# Penguin Clicker
### macOS version: 10.15.5<br>
### Xcode version: 12.4 (12D4e)<br>
### Simulated iOS version: 14.4

Penguin Clicker is an iOS game where you click (or tap) a penguin to earn coins. After earning enough coins, you can purchase upgrades that increase coins per click or give you passive income. There is a reset button on the home screen where you can reset your progress. Your progress is saved when you go back to the main menu or even close the app.

Features:
- Saved data using UserDefaults.
- Real-time updating coin counter.
- Upgrades.
- Animations on tapping the penguin.
- Ability to reset progress.
- Main menu that allows a tap gesture to go to the game view.
- Music and sound effects for purchasing.
- Custom app icon.

Issues: 
- Attempting to use Core Data causes the app to crash on startup. The goal was to have a Core Data entity called Player that had attributes for things such as coinCount. 
- Even used Macbooks are expensive so I emulated macOS which was difficult at best.
- Outdated macOS and Xcode versions meaning less features available.
- Audio doesn't play when the files are moved to a subdirectory.
<br>

![image](https://github.com/rubbur/PenguinClicker/assets/33476040/c6730dbc-1efb-4768-b20d-b40526f86813)
