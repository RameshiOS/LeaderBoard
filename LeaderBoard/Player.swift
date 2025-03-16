//
//  Player.swift
//  LeaderBoard
//
//  Created by Ramesh Guddala on 15/03/25.
//

import Foundation
// MARK: - Player Model
struct Player: Identifiable, Equatable, Hashable, Comparable, Codable {
    var id: UUID = UUID()
    let name: String
    var score: Int
    
    static func < (lhs: Player, rhs: Player) -> Bool {
        return lhs.score < rhs.score
    }
}
