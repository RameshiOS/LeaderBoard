//
//  LeaderboardView.swift
//  LeaderBoard
//
//  Created by Ramesh Guddala on 15/03/25.
//

import Foundation
import SwiftUI
// MARK: - Leaderboard View
struct LeaderboardView: View {
    @StateObject private var viewModel = LeaderboardViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.players.sorted(by: >)) { player in
                    HStack {
                        Text(player.name)
                        Spacer()
                        Text("\(player.score) pts")
                            .fontWeight(.bold)
                        Button(action: {
                            viewModel.updateScore(for: player, newScore: player.score + 5)
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.blue)
                        }
                    }
                }
                
                if viewModel.players.count < viewModel.allPlayers.count {
                    HStack {
                        Spacer()
                        Button("Load More") {
                            viewModel.loadMorePlayers()
                        }
                        Spacer()
                    }
                }
            }
            .navigationTitle("🏆 Leaderboard")
        }
    }
}
