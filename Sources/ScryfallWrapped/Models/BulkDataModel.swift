//
//  Created by Zaheer Moola on 2022/07/14.
//

import Foundation

public struct BulkDataModel: Codable {
    /// A unique ID for this bulk item
    public let id: UUID
    /// The Scryfall API URI for this file
    public let uri: String
    /// Type of bulk data file
    public let type: BulkDataType
    /// A human-readable name for this file
    public let name: String
    /// A human-readable description for this file
    public let description: String
    /// The URI that hosts this bulk file for fetching
    public let downloadUri: String
    /// The time when this file was last updated
    public let dateUpdated: String
    /// The size of this file in integer bytes
    public let compressedSize: Int
    /// The MIME type of this file
    public let contentType: String
    /// The Content-Encoding encoding that will be used to transmit this file when you download it
    public let contentEncoding: String

    enum CodingKeys: String, CodingKey {
        case id, uri, type, name, description
        case downloadUri = "download_uri"
        case dateUpdated = "updated_at"
        case compressedSize = "compressed_size"
        case contentType = "content_type"
        case contentEncoding = "content_encoding"
    }
}

public enum BulkDataType: String, Codable {
    /// A JSON file containing one Scryfall card object for each Oracle ID on Scryfall.
    case oracle = "oracle_cards"

    /// A JSON file of Scryfall card objects that together contain all unique artworks.
    case uniqueArtwork = "unique_artwork"

    /// A JSON file containing every card object on Scryfall in every language.
    case all = "all_cards"

    /// A JSON file containing all Rulings on Scryfall. Each ruling refers to cards via an `oracle_id`.
    case rulings

    /// A JSON file containing every card object on Scryfall in English or the printed language if the card is only available in one language.
    case `default` = "default_cards"
}
