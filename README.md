# 🎮 Swift Leaderboard App

An advanced **Leaderboard System** built in Swift, demonstrating the power of **Hashable, Equatable, Comparable, and Identifiable** protocols. 🚀

## 📌 Features

- 🏆 **Sort Players** by score using `Comparable`
- 🔍 **Fast Lookups** in dictionaries using `Hashable`
- ✅ **Check Equality** of players using `Equatable`
- 🔗 **SwiftUI Integration** with `Identifiable`

## 🛠️ Installation

1. Clone this repository:
   ```sh
   git clone https://github.com/yourusername/leaderboard-app.git
   ```
2. Open the project in Xcode.
3. Run the app on a simulator or device.

## 🚀 How It Works

### Player Model Implementation

```swift
struct Player: Equatable, Hashable, Comparable, Identifiable {
    let id: UUID
    let name: String
    let score: Int
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.name == rhs.name && lhs.score == rhs.score
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(score)
    }
    
    static func < (lhs: Player, rhs: Player) -> Bool {
        return lhs.score > rhs.score // Higher score ranks first
    }
}
```

### Sorting the Leaderboard

```swift
var players: [Player] = [
    Player(id: UUID(), name: "Alice", score: 1500),
    Player(id: UUID(), name: "Bob", score: 1200),
    Player(id: UUID(), name: "Charlie", score: 1800)
]

let sortedPlayers = players.sorted()
```

## 📂 Full Blog Post

Check out my detailed article explaining **Swift protocols** with real-world use cases and examples! 🎯 🔗 **Read here:** [Your Blog Link]

## 💡 Contributing

Feel free to open issues or submit pull requests to improve the project.

## 📜 License

This project is open-source and available under the **MIT License**.

---

🚀 Follow me on [LinkedIn]([https://www.linkedin.com](https://www.linkedin.com/in/ramesh-guddala-0080kgrams/)) for more Swift tips!

\#Swift #iOSDevelopment #SwiftUI #Leaderboard #Coding

