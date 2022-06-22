//
//  Created by Zaheer Moola on 2022/06/22.
//

import Foundation

public struct Sets {
    public func getAllSets(completionHandler: @escaping (Result<ScryfallList<MagicSet>, Error>) -> Void) {
        URLSession.shared.endpointRequest(.allSets,
                                          expectedType: ScryfallList<MagicSet>.self,
                                          then: completionHandler)
    }
}
