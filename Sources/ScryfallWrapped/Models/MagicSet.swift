//
//  Created by Zaheer Moola on 2022/06/20.
//

import Foundation

public struct MagicSet: Codable {
    public let object: ScryfallObject

    /// A unique ID for this set on Scryfall that will not change.
    public let id: UUID
    /// The unique three to five-letter code for this set.
    public let code: String
    /// The unique code for this set on MTGO, which may differ from the regular code.
    public let magicOnlineCode: String?
    /// This set’s ID on TCGplayer’s API, also known as the groupId.
    public let tcgplayerId: Int?
    /// The English name of the set.
    public let name: String
    // TODO: Potentially create an enum for this and its counterpart in the card object
    /// A computer-readable classification for this set. Due to the number of different types of sets, no enum was currently created for this
    public let setType: String
    /// The date the set was released or the first card was printed in the set (in GMT-8 Pacific time).
    public let dateReleased: String?
    /// The block code for this set, if any.
    public let blockCode: String?
    /// The block or group name code for this set, if any.
    public let block: String?
    /// The set code for the parent set, if any. promo and token sets often have a parent set.
    public let parentSetCode: String?
    /// The number of cards in this set.
    public let cardCount: Int
    /// The denominator for the set’s printed collector numbers.
    public let printedSize: Int?
    /// True if this set was only released in a video game.
    public let isDigital: Bool
    /// True if this set contains only foil cards.
    public let isFoilOnly: Bool
    /// True if this set contains only nonfoil cards.
    public let isNonFoilOnly: Bool
    /// A link to this set’s permapage on Scryfall’s website.
    public let scryfallPageUri: String
    /// A link to this set object on Scryfall’s API.
    public let scryfallLinkUri: String
    /// A URI to an SVG file for this set’s icon on Scryfall’s CDN.
    public let iconUri: String
    /// A Scryfall API URI that you can request to begin paginating over the cards in this set.
    public let searchUri: String

    enum CodingKeys: String, CodingKey {
        case object, code, id, name, block
        case magicOnlineCode = "mtgo_code"
        case tcgplayerId = "tcgplayer_id"
        case setType = "set_type"
        case dateReleased = "released_at"
        case blockCode = "block_code"
        case parentSetCode = "parent_set_code"
        case cardCount = "card_count"
        case printedSize = "printed_size"
        case isDigital = "digital"
        case isFoilOnly = "foil_only"
        case isNonFoilOnly = "nonfoil_only"
        case scryfallPageUri = "scryfall_uri"
        case scryfallLinkUri = "uri"
        case iconUri = "icon_svg_uri"
        case searchUri = "search_uri"
    }
}
