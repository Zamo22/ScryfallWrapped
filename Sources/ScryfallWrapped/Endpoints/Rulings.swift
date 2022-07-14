//
//  Created by Zaheer Moola on 2022/07/01.
//

import Foundation

extension Endpoint {
    private typealias constant = Constants.Endpoints.Rulings

    static func rulings(withMultiverseId id: String
    ) -> Self {
        Endpoint(path: "\(constant.multiversePath)\(id)/\(constant.rulingsConstant)")
    }

    static func rulings(withMtgoId id: String
    ) -> Self {
        Endpoint(path: "\(constant.mtgoPath)\(id)/\(constant.rulingsConstant)")
    }

    static func rulings(withArenaId id: String
    ) -> Self {
        Endpoint(path: "\(constant.arenaPath)\(id)/\(constant.rulingsConstant)")
    }

    static func rulings(forCard code: String, withSet set: String
    ) -> Self {
        Endpoint(path: "\(constant.cardsConstant)/\(set)/\(code)/\(constant.rulingsConstant)")
    }

    static func rulings(withScryfallId id: String
    ) -> Self {
        Endpoint(path: "\(constant.cardsConstant)/\(id)/\(constant.rulingsConstant)")
    }
}
