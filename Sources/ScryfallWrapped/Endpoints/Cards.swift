//
//  Created by Zaheer Moola on 2022/06/17.
//

import Foundation

public extension Endpoint {
    /// Returns a paginated card list matching a defined search predicate with additonal ordering and filtering options
    static func cards(searchedBy query: String,
                      unique: UniqueCardType? = nil,
                      order: CardSortOrder? = nil,
                      sortDirection: SortDirection? = nil,
                      includeExtras: Bool? = nil,
                      includeMultilingual: Bool? = nil,
                      includeVariations: Bool? = nil,
                      page: Int? = nil
    ) -> Self {
        Endpoint(path: Constants.Endpoints.Cards.searchEndpoint,
                 queryItems: [URLQueryItem(name: Constants.Endpoints.Cards.queryKey, value: query),
                              URLQueryItem(name: Constants.Endpoints.Cards.uniqueKey, value: unique?.rawValue),
                              URLQueryItem(name: Constants.Endpoints.Cards.orderKey, value: order?.rawValue),
                              URLQueryItem(name: Constants.Endpoints.Cards.directionKey,
                                           value: sortDirection?.rawValue),
                              URLQueryItem(name: Constants.Endpoints.Cards.extrasKey,
                                           value: includeExtras?.nullableString),
                              URLQueryItem(name: Constants.Endpoints.Cards.multilingualKey,
                                           value: includeMultilingual?.nullableString),
                              URLQueryItem(name: Constants.Endpoints.Cards.variationsKey,
                                           value: includeVariations?.nullableString),
                              URLQueryItem(name: Constants.Endpoints.Cards.pageKey, value: page?.nullableString)])
    }

    /// Returns a card object exactly matching the name provided
    static func card(namedExactly name: String,
                     setCode: String? = nil,
                     imageVersion: ImageVersion? = nil,
                     backFaceOfCard: Bool = false
    ) -> Self {
        cardNamed(exactly: name, fuzzy: nil, setCode: setCode,
                  imageVersion: imageVersion, backFaceOfCard: backFaceOfCard)
    }

    /// Returns a card object when a `fuzzy` name is provided. Only returns a card if there is an unambigious match for the card.
    static func card(withPartialName name: String,
                     setCode: String? = nil,
                     imageVersion: ImageVersion? = nil,
                     backFaceOfCard: Bool = false
    ) -> Self {
        cardNamed(exactly: nil, fuzzy: name, setCode: setCode,
                  imageVersion: imageVersion, backFaceOfCard: backFaceOfCard)
    }

    private static func cardNamed(exactly: String?, fuzzy: String?, setCode: String?,
                                  imageVersion: ImageVersion?, backFaceOfCard: Bool
    ) -> Self {
        var queryItems = [URLQueryItem(name: Constants.Endpoints.Cards.setKey, value: setCode),
                          URLQueryItem(name: Constants.Endpoints.Cards.imageVersionKey,
                                       value: imageVersion?.rawValue),
                          URLQueryItem(name: Constants.Endpoints.Cards.faceKey,
                                       value: backFaceOfCard ? Constants.Endpoints.Cards.cardBackValue : nil)]
        if let exactName = exactly {
            queryItems.append(URLQueryItem(name: Constants.Endpoints.Cards.exactKey, value: exactName))
        } else if let fuzzyName = fuzzy {
            queryItems.append(URLQueryItem(name: Constants.Endpoints.Cards.fuzzyKey, value: fuzzyName))
        }

        return Endpoint(path: Constants.Endpoints.Cards.namedEndpoint, queryItems: queryItems)
    }

    /// Returns a catalog of card objects that are autocompleted based on a query
    static func autocompleteCard(for query: String, includeExtras: Bool? = nil) -> Self {
        Endpoint(path: Constants.Endpoints.Cards.autocompleteEndpoint,
                 queryItems: [URLQueryItem(name: Constants.Endpoints.Cards.queryKey, value: query),
                              URLQueryItem(name: Constants.Endpoints.Cards.extrasKey,
                                           value: includeExtras?.nullableString)])
    }

    /// Returns a random card object from the magic database, query parameters can be used to add restrictions
    static func randomCard(query: String? = nil,
                           imageVersion: ImageVersion? = nil,
                           backFaceOfCard: Bool = false
    ) -> Self {
        Endpoint(path: Constants.Endpoints.Cards.randomEndpoint,
                 queryItems: [URLQueryItem(name: Constants.Endpoints.Cards.queryKey, value: query),
                              URLQueryItem(name: Constants.Endpoints.Cards.imageVersionKey,
                                           value: imageVersion?.rawValue),
                              URLQueryItem(name: Constants.Endpoints.Cards.faceKey,
                                           value: backFaceOfCard ? Constants.Endpoints.Cards.cardBackValue : nil)])
    }

}

// MARK: - Card request options
public extension Endpoint {
    enum UniqueCardType: String {
        /// Default. Removes duplicate gameplay objects (cards that share a name and have the same functionality)
        case cards

        /// Returns only one copy of each unique artwork for matching cards.
        case art

        /// Returns all prints for all cards matched (disables rollup)
        case prints
    }

    enum SortDirection: String {
        case auto
        case ascending = "asc"
        case descending = "desc"
    }

    enum CardSortOrder: String {
        case name
        case set
        case released
        case rarity
        case color
        case usdPrice = "usd"
        case tixPrice = "tix"
        case eurPrice = "eur"
        case cmc
        case power
        case toughness
        case edhrecRanking = "edhrec"
        case pennyRanking = "penny"
        case artist
        case review
    }

    enum ImageVersion: String {
        case small
        case normal
        case large
        case png
        case artCrop = "art_crop"
        case borderCrop = "border_crop"
    }
}
