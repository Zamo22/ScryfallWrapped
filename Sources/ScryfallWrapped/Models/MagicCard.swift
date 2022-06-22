//
//  Created by Zaheer Moola on 2022/06/20.
//

import Foundation

public struct MagicCard: Codable {
    // MARK: - Core fields
    public let object: ScryfallObject

    /// A unique ID for this card in Scryfall’s database.
    public let id: UUID
    /// A unique ID for this card’s oracle identity. This value is consistent across reprinted card editions, and unique among different cards with the same name
    public let oracleId: UUID
    /// This card’s Arena ID, if any
    public let arenaId: Int?
    /// A language code for this printing.
    public let language: String
    /// This card’s Magic Online ID (also known as the Catalog ID), if any
    public let magicOnlineId: Int?
    /// This card’s foil Magic Online ID (also known as the Catalog ID), if any
    public let magicOnlineFoilId: Int?
    /// This card’s multiverse IDs on Gatherer, if any, as an array of integers. Note that Scryfall includes many promo cards, tokens, and other esoteric objects that do not have these identifiers.
    public let multiverseIds: [Int]?
    /// This card’s ID on TCGplayer’s API, also known as the productId
    public let tcgplayerId: Int?
    /// This card’s ID on TCGplayer’s API, for its etched version if that version is a separate product
    public let tcgplayerEtchedId: Int?
    /// This card’s ID on Cardmarket’s API, also known as the idProduct
    public let cardmarketId: Int?
    /// A link to where you can begin paginating all re/prints for this card on Scryfall’s API
    public let printsSearchUri: String
    /// A link to this card’s rulings list on Scryfall’s API
    public let rulingUri: String
    /// A link to this card’s permapage on Scryfall’s website
    public let scryfallPageUri: String
    /// A link to this card object on Scryfall’s API
    public let scryfallUri: String

    // MARK: - Gameplay fields

    /// If this card is closely related to other cards, this property will be an array with Related Card Objects
    public let allParts: [RelatedCard]?
    /// An array of Card Face objects, if this card is multifaced
    public let cardFaces: [CardFace]?
    /// The card’s converted mana cost. Note that some funny cards have fractional mana costs. Renamed to mana value
    public let cmc: Double
    /// This card’s color identity
    public let colorIdentity: [Color]
    /// The colors in this card’s color indicator, if any. A null value for this field indicates the card does not have one
    public let colorIndicator: [Color]?
    /// This card’s colors, if the overall card has colors defined by the rules. Otherwise the colors will be on the cardFaces objects
    public let colors: [Color]?
    /// This card’s overall rank/popularity on EDHREC. Not all cards are ranked
    public let edhrecRank: Int?
    /// This card’s hand modifier, if it is Vanguard card. This value will contain a delta, such as -1
    public let handModifier: String?
    /// An array of keywords that this card uses, such as 'Flying' and 'Cumulative upkeep'
    public let keywords: [String]
    /// A code for this card’s layout. Will be unknown for new card layouts until catered for.
    public let layout: Layout
    /// An object describing the legality of this card across play formats.
    public let legalities: FormatLegalities
    /// This card’s life modifier, if it is Vanguard card. This value will contain a delta, such as +2.
    public let lifeModifier: String?
    /// This loyalty if any. Note that some cards have loyalties that are not numeric, such as X
    public let loyalty: String?
    /// The mana cost for this card. This value will be any empty string "" if the cost is absent.
    public let manaCost: String?
    /// The name of this card. If this card has multiple faces, this field will contain both names separated by ␣//␣
    public let name: String
    /// The Oracle text for this card, if any
    public let oracleText: String?
    /// True if this card is oversized
    public let oversized: Bool
    /// This card’s rank/popularity on Penny Dreadful. Not all cards are ranked
    public let pennyRank: Int?
    /// This card’s power, if any. Note that some cards have powers that are not numeric, such as *
    public let power: String?
    /// This card’s toughness, if any. Note that some cards have toughnesses that are not numeric, such as *
    public let toughness: String?
    /// Colors of mana that this card could produce
    public let producedMana: [Color]?
    /// True if this card is on the Reserved List
    public let reserved: Bool
    /// The type line of this card
    public let typeLine: String

    // MARK: - Print fields

    /// The name of the illustrator of this card. Newly spoiled cards may not have this field yet
    public let artist: String?
    /// Whether this card is found in boosters
    public let inBooster: Bool
    /// This card’s border color
    public let borderColor: CardBorderColor
    /// The Scryfall ID for the card back design present on this card
    public let cardBackId: UUID
    /// This card’s collector number. Note that collector numbers can contain non-numeric characters, such as letters or ★
    public let collectorNumber: String
    /// True if you should consider avoiding use of this print downstream
    public let contentWarning: Bool?
    /// True if this card was only released in a video game
    public let digital: Bool
    /// An array of CardFinish objects that the card can appear in
    public let finishes: [CardFinish]
    /// The just-for-fun name printed on the card
    public let flavorName: String?
    /// The flavor text, if any
    public let flavorText: String?
    /// An array of this card’s FrameEffects, if any
    public let frameEffects: [FrameEffects]?
    /// This card’s Frame layout
    public let frame: Frame
    /// True if this card’s artwork is larger than normal
    public let fullArt: Bool
    /// A list of Games that this card print is available in
    public let games: [Games]
    /// True if this card’s imagery is high resolution
    public let highResImage: Bool
    /// A unique identifier for the card artwork that remains consistent across reprints. Newly spoiled cards may not have this field yet
    public let illustrationId: UUID?
    /// A CardImageStatus indicator for the state of this card’s image
    public let imageStatus: CardImageStatus
    /// An object containing a number of uris for different size and quality images
    public let imageUris: CardImageUris?
    /// An CardPrices object containing daily price information for this card
    public let prices: CardPrices
    /// The localized name printed on this card, if any
    public let printedName: String?
    /// The localized text printed on this card, if any
    public let printedText: String?
    /// The localized type line printed on this card, if any
    public let printedTypeLine: String?
    /// True if this card is a promotional print
    public let promo: Bool
    /// An array of strings describing what categories of promo cards this card falls into
    public let promoTypes: [String]?
    /// A dictionary providing URIs to this card’s listing on major marketplaces
    // TODO: Check if this dictionary works as expected
    public let purchaseUris: [String: String]
    /// This card's rarity
    public let rarity: CardRarity
    /// An dictionary providing URIs to this card’s listing on other Magic: The Gathering online resources
    public let relatedUris: [String: String]
    /// The date this card was first released
    public let dateReleased: String
    /// True if this card is a reprint
    public let reprint: Bool
    /// A link to this card’s set on Scryfall’s website
    public let scryfallSetUri: String
    /// This card’s full set name
    public let setName: String
    /// A link to where you can begin paginating this card’s set on the Scryfall API
    public let setSearchUri: String
    /// A computer-readable classification for this set. Due to the number of different types of sets, no enum was currently created for this
    public let setType: String
    /// A link to this card’s set object on Scryfall’s API
    public let setUri: String
    /// This card's set code
    public let set: String
    /// This card’s Set object UUID
    public let setId: String
    /// True if this card is a Story Spotlight
    public let storySpotlight: Bool
    /// True if the card is printed without text
    public let textless: Bool
    /// Whether this card is a variation of another printing
    public let variation: Bool
    /// The printing ID of the printing this card is a variation of
    public let variationOf: UUID?
    /// The SecurityStamp on this card, if any
    public let securityStamp: SecurityStamp?
    /// This card’s watermark, if any
    public let watermark: String?
    /// The date this card was previewed
    public let previewDate: String?
    /// A link to the preview for this card
    public let previewSourceUri: String?
    /// The name of the source that previewed this card
    public let previewSourceName: String?


    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case object, id, cmc, colors, keywords, layout, legalities,
             loyalty, name, oversized, power, toughness, reserved,
             artist, digital, finishes, frame, games, prices, promo,
             rarity, reprint, set, textless, variation, watermark
        case oracleId = "oracle_id"
        case arenaId = "arena_id"
        case language = "lang"
        case magicOnlineId = "mtgo_id"
        case magicOnlineFoilId = "mtgo_foil_id"
        case multiverseIds = "multiverse_ids"
        case tcgplayerId = "tcgplayer_id"
        case tcgplayerEtchedId = "tcgplayer_etched_id"
        case cardmarketId = "cardmarket_id"
        case printsSearchUri = "prints_search_uri"
        case rulingUri = "rulings_uri"
        case scryfallPageUri = "scryfall_uri"
        case scryfallUri = "uri"

        case allParts = "all_parts"
        case cardFaces = "card_faces"
        case colorIdentity = "color_identity"
        case colorIndicator = "color_indicator"
        case edhrecRank = "edhrec_rank"
        case handModifier = "hand_modifier"
        case lifeModifier = "life_modifier"
        case manaCost = "mana_cost"
        case oracleText = "oracle_text"
        case pennyRank = "penny_rank"
        case producedMana = "produced_mana"
        case typeLine = "type_line"

        case inBooster = "booster"
        case borderColor = "border_color"
        case cardBackId = "card_back_id"
        case collectorNumber = "collector_number"
        case contentWarning = "content_warning"
        case flavorName = "flavor_name"
        case flavorText = "flavor_text"
        case frameEffects = "frame_effects"
        case fullArt = "full_art"
        case highResImage = "highres_image"
        case illustrationId = "illustration_id"
        case imageStatus = "image_status"
        case imageUris = "image_uris"
        case printedName = "printed_name"
        case printedText = "printed_text"
        case printedTypeLine = "printed_type_line"
        case promoTypes = "promo_types"
        case purchaseUris = "purchase_uris"
        case relatedUris = "related_uris"
        case dateReleased = "released_at"
        case scryfallSetUri = "scryfall_set_uri"
        case setName = "set_name"
        case setSearchUri = "set_search_uri"
        case setType = "set_type"
        case setUri = "set_uri"
        case setId = "set_id"
        case storySpotlight = "story_spotlight"
        case variationOf = "variation_of"
        case securityStamp = "security_stamp"
        case previewDate = "preview.previewed_at"
        case previewSourceUri = "preview.source_uri"
        case previewSourceName = "preview.source"
    }
}


