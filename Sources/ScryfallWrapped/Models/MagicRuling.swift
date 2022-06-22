//
//  Created by Zaheer Moola on 2022/06/22.
//

import Foundation

public struct Ruling: Codable {
    public let object: ScryfallObject
    /// RulingSource object indicating whether the ruling came from Wizards of the coast or Scryfall
    public let source: RulingSource
    /// Text of the ruling
    public let comment: String
    /// The date when the ruling or note was published
    public let datePublished: Date
    public let oracleId: String

    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case object, source, comment
        case datePublished = "published_at"
        case oracleId = "oracle_id"
    }

    public enum RulingSource: String, Codable {
        case wotc, scryfall
    }
}

