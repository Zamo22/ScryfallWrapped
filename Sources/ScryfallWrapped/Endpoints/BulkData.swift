//
//  Created by Zaheer Moola on 2022/06/17.
//

import Foundation

extension Endpoint {
    /// Retrieve all bulk data objects
    static var bulkData: Self {
        Endpoint(path: Constants.Endpoints.BulkData.endpoint)
    }

    /// Retrieve bulk data object by id
    static func bulkData(byId id: String) -> Self {
        Endpoint(path: "\(Constants.Endpoints.BulkData.endpoint)/\(id)")
    }

    /// Retrieve bulk data by type
    static func bulkData(byType type: BulkDataType) -> Self {
        Endpoint(path: "\(Constants.Endpoints.BulkData.endpoint)/\(type.rawValue)")
    }
}
