//
//  Created by Zaheer Moola on 2022/06/17.
//

import Foundation

public extension Endpoint {
    /// Retrieve all bulk data objects
    static var bulkData: Self {
        Endpoint(path: Constants.Endpoints.BulkData.endpoint)
    }

    /// Retrieve bulk data object by id
    static func bulkData(byId id: String) -> Self {
        Endpoint(path: "\(Constants.Endpoints.BulkData.endpoint)/\(id)")
    }

    /// Retrieve bulk data by type
    static func bulkData(byType type: String) -> Self {
        Endpoint(path: "\(Constants.Endpoints.BulkData.endpoint)/\(id)")
    }
}

// MARK: - Bulk data request options
public extension Endpoint {
    enum BulkDataType: String {
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
}
