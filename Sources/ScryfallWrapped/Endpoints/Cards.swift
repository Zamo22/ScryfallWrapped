//
//  Created by Zaheer Moola on 2022/06/17.
//

import Foundation

extension Endpoint {
    static func cards(searchedBy query: String,
                      unique: UniqueCardType?,
                      order: CardSortOrder?,
                      sortDirection: SortDirection?,
                      includeExtras: Bool?,
                      includeMultilingual: Bool?,
                      includeVariations: Bool?,
                      page: Int?
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

    static func card(namedExactly name: String,
                     setCode: String?,
                     imageVersion: ImageVersion?,
                     backFaceOfCard: Bool
    ) -> Self {
        cardNamed(exactly: name, fuzzy: nil, setCode: setCode,
                  imageVersion: imageVersion, backFaceOfCard: backFaceOfCard)
    }

    static func card(withPartialName name: String,
                     setCode: String?,
                     imageVersion: ImageVersion?,
                     backFaceOfCard: Bool
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

    static func autocompleteCard(for query: String, includeExtras: Bool?) -> Self {
        Endpoint(path: Constants.Endpoints.Cards.autocompleteEndpoint,
                 queryItems: [URLQueryItem(name: Constants.Endpoints.Cards.queryKey, value: query),
                              URLQueryItem(name: Constants.Endpoints.Cards.extrasKey,
                                           value: includeExtras?.nullableString)])
    }

    static func randomCard(query: String?,
                           imageVersion: ImageVersion?,
                           backFaceOfCard: Bool
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
public enum UniqueCardType: String {
    /// Default. Removes duplicate gameplay objects (cards that share a name and have the same functionality)
    case cards

    /// Returns only one copy of each unique artwork for matching cards.
    case art

    /// Returns all prints for all cards matched (disables rollup)
    case prints
}

public enum SortDirection: String {
    case auto
    case ascending = "asc"
    case descending = "desc"
}

public enum CardSortOrder: String {
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

public enum ImageVersion: String {
    case small
    case normal
    case large
    case png
    case artCrop = "art_crop"
    case borderCrop = "border_crop"
}
