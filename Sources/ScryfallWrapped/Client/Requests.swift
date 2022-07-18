//
//  Created by Zaheer Moola on 2022/06/22.
//

import Foundation

// TODO: Create a way to mock these, via injection or something
public struct Sets {
    public typealias setListResult = (Result<ScryfallList<MagicSet>, Error>) -> Void
    public typealias singleSetResult = (Result<MagicSet, Error>) -> Void

    /// Returns all sets to date
    public static func getAllSets(completionHandler: @escaping setListResult) {
        URLSession.shared.endpointRequest(.allSets,
                                          expectedType: ScryfallList<MagicSet>.self,
                                          then: completionHandler)
    }

    /// Returns a single MagicSet by its set code
    public static func getSet(byCode code: String, completionHandler: @escaping singleSetResult) {
        URLSession.shared.endpointRequest(.set(byCode: code),
                                          expectedType: MagicSet.self,
                                          then: completionHandler)
    }

    /// Returns a single MagicSet by its TCGPlayer ID
    public static func getSet(byTcgPlayerId id: String, completionHandler: @escaping singleSetResult) {
        URLSession.shared.endpointRequest(.set(byTcgPlayerId: id),
                                          expectedType: MagicSet.self,
                                          then: completionHandler)
    }

    /// Returns a single MagicSet by its Scryfall ID
    public static func getSet(byScryfallId id: String, completionHandler: @escaping singleSetResult) {
        URLSession.shared.endpointRequest(.set(byScryfallId: id),
                                          expectedType: MagicSet.self,
                                          then: completionHandler)
    }
}

public struct Cards {
    public typealias cardListResult = (Result<ScryfallList<MagicCard>, Error>) -> Void
    public typealias singleCardResult = (Result<MagicCard, Error>) -> Void
    public typealias cardCatalogResult = (Result<ScryfallCatalog, Error>) -> Void

    // TODO: Construct query, not just basic string here
    /// Returns a paginated card list matching a defined search predicate with additonal ordering and filtering options
    public static func searchCard(query: String,
                                  unique: UniqueCardType? = nil,
                                  order: CardSortOrder? = nil,
                                  sortDirection: SortDirection? = nil,
                                  includeExtras: Bool? = nil,
                                  includeMultilingual: Bool? = nil,
                                  includeVariations: Bool? = nil,
                                  page: Int? = nil,
                                  completionHandler: @escaping cardListResult
    ) {
        URLSession.shared.endpointRequest(.cards(searchedBy: query, unique: unique, order: order,
                                                 sortDirection: sortDirection, includeExtras: includeExtras,
                                                 includeMultilingual: includeMultilingual,
                                                 includeVariations: includeVariations, page: page),
                                          expectedType: ScryfallList<MagicCard>.self, then: completionHandler)
    }

    /// Returns a card object exactly matching the name provided
    public static func getCard(namedExactly name: String,
                               setCode code: String? = nil,
                               imageVersion: ImageVersion? = nil,
                               backFaceOfCard showBack: Bool = false,
                               completionHandler: @escaping singleCardResult
    ) {
        URLSession.shared.endpointRequest(.card(namedExactly: name, setCode: code, imageVersion: imageVersion,
                                                backFaceOfCard: showBack),
                                          expectedType: MagicCard.self, then: completionHandler)
    }

    /// Returns a card object when a `fuzzy` name is provided. Only returns a card if there is an unambigious match for the card.
    public static func card(withPartialName name: String,
                            setCode code: String? = nil,
                            imageVersion: ImageVersion? = nil,
                            backFaceOfCard showBack: Bool = false,
                            completionHandler: @escaping singleCardResult) {
        URLSession.shared.endpointRequest(.card(withPartialName: name, setCode: code, imageVersion: imageVersion,
                                                backFaceOfCard: showBack),
                                          expectedType: MagicCard.self, then: completionHandler)
    }

    // TODO: Construct query, not just basic string here
    /// Returns a catalog of card objects that are autocompleted based on a query
    public static func autocompleteCard(for query: String, includeExtras: Bool? = nil,
                                        completionHandler: @escaping cardCatalogResult) {
        URLSession.shared.endpointRequest(.autocompleteCard(for: query, includeExtras: includeExtras),
                                          expectedType: ScryfallCatalog.self, then: completionHandler)
    }

    /// Returns a random card object from the magic database, query parameters can be used to add restrictions
    public static func randomCard(query: String? = nil,
                                  imageVersion: ImageVersion? = nil,
                                  backFaceOfCard showBack: Bool = false,
                                  completionHandler: @escaping singleCardResult) {
        URLSession.shared.endpointRequest(.randomCard(query: query, imageVersion: imageVersion,
                                                      backFaceOfCard: showBack),
                                          expectedType: MagicCard.self, then: completionHandler)
    }
}

public struct Rulings {
    public typealias rulingsListResult = (Result<ScryfallList<MagicRuling>, Error>) -> Void

    /// Returns a List of rulings for a card with the given Multiverse ID. If the card has multiple multiverse IDs, this method can find either of them
    public func rulings(forMultiverseCardId id: String,
                        completionHandler: @escaping rulingsListResult) {
        URLSession.shared.endpointRequest(.rulings(withMultiverseId: id),
                                          expectedType: ScryfallList<MagicRuling>.self,
                                          then: completionHandler)
    }

    /// Returns rulings for a card with the given MTGO ID (also known as the Catalog ID). The ID can either be the card’s mtgo_id or its mtgo_foil_id
    public func rulings(forMagicOnlineId id: String,
                        completionHandler: @escaping rulingsListResult) {
        URLSession.shared.endpointRequest(.rulings(withMtgoId: id),
                                          expectedType: ScryfallList<MagicRuling>.self,
                                          then: completionHandler)
    }

    /// Returns rulings for a card with the given Magic: The Gathering Arena ID
    public func rulings(forArenaId id: String,
                        completionHandler: @escaping rulingsListResult) {
        URLSession.shared.endpointRequest(.rulings(withArenaId: id),
                                          expectedType: ScryfallList<MagicRuling>.self,
                                          then: completionHandler)
    }

    /// Returns a List of rulings for the card with the given set code and collector number
    public func rulings(forCardNumber card: String, andSet set: String,
                        completionHandler: @escaping rulingsListResult) {
        URLSession.shared.endpointRequest(.rulings(forCard: card, withSet: set),
                                          expectedType: ScryfallList<MagicRuling>.self,
                                          then: completionHandler)
    }

    /// Returns a List of rulings for a card with the given Scryfall ID
    public func rulings(forScryfallId id: String,
                        completionHandler: @escaping rulingsListResult) {
        URLSession.shared.endpointRequest(.rulings(withScryfallId: id),
                                          expectedType: ScryfallList<MagicRuling>.self,
                                          then: completionHandler)
    }
}

public struct BulkData {
    public typealias bulkDataListResult = (Result<ScryfallList<BulkDataModel>, Error>) -> Void
    public typealias bulkDataResult = (Result<BulkDataModel, Error>) -> Void

    /// Returns a List of all Bulk Data items on Scryfall
    public func getAllBulkData(completionHandler: @escaping bulkDataListResult) {
        URLSession.shared.endpointRequest(.bulkData, expectedType: ScryfallList<BulkDataModel>.self,
                                          then: completionHandler)
    }

    /// Returns a single Bulk Data object with the given id
    public func getBulkData(byId id: String, completionHandler: @escaping bulkDataResult) {
        URLSession.shared.endpointRequest(.bulkData(byId: id),
                                          expectedType: BulkDataModel.self,
                                          then: completionHandler)
    }

    /// Returns a single Bulk Data object with the given `BulkDataType`
    public func getBulkData(byType type: BulkDataType, completionHandler: @escaping bulkDataResult) {
        URLSession.shared.endpointRequest(.bulkData(byType: type),
                                          expectedType: BulkDataModel.self,
                                          then: completionHandler)
    }
}
