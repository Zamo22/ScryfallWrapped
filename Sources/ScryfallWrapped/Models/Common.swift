//
//  Created by Zaheer Moola on 2022/06/20.
//

import Foundation

public enum Color: String, Codable {
    case white = "W"
    case blue  = "U"
    case black = "B"
    case red   = "R"
    case green = "G"
}

public struct FormatLegalities: Codable {
    public let standard: Legality
    public let future: Legality
    public let historic: Legality
    public let gladiator: Legality
    public let pioneer: Legality
    public let explorer: Legality
    public let modern: Legality
    public let legacy: Legality
    public let pauper: Legality
    public let vintage: Legality
    public let penny: Legality
    public let commander: Legality
    public let brawl: Legality
    public let historicbrawl: Legality
    public let alchemy: Legality
    public let paupercommander: Legality
    public let duel: Legality
    public let oldschool: Legality
    public let premodern: Legality
}

public enum Legality: String, Codable {
    case legal, restricted, banned
    case notLegal = "not_legal"
}

public enum Games: String, Codable {
    case paper, arena, mtgo
}

public enum CardRarity: String, Codable {
    case common, uncommon, rare, mythic, bonus
}
