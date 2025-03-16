//
//  LeaderboardViewModel.swift
//  LeaderBoard
//
//  Created by Ramesh Guddala on 15/03/25.
//

import Foundation

// MARK: - ViewModel
class LeaderboardViewModel: ObservableObject {
    @Published var players: [Player] = []
    var allPlayers: [Player] = []
    private let storageKey = "playersData"
    private var loadedPages = 0
    private let pageSize = 3
    
    init() {
        loadFromStorage()
        loadMorePlayers()
    }
    
    private func loadFromStorage() {
        if let savedData = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([Player].self, from: savedData) {
            self.allPlayers = decoded
        } else {
            self.allPlayers = generateMockPlayers()
            saveToStorage()
        }
    }
    
    private func saveToStorage() {
        if let encoded = try? JSONEncoder().encode(allPlayers) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }
    
    func loadMorePlayers() {
        let start = loadedPages * pageSize
        let end = min(start + pageSize, allPlayers.count)
        
        if start < allPlayers.count {
            players.append(contentsOf: allPlayers[start..<end])
            loadedPages += 1
        }
    }
    
    func updateScore(for player: Player, newScore: Int) {
        if let index = players.firstIndex(where: { $0.id == player.id }) {
            players[index].score = newScore
            allPlayers[index].score = newScore
            saveToStorage()
        }
    }
    
    private func generateMockPlayers() -> [Player] {
        return [
            Player(name: "Alice", score: 90),
            Player(name: "Bob", score: 85),
            Player(name: "Charlie", score: 95),
            Player(name: "David", score: 80),
            Player(name: "Eve", score: 92),
            Player(name: "Frank", score: 87),
            Player(name: "Grace", score: 78),
            Player(name: "Hank", score: 89)
        ]
    }
}
