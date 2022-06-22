//
//  Created by Zaheer Moola on 2022/06/17.
//

import Foundation

extension Constants {
    enum Endpoints {
        static let baseUrl = "api.scryfall.com"
        
        enum Sets {
            static let endpoint = "sets"
            static let tcgPlayerIdEndpoint = "\(endpoint)/tcgplayer"
        }

        enum Cards {
            private static let endpoint = "cards"
            static let searchEndpoint = "\(endpoint)/search"
            static let namedEndpoint = "\(endpoint)/named"
            static let autocompleteEndpoint = "\(endpoint)/autocomplete"
            static let randomEndpoint = "\(endpoint)/random"

            static let queryKey = "q"
            static let uniqueKey = "unique"
            static let orderKey = "order"
            static let directionKey = "dir"
            static let extrasKey = "include_extras"
            static let multilingualKey = "include_multilingual"
            static let variationsKey = "include_variations"
            static let pageKey = "page"
            static let exactKey = "exact"
            static let fuzzyKey = "fuzzy"
            static let setKey = "set"
            static let faceKey = "face"
            static let cardBackValue = "back"
            static let imageVersionKey = "version"
        }

        enum BulkData {
            static let endpoint = "bulk-data"
        }
    }
}
