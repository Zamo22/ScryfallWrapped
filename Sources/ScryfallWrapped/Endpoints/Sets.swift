//
//  Created by Zaheer Moola on 2022/06/17.
//

import Foundation

public extension Endpoint {
    /// Returns all sets to date
    static var allSets: Self {
        Endpoint(path: Constants.Endpoints.Sets.endpoint)
    }

    /// Returns a single set by its set code
    static func set(byCode code: String) -> Self {
        Endpoint(path: "\(Constants.Endpoints.Sets.endpoint)/\(code)")
    }

    /// Returns a single set by its TCGPlayer ID
    static func set(byTcgPlayerId id: String) -> Self {
        Endpoint(path: "\(Constants.Endpoints.Sets.tcgPlayerIdEndpoint)/\(id)")
    }

    /// Returns a single set by its Scryfall ID
    static func set(byScryfallId id: String) -> Self {
        Endpoint(path: "\(Constants.Endpoints.Sets.endpoint)/\(id)")
    }
}
