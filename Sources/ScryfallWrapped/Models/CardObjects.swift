//
//  Created by Zaheer Moola on 2022/06/21.
//

import Foundation

public struct RelatedCard: Codable, Hashable {
    public let object: ScryfallObject
    /// A unique ID for this card in Scryfall’s database.
    public let id: UUID
    /// A field explaining what role this card plays in this relationship, one of token, meld_part, meld_result, or combo_piece
    public let component: RelatedCardComponent
    /// The name of this particular related card
    public let name: String
    /// The type line of this card
    public let typeLine: String
    /// A URI where you can retrieve a full object describing this card on Scryfall’s AP
    public let scryfallUri: String

    enum CodingKeys: String, CodingKey {
        case object, id, component, name
        case typeLine = "type_line"
        case scryfallUri = "uri"
    }

    public enum RelatedCardComponent: String, Codable {
        case token
        case meldPart = "meld_part"
        case meldResult = "meld_result"
        case comboPiece = "combo_piece"
    }
}

public struct CardFace: Codable, Hashable {
    public let object: ScryfallObject
    /// The name of the illustrator of this card face. Newly spoiled cards may not have this field yet
    public let artist: String?
    /// The mana value of this particular face, if the card is reversible
    public let cmc: Double?
    /// The colors in this face’s color indicator, if any
    public let colorIndicator: [Color]?
    /// This face’s colors, if the game defines colors for the individual face of this card
    public let colors: [Color]?
    /// The flavor text printed on this face, if any
    public let flavorText: String?
    /// A unique identifier for the card face artwork that remains consistent across reprints. Newly spoiled cards may not have this field yet
    public let illustrationId: UUID?
    /// An object providing URIs to imagery for this face, if this is a double-sided card. If this card is not double-sided, then the imageUris property will be part of the parent object instead.
    public let imageUris: CardImageUris?
    /// The layout of this card face, if the card is reversible
    public let layout: String?
    /// This face’s loyalty, if any.
    public let loyalty: String?
    /// The mana cost for this face. This value will be any empty string "" if the cost is absent.
    public let manaCost: String?
    /// The name of this particular face
    public let name: String
    /// The Oracle ID of this particular face, if the card is reversible
    public let oracleId: UUID?
    /// The Oracle text for this face, if any
    public let oracleText: String?
    /// This face’s power, if any. Note that some cards have powers that are not numeric, such as *
    public let power: String?
    /// This face’s toughness, if any
    public let toughness: String?
    /// The localized name printed on this face, if any
    public let printedName: String?
    /// The localized text printed on this face, if any
    public let printedText: String?
    /// The localized type line printed on this face, if any
    public let printedTypeLine: String?
    /// The type line of this particular face, if the card is reversible
    public let typeLine: String?
    /// The watermark on this particulary card face, if any
    public let watermark: String?

    enum CodingKeys: String, CodingKey {
        case object, artist, cmc, colors, layout, loyalty, name, power, toughness, watermark
        case colorIndicator = "color_indicator"
        case flavorText = "flavor_text"
        case illustrationId = "illustration_id"
        case manaCost = "mana_cost"
        case imageUris = "image_uris"
        case oracleId = "oracle_id"
        case oracleText = "oracle_text"
        case printedName = "printed_name"
        case printedText = "printed_text"
        case printedTypeLine = "printed_type_line"
        case typeLine = "type_line"
    }
}

public struct CardImageUris: Codable, Hashable {
    /// A transparent, rounded full card PNG. This is the best image to use for videos or other high-quality content.
    public let png: String?
    /// A full card image with the rounded corners and the majority of the border cropped off. Designed for dated contexts where rounded images can’t be used.
    public let borderCrop: String?
    /// A rectangular crop of the card’s art only. Not guaranteed to be perfect for cards with outlier designs or strange frame arrangements
    public let artCrop: String?
    /// A large full card image
    public let large: String?
    /// A medium-sized full card image
    public let normal: String?
    /// A small full card image. Designed for use as thumbnail or list icon.
    public let small: String?

    enum CodingKeys: String, CodingKey {
        case png, large, normal, small
        case borderCrop = "border_crop"
        case artCrop = "art_crop"
    }
}

public enum Layout: String, CaseIterableDefaultsLast {
    /// A standard Magic card with one face
    case normal
    /// A split-faced card
    case split
    /// Cards that invert vertically with the flip keyword
    case flip
    /// Double-sided cards that transform
    case transform
    /// Cards with meld parts printed on the back
    case meld
    /// Cards with Level Up
    case leveler
    /// Class-type enchantment cards
    case `class`
    /// Saga-type cards
    case saga
    /// Cards with an Adventure spell part
    case adventure
    /// Plane and Phenomenon-type cards
    case planar
    /// Scheme-type cards
    case scheme
    /// Vanguard-type cards
    case vanguard
    /// Token cards
    case token
    /// Emblem cards
    case emblem
    /// Cards with Augment
    case augment
    /// Host-type cards
    case host
    /// Double-sided cards that can be played either-side
    case modalDfc = "modal_dfc"
    /// Tokens with another token printed on the back
    case doubleFacedToken = "double_faced_token"
    /// Art Series collectable double-faced cards
    case artSeries = "art_series"
    /// A Magic card with two sides that are unrelated
    case reversibleCard = "reversible_card"
    /// A new or unknown magic card type which has not been catered for by this package yet.
    case unknown
}

public enum CardBorderColor: String, Codable {
    case black, white, borderless, silver, gold
}

public enum CardFinish: String, Codable {
    case foil, nonfoil, etched, glossy
}

public enum FrameEffects: String, Codable {
    ///  The cards have a legendary crown
    case legendary
    /// The miracle frame effect
    case miracle
    /// The draft-matters frame effect
    case draft
    /// The Devoid frame effect
    case devoid
    /// The Odyssey tombstone mark
    case tombstone
    ///  A colorshifted frame
    case colorshifted
    ///  The FNM-style inverted frame
    case inverted
    /// A custom Showcase frame
    case showcase
    /// The cards have a companion frame
    case companion
    /// The cards have an etched foil treatment
    case etched
    /// The cards have the snowy frame effect
    case snow
    /// The cards have the Lesson frame effect
    case lesson
    /// The Nyx-touched frame effect
    case nyxTouched = "nyxtouched"
    /// The sun and moon transform marks
    case sunMoonDfc = "sunmoondfc"
    /// The compass and land transform marks
    case compassLandDfc = "compasslanddfc"
    /// The Origins and planeswalker transform marks
    case originPwDfc = "originpwdfc"
    /// The moon and Eldrazi transform marks
    case moonEldraziDfc = "mooneldrazidfc"
    /// The waxing and waning crescent moon transform marks
    case waxingAndWaningMoonDfc = "waxingandwaningmoondfc"
    /// An extended art frame
    case extendedArt = "extendedart"
}

public enum Frame: String, Codable {
    /// The original Magic card frame, starting from Limited Edition Alpha
    case frame1993 = "1993"
    /// The updated classic frame starting from Mirage block
    case frame1997 = "1997"
    /// The “modern” Magic card frame, introduced in Eighth Edition and Mirrodin block
    case frame2003 = "2003"
    /// The holofoil-stamp Magic card frame, introduced in Magic 2015
    case frame2015 = "2015"
    /// The frame used on cards `from the future`
    case future
}

public enum CardImageStatus: String, Codable, Hashable {
    case missing, placeholder
    case lowResolution = "lowres"
    case highResolutionScan = "highres_scan"
}

public struct CardPrices: Codable, Hashable {
    public let usd: String?
    public let usdFoil: String?
    public let usdEtched: String?
    public let eur: String?
    public let eurFoil: String?
    public let tix: String?

    enum CodingKeys: String, CodingKey {
        case usd, eur, tix
        case usdFoil = "usd_foil"
        case usdEtched = "usd_etched"
        case eurFoil = "eur_foil"
    }
}

public enum SecurityStamp: String, Codable {
    case oval, triangle, acorn, arena
}
