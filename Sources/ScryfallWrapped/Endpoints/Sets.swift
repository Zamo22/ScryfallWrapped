//
//  Created by Zaheer Moola on 2022/06/17.
//

import Foundation

extension Endpoint {
    static var allSets: Self {
        Endpoint(path: Constants.Endpoints.Sets.endpoint)
    }

    static func set(byCode code: String) -> Self {
        Endpoint(path: "\(Constants.Endpoints.Sets.endpoint)/\(code)")
    }

    static func set(byTcgPlayerId id: String) -> Self {
        Endpoint(path: "\(Constants.Endpoints.Sets.tcgPlayerIdEndpoint)/\(id)")
    }

    static func set(byScryfallId id: String) -> Self {
        Endpoint(path: "\(Constants.Endpoints.Sets.endpoint)/\(id)")
    }
}
